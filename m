Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M5fE/kBg2lGggMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 09:23:21 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 051CDE315E
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 09:23:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vnY9s-0006yN-Mt; Wed, 04 Feb 2026 08:22:44 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vnY9r-0006yB-O3
 for apparmor@lists.ubuntu.com; Wed, 04 Feb 2026 08:22:43 +0000
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 846FD40374
 for <apparmor@lists.ubuntu.com>; Wed,  4 Feb 2026 08:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770193363;
 bh=fnu5fidMh9uXV7OSySPR42Ndmsbyued3h42jFd0q6Wc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=gosvyoxLJuBHrmNytQERSUh40GJYj4w7DzX3X3Q5N8xpab1yowg1nenzoDS32EgNa
 CsHO+XOunyVSg7nXHg98IDVlpeBoTIXwLv8uy0n38hJd1hhLJyhTr+AHViuFWc0UPD
 iegeAcibd/bUSYxVjs8q+Y6kfcnYacgfVkF0qyX/oX8LPqWgaP1X4uHguAlgOn2ygu
 2mBLTn3zxn5sNec4RyW2FFLmJ/PM3Rd2d7kAqnPmbuuwMvFaLTHdbXpwRHlg18Pz33
 pQZy6/59j7+GK2Oz5qNh37WE4/HDFvWbX4K4UH0SUhiRs1wY3yO+RgmKZ8WjFWuekU
 xdiHeHfFucP+nHGk7t6MxRpVhKBfDERIihC9xu47xUYmZgRbSwmBVOnnnbZluQbqzc
 CDU0qYd2VHJ4XPxc6tZUujDN9OEOag07GRWdgV2qwfzOILdJyv1e8K1qZMhpbH0TTz
 nmJR7mQ4odU+e25vuV6WcQO81iKMKiBjiQpcjr2lgJYWIWuxfzW44QIWl/jYvSWuAb
 UYnMjNCvDvaTLPFft/cUNDmf0ZDSYD4D2lduQPAy3k5JNDvSK3+bIxatJ0Nwnc0uBi
 O0m4s3ip0tDyKtt3sFrV6+LqfKnUMS7NlnyCo8bUWbo6C+hNTZQh0No1U23zVLIbhz
 /tNsDPsxOTUujWYWLWsxYONc=
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34cc8bf226cso5997612a91.3
 for <apparmor@lists.ubuntu.com>; Wed, 04 Feb 2026 00:22:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770193362; x=1770798162;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fnu5fidMh9uXV7OSySPR42Ndmsbyued3h42jFd0q6Wc=;
 b=oiyWt85cegFbmATa3Cb0jFTAgb+cojYG4btsTQjLzzSZ+YXcAIu6YfgBxIRBdyyqDe
 H7nGAV/xL0AWFsDq5iUPh59aIbc6E9VirQwiRwpTGnWGK5MppG6WP/q9xfy84ksgrNpC
 hIRB4VKgl3tiSy0hVq/H0JOt7O94xgjsOOQweUlSSvey7xO7H/HxPK4b3iOh6Znu3vJO
 JgDR3mXCAQcyLssvHSYKLxEqB/uKBlBl1rEUMqFEndrCt079rqKb1tIuedV1a48V34wy
 oaNIn3FofZokKiOjMyrDFvtBT0wRkUah0/MB8bm9fJyq+YrkfD4CfxNg8++SpF+GZS2X
 1dBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYlPuZI9+rwITJIMM+MYg+mh/oezvqD3Fo99NHQk5QJmg3V8wqbZdTj6+4oH+tu/ooc7sqdJHQ6A==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yzj36O1xyYgscOogomwegV1eiboWEpZzpZJ5Eg3u1zVXcOPDle3
 brlGYELDOc260vczDQrsDOD+Z9bAQV2SjqIV+bmjyi3KvoCMgU5WO0TM4n6MWDq8zsXSVEpYteB
 wGUAPtHkXsndtAPa5u62XGUNPuk+ZtMEXree7q7onqbkc6aqVkv6uZNxz/dLxsTdqS4DB/in00g
 2UCA==
X-Gm-Gg: AZuq6aINlhkfA/0vUz/G1V9NSRLKsrjDYkGV+e7a47wZ1ros+EI42vk9V3+US7uN1Gu
 j6eJYc/ke5zb0at5s/roOM/vozQPeFb0tHQb7C0aaegtQuMSijYChYUQrqgkpxRUS/3s5D8OPoY
 hfggxZEYryHBe3UURF+jcgwDJCSgbcn6zqhzcl1qfQMT47PgOzJEImmB0A4kOSKw/ez/FlM84G3
 dexZtsfRggEBNgGKUrSfF1PzWofVvMnxBIL4qwNxZSbbphdhulZtQrt2jfk2fxtGwekIHSP2uR8
 9J1LNiCga1+dJimOdrAAFR4HgkEH178RPXJs5S1xXmh8vsuCNHDOgU2Lz9Tgs1fsgr8u6ZLdhUX
 quG5PQu7/AjHbxePW2kxwo+4Y
X-Received: by 2002:a17:90b:1a89:b0:343:eb40:8dca with SMTP id
 98e67ed59e1d1-35487190e1emr1958924a91.19.1770193362071; 
 Wed, 04 Feb 2026 00:22:42 -0800 (PST)
X-Received: by 2002:a17:90b:1a89:b0:343:eb40:8dca with SMTP id
 98e67ed59e1d1-35487190e1emr1958902a91.19.1770193361689; 
 Wed, 04 Feb 2026 00:22:41 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-354862effa6sm1676639a91.9.2026.02.04.00.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 00:22:40 -0800 (PST)
Message-ID: <68a53bd2-aaa1-4071-9ec7-87b11b935adb@canonical.com>
Date: Wed, 4 Feb 2026 00:22:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>
References: <20251126165701.97158-2-thorsten.blum@linux.dev>
 <1da23c89-dc2c-41cb-8260-098deb8ae917@canonical.com>
 <D73FFEAA-F246-4777-8CA8-32807F378423@linux.dev>
 <3CA1F386-2217-405B-AB6E-85195AD09CA8@linux.dev>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <3CA1F386-2217-405B-AB6E-85195AD09CA8@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Replace deprecated strcpy
 with memcpy in gen_symlink_name
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
Cc: Paul Moore <paul@paul-moore.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 linux-security-module@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:jmorris@namei.org,m:linux-security-module@vger.kernel.org,m:serge@hallyn.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:mid,canonical.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 051CDE315E
X-Rspamd-Action: no action

On 2/1/26 04:42, Thorsten Blum wrote:
> Hi John,
> 
> On 27. Nov 2025, at 11:18, Thorsten Blum wrote:
>> On 27. Nov 2025, at 02:32, John Johansen wrote:
>>> hey Thorsten,
>>>
>>> sorry I have actually pulled these in, and tested them. I didn't send out
>>> the acks yet because I have another patch that I was waiting on a proper
>>> signed-off-by: on.
>>>
>>> I am going to have to pull that one so I can push. I'll add acks now but
>>> the push isn't going to happen for a few hours.
>>>
>>> Acked-by: John Johansen <john.johansen@canonical.com>
>>
>> Ah sorry for resending then, didn't know you looked at them already.
> 
> Did you ever push the commits? I can't find them anywhere.
> 
sorry I am having "fun" email issue atm

it should be in apparmor-next. I have been staging that through gitlab

https://gitlab.com/apparmor/apparmor-kernel
and
https://gitlab.com/jjohansen/apparmor-kernel

trying to get better CI integration with the userspace side. It was stuck
again and I had to manually kick it last week.


