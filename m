Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97D23D84B
	for <lists+apparmor@lfdr.de>; Thu,  6 Aug 2020 11:05:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k3bqJ-00066N-Ov; Thu, 06 Aug 2020 09:05:43 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1k3bqH-00065k-Ig
 for apparmor@lists.ubuntu.com; Thu, 06 Aug 2020 09:05:41 +0000
Received: from mephala (unknown [IPv6:2001:16b8:3074:2000:a8c6:79a8:18ef:45a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id 35A332401E7
 for <apparmor@lists.ubuntu.com>; Thu,  6 Aug 2020 11:05:41 +0200 (CEST)
Date: Thu, 6 Aug 2020 11:05:40 +0200
From: Jonas =?UTF-8?B?R3Jvw59l?= Sundrup <jgs-apparmor@letopolis.de>
To: <apparmor@lists.ubuntu.com>
Message-ID: <20200806110540.1a67cbe2@mephala>
X-Pect: The Spanish Inquisition
MIME-Version: 1.0
Subject: [apparmor] deny and selectively allow in AppArmor?
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

SGksCgpJJ20gY3VycmVudGx5IHBsYXlpbmcgYXJvdW5kIHdpdGggQXBwQXJtb3IgdG8gY29uZmlu
ZSBzb21lIG9mIG15IGRhaWx5CnNvZnR3YXJlIGEgYml0LCBhbmQgaXQgbG9va3MgcHJldHR5IHBy
b21pc2luZy4KCkhvd2V2ZXIsIHRoZXJlIGlzIG9uZSB0aGluZyBJJ2QgbGlrZSB0byBhY2hpZXZl
IGJ1dCBoYXZlbid0IHNvIGZhcjoKCkkgd291bGQgbGlrZSB0byBnZW5lcmFsbHkgZGlzYWxsb3cg
YWNjZXMgdG8gdGhlIG93bmVyJ3MgaG9tZS1kaXJlY3RvcnksCmJ1dCB0aGVuIHNlbGVjdGl2ZWx5
IGFsbG93IGNlcnRhaW4gcGF0aHMgaW4gaXQsIGZvciBleGFtcGxlIGZpcmVmb3ggbWF5CnJtd3gg
fi8ubW96aWxsYSBhbmQgc3ViZmlsZXMvZm9sZGVycyBhbmQgd3JpdGUgdGhpbmdzIGludG8gbXkK
ZG93bmxvYWRzLWZvbGRlciwgYnV0IHNob3VsZCBub3QgaGF2ZQphY2Nlc3MgdG8gYW55dGhpbmcg
ZWxzZS4KClNvIEknZCBsaWtlIHRvIGRvIHNvbWV0aGluZyBsaWtlCgogICAgZGVueSBvd25lciBA
e0hPTUV9LAogICAgb3duZXIgQHtIT01FfS8ubW96aWxsYSByd214LAogICAgIyAuLi4gb3RoZXIg
c2VsZWN0aXZlIHdoaXRlbGlzdGluZ3MKClVuZm9ydHVuYXRlbHksIHRoaXMgZG9lc24ndCB3b3Jr
LCBiZWNhdXNlIChpZiBJIHJlbWVtYmVyCnRoZSBkb2N1bWVudGF0aW9uIGNvcnJlY3RseSkgZGVu
eS1kaXJlY3RpdmVzIGFyZSBzdWJ0cmFjdGVkIGZyb20gdGhlCmFsbG93ZWQgc2V0IGFmdGVyIGV2
ZXJ5dGhpbmcgZWxzZSB3YXMgYXBwbGllZCwgc28gdGhlIGRlbnktZGlyZWN0aXZlCmFib3ZlIHdv
dWxkIGVmZmVjdGl2ZWx5IG92ZXJ3cml0ZSB0aGUgYWxsb3ctZGlyZWN0aXZlLgoKQSBzb2x1dGlv
biBpcyB0byBleHBsaWNpdGx5IGxpc3QgYW55IHBhdGhzIGJlc2lkZXMgfi8ubW96aWxsYSBmb3Ig
ZGVueSwKYnV0IHRoYXQgaXMgcXVpdGUgY3VtYmVyc29tZSBhbmQgZXJyb3ItcHJvbmUgaWYgb25l
IHdvdWxkIGxpa2UgdG8KYWNoaWV2ZSBhIHRpZ2h0IHNlY3VyaXR5IG5ldCBhcyB3ZWxsIGFzIGNy
ZWF0aW5nIGEgdmVyeSBleHRlbnNpdmUKcHJvZmlsZSBkaXJlY3RvcnksIGFzIGV2ZXJ5IGZpbGUg
YW5kIGRpcmVjdG9yeSBub3QgYWxsb3dlZCBoYXMgdG8gYmUKbGlzdGVkIGV4cGxpY2l0bHkuCgpU
aGUgb3RoZXIgaWRlYSBJIGhhZCBvZiBpbnN0ZWFkIG9mIHNwZWNpZnlpbmcgZGVueS1kaXJlY3Rp
dmVzCnNwZWNpZnlpbmcgcG9zaXRpdmUgZGlyZWN0aW9ucyBhbHNvIGZhaWxzIGFzIEkgaGF2ZSB0
byBwcm92aWRlIGF0IGxlYXN0Cm9uZSBtb2RlLCBzbyBlaXRoZXIgcndtIG9yIHggd291bGQgYmUg
YWxsb3dlZCwgd2hpY2ggaXMgYWxzbyBub3Qgd2hhdCBJCndhbnQgdG8gYWNoaWV2ZS4KCkkgaGF2
ZSB0cmllZCBkb2luZyBpdCB3aXRoIHJlZ2V4ZXMsIGJ1dCB0aGF0IGhhc24ndCBiZWVuIHN1Y2Nl
c3NmdWwKZWl0aGVyLCBidXQgaXQgbWlnaHQgYmUgdGhhdCBJIGdvdCB0aGUgc3ludGF4IHdyb25n
LgoKU28gaXMgdGhlcmUgYW55IHdheSBob3cgdG8gc29sdmUgdGhpcyBpbiBhcHBhcm1vcj8KCgpU
aGFuayB5b3UgdmVyeSBtdWNoLApKb25hcwoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBB
cm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDog
aHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
