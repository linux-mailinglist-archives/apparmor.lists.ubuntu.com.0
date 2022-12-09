Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E96A3647E3D
	for <lists+apparmor@lfdr.de>; Fri,  9 Dec 2022 08:04:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p3XRA-0007Pz-Et; Fri, 09 Dec 2022 07:04:48 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1p3XR8-0007Ps-Kr
 for apparmor@lists.ubuntu.com; Fri, 09 Dec 2022 07:04:46 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id CA85542546; 
 Fri,  9 Dec 2022 07:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1670569486;
 bh=Rw1LgZrAHKmOPFMlSc8m5mrXgg+i195LB/soUVfMO7k=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=eydc90K9HuIjQkBqAUlYJQp7LGFNmC1aNsirsLOaDf5E7KLee6uWYR5ckh8ZoWeyd
 t706NyaJjw1c1R7pmNJfZRab/gcaBPTdJ15FAnol2SiJ4/cknZJznk79ZhAHrbYBaZ
 oSQHraCbffz+QER9UpKaYFDssMwG3kYrxkVJtk8piZ3FtWaOi32aWcizaSDCFbEuBw
 YagtGmtx4RUf91Ww6QK23XLYjWWRm+LypLvi6CKtmOZO2L+0fbJAUPpTVubWp5IY5c
 7Km1L+tu6xQ8Lv/Qg1DaIalqpCNNjnNo5UFTkfZGw5fYiQvW+TLjAP7WeQExZ0BYzh
 PZXwRlVtx2VuA==
Message-ID: <9d9564a4-cf78-4eee-465b-90f0e7b2fdff@canonical.com>
Date: Thu, 8 Dec 2022 23:04:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: David Gow <davidgow@google.com>, Naresh Kamboju <naresh.kamboju@linaro.org>
References: <CA+G9fYu5JjZzpFfNOqzLV+KQnSL1VU7n8Yv-FrZYvuvwo1Ayug@mail.gmail.com>
 <CABVgOSms-8vXDVX68JX-4UEnaGyCgVyNWH37W8qGz7eVtFcWag@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <CABVgOSms-8vXDVX68JX-4UEnaGyCgVyNWH37W8qGz7eVtFcWag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] security: policy_unpack.c:325:10: error: use of
 undeclared identifier 'TRI_TRUE'
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
Cc: apparmor@lists.ubuntu.com, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Rae Moar <rmoar@google.com>,
 Nick Terrell <terrelln@fb.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 12/8/22 22:57, David Gow wrote:
> On Thu, 8 Dec 2022 at 15:36, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> Following build regresion found on Linux next-20221208 tag.
>>
>> Regressions found on riscv:
>>    - build/clang-nightly-defconfig
>>    - build/gcc-8-defconfig
>>    - build/gcc-11-defconfig
>>    - build/clang-15-defconfig
>>
>> make --silent --keep-going --jobs=8
>> O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
>> ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- 'HOSTCC=sccache clang'
>> 'CC=sccache clang' defconfig
>> make --silent --keep-going --jobs=8
>> O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
>> ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- 'HOSTCC=sccache clang'
>> 'CC=sccache clang'
>> security/apparmor/policy_unpack.c:316:18: error: unknown type name 'tri'
>> VISIBLE_IF_KUNIT tri aa_unpack_array(struct aa_ext *e, const char
>> *name, u16 *size)
>>                   ^
>> security/apparmor/policy_unpack.c:325:10: error: use of undeclared
>> identifier 'TRI_TRUE'
>>                  return TRI_TRUE;
>>                         ^
>> security/apparmor/policy_unpack.c:328:9: error: use of undeclared
>> identifier 'TRI_NONE'
>>          return TRI_NONE;
>>                 ^
>> security/apparmor/policy_unpack.c:331:9: error: use of undeclared
>> identifier 'TRI_FALSE'
>>          return TRI_FALSE;
>>                 ^
>> security/apparmor/policy_unpack.c:455:42: error: use of undeclared
>> identifier 'TRI_TRUE'
>>                  if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
>>                                                         ^
>> security/apparmor/policy_unpack.c:529:42: error: use of undeclared
>> identifier 'TRI_TRUE'
>>                  if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
>>                                                         ^
>> security/apparmor/policy_unpack.c:559:42: error: use of undeclared
>> identifier 'TRI_TRUE'
>>                  if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
>>                                                         ^
>> security/apparmor/policy_unpack.c:611:42: error: use of undeclared
>> identifier 'TRI_TRUE'
>>                  if (aa_unpack_array(e, NULL, &size) != TRI_TRUE ||
>>                                                         ^
>> security/apparmor/policy_unpack.c:674:42: error: use of undeclared
>> identifier 'TRI_TRUE'
>>                  if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
>>                                                         ^
>> 9 errors generated.
>> make[4]: *** [scripts/Makefile.build:252:
>> security/apparmor/policy_unpack.o] Error 1
>> make[4]: Target 'security/apparmor/' not remade because of errors.
>> make[3]: *** [scripts/Makefile.build:504: security/apparmor] Error 2
>>
>> Build link,
>>    - https://builds.tuxbuild.com/2IcJeyR3s4kGd2Nca8vVq7Sleao/
>>    - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221208/testrun/13508560/suite/build/test/gcc-11-defconfig/details/
>>
>> Build results comparison:
>>    - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221208/testrun/13508560/suite/build/test/gcc-11-defconfig/history/
>>
>>
>> steps to reproduce:
>> # To install tuxmake on your system globally:
>> # sudo pip3 install -U tuxmake
>> #
>> # See https://docs.tuxmake.org/ for complete documentation.
>> # Original tuxmake command with fragments listed below.
>> # tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
>> --kconfig defconfig
>>
>>
>> tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
>> --kconfig https://builds.tuxbuild.com/2IcJeyR3s4kGd2Nca8vVq7Sleao/config
>>
>> --
>> Linaro LKFT
>> https://lkft.linaro.org
> 
> I suspect this is in need of the fix here:
> https://lore.kernel.org/all/bff89220-df3a-a148-2ba4-6aad3874f322@canonical.com/
> 

yes, that is what is needed to fix this



