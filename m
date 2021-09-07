Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFB2402399
	for <lists+apparmor@lfdr.de>; Tue,  7 Sep 2021 08:50:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mNUwC-0003CG-5a; Tue, 07 Sep 2021 06:50:32 +0000
Received: from meel.puscii.nl ([185.52.224.5])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <intrigeri@debian.org>) id 1mNUwA-0003CA-S6
 for apparmor@lists.ubuntu.com; Tue, 07 Sep 2021 06:50:30 +0000
Received: from localhost (localhost [127.0.0.1])
 by meel.puscii.nl (Postfix) with ESMTP id 841A2283566
 for <apparmor@lists.ubuntu.com>; Tue,  7 Sep 2021 06:49:14 +0000 (UTC)
Received: from meel.puscii.nl ([127.0.0.1])
 by localhost (meel.puscii.nl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HttbjOdZSZ-P for <apparmor@lists.ubuntu.com>;
 Tue,  7 Sep 2021 06:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by meel.puscii.nl (Postfix) with ESMTP id 3083128372A
 for <apparmor@lists.ubuntu.com>; Tue,  7 Sep 2021 06:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at meel.puscii.nl
Received: from meel.puscii.nl ([127.0.0.1])
 by localhost (meel.puscii.nl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TA6VUEB1t7XS for <apparmor@lists.ubuntu.com>;
 Tue,  7 Sep 2021 06:49:14 +0000 (UTC)
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id CB4711881D44
 for <apparmor@lists.ubuntu.com>; Tue,  7 Sep 2021 08:50:27 +0200 (CEST)
Message-Id: <87pmtkop58.fsf@manticora.bergerie.taz>
From: intrigeri <intrigeri@debian.org>
To: apparmor@lists.ubuntu.com
Date: Tue, 07 Sep 2021 08:50:27 +0200
Subject: [apparmor] Deprecating the Perl bindings?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

SGksCgpBcyBmYXIgYXMgSSBjYW4gdGVsbCwgaW4gdGhlIHVwc3RyZWFtIGNvZGUgYmFzZSwgYWEt
bm90aWZ5IHdhcyB0aGUKb25seSB0aGluZyB0aGF0IGRlcGVuZGVkIG9uIHRoZSBQZXJsIGJpbmRp
bmdzIHRvIGxpYmFwcGFybW9yLgpJdCdzIGJlZW4gcG9ydGVkIHRvIFB5dGhvbiBzbyB0aGF0J3Mg
bm90IHRoZSBjYXNlIGFueW1vcmUuCgpXaXRoIG15IERlYmlhbiBoYXQgb24sIEkgY2FuIHNheSB0
aGF0IHNoaXBwaW5nIHRoZSBQZXJsIGJpbmRpbmdzCihsaWJhcHBhcm1vci1wZXJsKSBtYWtlcyBz
b21lIHN0dWZmIG1vcmUgY29tcGxpY2F0ZWQsIGZvciBleGFtcGxlIGZvcgphZGRpbmcgY3Jvc3Mt
YnVpbGRpbmcgc3VwcG9ydC4gU28gSSdtIGNvbnNpZGVyaW5nIGRyb3BwaW5nIHRoZW06Cmh0dHBz
Oi8vYnVncy5kZWJpYW4ub3JnLzk5MzU2NQoKV2hhdCB3b3VsZCBiZSB0aGUgZHJhd2JhY2tzIG9m
IGRyb3BwaW5nIHRoZSBQZXJsIGJpbmRpbmdzIHVwc3RyZWFtPwoKQXJlIHdlIGF3YXJlIG9mIGNv
ZGUgdGhhdCB1c2VzIHRoZW0/IEluIG9wZW5TVVNFIHRvb2xpbmcsIHBlcmhhcHM/CgpBcmUgd2Ug
Y29uZmlkZW50IHRoZXknbGwga2VlcCB3b3JraW5nLCBldmVuIHRob3VnaCB3ZSBkb24ndCBhY3Rp
dmVseQp1c2UgdGhlbSB1cHN0cmVhbSBhbnltb3JlPwoKSWYgd2Ugd2FudCB0byBkcm9wIHRoZW0g
dXBzdHJlYW0sIHdoYXQgd291bGQgYmUgYSBzdWl0YWJsZSBkZXByZWNhdGlvbgpwcm9jZXNzIGFu
ZCB0aW1lbGluZT8gV291bGQgaXQgYmUgc3VmZmljaWVudCB0byBhbm5vdW5jZSB0aGlzIG9uIHRo
aXMKbWFpbGluZyBsaXN0IGFuZCBkcm9wIHRoZW0gaW4gdGhlIG5leHQgbWFqb3IgcmVsZWFzZT8K
CkNoZWVycyEKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1
LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1
bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
