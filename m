Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AHIBjZBd2mMdQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 26 Jan 2026 11:25:58 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D120A86DC8
	for <lists+apparmor@lfdr.de>; Mon, 26 Jan 2026 11:25:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vkJmv-0004zU-1K; Mon, 26 Jan 2026 10:25:41 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <sakamo.ryota@gmail.com>)
 id 1vjx0N-0006nW-MF
 for apparmor@lists.ubuntu.com; Sun, 25 Jan 2026 10:06:03 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2a09757004cso34386195ad.3
 for <apparmor@lists.ubuntu.com>; Sun, 25 Jan 2026 02:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769335562; x=1769940362; darn=lists.ubuntu.com;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Xnf6p+2Hlq5eWfuvYyYtXu3LZrwEbd4KRfL66TNxW0=;
 b=CsN64C0/LGYEPaR9uztDcM6aTFCYM8iznuWBZVyc5JTjYnG9LiZZNJ98chFoAau/RD
 lRdHA9TA7J5wBpvhACzsONa8lMoeJXqhWdvzWCIdHh4UeuuM8gh2Wa/S1QDI1ev8xGzB
 Fk3Pg6qT4mFm+p4TciXsN0iPL2C2OvA63DzwQirboPSVVVJcpOiWwO0yUPiDlMgm8w95
 LXdss88pP5k2sVzfQKmPFPpO6/UjqV2wIk5rDFZewpZyV+Cz8NCWDgzaKl2+rIQbQBts
 pgWMn2V6nq187fiF1W9GM1Bz7xIyTFAyGakEEj0Y7VI7N1FjwU1Sp8xsBrDAuivVb5eq
 Ttww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769335562; x=1769940362;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Xnf6p+2Hlq5eWfuvYyYtXu3LZrwEbd4KRfL66TNxW0=;
 b=QklXeQOSfX0E7AaHxPqHF9gNIxCY8zIiBSiG6TTM40hZOxMXNptN5eLsVAouDxfqHJ
 PcpRP6cVMN+vQ5jnApG4vWIvK0xtwaiypJAZqEpjuOJckfGi9Iug0cOXgdx1Pnc1+7Ow
 aUk+H8HxC+lsSBiablFHXx5OFEIEiO+zPjYpSOG/ourKSXk0qEqV10Okxyg658nfR1xs
 UgHqVqj1ZG5wbYG5F0K+kyTYlhHrsBCwwRSNF//lPJ3qxRTEihKwMMwROtn+udu23uFq
 +QRsK/NtWi0ZiZoou7B94pLLVAkE1ZiqfAoZ513zBW4DYxIYt3xTGhAb5gPqYesem3Wj
 LNiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIWPYqdQ71O0+OkDnv6nPb9ewXCJdWk7BVoQ2mVoGdUTN2viB/z9c8u4K0zGnTVmpEDvcGPO/nfA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyIWqjk6pcH100b5HxDWP8DN6SYVqGprMjpVfs637ibXuTJwtrD
 ocVBj9vPs2dex/U6aVtuuKYLOj5iOHSCUiTNt0vQxl5iw9vmGDttPIqR
X-Gm-Gg: AZuq6aLVbHYAVeTt6LLRJ9arypd3RsYPJpFO5mumXVlnjrDPODLakNQ10RhY0CWes+H
 B20NjBE/64WJhlIhPQUOTaIzxCvBkutXAn1i7SeKPJVFXQhL2IsgFKeTgViPWDMssDX/10deS7m
 VWfrfY8SPUUv1Lf2OR7ZX+a3lcBrzQ4kb98QYPewggCUwirq/ijcgo9HDvyg/LIF+f/909sWN7B
 i0800NSdtXD54O3lj/DNG9FTobj0hOkOCd5iQ3IIvhz6B1TX3aoi0kNdE2OCJ66TwMlCUWiysZC
 mWwEzSX6EBZ9uhHllObq+UxktHKycgprBbWll/vScU3q6pIk2oZh66oJVLljoWdthy2H8dQ8b+v
 2470zVrgrQOgOoXVAJb4f7ZQcQGIwbEv7zZnbL8sHvBdzKt4Y6mOOoT5Tst3FIfQmOjQY62VQTk
 ATrCO3wh6SaItzTxAlm28=
X-Received: by 2002:a17:903:2351:b0:2a0:c1be:f436 with SMTP id
 d9443c01a7336-2a845336da4mr12371785ad.59.1769335561700; 
 Sun, 25 Jan 2026 02:06:01 -0800 (PST)
Received: from [172.16.80.107] ([210.228.119.9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a802dcdb8csm64627475ad.31.2026.01.25.02.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 02:06:01 -0800 (PST)
From: Ryota Sakamoto <sakamo.ryota@gmail.com>
Date: Sun, 25 Jan 2026 19:05:48 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-add-apparmor-kunitconfig-v1-1-e815cec415df@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqDMBBA4avIrB1I4g/SqxQX02TUoTQJE1sK4
 t0NLr/FewcUVuECj+YA5Z8USbHCtg34jeLKKKEanHGjsW5ACgEpZ9JPUnx/o+w+xUVWdBO9qO+
 8HSYDNc/Ki/zv9XM+zwtQAe6dagAAAA==
X-Change-ID: 20260125-add-apparmor-kunitconfig-28aba43c1580
To: John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>
X-Mailer: b4 0.14.2
Received-SPF: pass client-ip=209.85.214.182;
 envelope-from=sakamo.ryota@gmail.com; helo=mail-pl1-f182.google.com
X-Mailman-Approved-At: Mon, 26 Jan 2026 10:25:39 +0000
Subject: [apparmor] [PATCH] apparmor: add .kunitconfig
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
Cc: Ryota Sakamoto <sakamo.ryota@gmail.com>,
 linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[24];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:sakamo.ryota@gmail.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:sakamoryota@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sakamoryota@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[sakamoryota@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.ubuntu.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[apparmor];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: D120A86DC8
X-Rspamd-Action: no action

Add .kunitconfig file to the AppArmor directory to enable easy execution of
KUnit tests.

AppArmor tests (CONFIG_SECURITY_APPARMOR_KUNIT_TEST) depend on
CONFIG_SECURITY_APPARMOR which also depends on CONFIG_SECURITY and
CONFIG_NET. Without explicitly enabling these configs in the .kunitconfig,
developers will need to specify config manually.

With the .kunitconfig, developers can run the tests:
  $ ./tools/testing/kunit/kunit.py run --kunitconfig security/apparmor

Signed-off-by: Ryota Sakamoto <sakamo.ryota@gmail.com>
---
 security/apparmor/.kunitconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/security/apparmor/.kunitconfig b/security/apparmor/.kunitconfig
new file mode 100644
index 0000000000000000000000000000000000000000..aa842a0266e9d33c3333ec2ea180206187b0eb4c
--- /dev/null
+++ b/security/apparmor/.kunitconfig
@@ -0,0 +1,5 @@
+CONFIG_KUNIT=y
+CONFIG_NET=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_APPARMOR=y
+CONFIG_SECURITY_APPARMOR_KUNIT_TEST=y

---
base-commit: d91a46d6805af41e7f2286e0fc22d498f45a682b
change-id: 20260125-add-apparmor-kunitconfig-28aba43c1580

Best regards,
-- 
Ryota Sakamoto <sakamo.ryota@gmail.com>


