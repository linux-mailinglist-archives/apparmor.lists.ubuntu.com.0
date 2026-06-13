Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZOS8DujfLGoBXQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sat, 13 Jun 2026 06:43:20 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAC67DB0D
	for <lists+apparmor@lfdr.de>; Sat, 13 Jun 2026 06:43:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wYGD0-0006hP-0d; Sat, 13 Jun 2026 04:43:02 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wYGCy-0006gI-MM
 for apparmor@lists.ubuntu.com; Sat, 13 Jun 2026 04:43:00 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7FF313F60E
 for <apparmor@lists.ubuntu.com>; Sat, 13 Jun 2026 04:43:00 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2bf30576aa3so11629335ad.3
 for <apparmor@lists.ubuntu.com>; Fri, 12 Jun 2026 21:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781325779; x=1781930579;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1HOYyX8+tMocF3FS3l+nddVyJTmFQcD0aJbjm234is=;
 b=rpSLe8bBJm3o7Zc06JXiky4hhudNEWYX2gXpZhISu4KzmeOB035r5lHGQz2d1I0J+u
 hxB4pXvzZCUejyeBBzsD9xkb6TEqb6+Qlu3yLeB7rO9H9TbKpb7Rj08a7Jh6R4VfUbXi
 4XGdPNrWxEmoO8gOR2oIuYLWwaiptjPPVSE56eEW7Z68leGoEEUQepc24E/DdF6ogGiQ
 K7tPd9f+sB+XLbK4w56LyupC4qb5JoAxuDWycpKx8skD/QCH+P7DQQT4J2tAACRPQawq
 BfTA//2yr/3D3JYCHrPHOYFQ1blblMqfrHGdwb7a/p9/3Xk+zO0VMh5u4myVYNxmW7mc
 i7PQ==
X-Gm-Message-State: AOJu0Yyx00+9TO0Noc+ns56qGPThbzVO5PTDIjVOFqhVq2ZFd42r6VdT
 vvx6o3qwB/NVay9IddIwM12bNpkyIa0y5xmMbP+jtuFV/Ns6gJxLqJODvtVnkIDxp8QfCyyFUPu
 RJGxMiYninc+7M+hW8OgfMTaAvEwVxa380h4FFOzgsja2Odu4etXC1rQ8QHkSHfn3qplLhWhRoQ
 drUw==
X-Gm-Gg: Acq92OGR3SmbJgWFuly4mxQHtfxV149XfHrpCRrlmj35AoDB3vwfr0aZUOR0obcVyW3
 3n1Y+iRWjpUoIZL9yAnpjq3elCKTvOCgGtuBQ+OqVZKaw6RUDt9RlwLIECQm78Nh7XKI66VceW/
 JWebOZZ4M+9z7tAagssdDLoSH6kwkwgBbYSYxiubWIB0ELsMNxPNYJOCGCSP6LD6w1J/H/RvYGe
 zrUnA6kmjeI1suCOjv41897UjAoL8w6DdXmdyhctF1VuihbVve+UdgXzusFfPgTrULstSB0/CQE
 RLKERl0azECoP+1apoj5WOBRPB8x7jWhT6jCbULwkLx6+R4uaN12uXraAupMmUvLazMD5ZZi9Oq
 Ru/CGFwo3yrjthaYpRSARIhoFp1/TqSG9pfVN
X-Received: by 2002:a17:903:2f84:b0:2c0:ccdb:e02c with SMTP id
 d9443c01a7336-2c4104114f9mr62518455ad.7.1781325779074; 
 Fri, 12 Jun 2026 21:42:59 -0700 (PDT)
X-Received: by 2002:a17:903:2f84:b0:2c0:ccdb:e02c with SMTP id
 d9443c01a7336-2c4104114f9mr62518075ad.7.1781325778474; 
 Fri, 12 Jun 2026 21:42:58 -0700 (PDT)
Received: from [192.168.192.71] ([50.47.147.90])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2c4328a47f8sm33939485ad.47.2026.06.12.21.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 21:42:57 -0700 (PDT)
Message-ID: <8b8536e2-6d44-440c-84b9-b05fcd53f3e0@canonical.com>
Date: Fri, 12 Jun 2026 21:42:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: GONG Ruiqi <gongruiqi1@huawei.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>,
 Georgia Garcia <georgia.garcia@canonical.com>
References: <20260423031056.563527-1-gongruiqi1@huawei.com>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260423031056.563527-1-gongruiqi1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor/lsm: Fix aa_dfa_unpack's error
 handling in aa_setup_dfa_engine
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
Cc: linux-security-module@vger.kernel.org, zhaoyipeng5@huawei.com,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, lujialin4@huawei.com
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
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:gongruiqi1@huawei.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:georgia.garcia@canonical.com,m:linux-security-module@vger.kernel.org,m:zhaoyipeng5@huawei.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	R_DKIM_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65:c];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3DAC67DB0D

On 4/22/26 20:10, GONG Ruiqi wrote:
> aa_dfa_unpack returns ERR_PTR not NULL when it fails, but aa_put_dfa
> only checks NULL for its input, which would cause invalid memory access
> in aa_put_dfa. Set nulldfa to NULL explicitly to fix that.
> 
> Fixes: 98b824ff8984 ("apparmor: refcount the pdb")
> Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>

sorry for the lateness of the reply my mail wasn't working when I pulled
this in for 7.1

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/lsm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..ead2f07982b6 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -2465,6 +2465,7 @@ static int __init aa_setup_dfa_engine(void)
>   			    TO_ACCEPT2_FLAG(YYTD_DATA32));
>   	if (IS_ERR(nulldfa)) {
>   		error = PTR_ERR(nulldfa);
> +		nulldfa = NULL;
>   		goto fail;
>   	}
>   	nullpdb->dfa = aa_get_dfa(nulldfa);


