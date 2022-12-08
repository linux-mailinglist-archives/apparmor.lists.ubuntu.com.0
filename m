Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 181DD647465
	for <lists+apparmor@lfdr.de>; Thu,  8 Dec 2022 17:34:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p3Jqs-0002Ys-9w; Thu, 08 Dec 2022 16:34:26 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <naresh.kamboju@linaro.org>) id 1p3BSR-0006OC-24
 for apparmor@lists.ubuntu.com; Thu, 08 Dec 2022 07:36:39 +0000
Received: by mail-qk1-f176.google.com with SMTP id j26so299274qki.10
 for <apparmor@lists.ubuntu.com>; Wed, 07 Dec 2022 23:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=97CF61NxNfINvAmFCHySr8pBYXl0fpYSbMxv8vXatSE=;
 b=QlyXdnWfeAGEZrdOzy9s6Z4X237j8Pipot9BBuCfCRDqWCQpOi464m8FComOVhAP8a
 3UewOiGSWl2flvhaBM//5YFvyOVH0AafmRZokxXAXiH2pMK3/MDpcBsMF6IdvRVyrJ//
 sUJFaGIBWiR4PuKQVzsIl6PPuhbj0gJBlF/OeXi1KmkFnYfG9FSXo9QZ1N4jxVmwB6MD
 c+A8DPLIq1Wa59nidmiqsn3XihHjDvYBo2YeNIum0v9E7Yf1YwAq3GruNpD1e9hZTkum
 JJCsENXYTiW/+pnS0uT6UEGIEZ8YO6JogP/pe+MLwxHIBWWjYkaIOhw73prhhgFsJWtg
 GOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=97CF61NxNfINvAmFCHySr8pBYXl0fpYSbMxv8vXatSE=;
 b=MtNg/WJg5+DV1PixD9HnUoRB6aiKuD1NnuSTmUXZDpWj48Fee5egMzouRD41xY1GWq
 /1AQTfjq+DMUcgVuTjaxqZE3i4NwMlcsnR2HWCCC7xkxtEd2N9tCW1h0xelDciKwQ50v
 vPX1nHk72HrulUU1wNXdR+B2VYYxLRwN6gCdFOJqc0lb9Gv3GI68c6HXcB32OuyUoIR6
 An5lvc/sJhkyskY7H6HbHSRdM15ILoMCC54CliE7pye/otXzQpvwec8UAQzVJj9cayZt
 GExUZlrea5u0Bw0xw2dDa9Gt2ZE4fmP1yH5H30fio4cwYyM9Ie48NQ9XApWhmOXcONB+
 hx3A==
X-Gm-Message-State: ANoB5pn9fgval3rcmq2y9wcMsh/zoDtYs+NMC+ZVDjz2PQSCwIHGNfmW
 aMhKihLxa8cXitx+mFQsh7uoob5UyFlbRI/M+cVpI7AkuCFI514M
X-Google-Smtp-Source: AA0mqf5OdwKrHO32/1x7P/rNBKW+fZ551hgS5X0cGSFAUGwcbf2vK6lAreSWv++D00yRLWC6YrOQ28myI+AyLgolrfQ=
X-Received: by 2002:a05:620a:13aa:b0:6fc:99c2:2567 with SMTP id
 m10-20020a05620a13aa00b006fc99c22567mr30870312qki.784.1670484997799; Wed, 07
 Dec 2022 23:36:37 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 8 Dec 2022 13:06:26 +0530
Message-ID: <CA+G9fYu5JjZzpFfNOqzLV+KQnSL1VU7n8Yv-FrZYvuvwo1Ayug@mail.gmail.com>
To: open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 lkft-triage@lists.linaro.org, apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 08 Dec 2022 16:34:25 +0000
Subject: [apparmor] security: policy_unpack.c:325:10: error: use of
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
Cc: Nick Terrell <terrelln@fb.com>, Rae Moar <rmoar@google.com>,
 David Gow <davidgow@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Following build regresion found on Linux next-20221208 tag.

Regressions found on riscv:
  - build/clang-nightly-defconfig
  - build/gcc-8-defconfig
  - build/gcc-11-defconfig
  - build/clang-15-defconfig

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang' defconfig
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang'
security/apparmor/policy_unpack.c:316:18: error: unknown type name 'tri'
VISIBLE_IF_KUNIT tri aa_unpack_array(struct aa_ext *e, const char
*name, u16 *size)
                 ^
security/apparmor/policy_unpack.c:325:10: error: use of undeclared
identifier 'TRI_TRUE'
                return TRI_TRUE;
                       ^
security/apparmor/policy_unpack.c:328:9: error: use of undeclared
identifier 'TRI_NONE'
        return TRI_NONE;
               ^
security/apparmor/policy_unpack.c:331:9: error: use of undeclared
identifier 'TRI_FALSE'
        return TRI_FALSE;
               ^
security/apparmor/policy_unpack.c:455:42: error: use of undeclared
identifier 'TRI_TRUE'
                if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
                                                       ^
security/apparmor/policy_unpack.c:529:42: error: use of undeclared
identifier 'TRI_TRUE'
                if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
                                                       ^
security/apparmor/policy_unpack.c:559:42: error: use of undeclared
identifier 'TRI_TRUE'
                if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
                                                       ^
security/apparmor/policy_unpack.c:611:42: error: use of undeclared
identifier 'TRI_TRUE'
                if (aa_unpack_array(e, NULL, &size) != TRI_TRUE ||
                                                       ^
security/apparmor/policy_unpack.c:674:42: error: use of undeclared
identifier 'TRI_TRUE'
                if (aa_unpack_array(e, NULL, &size) != TRI_TRUE)
                                                       ^
9 errors generated.
make[4]: *** [scripts/Makefile.build:252:
security/apparmor/policy_unpack.o] Error 1
make[4]: Target 'security/apparmor/' not remade because of errors.
make[3]: *** [scripts/Makefile.build:504: security/apparmor] Error 2

Build link,
  - https://builds.tuxbuild.com/2IcJeyR3s4kGd2Nca8vVq7Sleao/
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221208/testrun/13508560/suite/build/test/gcc-11-defconfig/details/

Build results comparison:
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221208/testrun/13508560/suite/build/test/gcc-11-defconfig/history/


steps to reproduce:
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig defconfig


tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig https://builds.tuxbuild.com/2IcJeyR3s4kGd2Nca8vVq7Sleao/config

--
Linaro LKFT
https://lkft.linaro.org

