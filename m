Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wdmbM4nvKWpefwMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 11 Jun 2026 01:13:13 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAA866D535
	for <lists+apparmor@lfdr.de>; Thu, 11 Jun 2026 01:13:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wXS6Q-00026l-7c; Wed, 10 Jun 2026 23:12:54 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wXS6O-00026Z-NM
 for apparmor@lists.ubuntu.com; Wed, 10 Jun 2026 23:12:52 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 882683F5D9
 for <apparmor@lists.ubuntu.com>; Wed, 10 Jun 2026 23:12:52 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2c0bfcd629eso88055775ad.2
 for <apparmor@lists.ubuntu.com>; Wed, 10 Jun 2026 16:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781133171; x=1781737971;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCic9KMxpYHNL6NobDAMx1YPJ6MKfbdc57XVi/nT2wQ=;
 b=lm2QHQfWuHYXN7ZqtjlWxx9aKW1i1n20iOqnr8eEQv56xg7LaFk1LrEQDznFKBj0Qq
 90oYhHlsURorKWYQL7TwqTXZFaYWcSLSxh3iDRjQntiZyFt2/MaI7BUtV5mAZQhMpGSL
 JDBgP9YdoCq98czaRrkXhtPcEe/gpwj8c6ly+62rTRZe0dGVJr7NUGHbk2avF7Apex5l
 RVZsxKmbr3sVXXFbKykdanXnlzzMZehzb2haTsCG8N7urCdiiZwHrL2XQNHAxjfxA0gL
 /WfQ3lYO8GrX1sr4H9AqtFAHq6KfP96YHUYdXQh9C0SW6DY/B/CqkEAgJUsMyPoxDPST
 nBwg==
X-Gm-Message-State: AOJu0Yx9ULpzneBXmJ6lr9irCSqrGHfNFRlNxtkRWPhhxIZbN9bTkVnp
 eojRE+BLBJcSlZRAd8JPQbaECc/FnyJU0MjRlMXOjL0rwv7AGR0F+ors1nHDxVka+dYkIZqucHX
 WvRuLMcRQ3SnvEf4cgdLWxhVy4Gn5Z0dK5/MUBw2a7ZfoYQ7kGrEDbKBybuctrkm/ujndwyJntY
 /v4sDmRs96yw==
X-Gm-Gg: Acq92OELW/+uEJMs/D6sOTUcSL+sXLXefhYmV3U6RbDCg68PMf1bEzfwIwN6lcfpFop
 ArGmUS7cK+G5qvNsoSMQaE1ASzWN9z9YZS2tOD/KzYjIxucxpZm/hqJkqnNlIDF/cmUlD2Ge2TD
 uxFxKjqN/q/ec4WwPCnnYn9BgR440HNRUHm2NlY8JrNjVHQ+B4GxN+6PTsxXUpKZujg5zg9Zary
 3W/sRS/XkJQAViCckYNwL9mp7VSQnl277wFzQhRNxQKQwXI2YS9fsHvzmokNUe66O0OEPdCObvr
 IrMflqazk+saIf8N+HNNMtqEA//n9ftzGBjLFnxTshhxSr40wzA8+cHhlvOw1kFNxeV90mE+kFR
 khf9bN0O+wKksDijuQCecyfM20WJ6sv9Vl0UPrN9w/eRov7E=
X-Received: by 2002:a17:903:1b48:b0:2bf:2114:ecbe with SMTP id
 d9443c01a7336-2c2f4208cffmr755725ad.23.1781133171186; 
 Wed, 10 Jun 2026 16:12:51 -0700 (PDT)
X-Received: by 2002:a17:903:1b48:b0:2bf:2114:ecbe with SMTP id
 d9443c01a7336-2c2f4208cffmr755475ad.23.1781133170789; 
 Wed, 10 Jun 2026 16:12:50 -0700 (PDT)
Received: from [192.168.192.71] ([50.47.147.90])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2c164f6d389sm245839845ad.16.2026.06.10.16.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 16:12:50 -0700 (PDT)
Message-ID: <9ae61d4b-55fe-43be-87b5-a7f6217621e1@canonical.com>
Date: Wed, 10 Jun 2026 16:12:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <error27@gmail.com>
References: <adjOGC9qtr_9XkgS@stanley.mountain>
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
In-Reply-To: <adjOGC9qtr_9XkgS@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [bug report] apparmor: add support loading per
	permission tagging
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
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
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	HAS_ORG_HEADER(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AAA866D535

On 4/10/26 03:16, Dan Carpenter wrote:
> Hello John Johansen,
> 
> Commit 3d28e2397af7 ("apparmor: add support loading per permission
> tagging") from Apr 1, 2025 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	security/apparmor/policy_unpack.c:883 unpack_tags()
> 	warn: missing error code 'error'
> 

Sorry for late reply, I am slowly working through the backlog
A managed to get a fix for this into 7.1

72971e6f745ad apparmor: fix unpack_tags to properly return error in failure cases

thanks
john


> security/apparmor/policy_unpack.c
>      852 static int unpack_tags(struct aa_ext *e, struct aa_tags_struct *tags,
>      853         const char **info)
>      854 {
>      855         int error = -EPROTO;
>      856         void *pos = e->pos;
>      857
>      858         AA_BUG(!tags);
>      859         /* policy tags are optional */
>      860         if (aa_unpack_nameX(e, AA_STRUCT, "tags")) {
>      861                 u32 version;
>      862
>      863                 if (!aa_unpack_u32(e, &version, "version") || version != 1) {
>      864                         *info = "invalid tags version";
>      865                         goto fail_reset;
>      866                 }
>      867                 error = unpack_strs_table(e, "strs", true, &tags->strs);
>      868                 if (error) {
>      869                         *info = "failed to unpack profile tag.strs";
>      870                         goto fail;
>      871                 }
>      872                 error = unpack_tag_headers(e, tags);
>      873                 if (error) {
>      874                         *info = "failed to unpack profile tag.headers";
>      875                         goto fail;
>      876                 }
>      877                 error = unpack_tagsets(e, tags);
>      878                 if (error) {
>      879                         *info = "failed to unpack profile tag.sets";
>      880                         goto fail;
>      881                 }
>      882                 if (!aa_unpack_nameX(e, AA_STRUCTEND, NULL))
> --> 883                         goto fail;
> 
> set the error code here
> 
>      884
>      885                 if (!verify_tags(tags, info))
>      886                         goto fail;
> 
> and here
> 
>      887         }
>      888
>      889         return 0;
>      890
>      891 fail:
>      892         aa_destroy_tags(tags);
>      893 fail_reset:
>      894         e->pos = pos;
>      895         return error;
>      896 }
> 
> This email is a free service from the Smatch-CI project [smatch.sf.net].
> 
> regards,
> dan carpenter


