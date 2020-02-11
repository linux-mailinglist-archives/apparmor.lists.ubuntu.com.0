Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C3F159340
	for <lists+apparmor@lfdr.de>; Tue, 11 Feb 2020 16:36:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1j1XZz-0003Vj-5I; Tue, 11 Feb 2020 15:36:03 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1j1XZx-0003VI-HW
 for apparmor@lists.ubuntu.com; Tue, 11 Feb 2020 15:36:01 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id CE663160063
 for <apparmor@lists.ubuntu.com>; Tue, 11 Feb 2020 16:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1581435360; bh=dxZKpcVOQwZOEFii4Y5WM0vGgZFwXOcJrZxS1yOD+HU=;
 h=Subject:To:From:Autocrypt:Date:From;
 b=FPIrXVdswij62oJhFZEt3rZEGtqn1yepsyTOw8AYJv/fL9oU7Wghi4fB7RJ+y+oO9
 jkHFfHJ9oyV9udHWvHEC40gLs7AL6Ljg45EnAlCYZJivtzvyaGRehqMsgC9+3Fh7f8
 Icilj5VKhiPpALeDr76d0prur2ZnxDWo9gazdreWrKl9Vc2MPbPVFivAxXZmSulWK1
 uRyCOShvhxPP8Iao7hTaTtPhEK0fIUGxoaE92RnNAPS3wS7j5fhSVLkLHzCgnZBuhD
 uRWxxubCH6KwdVMRlitsS8N5+GmuUVDMnUy8oJ6dtLpLMUtQfspJCfPq2tAXSqVCMT
 opP/O8thVb+wQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 48H6LS2JQwz6tmF;
 Tue, 11 Feb 2020 16:36:00 +0100 (CET)
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
References: <bf20d814-6389-94f9-cc46-af7266465ad8@posteo.de>
 <e6baaa57-5375-8bbb-7313-651f426a1f76@canonical.com>
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
Message-ID: <6c567c8d-62a4-0855-0668-a40f1402b952@posteo.de>
Date: Tue, 11 Feb 2020 16:36:00 +0100
MIME-Version: 1.0
In-Reply-To: <e6baaa57-5375-8bbb-7313-651f426a1f76@canonical.com>
Content-Language: de-DE
Subject: Re: [apparmor] Accessing DMI data!?
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

MTAuMDIuMjAgIDE4OjQ5Ogo+IE9uIDIvMTAvMjAgNzoyMyBBTSwgbWFpbGluZ2xpc3RlbkBwb3N0
ZW8uZGUgd3JvdGU6Cj4+IGhlbGxvLAo+Pgo+PiBpIGp1c3QgZGlzY292ZXJlZCwgc29tZSBhcHBz
IGRlc2lyZSBhY2Nlc3MgdG8gRE1JIGRhdGEsIHByZWNpc2VseSB0bwo+PiAvc3lzL2RldmljZXMv
dmlydHVhbC9kbWkvaWQvCj4+ICguLi4pCj4gR2VuZXJhbGx5IHNwZWFraW5nIHRoZSB3ZWIgYnJv
d3NlciBkb2Vzbid0IG5lZWQgYWNjZXNzIHRvIGl0LiBZb3UgY2FuIGRlbnkKPiBhY2Nlc3MgdG8g
aXQgYW5kIHRoZSB3ZWIgYnJvd3NlciBzaG91bGQgZnVuY3Rpb24uIEhvd2V2ZXIgc29tZSBmZWF0
dXJlcwo+IG1heSBub3Qgd29yaywgbGlrZSB0aGUgY2hyb21lIGV4dGVuc2lvbiBBUEkgdGhhdCB3
YXMgYWxyZWFkeSBwb2ludGVkIG91dC4KCkFoLCB2ZXJ5IGludGVyZXN0aW5nLiBGaXJlZm94IHNl
ZW1zIHRvIHVzZS9oYXZlIHRoZSBzYW1lIEFQSSwgYmVjYXVzZSBJCm5vdGljZWQgdGhpcyBhY2Nl
c3Mgd2l0aCBGaXJlZm94Li4uLgoKV2hhdCBJIHJlY2VudGx5IGRvIGlzIHRvIGNyZWF0ZSBhIGNv
cHkgb2YgYSBwcm9ncmFtIGFuZCB0aGVuIGhhdmUgMgpwcm9maWxlcywgb25lIHZlcnkgdGlnaHQg
YW5kIHRoZSBvdGhlciBhIGJpdCBtb3JlIGZsZXhpYmVsLCBlLmcuIEkgaGF2ZQovdXNyL2Jpbi92
bGMgYW5kIC91c3IvYmluL3ZsYy1zZWN1cmUgIGJvdGggZXhhY3RseSB0aGUgc2FtZSwgYnV0IHdp
dGgKZGlmZmVyZW50IG5hbWUgdGhhdCBhbGxvd3MgdG8gaGF2ZSBkaWZmZXJlbnQgcHJvZmlsZXMu
CgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9k
aWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20v
bWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=
