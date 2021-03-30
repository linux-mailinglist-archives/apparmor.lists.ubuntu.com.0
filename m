Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ABD34F3B9
	for <lists+apparmor@lfdr.de>; Tue, 30 Mar 2021 23:49:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lRMEf-0000Ak-MT; Tue, 30 Mar 2021 21:49:17 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1lRMEe-0000Ae-FL
 for apparmor@lists.ubuntu.com; Tue, 30 Mar 2021 21:49:16 +0000
Received: from mephala (unknown [IPv6:2001:16b8:30d9:b600:a2c0:3756:90f3:9045])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id 986A9241062
 for <apparmor@lists.ubuntu.com>; Tue, 30 Mar 2021 23:41:47 +0200 (CEST)
Date: Tue, 30 Mar 2021 23:41:46 +0200
From: Jonas =?UTF-8?B?R3Jvw59l?= Sundrup <jgs-apparmor@letopolis.de>
To: apparmor@lists.ubuntu.com
Message-ID: <20210330234146.5b59340a@mephala>
In-Reply-To: <8394045.udUvZY7WZc@tux.boltz.de.vu>
References: <20210330222800.6699c3e3@mephala>
 <8394045.udUvZY7WZc@tux.boltz.de.vu>
X-Pect: The Spanish Inquisition
MIME-Version: 1.0
Subject: Re: [apparmor] Rule to allow chmod-operations (or reduce dmesg
 suppression)
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

T24gMjAyMS0wMy0zMCwgQ2hyaXN0aWFuIEJvbHR6IHdyb3RlOgo+IEhvd2V2ZXIsIHlvdSBjYXJl
ZnVsbHkgYXZvaWRlZCB0aGUgY29ycmVjdCBwYXRoIDstKSAtIHlvdSdsbCBuZWVkCj4gICAgIC92
YXIvY2FjaGUvZm9udGNvbmZpZy8gdywKCkZNTCwgdGhhdCBzbGlwcGVkIG15IG1pbmQuIFRoYW5r
cyBmb3IgdGhlIHBvaW50ZXIhCgoKSW4gY2FzZSBhbnlvbmUncyBpbnRlcmVzdGVkIHdoYXQgaGFw
cGVuZWQ6CkFwcGFyZW50bHksIHRoZSBmaXJzdCBFbGVjdHJvbi1BcHAgdG8gc3RhcnQgYWZ0ZXIg
c29tZXRoaW5nIG1vcmUgdGhhbiBhCnRleHQgY29uc29sZSBpcyBhdmFpbGFibGUsIG5lZWRzIHJl
YWQgYWNjZXNzIHRvCi9zeXMvZGV2aWNlcy9wY2lzb21ldGhpbmcvcHJvYmFibHlfZ3JhcGhpY3Mg
dG8gbG9hZCB0aGUgZ3JhcGhpY3MKZHJpdmVyLiBOb3Qgc3VyZSB0byB3aGVyZSwgbW9kcHJvYmVk
IGl0IGFscmVhZHkgaXMuCk5vdCB5ZXQgc3VyZSB3aGF0J3MgdGhlIGNsZWFuZXN0IHNvbHV0aW9u
IGhlcmUsIGJ1dCBpdCdzCnN1ZmZpY2llbnQgYSBzb2x1dGlvbiBmb3Igbm93IGZvciBteSBwdXJw
b3NlcyB0byBqdXN0IGdpdmUgdGhhdCBhY2Nlc3MuCgpJdCB3b3JrcyB3aXRob3V0IHRoYXQgcGVy
bWlzc2lvbiBpZiBJIGFhLXRlYXJkb3duIGZpcnN0LCB0aGVuIHN0YXJ0IGFueQpFbGVjdHJvbi1B
cHAsIGNsb3NlIHRoYXQgYXBwIGFnYWluLCByZWxvYWQgYWxsIEFwcEFybW9yLXJ1bGVzIGFuZCB0
aGVuCkkgY2FuIGhhcHBpbHkgc3RhcnQgYWxsIG90aGVyIGVsZWN0cm9uIGFwcHMgKHByb2JhYmx5
IGJlY2F1c2UgdGhlbgpzb21ldGhpbmcgaXMgbG9hZGVkIGluIFggb3Igc28sIHRoZW4gYWdhaW4s
IG90aGVyIFgtQXBwcyB3b3JrIGZpbmUsCml0J3Mgb25seSBlbGVjdHJvbuKApiBCdXQgeWVhaCwg
aWYgYW55b25lJ3MgaW50ZXJlc3RlZCBpbiB0aGUKdHVybm91dC9zb2x1dGlvbi4KCgogIH4gSm9u
YXMKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpN
b2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
