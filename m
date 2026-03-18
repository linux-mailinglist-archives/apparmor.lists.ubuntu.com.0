Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EgvL1dHumkFTwIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:33:59 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 855722B6719
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:33:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2kTZ-00037W-Ds; Wed, 18 Mar 2026 06:33:53 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w2kTY-00037M-EY
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 06:33:52 +0000
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2E8043FBBE
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 06:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773815632;
 bh=tatDLGn7dwY1Bqm/LishEDRy7hSicbRAH8kK4WbxlFQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Ga2KvIcM7ldu8vbnMhEk1fOOQIJxHliS53lxskpUkghln85dbx1vjKQFoJeO9+fLA
 onogKCKfPtOqZB+ton7LmGHXsKFYfYfvD+F77bQGlHRLmEZMOzTt6BD2VXN1wrwmfQ
 NQodXqMs/+2dgH+HNDJfDbKG/IG7oABYCxCCxky4iLCh4vWiI+UNXJ3eQaO4n5qcr/
 l+LW9sDEx5EAyz2Iqz09Y8lBuBhEMjRO07GGC0pgxAb5g03ennOB+3ZWTNc5c8EBgx
 JJ6ZsgdNqCPEPK1j1d1bK2bYG+jnIza2mhZSXitCAP9j4HalvIWpGfdK+b6+Y6Fjo9
 1mrqRxhTM5BNamu4gTvfVH1ruqLjJxy/mePNxdshL/vInipIcd4cXFNVqk4mz4m9PU
 ptRWxnF1QI4EfWWiabiAwfhORkjDPiascvy81SkcnlMAjOk1Ya+MHzJkeFsvQnHPT6
 JSuefsEQBGijufEEBFSkECgvVyxGTAtt1mRWrlDNN0Qr4srd3BsOlJq57ERgImQANI
 i9NrxuouvJ/yUKsmQzIHjQXGmttdbUUakpyyxm74Gn0HrhHXx8E5QzLprW5Rz/ZxGx
 8m8t/gt7GHagmSwznRNRs+diIebLYFQCE9rH9SLutvzkvteVxNgULIN+8zOUAPJB5X
 mpZsSwkygbHCwYowIR/B6D0o=
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-c7380305a9aso456123a12.1
 for <apparmor@lists.ubuntu.com>; Tue, 17 Mar 2026 23:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773815631; x=1774420431;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tatDLGn7dwY1Bqm/LishEDRy7hSicbRAH8kK4WbxlFQ=;
 b=ZgUNLqv/p1qnbVPnksmb3hxcl7AwDw3T+K5jDVmP4nOZ9z1BcGwaMsiEQDj22Jesil
 fqiCSBwnXG88m+TLYzjQWJSb0czJ5SvNmizhWXDNIsAwbisyNha+CKNZEWQizmt0Xba8
 kgoGF+Rc5DuUphaNsWHylB2KCoeN/JRi6mwOOkLP3o5MwkLA8cLFRwArKcH7M3yrQAUj
 GNJS3Bwk+MyP+56xi39i6i/ITh+Wq1FD7wy/e/zVVltFcUcxHD7pY+zjQzFcKvb0SXCY
 TDAI4vPae92lSiN58jffth3KSTIV2wQA2nYn9UfOUcXrCFmhqJ8rdWLVMxyfNs/7YTZ7
 JV2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl9Up0XrT8I0v8ufAHiJyqE+htVueD1FMhglU3JpsS/+2b+Spqjfr3CnNl4+FQ3+mrT+yujFNQUg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzP5sjEbp2fEqnLtIyk64sAJVf2oXFCwEhZqdohOxjf1oEZ3t5U
 v073Oo5bBMbdKpsLpt6mA6Im3jMig8ll/OZ2zTzfuI/bzFKeinlqqtuFIgG+DcLuI7kNvvEaqeu
 l0gl+erT70qbfoX1+/ATNB7+yi61O9BA30d7orUBcUr+1RNJbiKBrERkRJ4FSzvKvwuTP+hNxjb
 /Ulw==
X-Gm-Gg: ATEYQzwvVpBD70cnFl82rFKBXyB/lbdpd9fGSJAl44T3+ZEFPLTIzmbEReHTx+gKQDI
 wzb6/dqRg1RGUUdsVEQpufbG4eED2vik/rYajWqiIf77vv5vVvdyQvrhnYjTmxP1dwBqWQr4gSW
 vri01ah0/5pOqzBttqJXWfQ8WcYAenpSupTSvB2c7Ao2GL0sTdbwfAkOZxaMwZBMfM2YcKcAt53
 9n+KgJ8ghqktr0DPu8Fp4E/24qkuMPg72ivcP9FT9GSkCYvhV7WC1WJBWz3jF2HxZ3/aTIsPqVY
 YFUvPjkdSOxlNEw5By+99ZtE+dEdVmd9iYenc6uAOaS6QkaX/6HaLVxHgAZxhvdSprstjtV3lJo
 O/lRjDB7ODQzNgcrzCHg1IiKWRN1cfSZlSgb1uw==
X-Received: by 2002:a17:90b:3fc6:b0:35b:a41e:bcb2 with SMTP id
 98e67ed59e1d1-35bada9ee8amr5873749a91.6.1773815630724; 
 Tue, 17 Mar 2026 23:33:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc6:b0:35b:a41e:bcb2 with SMTP id
 98e67ed59e1d1-35bada9ee8amr5873723a91.6.1773815630314; 
 Tue, 17 Mar 2026 23:33:50 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-35bba5c3eaasm1443857a91.16.2026.03.17.23.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 23:33:49 -0700 (PDT)
Message-ID: <e110e1e3-df4d-4827-83ac-bb06b40f45a0@canonical.com>
Date: Tue, 17 Mar 2026 23:33:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnd Bergmann <arnd@kernel.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>,
 Cengiz Can <cengiz.can@canonical.com>,
 Georgia Garcia <georgia.garcia@canonical.com>
References: <20260316135935.3321551-1-arnd@kernel.org>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260316135935.3321551-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: hide unused
	get_loaddata_common_ref() function
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
Cc: Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jeff Layton <jlayton@kernel.org>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 NeilBrown <neil@brown.name>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:maxime.belair@canonical.com,m:cengiz.can@canonical.com,m:georgia.garcia@canonical.com,m:brauner@kernel.org,m:arnd@arndb.de,m:jlayton@kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:neil@brown.name,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:email,canonical.com:mid];
	NEURAL_HAM(-0.00)[-0.992];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 855722B6719
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 06:59, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly introduced function is only used in an #ifdef block,
> which causes a harmless warning:
> 
> security/apparmor/apparmorfs.c:177:28: error: 'get_loaddata_common_ref' defined but not used [-Werror=unused-function]
>    177 | static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
> 
> Move the definition next to the user to avoid the warning.
> 
> Fixes: 8e135b8aee5a ("apparmor: fix race between freeing data and fs accessing it")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: John Johansen <john.johansen@canonical.com>

this has now been pulled into my tree

> ---
> Alternatively, the #ifdef checks could be replaced with an
> 'if(IS_ENABLED(CONFIG_SECURITY_APPARMOR_EXPORT_BINARY) return;'
> check in __aa_fs_create_rawdata(), relying on the compiler's
> dead code elimination.
> ---
>   security/apparmor/apparmorfs.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index ededaf46f3ca..f762b101d682 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -174,14 +174,6 @@ static struct aa_proxy *get_proxy_common_ref(struct aa_common_ref *ref)
>   	return NULL;
>   }
>   
> -static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
> -{
> -	if (ref)
> -		return aa_get_i_loaddata(container_of(ref, struct aa_loaddata,
> -						      count));
> -	return NULL;
> -}
> -
>   static void aa_put_common_ref(struct aa_common_ref *ref)
>   {
>   	if (!ref)
> @@ -1318,6 +1310,14 @@ static const struct file_operations seq_rawdata_ ##NAME ##_fops = {	      \
>   	.release	= seq_rawdata_release,				      \
>   }									      \
>   
> +static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
> +{
> +	if (ref)
> +		return aa_get_i_loaddata(container_of(ref, struct aa_loaddata,
> +						      count));
> +	return NULL;
> +}
> +
>   static int seq_rawdata_open(struct inode *inode, struct file *file,
>   			    int (*show)(struct seq_file *, void *))
>   {


