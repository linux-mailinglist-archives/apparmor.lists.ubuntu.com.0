Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7VsxAJBTLGrAPQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 12 Jun 2026 20:44:32 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F367BD3B
	for <lists+apparmor@lfdr.de>; Fri, 12 Jun 2026 20:44:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wY6rY-0005Jn-Br; Fri, 12 Jun 2026 18:44:16 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wY6rW-0005JG-Ub
 for apparmor@lists.ubuntu.com; Fri, 12 Jun 2026 18:44:14 +0000
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A7D4F3F1D3
 for <apparmor@lists.ubuntu.com>; Fri, 12 Jun 2026 18:44:14 +0000 (UTC)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-8423970cb30so939513b3a.2
 for <apparmor@lists.ubuntu.com>; Fri, 12 Jun 2026 11:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781289853; x=1781894653;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dF0/l4NllLl1Yf/JlcSWULHwhtYFTVYzSPp4Io1b/FU=;
 b=f/EZQFxm1NiWz4AaYsWdruzTeLCo8duFoNkcZjDEE6ZAOhNzNushl/ycq/2wyBmTF7
 oaqNr5m6okq3f7Sd8O7aeRWw2RPfUrVaWkMQcZJI/JtfYUMHswLuIXqgG0FpBm6y8hB8
 gzHcexrEcXNqBPIKlMDVb4ey1wjB8BCDqWQPj0z9koIC8pNtq3RO0q87hndYCuQq+Hpv
 O9IP6Tc1tpLc9+Ci9tVzDCEohwdHYREnp4E5rSAVJbbQL4VZsOVBtuQpgh1mmGnNbpIn
 xHurvLZKqFv1zOccq9oNS9fAMegNjMUiYAuFkt4RmB/WG+zutRGFGOxmDHOjw9Wua5vp
 l6Qg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8vmdV3fLlyfvX0St0AaITQpPa1UR7PTFO5pqUr5WKRNDHM9SV8GPMk/Q+eD8JnOqBKnUzvxGQsoQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yzx1cGUHcp188xiCcQNuND9uJKhHwoZtdLNJjzlewkaaAmZriHe
 tkqX8Sw9slX0o3wZfcw0iAjJc6qtnTR2AqWTBUNZrAXehruskSHaIEEeZXkDw7WOkcPvByhgFLD
 WC364wiWasydxkCvnWXh19bMLlGQYG6D2FSS3RIlL/flwEzr/CusH03rY24xW2wib2e/S45ikk/
 ThSF3ReaVVcA==
X-Gm-Gg: Acq92OEBLC39IuVZqmx86CdQANSS2w1AayNluHobFeS6E88mghD5e+U/VVFEmomSvGi
 jzHSGDib80TOQsBix6bE46mlwCkAZTjRaisewLuLySbsP/sKrJR7kl4SmzPIIK2CYxkOMTfVi9w
 gVm0CB3L8KuamXA3m86i+lmkscCKws8XP5VC/J+5EH34EmjU/KxuS5BIlzmOkWMDOkQ8bYoi2bp
 xUoXGP3MJb+V81dIDVSyV8w6fgQd6ezgFz9P+6kVv11lhCFOGJjr7B9p0E3OvuCzGox4UvMUrs4
 78zZl2HJPZymANtYJhHlmK5MnDGWfNb7NvySBBy3ZTfXFnjuOVG/Qk/GJnbM+8R+umwynO1cEoj
 ZmlvZK+V7srLyNHmlR48x3VLKM07sjLzIzNA7
X-Received: by 2002:a05:6a00:3d48:b0:838:127d:a167 with SMTP id
 d2e1a72fcca58-844e1987135mr949553b3a.16.1781289853177; 
 Fri, 12 Jun 2026 11:44:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d48:b0:838:127d:a167 with SMTP id
 d2e1a72fcca58-844e1987135mr949525b3a.16.1781289852781; 
 Fri, 12 Jun 2026 11:44:12 -0700 (PDT)
Received: from [192.168.192.71] ([50.47.147.90])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8434ad0118asm2754967b3a.27.2026.06.12.11.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 11:44:12 -0700 (PDT)
Message-ID: <768ebf8a-5b96-4c52-96c4-1e20c2e29386@canonical.com>
Date: Fri, 12 Jun 2026 11:44:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Morton <akpm@linux-foundation.org>, serge@hallyn.com,
 paul@paul-moore.com, jmorris@namei.org, apparmor@lists.ubuntu.com
References: <20260603203406.E03761F00893@smtp.kernel.org>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 xsFNBE5mrPoBEADAk19PsgVgBKkImmR2isPQ6o7KJhTTKjJdwVbkWSnNn+o6Up5knKP1f49E
 BQlceWg1yp/NwbR8ad+eSEO/uma/K+PqWvBptKC9SWD97FG4uB4/caomLEU97sLQMtnvGWdx
 rxVRGM4anzWYMgzz5TZmIiVTZ43Ou5VpaS1Vz1ZSxP3h/xKNZr/TcW5WQai8u3PWVnbkjhSZ
 PHv1BghN69qxEPomrJBm1gmtx3ZiVmFXluwTmTgJOkpFol7nbJ0ilnYHrA7SX3CtR1upeUpM
 a/WIanVO96WdTjHHIa43fbhmQube4txS3FcQLOJVqQsx6lE9B7qAppm9hQ10qPWwdfPy/+0W
 6AWtNu5ASiGVCInWzl2HBqYd/Zll93zUq+NIoCn8sDAM9iH+wtaGDcJywIGIn+edKNtK72AM
 gChTg/j1ZoWH6ZeWPjuUfubVzZto1FMoGJ/SF4MmdQG1iQNtf4sFZbEgXuy9cGi2bomF0zvy
 BJSANpxlKNBDYKzN6Kz09HUAkjlFMNgomL/cjqgABtAx59L+dVIZfaF281pIcUZzwvh5+JoG
 eOW5uBSMbE7L38nszooykIJ5XrAchkJxNfz7k+FnQeKEkNzEd2LWc3QF4BQZYRT6PHHga3Rg
 ykW5+1wTMqJILdmtaPbXrF3FvnV0LRPcv4xKx7B3fGm7ygdoowARAQABzStKb2huIEpvaGFu
 c2VuIDxqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20+wsF3BBMBCgAhBQJOjRdaAhsDBQsJ
 CAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEAUvNnAY1cPYi0wP/2PJtzzt0zi4AeTrI0w3Rj8E
 Waa1NZWw4GGo6ehviLfwGsM7YLWFAI8JB7gsuzX/im16i9C3wHYXKs9WPCDuNlMc0rvivqUI
 JXHHfK7UHtT0+jhVORyyVVvX+qZa7HxdZw3jK+ROqUv4bGnImf31ll99clzo6HpOY59soa8y
 66/lqtIgDckcUt/1ou9m0DWKwlSvulL1qmD25NQZSnvB9XRZPpPd4bea1RTa6nklXjznQvTm
 MdLq5aJ79j7J8k5uLKvE3/pmpbkaieEsGr+azNxXm8FPcENV7dG8Xpd0z06E+fX5jzXHnj69
 DXXc3yIvAXsYZrXhnIhUA1kPQjQeNG9raT9GohFPMrK48fmmSVwodU8QUyY7MxP4U6jE2O9L
 7v7AbYowNgSYc+vU8kFlJl4fMrX219qU8ymkXGL6zJgtqA3SYHskdDBjtytS44OHJyrrRhXP
 W1oTKC7di/bb8jUQIYe8ocbrBz3SjjcL96UcQJecSHu0qmUNykgL44KYzEoeFHjr5dxm+DDg
 OBvtxrzd5BHcIbz0u9ClbYssoQQEOPuFmGQtuSQ9FmbfDwljjhrDxW2DFZ2dIQwIvEsg42Hq
 5nv/8NhW1whowliR5tpm0Z0KnQiBRlvbj9V29kJhs7rYeT/dWjWdfAdQSzfoP+/VtPRFkWLr
 0uCwJw5zHiBgzsFNBE5mrPoBEACirDqSQGFbIzV++BqYBWN5nqcoR+dFZuQL3gvUSwku6ndZ
 vZfQAE04dKRtIPikC4La0oX8QYG3kI/tB1UpEZxDMB3pvZzUh3L1EvDrDiCL6ef93U+bWSRi
 GRKLnNZoiDSblFBST4SXzOR/m1wT/U3Rnk4rYmGPAW7ltfRrSXhwUZZVARyJUwMpG3EyMS2T
 dLEVqWbpl1DamnbzbZyWerjNn2Za7V3bBrGLP5vkhrjB4NhrufjVRFwERRskCCeJwmQm0JPD
 IjEhbYqdXI6uO+RDMgG9o/QV0/a+9mg8x2UIjM6UiQ8uDETQha55Nd4EmE2zTWlvxsuqZMgy
 W7gu8EQsD+96JqOPmzzLnjYf9oex8F/gxBSEfE78FlXuHTopJR8hpjs6ACAq4Y0HdSJohRLn
 5r2CcQ5AsPEpHL9rtDW/1L42/H7uPyIfeORAmHFPpkGFkZHHSCQfdP4XSc0Obk1olSxqzCAm
 uoVmRQZ3YyubWqcrBeIC3xIhwQ12rfdHQoopELzReDCPwmffS9ctIb407UYfRQxwDEzDL+m+
 TotTkkaNlHvcnlQtWEfgwtsOCAPeY9qIbz5+i1OslQ+qqGD2HJQQ+lgbuyq3vhefv34IRlyM
 sfPKXq8AUTZbSTGUu1C1RlQc7fpp8W/yoak7dmo++MFS5q1cXq29RALB/cfpcwARAQABwsFf
 BBgBCgAJBQJOZqz6AhsMAAoJEAUvNnAY1cPYP9cP/R10z/hqLVv5OXWPOcpqNfeQb4x4Rh4j
 h/jS9yjes4uudEYU5xvLJ9UXr0wp6mJ7g7CgjWNxNTQAN5ydtacM0emvRJzPEEyujduesuGy
 a+O6dNgi+ywFm0HhpUmO4sgs9SWeEWprt9tWrRlCNuJX+u3aMEQ12b2lslnoaOelghwBs8IJ
 r998vj9JBFJgdeiEaKJLjLmMFOYrmW197As7DTZ+R7Ef4gkWusYFcNKDqfZKDGef740Xfh9d
 yb2mJrDeYqwgKb7SF02Hhp8ZnohZXw8ba16ihUOnh1iKH77Ff9dLzMEJzU73DifOU/aArOWp
 JZuGJamJ9EkEVrha0B4lN1dh3fuP8EjhFZaGfLDtoA80aPffK0Yc1R/pGjb+O2Pi0XXL9AVe
 qMkb/AaOl21F9u1SOosciy98800mr/3nynvid0AKJ2VZIfOP46nboqlsWebA07SmyJSyeG8c
 XA87+8BuXdGxHn7RGj6G+zZwSZC6/2v9sOUJ+nOna3dwr6uHFSqKw7HwNl/PUGeRqgJEVu++
 +T7sv9+iY+e0Y+SolyJgTxMYeRnDWE6S77g6gzYYHmcQOWP7ZMX+MtD4SKlf0+Q8li/F9GUL
 p0rw8op9f0p1+YAhyAd+dXWNKf7zIfZ2ME+0qKpbQnr1oizLHuJX/Telo8KMmHter28DPJ03 lT9Q
Organization: Canonical
In-Reply-To: <20260603203406.E03761F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [patch 1/1] security/apparmor/apparmorfs.c:
 conditionally compile get_loaddata_common_ref()
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
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:serge@hallyn.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,canonical.com:replyto,canonical.com:email,canonical.com:mid,lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime,hallyn.com:email,namei.org:email,paul-moore.com:email];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 886F367BD3B

On 6/3/26 13:34, Andrew Morton wrote:
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: security/apparmor/apparmorfs.c: conditionally compile get_loaddata_common_ref()
> Date: Wed Jun  3 01:30:46 PM PDT 2026
> 
> Some config did this:
> 
> security/apparmor/apparmorfs.c:177:28: warning: 'get_loaddata_common_ref' defined but not used [-Wunused-function]
>    177 | static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
> 
> get_loaddata_common_ref() is only used if
> CONFIG_SECURITY_APPARMOR_EXPORT_BINARY=y.
> 
> (Or of course move the function into that block if maintainers perfer)
> 
> Cc: John Johansen <john.johansen@canonical.com>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into my tree

> ---
> 
>   security/apparmor/apparmorfs.c |    2 ++
>   1 file changed, 2 insertions(+)
> 
> --- a/security/apparmor/apparmorfs.c~security-apparmor-apparmorfsc-conditionally-compile-get_loaddata_common_ref
> +++ a/security/apparmor/apparmorfs.c
> @@ -174,6 +174,7 @@ static struct aa_proxy *get_proxy_common
>   	return NULL;
>   }
>   
> +#ifdef CONFIG_SECURITY_APPARMOR_EXPORT_BINARY
>   static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
>   {
>   	if (ref)
> @@ -181,6 +182,7 @@ static struct aa_loaddata *get_loaddata_
>   						      count));
>   	return NULL;
>   }
> +#endif
>   
>   static void aa_put_common_ref(struct aa_common_ref *ref)
>   {
> _


