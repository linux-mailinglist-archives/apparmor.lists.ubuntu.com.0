Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMgxIsWRGGoMlQgAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 21:04:37 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5145F6D6E
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 21:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSg1m-0004gk-A8; Thu, 28 May 2026 19:04:22 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <georgia.garcia@canonical.com>)
 id 1wSg1k-0004gZ-PT
 for apparmor@lists.ubuntu.com; Thu, 28 May 2026 19:04:20 +0000
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 903703F4B4
 for <apparmor@lists.ubuntu.com>; Thu, 28 May 2026 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1779995060;
 bh=sTq3NGxRO5/ux9tudpyl9dOIz8CUHNQsEHXGo26ggjY=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=sFyltO/ZCJTy5nls+IMQMJWfwXI2Q6XBKa9oH2+ASqLtdqSKK7Iuv8OHoe4w/1MAM
 dJVsvh/DL09zldZshqvaI1D+5PvICicYn/PIcu+2gQmJNqOcQE3PRyeUVcJ6KD6ev9
 HycBs48YRVilFfk7TRsFwum6S2+tCF5jTaSIO0ZvSZ94HQMiF4Rlo76NILG7jGfc3O
 5EokSCc5meZfcigdefbfvIcsNPk/W4I5gcVyUz7VAfRRFC/xPX+t3Y6ZNG4NDgvRhX
 708bd9BqVsBOh1v8hHVkRoxidNN0cjnRTpvuF0tAhDZToxQ9DEq9RolhfGakeWcvoN
 R5LgP0hEbhHQh5V+CIAKvjpyCPgJR5CilF0dyXaylgYD956u2Wxag6vMbHsBtfB/mN
 TuAjqT737EoYViitVWOALiWm9E+duLHF2jN/pqJL/lqbMZCLRCnT0+uM2LB1V9vM8n
 5brNvl2c2MrkZyGrR1QfQl/eedFOs1F6UIan7dET2x0WZ7CgkdyDK9UTaGIfUMi6gB
 Aq3AMzbOmS43tz2SCQyj6WzwyOKkkRWTIyv4wXV6Cl4gyvB+Pn6bx1TggDlezJclQD
 hKMP4sab7qPlq3wz835J1APdH61kThs4UiHn4sxAsn9mU34OUh1YvDVR9kDN+UcSsx
 MXOu5FV+Miw1R+TxCLJQxFYI=
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-135916eefa0so11905257c88.1
 for <apparmor@lists.ubuntu.com>; Thu, 28 May 2026 12:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779995059; x=1780599859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTq3NGxRO5/ux9tudpyl9dOIz8CUHNQsEHXGo26ggjY=;
 b=Kgt6chDVU8Jp2e4qtRCGr4hGAzKPCq4wyHFg1k2n5MtbtTzPCcF0/UdEG92HYRrmE0
 KOO4DEnoF4Hz/CG8pVCIw3qr9f6jGKsu286cDzidH/pkUo3cNXXCQwTIbIBm7MgJDgRH
 qGDZy5QAf8uV4ylK82afd5jmwdpO1DsURaAEFV9uuMCU253b4uS4pz4+uHKTxL93+6w0
 pRypQ/KStejlBnCu6lbfRy/Let3YoBe+jDAcqN2+xcu0BM2uZrcnDtlCmeHVGfuZSFtk
 IWyaVqBfBEwGcl5aH7MfwFVeJNoytM3BJKPr3ZV7JvCZ0Rlxv3xI6IHFCJBnDrw9Oc1u
 uGnQ==
X-Gm-Message-State: AOJu0Yxg4Kp7ZVQjWljuRL9RNmkj7ugi8lxmh7YucBjGSf7wsTdDV9OK
 /myNc89eUtRyJtus6ptCbC35n/50Nw4H0gYXOozxqUe1DUtOLCjB+MkkcpV3xWGf4rqp/gdFEDh
 1U1iJV9D49w1X4csH1pNzL3J/Qym5wtVe1Fy/ZgvZv27wrSMbKvbljLHiYZGxA0Ft/jlsUd03Z1
 yGa358cMckAw==
X-Gm-Gg: Acq92OEZmLqY1Qnd+cmZbmYPxpdbHaH7yZ746hWefdOzS6ErMeNZgAjkAttZzzlHshe
 x8dzKk4hsVUmKIhgKnmqOdIdednZjCpjWGKRyXKi3zKCHH2C5C1tjU5HjjRRJbSWuVBnp36D/ZX
 SJrxnPNv8hx3lHoh4uwrosblxIasccsETdXjGYtisiNa1V5FWxqefjdn4iczIfgseDcLF9JytGy
 6ORk78UZoYRsdDLKCwrdAP+S6vTKz1qXRczd1WDlnZiqVjotcdjDoEnApbl0fyxZ6c20pHWEFaa
 1mSmHlWPvwkiBqvelaDzKsMyOX4JByHEqCfvybWCoW9wwjB/HGYuh5jSOOOx5HvLs+4thHaS8tY
 YTMigYxe2QGPCZm/RgQCwByLT2qQMt6PjVEYlkms6JiKwddPhdfWcsAO0b7FS43rF8SjyeJqj9w
 zTWV0cf6aKJXBViDM0XA==
X-Received: by 2002:a05:7022:69a3:b0:136:a5df:dcb9 with SMTP id
 a92af1059eb24-137a836243bmr171380c88.10.1779995058890; 
 Thu, 28 May 2026 12:04:18 -0700 (PDT)
X-Received: by 2002:a05:7022:69a3:b0:136:a5df:dcb9 with SMTP id
 a92af1059eb24-137a836243bmr171355c88.10.1779995058357; 
 Thu, 28 May 2026 12:04:18 -0700 (PDT)
Received: from georgia.tail13065b.ts.net ([187.95.108.104])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137a948b649sm133005c88.2.2026.05.28.12.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 12:04:17 -0700 (PDT)
From: Georgia Garcia <georgia.garcia@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu, 28 May 2026 16:04:12 -0300
Message-ID: <20260528190412.680277-1-georgia.garcia@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: don't audit files pointing to
	aa_null.dentry
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
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[canonical.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.502];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 3B5145F6D6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In 4a134723f9f1 there was a change to not audit files pointing to
aa_null.dentry because they provide no value, but setting the error
variable instead of returning -EACCES was still causing them to be
audited.

Fixes: 4a134723f9f1 ("apparmor: move check for aa_null file to cover all cases")
Signed-off-by: Georgia Garcia <georgia.garcia@canonical.com>
---
 security/apparmor/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 694e157149e8..fc5abd5473c8 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -157,7 +157,7 @@ static int path_name(const char *op, const struct cred *subj_cred,
 
 	/* don't reaudit files closed during inheritance */
 	if (unlikely(path->dentry == aa_null.dentry))
-		error = -EACCES;
+		return -EACCES;
 	else
 		error = aa_path_name(path, flags, buffer, name, &info,
 				     labels_profile(label)->disconnected);
-- 
2.43.0


