Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBqpNsFEumlTTgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:22:57 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8598D2B64BF
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:22:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2kIs-0000N4-Nd; Wed, 18 Mar 2026 06:22:50 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w2kIr-0000Mr-B4
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 06:22:49 +0000
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 304CA3F604
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 06:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773814969;
 bh=MWEkl+kcqBTBD8+mLUGEuQ8uw1WCBcxHuFSeKfo4O3I=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=H2iMtx+itNGiCCszo7vAYp2+goND41081+v3VIVFg13pL0J5e9wS+U5aT66BJ/lDp
 Hkuj7wwm/fJN5RXxnhSscphDRNTws4OrFHvOCDAUvbYRGnc+/iPxJN8GdbkNArXlM9
 r4Xi3qvKJdPkiDFg+sChZ/gfb/efenWlzu1so1yxoh6rXwEpwnAa+OFUu4zneopiii
 n7gHUE+PpyWtYR/1dv+PSa5fEzh/YfngFwmPXAHTonTqL42/d9mn/fxOVWb/Uh2vmD
 sqhmFSsFxhbqHY5Wiz0ji9i5TAO9811xVlJKCzAF2fJNtXLMxdDZVAad5pYeWKMPAe
 UJ4JoWdnA4Gad9BK+zPupGo1uFHmrA40WFjim6isaE5Pmkx1OhSU8fObXhPr+FTHws
 XhBYqL9XE7m2TydjKmMFeYRMsSwurPiMCWwShbiwntxPWFkszj2cpHVlGd3T3OJQw4
 NW0OGX3OBrXbB4GlNk8xwRk5yJCvxbZpH4uL9q0HZUQXiUQXWhOatvkr+UslW/WAPm
 TR68G2C4oXtEztkiu/Kg4PkYesUsErRvTZRpjOBuyRTK51nRur+QLy9SxOCD7ZyW/3
 ipUeWtRwzP7BWeWk+GBfAhfOO+G5Sa1vtArxcTrwyGRkiAbVk9vjBUf70a/RqvWB2C
 Hsy1BY0TKxU2CGb1S7DNP2rE=
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-35a0998a441so40477615a91.2
 for <apparmor@lists.ubuntu.com>; Tue, 17 Mar 2026 23:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773814968; x=1774419768;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MWEkl+kcqBTBD8+mLUGEuQ8uw1WCBcxHuFSeKfo4O3I=;
 b=MSxIAMPPJkXhAj7ULBGFdk1XZhpaKJ/7GN2MYziFbkWD2qCeAiituYLkUJ53K/wtK2
 662H+lvgARZpeKI0G7KqwPf/wSdLS2LuZxTtHws7gpQZBDsGtJZLU5Sc1jC8dAXn2scf
 6JMoZqedLCLhOIilNahVc07T6MbMtleZiLI9/KyzzTJR6uwNhx2edlpx3Ar71gTKHlNj
 J3AVlgJheyLPyYaMfqtzoGivHzOnMZv5C66FDaMMduU4hC2OO0b7VV/CPzsQrNSWPmlz
 RGuWczZAW4eHemji7iTA0CeoNDdtJ3IiizuZU/9eFD6u5ZM7XwGHPAfhRQKg82dk3gg+
 hftA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV40k8yKRgW2Qxp8zCdzeLq1yqhUIht6qgtxa37Z37aWYy16j7XDxdgTk5M1AUCgTGBCT8uFFzzDA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwqOxcZ3eFlMOKSt8NYel8qfoPdboGbjE3TwSu70efw68YXuPWt
 ja/3Hx4WKdEh/YOg3C8mT6/qlkIWo1ijFlsSCQRULUISWlVvyFC/qmkVeJAqfLhWUvnE4aDIIUY
 sTVDnBewZ5sytZzNppXoNeQ45K+7CZqH6bmKBHw6rbJ0RiZGNuC3nOKrAhOZvlQ4FxWqOQTVWJy
 APTg==
X-Gm-Gg: ATEYQzzJw6q7RE4MvZOdUKhbtHzNjZsvK9YQNPiQktSVifxGhEpbprWWAUU94HGnFqt
 0xTZlkZiCYISeP0IAn9FUVbWi7ZafAJXmzPzj1W0clb8QrfF6XtDXXzfATw3WmJjVZUwMCYhGS4
 EQyY9d9MXc+w1nbhNgn1buRKnt8pinbII1B5/+93bSiOQueYJjQnmUBxUAp/FrKrIox1H0bCuBr
 REm4IsV6Mf42UKsfi4mbAXHrHJ84V+DSmre05VQGVX5PUBqa67uLttooCs/BCgMLnWqLx7IKdtL
 re/AeDZJvV8GAHB8iV1UpkrH43KYjeTUkIFVlAsNAtkQphPow1viB2XAQ//QYEcGinu9n4tY5qT
 huEn36gnFXTYA3ug1t0wpBZ4XhlRzdnk193OuMg==
X-Received: by 2002:a17:90b:4f85:b0:356:2c7b:c026 with SMTP id
 98e67ed59e1d1-35bb9f26d71mr2017001a91.23.1773814967853; 
 Tue, 17 Mar 2026 23:22:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4f85:b0:356:2c7b:c026 with SMTP id
 98e67ed59e1d1-35bb9f26d71mr2016988a91.23.1773814967443; 
 Tue, 17 Mar 2026 23:22:47 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-35badbcb8b9sm6506032a91.13.2026.03.17.23.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 23:22:46 -0700 (PDT)
Message-ID: <8518a2c9-e453-4367-84a2-db253d7ed5a0@canonical.com>
Date: Tue, 17 Mar 2026 23:22:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ryan Lee <ryan.lee@canonical.com>, apparmor@lists.ubuntu.com
References: <20260213192940.24833-1-ryan.lee@canonical.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260213192940.24833-1-ryan.lee@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: grab ns lock and refresh when
 looking up changehat child profiles
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ryan.lee@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[canonical.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:email,canonical.com:mid]
X-Rspamd-Queue-Id: 8598D2B64BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/13/26 11:29, Ryan Lee wrote:
> There was a race condition involving change_hat and profile replacement in
> which replacement of the parent profile during a changehat operation could
> result in the list of children becoming empty and the changehat operation
> failing. To prevent this:
>   - grab the namespace lock until we've built the hat transition, and
>   - use aa_get_newest_profile to avoid using stale profile objects.
> 
> Link: https://bugs.launchpad.net/bugs/2139664
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/domain.c | 33 +++++++++++++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 
> This version of the patch applies cleanly to the Ubuntu 6.17 kernel.
> 
> diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
> index 7d81111f628c..2d3b80423d20 100644
> --- a/security/apparmor/domain.c
> +++ b/security/apparmor/domain.c
> @@ -12,6 +12,7 @@
>   #include <linux/fs.h>
>   #include <linux/file.h>
>   #include <linux/mount.h>
> +#include <linux/mutex.h>
>   #include <linux/syscalls.h>
>   #include <linux/personality.h>
>   #include <linux/xattr.h>
> @@ -1128,6 +1129,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
>   				   int count, int flags)
>   {
>   	struct aa_profile *profile, *root, *hat = NULL;
> +	struct aa_ns *ns, *new_ns;
>   	struct aa_label *new;
>   	struct label_it it;
>   	bool sibling = false;
> @@ -1138,6 +1140,32 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
>   	AA_BUG(!hats);
>   	AA_BUG(count < 1);
>   
> +	/*
> +	 * Acquire the newest label and then hold the lock until we choose a
> +	 * hat, so that profile replacement doesn't atomically truncate the
> +	 * list of potential hats. Because we are getting the namespaces from
> +	 * the profiles and label, we can rely on the namespaces being live
> +	 * and avoid incrementing their refcounts while grabbing the lock.
> +	 */
> +	label = aa_get_label(label);
> +	ns = labels_ns(label);
> +
> +retry:
> +	mutex_lock_nested(&ns->lock, ns->level);
> +	if (label_is_stale(label)) {
> +		new = aa_get_newest_label(label);
> +		new_ns = labels_ns(new);
> +		if (new_ns != ns) {
> +			aa_put_label(new);
> +			mutex_unlock(&ns->lock);
> +			ns = new_ns;
> +			label = new;
> +			goto retry;
> +		}
> +		aa_put_label(label);
> +		label = new;
> +	}
> +
>   	if (PROFILE_IS_HAT(labels_profile(label)))
>   		sibling = true;
>   
> @@ -1146,7 +1174,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
>   		name = hats[i];
>   		label_for_each_in_ns(it, labels_ns(label), label, profile) {
>   			if (sibling && PROFILE_IS_HAT(profile)) {
> -				root = aa_get_profile_rcu(&profile->parent);
> +				root = aa_get_profile(profile->parent);
>   			} else if (!sibling && !PROFILE_IS_HAT(profile)) {
>   				root = aa_get_profile(profile);
>   			} else {	/* conflicting change type */
> @@ -1206,6 +1234,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
>   				      GLOBAL_ROOT_UID, info, error, false);
>   		}
>   	}
> +	mutex_unlock(&ns->lock);
>   	return ERR_PTR(error);
>   
>   build:
> @@ -1218,7 +1247,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
>   		error = -ENOMEM;
>   		goto fail;
>   	} /* else if (IS_ERR) build_change_hat has logged error so return new */
> -
> +	mutex_unlock(&ns->lock);
>   	return new;
>   }
>   


