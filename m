Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7sMjOOxBTWq4xQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:04 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFCF71E873
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whAIs-0007t4-89; Tue, 07 Jul 2026 18:13:54 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1whAIp-0007sL-If
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 18:13:51 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 19B0B3F600
 for <apparmor@lists.ubuntu.com>; Tue,  7 Jul 2026 18:13:51 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cca5e0a0c9so49045415ad.1
 for <apparmor@lists.ubuntu.com>; Tue, 07 Jul 2026 11:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783448029; x=1784052829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DJXaiwXtRUfiWxyi/nOAS5r9GvvY+h3/hoyJqSOq7CE=;
 b=ZWiSdoooKYBiufC4AqsCqBqcAUO4FFtLoac6eMX79ee5fIhc71Fx77akpgQj9Iwvsr
 Ksr+rcodO6xF+zcKRlaamdvQGcxB8pUkJBeYniAK2Ny/Oh7SDjpvUWcRYwWcm3X9mO9S
 6qDaoAX4nvClvZXMPrVdmjGP6ua0j49dpO9vLfyhZMhzg3AAZR+iaAjDUhj6W5mhpLbr
 wsDc755L8jJQ4hOxqX9ETZtB8D0THnD1eG7m8BNdZ1FgJ5mN3Sk1yQf9r7AgEXLrx7A1
 XD+fIRJ/voD1fbxZ4I7AVYqIMSePuHisbgaglPxbP+RC7/DjdXzrEbE2os3XYYcWgFdc
 dy9A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqsDVW4eNnHztwdHAb9Z7+OD6Py480ekWM27Narhyg53hQq7U18qOx4XmfTbtFLZ/pjH+UG8dApjQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzCPJRRQlLsaSr0WU9QE6AuCZzU+BN6xyhengmFauuEOeIzD41d
 eixqLjVWE4tw8W/T9hWI8CV6Z/pe9lpGiRobtJVmFMwbqqM5yTvfkerl3llzDtZ818BzOV2qDsu
 CVzbfJx4q4rCzlYCgnZ5BjK6LjNUim/dG5nmG/FvcwrD6l7oVAOcE3jWmWurFPRy5U5DqTxetWP
 /d/Q==
X-Gm-Gg: AfdE7clJqMy1NeCoVEqbGQVgxGxzodlBPdFux2nVtbuxJM8Q1AH3zGDhERE5EsEyncn
 iJ9jXiOWUJ/GBWQyE5LZghCdRVcCFUm+RpDpShB0GANUJTiTqkouTmMUIV/qIVYespTnvhxiwJ3
 I6ciaUgGK8pINX2K1w8xdnk80x2eu1EXhsjyjEmk4VTAdsqO3oNuloBSwB4d5RwkSFtah8pFMEW
 QKl8CSY3SH3GXqKO4bx6sa3jIO7cGpZY6t6X7SQsShXUhGIMf1t48Zam5W/M5uI9TA5b8L5NqjI
 ZIh6H246U216nyr+VNX/wymzCqQpRYKjSYARNPbofkkkX01NCdSp4fbfGxScPi39tFTsjhLDEOG
 yN3DJ0SkeZAUHInu3DELIKaRB1PuqRhYfYRRZ7uNy3/H8p8gtbchpF2MoXDX9iNJ6tNSS1xY7Yl
 Zih13ldfkPvinUymzd1sNf74k3E01u4qVaUmsVVqoWiFaUPXE=
X-Received: by 2002:a05:6a20:3282:b0:3b4:6f7e:d0f9 with SMTP id
 adf61e73a8af0-3c08ec71673mr7031405637.3.1783448029516; 
 Tue, 07 Jul 2026 11:13:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:3282:b0:3b4:6f7e:d0f9 with SMTP id
 adf61e73a8af0-3c08ec71673mr7031384637.3.1783448029201; 
 Tue, 07 Jul 2026 11:13:49 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-98-37-40-2.hsd1.ca.comcast.net.
 [98.37.40.2]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174892711sm11387097eec.13.2026.07.07.11.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 11:13:48 -0700 (PDT)
To: john.johansen@canonical.com
Date: Tue,  7 Jul 2026 11:13:15 -0700
Message-ID: <20260707181326.968650-2-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707181326.968650-1-ryan.lee@canonical.com>
References: <20260707181326.968650-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 01/10] apparmor: explain why aa_file_perm cannot
	use the condref helpers
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
From: Ryan Lee via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Ryan Lee <ryan.lee@canonical.com>
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_FIVE(0.00)[5];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	R_DKIM_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:replyto,canonical.com:mid,canonical.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	HAS_REPLYTO(0.00)[ryan.lee@canonical.com];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDFCF71E873

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/file.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index c9d55fe1086f..f42e31e8541b 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -653,7 +653,12 @@ int aa_file_perm(const char *op, const struct cred *subj_cred,
 		goto done;
 	}
 
-	/* slow path - revalidate access */
+	/* slow path - revalidate access
+	 * Because flabel was previously obtained under RCU, it might be due
+	 * for cleanup once the RCU grace period ends. Thus, to mediate against
+	 * it on the slow path, we always need to keep a refcount after exiting
+	 * the RCU read-side section, and we cannot use condref optimizations.
+	 */
 	flabel  = aa_get_newest_label(flabel);
 	rcu_read_unlock();
 
-- 
2.43.0


