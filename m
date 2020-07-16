Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C92222E87
	for <lists+apparmor@lfdr.de>; Fri, 17 Jul 2020 00:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jwCjx-0006tl-AX; Thu, 16 Jul 2020 22:52:33 +0000
Received: from mout02.posteo.de ([185.67.36.66])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1jwCjv-0006tf-PK
 for apparmor@lists.ubuntu.com; Thu, 16 Jul 2020 22:52:31 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 1FEC32400FB
 for <apparmor@lists.ubuntu.com>; Fri, 17 Jul 2020 00:52:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1594939951; bh=nQGyOjRgmEoE2h+D1kfKAy8xpUGbIVOw1WDYMFOMOZ8=;
 h=Subject:To:From:Autocrypt:Date:From;
 b=b0Vc8BlNNnfKufgtciKbPL6Y4BEcAIot6Y72k53YXMMHRTwZpPXA+ijfl2OUZ58tn
 tUSGVOUEPagHJwAkHZfwJ14rBLw0e/61As16MR4/fjKkCWqzZ7V7/hsJGtgBRHDpnQ
 4mIP0NziKVCVTRzYp81N9sWt4x6lBRQsWWxAHVcVITaiegJqqWXO/SjjXhOiNLvlVV
 VNAEa9hrX5Lv66vrbxktpF3vXgxtCZlsy3qr6CzgHRZR1OCRDpH9Y+/OOqo07G5j0L
 BFE+z2e7gem7++bQ4xVoY5orJVgpIEXxzGK7XYwCe6x3bIh9P1ZdELZXziQsD/31Qg
 K6dZVr7vzjbMA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4B78f65ST0z6tmG
 for <apparmor@lists.ubuntu.com>; Fri, 17 Jul 2020 00:52:30 +0200 (CEST)
To: apparmor@lists.ubuntu.com
References: <375a90df-1a79-649e-7c99-5dde32280c44@posteo.de>
 <20200716215125.GB1808886@millbarge>
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
Message-ID: <3042b669-4d48-4941-b390-fc1fb83c1494@posteo.de>
Date: Fri, 17 Jul 2020 00:52:30 +0200
MIME-Version: 1.0
In-Reply-To: <20200716215125.GB1808886@millbarge>
Content-Language: de-DE
Subject: Re: [apparmor] rkhunter profile oddities
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

QW0gMTYuMDcuMjAgdW0gMjM6NTEgc2NocmllYiBTZXRoIEFybm9sZDoKPiBPbiBUaHUsIEp1bCAx
NiwgMjAyMCBhdCAwOTozNjoxMVBNICswMjAwLCBtYWlsaW5nbGlzdGVuQHBvc3Rlby5kZSB3cm90
ZToKPj4gSW5zdGVhZCwgYXMgeW91IGNhbiBzZWUsIGFwcGFybW9yIHJlcG9ydHM6Cj4+ICQKPj4g
TmFtZTogdXNyL3NiaW4vTW9kZW1NYW5hZ2VyCj4+IE5hbWU6IHVzci9zYmluL05ldHdvcmtNYW5h
Z2VyCj4+ICQKPj4gJAo+PiBJcyB0aGlzIHByb2JhYmx5IGFuIGVycm9yIGluIHJraHVudGVyIGFu
ZCBub3QgaW4gYXBwYXJtb3I/Cj4gCj4gVGhpcyBpcyBiZWNhdXNlIHJraHVudGVyIGlzIGV4ZWN1
dGluZyBpbiBpdHMgb3duIGZpbGVzeXN0ZW0gbmFtZXNwYWNlIGZvcgo+IHdoYXRldmVyIHJlYXNv
biwgYW5kIHRoZSBMU00gaW50ZXJmYWNlIGlzbid0IHBhc3NpbmcgdG8gQXBwQXJtb3IKPiBzdWZm
aWNpZW50IGluZm9ybWF0aW9uIGZvciBBcHBBcm1vciB0byBrbm93IHRoZSBtb3VudHBvaW50IHRo
YXQgd2FzIHVzZWQKPiB0byBhY2Nlc3MgdGhvc2UgZmlsZXMuCj4gCj4gWW91IGNhbiBhZGQgZmxh
Z3M9KGF0dGFjaF9kaXNjb25uZWN0ZWQpIG5lYXIgdGhlIHN0YXJ0IG9mIHRoZSBwcm9maWxlIHRv
Cj4gY2F1c2UgdGhlc2UgYWNjZXNzZXMgdG8gYmUgdHJlYXRlZCBhcyBpZiB0aGV5IHdlcmUgbW91
bnRlZCBhdCAvLgo+IAo+IGVnCj4gCj4gcHJvZmlsZSBya2h1bnRlciAvdXNyL2Jpbi9ya2h1bnRl
ciBmbGFncz0oYXR0YWNoX2Rpc2Nvbm5lY3RlZCkgewo+ICAgLyoqIHIsCgpUaGFua3MgYSBsb3Qg
IQpUaGF0IGRpZCB0aGUgdHJpY2suCgpBbmQgSSBqdXN0IHNlZSwgc29tZSBwcm9maWxlcyBhbHJl
YWR5IHVzZSB0aGlzIGZsYWcsIGxpa2UgdXNyLnNiaW4ubnRwZAp1c3Iuc2Jpbi5hcGFjaGUyIGFu
ZCBmZXcgb3RoZXJzLgoKQmVzdCByZWdhcmRzCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFw
cEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0
OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=
