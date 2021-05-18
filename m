Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC1C387EDF
	for <lists+apparmor@lfdr.de>; Tue, 18 May 2021 19:46:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lj3ng-0003D0-He; Tue, 18 May 2021 17:46:36 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1lj3ne-0003Cd-Kc
 for apparmor@lists.ubuntu.com; Tue, 18 May 2021 17:46:34 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 1D388240026
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 19:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1621359994; bh=djf4z966DjVsk4E819MTtRfuOUAWMXK1xwPrIDqPOWY=;
 h=To:From:Subject:Date:From;
 b=ioLxHUb5SVedYBqMPjKdCJRr7PATv3/UQRzDyLmFXlRKTFMQz1ihHyO2sjPVQwLWd
 r5TD5AlEbBsNnXaiL3VqdhWNbCxBIRG3oLVxHagr8PerzbB4jdQ9o5R1GXOfenr5Xx
 4VptbYZ2vtInj2yws9NJ2l2AX5qSMy/yTjuUHpDDOq3vh4NMZ8/SOLUAYgkHgWXhl9
 rUCPSwKo0/E7g1hWjgbw2d1La5pQd7KF0x73nR7xHcIFALQy+iekEfJ8bC3zZTzLo5
 JXsNrlfpv0XU5caRDN0jr6EkHugBaKIPdU8fidxlXIxcqT4i/3l3Zt2DuccmPpY7CE
 WcmOmNC+xxGNA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Fl3Ms5F2Sz6tmP
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 19:46:33 +0200 (CEST)
To: apparmor@lists.ubuntu.com
From: "mailinglisten@posteo.de" <mailinglisten@posteo.de>
Message-ID: <3cda1806-59e6-b229-5504-60e237245385@posteo.de>
Date: Tue, 18 May 2021 17:46:32 +0000
MIME-Version: 1.0
Content-Language: de-DE
Subject: [apparmor] confining the clipboard?
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

QnkgdGhlIHdheSwgaXMgdGhlcmUgYSBydWxlIGluIEFBIHRvIGNvbmZpbmUgYWNjZXNzIHRvIHRo
ZSBjbGlwYm9hcmQ/CkRpZG7CtHQgZmluZCBzb21ldGhpbmcgaW4gdGhhIGRpcmVjdGlvbiBpbiB0
aGUgbWFuIHBhZ2VzLi4uCgpJIGp1c3QgbGVhcm50IHNvbWVvbmUgbG9zdCBoaXMgbW9uZXksIGFm
dGVyIGNvcHlpbmcgaGlzIHdhbGxldCBpbnRvIHRoZQpjbGlwYm9hcmQgYW5kIHNvbWUgZXZpbCB3
ZWIgc2l0ZSBzdGVhbGluZyBpdC4uLi4gY3JlYXRpdml0eSByZWFsbHkgaGFzCm5vIGxpbWl0cyA7
LSkKCgpUaGFua3MKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1
bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMu
dWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
