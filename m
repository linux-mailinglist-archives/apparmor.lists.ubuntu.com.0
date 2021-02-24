Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6133244E1
	for <lists+apparmor@lfdr.de>; Wed, 24 Feb 2021 21:07:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lF0Ro-0001EC-Ty; Wed, 24 Feb 2021 20:07:48 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <TheDiveO@gmx.eu>) id 1lF0Rn-0001E5-IQ
 for apparmor@lists.ubuntu.com; Wed, 24 Feb 2021 20:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1614197267;
 bh=vblmrRU6DHdgtj0D7Ycjj3m7hWg7i3MQgWkC0KKK2Bo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cyMSkhxAO5yKz2tUC/JrE+0AJsLltw2t0Yj7XagI+eOaQRaOfqzefmt4BrXWnkBWz
 sRy+FcCbie6dGdyDE1wUsrwurgOmitfT7N8JkCSiN8YBhE4OragHm6dfh/p4g8mbTq
 ZvFLsMs5uQ+jfOnEdLE7buuEw9CFwWw/JLFp2cTs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [84.173.155.199] ([84.173.155.199]) by web-mail.gmx.net
 (3c-app-gmx-bs73.server.lan [172.19.170.212]) (via HTTP); Wed, 24 Feb 2021
 21:07:47 +0100
MIME-Version: 1.0
Message-ID: <trinity-8ec36262-f18c-4589-b8dc-91a6d7be3eb6-1614197267130@3c-app-gmx-bs73>
From: TheDiveO@gmx.eu
To: Christian Boltz <apparmor@cboltz.de>
Date: Wed, 24 Feb 2021 21:07:47 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <6901047.gQ41x59yMm@tux.boltz.de.vu>
References: <trinity-9878cf5b-24f9-455c-a35b-82da31b41e7f-1614161820960@3c-app-gmx-bs53>
 <6901047.gQ41x59yMm@tux.boltz.de.vu>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:WFwJDiMBk4Vf03585O53+SfBgQwRCFFh3HSDZofskhdEACKu9hLEdayjWOiAsxLdzl0Om
 eyW/koqXpualwkirP8RL0V5Pen2cYEIPGsDV5muP1AaPxZmCdk2CI1raRGG1ueElWGXjH6ZlcjiA
 iV06e4TooLDlT7jFs+kQA7b/6uqTWK2tqBjcmgIPpKK9qglx4FMPu21OBZMCjsy2CzrkZy8YNOoJ
 I6eQRhnw6uwFQh/WRj55FaVkBRZxYznh2KcB7DU5ZZ/zNfFiswrplRD471mtkiFwSIdOid8//Wu1
 0A=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cMBC1btY+rM=:osRacf5heIcVKU4F2qXIjS
 uBl+hr0qzHZjyKno4W/bRBIkU8SWKcS14MaZiA+8y3TQ276wP4Wh6ARkai5Sp509pSXcHJPQz
 0L4aS+8G5AzNvyZq4ZnbDR9VHttDVLYW9WShhcdCoKtGBGo8pehVrhv/Vm8SM4FRCuh7N26qu
 vWH6D7bLstWz2nGelRnm9Nr/eSjabP9uNyDcQmOOMp++fEkBrx1XXGLxrA5U8ZB0FlbCBFS88
 m6HCpF5Ol4Zop40fHtNpmIKrtrzstK6HntXVB1MILDMyMRQKFCJ/M0PqSSlQ3JewdeUYVHGyT
 lPdDpHt0YcyZgo+uUw6j5Htkf5KkdMdh56aoHeEMDTnqRbjNZ9iN5F0r2Oaqn8r//tK53LGFB
 MfKLqwwfmiEj9jMnMG4SFnpaf4U8dZWaHrHzwGk4r08aMBU4pUfznUXTdBJ7+MG+p3u9PE7fD
 wp58Rj5wG8Kj0hBFLL1NdPQtPZQlgfa2RyV2DTgU2BU0MuDtMYUOmo8yOklTMwQRZZqpOoxkw
 7mHuOBXyFxIxsxcSWunJ6xg0iWdrqI2qwzvj3qD+QpH1tJ7lhQBnqXBMa1/Wq1NXdT3AKI/k8
 TxzFU358XrEQ0=
Subject: Re: [apparmor] What are "AARE"s, exactly?
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
Cc: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

PiBJdCBzZWVtcyB0aGUgYXBwYXJtb3IuZCBtYW5wYWdlIGxhY2tzIGEgbWVudGlvbiBvZiBBQVJF
IGF0IG9uZSBwbGFjZSAtCj4gdGhlIHBsYWNlIHRoZXkgYXJlIGV4cGxhaW5lZCA7LSkKCkVzcGVj
aWFsbHkgYSBwcm9wZXIgZGVmaW5pdGlvbiwgaXQgc2VlbXMuIEFzIGl0IGlzLCB0b2RheSdzIGRl
ZmluaXRpb24gcmF0aGVyIGxvb2tzIGxpa2UgY2F0cyBoYXZpbmcgYSBqb2xseSBnb29kIHRpbWUg
d2l0aCBhIGtleWJvYXJkLCBhbmQgZXNwZWNpYWxseSB0aGUgd2VpcmQga2V5cy4KCj4gVGhhdCBw
bGFjZSBpcyB0aGUgIkdsb2JiaW5nIiBzZWN0aW9uLiBIYXZlIGEgbG9vayBhdCBpdCwgaXQgc2hv
dWxkIGhlbHAKPiB0byB1bmRlcnN0YW5kIHRoZSBBQVJFIHN5bnRheC4KCkFoLCB0aGFua3MgZm9y
IHRoYXQgcG9pbnRlciEgSXQgZG9lcyBoZWxwIHVuZGVyc3RhbmRpbmcgdGhlIEFBUkUgc3ludGF4
IC4uLiBidXQgdW5mb3J0dW5hdGVseSBvbmx5IHRvIF9zb21lXyBleHRlbmQuIEZvciBpbnN0YW5j
ZSwgdGhpcyBkb2VzIG5vdCBleHBsYWluIHRoZSBhZGRpdGlvbmFsIGZlYXR1cmVzIHRoYXQgc2Vl
bXMgdG8gYmUgZGVmaW5lZCwgbGlrZSB1c2luZyB2YXJpYWJsZXM7IGJ1dCB0aGVuLCB0aGUgZ2xv
YmJpbmcgc2VjdGlvbiBkb2Vzbid0IGNvdmVyIHZhcmlhYmxlcyBlaXRoZXIuCgpGb3IgaW5zdGFu
Y2UsIGluIHRoZSBjb250ZXh0IG9mIHNwZWNpZnlpbmcgYSBwZWVyIHVzaW5nIGFuIEFBUkU6IGRv
ZXMgdGhhdCBtZWFuIHRoYXQgSSBjb3VsZCBzcGVjaWZ5IGEgc2V0IG9mIG1hdGNoaW5nIHByb2Zp
bGUgbmFtZXMgKHRhc2sgbGFiZWxzKSwgc3VjaCBhcyAiZm9vKiI/IG9yICIvdXNyL2Jpbi8qIj8K
Cj4gSWYgeW91IHN0aWxsIGhhdmUgcXVlc3Rpb25zLCBmZWVsIGZyZWUgdG8gYXNrIC0gbWF5YmUg
dGhlIG1hbnBhZ2UgbmVlZHMKPiBtb3JlIGltcHJvdmVtZW50cyA7LSkKCi4uLkkgd291bGQgc3Vz
cGVjdCBzby4uLgoKQmVzdCByZWdhcmRzLApIYXJhbGQKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxp
c3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3Jp
YmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9y
Cg==
