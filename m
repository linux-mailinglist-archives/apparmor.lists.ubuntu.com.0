Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JPpD5szAmrSowEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 21:52:59 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A451546D
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 21:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wMWgP-0003AR-Ph; Mon, 11 May 2026 19:52:53 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1wMWgO-0003A3-BL
 for apparmor@lists.ubuntu.com; Mon, 11 May 2026 19:52:52 +0000
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-8d67a483d3eso524263885a.1
 for <apparmor@lists.ubuntu.com>; Mon, 11 May 2026 12:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1778529171; x=1779133971; darn=lists.ubuntu.com; 
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=DkJDSYXLDBh3wMcKjMLlLmxdhkbb1kc+xmdwPKDFOfA=;
 b=feyejZDbvbnfOOvdLrKQRbtkek2iNDq0p6ishIRh4nhuED3URiFijL5n7DVRLsf7Mv
 mTurgTcivdbpL9icfZcm/rwqQVXyFTqvvQF6VTcfnoWcV6zrpgGIDvfkZc2wtpQ2lK9/
 WQ/D2gt+NJb91WRKP5b10jj7RCXlabUS1fYFa2lleiYWXb5ZD19qQ3IrbM3HewMZWQXl
 jlbThGtabsswZlzcg1Bvl0bUsDcqO8bBqlsH7hV4S0fKdqr2xEx+4WAxZ7J1apNNc8ZN
 b+3ZIdSb0LHLvA87t4gPfgvwgijktMoizPB0ZWNZ9q38w5sx4d3Z+6a7rVSkc3tjctmk
 Fbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778529171; x=1779133971;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DkJDSYXLDBh3wMcKjMLlLmxdhkbb1kc+xmdwPKDFOfA=;
 b=XmHvUDI8rQRuZGVNuFukPZJm+JlfHmfIJzcvysd7JjyBA2SBIbp2K6Vcv0YD8wIaOF
 BVIdr2D6ZX2Mnih/xMEHD6oKve28jeXyNYRnzvFZV5YIK7XrqlziVl6MORFBDMApZlj5
 SvqAtfgBpYsgZY6mjVIeXe9Pgr4ozy1fxvVNVpWsmfzCuHprCFa2k//x0bXy6OJWbJDd
 pt3arkR9ZhRUwHfyoIxvAcRCzTjsuO5EG8ht0tZz/wEpyl/NC8mJvG5UKLufu4jlA/g9
 4rbNsS6d4bBfl3oJbWSnmqqjHF1ZLYOP9S5CsP3SGApA5nJFq0q0cNzgQRZHqY2nZHGB
 GaJw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8q20/MCKUmFjHo7BOBG1q4ZqNAEJTfO01wfwE8fXXAIE2P1r0u/NDMUiaLPbx8qG0tDj2q5DogSQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxRyWOvPSXAYX6kK0jqIOiVBlwmZLlVAGFz52TO0a3eVzeSkTLt
 9AoME7e+1Qpnn1vWHxkLi4EFnwObGU95IbGkau1xpLXxX9fAuutQxNMiHUs/reywqw==
X-Gm-Gg: Acq92OHPTtsfb9qsT67TyhCMron98t21Ayz/L92iRvRSSIsxzwJJut2MM/ZekFlgoT2
 47+LvRmTfzhSyR1+i5gb166NBBiqFOaXaq3nGM1oXUGMMXPykP0sGs5W/8xqGGUbDVAlkzN8NxT
 YwQ7qvGAJDmwrvohf3zqS7xyjni84MXkTGwdR1weZ65r//bArsC7fZ/fQJjnFrrJl+uZO2THygT
 tpMCWBN1dKg8yqi+w/bhg+HY29CFiP7XDBcLV8g+VkO3HGT1DrtyuVV1BKtKTC31cllClxCxk6G
 cEc2zT0N0Vpg6AIrdhiV2jWp2PqAPkDpJcq1CLf6xG7LCGOgqZvjmgga8LugWddBx7DNzC6ukkS
 KrYi2a2uszQI/QFOMzIEMsf1Ra6oEnYSkLTZyxJeDfyfng0Tsi4Mm+as96Ey/BSRZzPyG6EUVFg
 sR5oDDuNCBCrdL6I83mtQ/AJfrXVqzaeDY0w2wGJXP2M4+g86xZeXylj9DelFJHxNsFzm2uDFGi
 Uu34vCEP9CmYHg2nQ==
X-Received: by 2002:a05:620a:2954:b0:8ed:d6df:c778 with SMTP id
 af79cd13be357-907badfc044mr2333240085a.37.1778529170980; 
 Mon, 11 May 2026 12:52:50 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net.
 [71.126.255.178]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-904f810e354sm1742542385a.45.2026.05.11.12.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 12:52:47 -0700 (PDT)
Date: Mon, 11 May 2026 15:52:46 -0400
Message-ID: <eb3d42b49940d9ecdc4ef384989d8f8d@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260511_1539/pstg-lib:20260511_1103/pstg-pwork:20260511_1539
From: Paul Moore <paul@paul-moore.com>
To: mic@digikod.net, gnoack@google.com, Song Liu <song@kernel.org>,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
References: <20260509015208.3853132-6-song@kernel.org>
In-Reply-To: <20260509015208.3853132-6-song@kernel.org>
Received-SPF: pass client-ip=209.85.222.176; envelope-from=paul@paul-moore.com;
 helo=mail-qk1-f176.google.com
Subject: Re: [apparmor] [PATCH v3 5/7] landlock: Convert from sb_mount to
	granular mount hooks
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
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz,
 penguin-kernel@I-love.SAKURA.ne.jp, stephen.smalley.work@gmail.com,
 kernel-team@meta.com, jmorris@namei.org, omosnace@redhat.com,
 Song Liu <song@kernel.org>, viro@zeniv.linux.org.uk, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: D56A451546D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[paul-moore.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mic@digikod.net,m:gnoack@google.com,m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:penguin-kernel@I-love.SAKURA.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:viro@zeniv.linux.org.uk,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,I-love.SAKURA.ne.jp,gmail.com,meta.com,namei.org,redhat.com,zeniv.linux.org.uk,nttdata.co.jp,hallyn.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	NEURAL_HAM(-0.00)[-0.858];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paul-moore.com:url,paul-moore.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Action: no action

On May  8, 2026 Song Liu <song@kernel.org> wrote:
> 
> Replace hook_sb_mount() with granular mount hooks. Landlock denies
> all mount operations for sandboxed processes regardless of flags,
> so all new hooks share a common hook_mount_deny() helper. The
> mount_move hook reuses hook_move_mount().
> 
> Code generated with the assistance of Claude, reviewed by human.
> 
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  security/landlock/fs.c | 40 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 4 deletions(-)

Mickaël, Günther, are you okay with this patch?

--
paul-moore.com

