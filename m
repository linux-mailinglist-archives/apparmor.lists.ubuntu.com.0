Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A8C13811E
	for <lists+apparmor@lfdr.de>; Sat, 11 Jan 2020 12:31:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iqEzK-0002iO-UI; Sat, 11 Jan 2020 11:31:30 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1iqEzJ-0002iH-Az
 for apparmor@lists.ubuntu.com; Sat, 11 Jan 2020 11:31:29 +0000
Received: from static-50-53-33-191.bvtn.or.frontiernet.net ([50.53.33.191]
 helo=[192.168.192.153]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>)
 id 1iqEzI-0005I2-TH; Sat, 11 Jan 2020 11:31:29 +0000
To: mailing list <mailinglisten@posteo.de>, apparmor@lists.ubuntu.com
References: <c94da22f-6b7d-757e-37e8-79366940d7bc@posteo.de>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <19ec141a-d2e1-90e4-b3ae-cc23ca159cb7@canonical.com>
Date: Sat, 11 Jan 2020 03:31:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <c94da22f-6b7d-757e-37e8-79366940d7bc@posteo.de>
Content-Language: en-GB
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

T24gMS8xMC8yMCA5OjM4IFBNLCBtYWlsaW5nIGxpc3Qgd3JvdGU6Cj4gSGkgdGhlcmUsCj4gCj4g
ZG9lcyBBQSB1bmRlcnN0YW5kIHRoZSA/IGFzIGEgd2lsZGNhcmQgZm9yIHNpbmdsZSBjaGFyYWN0
ZXJzPwo+IEUuZy4gVmlydHVhbEJveCBzZWVtcyB0byB3YW50IGNyZWF0aW5nIHRlbXBvcmFyeSBm
aWxlcyBsaWtlCj4gCj4gJEhPTUUvIzQ1Njc4MzYxCj4gCj4gVGhlc2UgdGVtcCBmaWxlcyBhbHdh
eXMgc3RhcnQgd2l0aCBoYXNoIGtleSBzeW1ib2wgd2hpY2ggbWF5Cj4gYWRkaXRpb25hbGx5IHRy
b3VibGUgQUEgcnVsZT8KPiAKPiBXb3VsZCB0aGUgcnVsZQo+IAo+ICRIT01FLyM/Pz8/Pz8/PyBt
cncsCj4gCj4gY292ZXIgdGhlIHN5bnRheCBvZiBzdWNoIHRlbXAgZmlsZXM/IFdoYXQgYWJvdXQg
dGhlIGhhc2gga2V5Lgo+IAo+IERvIEkgbmVlZCB0byB0ZWxsIEFBIHRvIHNlZSB0aGUgaGFzaCBr
ZXkvcG91bmQgc3ltYm9sIG9ubHkgYXMgInBsYWluCj4gc3ltYm9sIj8KPiAKPiBPaywgSSBub3cg
dHJpZWQKPiAkSE9NRS8jPz8/Pz8/Pz8gbXJ3LAo+IFRoZSBwb3VuZCBzaWduIHNlZW0gdG8gYmUg
c2VlbiBqdXN0IGFzIHBsYWluIHN5bWJvbCwgYXMgZGVzaXJlZC4KPiAKCiRIT01FIGlzIG5vdCBh
IHZhbGlkIGFwcGFybW9yIHBhdGggZXhwYW5zaW9uIHZhcmlhYmxlLiBZb3Ugd291bGQgdXNlCgpA
e0hPTUV9LyM/Pz8/Pz8/PyBtcncsCgpUaGUgYXBwYXJtb3IgZ2xvYmJpbmcgc3ludGF4IHVzZXMK
KiAtIG1hdGNoIHplcm8gb3IgbW9yZSBvZiBhbnl0aGluZyB1cCB0byBidXQgbm90IGluY2x1ZGlu
ZyB0aGUgZGlyZWN0b3J5IC8gaXQgaXMgcm91Z2hseSBlcXVpdmFsZW50IHRvIHBjcmUgW14vXHgw
MF0qCioqIC0gbWF0Y2ggemVybyBvciBtb3JlIG9mIGFueXRoaW5nIGluY2x1ZGluZyB0cmF2ZXJz
aW5nIGRpcmVjdG9yeSAvIGl0IGlzIHJvdWdobHkgZXF1aXZhbGVudCB0byBwY3JlIFteXHgwMF0q
CltdIC0gY2hhcmFjdGVyIGNsYXNzClteXSAtIGludmVydGVkIGNoYXJhY3RlciBjbGFzcwo/IC0g
YW55IHNpbmdsZSBjaGFyYWN0ZXIgbm90IGluY2x1ZGluZyB0aGUgZGlyZWN0b3J5IC8gIHdoaWNo
IGlzIGEgcGNyZSBbXi9cMDBdCnssfSAtIGFsdGVybmF0aW9uICBwY3JlICh8KQpcIGlzIHVzZWQg
YXMgYW4gZXNjYXBlIHRvIGVuY29kZSBzcGVjaWFsIGNoYXJhY3RlcnMKCiMgaXMgbm90IGEgc3Bl
Y2lhbCBjaGFyYWN0ZXIuCgoKCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxp
c3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczov
L2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=
