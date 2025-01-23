Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 252B4A1AA6A
	for <lists+apparmor@lfdr.de>; Thu, 23 Jan 2025 20:39:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tb32Z-00033f-GX; Thu, 23 Jan 2025 19:38:59 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tb32X-00033X-UG
 for apparmor@lists.ubuntu.com; Thu, 23 Jan 2025 19:38:57 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BBF923FB57
 for <apparmor@lists.ubuntu.com>; Thu, 23 Jan 2025 19:38:57 +0000 (UTC)
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aa634496f58so112371166b.2
 for <apparmor@lists.ubuntu.com>; Thu, 23 Jan 2025 11:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737661137; x=1738265937;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=51X2GS/dcQYEI62aDDDMEJIxscoSLt4vYeru+4Yw1b0=;
 b=rt32SUwPXrsr71cNmlQbWy4HwlDWACVG8SfB1ccvn9ZJ6srCkhwgPApRwCR357oupA
 YZtBhEaJ96v38ziHEsV2m6tN0JGolY9A34FHJwhyBocjqDpKxc0+l5H0wJcnjbtEeoyE
 cDnmyoy8sWc14cYPhSKTRMzu1usvSNt7AtjBxrAtYzGuzA4K6EzH3v0eRYui7+azPF9I
 5DZp0B0rikGy6uyh13YMwqUM4Y2YgL+HpaTycxsiAMpJdeBuouuy1WD2eniqrfExGxE9
 2nYjMO2THhD1jigzBZPh3/KJBX3ja5Iy0ywu5kPrjZJb2XQskeVUPKbKeSK/13mGgRvW
 iolQ==
X-Gm-Message-State: AOJu0YybUYdb4k+dwgX0t8ZW3RGymDMIQ9nKsOW74eBWKmXUB9/+mlj5
 /3Usbq1lTXm/DPcCrDvMD+vlqV6NQXkRhjXab8qFTa/2uUnuZmODytkcdQE+R1323DbdnmwPevB
 N7im6vaVSF2j+DY5l7CkCY6OPzlBRYdq1BTL8jxx3t72+N8BjXXe0oZLAS7faGkbbMzfnnUuFf2
 5AHNJe5a2nDqiq0+7Qzp68NaRsENIXfzZ826+7hHCxbfZhJLFNS7/p96v2
X-Gm-Gg: ASbGncuF+aN7ai2rqsEwrFmpcajO9ZqE49LZwfXjRkqd88aYMPBL3RWaJonsbQ2I36Z
 2UEKfuLt7rKjnJSpHt3tw4r9Qys9BT8d19Rd8PKJvxW12qQ29lA==
X-Received: by 2002:a17:907:9307:b0:ab2:d2e7:abc7 with SMTP id
 a640c23a62f3a-ab38b203dfamr2259427166b.19.1737661137189; 
 Thu, 23 Jan 2025 11:38:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERlYajPEGONl+Gvy+GNBn4poaWud9yfq2WPA1LFs2UmZL8j/DphSQ+VJnfIxmaLR/9+Qs3n7ATVcd5zgv9bzg=
X-Received: by 2002:a17:907:9307:b0:ab2:d2e7:abc7 with SMTP id
 a640c23a62f3a-ab38b203dfamr2259425166b.19.1737661136713; Thu, 23 Jan 2025
 11:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20250123192058.2558-1-tanyaagarwal25699@gmail.com>
In-Reply-To: <20250123192058.2558-1-tanyaagarwal25699@gmail.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Thu, 23 Jan 2025 11:38:45 -0800
X-Gm-Features: AWEUYZmOBXroAgnRSKsNEjDxcxfh5qCWpdmlOyCF_Vyr3L-rWPnJHXXHyo-fcXg
Message-ID: <CAKCV-6u9=16WfS3emkGuErY=AETf05p6EbP5w8KO5V+SxaW1eg@mail.gmail.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [apparmor] Fwd: [PATCH] apparmor: fix typos and spelling errors
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

---------- Forwarded message ---------
From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Date: Thu, Jan 23, 2025 at 11:30=E2=80=AFAM
Subject: [PATCH] apparmor: fix typos and spelling errors
To: <john.johansen@canonical.com>, <paul@paul-moore.com>,
<jmorris@namei.org>, <serge@hallyn.com>
Cc: <linux-security-module@vger.kernel.org>,
<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
<anupnewsmail@gmail.com>, Tanya Agarwal <tanyaagarwal25699@gmail.com>,
Mimi Zohar <zohar@linux.ibm.com>


From: Tanya Agarwal <tanyaagarwal25699@gmail.com>

Fix typos and spelling errors in apparmor module comments that were
identified using the codespell tool.
No functional changes - documentation only.

Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
---
This patch set is split into individual patches for each LSM
to facilitate easier review by respective maintainers.

Original discussion:
https://lore.kernel.org/all/20250112072925.1774-1-tanyaagarwal25699@gmail.c=
om

 security/apparmor/apparmorfs.c | 6 +++---
 security/apparmor/domain.c     | 4 ++--
 security/apparmor/label.c      | 2 +-
 security/apparmor/lsm.c        | 2 +-
 security/apparmor/policy.c     | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.=
c
index 2c0185ebc900..0c2f248d31bf 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -43,7 +43,7 @@
  * The interface is split into two main components based on their function
  * a securityfs component:
  *   used for static files that are always available, and which allows
- *   userspace to specificy the location of the security filesystem.
+ *   userspace to specify the location of the security filesystem.
  *
  *   fns and data are prefixed with
  *      aa_sfs_
@@ -204,7 +204,7 @@ static struct file_system_type aafs_ops =3D {
 /**
  * __aafs_setup_d_inode - basic inode setup for apparmorfs
  * @dir: parent directory for the dentry
- * @dentry: dentry we are seting the inode up for
+ * @dentry: dentry we are setting the inode up for
  * @mode: permissions the file should have
  * @data: data to store on inode.i_private, available in open()
  * @link: if symlink, symlink target string
@@ -2244,7 +2244,7 @@ static void *p_next(struct seq_file *f, void *p,
loff_t *pos)
 /**
  * p_stop - stop depth first traversal
  * @f: seq_file we are filling
- * @p: the last profile writen
+ * @p: the last profile written
  *
  * Release all locking done by p_start/p_next on namespace tree
  */
diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 5939bd9a9b9b..d959931eac28 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -755,7 +755,7 @@ static int profile_onexec(const struct cred *subj_cred,
                /* change_profile on exec already granted */
                /*
                 * NOTE: Domain transitions from unconfined are allowed
-                * even when no_new_privs is set because this aways results
+                * even when no_new_privs is set because this always result=
s
                 * in a further reduction of permissions.
                 */
                return 0;
@@ -926,7 +926,7 @@ int apparmor_bprm_creds_for_exec(struct linux_binprm *b=
prm)
         *
         * NOTE: Domain transitions from unconfined and to stacked
         * subsets are allowed even when no_new_privs is set because this
-        * aways results in a further reduction of permissions.
+        * always results in a further reduction of permissions.
         */
        if ((bprm->unsafe & LSM_UNSAFE_NO_NEW_PRIVS) &&
            !unconfined(label) &&
diff --git a/security/apparmor/label.c b/security/apparmor/label.c
index 91483ecacc16..8bcff51becb8 100644
--- a/security/apparmor/label.c
+++ b/security/apparmor/label.c
@@ -1456,7 +1456,7 @@ bool aa_update_label_name(struct aa_ns *ns,
struct aa_label *label, gfp_t gfp)

 /*
  * cached label name is present and visible
- * @label->hname only exists if label is namespace hierachical
+ * @label->hname only exists if label is namespace hierarchical
  */
 static inline bool use_label_hname(struct aa_ns *ns, struct aa_label *labe=
l,
                                   int flags)
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 1edc12862a7d..04bf5d2f6e00 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -2006,7 +2006,7 @@ static int __init alloc_buffers(void)
         * two should be enough, with more CPUs it is possible that more
         * buffers will be used simultaneously. The preallocated pool may g=
row.
         * This preallocation has also the side-effect that AppArmor will b=
e
-        * disabled early at boot if aa_g_path_max is extremly high.
+        * disabled early at boot if aa_g_path_max is extremely high.
         */
        if (num_online_cpus() > 1)
                num =3D 4 + RESERVE_COUNT;
diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index d0244fab0653..5cec3efc4794 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -463,7 +463,7 @@ static struct aa_policy *__lookup_parent(struct aa_ns *=
ns,
 }

 /**
- * __create_missing_ancestors - create place holders for missing ancestore=
s
+ * __create_missing_ancestors - create place holders for missing ancestors
  * @ns: namespace to lookup profile in (NOT NULL)
  * @hname: hierarchical profile name to find parent of (NOT NULL)
  * @gfp: type of allocation.
@@ -1068,7 +1068,7 @@ ssize_t aa_replace_profiles(struct aa_ns
*policy_ns, struct aa_label *label,
                goto out;

        /* ensure that profiles are all for the same ns
-        * TODO: update locking to remove this constaint. All profiles in
+        * TODO: update locking to remove this constraint. All profiles in
         *       the load set must succeed as a set or the load will
         *       fail. Sort ent list and take ns locks in hierarchy order
         */
--
2.39.5

