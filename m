Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E1B681BB6
	for <lists+apparmor@lfdr.de>; Mon, 30 Jan 2023 21:47:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pMb3D-0003rb-9d; Mon, 30 Jan 2023 20:46:51 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pMb3B-0003rT-OO
 for apparmor@lists.ubuntu.com; Mon, 30 Jan 2023 20:46:49 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 60F753F307; 
 Mon, 30 Jan 2023 20:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1675111609;
 bh=RXq2UM0+WksUOmibUuTIAvL8Lbl2rVqMKpgMUhz1XeM=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ZXDgPGfEC8pCqG7c2Nm0foAQ7q+/b2tORV74ptp1ctfm/vxQARMlBskLaMjKWTjpY
 GMJVpi21mhw9NFbHsRFuWis3hQ/86sx3V4kLpTK2FsjGkxQMwMiCrnSsbB9wHVXQF6
 SwZmPQWQermRBQ7ODwuaeMSBQPsDch/QfX0oU8QxhcW8Knxm/xnPlFN7JtpGG/RVIz
 RZDrjT9BzegIJUEjd2qT05WyY9yvu1uX7+HoeQPiUzveAGOi/t44wJN+KEwf28WYc+
 9aceCaeUeSnbeOVGzH1K7T0wntnTVzvyUXv4BpK/WEty1hlaj1i/HNW7H+NS2Hzm8j
 IgP3Yf0Vhdn7A==
Message-ID: <94ba4bd9-5aaf-2469-457c-196b864c76f1@canonical.com>
Date: Mon, 30 Jan 2023 12:46:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Rae Moar <rmoar@google.com>, brendanhiggins@google.com,
 davidgow@google.com, dlatypov@google.com
References: <20230127201219.775410-1-rmoar@google.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230127201219.775410-1-rmoar@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH v1] apparmor: fix use of strcpy in
	policy_unpack_test
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
Cc: kernel test robot <lkp@intel.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 1/27/23 12:12, Rae Moar wrote:
> Replace the use of strcpy() in build_aa_ext_struct() in
> policy_unpack_test.c with strscpy().
> 
> strscpy() is the safer method to use to ensure the buffer does not
> overflow. This was found by kernel test robot:
> https://lore.kernel.org/all/202301040348.NbfVsXO0-lkp@intel.com/.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Signed-off-by: Rae Moar <rmoar@google.com>

lgtm

I have pulled this into apparmor-next

> ---
> 
> Note: This patch is based on the apparmor-next branch. However, the
> patch should also apply cleanly to the kselftest/kunit branch.
> 
>   security/apparmor/policy_unpack_test.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/security/apparmor/policy_unpack_test.c b/security/apparmor/policy_unpack_test.c
> index e1bfdab524b7..5c9bde25e56d 100644
> --- a/security/apparmor/policy_unpack_test.c
> +++ b/security/apparmor/policy_unpack_test.c
> @@ -69,31 +69,30 @@ static struct aa_ext *build_aa_ext_struct(struct policy_unpack_fixture *puf,
>   
>   	*buf = AA_NAME;
>   	*(buf + 1) = strlen(TEST_STRING_NAME) + 1;
> -	strcpy(buf + 3, TEST_STRING_NAME);
> +	strscpy(buf + 3, TEST_STRING_NAME, e->end - (void *)(buf + 3));
>   
>   	buf = e->start + TEST_STRING_BUF_OFFSET;
>   	*buf = AA_STRING;
>   	*(buf + 1) = strlen(TEST_STRING_DATA) + 1;
> -	strcpy(buf + 3, TEST_STRING_DATA);
> -
> +	strscpy(buf + 3, TEST_STRING_DATA, e->end - (void *)(buf + 3));
>   	buf = e->start + TEST_NAMED_U32_BUF_OFFSET;
>   	*buf = AA_NAME;
>   	*(buf + 1) = strlen(TEST_U32_NAME) + 1;
> -	strcpy(buf + 3, TEST_U32_NAME);
> +	strscpy(buf + 3, TEST_U32_NAME, e->end - (void *)(buf + 3));
>   	*(buf + 3 + strlen(TEST_U32_NAME) + 1) = AA_U32;
>   	*((u32 *)(buf + 3 + strlen(TEST_U32_NAME) + 2)) = TEST_U32_DATA;
>   
>   	buf = e->start + TEST_NAMED_U64_BUF_OFFSET;
>   	*buf = AA_NAME;
>   	*(buf + 1) = strlen(TEST_U64_NAME) + 1;
> -	strcpy(buf + 3, TEST_U64_NAME);
> +	strscpy(buf + 3, TEST_U64_NAME, e->end - (void *)(buf + 3));
>   	*(buf + 3 + strlen(TEST_U64_NAME) + 1) = AA_U64;
>   	*((u64 *)(buf + 3 + strlen(TEST_U64_NAME) + 2)) = TEST_U64_DATA;
>   
>   	buf = e->start + TEST_NAMED_BLOB_BUF_OFFSET;
>   	*buf = AA_NAME;
>   	*(buf + 1) = strlen(TEST_BLOB_NAME) + 1;
> -	strcpy(buf + 3, TEST_BLOB_NAME);
> +	strscpy(buf + 3, TEST_BLOB_NAME, e->end - (void *)(buf + 3));
>   	*(buf + 3 + strlen(TEST_BLOB_NAME) + 1) = AA_BLOB;
>   	*(buf + 3 + strlen(TEST_BLOB_NAME) + 2) = TEST_BLOB_DATA_SIZE;
>   	memcpy(buf + 3 + strlen(TEST_BLOB_NAME) + 6,
> @@ -102,7 +101,7 @@ static struct aa_ext *build_aa_ext_struct(struct policy_unpack_fixture *puf,
>   	buf = e->start + TEST_NAMED_ARRAY_BUF_OFFSET;
>   	*buf = AA_NAME;
>   	*(buf + 1) = strlen(TEST_ARRAY_NAME) + 1;
> -	strcpy(buf + 3, TEST_ARRAY_NAME);
> +	strscpy(buf + 3, TEST_ARRAY_NAME, e->end - (void *)(buf + 3));
>   	*(buf + 3 + strlen(TEST_ARRAY_NAME) + 1) = AA_ARRAY;
>   	*((u16 *)(buf + 3 + strlen(TEST_ARRAY_NAME) + 2)) = TEST_ARRAY_SIZE;
>   
> 
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2


