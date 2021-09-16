Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B472840D1F4
	for <lists+apparmor@lfdr.de>; Thu, 16 Sep 2021 05:16:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mQhsu-00020v-QT; Thu, 16 Sep 2021 03:16:24 +0000
Received: from d.mail.sonic.net ([64.142.111.50])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <forestix@sonic.net>) id 1mQhss-00020k-2D
 for apparmor@lists.ubuntu.com; Thu, 16 Sep 2021 03:16:22 +0000
Received: from unknown (157-131-253-151.fiber.dynamic.sonic.net
 [157.131.253.151]) (authenticated bits=0)
 by d.mail.sonic.net (8.15.1/8.15.1) with ESMTPA id 18G3GJU2026031
 for <apparmor@lists.ubuntu.com>; Wed, 15 Sep 2021 20:16:19 -0700
From: Forest <forestix@sonic.net>
To: apparmor@lists.ubuntu.com
Date: Wed, 15 Sep 2021 20:16:19 -0700
Message-ID: <0pc5kg1g4kb6p70e781h28c3mc6vddk8fk@4ax.com>
X-Mailer: Forte Agent 3.3/32.846
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVZfNYFIQjOmVB4XzT1wpIHCCjVUVOtuzSnDYHezmI6poZHs1M0WiRGrlyDmIbZrujM9KnAJmSaTV+1jQHoE3dTD
X-Sonic-ID: C;VoBddpwW7BG0Pvw1tqCbNw== M;4D1mdpwW7BG0Pvw1tqCbNw==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
Subject: [apparmor] How to extend an existing profile?
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

SSBuZWVkIG15IGN1c3RvbSBBcHBBcm1vciBwcm9maWxlIHRvIG1pbWljIG9uZSBvZiB0aG9zZSBp
bmNsdWRlZCB3aXRoIExYQywKd2l0aCBhIG5ldyBuYW1lIGFuZCBhIGZldyBhZGRpdGlvbmFsIHJ1
bGVzLiAgSXMgdGhlcmUgYSB3YXkgdG8gZG8gdGhpcwp3aXRob3V0IGNvcHlpbmcgdGhlIGNvbnRl
bnRzIG9mIHRoZSB1cHN0cmVhbSBwcm9maWxlPyAgU29tZSB3YXkgZm9yIG9uZQpwcm9maWxlIHRv
IGluaGVyaXQgdGhlIHJ1bGVzIG9mIGFub3RoZXIgcHJvZmlsZT8KCkkgY29uc2lkZXJlZCAjaW5j
bHVkZSwgYnV0IHRoYXQgbG9va3MgbGlrZSBhIHNpbXBsZSB0ZXh0IGltcG9ydCB0aGF0IHdvdWxk
CnB1bGwgaW4gdGhlIHdob2xlIHVwc3RyZWFtIGZpbGUsIGluY2x1ZGluZyBpdHMgaGVhZGVyLCBh
bmQgdGhlcmVmb3JlIG5vdAp3b3JrLgoKQXMgYSBsYXN0IHJlc29ydCwgSSBzdXBwb3NlIEkgY291
bGQgY29weSB0aGUgdXBzdHJlYW0gcHJvZmlsZSdzIGNvbnRlbnRzCmludG8gYSBuZXcgZmlsZSBh
bG9uZyB3aXRoIG15IGFkZGl0aW9ucywgYnV0IHRoYXQgd291bGQgZHVwbGljYXRlIHVwc3RyZWFt
CnBvbGljeSBhbmQgcmlzayBmYWxsaW5nIG91dCBvZiBzeW5jIHdpdGggdXBzdHJlYW0gY2hhbmdl
cy4KClRoZSB1c2UgY2FzZSBpcyB0byBnZXQgU3RlYW0ncyBwcmVzc3VyZS12ZXNzZWwgd29ya2lu
ZyBpbiBMWEMgY29udGFpbmVycy4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JA
bGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBz
Oi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
