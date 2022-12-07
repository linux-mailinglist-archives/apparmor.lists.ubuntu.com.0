Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 409A064522F
	for <lists+apparmor@lfdr.de>; Wed,  7 Dec 2022 03:43:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p2kOu-0004Hf-Mx; Wed, 07 Dec 2022 02:43:12 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1p2kOs-0004HP-QO
 for apparmor@lists.ubuntu.com; Wed, 07 Dec 2022 02:43:10 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 5B6EA423FD; 
 Wed,  7 Dec 2022 02:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1670380990;
 bh=AyqmyTETt8sSaAzP7S+Vz9Kwo2mKJ2hXybWEyJnLAYQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ab4JVNizrbEoXQnI45C6o9f0hiwOHhclv4Tm1dOFq2Xum0UFFTmtjWXN8ekJ2HFWC
 ZcjNeKD8CV5y+0aKJ82hWYK+Y8lCKfMHClY8T7jPYThDZMCYiqEd2XozGcJy5cDp6m
 eZ2JfwCPuNV0kFT2WK5Owq7om1V+r1p+G4+/rNJejsHG/LleDNkwS6jSaIsZXT9FTv
 vka5qd5KGGew9ihTRpC/IPmPJiI4E81wHTiKBeuuvDu+xrtKKXTulJ6ij1LeiS24ZO
 Ml10dwnklj2ydeZSVocRqaqbiboWXidveB0qrNOjM4FQiHztljbFknG/u3GFkjpEsa
 CnwE6lTYFxZzQ==
Message-ID: <3bc67108-9f4a-4cd7-619d-d61816625e1a@canonical.com>
Date: Tue, 6 Dec 2022 18:43:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Rae Moar <rmoar@google.com>, brendanhiggins@google.com,
 davidgow@google.com, dlatypov@google.com
References: <20221207014024.340230-1-rmoar@google.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221207014024.340230-1-rmoar@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH v3 0/2] kunit: add macro to allow
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

On 12/6/22 17:40, Rae Moar wrote:
> Currently in order to test a static function, tests must be included in the
> same translation unit as the function. However, this can cause issues with
> including implementation and test code in the same file. As an alternative,
> the first patch in this series creates a macro that will set a function to
> be static or not depending on whether CONFIG_KUNIT is enabled. This allows
> the function to be visible during testing and static otherwise.
> 
> As an example, the current status quo to test static functions is:
> 
> === test.c ===
> 
> static void test_case(struct kunit *test)
> {
>    KUNIT_EXPECT_EQ(test, my_func_to_test(), 2);
> }
> 
> Then the tests are included in the implementation file as a workaround to
> the issue of testing static functions:
> 
> === implementation.c ===
> 
> static int my_func_to_test() {...}
> ...
> #include "test.c"
> 
> Instead, the function could be defined with this new macro:
> 
> === implementation.c ===
> 
> VISIBLE_IF_KUNIT int my_func_to_test() {...}
> 
> The first patch also creates a macro that will export a symbol into a kunit
> testing namespace only if CONFIG_KUNIT is enabled. This follows the logic
> above and allows symbols to be conditionally exported based on the testing
> status.
> 
> The second patch in the series updates the policy_unpack test in AppArmor
> to show an example of how to use both of these macros in order to address
> the issue of testing static functions. Additionally, the patch allows the
> policy_unpack test to be built as a module.
> 
> Changes since v2:
>   - Add mention of namespacing symbols to the commit message of the
>     second patch.
>   - Change module name in the second patch from policy_unpack_test to
>     apparmor_policy_unpack_test.
> 
> Changes since v1:
>   - Changed the namespace of exported symbols for the apparmor
>     policy_unpack_test by adding the aa_ prefix.
>   - Separated the documentation comments for macros in
>     include/kunit/visibility.h.
>   - Changed copyright date and author for include/kunit/visibility.h.
> 
> Rae Moar (2):
>    kunit: add macro to allow conditionally exposing static symbols to
>      tests
>    apparmor: test: make static symbols visible during kunit testing
> 
>   include/kunit/visibility.h                |  33 +++
>   security/apparmor/Kconfig                 |   4 +-
>   security/apparmor/Makefile                |   3 +
>   security/apparmor/include/policy_unpack.h |  50 +++++
>   security/apparmor/policy_unpack.c         | 238 ++++++++++------------
>   security/apparmor/policy_unpack_test.c    |  69 ++++---
>   6 files changed, 229 insertions(+), 168 deletions(-)
>   create mode 100644 include/kunit/visibility.h
> 
> 
> base-commit: 0f08f3e2a0186dfb8e33cb46105228eb18448a0e

thanks Rae,

looks good to me, David unless you tell me otherwise I assume this is
still going in via the kselftest/kunit tree.


