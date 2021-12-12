Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759E471E11
	for <lists+apparmor@lfdr.de>; Sun, 12 Dec 2021 22:30:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mwWPl-000373-Ck; Sun, 12 Dec 2021 21:29:49 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mwWPj-00036v-Hw
 for apparmor@lists.ubuntu.com; Sun, 12 Dec 2021 21:29:47 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 17A3D3F174
 for <apparmor@lists.ubuntu.com>; Sun, 12 Dec 2021 21:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639344587;
 bh=dkdI60Bt7pX6YtsM3iIdcbmIe93zlfSlQDqCjfbkuvM=;
 h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type;
 b=dYE1/zoh/qpWyAJVqA42H7euki3g3L4Jijc97UySdx+fyAj9ISwDL4rdUgtRSFI06
 7HkZCuHE8owtTK/21cycw+51zDRICTHVKXNEi9C+pQaNJIKJtokUgc6ZIebRbv7zgP
 mD7648uFa0MA8w7lIzMyw+KGlPun6Ug/9AQGemag8wKviUVglpXsX7gkwh5X++QlKW
 prdlq9gEXjnJlKuk4hQbtXMQbE6nb5UU8DvyQPNfEGWay0ZJw5clua39rlFZ8k/YcK
 +e9ofyPeiVW7D2H+cHOlMDd3p6Q849Ue2DRL7uygTVMUo0vg0KfPHu35nPCUy1F1dV
 Yaxm7R9JdTtvw==
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Organization: Canonical
Message-ID: <36cc63aa-049d-e7ea-60af-8a28bbee81f2@canonical.com>
Date: Sun, 12 Dec 2021 13:29:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [apparmor]  irc meeting Tues Dec 14, 18:00 UTC
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

VGhlIG5leHQgaXJjIG1lZXRpbmcgaXMgVHVlc2RheSBEZWNlbWJlciAxNCwgYXQgMTg6MDAgVVRD
IGluICNhcHBhcm1vciBvbiBvZnRjLm5ldAoKUGxlYXNlIHVwZGF0ZSB0aGUgYWdlbmRhIGh0dHBz
Oi8vZ2l0bGFiLmNvbS9hcHBhcm1vci9hcHBhcm1vci93aWtpcy9NZWV0aW5nQWdlbmRhIG9yIHJl
cGx5IHRvIHRoaXMgbWFpbCBpZiB5b3UgaGF2ZSBpdGVtcyB5b3Ugd2FudCB0byBhZGQKCi0tIApB
cHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0
dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2FwcGFybW9yCg==
