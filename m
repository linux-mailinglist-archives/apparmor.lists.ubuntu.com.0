Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1wkHOfEFJ2oRqQIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 08 Jun 2026 20:12:01 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 959DF659928
	for <lists+apparmor@lfdr.de>; Mon, 08 Jun 2026 20:12:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=gmail.com header.s=20251104 header.b=ZBoZWMyh;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wWdTJ-0007Hl-Um; Mon, 08 Jun 2026 17:09:09 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ruoyuw560@gmail.com>)
 id 1wWTbD-0007wU-NS
 for apparmor@lists.ubuntu.com; Mon, 08 Jun 2026 06:36:40 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2c0c3543590so25823925ad.2
 for <apparmor@lists.ubuntu.com>; Sun, 07 Jun 2026 23:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780900598; x=1781505398; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XJdK+wFJTLh6vJvwVPBKkL/MaKsEcyHpUO9XLN9CTgM=;
 b=ZBoZWMyh3tL0d3LDgyOEDVjuD0wBFMK4K3Gvkm8k6Ra2LsS79HgSlvfcEyOj8jHN+H
 Zbni1nhvoxU80D6kjIOayho4lqRBbEZ8EqtJe3pw4Z8j/DIlOQOO8BTlO3cMCQo1yZkL
 6xS880i9SEolkYZp3d8713Wmn97AykYNyh8WdVnLmguEEdjJDFPDIvnJn5efvx32AQsM
 msXIaWuLKwY2xplu4FVIYelbBnTN6Kl7yshBYVRMUC28I7IGkTnjQAs+/uNWr50qlbXG
 LgCP2WXaJkQaSU3NArsujAl63ZUH/g4hD5GCfKS5aA4rPm5wvPeH927g3ZaUuDIVfdNH
 Gh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780900598; x=1781505398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJdK+wFJTLh6vJvwVPBKkL/MaKsEcyHpUO9XLN9CTgM=;
 b=n+whVADM3U79ki+NKgjCpuZl9PoAASsY0meqXGv2TgfkjVZQeKwj/ur/r3pjqYXmcL
 h8S0d/8S2IvdDsHevBmHDRBjsEfY+RasFTnFeBAqb6NmZ+PYqp4nYHL/ecwU4LnA55vv
 CBqXnyZFPzFOx4r/gwiauctKvB2VzrnbtysAG+YPSxKqzJx32fXfWSlyvzxWNrkzayNJ
 Xq31SXGnr5G1cOrb20Zp4MJoeYY3Sn5qFzJfqRHJniuOenADe0xPOkGjFFamqp7nIzqF
 du6p3GjlE6X6LY6QO52Wc5zbLgsyAoxwjNuq3N1A2wcdXQvruMYoSIlQ5u41o0r3c65w
 7a1A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8eD6m0EusEdHLm8JbXigG/5NiLZttezW0TWdePijo9kzd9C1c5fuSLaPvYKaTeroAHWpHTNcMj3A==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yw75n74AUvL3/+/5KIPmca6dObAWcX17umOX/EGU9S/60oAJm82
 aNokS51XCMgsWeu5d174EKldjDkM74CCNdA01T5GBdlj6dPwotdbO6g2
X-Gm-Gg: Acq92OEaSvLqz0pBXfroABY5H9QqcvKXQqBrgsZEY2hpJj5E8jzeQlfpYlCleI43Td4
 Y2bP+OoFYPsPgbe+xuouPwUqi1IGxTYO42MlWWd+BBhLigghBEKBMK3835SbMvsVvggQlsk+kyo
 48V7Xcj/BHhVuyNC14hvjFi7eseuYFTzVoaBEdlcJiJp6fSE4CASUwuyl5NkrBLBGqX9V3vXZvi
 f2W3GvoB8jzWs+PWulWK9/vanj4Kw6mOyVEzHDJBiYBYrBmEQTamkh8eEySpnjY374RyKOJ7Mqr
 Z8pNMbz4pFosprVsBevJfBsunAtIMktuQAJEZdGqL/g/GZ7d4w5yCXC7MtzPo78xvNbnBkRrlho
 mcdqxBEzReho2rkj6mcnU2vRg/Fmpb+VwTMslJVn/IbU/wY26P1p3cbyhEttVDR9yFfuQsIVMht
 IeFYr5BbZ6GT2IiwbriikVkaJbPMr1EXkGMvn8cavgxCAyHFnEBXkS
X-Received: by 2002:a17:902:cf11:b0:2c1:ea95:8297 with SMTP id
 d9443c01a7336-2c1ea958447mr162487235ad.7.1780900597708; 
 Sun, 07 Jun 2026 23:36:37 -0700 (PDT)
Received: from haichao.tail057a43.ts.net
 ([2001:da8:e000:1206:9a2:954d:67fe:d9c2])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16629d55esm171037655ad.63.2026.06.07.23.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 23:36:37 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: John Johansen <john.johansen@canonical.com>
Date: Mon,  8 Jun 2026 14:36:31 +0800
Message-ID: <20260608063631.9-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.178; envelope-from=ruoyuw560@gmail.com;
 helo=mail-pl1-f178.google.com
X-Mailman-Approved-At: Mon, 08 Jun 2026 17:09:09 +0000
Subject: [apparmor] [PATCH] apparmor: check label build before no_new_privs
	test
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
Cc: Paul Moore <paul@paul-moore.com>, Ruoyu Wang <ruoyuw560@gmail.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org,
 "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.49 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:ruoyuw560@gmail.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:jmorris@namei.org,m:linux-security-module@vger.kernel.org,m:serge@hallyn.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[paul-moore.com,gmail.com,lists.ubuntu.com,vger.kernel.org,namei.org,hallyn.com];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCPT_COUNT_SEVEN(0.00)[8];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_smtp];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DKIM_TRACE(0.00)[gmail.com:-]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 959DF659928

aa_change_profile() builds a replacement label with
fn_label_build_in_scope() before the no_new_privs subset check. The build
helper can fail and return NULL or an ERR_PTR, but the result was passed
to aa_label_is_unconfined_subset() before the existing IS_ERR_OR_NULL()
check.

Reuse the existing target-label build failure handling immediately after
the build. This preserves the current audit handling while preventing the
subset helper from dereferencing an invalid label.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 security/apparmor/domain.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index f02bf770f6385..6748ac74b060b 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -1527,6 +1527,8 @@ int aa_change_profile(const char *fqname, int flags)
 		new = fn_label_build_in_scope(label, profile, GFP_KERNEL,
 					   aa_get_label(target),
 					   aa_get_label(&profile->label));
+		if (IS_ERR_OR_NULL(new))
+			goto build_fail;
 		/*
 		 * no new privs prevents domain transitions that would
 		 * reduce restrictions.
@@ -1545,16 +1547,8 @@ int aa_change_profile(const char *fqname, int flags)
 		/* only transition profiles in the current ns */
 		if (stack)
 			new = aa_label_merge(label, target, GFP_KERNEL);
-		if (IS_ERR_OR_NULL(new)) {
-			info = "failed to build target label";
-			if (!new)
-				error = -ENOMEM;
-			else
-				error = PTR_ERR(new);
-			new = NULL;
-			perms.allow = 0;
-			goto audit;
-		}
+		if (IS_ERR_OR_NULL(new))
+			goto build_fail;
 		error = aa_replace_current_label(new);
 	} else {
 		if (new) {
@@ -1566,6 +1560,17 @@ int aa_change_profile(const char *fqname, int flags)
 		aa_set_current_onexec(target, stack);
 	}
 
+	goto audit;
+
+build_fail:
+	info = "failed to build target label";
+	if (!new)
+		error = -ENOMEM;
+	else
+		error = PTR_ERR(new);
+	new = NULL;
+	perms.allow = 0;
+
 audit:
 	error = fn_for_each_in_scope(label, profile,
 			aa_audit_file(subj_cred,
-- 
2.51.0


