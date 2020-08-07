Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE5323F1AC
	for <lists+apparmor@lfdr.de>; Fri,  7 Aug 2020 19:07:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k45qL-0006eP-Rc; Fri, 07 Aug 2020 17:07:45 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1k45qJ-0006eJ-70
 for apparmor@lists.ubuntu.com; Fri, 07 Aug 2020 17:07:43 +0000
Received: from mephala (unknown [IPv6:2001:16b8:30b4:c000:a8c6:79a8:18ef:45a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id B2F1F24042A;
 Fri,  7 Aug 2020 19:07:42 +0200 (CEST)
Date: Fri, 7 Aug 2020 19:07:41 +0200
From: Jonas =?UTF-8?B?R3Jvw59l?= Sundrup <jgs-apparmor@letopolis.de>
To: John Johansen <john.johansen@canonical.com>, Christian Boltz
 <apparmor@cboltz.de>
Message-ID: <20200807190741.70738f15@mephala>
In-Reply-To: <22516202-d22a-5975-93f2-fc7606e45e13@canonical.com>
References: <20200806110540.1a67cbe2@mephala>
 <22516202-d22a-5975-93f2-fc7606e45e13@canonical.com>
X-Pect: The Spanish Inquisition
MIME-Version: 1.0
Subject: Re: [apparmor] deny and selectively allow in AppArmor?
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

SGksCgpPbiAyMDIwLTA4LTA2LCBKb2huIEpvaGFuc2VuIHdyb3RlOgo+IGFwcGFybW9yIGlzIGRl
ZmF1bHQgZGVueQoKSSB3YXNuJ3QgYXdhcmUgb2YgdGhhdCBwYXJ0LCBwcm9iYWJseSBkaWRuJ3Qg
cmVhZCB0aGF0IHBhcnQgb2YgdGhlCmRvY3VtZW50YXRpb24gd2VsbCBlbm91Z2ggdG8gcmVtZW1i
ZXIgaW4gdGhhdCBtb21lbnQgYW5kIGR1cmluZyBteQp0ZXN0aW5nIHRoaXMgbGlrZWx5IGRpZG4n
dCB3b3JrIGJlY2F1c2UgZG93biB0aGUgdHJlZSBvZiBpbmNsdWRlZAphYnN0cmFjdGlvbnMKCk9u
IDIwMjAtMDgtMDYsIENocmlzdGlhbiBCb2x0eiB3cm90ZToKPiBkbyB5b3UgaGF2ZSBhbnkgcnVs
ZSBpbiB5b3VyICBwcm9maWxlIHRoYXQgX2FsbG93c18gYWNjZXNzIHRvIHRoZSBob21lCj4gZGly
ZWN0b3J5PwoKdGhpcyB3YXMgdGhlIGNhc2UuIGRlZmF1bHQtZGVueSBkb2VzIG1ha2UgYSBsb3Qg
bW9yZSBzZW5zZSB3aXRoIHJlZ2FyZHMKdG8gYSBNQUMtc3lzdGVtIGluZGVlZC4KCkkgdG9vayBh
biBldmVuaW5nIGNsZWFuaW5nIG91dCB0aGUgYWJzdHJhY3Rpb25zIHRvIHN1aXQgbXkgbmVlZHMg
YW5kCm5vdyB0aGluZ3MgZG8gaW5kZWVkIHdvcmsgbGlrZSBJIHdhbnQgdGhlbSB0byEgQW5kIG1v
c3Qgb2YgdGhlCmFic3RyYWN0aW9ucyBhcmUgbm93IGhhbmQtY3VyYXRlZCwgc28gSSBhY3R1YWxs
eSBrbm93IHdoYXQgZWFjaCBvZiB0aGVtCmRvZXMuCgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0
aGUgcG9pbnRlcnMhCgpJIGhhdmUgb25lIHF1ZXN0aW9uIGxlZnQsIHdoZW4gd2UncmUgYXQgaXQ6
IElmIEkgZG8gaGF2ZSBjb25mbGljdGluZwpkaXJlY3RpdmVzLCBzdWNoIGFzCgogICAgL215L2Rp
cmVjdG9yeSByLAogICAgL215L2RpcmVjdG9yeSBydywKCndoaWNoIG9uZSB0YWtlcyBwcmVjZWRl
bmNlPyB0aGUgZmlyc3QsIHRoZSBsYXN0LCB0aGUgc3RyaWN0ZXIgb3IgdGhlCmJyb2FkZXI/Cklu
IGNhc2Ugb2YgbmVzdGVkIEknZCBzdXNwZWN0IHRoYXQgQXBwQXJtb3Igd2lsbCBqdXN0IG5lc3Qg
dGhlIHBvbGljaWVzCmFjY29yZGluZ2x5LCBubyBtYXR0ZXIgaW4gd2hpY2ggb3JkZXIgdGhleSBv
Y2N1ciwgcmlnaHQ/CgoKICB+IEpvbmFzCgoKT24gMjAyMC0wOC0wNiwgQ2hyaXN0aWFuIEJvbHR6
IHdyb3RlOgo+IFlvdSBjb3VsZCBkbyBzb21lIHRyaWNrZXJ5IHdpdGggcmVnZXhlcy4gQW5ub3lp
bmcsIGJ1dCBzdGlsbCBiZXR0ZXIKPiB0aGFuIGhhdmluZyB0byBkZW55IGVhY2ggYW5kIGV2ZXJ5
IGZpbGUgc2VwYXJhdGVseS4gU29tZXRoaW5nIGxpa2UKPnRoaXM6Cj4gCj4gZGVueSBvd25lciBA
e0hPTUV9LywgICMgZGVueSBkaXJlY3RvcnkgbGlzdGluZyBvZiB0aGUgaG9tZSBkaXJlY3RvcnkK
PiBkZW55IG93bmVyIEB7SE9NRX0vW14uXSoqLAo+IGRlbnkgb3duZXIgQHtIT01FfS9bXi5dW15t
XSoqLAo+IGRlbnkgb3duZXIgQHtIT01FfS9bXi5dW15tXVteb10qKiwKPiBkZW55IG93bmVyIEB7
SE9NRX0vW14uXVtebV1bXm9dW156XSoqLAo+IGRlbnkgb3duZXIgQHtIT01FfS9bXi5dW15tXVte
b11bXnpdW15pXSoqLAo+IGRlbnkgb3duZXIgQHtIT01FfS9bXi5dW15tXVteb11bXnpdW15pXVte
bF0qKiwKPiBkZW55IG93bmVyIEB7SE9NRX0vW14uXVtebV1bXm9dW156XVteaV1bXmxdW15sXSoq
LAo+IGRlbnkgb3duZXIgQHtIT01FfS9bXi5dW15tXVteb11bXnpdW15pXVtebF1bXmxdW15hXSoq
LAoKSSB0aGFuayB5b3Uga2luZGx5IGZvciB0aGUgcHJvcG9zYWwsIGJ1dCBJIHRoaW5rIEknbGwg
YXZvaWQgdGhpcwphcHByb2FjaC4gOykKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJt
b3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0
dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
