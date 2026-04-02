Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOyCDfZU1Wkf4wcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Apr 2026 21:03:18 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F306F3B3250
	for <lists+apparmor@lfdr.de>; Tue, 07 Apr 2026 21:03:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wABFC-0003yw-PD; Tue, 07 Apr 2026 18:33:46 +0000
Received: from mail-pg1-f225.google.com ([209.85.215.225])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <keerthana.kalyanasundaram@broadcom.com>)
 id 1w8B0e-0002vl-6q
 for apparmor@lists.ubuntu.com; Thu, 02 Apr 2026 05:54:28 +0000
Received: by mail-pg1-f225.google.com with SMTP id
 41be03b00d2f7-c76bb670cbfso32767a12.3
 for <apparmor@lists.ubuntu.com>; Wed, 01 Apr 2026 22:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775109266; x=1775714066;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=un0TrhH26CUN0UWgks1V0cLvA+RLLEZ2+uAxYkzc7Bs=;
 b=FSXMbOg3HhHXtzFLyKSuhojx+1IEjHRWynLe8DKVW+jkDNhNX6pSLUOQIcon4/V6jN
 AVKvUJ9RzafmHYToO0spMTCBnBV2HO9ZL8hrbFi678+wGfPR9JbhAlICs4WZiy9unb1G
 O8F/Y1qMQ+grJw8wr3XCMx2m9NQokEcaD3J/OmpqUUQMaBBcB7EfWRXUHB+M7QXYIJdo
 a6cRL6RI1gScLHGSqRJ33h2Wf+7n78jBRzj3rXyJnW/RO7qSRZva8XWlcbUDr/fHNMFv
 ETV2759oNPYQn5ODRFc/xApjOLHzoYq7Fc/JNYw5AFn2tHAJS1Wq+YR/iGa9wgkdKXNX
 WQDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgjuEptrsB/spgi0Uv80wydnmbZ4mXzvFWl0mCn/m77Dkjw4rHH0AVxqJVurVteXTLdToh+1beVw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxTpmKjb6+iZKFmyWk3ZxdNkzLeczdvvH/6XNiL8LiSI/bTs1/L
 jvBNPesqaD3O2MhSa3P8EmhWBVv0teYJT0+XRKNawDXhlt8kmz2dcNqzxYkOgBSpDFKpVcy/7jC
 HpGIBMgHVh904eGVBw++Cb95SZy+MT2nb3XFuF23A25YExeTHecbh8O1uYhFqm9gghESnrL+eoC
 A6L+ejm7RdFe3iltEFyUu8VX2zcNXLxAe6gRSmdnn2maXa/68MHBVMPX1OHWo3c0x+JHf5j35NG
 A/v+KzFLNvWClVuXeXdQIgXkGodfOQrXa8=
X-Gm-Gg: ATEYQzwOW7miWdUHo868701oybwWLlsaRMflYXvRaVl5x2lvUTCWolTL50Zjm3iz1gJ
 6hStXSoToF+47A06+mZ5kYMebxnPrnRX6L5s0GWGTBLNT5Ys4GhVmbbGr9Fzluk1fIkTeDShPC1
 /yVDAwvHaauio2GFoRshrhNYjulO0ahrcVJDtMxFIqk1ePwLSeNl/oy8RE4+giDYepv+MjaMIgs
 wxbP6zG6kDclOI94tD4j7dHAeXvAWKz9j0qrlgGfAR0e6iV6FhWjg4xmAdTdk6i4SpdApjx3i7m
 THtdX5WHQafhw24LyQrdasTWEmIAdtw9qvJToOdxC9GiUi1wk2SoEPFJsmpg1nUPkod4wg4BCVP
 oVTRdhW+1bWPq+5vskgK3XKEI8p2mBG5onazDwvHYC5Fuv/9VkMETQVvqKU6oD9W0M2xL9rx4bT
 1fm5XeUiR9VWoPkkokozOgmdKuGVsKqb1uMOHksWt2Hz/sGClJgdbbmKAvfWfwDWa11gp2XBbl2
 xlr
X-Received: by 2002:a05:6a00:4f95:b0:82c:7767:5b7b with SMTP id
 d2e1a72fcca58-82ce8c8347fmr4540219b3a.7.1775109265834; 
 Wed, 01 Apr 2026 22:54:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
 by smtp-relay.gmail.com with ESMTPS id
 d2e1a72fcca58-82cf9a09160sm203893b3a.0.2026.04.01.22.54.25
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Apr 2026 22:54:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-128b8fa9e7cso85431c88.2
 for <apparmor@lists.ubuntu.com>; Wed, 01 Apr 2026 22:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1775109264; x=1775714064; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=un0TrhH26CUN0UWgks1V0cLvA+RLLEZ2+uAxYkzc7Bs=;
 b=SXIOiRGOqw8OH359iL3y+oVv5ilKaF3vtsWYl0OsYV9DAMfmQv4i3P8E7B2vWVFEj7
 O+2mQ9ERdT5ADOB74jYqWnMVPHmbnnAq4QB5W3xQOc84YcXrkKBj7O9JgmiTt1s323Fj
 cymCoJv1Xjinmy8t8FW8X81eTInajg0gbUk3A=
X-Forwarded-Encrypted: i=1;
 AJvYcCXokPe+/ZoCbDZVNvBjvR9uSoV7ClSufl2qsjGkuXoc+rx8sHGlHHdhTnQTcAHrHEt/YAT2PkmokQ==@lists.ubuntu.com
X-Received: by 2002:a05:7300:d50c:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2c9326ad3c3mr1519626eec.6.1775109263567; 
 Wed, 01 Apr 2026 22:54:23 -0700 (PDT)
X-Received: by 2002:a05:7300:d50c:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2c9326ad3c3mr1519610eec.6.1775109262899; 
 Wed, 01 Apr 2026 22:54:22 -0700 (PDT)
Received: from keerthanak-ph5-dev.. ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ca7cf126c9sm1634662eec.27.2026.04.01.22.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 22:54:22 -0700 (PDT)
From: Keerthana K <keerthana.kalyanasundaram@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Date: Thu,  2 Apr 2026 05:47:31 +0000
Message-ID: <20260402054731.2798726-1-keerthana.kalyanasundaram@broadcom.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Received-SPF: pass client-ip=209.85.215.225;
 envelope-from=keerthana.kalyanasundaram@broadcom.com;
 helo=mail-pg1-f225.google.com
X-Mailman-Approved-At: Tue, 07 Apr 2026 18:33:45 +0000
Subject: [apparmor] [PATCH v5.10-v5.15] apparmor: fix unprivileged local
	user can do privileged policy management
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
Cc: sashal@kernel.org, ajay.kaher@broadcom.com, paul@paul-moore.com,
 Salvatore Bonaccorso <carnil@debian.org>,
 Qualys Security Advisory <qsa@qualys.com>, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, jmorris@namei.org,
 Keerthana K <keerthana.kalyanasundaram@broadcom.com>,
 linux-security-module@vger.kernel.org,
 vamsi-krishna.brahmajosyula@broadcom.com, alexey.makhalov@broadcom.com,
 tapas.kundu@broadcom.com, yin.ding@broadcom.com, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[broadcom.com : SPF not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[broadcom.com:s=google];
	DATE_IN_PAST(1.00)[133];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:sashal@kernel.org,m:ajay.kaher@broadcom.com,m:paul@paul-moore.com,m:carnil@debian.org,m:qsa@qualys.com,m:linux-kernel@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:keerthana.kalyanasundaram@broadcom.com,m:linux-security-module@vger.kernel.org,m:vamsi-krishna.brahmajosyula@broadcom.com,m:alexey.makhalov@broadcom.com,m:tapas.kundu@broadcom.com,m:yin.ding@broadcom.com,m:serge@hallyn.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[keerthana.kalyanasundaram@broadcom.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[keerthana.kalyanasundaram@broadcom.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[broadcom.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.666];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,broadcom.com:email,broadcom.com:mid,linuxfoundation.org:email,qualys.com:email];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: F306F3B3250
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: John Johansen <john.johansen@canonical.com>

commit 6601e13e82841879406bf9f369032656f441a425 upstream.

An unprivileged local user can load, replace, and remove profiles by
opening the apparmorfs interfaces, via a confused deputy attack, by
passing the opened fd to a privileged process, and getting the
privileged process to write to the interface.

This does require a privileged target that can be manipulated to do
the write for the unprivileged process, but once such access is
achieved full policy management is possible and all the possible
implications that implies: removing confinement, DoS of system or
target applications by denying all execution, by-passing the
unprivileged user namespace restriction, to exploiting kernel bugs for
a local privilege escalation.

The policy management interface can not have its permissions simply
changed from 0666 to 0600 because non-root processes need to be able
to load policy to different policy namespaces.

Instead ensure the task writing the interface has privileges that
are a subset of the task that opened the interface. This is already
done via policy for confined processes, but unconfined can delegate
access to the opened fd, by-passing the usual policy check.

Fixes: b7fd2c0340eac ("apparmor: add per policy ns .load, .replace, .remove interface files")
Reported-by: Qualys Security Advisory <qsa@qualys.com>
Tested-by: Salvatore Bonaccorso <carnil@debian.org>
Reviewed-by: Georgia Garcia <georgia.garcia@canonical.com>
Reviewed-by: Cengiz Can <cengiz.can@canonical.com>
Signed-off-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Keerthana: aa_may_manage_policy() does not take a subj_cred
parameter (added in 90c436a64a6e, merged in v6.7). Pass current_cred()
directly to is_subset_of_obj_privilege() in place of subj_cred, which
is equivalent since all call sites pass current_cred() as subj_cred.]
Signed-off-by: Keerthana K <keerthana.kalyanasundaram@broadcom.com>
---
 security/apparmor/apparmorfs.c     | 16 ++++++++------
 security/apparmor/include/policy.h |  2 +-
 security/apparmor/policy.c         | 35 +++++++++++++++++++++++++++++-
 3 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index e736936f4f0b..3053e5731b02 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -409,7 +409,8 @@ static struct aa_loaddata *aa_simple_write_to_buffer(const char __user *userbuf,
 }
 
 static ssize_t policy_update(u32 mask, const char __user *buf, size_t size,
-			     loff_t *pos, struct aa_ns *ns)
+			     loff_t *pos, struct aa_ns *ns,
+			     const struct cred *ocred)
 {
 	struct aa_loaddata *data;
 	struct aa_label *label;
@@ -420,7 +421,7 @@ static ssize_t policy_update(u32 mask, const char __user *buf, size_t size,
 	/* high level check about policy management - fine grained in
 	 * below after unpack
 	 */
-	error = aa_may_manage_policy(label, ns, mask);
+	error = aa_may_manage_policy(label, ns, ocred, mask);
 	if (error)
 		goto end_section;
 
@@ -441,7 +442,8 @@ static ssize_t profile_load(struct file *f, const char __user *buf, size_t size,
 			    loff_t *pos)
 {
 	struct aa_ns *ns = aa_get_ns(f->f_inode->i_private);
-	int error = policy_update(AA_MAY_LOAD_POLICY, buf, size, pos, ns);
+	int error = policy_update(AA_MAY_LOAD_POLICY, buf, size, pos, ns,
+				  f->f_cred);
 
 	aa_put_ns(ns);
 
@@ -459,7 +461,7 @@ static ssize_t profile_replace(struct file *f, const char __user *buf,
 {
 	struct aa_ns *ns = aa_get_ns(f->f_inode->i_private);
 	int error = policy_update(AA_MAY_LOAD_POLICY | AA_MAY_REPLACE_POLICY,
-				  buf, size, pos, ns);
+				  buf, size, pos, ns, f->f_cred);
 	aa_put_ns(ns);
 
 	return error;
@@ -483,7 +485,7 @@ static ssize_t profile_remove(struct file *f, const char __user *buf,
 	/* high level check about policy management - fine grained in
 	 * below after unpack
 	 */
-	error = aa_may_manage_policy(label, ns, AA_MAY_REMOVE_POLICY);
+	error = aa_may_manage_policy(label, ns, f->f_cred, AA_MAY_REMOVE_POLICY);
 	if (error)
 		goto out;
 
@@ -1796,7 +1798,7 @@ static int ns_mkdir_op(struct inode *dir, struct dentry *dentry, umode_t mode)
 	int error;
 
 	label = begin_current_label_crit_section();
-	error = aa_may_manage_policy(label, NULL, AA_MAY_LOAD_POLICY);
+	error = aa_may_manage_policy(label, NULL, NULL, AA_MAY_LOAD_POLICY);
 	end_current_label_crit_section(label);
 	if (error)
 		return error;
@@ -1845,7 +1847,7 @@ static int ns_rmdir_op(struct inode *dir, struct dentry *dentry)
 	int error;
 
 	label = begin_current_label_crit_section();
-	error = aa_may_manage_policy(label, NULL, AA_MAY_LOAD_POLICY);
+	error = aa_may_manage_policy(label, NULL, NULL, AA_MAY_LOAD_POLICY);
 	end_current_label_crit_section(label);
 	if (error)
 		return error;
diff --git a/security/apparmor/include/policy.h b/security/apparmor/include/policy.h
index b5aa4231af68..f6682a31df23 100644
--- a/security/apparmor/include/policy.h
+++ b/security/apparmor/include/policy.h
@@ -304,6 +304,6 @@ static inline int AUDIT_MODE(struct aa_profile *profile)
 bool policy_view_capable(struct aa_ns *ns);
 bool policy_admin_capable(struct aa_ns *ns);
 int aa_may_manage_policy(struct aa_label *label, struct aa_ns *ns,
-			 u32 mask);
+			 const struct cred *ocred, u32 mask);
 
 #endif /* __AA_POLICY_H */
diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index e59bdb750ef0..f2bc865bc7b6 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -671,14 +671,42 @@ bool policy_admin_capable(struct aa_ns *ns)
 	return policy_view_capable(ns) && capable && !aa_g_lock_policy;
 }
 
+static bool is_subset_of_obj_privilege(const struct cred *cred,
+				       struct aa_label *label,
+				       const struct cred *ocred)
+{
+	if (cred == ocred)
+		return true;
+
+	if (!aa_label_is_subset(label, cred_label(ocred)))
+		return false;
+	/* don't allow crossing userns for now */
+	if (cred->user_ns != ocred->user_ns)
+		return false;
+	if (!cap_issubset(cred->cap_inheritable, ocred->cap_inheritable))
+		return false;
+	if (!cap_issubset(cred->cap_permitted, ocred->cap_permitted))
+		return false;
+	if (!cap_issubset(cred->cap_effective, ocred->cap_effective))
+		return false;
+	if (!cap_issubset(cred->cap_bset, ocred->cap_bset))
+		return false;
+	if (!cap_issubset(cred->cap_ambient, ocred->cap_ambient))
+		return false;
+	return true;
+}
+
+
 /**
  * aa_may_manage_policy - can the current task manage policy
  * @label: label to check if it can manage policy
+ * @ocred: object cred if request is coming from an open object
  * @op: the policy manipulation operation being done
  *
  * Returns: 0 if the task is allowed to manipulate policy else error
  */
-int aa_may_manage_policy(struct aa_label *label, struct aa_ns *ns, u32 mask)
+int aa_may_manage_policy(struct aa_label *label, struct aa_ns *ns,
+			 const struct cred *ocred, u32 mask)
 {
 	const char *op;
 
@@ -694,6 +722,11 @@ int aa_may_manage_policy(struct aa_label *label, struct aa_ns *ns, u32 mask)
 		return audit_policy(label, op, NULL, NULL, "policy_locked",
 				    -EACCES);
 
+	if (ocred && !is_subset_of_obj_privilege(current_cred(), label, ocred))
+		return audit_policy(label, op, NULL, NULL,
+				    "not privileged for target profile",
+				    -EACCES);
+
 	if (!policy_admin_capable(ns))
 		return audit_policy(label, op, NULL, NULL, "not policy admin",
 				    -EACCES);
-- 
2.43.7


