Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 69TiNyAmLWpScwQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sat, 13 Jun 2026 11:42:56 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD2367E454
	for <lists+apparmor@lfdr.de>; Sat, 13 Jun 2026 11:42:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wYKsv-0006JG-3B; Sat, 13 Jun 2026 09:42:37 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wYKst-0006J9-Fl
 for apparmor@lists.ubuntu.com; Sat, 13 Jun 2026 09:42:35 +0000
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 348B13F5FF
 for <apparmor@lists.ubuntu.com>; Sat, 13 Jun 2026 09:42:35 +0000 (UTC)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c85dcdbe502so1029842a12.2
 for <apparmor@lists.ubuntu.com>; Sat, 13 Jun 2026 02:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781343753; x=1781948553;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3cNWgxOsVXXusBlgwT5EOutzJoWn3PYwrKdwFsGdgcU=;
 b=sQ1VO4NFLXbajjBwxo88aSALvpwPkC27829iDT7dG0hdIRl7j75bnGqdFNi0kufpJ6
 KD/SgOP6eBFihhuBNSzsiuXH9VEJ/+t/QWqhS0V51OVmsQa1scUavzwBaxWE8kFXcO2E
 Q6wV+NW54RzRQ1O3z6QTdmJ0UGX8rnfEcwO944NtBagPsuGAW3XejLr4BFYOW3/xVKwd
 nXmj5oNYv7rVI3PE+q6BZarf9rT/MhIEsfS3ZPwnvrH/lWpQoIIiy/E3EtUMUZkjly0f
 79tolpI2A7Fwqf98mMl+dydBQFRCe+NvVvpMe87afM9UJtxHRpNMh/TZbwaQteQ94Tsp
 XPMw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+vsBHNXKfpRu+eb8MNnMBUY13qzkYYfeqRgS8ygd/JPyDJiTC/N7oI6Ph+7LFOg6Egmd5uhUIgyg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzerQqhN7jw2LI0dOCc64szas2YFCs71g9nv7Ku4YIWDScCc6Mr
 xMl97WoObNd4VhTK8Vb4Xuy5QnikwjZvR8khHELK0xbAHaWZMl3EIwlv6e6ajh1MzzVNLqb2eCX
 r/Kcg0bf/qJNiQN0zH5D1SFj4ZpwzNlGSMpyAZy442nalANoCtXcVw4AVZP2/E9Su+f5zmrl+FZ
 FImK6bY6oygw==
X-Gm-Gg: Acq92OFT3m0GbfdJgNY5RHC167I/e4cP/poQJjGNw4VOjifO31YK7yHyxvAVdq1aKaI
 eMBTojLIBUX9cG+qYdf1YngQXLlbkNvi5a0ZnFlJ3/tjgaKfEvnJDo4XOcNrQK5Jy+J0N/8i3iM
 zXBSGf6jGJqNXQw6Wphw3C/qTg47ceHi2n88rBJ/SP30XwRceaCgurqeD1w9b/K3886H3AnkUGy
 AStuP/VwoFal5y4xvxQMwUnJrTStHRXWtTUF2zfnaXlunStuYXzMxgkmyCXTVFaWzFh80mdoUnI
 hoWT3G05cZa3DoZJNs2Qo1Pme3oXwCzjthPemiIuQ3Rt7yCHfp/5fxSnlqw8rpwfsa1txBPTonI
 8ZtdEN4zHpn0Hm7/pEjRjUbMPee+HlxndZPBo
X-Received: by 2002:a05:6a21:6da4:b0:3b1:80c7:5f8c with SMTP id
 adf61e73a8af0-3b783f3c781mr8077335637.28.1781343753522; 
 Sat, 13 Jun 2026 02:42:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da4:b0:3b1:80c7:5f8c with SMTP id
 adf61e73a8af0-3b783f3c781mr8077307637.28.1781343753109; 
 Sat, 13 Jun 2026 02:42:33 -0700 (PDT)
Received: from [192.168.192.71] ([50.47.147.90])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-c8661b5d505sm3958420a12.1.2026.06.13.02.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jun 2026 02:42:32 -0700 (PDT)
Message-ID: <c1bd4bd4-26d9-49d7-9989-2609493c2410@canonical.com>
Date: Sat, 13 Jun 2026 02:42:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Junxiao Chang <junxiao.chang@intel.com>, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260613060424.2213712-1-junxiao.chang@intel.com>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260613060424.2213712-1-junxiao.chang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: fix use-after-free in policy
	replacement path
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
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:junxiao.chang@intel.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:apparmor@lists.ubuntu.com,m:linux-security-module@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:replyto,canonical.com:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BD2367E454

On 6/12/26 23:04, Junxiao Chang wrote:
> A use-after-free issue can be triggered when running the
> following stress-ng workload:
> 
> ```
> sudo stress-ng --apparmor 0 --timeout 30 \
>      --oom-avoid-bytes 10% --skip-silent --verbose
> ```
> 
> The warning looks like:
> 
> ```
> refcount_t: addition on 0; use-after-free
> aa_replace_profiles+0xbe5/0x12a0
> policy_update+0xdb/0x170
> profile_replace+0x4b/0xb0
> ```
> 
> The issue can be reproduced on both v7.1-rc7 and Ubuntu
> 6.17.0-35-generic kernels.
> 
> aa_get_profile_loaddata() requires the supplied loaddata object
> to hold a valid reference. However, the loaddata reference count
> may already have reached zero in the replacement loop, resulting
> in a use-after-free condition.
> 
> Avoid calling aa_get_profile_loaddata() on loaddata objects with
> a zero reference count and skip those entries instead.
> 
> Fixes: a0b7091c4de4 ("apparmor: fix race on rawdata dereference")
> Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>

sorry I went with Ruslan Valiyev's earlier patch that fixes the same
issue
    apparmor: fix use-after-free in rawdata dedup loop

> ---
>   security/apparmor/policy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
> index b6a5eb4021dbd..98f84d4552697 100644
> --- a/security/apparmor/policy.c
> +++ b/security/apparmor/policy.c
> @@ -1220,7 +1220,7 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
>   	/* check for duplicate rawdata blobs: space and file dedup */
>   	if (!list_empty(&ns->rawdata_list)) {
>   		list_for_each_entry(rawdata_ent, &ns->rawdata_list, list) {
> -			if (aa_rawdata_eq(rawdata_ent, udata)) {
> +			if (kref_read(&rawdata_ent->pcount) && aa_rawdata_eq(rawdata_ent, udata)) {
>   				struct aa_loaddata *tmp;
>   
>   				tmp = aa_get_profile_loaddata(rawdata_ent);


