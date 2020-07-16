Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id EE647222C05
	for <lists+apparmor@lfdr.de>; Thu, 16 Jul 2020 21:36:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jw9fz-0004Zp-F5; Thu, 16 Jul 2020 19:36:15 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1jw9fx-0004ZB-A2
 for apparmor@lists.ubuntu.com; Thu, 16 Jul 2020 19:36:13 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 9F255160062
 for <apparmor@lists.ubuntu.com>; Thu, 16 Jul 2020 21:36:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1594928172; bh=q9PoGJDkp5YvkozeBaeL45WJP2nd6aEjoG+SveoMEEk=;
 h=To:From:Subject:Autocrypt:Date:From;
 b=rX+BFLFcYanvSrvc+41MGqI0lIcY/FgSS2L4Yd0w3yZ8EQu3bccej6JFbOk2RK8t2
 KlK8FMYisMIkbE5aJbPdV/tX78USlgxcxcc7KbUCdtowHPFsGydXA7Ybs4IA7Ulp58
 IyLqGlomqPJksBpZplsa00dyUxiYIg/9pdFQ/v3raZ7n/cMEnTAgGvMIbuNYchMX64
 5ovpezyOrCaTFOHAhgxKd/MvS1a9MYo7kEg453ZfO7l+ouifm0CSQZkIvpDQwVPDDl
 K30vLxZJpvhHItDuW1BAvK0nztUZYg1lRG+WC7sHUHjd6BWuoGekO/Y/bg1SRRDnT5
 aE0fxNmVADZ1g==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4B74Hc2K5Nz6tmV
 for <apparmor@lists.ubuntu.com>; Thu, 16 Jul 2020 21:36:12 +0200 (CEST)
To: apparmor@lists.ubuntu.com
From: "mailinglisten@posteo.de" <mailinglisten@posteo.de>
Autocrypt: addr=mailinglisten@posteo.de; prefer-encrypt=mutual; keydata=
 xsBNBF5BcpoBCADZb0mLAIGCnJ+D3dmaBnQSjC2Ygb3X1m84EFS5gRO3WcMiuiWSlyHzg3ak
 TPWvKKZhdyQZMKDKZ4b3T57MEOR6Zsp7PH7WOViZc4wLvTdoxZJztmxqCJ0plRNnr09Gmhjg
 1Xfj3NWRW4ulZVHlceXFOQIxj6QyDiDMxkO/qJ5FJM9azMrrOAutaLPVCpHsYKBDvga4XxS1
 pRnKycglBCvKXtpIV71lqHstXpzJ8zGw7OMkgfstdDxfNR1gGT5HyEOzuQRO1NbLYmpy3mDA
 yWp4DXqKd7J4tnrgBcTeItotRIeORPxOQvgCIE0F4L3WRLR90xd2iWuH2Jir/l9lhWIrABEB
 AAHNMW1haWxpbmdsaXN0ZW5AcG9zdGVvLmRlIDxtYWlsaW5nbGlzdGVuQHBvc3Rlby5kZT7C
 wKsEEwEIAD4WIQQAbPcp4hwIbwKI3HXmcUJQpV5BogUCXkFymgIbAwUJEpyNAAULCQgHAgYV
 CgkICwIEFgIDAQIeAQIXgAAhCRDmcUJQpV5BohYhBABs9yniHAhvAojcdeZxQlClXkGiLVYH
 /0nPxv4g5IJ88ETm5rtNVvZ08RURd3vwhu/A3noV2savxHgrMElgp9qGKiLAwM+0Dd5aWIqw
 bAkuHWFmXc/l+tl3lNjsJUET8oaY6AUfDAD64qbea3guvAWBfQTWhvs5hiqjFE7CjTLIQtLj
 aBasv/nOOnKIJM6b36i3hm/YPwBTp54IjsxWVxwvLIDRuL90g0uICObTnJWEXFEeIgErxYIX
 f+kJTHYKNJGFQQzQK0XRTiiIx8p1mQ7SEh7xWoT9EvLcjTtu366jhLh8tm1eVa09RyTrN/xv
 aNMLvfMl5FJbLBEV989RqAMm/NliYUkhBZPL3ezyLQ8hG2i83+22HU3OwE0EXkFymgEIAKnT
 kwIHCrqx2JJCWnHwtXsi38ur+19vxg9W0a+cNqGx7E664YW24ZMqrQqjCn/+Z0ntji404L/T
 dRHyM9AnABRcL+yxQZXXUa6GWdtgbkDQg0dwsVljv8GruU2FLDqBuUgekmklniQq8T7YgOwX
 UylKUFgszZ4Ub1X6vCHtQHOzoByAmlyXquRIKbn+qP7cI3qvLJ2IE/QOzrD3mMEd7IDwEpbF
 nX1bOJNIc3GctjuBs7hJWumRRQvUzjXV3em+V5HxVluiNzGcn+UXnYUAwEfmwXEFX4iVPZos
 AIHpDjN+DuKFbmaQCuyWR/9MeB1pYCn54y/88Nf6OBabwvi7JsUAEQEAAcLAkwQYAQgAJhYh
 BABs9yniHAhvAojcdeZxQlClXkGiBQJeQXKaAhsMBQkSnI0AACEJEOZxQlClXkGiFiEEAGz3
 KeIcCG8CiNx15nFCUKVeQaL6EQgA2TygMXibRRjk2Sbb3BWVzF96m4xa8zbaBrQu2n7JyXJU
 afeKcpfWphK9b9VETHp3wQDSwUjxfiqd8HKC4cPf82TwgSSIE6AXe8tsupqvXEMPB+YD1Jg0
 g2PsK7zv20fIDL+UXO9HqobWRq2jhyOmi6L81MZPA4+ilA4NlRdq/g9Xn2+hn5E0vmQ2fME/
 vOKUUivprerJmaJ1TNPdCANcnkM+aE/GpOxopHN0dWjrTR175e4ua9yc7rhzn+wXl0nTKKr3
 zmMsfhwJ0opNtiATJRiyPBi0HICbCMuoXRNQKl3eLYCAaZnxxg9iq7/3QdYwurUimm1zCe3+
 KkQQMhUUYg==
Message-ID: <375a90df-1a79-649e-7c99-5dde32280c44@posteo.de>
Date: Thu, 16 Jul 2020 21:36:11 +0200
MIME-Version: 1.0
Content-Language: de-DE
Subject: [apparmor] rkhunter profile oddities
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

SGkgdGhlcmUhCgpJIGNyZWF0ZWQgYSB2ZXJ5IHNpbXBsZSBwcm9maWxlIHRvIGNvbmZpbmUgcmto
dW50ZXIgKHZlcnNpb24gbnVtYmVycyBiZWxvdykuCgpUaGlzIHByb2ZpbGUgY29udGFpbnMgLyoq
IHIsICB0byBiZSBzdXJlLCBldmVyeXRoaW5nIGNhbiBiZSByZWFkIGJ5CnJraHVudGVyLgoKRGVz
cGl0ZSB1c2luZyAvKiogciwgIEkgZ2V0IHBsZW50eSBvZiB0aGVzZSBlcnJvciBtZXNzYWdlczoK
ClByb2ZpbGU6IC91c3IvYmluL3JraHVudGVyCk9wZXJhdGlvbjogZ2V0YXR0cgpOYW1lOiB1c3Iv
c2Jpbi9Nb2RlbU1hbmFnZXIKRGVuaWVkOiByCkxvZ2ZpbGU6IC92YXIvbG9nL2F1ZGl0L2F1ZGl0
LmxvZwooMyBmb3VuZCwgbW9zdCByZWNlbnQgZnJvbSAnVGh1IEp1bCAxNiAxOTo1MToyMiAyMDIw
JykKClByb2ZpbGU6IC91c3IvYmluL3JraHVudGVyCk9wZXJhdGlvbjogZ2V0YXR0cgpOYW1lOiB1
c3Ivc2Jpbi9OZXR3b3JrTWFuYWdlcgpEZW5pZWQ6IHIKTG9nZmlsZTogL3Zhci9sb2cvYXVkaXQv
YXVkaXQubG9nCigzIGZvdW5kLCBtb3N0IHJlY2VudCBmcm9tICdUaHUgSnVsIDE2IDE5OjUxOjIy
IDIwMjAnKQoKV2hhdCB5b3UgY2FuIHNlZSwgYXQgIk5hbWUiIHRoZXJlIGlzIHRoZSBzbGFzaCBt
aXNzaW5nLCBpdCBzaG91bGQgYmUKTmFtZTogL3Vzci9zYmluL01vZGVtTWFuYWdlcgpOYW1lOiAv
dXNyL3NiaW4vTmV0d29ya01hbmFnZXIKCkluc3RlYWQsIGFzIHlvdSBjYW4gc2VlLCBhcHBhcm1v
ciByZXBvcnRzOgoKTmFtZTogdXNyL3NiaW4vTW9kZW1NYW5hZ2VyCk5hbWU6IHVzci9zYmluL05l
dHdvcmtNYW5hZ2VyCgoKSXMgdGhpcyBwcm9iYWJseSBhbiBlcnJvciBpbiBya2h1bnRlciBhbmQg
bm90IGluIGFwcGFybW9yPwpNeSBndWVzcyBpcywgcmtodW50ZXIgdHJpZXMgdG8gYWNjZXNzIGZp
bGVzIGxpa2UKCnVzci9zYmluL01vZGVtTWFuYWdlcgp1c3Ivc2Jpbi9OZXR3b3JrTWFuYWdlcgp1
c3IvbGliL3Vwb3dlci91cG93ZXJkCnVzci9saWIvYmx1ZXRvb3RoL2JsdWV0b290aGQKCndpdGhv
dXQgdGhlIGxlYWRpbmcgc2xhc2guCgpXaGF0IGRvIHlvdSB0aGluaywgYnJva2VuIHJraHVudGVy
LCBmb3JnZXR0aW5nIHRoZSBsZWFkaW5nIHNsYXNoPwoKVmVyc2lvbnMgdXNlZDoKYXBwYXJtb3It
cGFyc2VyLCBhcHBhcm1vci11dGlscyAgMi4xMy40Cktlcm5lbCA1LjcuNwpya2h1bnRlciAxLjQu
NgoKVGhhbmtzIQoKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1
bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMu
dWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
