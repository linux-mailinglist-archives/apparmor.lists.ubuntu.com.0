Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 31730C8C8E5
	for <lists+apparmor@lfdr.de>; Thu, 27 Nov 2025 02:34:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vOQtf-0005jh-64; Thu, 27 Nov 2025 01:34:11 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vOQtd-0005jQ-0r
 for apparmor@lists.ubuntu.com; Thu, 27 Nov 2025 01:34:09 +0000
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E21133FB78
 for <apparmor@lists.ubuntu.com>; Thu, 27 Nov 2025 01:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1764207247;
 bh=TRKfXOlkmwqNMgnglxoR4XVNauUDD3kM3GM5CwFK/jE=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=W93t6f7qQSrSwXDFHBR3LyPIpj5RdArC8xD7PHx7CgDizd8Qx/iTuDFppAev9DyQt
 4PZ8UReujZobcyxbVh1rrz3PEY4pfP2vZ+ER05SMM/29bL+k9ejo/vf9yGL2d8tSff
 IjXQa+a7kSla4nu/pyURxkiZX0Vx4+bLt7e/nx/Rg3BzX27d4FscQLT/2EHdHmFp1g
 ketwevHZfqPi2Q+6oHLVjHz7Lxo9CJEA/ck0VipHrSRRHkEgMKIblldxecIyaGlPQF
 gttfxGrNuJEJtk4LhKWDyGbvmmpAbfc7lJCGrTIfC97H3fFiwY//x+4WD9GsO7aciw
 IRXe6LEvk9UWPUl9SuCBsW3JjpJzpU5IJvstBDj49YsTk01T2bCcXBcH9bcWrBFE05
 glfN+VwMJQ0YIri2CYeISqITW7814VP5v6PjEQcbwd5rDPiP9Ea+lrwkBWId9e6coJ
 oDP4+LWXFdO8Nto+YyZFBDykQNErnrKu6u5+DHEOw2xJeoHOWoFGlQ5KU97cMoPkH9
 keKOv2QXVrRHsT+ne8dgBENz4b9OE3VCgHW6P0uxqWe9zZsnaKdGKjeMrxSew1fhdt
 cyAryLp0lFov1ShuJh8vd05arH5VQNJUwLJwHBflwZJNU8h+X8f21ZzgCe/YCeap0U
 tKnowXAMwcPYncrGDrsXrAXU=
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34378c914b4so642547a91.1
 for <apparmor@lists.ubuntu.com>; Wed, 26 Nov 2025 17:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764207246; x=1764812046;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRKfXOlkmwqNMgnglxoR4XVNauUDD3kM3GM5CwFK/jE=;
 b=U2vPf2pZe3B5HlLOG0cHgvnbpUt/5vs87Tzd33Ag4jyVoY9MgvskE7L1f1rF1fHL3H
 YHcjLFEdRT+q+CBikHaPD/jQLjpR6kdU367a+V9Qi0QnkJ4dGkQfgSl7HcBjfCLermvW
 SP8zOLgCJPsm0FCnnujZJtC38Mk45bleTAzu/LL3RCOGA+/lGEZ4NUvJ/0h7qmTdiFXl
 nGp3rMgQtCGyuda6bajt8RiWUHCrMeUXv6BWtzZrZLez8bAQ3Q4y8bv5vIpfnc46+JXe
 rohk9TLY9nxfc/t6SEP4BeBv602XF1CYIjXfLOt+OgX+IpUT6DA71NmMl5bEFPS7aiTH
 QAig==
X-Gm-Message-State: AOJu0Yyt3Y55dFVLKrQe6/6lC8cw1MSOQ0xLbyu44YosfR8J6lr4PFeo
 Z5fJje1eIDy02wJSo4gfAcpSwStkzpQufWiiytgvB8FZt+2h7FrPZdYxHfih0TLZOofquVWJw1x
 EgQ0RCLjkFI589ZLxrJgs5q6FIGT5BjvBQqYbtRdBKFpdi78H0otaWuffYl/DZTYtacU7RSyui+
 erSA==
X-Gm-Gg: ASbGncu3JVi4mhUla6TdgfLEBOvbRnLYJHVpoghFeWhnXocx9X5zjJ+Z4j6uwPbKsTu
 P3WKNMENoGoBvOpD9Lu7mt00F9KOmofvSNwjXhu0yACSQTlbJDhmO9Bb7IGlGeHc3web5qkKnyb
 1H3J1YgDeFtHhZmcFvpo8jvTMBGO7IBxOxxOboxYDP9npb6QMw1h5hN5jP31Y5GNyqva33HMVAA
 V7kDljDdj6av8QoBHC9L8iUhI9Uthev5ENOCmrnmmPttYuvR4cVU8nnTfHJRAZV31aWGv8CUjG0
 b99dlARPKtxzLW2Tc64FlzC4blNZmHh588FAzGMNaZNU4oMq10l57fnxZge5d765QWwcC9DFyNT
 Z6sJUTkRkxSmIfOCxAlXXr5Hw
X-Received: by 2002:a17:90b:4c48:b0:32e:5d87:8abc with SMTP id
 98e67ed59e1d1-34733f3f6d5mr18438371a91.36.1764207246559; 
 Wed, 26 Nov 2025 17:34:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnJZaIInZT52MCGIw+E2FRhO95wkEz5Pp9AmAdLIMmkYiGQZYS09ZQ458I/EYl5otmbG76iA==
X-Received: by 2002:a17:90b:4c48:b0:32e:5d87:8abc with SMTP id
 98e67ed59e1d1-34733f3f6d5mr18438351a91.36.1764207246214; 
 Wed, 26 Nov 2025 17:34:06 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-3476a59e4afsm3828879a91.10.2025.11.26.17.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 17:34:05 -0800 (PST)
Message-ID: <4e34cddb-2d21-4c2c-bf9d-a377ba55ddb1@canonical.com>
Date: Wed, 26 Nov 2025 17:34:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
References: <20251122115446.447925-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20251122115446.447925-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH RESEND] apparmor: replace sprintf with
 snprintf in aa_new_learning_profile
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

On 11/22/25 03:54, Thorsten Blum wrote:
> Replace unbounded sprintf() calls with snprintf() to prevent potential
> buffer overflows in aa_new_learning_profile(). While the current code
> works correctly, snprintf() is safer and follows secure coding best
> practices.  No functional changes.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

I have pulled this into my tree


Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/policy.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
> index 50d5345ff5cb..b09323867fea 100644
> --- a/security/apparmor/policy.c
> +++ b/security/apparmor/policy.c
> @@ -697,24 +697,27 @@ struct aa_profile *aa_new_learning_profile(struct aa_profile *parent, bool hat,
>   	struct aa_profile *p, *profile;
>   	const char *bname;
>   	char *name = NULL;
> +	size_t name_sz;
>   
>   	AA_BUG(!parent);
>   
>   	if (base) {
> -		name = kmalloc(strlen(parent->base.hname) + 8 + strlen(base),
> -			       gfp);
> +		name_sz = strlen(parent->base.hname) + 8 + strlen(base);
> +		name = kmalloc(name_sz, gfp);
>   		if (name) {
> -			sprintf(name, "%s//null-%s", parent->base.hname, base);
> +			snprintf(name, name_sz, "%s//null-%s",
> +				 parent->base.hname, base);
>   			goto name;
>   		}
>   		/* fall through to try shorter uniq */
>   	}
>   
> -	name = kmalloc(strlen(parent->base.hname) + 2 + 7 + 8, gfp);
> +	name_sz = strlen(parent->base.hname) + 2 + 7 + 8;
> +	name = kmalloc(name_sz, gfp);
>   	if (!name)
>   		return NULL;
> -	sprintf(name, "%s//null-%x", parent->base.hname,
> -		atomic_inc_return(&parent->ns->uniq_null));
> +	snprintf(name, name_sz, "%s//null-%x", parent->base.hname,
> +		 atomic_inc_return(&parent->ns->uniq_null));
>   
>   name:
>   	/* lookup to see if this is a dup creation */



