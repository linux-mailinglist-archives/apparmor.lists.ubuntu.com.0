Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38341505B
	for <lists+apparmor@lfdr.de>; Wed, 22 Sep 2021 21:08:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mT7bS-0003eS-Uq; Wed, 22 Sep 2021 19:08:22 +0000
Received: from c.mail.sonic.net ([64.142.111.80])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <forestix@sonic.net>) id 1mT7bP-0003dM-KA
 for apparmor@lists.ubuntu.com; Wed, 22 Sep 2021 19:08:19 +0000
Received: from unknown (157-131-253-151.fiber.dynamic.sonic.net
 [157.131.253.151]) (authenticated bits=0)
 by c.mail.sonic.net (8.15.1/8.15.1) with ESMTPA id 18MJ8GgH013943
 for <apparmor@lists.ubuntu.com>; Wed, 22 Sep 2021 12:08:16 -0700
From: Forest <forestix@sonic.net>
To: apparmor@lists.ubuntu.com
Date: Wed, 22 Sep 2021 12:08:16 -0700
Message-ID: <savmkgle9vcmpm23d0egnm7u7aasm67hfk@4ax.com>
X-Mailer: Forte Agent 3.3/32.846
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVb9MUToYJUOUNmsljhk0EstE0sJtY3Fx78BM/jO6cK4BHaVhZiSss/TSA8j2h2qW+dC9Hm0z9ArGI1X3Y+fZhJC
X-Sonic-ID: C;tJQicdgb7BGChIwupfZQ0w== M;dDQscdgb7BGChIwupfZQ0w==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
Subject: [apparmor] Toward cooperation between bubblewrap and AppArmor
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

QSBkaXNjdXNzaW9uIGhhcyBjb21lIHVwIGFib3V0IGdldHRpbmcgYnViYmxld3JhcCBhbmQgQXBw
QXJtb3IgdG8gY29vcGVyYXRlLgpPbmUgdXNlIGNhc2Ugd291bGQgYmUgYWxsb3dpbmcgU3RlYW0g
KHdoaWNoIHJlY2VudGx5IHN0YXJ0ZWQgbGF1bmNoaW5nIGdhbWVzCmluIGEgYndyYXAgY29udGFp
bmVyKSB0byB3b3JrIGluIEFwcEFybW9yLXJlc3RyaWN0ZWQgZW52aXJvbm1lbnRzIGxpa2UgTFhD
LgoKSSB0aGluayBzb21lIHBlcnNwZWN0aXZlIGZyb20gQXBwQXJtb3IgbWFpbnRhaW5lcnMgd291
bGQgYmUgdmFsdWFibGUgdGhlcmU6CgpodHRwczovL2dpdGh1Yi5jb20vY29udGFpbmVycy9idWJi
bGV3cmFwL2lzc3Vlcy8zNjIKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlz
dHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8v
bGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
