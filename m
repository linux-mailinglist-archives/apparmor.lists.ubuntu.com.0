Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9983D24226D
	for <lists+apparmor@lfdr.de>; Wed, 12 Aug 2020 00:20:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k5cdM-0000xU-9E; Tue, 11 Aug 2020 22:20:40 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1k5cdK-0000xO-8s
 for apparmor@lists.ubuntu.com; Tue, 11 Aug 2020 22:20:38 +0000
Received: from mephala (unknown [IPv6:2001:16b8:30c2:de00:9985:89da:b817:c8ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id CD015240CB8
 for <apparmor@lists.ubuntu.com>; Wed, 12 Aug 2020 00:20:37 +0200 (CEST)
Date: Wed, 12 Aug 2020 00:20:37 +0200
From: Jonas =?UTF-8?B?R3Jvw59l?= Sundrup <jgs-apparmor@letopolis.de>
To: apparmor@lists.ubuntu.com
Message-ID: <20200812002037.77fa6505@mephala>
X-Pect: The Spanish Inquisition
MIME-Version: 1.0
Subject: [apparmor] Confinement inheritance with ix
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

SGksCgpJIGhhdmUgcmVjZW50bHkgbG9ja2VkIGRvd24gYSBidW5jaCBvZiBlbGVjdHJvbiBhcHBz
IHVzaW5nIEFwcEFybW9yIGFuZApJIG5vdGljZWQgc29tZXRoaW5nIHRoYXQgZG9lc24ndCB5ZXQg
bWFrZSBzZW5zZSBpbiBteSBtaW5kOgoKQWxsIGVsZWN0cm9uLWFwcHMgSSdtIHVzaW5nIGRvIHNw
bGl0IGludG8gbXVsdGlwbGUgZXhlY3V0YWJsZXMsIGZvciBvbmUKdGhlIG5hbWVkIGV4ZWN1dGFi
bGUgd2hpY2ggSSBjYWxsIHRvIHN0YXJ0IGl0IGFuZCBmb3IgdHdvIHRoZSBhcHAuYXNhciwKd2hp
Y2ggc2VlbXMgdG8gYmUgdGhlIGVsZWN0cm9uIGV4ZWN1dGFibGUsIHdoaWNoIGlzIGluIHR1cm4g
c3RhcnRlZCBieQp0aGUgIm5hbWVkIGV4ZWN1dGFibGUiLgoKSSBsb2NrZWQgZG93biB0aGUgbmFt
ZWQgZXhlY3V0YWJsZSBhbmQgYWRkZWQKCiAgL3BhdGgvdG8vYXBwLmFzYXIgcml4LAoKdG8gdGhl
IHByb2ZpbGUgYW5kIEkgd291bGQgZXhwZWN0IHRoYXQgdGhpcyBhcHAuYXNhciBpcyB0aGVuIGNv
bmZpbmVkCmp1c3QgbGlrZSB0aGUgZXhlY3V0YWJsZSB0aGUgcHJvZmlsZSBpcyBtYWRlIGZvciAo
YW5kIHdoaWNoIGlzCm9yaWdpbmFsbHkgY2FsbGVkKS4gQWNjb3JkaW5nIHRvIGh0b3AsIHRoZSBh
cHAuYXNhciBpcyBpbmRlZWQgYQpzdWJwcm9jZXNzIG9mIHRoZSBuYW1lZCBleGVjdXRhYmxlLgoK
SG93ZXZlciwgaXQgZG9lc24ndCBzZWVtIHRvIGJlIHNvIChhdCBsZWFzdCB3aXRoIHJlZ2FyZHMg
dG8gdGhlCmZpbGVzeXN0ZW0gYWNjZXNzKS4gVG8gYWNoaWV2ZSB0aGlzLCBJIGhhdmUgdG8gYWRk
IGFuIGFkZGl0aW9uYWwKcHJvZmlsZSBmb3IgL3BhdGgvdG8vYXBwLmFzYXIsIGFuZCB0aGVuIG1v
ZGlmeSB0aGUgbGluZSBhYm92ZSB0bwoKICAvcGF0aC90by9hcHAuYXNhciBycHgsCgp3aGljaCBh
Y2hpZXZlcyB0aGUgZGVzaXJlZCBjb250YWlubWVudCBlZmZlY3QuCgpJbiBwcmFjdGljZSB0aGlz
IGlzIHdoYXQgSSdtIGRvaW5nIGFueXdheXMgbW9zdGx5LCBhcyB0aGUgYXBwLmFzYXIKdXN1YWxs
eSB3b3JrcyB3aXRoIGEgdGlnaHRlciBoYXJuZXNzLCBidXQgYWNjb3JkaW5nIHRvIHRoZQpkb2N1
bWVudGF0aW9uLCBzaG91bGRuJ3QgIml4IiBhbHNvIGhhdmUgc3VjaCBhbiBlZmZlY3QgaW5zdGVh
ZCBvZiB0aGUKc3VicHJvY2VzcyBmYWxsaW5nIG91dCBvZiBjb25maW5lbWVudD8KCk9yIGluIG90
aGVyIHdvcmRzOiB3aGVyZSBpcyBteSBtZW50YWwgbW9kZWwgb2YgQXBwQXJtb3Igc3RpbGwgaW5j
b3JyZWN0PwoKKEkgZG8gaGF2ZSBvdGhlciBleGVjdXRpb24gZmxhZ3MgaW4gdGhlIHByb2ZpbGVz
IGluIHF1ZXN0aW9uLCBidXQgYWxsIG9mCnRoZW0gYXJlIGl4LikKCgpUaGFua3MgaW4gYWR2YW5j
ZSwKSm9uYXMKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1
LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1
bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
