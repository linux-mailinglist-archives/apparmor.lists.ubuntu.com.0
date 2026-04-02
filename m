Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME5iENZV1Wnz4wcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Apr 2026 21:07:02 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BD93B3369
	for <lists+apparmor@lfdr.de>; Tue, 07 Apr 2026 21:07:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wABFB-0003ym-L7; Tue, 07 Apr 2026 18:33:45 +0000
Received: from mail-ot1-f98.google.com ([209.85.210.98])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <keerthana.kalyanasundaram@broadcom.com>)
 id 1w8B0A-0002s1-C9
 for apparmor@lists.ubuntu.com; Thu, 02 Apr 2026 05:53:58 +0000
Received: by mail-ot1-f98.google.com with SMTP id
 46e09a7af769-7d743d94d5eso94641a34.0
 for <apparmor@lists.ubuntu.com>; Wed, 01 Apr 2026 22:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775109236; x=1775714036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iVFmR/coGugPGOD5D8t57xuLW0pWKEfclUCRJYgoO14=;
 b=CAJkj2Bfoe02GvbJMZJvuD2DvjWpSoNjLm+K+vFAdlcXoCKSv0XCNioEW1N87LMYhk
 GbIoYx2fd3A3NsmLS1z2rhJZsvvN3I6mpSOzNr6JQQWABEW+BRJ/zXucrBitDS0NKf2Q
 NcUoXNKgJhMbSQn26yAjbjPpbR1Yc5Ph9Y7c4jn9F4eUppD2luIBgRsX5KKcWB/VL0KA
 B8+KZCrgLRDl5iKTTlGYP7Hshv4IVZ9THMCm87hHLszM/rf0n7zSZLaWWUO1gDW4hHCD
 So+D90OVW1IJ9AGBiIHFod6GcvseWqSm2ygwwNzEZfTjSDM0ydUwpRtt64BKvSm6FhgT
 CNtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVidFdvejObrRTbaciEj/zV64kV0EHwMmW307ds7qT0tj/BjfhzHXwIjx1KEt8EW8bt4bWaBGCiIw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yxx9ENjE2AJGC2ULe+gGW/9M9hSEhQfe4jRhqw3cNf9eP15f5q5
 cmAtC4W+uIYhtGR0tY2d3RvjV7aHpj9Ap3Q7vtYV2HuR8E6LQR1dV0oswUgL4Qbr0qMhd+kw5EJ
 GlWK5OhIC6cdLSMVgpVGaW/KrN8D5+tx+o0Oexag9/VTiYKG0AyRQEVBufDPFZJnotYjPUQWTih
 HnQZxc5Ai/F25JzOE4exX/Lq5DRM39jRmAT00lwJ88k5nM1Jzev6rzrDYKaQ/32ZabQLXC4e+MC
 baAqmxEICZPgeiFPXQVq2ioOTs/xQdoaLc=
X-Gm-Gg: ATEYQzw3lTDu1vJtS1bYES55WKUchWVQY6VnPk+NW9LA9PGL+maClJKgR91cgv4RHVT
 GdkGGTdMi6wToVwZ5UYXz8uwGAyel9s5886QA2S/Xr7M/gTPVwTgFYqz3oBye64EkU+P5EIyRku
 4Y9D03PbcvkdIPMszo8VlPCOKv0N7PBHWa83RFJ2RDpFaVREqtBFR1+DgGK0rM5nZ+XW8fXEo5Z
 RSbZe6XSAUJPxTUVxGFOcb4zTVCVb/um5duIWeFh0Nm8UaD0H5Yu3tWRwgmSLf7pAQqgZwhp91y
 Oxqnzr7YAHYonjQPVPgBBjmT+pqGMpwH7Y0+s1P/ODJ+tCdhx6HGliw00fcG/PsW4DJhDqz++Vq
 4lqxEZX/QUxxnw2gd8AI2hz9gNQR0nj/9GvVb+Wn5sDp4Srxcihdm21hB+FRorREm46aWO85PYC
 jfyktAZtAqd1cdFjtw+2q4ow==
X-Received: by 2002:a05:6820:2915:b0:67e:20bf:2ea4 with SMTP id
 006d021491bc7-67fabae0939mr2427006eaf.0.1775109236178; 
 Wed, 01 Apr 2026 22:53:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 ([144.49.247.127]) by smtp-relay.gmail.com with ESMTPS id
 006d021491bc7-680a56ee8f0sm101683eaf.4.2026.04.01.22.53.54
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Apr 2026 22:53:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2c17a2758b0so44850eec.2
 for <apparmor@lists.ubuntu.com>; Wed, 01 Apr 2026 22:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1775109234; x=1775714034; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iVFmR/coGugPGOD5D8t57xuLW0pWKEfclUCRJYgoO14=;
 b=BIPoZFzmbJIqFznKuBuhvz6CqeozjnyjwS154awCEzwq+eCqPIhPAb1DI/mS6qBQ4m
 n6Q+RhPYB4qbJdEdNkrPsQxTcTq0VbPCHTnUGDqLvYeihZ2RJIPlmAW5s4tyYxI+4pfm
 TqO5imftLO/jYJik1os0+zvN8yoREIB+FwrRM=
X-Forwarded-Encrypted: i=1;
 AJvYcCUl/nj8uFqRbi7ntcDD+kdvTiArcrFHMvpOGeIuO7sZmh8ZxNq4AU0EoEM38BksozSlZv2SSuanAA==@lists.ubuntu.com
X-Received: by 2002:a05:7300:d70e:b0:2c4:ec89:bdb with SMTP id
 5a478bee46e88-2c930798a42mr1523891eec.2.1775109233680; 
 Wed, 01 Apr 2026 22:53:53 -0700 (PDT)
X-Received: by 2002:a05:7300:d70e:b0:2c4:ec89:bdb with SMTP id
 5a478bee46e88-2c930798a42mr1523884eec.2.1775109232974; 
 Wed, 01 Apr 2026 22:53:52 -0700 (PDT)
Received: from keerthanak-ph5-dev.. ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ca7cf1271asm2180380eec.26.2026.04.01.22.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 22:53:51 -0700 (PDT)
From: Keerthana K <keerthana.kalyanasundaram@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Date: Thu,  2 Apr 2026 05:47:00 +0000
Message-ID: <20260402054700.2798707-1-keerthana.kalyanasundaram@broadcom.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Received-SPF: pass client-ip=209.85.210.98;
 envelope-from=keerthana.kalyanasundaram@broadcom.com;
 helo=mail-ot1-f98.google.com
X-Mailman-Approved-At: Tue, 07 Apr 2026 18:33:45 +0000
Subject: [apparmor] [PATCH v6.1] apparmor: fix unprivileged local user can
	do privileged policy management
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:sashal@kernel.org,m:ajay.kaher@broadcom.com,m:paul@paul-moore.com,m:carnil@debian.org,m:qsa@qualys.com,m:linux-kernel@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:keerthana.kalyanasundaram@broadcom.com,m:linux-security-module@vger.kernel.org,m:vamsi-krishna.brahmajosyula@broadcom.com,m:alexey.makhalov@broadcom.com,m:tapas.kundu@broadcom.com,m:yin.ding@broadcom.com,m:serge@hallyn.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[keerthana.kalyanasundaram@broadcom.com,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[keerthana.kalyanasundaram@broadcom.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[broadcom.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.665];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,linuxfoundation.org:email,broadcom.com:email,broadcom.com:mid,qualys.com:email];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: 09BD93B3369
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
index fa518cd82366..fa4a6f20f58e 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -412,7 +412,8 @@ static struct aa_loaddata *aa_simple_write_to_buffer(const char __user *userbuf,
 }
 
 static ssize_t policy_update(u32 mask, const char __user *buf, size_t size,
-			     loff_t *pos, struct aa_ns *ns)
+			     loff_t *pos, struct aa_ns *ns,
+			     const struct cred *ocred)
 {
 	struct aa_loaddata *data;
 	struct aa_label *label;
@@ -423,7 +424,7 @@ static ssize_t policy_update(u32 mask, const char __user *buf, size_t size,
 	/* high level check about policy management - fine grained in
 	 * below after unpack
 	 */
-	error = aa_may_manage_policy(label, ns, mask);
+	error = aa_may_manage_policy(label, ns, ocred, mask);
 	if (error)
 		goto end_section;
 
@@ -444,7 +445,8 @@ static ssize_t profile_load(struct file *f, const char __user *buf, size_t size,
 			    loff_t *pos)
 {
 	struct aa_ns *ns = aa_get_ns(f->f_inode->i_private);
-	int error = policy_update(AA_MAY_LOAD_POLICY, buf, size, pos, ns);
+	int error = policy_update(AA_MAY_LOAD_POLICY, buf, size, pos, ns,
+				  f->f_cred);
 
 	aa_put_ns(ns);
 
@@ -462,7 +464,7 @@ static ssize_t profile_replace(struct file *f, const char __user *buf,
 {
 	struct aa_ns *ns = aa_get_ns(f->f_inode->i_private);
 	int error = policy_update(AA_MAY_LOAD_POLICY | AA_MAY_REPLACE_POLICY,
-				  buf, size, pos, ns);
+				  buf, size, pos, ns, f->f_cred);
 	aa_put_ns(ns);
 
 	return error;
@@ -486,7 +488,7 @@ static ssize_t profile_remove(struct file *f, const char __user *buf,
 	/* high level check about policy management - fine grained in
 	 * below after unpack
 	 */
-	error = aa_may_manage_policy(label, ns, AA_MAY_REMOVE_POLICY);
+	error = aa_may_manage_policy(label, ns, f->f_cred, AA_MAY_REMOVE_POLICY);
 	if (error)
 		goto out;
 
@@ -1808,7 +1810,7 @@ static int ns_mkdir_op(struct user_namespace *mnt_userns, struct inode *dir,
 	int error;
 
 	label = begin_current_label_crit_section();
-	error = aa_may_manage_policy(label, NULL, AA_MAY_LOAD_POLICY);
+	error = aa_may_manage_policy(label, NULL, NULL, AA_MAY_LOAD_POLICY);
 	end_current_label_crit_section(label);
 	if (error)
 		return error;
@@ -1857,7 +1859,7 @@ static int ns_rmdir_op(struct inode *dir, struct dentry *dentry)
 	int error;
 
 	label = begin_current_label_crit_section();
-	error = aa_may_manage_policy(label, NULL, AA_MAY_LOAD_POLICY);
+	error = aa_may_manage_policy(label, NULL, NULL, AA_MAY_LOAD_POLICY);
 	end_current_label_crit_section(label);
 	if (error)
 		return error;
diff --git a/security/apparmor/include/policy.h b/security/apparmor/include/policy.h
index 639b5b248e63..3f776f5e8de4 100644
--- a/security/apparmor/include/policy.h
+++ b/security/apparmor/include/policy.h
@@ -308,7 +308,7 @@ static inline int AUDIT_MODE(struct aa_profile *profile)
 bool aa_policy_view_capable(struct aa_label *label, struct aa_ns *ns);
 bool aa_policy_admin_capable(struct aa_label *label, struct aa_ns *ns);
 int aa_may_manage_policy(struct aa_label *label, struct aa_ns *ns,
-			 u32 mask);
+			 const struct cred *ocred, u32 mask);
 bool aa_current_policy_view_capable(struct aa_ns *ns);
 bool aa_current_policy_admin_capable(struct aa_ns *ns);
 
diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 4ee5a450d118..e7412a221551 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -712,14 +712,42 @@ bool aa_current_policy_admin_capable(struct aa_ns *ns)
 	return res;
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
 
@@ -735,6 +763,11 @@ int aa_may_manage_policy(struct aa_label *label, struct aa_ns *ns, u32 mask)
 		return audit_policy(label, op, NULL, NULL, "policy_locked",
 				    -EACCES);
 
+	if (ocred && !is_subset_of_obj_privilege(current_cred(), label, ocred))
+		return audit_policy(label, op, NULL, NULL,
+				    "not privileged for target profile",
+				    -EACCES);
+
 	if (!aa_policy_admin_capable(label, ns))
 		return audit_policy(label, op, NULL, NULL, "not policy admin",
 				    -EACCES);
-- 
2.43.7


