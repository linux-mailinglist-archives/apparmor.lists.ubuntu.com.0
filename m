Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B84FA91852
	for <lists+apparmor@lfdr.de>; Thu, 17 Apr 2025 11:50:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1u5Lsw-0001Nw-LL; Thu, 17 Apr 2025 09:50:18 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <gabriel.totev@zetier.com>)
 id 1u5BTW-0002Cs-8J
 for apparmor@lists.ubuntu.com; Wed, 16 Apr 2025 22:43:22 +0000
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7c5e39d1e0eso12044485a.1
 for <apparmor@lists.ubuntu.com>; Wed, 16 Apr 2025 15:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744843401; x=1745448201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GXvF8jWqTAPbBfMGadL9eK3fbSPQW8EywO5ebfJwrW8=;
 b=ox2kOy7xJhar3wlgXmR562PABLNbddfQ93BXBS80KPd9Bxxetep7oNrx8zABqrzVij
 JoZ/BAvcXz2zOTLpqn75sI6OThLJH/e5p3CwnzPQPZqoLmPFiMiie9GfyXxReWm4jdSB
 uldPWYIBeG0kcHWa27e/TTrWCo3KourTKCUrUIODE0Y6+PfMLVrIdJl5AtmV1IvL4bZ3
 wRtWJRpzYpYXL6BEMm6JoF6eWRLz0rY7Pj1B9OJ01GZH2fpsIq1Al/RcPaqNLhLAy2Wx
 qaILLmJ35M+lB2N85J3a1pmDqGIs1i2866ym3uY94YK2Kg3m+FwVgVE94nJIRxvbMhpy
 wpXA==
X-Gm-Message-State: AOJu0Yyq/ljbwgMzCQ4vcEoWcl1CRavqdm7M6sl5w+8sdRswm5wPi6qh
 loRarKCDFbpY3B8P4SSkqPrGigso2BoIO4wuVqy9Ara1Cs8xHNDLXYTBpZVEaM4=
X-Gm-Gg: ASbGncuqK//z4g9EuVrGbFvoOcGZkoJWYWziL0Y6GQDq/puRubJ7yM4LgUaTrV+Vy/J
 Uc2hIr9XaZ7gGgDEsQBaZ/vksh++Mfi/yv/hhuSZfBvexoRpg1SghliPso3MTgGb3zbH/yg+V7R
 tJKAHHV1OCwjkMrLDkiHqQ6qOB80ulO5fdg74DGZRWcGhOBi1nlhPgHI/euNn8ULBS0YJLvx7fr
 A8ALjcrFaloLSJ4OHmwdOYuZI9Da6ZKVnjW+81+uzu/o220kwMRNdKBypGvd5m+MSlTO0JE/17W
 Wiqql9GJdjIjZ6JtRNAzkLD6Bid+IRuDKMs0O22Um7Si
X-Google-Smtp-Source: AGHT+IFqNxWvCYrCjO50YwOE/Qxpql7PF4d30nYG3yq6QaaGjlXcY1rR42qyuzXMLZDkOOjL8aecmg==
X-Received: by 2002:a05:620a:24c8:b0:7c7:bb3f:fd40 with SMTP id
 af79cd13be357-7c918fceacbmr548508185a.5.1744843400859; 
 Wed, 16 Apr 2025 15:43:20 -0700 (PDT)
Received: from localhost ([65.222.209.234])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c7a8951646sm1103716285a.34.2025.04.16.15.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 15:43:20 -0700 (PDT)
From: Gabriel Totev <gabriel.totev@zetier.com>
To: john.johansen@canonical.com
Date: Wed, 16 Apr 2025 18:42:08 -0400
Message-Id: <20250416224209.904863-1-gabriel.totev@zetier.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.222.170;
 envelope-from=gabriel.totev@zetier.com; helo=mail-qk1-f170.google.com
X-Mailman-Approved-At: Thu, 17 Apr 2025 09:50:17 +0000
Subject: [apparmor] [PATCH 1/2] apparmor: shift ouid when mediating hard
	links in userns
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

When using AppArmor profiles inside an unprivileged container,
the link operation observes an unshifted ouid.
(tested with LXD and Incus)

For example, root inside container and uid 1000000 outside, with
`owner /root/link l,` profile entry for ln:

/root$ touch chain && ln chain link
==> dmesg
apparmor="DENIED" operation="link" class="file"
namespace="root//lxd-feet_<var-snap-lxd-common-lxd>" profile="linkit"
name="/root/link" pid=1655 comm="ln" requested_mask="l" denied_mask="l"
fsuid=1000000 ouid=0 [<== should be 1000000] target="/root/chain"

Fix by mapping inode uid of old_dentry in aa_path_link() rather than
using it directly, similarly to how it's mapped in __file_path_perm()
later in the file.

Signed-off-by: Gabriel Totev <gabriel.totev@zetier.com>
---
 security/apparmor/file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 5c984792cbf0..ecd36199337c 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -430,9 +430,11 @@ int aa_path_link(const struct cred *subj_cred,
 {
 	struct path link = { .mnt = new_dir->mnt, .dentry = new_dentry };
 	struct path target = { .mnt = new_dir->mnt, .dentry = old_dentry };
+	struct inode *inode = d_backing_inode(old_dentry);
+	vfsuid_t vfsuid = i_uid_into_vfsuid(mnt_idmap(target.mnt), inode);
 	struct path_cond cond = {
-		d_backing_inode(old_dentry)->i_uid,
-		d_backing_inode(old_dentry)->i_mode
+		.uid = vfsuid_into_kuid(vfsuid),
+		.mode = inode->i_mode,
 	};
 	char *buffer = NULL, *buffer2 = NULL;
 	struct aa_profile *profile;
-- 
2.34.1


