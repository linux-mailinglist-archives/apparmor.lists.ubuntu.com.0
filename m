Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A32473988
	for <lists+apparmor@lfdr.de>; Tue, 14 Dec 2021 01:28:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mwvg5-0001x1-HV; Tue, 14 Dec 2021 00:28:21 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mwvg2-0001wF-OG
 for apparmor@lists.ubuntu.com; Tue, 14 Dec 2021 00:28:18 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A5DBC3F051; 
 Tue, 14 Dec 2021 00:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639441698;
 bh=z7zAHEq5LDgBxBC/SxVPuhDDDVMj5RQpNaaATsV9qFg=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=mIhHTp/ZpJjxmBhiAe8is0HKRvJkBzE+qk5e2aHGpPajugOvxGEFsfL0HY5+/Ilbp
 lsAzzydv6OeFfY25sx99Uhkc21+tyWtThk7qbz5z/m1ZMcusxb16LQ9M49/cfUE2UQ
 cG3ohttPuqmUUBdD4uX2+vsXohZc5kEWeZ0/QaTsyiHA0Ue2KvlLa2sUUjlWO7qUjO
 hbyk3eg2c0r5lbVe4ArEZFW1ZNgyv1G9BA07CjGBqkqgExPuyzsAY+sifo46JCU6H+
 oJj6WuVkpCdj3QGMqxQPjLElaP4dBYn4ifBHHDEV5Asfmw+zVFKScMkzzEtiR2imQ1
 XFKHmfdnO2Ojg==
To: Casey Schaufler <casey@schaufler-ca.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
References: <068c959c-4c27-2231-021a-e8cb4e26499b.ref@schaufler-ca.com>
 <068c959c-4c27-2231-021a-e8cb4e26499b@schaufler-ca.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <80f639de-3461-17e9-b257-14a3e7b8c9cb@canonical.com>
Date: Mon, 13 Dec 2021 16:28:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <068c959c-4c27-2231-021a-e8cb4e26499b@schaufler-ca.com>
Content-Language: en-US
Subject: Re: [apparmor] Pesky '=' in subj= of audit in mainline
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

T24gMTIvMTMvMjEgOTo0OCBBTSwgQ2FzZXkgU2NoYXVmbGVyIHdyb3RlOgo+IFRoZSBVYnVudHUg
a2VybmVsIGhhcyAic3Viaj11bmNvbmZpbmVkIiBpbiBpdHMgYXVkaXQgcmVjb3Jkcy4KPiBUaGUg
TGludXMgdjUuMTYtcmM0IGtlcm5lbCBoYXMgInN1Ymo9PXVuY29uZmluZWQiLgo+IAo+IEkgc2Vl
IGluIHRoZSB1cHN0cmVhbSB3aGVyZSB0aGUgZXh0cmEgIj0iIGNvbWVzIGZyb20sIGJ1dCBJCgpJ
IGFzc3VtZSB0aGlzIGlzIGZyb20KCmxhYmVsLmM6CjE2MzQ6CWlmIChmbGFncyAmIEZMQUdfQUJT
X1JPT1QpIHsKMTYzNToJCW5zID0gcm9vdF9uczsKMTYzNjoJCWxlbiA9IHNucHJpbnRmKHN0ciwg
c2l6ZSwgIj0iKTsKMTYzNzoJCXVwZGF0ZV9mb3JfbGVuKHRvdGFsLCBsZW4sIHNpemUsIHN0cik7
CjE2Mzg6CX0gZWxzZSBpZiAoIW5zKSB7CgpJdHMgaXMgY2FsbGVkIHdoZW4gc2VjaWRzIGFyZSBi
ZWluZyB1c2VkIHdpdGhvdXQgY29udGV4dC4KCnRoaXMgd2FzIGFuIHVuZm9ydHVuYXRlIGNob2lj
ZSBtYWRlIGxvbmcgYWdvLiBJdCBpcyBzb21ldGhpbmcKSSBoYXZlIGxvb2tlZCBhdCByZW1vdmlu
ZywgYW5kIGlmIHRoaXMgaXMgcmVhcmluZyBpdHMgaGVhZAp3aXRoIHVwc3RyZWFtIGtlcm5lbHMg
d2Ugd2lsbCBoYXZlIHRvIGZpeCBpdCBhc2FwLgoKPiBkb24ndCBzZWUgaG93IHRvIGdldCB0byB0
aGF0IGNvZGUuIEkgaGF2ZSBub3QgbG9va2VkIGludG8gdGhlCj4gcGF0Y2hlcyBVYnVudHUgaXMg
dXNpbmcsIGJ1dCB0aGVyZSBtdXN0IGJlIHNvbWV0aGluZy4KPiAKCllvdSB3b24ndCBmaW5kIHRo
ZSBjb2RlIHRoYXQgY2FsbHMgdGhpcyBmb3Igc29tZSBVYnVudHUga2VybmVscwpiZWNhdXNlIHNl
Y2lkIGF1ZGl0aW5nIHdhcyByZXZlcnRlZCBzbyB0aGUgTFNNIHN0YWNraW5nIHBhdGNoZXMKY291
bGQgYmUgdXNlZCB3aXRoIGV4dGVuZGVkIG5ldHdvcmsgbWVkaWF0aW9uIChhZl91bml4KSBjb3Vs
ZCBiZQp1c2VkIHdpdGhvdXQgaXNzdWVzLgoKVGhpcyBpcyBzb21ldGhpbmcgdGhhdCBuZWVkcyB0
byBiZSBmaXhlZCBhcyB3ZWxsLgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBs
aXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6
Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
