Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOuTEu5ni2kwUQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 10 Feb 2026 18:16:30 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D99AB11DC35
	for <lists+apparmor@lfdr.de>; Tue, 10 Feb 2026 18:16:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vprLU-0002mV-OT; Tue, 10 Feb 2026 17:16:16 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mpellizzer.dev@gmail.com>)
 id 1vprLT-0002mN-Ip
 for apparmor@lists.ubuntu.com; Tue, 10 Feb 2026 17:16:15 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-48327b8350dso36793925e9.1
 for <apparmor@lists.ubuntu.com>; Tue, 10 Feb 2026 09:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770743775; x=1771348575; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AMHj8ip2bDcru9Om4PYAVrUfxZXZ6ZycN6CABi5KwTU=;
 b=Bq5D6k0WGuRASPQYFOjlCAACDatblPu/eQM+Ubz/sMcaCPe4777jmBmHM3WNW2l/RD
 dJEaErKPc0XI0+p2BbRGH6ZX15mbdI1AxdPqgt5tKTD46fkH/bmijQrCoybTuv+EZ9Ks
 L1NbVudCoeiVGxUC1YIT2k5WQexF4gwjt+1DM9D90W0ZUFudvbGORs47Yqb79Fc000hF
 Sucp/KXP3VJPdZb/0DEzXDvgHZNYIeGujZtI2ms9kIpMgb6TkyzKA/W8jZLV8RnLdkBZ
 yjCkzijxkFlT4I7lMAiSgdifeGQZO9W4eDnA7qKpDnCH2MwtEoqxAIeqJtcLpvJ0RBpM
 H88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770743775; x=1771348575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AMHj8ip2bDcru9Om4PYAVrUfxZXZ6ZycN6CABi5KwTU=;
 b=dy2BSeJao3mNl6RmfUpgZWHkuYSaf32NhLywnact3JnAUr0hPAIa90F4yhUzDZl+1C
 HCnbq7mLLdp+TwnKx+ZtNUoabj6jMOPzcsDNzvrhaicKrDP2EMSvzAMN8walS9YcGpS7
 zdfdv/O5OjDPY8SOZ3VCd3N6ZuwL3eBqtWvc6UCOvBdJf+9kb9bxwINnmsA1IC+m0qah
 xZOEtvKOevBGRiDvImt9SibJ34sG9t1aZXMP+1rkn4vL/K240PPA/as/HRZoCewhpken
 rI/i/svKkBlbHdGedyqh6/a3fZYiRR91/dgpEPAYaoltIRP+nWnFXmj5XIe0LmYkEMXK
 phzQ==
X-Gm-Message-State: AOJu0Yyy5KaExNoezpjNjdbSz/HRebyNpIBnQjgCW4pB6PVOwJNa+fFJ
 Blh9kVrKD8k8O/EQDrZXh27v0v2yfqYp0pnoJDWbWO55Ws4lGobSewMK
X-Gm-Gg: AZuq6aKQ8TsyjzLgIGKyIIyWU1ue/XWOly2G1ZOAaADleuslPDBLtvdyJSLH6h+FAyr
 1mJG1BhlpkU76ffTxTBS2N3AVGs9W5ZTzAtAEoTgm/7T05o5KvhhQTfrdFT+OA7JTuLpDTJQ+41
 FK029axUstn45VZAaxUaxdIdeAc5aimdalU84aJ+OMFhi8nY6Fb95ThcEDU9kSiTKmDOVbf+Zzu
 fpwVJke9e3JeB9cG9Vze8+rbOKgUhEIUCbWDqfpjvX1vKlphi+cQlA85kRxpXURL2sD5i5s2sH2
 sA+rRSYKy9+X0rBTXgT8iyVtaE5nzZCsBgoQfl3BFh9x+VWTGBzZiuAB1HAQd6+HAdYqTtZkbnj
 GXmHi8RRSXJkT7ASkCTzdagw7Ft00sO66IqrND+lMF4uGZKpZ90LOGqkdCfmzXn5vqBWylQ3XK2
 dGydb4Y8p3KHa4/Fqor+mh83ZNMhkhU0lBB0URI5X9i22xTrPTjZumVfy0eadFAQ==
X-Received: by 2002:a05:600c:6290:b0:47e:e78a:c834 with SMTP id
 5b1f17b1804b1-48320226676mr252050135e9.34.1770743774563; 
 Tue, 10 Feb 2026 09:16:14 -0800 (PST)
Received: from geekom-a8 (net-93-66-82-32.cust.vodafonedsl.it. [93.66.82.32])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7f1e4fsm97562565e9.15.2026.02.10.09.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 09:16:14 -0800 (PST)
From: Massimiliano Pellizzer <mpellizzer.dev@gmail.com>
To: john.johansen@canonical.com
Date: Tue, 10 Feb 2026 18:15:38 +0100
Message-ID: <20260210171538.534950-1-mpellizzer.dev@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aYmsYRgv3VClpkjX@stanley.mountain>
References: <aYmsYRgv3VClpkjX@stanley.mountain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.51;
 envelope-from=mpellizzer.dev@gmail.com; helo=mail-wm1-f51.google.com
Subject: [apparmor] [PATCH] apparmor: fix signedness bug in unpack_tags()
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mpellizzerdev@gmail.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FROM_NEQ_ENVFROM(0.00)[mpellizzerdev@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,linaro.org:email];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: D99AB11DC35
X-Rspamd-Action: no action

Smatch static checker warning:
    security/apparmor/policy_unpack.c:966 unpack_pdb()
    warn: unsigned 'unpack_tags(e, &pdb->tags, info)' is never less than zero.

unpack_tags() is declared with return type size_t (unsigned) but returns
negative errno values on failure. The caller in unpack_pdb() tests the
return with `< 0`, which is always false for an unsigned type, making
error handling dead code. Malformed tag data would be silently accepted
instead of causing a load failure.

Change return type of unpack_tags() from size_t to int to match the
functions's actual semantic.

Fixes: 3d28e2397af7 ("apparmor: add support loading per permission tagging")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Massimiliano Pellizzer <mpellizzer.dev@gmail.com>
---
 security/apparmor/policy_unpack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index e68adf39771f..dc908e1f5a88 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -835,7 +835,7 @@ static int unpack_tag_headers(struct aa_ext *e, struct aa_tags_struct *tags)
 }
 
 
-static size_t unpack_tags(struct aa_ext *e, struct aa_tags_struct *tags,
+static int unpack_tags(struct aa_ext *e, struct aa_tags_struct *tags,
 	const char **info)
 {
 	int error = -EPROTO;
-- 
2.51.0


