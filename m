Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F7A6A8BF5
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWT-0003u3-Cg; Thu, 02 Mar 2023 22:35:37 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXpYF-0005Ru-QN
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9hzZZfqZBmriyiJaRRFgj4vKcu5VdE3XPsN3XWm1Rd4=; b=iSYMdzw9ou8NMD1HPcMFyzy5s0
 diTFd1Lfr6YcI+7S2P/PD9/rt8X7ZZ4aXtAwiDQQU9Czr8pgIG+sHmlxSSqSsRjZdmYUZa0wXhNWe
 PULqRYzYg75JdPSO4vpzSC4bGcyaKSyCCKBW9akOwd+CPv9rMlIVtAq1UqFJrHYTqWcxpV0eREHEe
 FGUh7U7G29xpuctqJE7lWEUkzHR03p77us1n7FYFRDiVCLQ807B3Dcq+amXQtS2jMa+I6JRVK8q2I
 Mivc/SWAWz04eHbs6YV6AXJr3XrqPmQIt2VZDbppPLcVdr6lkhshdKLuUH2DoTAaCmQYi5xdgM/vv
 yBkiKPFg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpXR-003Fx7-Pa; Thu, 02 Mar 2023 20:28:29 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
Date: Thu,  2 Mar 2023 12:28:15 -0800
Message-Id: <20230302202826.776286-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 00/11] sysctl: deprecate register_sysctl_paths()
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
Cc: j.granados@samsung.com, sujiaxun@uniontech.com, tangmeng@uniontech.com,
 apparmor@lists.ubuntu.com, patches@lists.linux.dev, willy@infradead.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-csky@vger.kernel.org, zhangpeng362@huawei.com,
 linux-fsdevel@vger.kernel.org, nixiaoming@huawei.com,
 Luis Chamberlain <mcgrof@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

As we trim down the insane kernel/sysctl.c large array and move
sysctls out we're looking to optimize the way we do syctl registrations
so we deal with just flat entries so to make the registration code
much easier to maintain and so it does not recurse. In dealing with
some of these things it reminded us that we will eventually get to the
point of just passing in the ARRAY_SIZE() we want, to get there we
should strive to move away from the older callers that do need the
recursion. Turns out tons of users don't need the recursion already
so we can start converting those over.

register_sysctl_paths() can do recursion when its users have sysctl
entries with directories and and then subdirectories with other entries.
This *typically* was the use case in the large sysctl array in
kernel/sysctl.c but as we trim that down we're phasing out the users
that have subdirectories. This means that the code path that can do
recursion is being mitigated over time and the code can be simplified
as well.

There are however many existing users of register_sysctl_paths() which
don't need to deal with subdirectories, and register_sysctl() and the
init version register_sysctl_init() (used when you don't care for the
initial return value / need to de-register) can create subdirectories
for you if you have no entries in between. So just convert these
users to the simpler APIs and deprecate out register_sysctl_paths().

The next step after this is to to start deprecating slowly the callers
of register_sysctl_table(). I'll send a out second batch for those that
apply on top of this.

Unless folks have an issue, I can offer to take these in the sysctl-next
tree as we sweep these out, but I'm happy for folks to take these into
their tree as well if they want. The only possible conflict would be
timing, ie, if the final patch which removes the API call. That patch
could also just wait another or two cycles later.

Luis Chamberlain (11):
  proc_sysctl: update docs for __register_sysctl_table()
  proc_sysctl: move helper which creates required subdirectories
  sysctl: clarify register_sysctl_init() base directory order
  apparmor: simplify sysctls with register_sysctl_init()
  loadpin: simplify sysctls use with register_sysctl()
  yama: simplfy sysctls with register_sysctl()
  seccomp: simplify sysctls with register_sysctl_init()
  kernel: pid_namespace: simplify sysctls with register_sysctl()
  fs-verity: simplify sysctls with register_sysctl()
  csky: simplify alignment sysctl registration
  proc_sysctl: deprecate register_sysctl_paths()

 arch/csky/abiv1/alignment.c | 15 +-----
 fs/proc/proc_sysctl.c       | 95 +++++++++++++++++++------------------
 fs/verity/signature.c       |  9 +---
 include/linux/sysctl.h      | 11 -----
 kernel/pid_namespace.c      |  3 +-
 kernel/pid_sysctl.h         |  3 +-
 kernel/seccomp.c            | 15 +-----
 security/apparmor/lsm.c     |  8 +---
 security/loadpin/loadpin.c  |  8 +---
 security/yama/yama_lsm.c    |  8 +---
 10 files changed, 56 insertions(+), 119 deletions(-)

-- 
2.39.1


