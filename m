Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D63fFZ86Omp/4QcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 23 Jun 2026 09:49:51 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D95216B4FC6
	for <lists+apparmor@lfdr.de>; Tue, 23 Jun 2026 09:49:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wbvt1-0006q8-57; Tue, 23 Jun 2026 07:49:35 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wbvt0-0006pw-4L
 for apparmor@lists.ubuntu.com; Tue, 23 Jun 2026 07:49:34 +0000
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CE2163F1F4
 for <apparmor@lists.ubuntu.com>; Tue, 23 Jun 2026 07:49:33 +0000 (UTC)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-8423efbfb61so3914606b3a.0
 for <apparmor@lists.ubuntu.com>; Tue, 23 Jun 2026 00:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782200972; x=1782805772;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHm5FUb9yQVfGYSofLCg5hQx8C9AkGcHH4DHaB6X0Ic=;
 b=CUtw2hrTGL9eUVU2jYCFUDnMUtngWLLXLIUD/2L/c0MPF/lhFQDMi7SnnxGTQAQudx
 4OXSOXPENh6BCG45neVNNTUZj57e96cZLUDwJ72K1XeaemQ24JsZw372/N7vhZZkt4f2
 Cy0CeEwHKIHyJzZd5LcdZ+AYWxjoztVPPGalEoHFS62m9SmOvogpyJEOgaCE2xNCj102
 AIIxkHkEafxhApmDTevmOSMntefWVroZWA/sKHu11MCdVw42jZVNlew2+qAwFk7AVeaH
 zjEpeEOi4StWrAvEGtZzUAiNBpKEqKc4X+0/uQgqJ0ctYFAST4/xY1tgeWF0U4nbhSSa
 zIMA==
X-Gm-Message-State: AOJu0YyLRsUVi59SATy7YEnzFnwNsFYd+133NKfde3sKqDDKNwT8K2uU
 ZThHH5o5AYnKNf64rZ3rb2NQN5A64aEZELSyp6EeHIx7poNBULG/gOULVh4jzZWgfz5iJw9hhnz
 HltoPmhynEuQ4OFR3yFDG9/H8UJGpECMRnyyD3+RyTmYlpDCUkbRiOi6BU5tlAza0q8wh3Z4LpO
 nwTskuZ2TN+A==
X-Gm-Gg: AfdE7cnR/hMf6NcU0xyaM+JXigF4Ivnde2qvOK4H1iVdQcWoZ7LyAdVwbtA5Zh230j1
 92O3VQx7NtPMHJMCYHym9OczjD4fykBze5+nr8ywRmBfr03+hLsaMQzuia9lehxa2cduZ0+Yuxv
 cCjqqT3FSuqxowhyjEY6om0AX4j8YG6gDzVW4UYYDVdrQJZNs5NJFTfg+69XH9hIwVwkRls8ef3
 ANABViNieDdZ6Uwa4aShVUkzfojKQZZ/aMmnVxeXT4G6vQYNpSvWxkZ36OuJRdgNDN8V4evPMvA
 kDBiyFIoYFtvMywilE4SH5SZ1TA4G/nCFYUU5USilUPzeBCt3qwWqbzE0ngJU/NdA17nNLqCJns
 Mi/6kSTrJAuvI0UBPxqFjKLWPlQ==
X-Received: by 2002:a05:6a00:993:b0:845:344f:eee9 with SMTP id
 d2e1a72fcca58-84597070df3mr1698759b3a.1.1782200972146; 
 Tue, 23 Jun 2026 00:49:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:993:b0:845:344f:eee9 with SMTP id
 d2e1a72fcca58-84597070df3mr1698742b3a.1.1782200971744; 
 Tue, 23 Jun 2026 00:49:31 -0700 (PDT)
Received: from [192.168.192.71] ([50.47.147.90])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-84564d6813bsm9929631b3a.8.2026.06.23.00.49.30
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 00:49:31 -0700 (PDT)
Message-ID: <eaaca019-54ad-41ef-ac40-d46307c28c02@canonical.com>
Date: Tue, 23 Jun 2026 00:49:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <T8YEGFN2ETU4.8WJE2RYVCFUC2@mailcore-77ff78dfb9-6kk5j>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <T8YEGFN2ETU4.8WJE2RYVCFUC2@mailcore-77ff78dfb9-6kk5j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] Questions about Contributing
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
X-Spamd-Result: default: False [-1.41 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:replyto,canonical.com:mid,lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D95216B4FC6

On 5/29/26 04:30, aenri wrote:
> Thank you for your question, Robin!
> 
> 
> 
> 
> The conflict between some /foo/*/bar and some /foo/**/bar would resolve to /foo/*/bar taking priority, as * is a direct subset of **. since (according to my understanding of the code) the only direct difference is that * consumes up until a slash (/) (noted that both reject the null byte \x00) but otherwise will accept anything that's thrown it's way, it is considered a direct subset.
> 

yep this is correct. As long as the conflict can be resolved with a subset of states, you are good. It gets trickier if you have multiple rules conflicting, but you can do just a pairwise comparison for each combination in the set.


> 
> 
> 
> Thank you,
> 
> Aenri Lovehart


