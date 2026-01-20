Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id I3AQFQvYb2kKSwAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 20:31:23 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2444A71E
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 20:31:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1viHRW-00010I-Sa; Tue, 20 Jan 2026 19:31:10 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1viHRU-000104-IQ
 for apparmor@lists.ubuntu.com; Tue, 20 Jan 2026 19:31:08 +0000
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 696503FBDA
 for <apparmor@lists.ubuntu.com>; Tue, 20 Jan 2026 19:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768937468;
 bh=RlWWnxcx+7S/ZPnCsvCSgGucUIQO8rpn0wP//wj4hLI=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=MHBNWkfZQWgVArWGIlWr1aeb+Xzoy3//lSyzxvAafIHOIuvWDwZpw1tmTeBE1I0G6
 xX7qPrjUzcDvxtUgnziOOZySdc+Q4zqzxnMD/7wAKFgwz3Vn+p5X3DO8jMzA3wVp17
 MtxQBCqNO8WGAJfVCxldSFDjOp7Rtxvt3r9r2VgPHx7otcwBleztFfrXKY3BZZe0OU
 /cTYJ9edPX2PZMseAGG7ewvO1y8XSFjqHqU/iMxAu1J/rxfyWJop514yU4V/pEjz8N
 JnhRHoXL5CM6HSw7NYw7ibH8tS3txWtEChhmqcvEIvD7LEldwmReDNKRQaVJ/tVThr
 cnt2hO78BljcyW5EXowVIvPZGTyOzKNwb8993XVa98NsLERYIRdHxN9f2e4py/0/Tk
 2eyunnbSR/outNqK2NjAMA785cSmTicwKYe8apcxwqLZrbDpcQWuLrecE8XaDnVtPT
 HfewHlhgElnREy9WGqMKvM2R6oM8kG5Sgj69XvC7HLNsIzQr3228XHOzemkUqhTptS
 4Gt+SXc5+2Dkvla4wxhhejZ197G7ZooDEcXeveJqzLKR7XjR0JZ9snIbSHqf/F4ZZb
 VL8mynlVy0N1NFrkg6W72jYRIdq6sEh2MkLNCFGOtAEryfOPszyGLswsmEMQp9P2G4
 PWu/D8UfCQSqC1M0FXi+P3rI=
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2b6e793cc0bso2082103eec.1
 for <apparmor@lists.ubuntu.com>; Tue, 20 Jan 2026 11:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768937467; x=1769542267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RlWWnxcx+7S/ZPnCsvCSgGucUIQO8rpn0wP//wj4hLI=;
 b=co76Igk/s3hlgmqOFFk3p2BVPEfz7/3oremFiwgGa3PxG60e+RTCVq63VXwWBIAF8Z
 6Q5Ki2QsR0yGndahULMhPQ/gNXCjAk8y6DtJ8wctQfcgk1NqC4ZVauqxycP88NSvVl94
 +rMHcWLkea/xAJaIPvURkuStEshEibnTyqCjVMc0qwMnuuiztAz7qnIy0AQCxe++cFTT
 sx5jVD70fOeO3blJ2ioh7TtoJ46tCmHlW2YyEBHD/eTwzOkrKaKUwCJ6AIkBBl3cHBYy
 g+ilb6EkclD2JwON7UHDLiVeFrQPMzJoAH0yYaEhTZR7YEbf7ibVUIYaw3sZMklKbbOD
 RM6w==
X-Gm-Message-State: AOJu0Yy/AL6oXrzDFWpMfIqQK/coF+B1sQyBf7HYa6R20w2Ot7TYK+l0
 lpkAo5NpiAzFpnt5+i/o/0/ILzYrr5whelQYvNTfIlFr33dWlm0z8mwpDmcxdBCA6Yy5rG9Iwbp
 i7ktxeqSwXuxJH5zT3AlL/yENzu/QrY/Iy+EnD93RLT4X6APPkMhgapfmQ3nEqMmLMzf313S+f5
 4LgM7YQkJxXg==
X-Gm-Gg: AZuq6aJmUTL00URprcjwbaQ1Cg9hrQoWkU5mywJ2ZtkP86YaUh63OYQZU+guumH4HOx
 m64ltRmk9llLdGcRc6sWa7RwZkbNK6U0vIddPt+v4UZBwHn7JQC1KcM+6Uagr09vPYw3LZxLrWU
 HR/4Y2RTrx+L05hjU/EMsH9eQs5wAoEu52OHrtZuP1hd2eGkAruWv5O0UyYDZP7fhrox9GMSD0i
 U9a8Tessew4LSO7AMNKw+ZXj8/CAw6P5mBXTVFCFvMxW6+tqR+kUrcT7+uOUsvlIasc9a/FytxR
 cI9BmC/kBiszQRi+XO7vNTJi89sT9nQcvLU/bj62EccyMU35MKq4JY+EMplA4vlPCbT/b36DdLQ
 6uX4CNPUcm2496mz4TtO5AcBVqttmxh1kKghaQ5J+XCrZ/xIaHBAsd7bqZjzNNakEZ6E=
X-Received: by 2002:a05:7301:7c0e:b0:2b0:4c12:d74d with SMTP id
 5a478bee46e88-2b6fd746d53mr1871451eec.15.1768937466612; 
 Tue, 20 Jan 2026 11:31:06 -0800 (PST)
X-Received: by 2002:a05:7301:7c0e:b0:2b0:4c12:d74d with SMTP id
 5a478bee46e88-2b6fd746d53mr1871427eec.15.1768937466071; 
 Tue, 20 Jan 2026 11:31:06 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6fc2820a2sm3641399eec.35.2026.01.20.11.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 11:31:04 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue, 20 Jan 2026 11:30:48 -0800
Message-ID: <20260120193050.78700-3-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120193050.78700-1-ryan.lee@canonical.com>
References: <20260120193050.78700-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 2/2] apparmor: use
	adaptive_current_label_crit_section helper in common_file_perm
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
X-Spamd-Result: default: False [3.99 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[apparmor];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[]
X-Rspamd-Queue-Id: 3E2444A71E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

common_file_perm can be called from both non-atomic and atomic contexts,
so select the atomic or non-atomic version accordingly.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index a87cd60ed206..834f91cb3278 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -531,9 +531,9 @@ static int common_file_perm(const char *op, struct file *file, u32 mask,
 	if (unlikely(file->f_path.dentry == aa_null.dentry))
 		return -EACCES;
 
-	label = __begin_current_label_crit_section(&needput);
+	label = begin_adaptive_current_label_crit_section(&needput, in_atomic);
 	error = aa_file_perm(op, current_cred(), label, file, mask, in_atomic);
-	__end_current_label_crit_section(label, needput);
+	end_adaptive_current_label_crit_section(label, needput, in_atomic);
 
 	return error;
 }
-- 
2.43.0


