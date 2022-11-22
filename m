Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF0C633523
	for <lists+apparmor@lfdr.de>; Tue, 22 Nov 2022 07:14:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oxMXg-00033G-Pi; Tue, 22 Nov 2022 06:14:00 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oxMXf-000339-3W
 for apparmor@lists.ubuntu.com; Tue, 22 Nov 2022 06:13:59 +0000
Received: from [192.168.192.83] (unknown [50.47.159.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 87E763FA58; 
 Tue, 22 Nov 2022 06:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1669097638;
 bh=4/b1MCIFM013mc1FCJkM3gyJYez6X70iqknZ8/JDI5A=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=C5IQaou2fwknUgSeGBFTvhUBUwWlj1dx6PFZeRumV16ZStQXeBIErLdZnAxt+BwjL
 UKvcfimfJb5wO23Tgzgw8PUZ5RotKLLOfAb5ijtQW6MZ/AoBqIMKOFRAnUp2uUnjUy
 YiGwqH45A5LO7exT4qS0hGgT/ixJeyM0n0fpSvuuhqrFeCi9zmJE0lPifFzk9WOaLG
 CRWa/xjn0SarnQJT4uWIjI3uuZypG+lOFVyV0cH+KpzwcjBI7b3LYCjHSBr74gyYEX
 tcXQzZfdhgyF0+HJw4+1G0iZ0TjwQ+Hn/tWeUVwRvlQZVqg2x/HOAaAFKyOnN4jsxm
 YOEBg+NgeOgrw==
Message-ID: <c9cbef8d-100f-763e-12b2-248dccd812fa@canonical.com>
Date: Mon, 21 Nov 2022 22:13:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Rae Moar <rmoar@google.com>, brendanhiggins@google.com,
 davidgow@google.com, dlatypov@google.com
References: <20221102175959.2921063-1-rmoar@google.com>
 <20221102175959.2921063-2-rmoar@google.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221102175959.2921063-2-rmoar@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH v1 1/2] kunit: add macro to allow
 conditionally exposing static symbols to tests
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
Cc: tales.aparecida@gmail.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 11/2/22 10:59, Rae Moar wrote:
> Create two macros:
> 
> VISIBLE_IF_KUNIT - A macro that sets symbols to be static if CONFIG_KUNIT
> is not enabled. Otherwise if CONFIG_KUNIT is enabled there is no change
> to the symbol definition.
> 
> EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
> EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is enabled. Must
> use MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING) in test file in order to
> use symbols.
> 
> Signed-off-by: Rae Moar <rmoar@google.com>

This looks fine
Reviewed-by: John Johansen <john.johansen@canonical.com>

> ---
>   include/kunit/visibility.h | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>   create mode 100644 include/kunit/visibility.h
> 
> diff --git a/include/kunit/visibility.h b/include/kunit/visibility.h
> new file mode 100644
> index 000000000000..eb22c9e6b4eb
> --- /dev/null
> +++ b/include/kunit/visibility.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * KUnit API to allow symbols to be conditionally visible during KUnit
> + * testing
> + *
> + * Copyright (C) 2019, Google LLC.
> + * Author: Brendan Higgins <brendanhiggins@google.com>
> + */
> +
> +#ifndef _KUNIT_VISIBILITY_H
> +#define _KUNIT_VISIBILITY_H
> +
> +/**
> + * VISIBLE_IF_KUNIT - A macro that sets symbols to be static if CONFIG_KUNIT
> + * is not enabled. Otherwise if CONFIG_KUNIT is enabled there is no change
> + * to the symbol definition.
> + *
> + * EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
> + * EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is
> + * enabled. Must use MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING)
> + * in test file in order to use symbols.
> + */
> +#if IS_ENABLED(CONFIG_KUNIT)
> +    #define VISIBLE_IF_KUNIT
> +    #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, \
> +	    EXPORTED_FOR_KUNIT_TESTING)
> +#else
> +    #define VISIBLE_IF_KUNIT static
> +    #define EXPORT_SYMBOL_IF_KUNIT(symbol)
> +#endif
> +
> +#endif /* _KUNIT_VISIBILITY_H */


