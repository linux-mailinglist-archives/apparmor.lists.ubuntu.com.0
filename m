Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yO/oHXl/HWotbQkAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 01 Jun 2026 14:47:53 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E28161F82A
	for <lists+apparmor@lfdr.de>; Mon, 01 Jun 2026 14:47:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wU23H-0002d9-Tm; Mon, 01 Jun 2026 12:47:31 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <rodrigoffzz@gmail.com>)
 id 1wTlxi-0003Vx-TG
 for apparmor@lists.ubuntu.com; Sun, 31 May 2026 19:36:43 +0000
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-9639d7daff3so2041109241.1
 for <apparmor@lists.ubuntu.com>; Sun, 31 May 2026 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780256201; x=1780861001; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PYDzzyBJ0elLKB0jP/bszGkmeDK9wZmW8LHbbh9j164=;
 b=ji4EDi42SzahhapY2BKO+XEJ4ZvNQ6WRBgtvTkpB/Bo26V6o8PEKoPirAEta5Lt1/K
 qI8wnHaJj65750hijE3oQfMo0RHkHkmMycqEcTr6wkfPa1cp7gCdNESNLNpZk8RVF4q+
 tCEtZPMRGOIKf9B6kUxR5wwI9nrqlzvR+TWqRLbbIKf8gnGh2Gmzu6iFhnF/MoQze2vg
 STxB9ZDRZY2fcGw53ppmRKbdfGyvYwbudJC9NP4ZTXP6SdCM0i0SJCUcF8U2x0q9ugMB
 3rj+RHcsXhQIn7L7cEe6sR7Du5bvx44ReMJcKMSW4tIp+BAwo+usJ4qxVUAhT4hLITDE
 B3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780256201; x=1780861001;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYDzzyBJ0elLKB0jP/bszGkmeDK9wZmW8LHbbh9j164=;
 b=tR0rXKo4O/n9+bTUPkR5pKZykHgz49AVpJVD5q+0qeQUYJLqKHameQpa1lhizl5uin
 Jjow3iEYVay7vwjiW4bMUrwqma88eD7V27dPw+7QC0P9tGBoGn/bRZlShYgLkn6up+Dg
 xmtaMEH0H3xXjzUI6tK2CsesDPAeXXAywXzCiTaWND6m1ZAuZwAkJKAGWfi5qlE9w2k7
 zNQTFkjEtTzxOKsGdZ0qLRjYuLg+zQjFYUSi9HbP2wWX2etb1js67wK+OCEl92qOBa8Y
 m71gfeQDAS2KF5N49dRU1FCptrtChJjqxvRQXqpEMR5I6pEWrUAOb5Mf1xUdrUbZmdCR
 63HQ==
X-Gm-Message-State: AOJu0Yw8q41N57b/l90msWei+ubYNIF5OHK1hG/SYceiLWA3GEZbZeTA
 wTXWWAwdqqIhZZ3Fwy0xJVSzjsGYLGmeDHoGWnhUJzBO7jBJDvsDNt8O
X-Gm-Gg: Acq92OHku3MRBB+IRWk+b3VQdgybk8jxJepLyyDJMOw8w3Y5o8HW3UtOXYb3qEq/VTh
 SvR5+FJDU6eLSII0sZ69ezFoJHemNGO+pGbvLM7ti/ETP69obWSS4T1b4hBD8X13VXQx4O3tSQg
 7Ik4RAYHOha3xcUJaN4yCUGbWb/1R0qfZodvXFyXvdDENG9TE/NfTo0UPQW3WB4N70W2RXRdZVV
 xzD6esx7u30NCc4fWBcJOTuvzteedMRQ50glHS/SSlJyNPLCrUQT/7Hl5Q/wAGaQcTNj272J7Cf
 3njeKZqne4qoNRMrs+32079Wxym45EZSarROV3S19Ql5cZUfXG4gp7IQcleaF4COLTspMAu2sqX
 5Fm7lpVkWV6KxrsM5YBR/f3CeB839gwK/C4KVXaumfXkwbZ5BZAApbbcstySuiScF9Cbj3Dq89/
 1KaugvJYzLthlUvKRZ8rGkYusCx4W8gA0T
X-Received: by 2002:a05:6102:5988:b0:65b:c17:70b4 with SMTP id
 ada2fe7eead31-6c66383c6d9mr3437544137.0.1780256201137; 
 Sun, 31 May 2026 12:36:41 -0700 (PDT)
Received: from dream.. ([2804:1b3:a702:ed22:1ad5:a049:6ba5:86b2])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-6c78792bc3bsm3253136137.1.2026.05.31.12.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 12:36:40 -0700 (PDT)
From: Rodrigo Zaiden <rodrigoffzz@gmail.com>
To: John Johansen <john.johansen@canonical.com>
Date: Sun, 31 May 2026 16:36:28 -0300
Message-ID: <20260531193628.286270-1-rodrigoffzz@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.222.45; envelope-from=rodrigoffzz@gmail.com;
 helo=mail-ua1-f45.google.com
X-Mailman-Approved-At: Mon, 01 Jun 2026 12:47:31 +0000
Subject: [apparmor] [PATCH] apparmor: fix kernel-doc warnings
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
Cc: Rodrigo Zaiden <rodrigoffzz@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Brigham Campbell <me@brighamcampbell.com>, apparmor@lists.ubuntu.com,
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:rodrigoffzz@gmail.com,m:linux-kernel-mentees@lists.linuxfoundation.org,m:me@brighamcampbell.com,m:apparmor@lists.ubuntu.com,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rodrigoffzz@gmail.com,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[gmail.com,lists.linuxfoundation.org,brighamcampbell.com,lists.ubuntu.com,linuxfoundation.org];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.398];
	FROM_NEQ_ENVFROM(0.00)[rodrigoffzz@gmail.com,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[gmail.com:-]
X-Rspamd-Queue-Id: 4E28161F82A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix two kernel-doc warnings:
- non-kernel-doc comment marked with '/**' in af_unix.c
- documented symbol name mismatch for aa_get_i_loaddata() in
  policy_unpack.h

No functional changes.

Signed-off-by: Rodrigo Zaiden <rodrigoffzz@gmail.com>
---
 security/apparmor/af_unix.c               | 2 +-
 security/apparmor/include/policy_unpack.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index fdb4a9f212c3..ec6018662b1a 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -615,7 +615,7 @@ static int unix_peer_perm(const struct cred *subj_cred,
 					  peer_label, &ad));
 }
 
-/**
+/*
  *
  * Requires: lock held on both @sk and @peer_sk
  *           called by unix_stream_connect, unix_may_send
diff --git a/security/apparmor/include/policy_unpack.h b/security/apparmor/include/policy_unpack.h
index e5a95dc4da1f..0399cec16fe8 100644
--- a/security/apparmor/include/policy_unpack.h
+++ b/security/apparmor/include/policy_unpack.h
@@ -131,7 +131,7 @@ struct aa_loaddata {
 int aa_unpack(struct aa_loaddata *udata, struct list_head *lh, const char **ns);
 
 /**
- * aa_get_loaddata - get a reference count from a counted data reference
+ * aa_get_i_loaddata - get a reference count from a counted data reference
  * @data: reference to get a count on
  *
  * Returns: pointer to reference
-- 
2.43.0


