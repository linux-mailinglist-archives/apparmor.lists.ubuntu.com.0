Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH7kGQrYb2n8RwAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 20:31:22 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574E4A703
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 20:31:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1viHRU-0000zs-5Y; Tue, 20 Jan 2026 19:31:08 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1viHRR-0000zc-Qy
 for apparmor@lists.ubuntu.com; Tue, 20 Jan 2026 19:31:05 +0000
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A8E4D3FE2E
 for <apparmor@lists.ubuntu.com>; Tue, 20 Jan 2026 19:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768937465;
 bh=tmx3aE+4TVgjYMLOnZg0NKcvqL0OpT58huPg/GHB474=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=nd+omYAtnF2zMDRwtQ44VbmhBvlB+6IQaaInQILeaP0Tl+sf5jQjlOtVb3QLr9syd
 zDeAU7b0IxhDxIn+0q7K/71Wcs52BZPFuiSsWv9ZBVqS6KMJHSqrxwPfvNYBLqMDKN
 wBnQ2oCozAhXMUfJp0AmQ1AzotKIEb2PMRvcZceXxZ1UiTFystaoum07CX1MiozlkH
 uN6nZXNsMmRBc6ezvT7XfQJfCSSUcVscYe4jayFC/bHZWu36ml0POT+VyiN2IRTrVf
 LhamAF1DqP97PBWxLaDf30t70+vKZ+h7RguRBdcwBe2oXvW73e0/CZi2e69KoPhqvC
 TXuD9Z4mrvRX0v1tL1MiTnWkX+fmZStQKxrB6ALmIFw9bQr4iZMdhExblZiK2bo8pP
 td4hgbuZGSqnl59Ox+QyprQVQCbRfjs8SAFwtNX0HyFRjbH88LajtBk8m/LFxUXzeG
 glKjm3oVwhUQVIws9Omdfe8ePzNpJpvD2aO5VIfESjku+ICft2Y7zMsroHudyeBrgS
 cgwuVJ5sPtMTWWNvjCh6NUH8pbuFac3QZ0c3i1MuVD8Jl4SU7I56xQnCGSAqIf1EqH
 4D7alOzLTIrIe/mr37QLARqseEq2Qec4ZLDzbg7SWPR3ha65W001GlR+l2lOFIfXy+
 kwiczcC0J7qbJ5KSUuh+9CaM=
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2b6b823d819so4687256eec.0
 for <apparmor@lists.ubuntu.com>; Tue, 20 Jan 2026 11:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768937464; x=1769542264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tmx3aE+4TVgjYMLOnZg0NKcvqL0OpT58huPg/GHB474=;
 b=C4Yt16GsSlqFS9+xhtExScAc+WKY4eBt89E3TfM5hupeO2kYY4dzFRF6Mo5nqaFXg6
 MdZ7leau5L3egbG9hiVnJgE53/vTWWt+J+8E1fMqJ3lZ7c22T13iFMe0DtcePp2HbEVe
 vJQHz1ftFvIO3wQI2eEsMb4mu43KzY5YaiMcgfac/dRkDzZgcSJZXITMlbeJRtmiU8PY
 umnabLiz6pgtMBcGQmKJMAcPBdVEl/gmTDwxTDu53/ruwB30CbLrzucgDgdbf2mbm+/j
 +sZmpMxW9Qb2H/FSI/iZFIUAiElfFfAsdBj2TGc2etr9RWcFy7TZqiIfr43WKOJEH44l
 RRXw==
X-Gm-Message-State: AOJu0YwSuYEIpoVUVjBbQPhpdD6XFFZoPW8cZrZuu1yjqRExnZjImRQ2
 NUxGxhjCI4rxZ6h08QR59GtUAOKdi15fZGcawdN6NjX7hWLFwwV4VyQhjAlc37KLkVWGkG2Vaxp
 FpIn5staWmLSzip7xuf0eR2u/+HH/B6OVdUqMPNFKUV1QybwAFA8Aa8mYyvhl7LvP3P2wj5HRt6
 qZKWeehsyHtQ==
X-Gm-Gg: AZuq6aIF4edYwvNcircp9LJvDfOW+WK51lzZvJzwemdNraxOdsohkc00kNvugP2UiaL
 mTSghyPWeUh6GuobLL8vT2V66BOpfCm+Q2YYedKbhVGHQalXMwwqy5U1LV3rzqXpI8S/orlQCPB
 hgFpt4uPVxTuswAmPsZaq8pLk5NICOF+vreILr1PGzNNTA2SQiqGer2KBgu/i/XKwcmIO/DwNh3
 zEQw3Z/eXMBP3fXljB7xfjMSlSYzG6u/vtZ+C0UbyKhcc+uvoMNJUxhErZdvxRara41Y/AcY69E
 Y4pfm0dJBWH2JAS0gVnpcx6gyUvmuScJETeZ9JJSr6b6lxnXmNAljkYgj4T2qpLfqHlpByUPlZ/
 jlYYZZGEWJ5aqSlbubkCQIOzOgoAIJrZ7LGEUf5vtQ/1isB0Z1Kj7Uwgv+PUsci6wn2E=
X-Received: by 2002:a05:7301:1286:b0:2b0:59f9:aed6 with SMTP id
 5a478bee46e88-2b6b3f182cemr13826072eec.9.1768937463089; 
 Tue, 20 Jan 2026 11:31:03 -0800 (PST)
X-Received: by 2002:a05:7301:1286:b0:2b0:59f9:aed6 with SMTP id
 5a478bee46e88-2b6b3f182cemr13826038eec.9.1768937462141; 
 Tue, 20 Jan 2026 11:31:02 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6fc2820a2sm3641399eec.35.2026.01.20.11.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 11:31:00 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue, 20 Jan 2026 11:30:46 -0800
Message-ID: <20260120193050.78700-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 0/2] apparmor: conditionally use atomic
	_current_label_crit_section in common_file_perm
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	RCPT_COUNT_ONE(0.00)[1];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Queue-Id: 0574E4A703
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

common_file_perm can be called from both atomic an non-atomic contexts. In non-atomic
contexts, we should be using the non-atomic forms of the _current_label_crit_section
helpers. This patch series introduces and uses a helper for this purpose.

Ryan Lee (2):
  apparmor: introduce adaptive_current_label_crit_section helpers
  apparmor: use adaptive_current_label_crit_section helper in
    common_file_perm

 security/apparmor/include/cred.h | 38 ++++++++++++++++++++++++++++++++
 security/apparmor/lsm.c          |  4 ++--
 2 files changed, 40 insertions(+), 2 deletions(-)

-- 
2.43.0


