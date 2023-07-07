Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 748A574B248
	for <lists+apparmor@lfdr.de>; Fri,  7 Jul 2023 15:56:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qHlwu-0006fY-HJ; Fri, 07 Jul 2023 13:56:40 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <georgia.garcia@canonical.com>) id 1qHlws-0006f9-0i
 for apparmor@lists.ubuntu.com; Fri, 07 Jul 2023 13:56:38 +0000
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 889C03F438
 for <apparmor@lists.ubuntu.com>; Fri,  7 Jul 2023 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1688738197;
 bh=HhoEDvLUHji0H4nkgmBsSeZ1ppMwCe3pxCokQT59sj8=;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
 Content-Type:MIME-Version;
 b=qkLHxKo53O/ne2jR2HO6CeOu67ad/TSc0EV3xUCxLdYo2LlfTgOH+5UNU+nMGhctI
 ujkYmvhU/yxhj9rVDsdwXMP/p5GNpAK5MVymBryyDHF+jC7fjK+mW3NuaE6atZwaD1
 a81j+0u7iYUxeY5BCRZfVndVCefj8fuR5IFTMr8/RemLGVIVhegrFtQ3rE0rrqxBGI
 WOh5wDNIzFyNEH/SdwraEDaUUohdffeNRH3W7fxLU2x6p6hyIX4lrvpewnIPtD6y6V
 VS3BEO+V3wggI38HI9JLMchSjldkdTbcZqs6g/BRMb579FZcEn4tOre3pig1ttA9AR
 r1/wJZE6BtufQ==
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-6b75210454eso1926895a34.2
 for <apparmor@lists.ubuntu.com>; Fri, 07 Jul 2023 06:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688738196; x=1691330196;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HhoEDvLUHji0H4nkgmBsSeZ1ppMwCe3pxCokQT59sj8=;
 b=H6UbKmSF+8EwoZDeZS7tsAmaHJAdZrII13iDtfc//5EGxk+YmZdKwplzfFDfrnE+Rh
 ATbIFJZF5TMIA/leyeranBgd2fk9XoBETrYfTn1c4KZvF0AAxU2dLLkkqiqiuD63G159
 iFpDrUFM0HgF8bU9qhCOTjkgimKYdp2d33PQyFTAEfdLZOFQGYTJWNtWp1GapEnJQVbb
 u8BvsuZVpL7RFjKR4BqvDvETMreGi37+GNNki0Hc1j3lh5/AygkxHMR8PUpzaAim3BAt
 hxON+s7SUAH8GBfi9Rui94NgHkgYH7GQuAnl0JW3Zr9oaUrTOCGuXuCsdqVOUAjabNqT
 jFsw==
X-Gm-Message-State: ABy/qLb26R5PWpGsnFUWGQydTtcsZGDVGqVN58d4072NbQ7igyXrLUA1
 dCKXDwSQ/plrLIJKcBgRc74e2UGq3Y+3O3/jbFv6q0gawkfVmFvKAy2NALssbmoR8v8UwKwmUY1
 timWGM+JLRn5/ZzvKdYZxGNkwPxtfqrgawTvwgQ==
X-Received: by 2002:a9d:5e19:0:b0:6b7:54b1:6524 with SMTP id
 d25-20020a9d5e19000000b006b754b16524mr4557654oti.36.1688738196352; 
 Fri, 07 Jul 2023 06:56:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFT7uVWhdX8H+KII3j64afpzIpjFPfqSi1VhYQ7wQdJmKWCkIZ4/DldFwQnKVCcDHzQ2XJQlg==
X-Received: by 2002:a9d:5e19:0:b0:6b7:54b1:6524 with SMTP id
 d25-20020a9d5e19000000b006b754b16524mr4557641oti.36.1688738196114; 
 Fri, 07 Jul 2023 06:56:36 -0700 (PDT)
Received: from ?IPv6:2001:1284:f02e:6c12:3fa7:9073:5b23:9e41?
 ([2001:1284:f02e:6c12:3fa7:9073:5b23:9e41])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a056830328e00b006b71deb7809sm1684336ott.14.2023.07.07.06.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 06:56:35 -0700 (PDT)
Message-ID: <9f12342f083bca94e3b7392c8e3bfbdca4d3e2b4.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>, john.johansen@canonical.com, 
 paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Date: Fri, 07 Jul 2023 10:56:31 -0300
In-Reply-To: <20230625011349.1457810-11-cuigaosheng1@huawei.com>
References: <20230625011349.1457810-1-cuigaosheng1@huawei.com>
 <20230625011349.1457810-11-cuigaosheng1@huawei.com>
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Subject: Re: [apparmor] [PATCH -next 10/11] apparmor: Fix kernel-doc
 warnings in apparmor/policy_compat.c
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi, Gaosheng Cui

On Sun, 2023-06-25 at 09:13 +0800, Gaosheng Cui wrote:
> Fix kernel-doc warnings:
>=20
> security/apparmor/policy_compat.c:151: warning: Function parameter
> or member 'size' not described in 'compute_fperms'
>=20
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  security/apparmor/policy_compat.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/security/apparmor/policy_compat.c b/security/apparmor/policy=
_compat.c
> index 0cb02da8a319..18e4ddccf623 100644
> --- a/security/apparmor/policy_compat.c
> +++ b/security/apparmor/policy_compat.c
> @@ -143,6 +143,7 @@ static struct aa_perms compute_fperms_other(struct aa=
_dfa *dfa,
>   * compute_fperms - convert dfa compressed perms to internal perms and s=
tore
>   *		    them so they can be retrieved later.
>   * @dfa: a dfa using fperms to remap to internal permissions
> + * @size: the permission table size

I believe the size is returned, right?

>   *
>   * Returns: remapped perm table
>   */

Thanks,
Georgia

