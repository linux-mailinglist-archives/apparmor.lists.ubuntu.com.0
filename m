Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC3A473B13
	for <lists+apparmor@lfdr.de>; Tue, 14 Dec 2021 03:55:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mwxyW-0002ju-1O; Tue, 14 Dec 2021 02:55:32 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mwxyT-0002jd-Vh
 for apparmor@lists.ubuntu.com; Tue, 14 Dec 2021 02:55:29 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 55AB03F1DC; 
 Tue, 14 Dec 2021 02:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639450529;
 bh=yp0sfryW3PyAjy+Y7ihgAG/qTTK147SZ18WzIUCwR3Q=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=vJzsJk/jX1jmUECmvfXuEbQE8L/eLRWSnxZJe9KlRnUdrSeTwAmMML07pgERklZA4
 GuW+KA0ZVoqvPRtY5aE1crpywGtGY0SiTwl720Gt8uA1lcHz4cTiroOcA1tgUyG4tW
 p25ed/AL0e/rHXtcJtny31QoegMleCRO/We38SVjz0ykrQPq9XkVXbLPt2NZL5JzLl
 EO82yn8NByGvQ8uHmjjJf9LjwWv+OQebbcra3Ru+SBnkOa0r8A5wWwn0BfiEq7zw45
 R2w3KaY90upTeIm3QBO9H5Gvl7NR5DtviIqgUr3BcHV6OociE+7HBYCeqv7zEYr0jt
 KiUIfwJwvPOFA==
To: Casey Schaufler <casey@schaufler-ca.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
References: <068c959c-4c27-2231-021a-e8cb4e26499b.ref@schaufler-ca.com>
 <068c959c-4c27-2231-021a-e8cb4e26499b@schaufler-ca.com>
 <80f639de-3461-17e9-b257-14a3e7b8c9cb@canonical.com>
 <b3e5c115-8c67-0e9a-be87-5a10e816ceec@schaufler-ca.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <ba30cd68-d649-107b-144b-0575e8b07e24@canonical.com>
Date: Mon, 13 Dec 2021 18:55:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b3e5c115-8c67-0e9a-be87-5a10e816ceec@schaufler-ca.com>
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

T24gMTIvMTMvMjEgNDo1OCBQTSwgQ2FzZXkgU2NoYXVmbGVyIHdyb3RlOgo+IE9uIDEyLzEzLzIw
MjEgNDoyOCBQTSwgSm9obiBKb2hhbnNlbiB3cm90ZToKPj4gT24gMTIvMTMvMjEgOTo0OCBBTSwg
Q2FzZXkgU2NoYXVmbGVyIHdyb3RlOgo+Pj4gVGhlIFVidW50dSBrZXJuZWwgaGFzICJzdWJqPXVu
Y29uZmluZWQiIGluIGl0cyBhdWRpdCByZWNvcmRzLgo+Pj4gVGhlIExpbnVzIHY1LjE2LXJjNCBr
ZXJuZWwgaGFzICJzdWJqPT11bmNvbmZpbmVkIi4KPj4+Cj4+PiBJIHNlZSBpbiB0aGUgdXBzdHJl
YW0gd2hlcmUgdGhlIGV4dHJhICI9IiBjb21lcyBmcm9tLCBidXQgSQo+PiBJIGFzc3VtZSB0aGlz
IGlzIGZyb20KPj4KPj4gbGFiZWwuYzoKPj4gMTYzNDrCoMKgwqAgaWYgKGZsYWdzICYgRkxBR19B
QlNfUk9PVCkgewo+PiAxNjM1OsKgwqDCoMKgwqDCoMKgIG5zID0gcm9vdF9uczsKPj4gMTYzNjrC
oMKgwqDCoMKgwqDCoCBsZW4gPSBzbnByaW50ZihzdHIsIHNpemUsICI9Iik7Cj4+IDE2Mzc6wqDC
oMKgwqDCoMKgwqAgdXBkYXRlX2Zvcl9sZW4odG90YWwsIGxlbiwgc2l6ZSwgc3RyKTsKPj4gMTYz
ODrCoMKgwqAgfSBlbHNlIGlmICghbnMpIHsKPj4KPj4gSXRzIGlzIGNhbGxlZCB3aGVuIHNlY2lk
cyBhcmUgYmVpbmcgdXNlZCB3aXRob3V0IGNvbnRleHQuCj4+Cj4+IHRoaXMgd2FzIGFuIHVuZm9y
dHVuYXRlIGNob2ljZSBtYWRlIGxvbmcgYWdvLiBJdCBpcyBzb21ldGhpbmcKPj4gSSBoYXZlIGxv
b2tlZCBhdCByZW1vdmluZywgYW5kIGlmIHRoaXMgaXMgcmVhcmluZyBpdHMgaGVhZAo+PiB3aXRo
IHVwc3RyZWFtIGtlcm5lbHMgd2Ugd2lsbCBoYXZlIHRvIGZpeCBpdCBhc2FwLgo+IAo+IEkgc2Vl
IGl0IG9uIGFuIFVidW50dSBzeXN0ZW0gd2l0aCA1LjE2LXJjNC4KPiAKPiB0eXBlPVVTRVJfTE9H
SU4gbXNnPWF1ZGl0KDE2Mzk0NDMzNjUuMjMzOjE2MCk6IHBpZD0xNjMzIHVpZD0wIGF1aWQ9MTAw
MAo+IHNlcz0zIHN1Ymo9PXVuY29uZmluZWQgbXNnPSdvcD1sb2dpbiBpZD0xMDAwIGV4ZT0iL3Vz
ci9zYmluL3NzaGQiCj4gaG9zdG5hbWU9MTkyLjE2OC4xMjIuMSBhZGRyPTE5Mi4xNjguMTIyLjEg
dGVybWluYWw9L2Rldi9wdHMvMSByZXM9c3VjY2VzcycKPiAKCnllYWggdGhlIG5ld2VyIFVidW50
dSBrZXJuZWxzIHNob3VsZCBoaXQuIEkgd2lsbCBzZWUgd2hhdCBJIGNhbiBkbwoKPiAKPj4KPj4+
IGRvbid0IHNlZSBob3cgdG8gZ2V0IHRvIHRoYXQgY29kZS4gSSBoYXZlIG5vdCBsb29rZWQgaW50
byB0aGUKPj4+IHBhdGNoZXMgVWJ1bnR1IGlzIHVzaW5nLCBidXQgdGhlcmUgbXVzdCBiZSBzb21l
dGhpbmcuCj4+Pgo+PiBZb3Ugd29uJ3QgZmluZCB0aGUgY29kZSB0aGF0IGNhbGxzIHRoaXMgZm9y
IHNvbWUgVWJ1bnR1IGtlcm5lbHMKPj4gYmVjYXVzZSBzZWNpZCBhdWRpdGluZyB3YXMgcmV2ZXJ0
ZWQgc28gdGhlIExTTSBzdGFja2luZyBwYXRjaGVzCj4+IGNvdWxkIGJlIHVzZWQgd2l0aCBleHRl
bmRlZCBuZXR3b3JrIG1lZGlhdGlvbiAoYWZfdW5peCkgY291bGQgYmUKPj4gdXNlZCB3aXRob3V0
IGlzc3Vlcy4KPj4KPj4gVGhpcyBpcyBzb21ldGhpbmcgdGhhdCBuZWVkcyB0byBiZSBmaXhlZCBh
cyB3ZWxsLgoKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1
LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1
bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
