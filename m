Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B8KNDUjoLGq/XQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sat, 13 Jun 2026 07:19:04 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEED67DBD9
	for <lists+apparmor@lfdr.de>; Sat, 13 Jun 2026 07:19:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wYGlT-00032s-PL; Sat, 13 Jun 2026 05:18:39 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wYGlR-00032k-Ux
 for apparmor@lists.ubuntu.com; Sat, 13 Jun 2026 05:18:37 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C704D3F1E4
 for <apparmor@lists.ubuntu.com>; Sat, 13 Jun 2026 05:18:37 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2c2c98c1be2so12805465ad.0
 for <apparmor@lists.ubuntu.com>; Fri, 12 Jun 2026 22:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781327916; x=1781932716;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5w6ewO07vly9Rwb9SBql/I+2bUdVBxWRyNXeJC+MmEE=;
 b=IXRJClf4u4yNklB4dWg4PdgrrXqzFMzS8oigzo3hpQG2UQbWjYo9CoF3M+59ynZnVY
 NpLtgGssdgK906R+jbFu6WoP9ZBW/PK/RZxggSWkLenNsgrZhGOhv5YK2FZFvzLwMmRy
 3MSNQ7f4B6/OZAqMbpm+k3ccDVEzVdRbLheuBaoCGOzOls4OggYHfC1ABmSKsIrYmkB7
 dEd5JACNxmUAgeMgNfmDWMb2uiy56GheuzToteBEedDzm18E3IsE3HnJW1MY3UKl2e0s
 oRqZfrnwpInddv6sinZla4adKEMAjmUu5TKzGnM2qLRNu3akSYYP8vJSU/gFbuTp73Cs
 jb+g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+aNTD9x4Wbdf25gav/tRywBhsKmNWxj0uXpVfAlokPuIxxBivLI4OpboFOiZmng3vjkL+/+wXUtA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yxmf1x/X6IcbPrVqDNYTCGyJmjIJiPm2Xz9mFZnqSv4y7gHZN6m
 eoqnJEICQFd6pi1yCUiKR//aHd02Am9MByOmWI/tBDPAOjxA5/u75MDLPW7zKob05mIaC72UxtZ
 FH3h6P6NFBdAYpt4L3k/BZKupPI6xyNlJlI4zKTMp+cDcbFnZIAdVZsYuZ2/Xpos0a2kIgb4LTX
 Pt6kaPSIMjBw==
X-Gm-Gg: Acq92OGcJKX8m7EI77p6d19L/gI68nSrWDghZrd7WelJxLcWD9NMItRbp7kWn1YmkAA
 Hvpyvg4WE/ArTpk+dL7nDVxMxOCJpaDgu6SGP27Zopg9ubimqCQ1JKewgSuEtbO+gJA9qz7og1i
 x0oc06CmItAHyMGYFgUEDhWWWQA5pQRAcoxjq+pCz9SksDTIcyjS262uzY+jI+wrMhBBsG078wH
 H6BYkS4ioMNNBalKm2Z/ZiupjszHgOeZslpKVF6/yxUiMkvq0jvBaXy3NBXfnwLIsFgNkwx3Uye
 kxEU5YXSQKAJPWFwvXQlVjLXw2xVNeupJ8Zem/c8+d8A2QdvSrnmxAMYPOP4TcpzCZ78x7gmG72
 OuW5wtxKPPwbSsRI0h0jl9JZ5I+CwtQbbKzdI
X-Received: by 2002:a17:902:fc8d:b0:2c0:c0fa:1659 with SMTP id
 d9443c01a7336-2c413dbe166mr72066745ad.33.1781327916008; 
 Fri, 12 Jun 2026 22:18:36 -0700 (PDT)
X-Received: by 2002:a17:902:fc8d:b0:2c0:c0fa:1659 with SMTP id
 d9443c01a7336-2c413dbe166mr72066585ad.33.1781327915622; 
 Fri, 12 Jun 2026 22:18:35 -0700 (PDT)
Received: from [192.168.192.71] ([50.47.147.90])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2c432f77479sm37445325ad.63.2026.06.12.22.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 22:18:35 -0700 (PDT)
Message-ID: <77d00962-f91f-47cc-9f02-7aeef6b88a19@canonical.com>
Date: Fri, 12 Jun 2026 22:18:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dudu Lu <phx0fer@gmail.com>, apparmor@lists.ubuntu.com
References: <20260413090313.79315-1-phx0fer@gmail.com>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260413090313.79315-1-phx0fer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: Fix wrong dentry in
	RENAME_EXCHANGE uid check
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
From: John Johansen via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: John Johansen <john.johansen@canonical.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.89 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phx0fer@gmail.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.ubuntu.com];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEEED67DBD9

On 4/13/26 02:03, Dudu Lu wrote:
> In apparmor_path_rename(), when handling RENAME_EXCHANGE, the
> cond_exchange structure is supposed to carry the attributes of the
> *new* dentry (since it is used to authorize moving new_dentry to the
> old location). However, line 412 reads:
> 
>      vfsuid = i_uid_into_vfsuid(idmap, d_backing_inode(old_dentry));
> 
> This fetches the uid of old_dentry instead of new_dentry. As a result,
> the RENAME_EXCHANGE permission check uses the wrong file owner, which
> can allow a rename that should be denied (if old_dentry's owner has
> more privileges) or deny one that should be allowed.
> 
> Note that cond_exchange.mode on the line above correctly uses
> new_dentry. Only the uid lookup is wrong.
> 
> Fix by changing old_dentry to new_dentry in the i_uid_into_vfsuid call.
> 
> Signed-off-by: Dudu Lu <phx0fer@gmail.com>

Sorry for the lateness of my reply, my email was broken when I pulled
this in for 7.1

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/lsm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..e8de919fbea6 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -409,7 +409,7 @@ static int apparmor_path_rename(const struct path *old_dir, struct dentry *old_d
>   			struct path_cond cond_exchange = {
>   				.mode = d_backing_inode(new_dentry)->i_mode,
>   			};
> -			vfsuid = i_uid_into_vfsuid(idmap, d_backing_inode(old_dentry));
> +			vfsuid = i_uid_into_vfsuid(idmap, d_backing_inode(new_dentry));
>   			cond_exchange.uid = vfsuid_into_kuid(vfsuid);
>   
>   			error = aa_path_perm(OP_RENAME_SRC, current_cred(),


