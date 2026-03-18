Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PZZBeFGumlTTgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:32:01 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BADB22B669B
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:32:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2kRf-0002o6-1N; Wed, 18 Mar 2026 06:31:55 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w2kRc-0002ns-SR
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 06:31:52 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BB6AD3FBC2
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 06:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773815512;
 bh=EML+XTGUQs60PcdBYA32Jysi6fX2cPvKb7rTjuZcNxo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=YiQib5tZjI3up7JoFGouoKC2f0EINfvFkmxNSW3pdzZ4jU2lVeWE9FMDdUbJ6NPCR
 6+Gf7gG3ieBzLYLMcIY/4MuFgN2rgta0mMloeeGXiIPwmQ6s/1Jn5/bPfMHV1Ol6DJ
 faKIIu1CE98dUblJwgPEzWAYisG4+WYifSuA2GsQ/2sUXArTKM0HztsOm6C+o6OCCS
 FCjIf1UZeCeiOD7DHMyoEMgEWBHfk+q5VSCcOlxBJ/Svn6VaWlGeiDWizzXjPinujJ
 kYwNi4Uwbusw6UE4Bsmq1x113oY5tzRZ5vbJxM5Edt61LsLGsY2rghYSBZhZmsaNqa
 1dJmFl55QxBOGSUepZ2YxehxWiYwTx7j/2QFrQ4nHX/j+GDJ7zMhirU6KfGMHdSoX7
 ydMeWV7WJs0V3KBbbf8RVvaQlJsQRqtI/WA1U4Xtr77bYvv7zfFlagREWf5vRTp79t
 XnMjV8W7o9wCi6q58vw6AnnzUFEz/guNPbqyXXBdgdcNyxZHSkqTUFJURrwRDP3c++
 kqgXwKa5mT5L2XB0fTa6l8wwlNrI4IDR5B9NRCcmCEhNA4/VbHv8jyA7/F/mqqfFhu
 f6E5mK5dlGJ25bCzJl6RYD40A2YiYzbgtRosMF0jSkng6AtL8qdJ9IFs+079gAgYbY
 zTh6gRk5jMAM4z43zBXTulFo=
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2b059511554so178967245ad.0
 for <apparmor@lists.ubuntu.com>; Tue, 17 Mar 2026 23:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773815511; x=1774420311;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EML+XTGUQs60PcdBYA32Jysi6fX2cPvKb7rTjuZcNxo=;
 b=c/WVJk+q56qzhzev+c//dxr42ONkyai4IcLfUWRdX0QERuVxOstQz12ahsgzfjsmLa
 dlrLbDP5CAVyjlpgsaZQaouYd6klYO0TgedWNPh9laIsR5OuCI9+FiR+UjdbMPdRu6eU
 aN/UpgibAnZ5czUsskOlF1GVtpTkKle3mr+Xf5bsGuwFuN0YLoRCp6vc4D+zy9sQg4IX
 rr5qhfLmRCdIi8GwzRxjf4T07tZ7ESkcQq0BN8Gt0U2DWPxUL8ARgjY9fVE88pytA9pJ
 sAz7LXHQ8IwVQYJh6LspEM0Wm8d8HmTpi5o/KHjrqfasTIoLGesM/3iXvoSt7QCkZj+6
 5L+Q==
X-Gm-Message-State: AOJu0YzEky8+j4myKEdZkMheJrGcwNpyX4wrV2DV0/rBA/FeZsz03BSu
 kQNjnLaS252m6J12tIz1fwe1ECbnbTO8/8dhJ0mILEuM1i3M3MArzK3kr/7ROK1BncO+TOZxwJZ
 1kK9nICnsjcpsROAAIGVQa4YcgOKv4Li/5Wl3FfY192jyWNkqp0zuGM8srlldAn0t1cOZEHtYxw
 oYIQ==
X-Gm-Gg: ATEYQzw1kfC0aXB+GprSWB9Ob/xG76wGnL/qtY7tPghROCEdeTgQFPatVZyRjNRRQzv
 6ZfoVhP0s651Ue8Bzygz73DjqMae0YdUYS9Z0C5Yvt4KOEdvjkAxNUGMzMK6GgGFtdRcxYgCWoy
 iOyrBW70qmmUKdwdjyaP/cXzaMNSJM+EDEWHAUBPsLLOuL326yp00ssKHuA6uAqwAHg5IvNzehG
 kDa8i/en5TGcqvqnVCV2MCwJgfVwzFMbQzoGzNb438lqwnc2Mo7W5wztzYYOkRvvU3LjBbPEzA4
 8wzosaelREgD6fE826re3r/L74GncaCg8aBzk9D2g3Q4DZ2Ig0n9CEkFqUeOJlQJkNozvHnKUcf
 0lwpmH9ma6NZZdez27eznwZ8HHw0ops5iuIXrXQ==
X-Received: by 2002:a17:903:1a0e:b0:2ae:59d3:27f8 with SMTP id
 d9443c01a7336-2b06e364b30mr23360225ad.19.1773815511311; 
 Tue, 17 Mar 2026 23:31:51 -0700 (PDT)
X-Received: by 2002:a17:903:1a0e:b0:2ae:59d3:27f8 with SMTP id
 d9443c01a7336-2b06e364b30mr23360065ad.19.1773815510969; 
 Tue, 17 Mar 2026 23:31:50 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2b06e419b22sm15820985ad.11.2026.03.17.23.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 23:31:50 -0700 (PDT)
Message-ID: <6e51ba11-21e1-425d-851f-60916deec6ba@canonical.com>
Date: Tue, 17 Mar 2026 23:31:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
References: <20260318000758.1568-3-thorsten.blum@linux.dev>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
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
In-Reply-To: <20260318000758.1568-3-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Use sysfs_emit in
	param_get_{audit, mode}
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:mid,linux.dev:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	NEURAL_HAM(-0.00)[-0.992];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: BADB22B669B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 17:08, Thorsten Blum wrote:
> Replace sprintf() with sysfs_emit() in param_get_audit() and
> param_get_mode(). sysfs_emit() is preferred for formatting sysfs output
> because it provides safer bounds checking.  Add terminating newlines as
> suggested by checkpatch.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

this has now been pulled into my tree


> ---
>   security/apparmor/lsm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..cdf19a5e7626 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -17,6 +17,7 @@
>   #include <linux/ptrace.h>
>   #include <linux/ctype.h>
>   #include <linux/sysctl.h>
> +#include <linux/sysfs.h>
>   #include <linux/audit.h>
>   #include <linux/user_namespace.h>
>   #include <linux/netfilter_ipv4.h>
> @@ -2073,7 +2074,7 @@ static int param_get_audit(char *buffer, const struct kernel_param *kp)
>   		return -EINVAL;
>   	if (apparmor_initialized && !aa_current_policy_view_capable(NULL))
>   		return -EPERM;
> -	return sprintf(buffer, "%s", audit_mode_names[aa_g_audit]);
> +	return sysfs_emit(buffer, "%s\n", audit_mode_names[aa_g_audit]);
>   }
>   
>   static int param_set_audit(const char *val, const struct kernel_param *kp)
> @@ -2101,8 +2102,7 @@ static int param_get_mode(char *buffer, const struct kernel_param *kp)
>   		return -EINVAL;
>   	if (apparmor_initialized && !aa_current_policy_view_capable(NULL))
>   		return -EPERM;
> -
> -	return sprintf(buffer, "%s", aa_profile_mode_names[aa_g_profile_mode]);
> +	return sysfs_emit(buffer, "%s\n", aa_profile_mode_names[aa_g_profile_mode]);
>   }
>   
>   static int param_set_mode(const char *val, const struct kernel_param *kp)


