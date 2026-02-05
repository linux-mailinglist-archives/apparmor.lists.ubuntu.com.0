Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDnaNUlMhGm82QMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 08:52:41 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AB043EF9DB
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 08:52:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vnuA9-0006iP-QL; Thu, 05 Feb 2026 07:52:29 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vnuA8-0006iC-Bx
 for apparmor@lists.ubuntu.com; Thu, 05 Feb 2026 07:52:28 +0000
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1DAA63F782
 for <apparmor@lists.ubuntu.com>; Thu,  5 Feb 2026 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770277948;
 bh=8XVw416Or0rmn+GcjrsK44eO0KMyp4QJc/ScUi5E7kw=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=JPd13e7vfWx/TUd+zmfI2FXfOA8XtG+/KvDI7q/B03SkOuMzQ6Edpc+3nxqJWlZff
 uMemR9niDeEYD16S/XSHBgAVTp+Wg4u55qrIzDjekXd0gm5YVSEFWtQYO6RpYhkPsA
 DRpkBntus+KisFrtS6siN9Cxv4wrTmxiTDG0iWc/b95xoMJXa0GaJKsgNQTWLSWJvG
 sBjC7S9S7Tx78MGb3E5AE/953GcIhtxv+VI56xzJtupXFG6r13/c2bPgbzcwSlMkRC
 aXHC97opzmlO+qasxTORpIU5Te5g4sih/2SaNCNoFGi1d5qOsPEXcgFurAA72d0AG2
 0AXfyLJTrw4CgofZyDw2M3p+pr8yjp+V8V+V60prbMffXY4KyvnTvSJSU0oEA1Hlzz
 78ptJOAgicbc8V3Kn+4EovpLOwvPjUxNJH0JXVMB9R8saPFdz2Xv6GKcyG7PHiu0Hn
 ucJ7uDZEh1HJXCbaXCInLYv7atrvaagpKs5jEAnp12XCG5hN8yjAQKv5MZshvlcuLL
 7tPsSqHGl2rzMIpyTYdqjONjmf//tknmS3PHA34VShOOBOO4oO2Fz4/uskYSv01LMM
 nWsvamr61hSyja2BVj2RoFLZPYrAliYL+iHxQYkxzwmMugFOj6ZFIt8kqebIiAApbG
 641QP8iZnVeC3Ap+TKcAsx1k=
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-81f3f3af760so1485344b3a.1
 for <apparmor@lists.ubuntu.com>; Wed, 04 Feb 2026 23:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770277946; x=1770882746;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8XVw416Or0rmn+GcjrsK44eO0KMyp4QJc/ScUi5E7kw=;
 b=u4p4d2HzC7YrGs3Gw1432VqCwcK++7DHetjlGIv/bJf+O9ghIyTSfNAqWGuprcXHiY
 ql1ZrGHUhRxWbHXtCVDJGJHfkCfPVoJmgvBEgK2FFfkyBAuel3PUk2DtMqMO/+TX0jkv
 C7QXDsvtugUJhrDVmGOih/oPZiR6YgMn8spWi6wFyvLZIDFEMqk9v9SpJDtjBrDrC587
 8O/YPHaE5eON4+tRUuQooXNgLOposW/TY1AfHfKLEp60+QDLrE959Bh4OHqbR38XD7ns
 y7uv1rWUyrNKxclIq6S8ZPuU7LfF3RVQ38XNEB7d6+BSiHv5qpXrzZ0XB/p0Lh4rKZ4N
 lIaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkc9if6cuOKrjCj+H5RaFIKbd4kn9u3RAu+m3ZXguoiSo2SWS3hfwm/Oc6j0dPnJGSmzMgafNcbg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yw20W7uK77pY+Yb7/B/Ytbn0YowMhbhKts0yCqw6ixeONuQBi3u
 CXcdj76kIt+syFsk6/SfTySm1eRRw8PFljrzHJ/QnEjrR+gDjUbMGl3SitmmkQmTpJb3y+l8+5I
 J9VBDFYZLJw0QdP7BbCxVRDi1bZCZY8Nzu1pAxh/ShKx70mpSULxUPZrHnteyfQI3bC6PBG3iOP
 Z35g==
X-Gm-Gg: AZuq6aJWxZWSXjd5XqKO0jlOzlvheXqONWXrlO41ekwHTzBUedENbo4UUWeMJ58CO8X
 4GuRXTfw7VGpw+g5qnpzowsol683KBvrT8bVayco+MlWEhsDHnvPnJu5OKE63IEAtt4MTCPOXOR
 QCg9k0t4cyovuyqFsm9cbs5JvRz5wBVRL+qwF+L3+B8EuZqx0ZkeffOJzKbTW9pV0GSyP1wUSk7
 3OPRiSQJi8yGI6JwOWjHmL9WeMlGkHW3a5GAXBraceNOTvSy9AFJHkpP/81Ft7E3vB0TdQBiz8l
 +k7rC9jD3MsI+fI3fxPz+uMqh+fGCfwwVB1MMgKhNGwaAOR/RKmYabcmxRyE21B/qGd15NhcomR
 4gxZhGFibt6QNudEKTxCEyJdO
X-Received: by 2002:a05:6a00:140e:b0:81f:517a:56e7 with SMTP id
 d2e1a72fcca58-8241c1f5201mr6197893b3a.30.1770277946431; 
 Wed, 04 Feb 2026 23:52:26 -0800 (PST)
X-Received: by 2002:a05:6a00:140e:b0:81f:517a:56e7 with SMTP id
 d2e1a72fcca58-8241c1f5201mr6197877b3a.30.1770277946089; 
 Wed, 04 Feb 2026 23:52:26 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8241d4abb49sm4223025b3a.64.2026.02.04.23.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 23:52:25 -0800 (PST)
Message-ID: <921bdec9-e5bb-4d16-955d-beefc9958d58@canonical.com>
Date: Wed, 4 Feb 2026 23:52:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ryan Foster <foster.ryan.r@gmail.com>
References: <20260120145024.261806-1-foster.ryan.r@gmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260120145024.261806-1-foster.ryan.r@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: replace strcpy with strscpy
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
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:foster.ryan.r@gmail.com,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:jmorris@namei.org,m:linux-security-module@vger.kernel.org,m:serge@hallyn.com,m:fosterryanr@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:mid];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: AB043EF9DB
X-Rspamd-Action: no action

On 1/20/26 06:50, Ryan Foster wrote:
> Found by checkpatch. Replace strcpy() with strscpy() for safer
> string handling per KSPP recommendations.
> 
> Two changes:
> - apparmorfs.c: gen_symlink_name() uses tracked buffer size
> - lib.c: aa_policy_init() uses exact allocation size
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Ryan Foster <foster.ryan.r@gmail.com>

this collides with two different patches I previously pulled in

1c90ed1f14c98 apparmor: Replace deprecated strcpy with memcpy in gen_symlink_name
b31d3f7385fbb apparmor: Replace sprintf/strcpy with scnprintf/strscpy in aa_policy_init

if you want to refresh this, I will look at pulling it in


> ---
>   security/apparmor/apparmorfs.c | 2 +-
>   security/apparmor/lib.c        | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 907bd2667e28..f38974231df2 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -1614,7 +1614,7 @@ static char *gen_symlink_name(int depth, const char *dirname, const char *fname)
>   		return ERR_PTR(-ENOMEM);
>   
>   	for (; depth > 0; depth--) {
> -		strcpy(s, "../../");
> +		strscpy(s, "../../", size);
>   		s += 6;
>   		size -= 6;
>   	}
> diff --git a/security/apparmor/lib.c b/security/apparmor/lib.c
> index 82dbb97ad406..7cb393f91a10 100644
> --- a/security/apparmor/lib.c
> +++ b/security/apparmor/lib.c
> @@ -487,7 +487,7 @@ bool aa_policy_init(struct aa_policy *policy, const char *prefix,
>   	} else {
>   		hname = aa_str_alloc(strlen(name) + 1, gfp);
>   		if (hname)
> -			strcpy(hname, name);
> +			strscpy(hname, name, strlen(name) + 1);
>   	}
>   	if (!hname)
>   		return false;


