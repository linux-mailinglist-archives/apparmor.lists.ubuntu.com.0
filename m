Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA85138454
	for <lists+apparmor@lfdr.de>; Sun, 12 Jan 2020 01:48:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iqRQW-00027R-Ku; Sun, 12 Jan 2020 00:48:24 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1iqRQU-00027C-H1
 for apparmor@lists.ubuntu.com; Sun, 12 Jan 2020 00:48:22 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id B0F1B16005E
 for <apparmor@lists.ubuntu.com>; Sun, 12 Jan 2020 01:48:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1578790101; bh=+jv/O3ENhgtwDbthmw0eyQRyUMP/MP9K6IXkX4x5OUw=;
 h=Subject:To:From:Date:From;
 b=Rrl4oY6/iv5vZ8G9BHtkWq/qfJpe+uxIY9HrbFzALMHt6JUHGfdt9pg01X2fRJ94m
 6zU3yx/TtIj+nYGCOlpUsBykw6GTzQ9DTIPsksHx4P5UK3ogiIdpuPbthCOW5u8BrR
 mnPllxJ7aaIYfa8hw174CrfRjdaig/bXUphJhO/ganbekNEu3JtHATO/iaghx6/Go8
 UoXn1cVdrSlkTds8A7//ABSqRrQxOUSrjv7f84qSwqSvLuVfXY2pFSg3cnMkM6d32y
 I05Al9Z2hwuK1X+FHvKWBrnjNi1TZfdx2nWasjuY3xYRunshDr7q8uZwldBoGO+MEC
 9uh7r579fDsMA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47wJ451Pf6z6tm6;
 Sun, 12 Jan 2020 01:48:21 +0100 (CET)
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
References: <c94da22f-6b7d-757e-37e8-79366940d7bc@posteo.de>
 <19ec141a-d2e1-90e4-b3ae-cc23ca159cb7@canonical.com>
From: mailing list <mailinglisten@posteo.de>
Message-ID: <0b0b37c6-5045-8729-e309-337d127b4126@posteo.de>
Date: Sun, 12 Jan 2020 01:48:21 +0100
MIME-Version: 1.0
In-Reply-To: <19ec141a-d2e1-90e4-b3ae-cc23ca159cb7@canonical.com>
Content-Language: de-DE
Subject: Re: [apparmor] wildcard syntax
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

QXQgMTEuMDEuMjAgIDEyOjMxIEpvaG4gSm9oYW5zZW4gdG9sZCB1czoKPiBPbiAxLzEwLzIwIDk6
MzggUE0sIG1haWxpbmcgbGlzdCB3cm90ZToKPj4gSGkgdGhlcmUsCj4+Cj4+IGRvZXMgQUEgdW5k
ZXJzdGFuZCB0aGUgPyBhcyBhIHdpbGRjYXJkIGZvciBzaW5nbGUgY2hhcmFjdGVycz8KPj4gRS5n
LiBWaXJ0dWFsQm94IHNlZW1zIHRvIHdhbnQgY3JlYXRpbmcgdGVtcG9yYXJ5IGZpbGVzIGxpa2UK
Pj4KPj4gJEhPTUUvIzQ1Njc4MzYxCj4+ICguLi4pCj4gCj4gJEhPTUUgaXMgbm90IGEgdmFsaWQg
YXBwYXJtb3IgcGF0aCBleHBhbnNpb24gdmFyaWFibGUuIFlvdSB3b3VsZCB1c2UKPiAKPiBAe0hP
TUV9LyM/Pz8/Pz8/PyBtcncsCj4gCj4gVGhlIGFwcGFybW9yIGdsb2JiaW5nIHN5bnRheCB1c2Vz
Cj4gKiAtIG1hdGNoIHplcm8gb3IgbW9yZSBvZiBhbnl0aGluZyB1cCB0byBidXQgbm90IGluY2x1
ZGluZyB0aGUgZGlyZWN0b3J5IC8gaXQgaXMgcm91Z2hseSBlcXVpdmFsZW50IHRvIHBjcmUgW14v
XHgwMF0qCj4gKiogLSBtYXRjaCB6ZXJvIG9yIG1vcmUgb2YgYW55dGhpbmcgaW5jbHVkaW5nIHRy
YXZlcnNpbmcgZGlyZWN0b3J5IC8gaXQgaXMgcm91Z2hseSBlcXVpdmFsZW50IHRvIHBjcmUgW15c
eDAwXSoKPiBbXSAtIGNoYXJhY3RlciBjbGFzcwo+IFteXSAtIGludmVydGVkIGNoYXJhY3RlciBj
bGFzcwo+ID8gLSBhbnkgc2luZ2xlIGNoYXJhY3RlciBub3QgaW5jbHVkaW5nIHRoZSBkaXJlY3Rv
cnkgLyAgd2hpY2ggaXMgYSBwY3JlIFteL1wwMF0KPiB7LH0gLSBhbHRlcm5hdGlvbiAgcGNyZSAo
fCkKPiBcIGlzIHVzZWQgYXMgYW4gZXNjYXBlIHRvIGVuY29kZSBzcGVjaWFsIGNoYXJhY3RlcnMK
PiAKPiAjIGlzIG5vdCBhIHNwZWNpYWwgY2hhcmFjdGVyLgoKVGhhbmtzLgpBY3R1YWxseSwgbWFu
IDUgYXBwYXJtb3IuZCBleHBsYWlucyB0aGUgZ2xvYmJpbmcuIEkganVzdCB3YXNuwrR0IHN1cmUK
YWJvdXQgdGhlIHBvdW5kIHNpZ24uCgpUaGFua3MKCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0
CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJl
IGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=
