Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENQzC71GumlTTgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:31:25 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CD72A2B666F
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:31:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2kR2-0002Wy-GZ; Wed, 18 Mar 2026 06:31:16 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w2kR1-0002Wq-08
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 06:31:15 +0000
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B905F3F604
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 06:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773815474;
 bh=Lie/EmS0JfR2VxP0UhRSLkUp3VDngWeG1TYrbxldO00=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=UYzNtTjrafmPhEVbisMLZpK2bJJEjnbzUTjgy3HiV3Xhvg5FRMpJP2/HBWtaVDk9U
 TxRkxW3TrNM8RqsJOHeYGC8Vlgso8u3N3JAeDaKZ28ONYWZKqXTe4GePjQYpIfquhO
 51eGekUndMfTHHeLiQOhZgQPt1pFZ+S47lCuD3g4eDnYpv3yi4JVvb9HJ5pPU2MgNA
 YhHuAPvCKjST3RPjSmdvMjsvNGuxz/zW8zKHuLGl/x/tuSudV7dSnWD4U743QxRbfR
 cC9AZiDmS0EKbKMMPX1FmNxocJkp7zPGLTkG2+m7bHR+rwbvcWXCRohgtVBna7dFRb
 HLXILxBC+wd2TJNZcKiKcBmk5AXZcmW11ru+UhRSs+U2L9+8Ykw8to/5w7sK7m5cu7
 gT1PkGGFmVDI5pfKt/Fe8yw6rc1YzxQNmADntwv2E+A8smXuCiJF22caHcymJA7xzB
 fXkg4ga/jmfhOCRuC5mfqhJ27fg2AUotRPVYVAnprcOzbfF/as1OB0S9JIQ5p0VOpI
 UIBUIi9jgD08LkwILC27sh+wMq8jDX6h/Sr6aP2m10Nh43F34Da8IYrQm5HF09RIc2
 Eksrfxv9DasXBnRByIWeKgK1ws2BnkWO0s7C9Asd7sMrKgps8W2VBvh8OEM5s82NFU
 396TaDfehnEluZM/0alqPSZY=
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8299499d582so23212684b3a.2
 for <apparmor@lists.ubuntu.com>; Tue, 17 Mar 2026 23:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773815473; x=1774420273;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lie/EmS0JfR2VxP0UhRSLkUp3VDngWeG1TYrbxldO00=;
 b=Jv2J9ellMxUn2e+0geWW42IKi4cY96l6HLFHAAYLgbjJcgMTNtJNNAHQ7oiIIvxFmf
 mz1OKCejmfYaUxcH5D2iguVWGDjSgwpGJtF9diTXTaS4Ps0AeYiAsfK7HLVZRsrbXVhJ
 WSabGDdoh473i2GNPNWA76cPjueLDRZ9xip/Y3EY05bwYpkl5eJGzXwAGlhtm5AtEPDZ
 6xMKDLO7ur4CleiV9iAJCtIU5uJystns1jTTwgRTkPHJk21JMklCd1igte6kckyjyxc+
 doLnLXUCxi4ZKpPyZAz5fCS/ZpLSgqwkz7fp2KDJAGwe/eRxvQhGXv6JefIC5/M745IL
 kEhw==
X-Gm-Message-State: AOJu0YzhH1nhqaeErvoH5pmRMGFvGkjKNDYvnoZSEBeT8xyNT+9IIR5i
 6lskzwSel5MhGN5g0b8bKd85Z35SNQzOXXXrehmBX8yvG993Jcd697yUgFAqCtsEfY6+YP2qdLw
 i9mkwrWBKEco3dUlHfiFsG2qVMy9ZOhloNMR6RhFoinQ29Ghf/p8fUwlXOTgFqWKTqXUg6G1Qer
 cn2w==
X-Gm-Gg: ATEYQzxm3i/yRWTosH03X4AltkZiJmsHZvD80iTP1aGYMrCPPByLxosZNS80zwkC72L
 dP2AHJ9XHe6/FldZKYWgB35Kj9im/ASkqucemjDO5AwKlXq57tpSS4HCnRppmjLydyI8VhcPpn/
 AjLIQS7CfNQbnXrazftiKuA7jbtyKLKi9a2sTK90wU+JodNYbqxOhEryBSI46Su5bG7h+3dM1dj
 biAOFYVdFyhAqdkl+SztMUyKaUM9+w6Jq7U8Anj6I3AWpXZjYcLyFcPg3gx3zzb+bkKXw56COnS
 hlyED74I/krmQkYeNHqr+OZahsOP50w2TXxygkB3O4Aw/SHbM35YoZ1AYIUtgx6m00Ul7iOpdXG
 ILWUVNwS6MRUAJ0kATqMXN1eh2mWVjYBf3xd1Dw==
X-Received: by 2002:a05:6a00:ae07:b0:829:88e7:c8a0 with SMTP id
 d2e1a72fcca58-82a6ac7ac4dmr1663028b3a.12.1773815473312; 
 Tue, 17 Mar 2026 23:31:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:ae07:b0:829:88e7:c8a0 with SMTP id
 d2e1a72fcca58-82a6ac7ac4dmr1663007b3a.12.1773815472904; 
 Tue, 17 Mar 2026 23:31:12 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-82a6bbb390csm1528078b3a.29.2026.03.17.23.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 23:31:12 -0700 (PDT)
Message-ID: <9eb5a521-9a1b-48fa-a49b-5c8096b873e1@canonical.com>
Date: Tue, 17 Mar 2026 23:31:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
References: <20260309224150.84575-3-thorsten.blum@linux.dev>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260309224150.84575-3-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Replace memcpy + NUL
 termination with kmemdup_nul in do_setattr
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
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,canonical.com:mid,hallyn.com:email];
	NEURAL_HAM(-0.00)[-0.991];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: CD72A2B666F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/9/26 15:41, Thorsten Blum wrote:
> Use kmemdup_nul() to copy 'value' instead of using memcpy() followed by
> a manual NUL termination.  No functional changes.
> 
> Reviewed-by: Serge Hallyn <serge@hallyn.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

sorry this got lost in the mess of the last month, this has
now been pulled into my tree


> ---
>   security/apparmor/lsm.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..49aa6ad68838 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -858,12 +858,9 @@ static int do_setattr(u64 attr, void *value, size_t size)
>   
>   	/* AppArmor requires that the buffer must be null terminated atm */
>   	if (args[size - 1] != '\0') {
> -		/* null terminate */
> -		largs = args = kmalloc(size + 1, GFP_KERNEL);
> +		largs = args = kmemdup_nul(value, size, GFP_KERNEL);
>   		if (!args)
>   			return -ENOMEM;
> -		memcpy(args, value, size);
> -		args[size] = '\0';
>   	}
>   
>   	error = -EINVAL;


