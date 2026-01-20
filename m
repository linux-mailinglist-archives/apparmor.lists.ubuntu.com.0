Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2I3kHsQYcmksawAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 22 Jan 2026 13:32:04 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC4A66A9D
	for <lists+apparmor@lfdr.de>; Thu, 22 Jan 2026 13:32:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vitqr-0005Bk-SS; Thu, 22 Jan 2026 12:31:53 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <foster.ryan.r@gmail.com>)
 id 1viD3u-0002si-Dz
 for apparmor@lists.ubuntu.com; Tue, 20 Jan 2026 14:50:30 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2a0a95200e8so35705765ad.0
 for <apparmor@lists.ubuntu.com>; Tue, 20 Jan 2026 06:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768920629; x=1769525429; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B8hFGxkidyH1x7WVOh/MmDC5refkrkaMi3SKwdLwH6Q=;
 b=URD0Gy0ioW7U2GkvGSfxOKxBXYcn6/BmUpG5NyBWzLOl2ZmoJ7dccfFWzqfp/JcAFP
 J5pxmiKHa/13FA5UXnXh1PnC0PEh6AV+cMGlX1ea+C0W+uQiPTkmcl1VijZ0zJeiANuH
 Vz140iwrRep2JNgge3X7DgpJfWub/yXPtJovhQeOBl6ueOlTDZM1Txi9HsFXjaWhK8i1
 CipSJCoKgQc7i6yasx8ttCMyTns4mzpr4XnFG3VsgUbe01kYn559QVOr046L+Fxps58z
 dsR3WO+Qb9nphnpj9WJf/qZUUbFuFujMGx+GQFu73vStRMC0DUN+MpjgmypljmT3M3Tc
 OvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768920629; x=1769525429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B8hFGxkidyH1x7WVOh/MmDC5refkrkaMi3SKwdLwH6Q=;
 b=rJdtLNl6dJC/h4RpiZjMJDVOYQ+ekdupoG68O23syFhD4ZJVFqsikWJAEqaStUtKiz
 vQIJLlJABP2qCK30bPdase6V1K95zzG2ha2pN3+mpCKc44NN0U108BLJairgJwUKgrVK
 o0xDR7JbBSSu9ugIu7k4/zcqec5ZGH0foW4o68wVBoapYziPtzHINXPF3+XO4o0yk3it
 HC2Bxbg2wnh+EfmWAvdIqIpcdyghBCqUfvk4sqnjnYt9QbprO23sbqPNX4OsIGPlt6Hp
 en/vSCJ1KF0FznuGhqE5XQHPUU10rStCvcPtM4t5iHfVAZ9gD7hwcqHZB3dSK6THj+zR
 Qa4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRhswKX69Wi2r8V1r72+vzEWjnbAlWvNzn8F3/EdBCBWHeo6wBXMD/G4FTe8+IBKoJSMqWcj7LQg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwtGUR2s4PpWGYyMWCSTXU52t0XCCtOupyeGD2a0iUcJGhS/uP4
 JnTY8DE/qWkNd87MZpmt+g7pUgbdERD7WaKXeHQ7x21sIw+tfFZFwyvH
X-Gm-Gg: AZuq6aJK4lX+rpN1GVmZoH4JSEvqS0q/8pc8YrRcLK+ZAnnls8BW+1QKK5y1LMCSkkI
 59a93hPSII/YajO6Ed4l84V1NpN6SONwf8ne4s4u6EFN68ltjFzAg8d10gUvTyULPbPJ8TtFslf
 x7LQIi7/1dpM/nw2uHFpkfaQMW8CI5DtsxeDPIiGsD13GAenkFl1HdIsZ2HQAjiqREuJG6xwpLC
 9F/4OE9sDBxUNdyTkXCmw8Csc1kCoEax/AlhHaWe5Eh5dG2Wgtvmb5+cUSdMtlmKCzF1Gv5EQp8
 zm3KLyZyiYxM16b6X1InvQ3LwUwPeG74P4pmtDINDaMVddKPs31Yqsib7lvMxtvU5VOItXlG6fX
 gvwUtxRK0myDrlFJTfihcotLCO+DJxBW57Mgn5MzfRMeypjv7EshzYSuOPWOjBe6NmgcN/3MZ9O
 FHLGPPP+BpE8Rw3QUhV5+2A83cLze+wWFpFXCNVTqF96rHVlyKUeaN
X-Received: by 2002:a17:902:cf41:b0:29e:c283:39fb with SMTP id
 d9443c01a7336-2a76b16a396mr20182525ad.52.1768920628516; 
 Tue, 20 Jan 2026 06:50:28 -0800 (PST)
Received: from kailas.hsd1.or.comcast.net ([2601:1c2:1803:3ab0::2e2b])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7193dd523sm127679975ad.62.2026.01.20.06.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 06:50:27 -0800 (PST)
From: Ryan Foster <foster.ryan.r@gmail.com>
To: john.johansen@canonical.com
Date: Tue, 20 Jan 2026 06:50:24 -0800
Message-ID: <20260120145024.261806-1-foster.ryan.r@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.179;
 envelope-from=foster.ryan.r@gmail.com; helo=mail-pl1-f179.google.com
X-Mailman-Approved-At: Thu, 22 Jan 2026 12:31:53 +0000
Subject: [apparmor] [PATCH] apparmor: replace strcpy with strscpy
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
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, Ryan Foster <foster.ryan.r@gmail.com>,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[45];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:jmorris@namei.org,m:linux-security-module@vger.kernel.org,m:foster.ryan.r@gmail.com,m:serge@hallyn.com,m:fosterryanr@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[fosterryanr@gmail.com,apparmor-bounces@lists.ubuntu.com];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[paul-moore.com,lists.ubuntu.com,vger.kernel.org,namei.org,gmail.com,hallyn.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fosterryanr@gmail.com,apparmor-bounces@lists.ubuntu.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[185.125.189.65:from];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1DC4A66A9D
X-Rspamd-Action: no action

Found by checkpatch. Replace strcpy() with strscpy() for safer
string handling per KSPP recommendations.

Two changes:
- apparmorfs.c: gen_symlink_name() uses tracked buffer size
- lib.c: aa_policy_init() uses exact allocation size

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Ryan Foster <foster.ryan.r@gmail.com>
---
 security/apparmor/apparmorfs.c | 2 +-
 security/apparmor/lib.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 907bd2667e28..f38974231df2 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1614,7 +1614,7 @@ static char *gen_symlink_name(int depth, const char *dirname, const char *fname)
 		return ERR_PTR(-ENOMEM);
 
 	for (; depth > 0; depth--) {
-		strcpy(s, "../../");
+		strscpy(s, "../../", size);
 		s += 6;
 		size -= 6;
 	}
diff --git a/security/apparmor/lib.c b/security/apparmor/lib.c
index 82dbb97ad406..7cb393f91a10 100644
--- a/security/apparmor/lib.c
+++ b/security/apparmor/lib.c
@@ -487,7 +487,7 @@ bool aa_policy_init(struct aa_policy *policy, const char *prefix,
 	} else {
 		hname = aa_str_alloc(strlen(name) + 1, gfp);
 		if (hname)
-			strcpy(hname, name);
+			strscpy(hname, name, strlen(name) + 1);
 	}
 	if (!hname)
 		return false;
-- 
2.52.0


