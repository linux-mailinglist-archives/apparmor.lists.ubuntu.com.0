Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED31643E4D
	for <lists+apparmor@lfdr.de>; Tue,  6 Dec 2022 09:16:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p2T84-0001Lq-0y; Tue, 06 Dec 2022 08:16:40 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from
 <3zGeOYwUKCPcqlnZqfnnfkd.bnlZooZqlnqkhrsr.tatmst.bnl@flex--rmoar.bounces.google.com>)
 id 1p2JMj-0008Us-8B
 for apparmor@lists.ubuntu.com; Mon, 05 Dec 2022 21:51:09 +0000
Received: by mail-yb1-f201.google.com with SMTP id
 i7-20020a056902068700b006f848e998b5so13831749ybt.10
 for <apparmor@lists.ubuntu.com>; Mon, 05 Dec 2022 13:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=aQehZmP5Z6GlJolWh2Uea8JAEAV0C8y97tfVfmjJ0OY=;
 b=ClTZizZ7ekm3CbVJxv2iG9VWuHDNQkCOamEqTzIsn0RUmq/y/MR9k0MiapQK9PLL1w
 arRm5vB+G4ub+ZST4MhS81DJQ1qTb/R2QI+kyEWd1aNvg17zTMbXP+9I2K6aBZWOw9Is
 mSiKQctNOcGlNqYT8JnKCN0lTQ2adPAuE6eSFzg1THWJwQ3PPbygyUDo71uWwRUfIMP9
 PDqaTlsv/I7BWObxWF8PrOxFsBpvhzjLy6CM9hl4SSIyuG3j1aQ1ajxP3xFS/6ofD6A3
 rAwDudZRKClPQCQ2FltkCW85gsovTRT+OrNk4TP1RhE9ehNau1+N1axdg9+ZmLyW0AlW
 GxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aQehZmP5Z6GlJolWh2Uea8JAEAV0C8y97tfVfmjJ0OY=;
 b=KZh8PnTUwI3SQzYdFX8+m1B3ndEY7miOLcFQUahLRQXRkSFXCZlCqsKi3sncgCZEVo
 RiHMQz8XF56cazkHMKB91B3CWesYnoNWxia1bW1YWFFbbJwKHal2ZYoyTrhtLWtuEdZG
 FFvayIM/PD70O6ppWyOWWTVn3cE+FfRElR9iiiAHAqsooKsWBtM2o3nA5QvIvEKgq72d
 BFVWE3YhK0QYLCK4W2+oeqHiKFPSyyjFrmBEwgZIroRoKjv8IsRUW2ZjOtRsKKUdmEvr
 Y3ao0LvLQH/PKblQKiFxgeGYuruo2L3aJAMCTpmHzR7mz238zYqJABT/uxk+m3gzDXpO
 eWkQ==
X-Gm-Message-State: ANoB5pm51U0MvEhN9DMcXuIOcx69FRdT7ARKJ8gzqzYt/sWHavU7pgAb
 oI94gy7YbdjiLf9RVxfM8yDX/JDGwg==
X-Google-Smtp-Source: AA0mqf5EPhG918+r/V18YIF64tI+ryCFH9xVMCeaNf3s5EzjGqdEnGAcztTgoLt61qwaOmybhhxj/ywaPg==
X-Received: from rmoar.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:4259])
 (user=rmoar job=sendgmr) by 2002:a25:a0c5:0:b0:6f7:e78d:cbee with
 SMTP id
 i5-20020a25a0c5000000b006f7e78dcbeemr34248052ybm.30.1670277068093; Mon, 05
 Dec 2022 13:51:08 -0800 (PST)
Date: Mon,  5 Dec 2022 21:50:56 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Message-ID: <20221205215058.143688-1-rmoar@google.com>
From: Rae Moar <rmoar@google.com>
To: brendanhiggins@google.com, davidgow@google.com, dlatypov@google.com, 
 john.johansen@canonical.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 06 Dec 2022 08:16:39 +0000
Subject: [apparmor] [PATCH v2 0/2] kunit: add macro to allow conditionally
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
the issue of testing static functions.

Thanks!
-Rae

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
 security/apparmor/Makefile                |   2 +
 security/apparmor/include/policy_unpack.h |  50 +++++
 security/apparmor/policy_unpack.c         | 238 ++++++++++------------
 security/apparmor/policy_unpack_test.c    |  69 ++++---
 6 files changed, 228 insertions(+), 168 deletions(-)
 create mode 100644 include/kunit/visibility.h


base-commit: 0f08f3e2a0186dfb8e33cb46105228eb18448a0e
-- 
2.39.0.rc0.267.gcb52ba06e7-goog


