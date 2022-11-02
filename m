Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D304C6178F8
	for <lists+apparmor@lfdr.de>; Thu,  3 Nov 2022 09:42:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oqVoB-0003y5-AN; Thu, 03 Nov 2022 08:42:43 +0000
Received: from mail-yw1-f202.google.com ([209.85.128.202])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from
 <3vLBiYwUKCMk613p6v33v0t.r31p44p61360x787.9q9289.r31@flex--rmoar.bounces.google.com>)
 id 1oqI4T-0008P6-RC
 for apparmor@lists.ubuntu.com; Wed, 02 Nov 2022 18:02:37 +0000
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-370624ca2e8so82852597b3.16
 for <apparmor@lists.ubuntu.com>; Wed, 02 Nov 2022 11:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dWyi/36idrKf9zvqL8JaBZPjyKB9f1dSHmjzSP1ojwk=;
 b=dJOI0lPorycRsOpZymi9t1TnR2iJs0YJmGpf9Vx5xS8CdlqFk9+pumJSay0Kbj8BKA
 VGjMwvYdP4/tdgbdSELKWvZeYkyL+1ecoOjRm+S1Thx375XXZngssigLnw8oikaKLvqU
 mDjA3ZSmN3/Qs2x89wIhl5vdD3sb9qoBBVk5RyERf/1lzH8VMauxhjxOqmrsCJcU6Pf8
 Fqo7v/sCsmW/6pX/WNY5rQaT1kZpXkHIJ7xZgTPgTYWKekf1sjeWoa3vWG7vyiaNja5H
 D4Tw4N2W60VMFQeCx7v5tevS32JhpA7W6tQmPRZJI7IyryUoP0Vfr2AZdafP7fuXgGkA
 Guug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dWyi/36idrKf9zvqL8JaBZPjyKB9f1dSHmjzSP1ojwk=;
 b=T2eCN+EXNbpyYTBuW6nbLANs4uipHOtB1ae8nuJMJTJ01TJA/AI8w7bpsvl5p1LESm
 mY/tvmGTLho2ZGPD2RnnpnDdRxEcOqe+DH4aPfTEFF8npU7TV8IkERZJTQ2irnfZmDWg
 EWf9M/0tuZ6vaakN3xqHbnY72EeGhMXT8SNCNQHmhG14NSOxnEyeiJ0WAlHpSK8D98G0
 HXb7dzexSpg9A1b6IddUKcGrboDYPJp3BWYralc3ovyfPAVJanJMTlwGE1RB0XNcthe0
 8XdNzDp05rl+mLPIniYz/DABlq2nnmwC2EQgoDDm+LLi+Lw5qLrDvjNmCB62hC5QKv5J
 5fAg==
X-Gm-Message-State: ACrzQf0f4EUYgv+P6nRMzmiTlt5lLM4nfAxubtUQJXPhRfTs1xexQ6E8
 C2qMWsx28jKlKu5dw33mWnDyGPdEhg==
X-Google-Smtp-Source: AMsMyM4nkGp71lUryvEpctCfZeBQK2w2hUU/0fEQWVZI7plPOH6PoaqnQ3PuELrve4EZR/p73cmB8xo8yQ==
X-Received: from rmoar.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:4259])
 (user=rmoar job=sendgmr) by 2002:a25:e6d2:0:b0:6ca:6965:6f8 with
 SMTP id
 d201-20020a25e6d2000000b006ca696506f8mr24343136ybh.461.1667412156588; Wed, 02
 Nov 2022 11:02:36 -0700 (PDT)
Date: Wed,  2 Nov 2022 17:59:57 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
Message-ID: <20221102175959.2921063-1-rmoar@google.com>
From: Rae Moar <rmoar@google.com>
To: brendanhiggins@google.com, davidgow@google.com, dlatypov@google.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 03 Nov 2022 08:42:42 +0000
Subject: [apparmor] [PATCH v1 0/2] kunit: add macro to allow conditionally
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

Rae Moar (2):
  kunit: add macro to allow conditionally exposing static symbols to
    tests
  apparmor: test: make static symbols visible during kunit testing

 include/kunit/visibility.h                | 32 ++++++++++
 security/apparmor/Kconfig                 |  4 +-
 security/apparmor/Makefile                |  2 +
 security/apparmor/include/policy_unpack.h | 50 ++++++++++++++++
 security/apparmor/policy_unpack.c         | 72 +++++++----------------
 security/apparmor/policy_unpack_test.c    |  5 ++
 6 files changed, 112 insertions(+), 53 deletions(-)
 create mode 100644 include/kunit/visibility.h


base-commit: 11e76194937b506caf1b49512c42d5c2588681d7
-- 
2.38.1.273.g43a17bfeac-goog


