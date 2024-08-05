Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 632CE947AA3
	for <lists+apparmor@lfdr.de>; Mon,  5 Aug 2024 13:54:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sawIU-0006ZP-0X; Mon, 05 Aug 2024 11:54:42 +0000
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1sawIR-0006Yx-Mq
 for apparmor@lists.ubuntu.com; Mon, 05 Aug 2024 11:54:39 +0000
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5a28b61b880so11866a12.1
 for <apparmor@lists.ubuntu.com>; Mon, 05 Aug 2024 04:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722858879; x=1723463679;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KkOFFi3fndDmXAZbQGGoKZ5kT7GLEe3o2kwoNptV+Do=;
 b=tQIq8DhucVEQi/6nkwf5Hpn+xkSw3gQfg58e6ps7qLieeyk5QxXq1ZoMQ/rMGsFmzK
 ycLHOYIA+agcQykRULJ4hsvUM38sWobQ78B+IZygm/pnvE4/QvDbqmbOlfV33GNO8Lc0
 b2+ZW/VW9DBcIc85ZNbhJ6Dt/pJFJK1dllUkjN8pICOU9FF0mzv/ktTtQMpSMWfCdyrv
 D7EenF44v3O2z+7IkCTgy1YKNgjY4OAIOiFkzuzzS7HS3MyAbcbHArntWoLZ2DxdArMo
 bngNkzJXQVRWKsERC1e70cerfo6a6DpKWcwM/tgUS2TLh6wlYoDk+FDqGCaa2BFNNm2M
 SNJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDKSVKX/iVC9BT1gJiUw/2dIifb65p/MiMyPR2N3Y3/FdVE3/SS7SG1OgzdqHnI1jQDhSMJtneixi0ZB+KsjdRG5iSkqDymAuh
X-Gm-Message-State: AOJu0YyluRU8eQgt6ojVi0cl+QkNEIcIQkoQ8u5kCjKOLplWbGWRnZhA
 U30Rl0zrVVt4UHpScbfOoXe0Qi6dBUAg0t53XjzVVO3Ac/U0DG6eDRNt3kmCzh5BzxNop8Woe/C
 7DnJ0
X-Google-Smtp-Source: AGHT+IFTCqm8BraRgc7Arigoqd1xWwnDt8TRL+WMTE5E5SwinOm4fQ9FXs3JPpX3++/idLohQVMSeg==
X-Received: by 2002:a05:6402:520d:b0:5b8:ccae:a8b8 with SMTP id
 4fb4d7f45d1cf-5b9ca81f252mr255490a12.3.1722858878268; 
 Mon, 05 Aug 2024 04:54:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:ca74:8a49:a6f6:b872])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbd02a451sm9692149f8f.63.2024.08.05.04.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 04:54:37 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Mon, 05 Aug 2024 13:54:22 +0200
Message-Id: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+9sGYC/4WNQQqDMBBFryKz7hQTRWpXvYe4iOZHA9WUiYQW8
 e5NvUCX78F/f6cI8Yh0L3YSJB99WDPoS0HjbNYJ7G1m0qWuy1upWbCEBB4Fljcxa3QQrtvKVEP
 TNtZoytOXwPn3me36zLOPW5DP+ZLUz/4JJsWKh8rBKThtLB5TCNMT1zEs1B/H8QUqzJ30uQAAA
 A==
To: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 John Johansen <john.johansen@canonical.com>, 
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Casey Schaufler <casey@schaufler-ca.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722858874; l=1982;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=xCLopviYo2ZXTYyWMOwauyIB+j+mPVPtuS1184F3o4k=;
 b=X1YK2VuUQ+t/xY7wS6QgxaW1YAPtVGWEsoyQYHdus9WOgQNDyKe+ws3PN8RwStB6L04tlxDBd
 8FXsPZmZOHkCS7IJdSgQL8iclT3gCaPM5MZVPBlypka153iZM8VQVCl
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=
Received-SPF: pass client-ip=209.85.208.42; envelope-from=jannh@google.com;
 helo=mail-ed1-f42.google.com
Subject: [apparmor] [PATCH v2 0/2] get rid of cred_transfer
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
Cc: Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is the approach I proposed at
<https://lore.kernel.org/all/CAG48ez2bnvuX8i-D=5DxmfzEOKTWAf-DkgQq6aNC4WzSGoEGHg@mail.gmail.com/>
to get rid of the cred_transfer stuff.

What do you think? Synchronously waiting for task work is a bit ugly,
but at least this condenses the uglyness in the keys subsystem instead
of making the rest of the security subsystem deal with this stuff.

Another approach to simplify things further would be to try to move
the session keyring out of the creds entirely and just let the child
update it directly with appropriate locking, but I don't know enough
about the keys subsystem to know if that would maybe break stuff
that relies on override_creds() also overriding the keyrings, or
something like that.

Signed-off-by: Jann Horn <jannh@google.com>
---
Changes in v2:
- use interruptible wait instead of killable
- split into two patches (Jarkko)
- Link to v1: https://lore.kernel.org/r/20240802-remove-cred-transfer-v1-1-b3fef1ef2ade@google.com

---
Jann Horn (2):
      KEYS: use synchronous task work for changing parent credentials
      security: remove unused cred_alloc_blank/cred_transfer helpers

 include/linux/cred.h          |   1 -
 include/linux/lsm_hook_defs.h |   3 --
 include/linux/security.h      |  12 -----
 kernel/cred.c                 |  23 ---------
 security/apparmor/lsm.c       |  19 --------
 security/keys/internal.h      |   8 ++++
 security/keys/keyctl.c        | 107 +++++++++++++-----------------------------
 security/keys/process_keys.c  |  86 +++++++++++++++++----------------
 security/landlock/cred.c      |  11 +----
 security/security.c           |  35 --------------
 security/selinux/hooks.c      |  12 -----
 security/smack/smack_lsm.c    |  32 -------------
 12 files changed, 89 insertions(+), 260 deletions(-)
---
base-commit: c0ecd6388360d930440cc5554026818895199923
change-id: 20240802-remove-cred-transfer-493a3b696da2
-- 
Jann Horn <jannh@google.com>


