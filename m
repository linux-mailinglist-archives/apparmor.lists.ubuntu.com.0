Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ADD64525E
	for <lists+apparmor@lfdr.de>; Wed,  7 Dec 2022 04:04:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p2kj4-00076s-Nz; Wed, 07 Dec 2022 03:04:02 +0000
Received: from mail-yw1-f202.google.com ([209.85.128.202])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from
 <3LO-PYwUKCG0cXZLcRZZRWP.NZXLaaLcXZcWTded.fMfYef.NZX@flex--rmoar.bounces.google.com>)
 id 1p2jQj-0005A9-Tx
 for apparmor@lists.ubuntu.com; Wed, 07 Dec 2022 01:41:02 +0000
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-352e29ff8c2so175838847b3.21
 for <apparmor@lists.ubuntu.com>; Tue, 06 Dec 2022 17:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4Unq0oaIP1izyBHDyANhzvk3o6bylMiCSbnwmSBSymc=;
 b=tcxWvDemf99X1nyEvPiFORjiBouuxhzHCMm7alI8B0zCANk9aRzhmUj4PiX2rJoUCD
 hJJrySoPkaSABe5Nv69YkwCV3QRiwulTFGw37RXHvnvdoeHF9UvmRi024G7G84Bt2viK
 ecQFXyF6nCfuusEpLbOZfDiEQbNAy2ETjaaL+jsQHxm1/3MMr+bC1KfUvoamwccH7cLP
 Wwee/qrR5pMX/3Wy4yVm3GU+UTbkiEGXY1jQwyNAFMHKIyMoIExUA5kmkJ4ro7A7dE6u
 XBZcUWDDXW8UtEgoPqknJnOS6aqAftwn8vCe+oCw2aiJ22rxD+xFW8GeXFU0f7FP3ZV6
 qciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Unq0oaIP1izyBHDyANhzvk3o6bylMiCSbnwmSBSymc=;
 b=ZVEreZ+o4/qyBXbomtqjlyObxLFVe5u3KEu0JgAiEZ6ThFOq9raAmG9cQx2/Vrvt95
 2jaLLMeS/ldG7J+o2PM14mSxAa+1dcPaQ5kLf2Ob1PeJ8xI7vtESPopOJ4m7AWyURaF7
 P6kC5OhsCthMGq1Dus23r80EOhl4yVnJl91aEP9OcqMgjt3CUK3SW4mqCP0786X/H5T+
 aWYmMmfAqj/RIF5qZkdnBZq+dd7C8sU6T7OD4cL+cxlMB/k5Tkfeg+2HHeUTENb8AzDH
 yY2NAulduFB8Rp80qhfxVRQT3M7v3793dNPHvYvDXOkH7eGqvUeKO1dYrNyqg03SBSDn
 B/3w==
X-Gm-Message-State: ANoB5plceV511vrlWGqIAyTHRMW5+qp5OVcv32Nh4+PD8Qvbo3NGqdun
 eIsHTGCkK4YJjj9iZhRewBHuQzeLow==
X-Google-Smtp-Source: AA0mqf4cdaPx0B0tVMcAf1xNRAB/QGITQng5Lwwi7o+J7dzh5sxGHpKiF2zW1y4tA5aMH/iMieifTF64Nw==
X-Received: from rmoar.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:4259])
 (user=rmoar job=sendgmr) by 2002:a25:b886:0:b0:700:b6ef:34a9 with
 SMTP id
 w6-20020a25b886000000b00700b6ef34a9mr10791907ybj.527.1670377260763; Tue, 06
 Dec 2022 17:41:00 -0800 (PST)
Date: Wed,  7 Dec 2022 01:40:22 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Message-ID: <20221207014024.340230-1-rmoar@google.com>
From: Rae Moar <rmoar@google.com>
To: brendanhiggins@google.com, davidgow@google.com, dlatypov@google.com, 
 john.johansen@canonical.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 07 Dec 2022 03:04:02 +0000
Subject: [apparmor] [PATCH v3 0/2] kunit: add macro to allow conditionally
 exposing static symbols to tests
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
 linux-kernel@vger.kernel.org, Rae Moar <rmoar@google.com>,
 linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Currently in order to test a static function, tests must be included in the
same translation unit as the function. However, this can cause issues with
including implementation and test code in the same file. As an alternative,
the first patch in this series creates a macro that will set a function to
be static or not depending on whether CONFIG_KUNIT is enabled. This allows
the function to be visible during testing and static otherwise.

As an example, the current status quo to test static functions is:

=== test.c ===

static void test_case(struct kunit *test)
{
  KUNIT_EXPECT_EQ(test, my_func_to_test(), 2);
}

Then the tests are included in the implementation file as a workaround to
the issue of testing static functions:

=== implementation.c ===

static int my_func_to_test() {...}
...
#include "test.c"

Instead, the function could be defined with this new macro:

=== implementation.c ===

VISIBLE_IF_KUNIT int my_func_to_test() {...}

The first patch also creates a macro that will export a symbol into a kunit
testing namespace only if CONFIG_KUNIT is enabled. This follows the logic
above and allows symbols to be conditionally exported based on the testing
status.

The second patch in the series updates the policy_unpack test in AppArmor
to show an example of how to use both of these macros in order to address
the issue of testing static functions. Additionally, the patch allows the
policy_unpack test to be built as a module.

Changes since v2:
 - Add mention of namespacing symbols to the commit message of the
   second patch.
 - Change module name in the second patch from policy_unpack_test to
   apparmor_policy_unpack_test.

Changes since v1:
 - Changed the namespace of exported symbols for the apparmor
   policy_unpack_test by adding the aa_ prefix.
 - Separated the documentation comments for macros in
   include/kunit/visibility.h.
 - Changed copyright date and author for include/kunit/visibility.h.

Rae Moar (2):
  kunit: add macro to allow conditionally exposing static symbols to
    tests
  apparmor: test: make static symbols visible during kunit testing

 include/kunit/visibility.h                |  33 +++
 security/apparmor/Kconfig                 |   4 +-
 security/apparmor/Makefile                |   3 +
 security/apparmor/include/policy_unpack.h |  50 +++++
 security/apparmor/policy_unpack.c         | 238 ++++++++++------------
 security/apparmor/policy_unpack_test.c    |  69 ++++---
 6 files changed, 229 insertions(+), 168 deletions(-)
 create mode 100644 include/kunit/visibility.h


base-commit: 0f08f3e2a0186dfb8e33cb46105228eb18448a0e
-- 
2.39.0.rc0.267.gcb52ba06e7-goog


