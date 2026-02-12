Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFSlEgFDjml3BQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 12 Feb 2026 22:15:45 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FEA1312B8
	for <lists+apparmor@lfdr.de>; Thu, 12 Feb 2026 22:15:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vqe25-0000St-Hn; Thu, 12 Feb 2026 21:15:29 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1vqe24-0000Sm-Jq
 for apparmor@lists.ubuntu.com; Thu, 12 Feb 2026 21:15:28 +0000
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4CF6B3F471
 for <apparmor@lists.ubuntu.com>; Thu, 12 Feb 2026 21:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770930928;
 bh=SXM/gOYpmftIKkW1cNdYByaB+X4imoc+LIoaYp6nrIs=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=lOymUJyseG1cWZKjTSCNSoB0UPktdmZarOGwNgclP+WjHo8otRbI6M+MHZq7p9TFM
 Wf9iLWOqIDJtKzx9RQ7o9wcK/3oO6cHMDIprrWld+CteAlJXQbYajQD39m38VrjGoy
 +Lao2Vv3tMam40dioO3PxmLiIjirSfYJ2o9Wj0PEMzi4/gbxXqt+kNisj3iJl2OtBj
 /jcJ1eyNZ3T5KNEnseCfd0LoDQLFkb9p1lDFwGZ6PkWfszKqF3Bs1R3whuU0sAUW3W
 pL8i4bRJPxQKK+iMCL8sHwJPuaMG5eKvhXbt6F6JDpXLCOswosrHz6vU29mGQI/pd+
 y2zKMIQBEfJp1/veqMyaoi8Mq/kgbJwJ3FmVIYsIZ4RwWUFLhSLJsxHoVoxZC4Tnqq
 XNbnB+N5K1SgptgLdPI95DJBTfcGVm2G6LMn0QUKyTUdYZ2HAOgP/BqJ/zCH65VxDf
 Quq1QowW3ENbOTnWk1fFoJ7ru2FOeJzzZd7gwTbWK+o8gSdkmkg0GHQ1yHLVgIm0Pr
 sXSH36CUXlC6F8sW0Xh9mBr0e5NuEowMcBVz3DWh5ZDxvHXwycwoycIsv1jtvR4sPJ
 nGWzzmECoUFu1o5FSZ349AAcuZSymvoBS7JmnbfArzzOC0cLBsb4A/JKGM9YgIynEg
 9xoafMYSl/zAc7z1iE8+U4Dg=
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2ba8013a9e3so325949eec.0
 for <apparmor@lists.ubuntu.com>; Thu, 12 Feb 2026 13:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770930926; x=1771535726;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SXM/gOYpmftIKkW1cNdYByaB+X4imoc+LIoaYp6nrIs=;
 b=Uev2/2ZNxdTiv9xlNv9Q8TtCdyOlWpxvsjPEB/dpapGb6wQ8vohL2bq/S3IY/EZ3yc
 Ca+dS12e52ZZFXzW/FfWASGbNQJ1iAFk8RD+p9icdyLg+IqF24GId0wv9+BFN9D9ibuK
 bloxO5IahI1BtP2f2zHk64r2jGBKcMsEKb3eAd1br2gwtwF6EI6hbCrZBbQMeGgVAgWl
 82ZuFKfDvuVaaEK0dnoVr7Sj8wHiHAjYcUOlVcOW4lFzWPgR+JKIYXrMhzMXsIJnDqW+
 K7dsub6cZGXhvsuFchjIDdaWPBAUb0DmX+kV7KH6Tka8jh0PJ/tAAqc3CvIe4pOzRLGU
 cM6g==
X-Gm-Message-State: AOJu0YyI1MBFRmmYUgzR9jkR5/FAXow6CCA6WcOTr6Qx2JQ9nf9LJdDf
 VTEKLifvWEqYWkGXim9lpy5aLNR/WBUGM4Y9TSklYMuGx8+DXWTNa0/Vr8yu8YVCMyA6j8Rq5Jj
 i3UzpfMfxK7DO9V9v/ZCX546ZJtd/z4uSjPpm0z43/TQ4HnDC1dnbAY9c6SiTys2nRYX9FzvvvF
 9bE1FBclKsTQ==
X-Gm-Gg: AZuq6aJYytQ4fb1/0Z0Ifu8KGVxkV2SAcjMaLo6IyiZjfvnA0pkaWZS+QGKjS2PnQh5
 2Cvt7RL3SI+0vay8riAI/92KHlsS8uSj7N1R48VHUVqJqJQWq5p9s2XCRLoe5+KVI5VTC/fWGBi
 GoD6hW/Ry+JNAPX5Cwczb/RJvORf9jGmM2c8l0f6r6sT0q24b2icEVjBgnqycWB5r6wpDf3c8dF
 rSWXmZmR0uC30nsdCkFsSuOUx9r+wqBRGvWrF7GPr6Dgz/tQTWo8cVTek01m1/tW4lYlpPNbcGC
 LzhPafrdmUMB87jfHjERw4zDzvOT/qjuzpRQLarNTJAccGJ8VUh9B+L/xMfvjL2DT1wjdNELOFx
 trkbmEsJyHp+ovIY3fhx38ZkOoHO+bWyNFbNM17uH6tItZgaUGCth31ZSHQ4xS2tZdAjlCb+A5b
 l0V0mK+pl31cLFFY/qQt8CLRmRwAD9DV+1FpDdtuAI+VEMDHN3II18wITBuP0Tpy28VQ==
X-Received: by 2002:a05:693c:6286:b0:2ba:908e:8e12 with SMTP id
 5a478bee46e88-2bab9ff13a1mr106003eec.6.1770930926547; 
 Thu, 12 Feb 2026 13:15:26 -0800 (PST)
X-Received: by 2002:a05:693c:6286:b0:2ba:908e:8e12 with SMTP id
 5a478bee46e88-2bab9ff13a1mr105999eec.6.1770930925998; 
 Thu, 12 Feb 2026 13:15:25 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ba9dba2fe9sm4256532eec.7.2026.02.12.13.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 13:15:25 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu, 12 Feb 2026 13:15:14 -0800
Message-ID: <20260212211516.393031-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: use __label_make_stale in
	__aa_proxy_redirect
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:mid,canonical.com:email];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com]
X-Rspamd-Queue-Id: 11FEA1312B8
X-Rspamd-Action: no action

The macro is equivalent to OR-ing in the bitflag manually, but using the
macro consistently makes grepping for these occurrences easier.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/label.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

This patch applies cleanly to both the Ubuntu 6.17 kernel and upstream master.

diff --git a/security/apparmor/label.c b/security/apparmor/label.c
index 14bbed88aa83..ee9836ebc196 100644
--- a/security/apparmor/label.c
+++ b/security/apparmor/label.c
@@ -81,7 +81,7 @@ void __aa_proxy_redirect(struct aa_label *orig, struct aa_label *new)
 	tmp = rcu_dereference_protected(orig->proxy->label,
 					&labels_ns(orig)->lock);
 	rcu_assign_pointer(orig->proxy->label, aa_get_label(new));
-	orig->flags |= FLAG_STALE;
+	__label_make_stale(orig);
 	aa_put_label(tmp);
 }
 
-- 
2.43.0


