Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9i6/AcJ7j2m+RAEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 13 Feb 2026 20:30:10 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A0F139381
	for <lists+apparmor@lfdr.de>; Fri, 13 Feb 2026 20:30:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vqyrT-0007HJ-I9; Fri, 13 Feb 2026 19:29:55 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1vqyrR-0007H5-M6
 for apparmor@lists.ubuntu.com; Fri, 13 Feb 2026 19:29:53 +0000
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7647B3F633
 for <apparmor@lists.ubuntu.com>; Fri, 13 Feb 2026 19:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1771010993;
 bh=ia+lwt6495L1W184oR2YsH979UHtVF9ksWFzoWfDBE0=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=se0+OXmctRhoxk5hlvSLs0Fwxp/THelKNOB5NekvvVCmCGZhsLzFIoxrhy26dmPVQ
 O7dUSBHkIL0bg8oNv2DfsP/wuXBOQXeDCyI0lSLfrG/zUwxWfHX6HUG/QefHmRwxC6
 9zcf61yDx0M6tXTNATMDPOVTvFqvP7HS3IJYdQ7614MAayWaic4NYKvCzTuP0QOGyj
 yLg01QM2R1uNgrUtlcm0+ZxzHL+vHbWeIoY8G4ErpPyP1jDYfRv8RFgFDVSqnaVrUV
 CxpC2lJ3o7dx40PldnlB9Sxd00fz8JBWUMYsY4DyRY8PzkZZoh/4P6tReYmzVZgW4H
 A81ODjjqPhDA3qZ5fIH8XVaRbkeHqANDyC/9rr/1lFlIrE//OmZGEJ17Pm50oK4aTm
 IaWmLKRPGFgbqTu0X3pJBURunoOWhHjmBrh2KT2LWrx62xMHQMpaxM++UwrjcRNtgS
 IIINr7ZL0kb3vGRW9BcacihxJabvhu4CA4gbFZTUaADIyi0o3zRB2lm+DvXG3jXEbM
 skPFY524iBQRMl7TYKw08oRz3Xd98DaRvq6saIXahhklgjWOzUsk4GMBVyRHy9KfPm
 oe3z8KpSXZU98ivjwuF0Y9RiIvWPSm6J+2xwWoekFhTrrGYakAsnB2s4r/EcSBIUQx
 SeipZ1vLMzgvple+7ZPvvpPY=
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2b81ff82e3cso1802532eec.0
 for <apparmor@lists.ubuntu.com>; Fri, 13 Feb 2026 11:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771010992; x=1771615792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ia+lwt6495L1W184oR2YsH979UHtVF9ksWFzoWfDBE0=;
 b=eaEYKYs7enPLBEbBONg/fvvnW+3pn0rWsfRGiz5DFNk+WG23e+ggZSwAxec6SsVJO0
 2eHVWqKIXecPeSWEhBhCAEDdBbVUnPhdtUC/JOp3QAuQEbNDNNIweulJbeTcAS38NBeC
 dYJ6MhCEjyMV0ElvrO3vB+Fke0EgG+g9ohlfm6FMqAsxHuvfnTT/CL2DNCtf02YDuNSY
 6NG+Sxuo1DtHd0IW8eeP0Ef0Igw4g28BRyu1ETIZZ017XVMwyylI2v+BM/2qFH+/0XwQ
 jZsn880jZSZkxJhFNAennI+Kbn8nX68DYMUkssiWCkeIejTHD9rg9C2Dorgz3wo4Fy2x
 sjww==
X-Gm-Message-State: AOJu0Yww3YyuSRPSxMx+AppVeApYMYkbd1o7f3XMiY/QvQGnyuFjhdDd
 ApuTsUO2PlDsyAt1JkTrkGYHj+GchkVN//4ADbhK17aIs+OQPtuqHiM2wtc76uQNtnSA12iMSbz
 QmzqPvaegeTQm4gyu3CYafmbDxTOO6ZsvEIb+BkIVKEJ0z6JI1d5oDDky4rgn7IYTDUb9SIpr4v
 YCXm4OMcoi0g==
X-Gm-Gg: AZuq6aKd50Yn2hxMwsb4jPVon6ASCVcyrQO7Lio78+pQEaNCESfC0qD0wAba1vlcEak
 ZQ00PR0c1XA9DZkj/0YjbqG2uHqFvNKZ1XUTkX6alHJRCAFPMOfta0/1DUbdvfIgx6itwbqtBEw
 mjSx8TtNg9mOm4cAJYKntluveAySDvSL9UfAQQXmTNmHevJcQaCzX9T5kIlr3y06OFhrcuHgm+D
 yxaJMUvCi2dxTmmbJBpimEFFAEcbuWfr8Q87NF9+UnpViORnT6jPi17gNVvdxq7/GNt1baOoV6j
 kmHb3OGTkRRF5gnpkbZyeMZ/hEyHNn1FXJoAl2bD2/Smv8ko97P8fpUEDPIHHzCAG8ZVR/9IG3m
 wGFTaYTl+78+RJU05E0GS/4KGI5DHMxISeddBrPZdR7kHIxJI1c75QxXynMIRHWk1Dr/o3k+/RE
 +NvYisPMBUUi49tO58XN5/CpeNW7bW13gyH53RiHQShQYGlbmmYGe5a3Vfi/OiZWMknw==
X-Received: by 2002:a05:7022:f93:b0:119:e569:f86a with SMTP id
 a92af1059eb24-12740fce8b7mr454591c88.7.1771010991903; 
 Fri, 13 Feb 2026 11:29:51 -0800 (PST)
X-Received: by 2002:a05:7022:f93:b0:119:e569:f86a with SMTP id
 a92af1059eb24-12740fce8b7mr454583c88.7.1771010991225; 
 Fri, 13 Feb 2026 11:29:51 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1272a6f3256sm9274410c88.14.2026.02.13.11.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:29:50 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 13 Feb 2026 11:29:47 -0800
Message-ID: <20260213192948.24853-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: grab ns lock and refresh when looking
	up changehat child profiles
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com]
X-Rspamd-Queue-Id: A3A0F139381
X-Rspamd-Action: no action

There was a race condition involving change_hat and profile replacement in
which replacement of the parent profile during a changehat operation could
result in the list of children becoming empty and the changehat operation
failing. To prevent this:
 - grab the namespace lock until we've built the hat transition, and
 - use aa_get_newest_profile to avoid using stale profile objects.

Link: https://bugs.launchpad.net/bugs/2139664
Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/domain.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

This version of the patch applies cleanly to the upstream kernel.

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 7d81111f628c..2d3b80423d20 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -12,6 +12,7 @@
 #include <linux/fs.h>
 #include <linux/file.h>
 #include <linux/mount.h>
+#include <linux/mutex.h>
 #include <linux/syscalls.h>
 #include <linux/personality.h>
 #include <linux/xattr.h>
@@ -1128,6 +1129,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
 				   int count, int flags)
 {
 	struct aa_profile *profile, *root, *hat = NULL;
+	struct aa_ns *ns, *new_ns;
 	struct aa_label *new;
 	struct label_it it;
 	bool sibling = false;
@@ -1138,6 +1140,32 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
 	AA_BUG(!hats);
 	AA_BUG(count < 1);
 
+	/*
+	 * Acquire the newest label and then hold the lock until we choose a
+	 * hat, so that profile replacement doesn't atomically truncate the
+	 * list of potential hats. Because we are getting the namespaces from
+	 * the profiles and label, we can rely on the namespaces being live
+	 * and avoid incrementing their refcounts while grabbing the lock.
+	 */
+	label = aa_get_label(label);
+	ns = labels_ns(label);
+
+retry:
+	mutex_lock_nested(&ns->lock, ns->level);
+	if (label_is_stale(label)) {
+		new = aa_get_newest_label(label);
+		new_ns = labels_ns(new);
+		if (new_ns != ns) {
+			aa_put_label(new);
+			mutex_unlock(&ns->lock);
+			ns = new_ns;
+			label = new;
+			goto retry;
+		}
+		aa_put_label(label);
+		label = new;
+	}
+
 	if (PROFILE_IS_HAT(labels_profile(label)))
 		sibling = true;
 
@@ -1146,7 +1174,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
 		name = hats[i];
 		label_for_each_in_ns(it, labels_ns(label), label, profile) {
 			if (sibling && PROFILE_IS_HAT(profile)) {
-				root = aa_get_profile_rcu(&profile->parent);
+				root = aa_get_profile(profile->parent);
 			} else if (!sibling && !PROFILE_IS_HAT(profile)) {
 				root = aa_get_profile(profile);
 			} else {	/* conflicting change type */
@@ -1206,6 +1234,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
 				      GLOBAL_ROOT_UID, info, error);
 		}
 	}
+	mutex_unlock(&ns->lock);
 	return ERR_PTR(error);
 
 build:
@@ -1218,7 +1247,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
 		error = -ENOMEM;
 		goto fail;
 	} /* else if (IS_ERR) build_change_hat has logged error so return new */
-
+	mutex_unlock(&ns->lock);
 	return new;
 }
 
-- 
2.43.0


