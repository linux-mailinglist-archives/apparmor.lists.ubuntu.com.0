Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C43110272
	for <lists+apparmor@lfdr.de>; Tue,  3 Dec 2019 17:36:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1icB9o-0004dL-9G; Tue, 03 Dec 2019 16:36:12 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1icB9m-0004dF-6E
 for apparmor@lists.ubuntu.com; Tue, 03 Dec 2019 16:36:10 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 1B5D3160060
 for <apparmor@lists.ubuntu.com>; Tue,  3 Dec 2019 17:36:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1575390969; bh=N4Wvd8cRXx/nIki3Cvf6jyvfbU8PCi6VMSAwfGds2cI=;
 h=To:From:Subject:Date:From;
 b=aY9aC+oNo9wCnYJ0NUdiQnPyZ/r65ZmMfGRnqyQCTWHDnkJc9X0o9lpzya8/UKxzf
 gVuKg6u36h8SjEPaed54T4BeAs4PgpaKzLlUvkpOLNI2hLZJpdwNwf92PJzplJnTsU
 W3vC5pbUzVjLot3ZbFAxpzjyyJayBOMdqQtybtkBxKo1Uc3Vv6ot8BZTocARe3p/G+
 0tEljirxJpyahepvJpxSHAcx1q2b4euYWytf9ePM0j3Q/lHq/6ioRke1wvpZyXoY1W
 W5MIlY+Qg4w4Lo0wMWd8LG4tVibGUe3YHVZjVSC2UaNGWPUnYKZu6Qu2qzmcz6SmT9
 feNsnt82hzeSw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47S7085q8nz6tm6
 for <apparmor@lists.ubuntu.com>; Tue,  3 Dec 2019 17:36:08 +0100 (CET)
To: apparmor@lists.ubuntu.com
From: mailing list <mailinglisten@posteo.de>
Message-ID: <e5f73bfa-f5b9-6f3f-3ecb-298a60ac34ad@posteo.de>
Date: Tue, 3 Dec 2019 17:36:08 +0100
MIME-Version: 1.0
Content-Language: de-DE
Subject: [apparmor] cupsd profile?
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

SGVsbG8hCgpXaGVuIGxvb2tpbmcgd2l0aCBHb29nbGUsIEkgZmluZCBhIGxvdCBkaXNjdXNzaW9u
cyBhYm91dCBjdXBzIGFuZCBBQSwKYnV0IG5vdCB0aGUgYmFyZSBjdXBzZCBBQSBwcm9maWxlLi4u
LgpDYW4gc29tZW9uZSBwb2ludCBtZSB0byB0aGUgY3Vwc2QgcHJvZmlsZSBvciBwb3N0IHRoZSBw
cm9maWxlIGhlcmU/ClRoYW54IQoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBs
aXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6
Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
