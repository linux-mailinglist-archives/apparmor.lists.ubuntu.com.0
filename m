Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D2BAAC80D
	for <lists+apparmor@lfdr.de>; Tue,  6 May 2025 16:34:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCJMn-0006iQ-U5; Tue, 06 May 2025 14:33:53 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1uCJMl-0006iD-2W
 for apparmor@lists.ubuntu.com; Tue, 06 May 2025 14:33:51 +0000
Received: from sec2-plucky-amd64..
 (lau06-h06-176-136-128-80.dsl.sta.abo.bbox.fr [176.136.128.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 0A1493F942; 
 Tue,  6 May 2025 14:33:50 +0000 (UTC)
From: =?UTF-8?q?Maxime=20B=C3=A9lair?= <maxime.belair@canonical.com>
To: linux-security-module@vger.kernel.org
Date: Tue,  6 May 2025 16:32:27 +0200
Message-ID: <20250506143254.718647-1-maxime.belair@canonical.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 0/3] lsm: introduce lsm_manage_policy() syscall
X-BeenThere: apparmor@lists.ubuntu.com
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: AppArmor discussion <apparmor.lists.ubuntu.com>
List-Unsubscribe: <https://lists.ubuntu.com/mailman/options/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=unsubscribe>
List-Archive: <https://lists.ubuntu.com/archives/apparmor>
List-Post: <mailto:apparmor@lists.ubuntu.com>
List-Help: <mailto:apparmor-request@lists.ubuntu.com?subject=help>
List-Subscribe: <https://lists.ubuntu.com/mailman/listinfo/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=subscribe>
Cc: paul@paul-moore.com, kees@kernel.org, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, penguin-kernel@I-love.SAKURA.ne.jp,
 apparmor@lists.ubuntu.com, jmorris@namei.org, linux-kernel@vger.kernel.org,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This patchset introduces a new syscall, lsm_manage_policy(), and the
associated Linux Security Module hook security_lsm_manage_policy(),
providing a unified interface for loading and managing LSM policies.
This syscall complements the existing per‑LSM pseudo‑filesystem mechanism
and works even when those filesystems are not mounted or available.

With this new syscall, administrators may lock down access to the
pseudo‑filesystem yet still manage LSM policies. A single, tightly scoped
entry point then replaces the many file operations exposed by those
filesystems, significantly reducing the attack surface. This is
particularly useful in containers or processes already confined by
Landlock, where these pseudo‑filesystems are typically unavailable.

Because it provides a logical and unified interface, lsm_manage_policy()
is simpler to use than several heterogeneous pseudo‑filesystems and
avoids edge cases such as partially loaded policies. It also eliminates
VFS overhead, yielding performance gains notably when many policies are
loaded, for instance at boot time.

This initial implementation is intentionally minimal to limit the scope
of changes. Currently, only policy loading is supported, and only
AppArmor registers this LSM hook. However, any LSM can adopt this
interface, and future patches could extend this syscall to support more
operations, such as replacing, removing, or querying loaded policies.

Landlock already provides three Landlock‑specific syscalls (e.g.
landlock_add_rule()) to restrict ambient rights for sets of processes
without touching any pseudo-filesystem. lsm_manage_policy() generalizes
that approach to the entire LSM layer, so any module can expose its
policy operations through one uniform interface and reap the advantages
outlined above.

This patchset is available at [1] and a minimal user space example
showing how to use this syscall with AppArmor is at [2].

[1] https://github.com/emixam16/linux/tree/lsm_syscall
[2] https://gitlab.com/emixam16/apparmor/tree/lsm_syscall

Maxime Bélair (3):
  Wire up the lsm_manage_policy syscall
  lsm: introduce security_lsm_manage_policy hook
  AppArmor: add support for lsm_manage_policy

 arch/alpha/kernel/syscalls/syscall.tbl        |  1 +
 arch/arm/tools/syscall.tbl                    |  1 +
 arch/x86/entry/syscalls/syscall_32.tbl        |  1 +
 arch/x86/entry/syscalls/syscall_64.tbl        |  1 +
 include/linux/lsm_hook_defs.h                 |  2 ++
 include/linux/security.h                      |  7 +++++++
 include/linux/syscalls.h                      |  4 ++++
 include/uapi/asm-generic/unistd.h             |  4 +++-
 include/uapi/linux/lsm.h                      |  8 +++++++
 kernel/sys_ni.c                               |  1 +
 security/apparmor/apparmorfs.c                | 19 +++++++++++++++++
 security/apparmor/include/apparmorfs.h        |  3 +++
 security/apparmor/lsm.c                       | 16 ++++++++++++++
 security/lsm_syscalls.c                       | 11 ++++++++++
 security/security.c                           | 21 +++++++++++++++++++
 tools/include/uapi/asm-generic/unistd.h       |  4 +++-
 .../arch/x86/entry/syscalls/syscall_64.tbl    |  1 +
 17 files changed, 103 insertions(+), 2 deletions(-)


base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
-- 
2.48.1


