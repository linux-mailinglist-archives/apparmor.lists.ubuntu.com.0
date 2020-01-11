Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDB913811F
	for <lists+apparmor@lfdr.de>; Sat, 11 Jan 2020 12:32:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iqF0A-0002ly-70; Sat, 11 Jan 2020 11:32:22 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1iqF09-0002ls-E5
 for apparmor@lists.ubuntu.com; Sat, 11 Jan 2020 11:32:21 +0000
Received: from static-50-53-33-191.bvtn.or.frontiernet.net ([50.53.33.191]
 helo=[192.168.192.153]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>)
 id 1iqF09-0005Lo-0n; Sat, 11 Jan 2020 11:32:21 +0000
To: "J. R. Okajima" <hooanon05g@gmail.com>
References: <24238.1577448944@jrobl>
 <38e06865-74fa-5dd7-b166-8dbe0961e4fe@canonical.com> <29337.1578242867@jrobl>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <9b142fc0-87fc-6eb2-bf2e-ae546a3c754f@canonical.com>
Date: Sat, 11 Jan 2020 03:32:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <29337.1578242867@jrobl>
Content-Language: en-GB
Subject: Re: [apparmor] How does ALIAS work?
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

T24gMS81LzIwIDg6NDcgQU0sIEouIFIuIE9rYWppbWEgd3JvdGU6Cj4gSm9obiBKb2hhbnNlbjoK
Pj4gY3VycmVudGx5IGl0IHdvcmtzIHBvb3JseS4gV2hhdCBpdCBkb2VzIGl0IHJ1bGUgcmV3cml0
aW5nIHNvIHRoYXQKPj4gdGhlIGxlYWRpbmcgZWxlbWVudHMgb2YgYSBydWxlICJzaG91bGQiIGJl
IHJlcGxhY2VkLgo+IAk6OjoKPj4gSXQgaXMgcG9zc2libGUgdG8gZml4IHRoaXMsIHNvIHRoYXQg
dGhlIGNvbXBpbGVyIGNhbiBkbyB0aGUgcmV3cml0ZQo+PiBhZ2FpbnN0IHRoZSBnZW5lcmF0ZWQg
c3RhdGUgbWFjaGluZS4gVGhpcyBoYXMgZXZlbiBiZWVuIHByb3RvdHlwZWQKPj4gYnV0IGlzIGN1
cnJlbnRseSBidWdneSBhbmQgbmVlZHMgYSBsb3QgbW9yZSB3b3JrIGJlZm9yZSB3ZSBjYW4gbGFu
ZAo+PiBpdC4KPiAKPiBUaGFuayB5b3UgZm9yIHRoZSByZXBseS4KPiBCdXQgSSBzdGlsbCBkb24n
dCBnZXQgaXQuICBEbyB5b3UgbWVhbiB0aGF0Cj4+PiAtIGFkZCBhbiBhbGlhcyBydWxlICJhbGlh
cyAvIC0+IC90bXAvLCIKPiBpbiBteSB0ZXN0IHNjcmlwdCAoYXR0YWNoZWQgdG8gcHJldmlvdXMg
bWFpbCkgZG9lc24ndCB3b3JrIGF0IGFsbD8gIEFuZAo+IGl0IHdvbid0IGJlIGZpeGVkIGVhc2ls
eT8KPiBDb3VsZCB5b3UgdHJ5IHJlcHJvZHVjaW5nIHRoZSBwcm9ibGVtIGJ5IG15IHRlc3Qgc2Ny
aXB0IGlmIHlvdSBoYXZlIG5vdAo+IHRyaWVkPwo+IAo+IApzb3JyeSBmb3IgdGhlIGRlbGF5ZWQg
cmVzcG9uc2UuIFllcyBJIHdpbGwgdHJ5IGJ1dCBpdCBtYXkgdGFrZSBtZSBhIHdoaWxlCnRvIGdl
dCB0byBpdC4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1
LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1
bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
