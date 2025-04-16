Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9643FA91851
	for <lists+apparmor@lfdr.de>; Thu, 17 Apr 2025 11:50:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1u5Lsw-0001O3-Or; Thu, 17 Apr 2025 09:50:18 +0000
Received: from mail-qv1-f51.google.com ([209.85.219.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <gabriel.totev@zetier.com>)
 id 1u5BU3-0002mp-Ku
 for apparmor@lists.ubuntu.com; Wed, 16 Apr 2025 22:43:55 +0000
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6ecfa716ec1so1936386d6.2
 for <apparmor@lists.ubuntu.com>; Wed, 16 Apr 2025 15:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744843434; x=1745448234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JnEM9XiDhU2AJ9VDyuYs2ejarQSTEt/r5Epz8Sz7V4o=;
 b=th2OwSUc4rIsEEhsEu0AfW8CzqVmmJsdux1A+n3BFra4yN/2Nn8tlznc1bUFsYgDSX
 GXH23wzqe6ot+Z1Tet57V39EgPZLlIfQEkwswKUqg652htEBg9DMryXt/aZSFLpl2CDU
 mYxKYLnynjqjxvWq1LNceYVWcjOlVy4L2kBk4rsfdRkrAlHw37/T7Y+4f8QhKEsGR3qq
 1Ly7sKwgQLhmPRR/4L9376JxMP+9QdorKLPg2asCnTjrI9eld1Tvp59hOGt1ug3z7VkE
 NzgjuUncPnm6DQ+Zvum7G/Hzzb5RunC6tGoBo/O2DmU6Fide1XjZgp4p8htDC2LBGc0e
 aURw==
X-Gm-Message-State: AOJu0YywI8nlRDcxSTYWJYnPqmB721kz5P262wCJFIOU3zEclup1I1zK
 HPy+AWsk/wDP2xovH7d3r6gH1I9sdjen+3rozQTE+CFqRc5FIIMXi3pqmEgO+vk=
X-Gm-Gg: ASbGncvXk6eY6zO5e3OUoTFwhCBfV5pbbA/9C7gXqpOYvNvh36o7IzYr2MKPoxF21UJ
 YzY9RsdnGAuEXZx+N3OEg4A3JRQH5YkSgPAVhdDJqhoFRFlvlyyTBaPv2MTqv/vQjPWGFrDJWwT
 Bg736e2TkR1d4R7FgM7MGbu5aAoYwD60P3/IB53TELP/Ag9/eqT7TnZUnstFeCym0TKiq5MK5Hd
 RxKu1CUuFdwQ4Qk4oGR6yZN5HAo/67SFmN2y43/HQIBfHgvY12bxQR2UUfjGuej1MzvRCyMNy6W
 699FyR2ROICRsg9KupCobPseGDAKW1o9hK+EkQLI6C5e
X-Google-Smtp-Source: AGHT+IEjJczMd16JgpoOiKHr+8HtiftAbq04aqYlza74AGhSL4ac0RjMhPcsyusccIpAzUIxrFmcUg==
X-Received: by 2002:a05:6214:4001:b0:6e6:6103:f708 with SMTP id
 6a1803df08f44-6f2b307f67cmr61339006d6.38.1744843434315; 
 Wed, 16 Apr 2025 15:43:54 -0700 (PDT)
Received: from localhost ([65.222.209.234])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6f0dea081fasm120096326d6.92.2025.04.16.15.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 15:43:54 -0700 (PDT)
From: Gabriel Totev <gabriel.totev@zetier.com>
To: john.johansen@canonical.com
Date: Wed, 16 Apr 2025 18:42:09 -0400
Message-Id: <20250416224209.904863-2-gabriel.totev@zetier.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416224209.904863-1-gabriel.totev@zetier.com>
References: <20250416224209.904863-1-gabriel.totev@zetier.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.219.51;
 envelope-from=gabriel.totev@zetier.com; helo=mail-qv1-f51.google.com
X-Mailman-Approved-At: Thu, 17 Apr 2025 09:50:17 +0000
Subject: [apparmor] [PATCH 2/2] apparmor: shift uid when mediating af_unix
	in userns
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

Avoid unshifted ouids for socket file operations as observed when using
AppArmor profiles in unprivileged containers with LXD or Incus.

For example, root inside container and uid 1000000 outside, with
`owner /root/sock rw,` profile entry for nc:

/root$ nc -lkU sock & nc -U sock
==> dmesg
apparmor="DENIED" operation="connect" class="file"
namespace="root//lxd-podia_<var-snap-lxd-common-lxd>" profile="sockit"
name="/root/sock" pid=3924 comm="nc" requested_mask="wr" denied_mask="wr"
fsuid=1000000 ouid=0 [<== should be 1000000]

Fix by performing uid mapping as per common_perm_cond() in lsm.c

Signed-off-by: Gabriel Totev <gabriel.totev@zetier.com>
---
The example above was taken from an Ubuntu Noble 6.8.0 kernel, which has
a different af_unix.c file, which nevertheless contains an identical
section that I patched identically and verified the connect operation
saw the correctly shifted ouid.

I was not able to verify this fix on the mainline kernel as it does not
appear to mediate af_unix (due to dcd7a559411e "gate... behind v9 abi"?)
and I don't know how to make it do so.

I am also not sure how this change should be propagated to the Ubuntu
kernel and its differing af_unix.c

First time patch mailer so please excuse my ignorance or blunders.

 security/apparmor/af_unix.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index ed4b34b88e38..a1c2b8516681 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -12,6 +12,7 @@
  * License.
  */
 
+#include <linux/fs.h>
 #include <net/tcp_states.h>
 
 #include "include/audit.h"
@@ -45,8 +46,11 @@ static int unix_fs_perm(const char *op, u32 mask, const struct cred *subj_cred,
 	 */
 	if (u->path.dentry) {
 		/* the sunpath may not be valid for this ns so use the path */
-		struct path_cond cond = { u->path.dentry->d_inode->i_uid,
-					  u->path.dentry->d_inode->i_mode
+		struct inode *inode = u->path.dentry->d_inode;
+		vfsuid_t vfsuid = i_uid_into_vfsuid(mnt_idmap(u->path.mnt), inode);
+		struct path_cond cond = {
+			.uid = vfsuid_into_kuid(vfsuid),
+			.mode = inode->i_mode,
 		};
 
 		return aa_path_perm(op, subj_cred, label, &u->path,
-- 
2.34.1


