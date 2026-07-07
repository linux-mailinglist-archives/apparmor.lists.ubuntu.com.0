Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bHR/NOxBTWq3xQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:04 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C05E771E872
	for <lists+apparmor@lfdr.de>; Tue, 07 Jul 2026 20:14:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whAIq-0007sV-3Q; Tue, 07 Jul 2026 18:13:52 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1whAIo-0007sE-Mo
 for apparmor@lists.ubuntu.com; Tue, 07 Jul 2026 18:13:50 +0000
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8CF003F301
 for <apparmor@lists.ubuntu.com>; Tue,  7 Jul 2026 18:13:50 +0000 (UTC)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-381d039b797so3461258a91.1
 for <apparmor@lists.ubuntu.com>; Tue, 07 Jul 2026 11:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783448029; x=1784052829;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KkwkCk9RMWEMvbA8WafdK2OditFyI+bSKP/Q8Pg9yaM=;
 b=j605dYQj/pREE5Y37JVcrRxuFobElW4jQC/UEReQb3fqx0dxAFcolZIcipTeHeNFb7
 IPMxeBL26EfZDw81AUmrYRIfP/cFJCgJCgIIOnY5TJ1EfnNKQL8YRuFqCiM8EQAML1wI
 lXJdSIB39JGwPahaOgp7HmdBsHwTXozAWEj91hQYRq1Jjx+xK0j9Kd1EHwoqWvAzOtr8
 1d30K68h2IAdfifjLeIhDgT1rwyC3JoqZZXtIKb0uuOwH/IIt+bugXCwcWJBWeOLHd6D
 ODhBJx2BRwnP7FhNwgSLcVF0jgXdYHNl1v7Vhd8m3KtF5HovucQLxTvgEi6EjwrY0Vfx
 ax6A==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro9JC14hdIwRvE4/oIXw7j9foebh7eo5YYP0auKZHywYW+va9XHYRzhUWekX9/yUS8P2auT26R5jg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzC3KPDb8LkscvRLWU3fjKDPUbP04PImtM1rAUSChwuIKjlRDZi
 eJbZmS537ftpYrl2uxOq+7qLwgfe2YkC2MslDrGyXz6d6iU9WSfRlnSoWE18z9x1IQCpUk2zDEd
 yq+FE7huAbZjEUEAp5WQbS2L4oGjbhNpMthQ8EQ78PcN4EGI6ADgKlcLlavBBZrJ/8Hpx6iNKbw
 1074Q9FE/7YA==
X-Gm-Gg: AfdE7cnpFmvxVnMgg4RAZi9Ak9JxhJfbpHsAd5diXBjBoMfdjuaYAYMyY+oYrorspwh
 Go9EqZNwS0BwXgCgXnP20u4JzP2Yq/z71fyvCdxqeoqjGGQBMPl8NcddDn/adPTGJ9k3M6U7YG/
 gMtZ0datODoly2lLVh9MZdFjQThbOaJNU2/ndtKw/SCwfH4+PJHBHyFQxS1J8UpLZOFysMmatZb
 /xmSczOQFgHpyyw00em9z5QA8+LbScpQfa84KsVwvXxkfe4g2vqsFlO1tSatB5xlTEpWYLTrBaj
 PYt/G6ITJmvIS6ag1E5RLh48vbew9a4V6AGhxK75ea7A5pEwyvDouHnnIkuJBeWlEsVutLH+bQb
 b189gutDgDjKyuDvHhqTB3tp8jwjnKTD3hIyP9uF9d6XDpjfOusuL1PYmfeaflvLgDGwYiKLuKy
 yUNAoli/rwuIQPFhiG1BbdYzKMcPm1d+FzySJrf7J00enAsdQ=
X-Received: by 2002:a17:90b:3a8e:b0:36d:8f51:fe29 with SMTP id
 98e67ed59e1d1-38756ce27d1mr5663751a91.17.1783448028804; 
 Tue, 07 Jul 2026 11:13:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3a8e:b0:36d:8f51:fe29 with SMTP id
 98e67ed59e1d1-38756ce27d1mr5663724a91.17.1783448028272; 
 Tue, 07 Jul 2026 11:13:48 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-98-37-40-2.hsd1.ca.comcast.net.
 [98.37.40.2]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174892711sm11387097eec.13.2026.07.07.11.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 11:13:47 -0700 (PDT)
To: john.johansen@canonical.com
Date: Tue,  7 Jul 2026 11:13:14 -0700
Message-ID: <20260707181326.968650-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 00/10] Refactor more aa_get_newest_* callsites to
	use condref variants
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:mid,canonical.com:replyto];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	HAS_REPLYTO(0.00)[ryan.lee@canonical.com];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C05E771E872

There are various callsites in the AppArmor code that use aa_get_newest_*
to obtain a reference, followed by putting a reference during cleanup.
Using the condref variants of these functions allows avoiding taking
refcounts unnecessarily, improving performance. Where they cannot be used
(and the reason for that isn't immediately obvious), add comments documenting
the reason.

Ryan Lee (10):
  apparmor: explain why aa_file_perm cannot use the condref helpers
  apparmor: simplify update_to_newest_parent cleanup logic
  apparmor: add aa_get_newest_profile_condref and aa_put_profile_condref
    helpers
  apparmor: use aa_get_newest_profile_condref helpers in
    update_to_newest_parent
  apparmor: use aa_get_newest_label_condref in aa_replace_current_label
    nnp refresh
  apparmor: switch to aa_get_newest_cred_label_condref variants in
    apparmor_capget
  apparmor: switch to aa_get_newest_cred_label_condref variants in
    apparmor_getselfattr
  apparmor: also use condref variants in apparmor_task_kill USB branch
  apparmor: also use condref variants for apparmor_task_kill's tc cred
    label
  apparmor: explain why apparmor_getprocattr cannot use the condref
    helpers

 security/apparmor/file.c           |  7 +++++-
 security/apparmor/include/policy.h | 23 ++++++++++++++++++++
 security/apparmor/lsm.c            | 35 +++++++++++++++++++-----------
 security/apparmor/policy.c         | 13 +++++++----
 security/apparmor/task.c           |  5 +++--
 5 files changed, 63 insertions(+), 20 deletions(-)

-- 
2.43.0


