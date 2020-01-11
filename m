Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE57137CBB
	for <lists+apparmor@lfdr.de>; Sat, 11 Jan 2020 10:48:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iqDNw-0005l1-Mk; Sat, 11 Jan 2020 09:48:48 +0000
Received: from 3.mo173.mail-out.ovh.net ([46.105.34.1])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sylvain@chicoree.fr>) id 1iqDNu-0005kv-C3
 for apparmor@lists.ubuntu.com; Sat, 11 Jan 2020 09:48:46 +0000
Received: from player732.ha.ovh.net (unknown [10.109.143.175])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 1041412AC09
 for <apparmor@lists.ubuntu.com>; Sat, 11 Jan 2020 10:48:45 +0100 (CET)
Received: from chicoree.fr (reverse-177-9.fdn.fr [80.67.177.9])
 (Authenticated sender: sylvain@chicoree.fr)
 by player732.ha.ovh.net (Postfix) with ESMTPSA id 69C77DFBE80A;
 Sat, 11 Jan 2020 09:48:42 +0000 (UTC)
To: azurit@pobox.sk, apparmor@lists.ubuntu.com
References: <20200111082533.Horde.-q_htOKjOvSwJY_kRNitnGs@webmail.inetadmin.eu>
From: Sylvain Leroux <sylvain@chicoree.fr>
Openpgp: preference=signencrypt
Autocrypt: addr=sylvain@chicoree.fr; keydata=
 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
 ZVTXbkoKWnXazv6EYQ==
Message-ID: <87e7a580-2566-2c6c-1ddb-16299edddd63@chicoree.fr>
Date: Sat, 11 Jan 2020 10:48:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200111082533.Horde.-q_htOKjOvSwJY_kRNitnGs@webmail.inetadmin.eu>
Content-Language: en-US
X-Ovh-Tracer-Id: 11096025060158312078
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeihedgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefuhihlvhgrihhnucfnvghrohhugicuoehshihlvhgrihhnsegthhhitghorhgvvgdrfhhrqeenucfkpheptddrtddrtddrtddpkedtrdeijedrudejjedrleenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehshihlvhgrihhnsegthhhitghorhgvvgdrfhhrpdhrtghpthhtoheprghpphgrrhhmohhrsehlihhsthhsrdhusghunhhtuhdrtghomhenucevlhhushhtvghrufhiiigvpedt
Subject: Re: [apparmor] Patching a system profile for a specific user
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

VGhhbmtzIGF6dXIsCgpPbiAxMS8wMS8yMDIwIDA4OjI1LCBhenVyaXRAcG9ib3guc2sgd3JvdGU6
Cj4ganVzdCBwdXQgdGhpcyBpbiAvZXRjL2FwcGFybW9yLmQvbG9jYWwvdXNyLmJpbi50aHVuZGVy
YmlyZCA6Cj4gb3duZXIgQHtIT01FfS8uc2lnbmF0dXJlLmQvKiogciwKCgpNeSBpc3N1ZSBpcyBJ
IGRvbid0IHdhbnQgdG8gY2hhbmdlIHRoZSBzeXN0ZW0gY29uZmlndXJhdGlvbi4gSSB3b3VsZAps
aWtlIHRvIGdyYW50IHRoZSBleHRyYSBwZXJtaXNzaW9uICpvbmx5KiBmb3IgdGhlIHVzZXIgdGhh
dCBuZWVkcyBpdC4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1
bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMu
dWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
