Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D13D8459
	for <lists+apparmor@lfdr.de>; Wed, 28 Jul 2021 01:58:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1m8Wxi-0005Jk-KY; Tue, 27 Jul 2021 23:58:14 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1m8Wxe-0005Je-Ct
 for apparmor@lists.ubuntu.com; Tue, 27 Jul 2021 23:58:10 +0000
Received: from [192.168.192.153] (unknown [50.53.57.186])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id C67233F231; 
 Tue, 27 Jul 2021 23:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627430290;
 bh=XBUdJhSpcp+TDgf5TG6HKjJ3vX8vZUToCV4fepVcq8M=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=i9VnrJ30SzMicMUeZSiRpU8n7s7tCzpJ9bWDIgisGH6umEua71OAX+VHh9vQsBOOs
 khMaR/VZkDUKq4qBKe46HIzZ+GwrVRMW4yvUt6dcXpKUZguYQyt9RXZInT+cnlTfNb
 0auxaQv9zBXW6RVdDPWNZqfAJNkLR1xNYHVv6hn7udiyKdwn6KQ6ABut0i6eepFsWp
 zA9t1PUEwejsr+7+iYVLk3DJXQcZcjFW2O4bS4rCiIFUU7jPp0WFrSsfJ9roibrP9t
 C9o7KjVIqCQJinF9VccRt8wscurX0fvUPi9NPLx/WgewfQgjOtflWK2/3wdYk6hKBZ
 IYTjpUEja47YQ==
To: Seth Arnold <seth.arnold@canonical.com>, apparmor@lists.ubuntu.com
References: <20210727215134.514951-1-georgia.garcia@canonical.com>
 <20210727234519.GA2096848@millbarge>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <2b6ad0f8-6fae-5828-31c4-cd3348795942@canonical.com>
Date: Tue, 27 Jul 2021 16:58:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727234519.GA2096848@millbarge>
Content-Language: en-US
Subject: Re: [apparmor] [PATCH] apparmor: enable raw text policy
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

T24gNy8yNy8yMSA0OjQ1IFBNLCBTZXRoIEFybm9sZCB3cm90ZToKPiBPbiBUdWUsIEp1bCAyNywg
MjAyMSBhdCAwNjo1MTozNFBNIC0wMzAwLCBHZW9yZ2lhIEdhcmNpYSB3cm90ZToKPj4gKwlpZiAo
YWFfZ19yYXdfdGV4dCkgewo+PiArCQlkZW50ID0gYWFmc19jcmVhdGVfZmlsZSgicmF3X3RleHQi
LCBTX0lGUkVHIHwgMDQ0NCwgZGlyLAo+PiArCQkJCQlyYXdkYXRhLCAmcmF3dGV4dF9mb3BzKTsK
PiAKPiBDb29sIDopIFRoZSBvbmx5IHRoaW5nIHRoYXQgc3Rvb2Qgb3V0IHRvIG1lIGlzIHRoZSBw
ZXJtaXNzaW9uOiBzb21lIHBlb3BsZQo+IGxpa2UgdG8gc3RvcmUgdGhlaXIgcG9saWN5IGluIC9l
dGMvYXBwYXJtb3IuZC8gd2l0aCByZXN0cmljdGl2ZSBtb2RlcyBmb3IKPiB3aGF0ZXZlciByZWFz
b24sIGFuZCB0aGlzIG1heSBiZSBtb3JlIG9wZW4gdGhhbiB0aGV5J2QgbGlrZS4gMDQwMCBtaWdo
dCBiZQo+IGEgYmV0dGVyIGZpdCBmb3Igc29tZS4KPiAKCmhybW1tIGFjdHVhbGx5IHdlIHNob3Vs
ZCBiZSB1c2luZyB0aGUgcG9saWN5IGFkbWluIGNoZWNrIGluc3RlYWQuIDA0MDAKZG9lc24ndCB2
aXJ0dWFsaXplIHRvIHBvbGljeSBuYW1lc3BhY2VzIGV0Yy4gSW5zdGVhZCB3ZSBuZWVkIHRvIGJl
IHdpZGUKb3BlbiBhbmQgdGhlbiBkbyBvdXIgb3duIGFkZGl0aW9uYWwgaW50ZXJuYWwgcGVybWlz
c2lvbiBjaGVjay4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1
bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMu
dWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
