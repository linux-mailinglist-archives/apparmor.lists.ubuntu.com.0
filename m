Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6AD482DD2
	for <lists+apparmor@lfdr.de>; Mon,  3 Jan 2022 05:49:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1n4FHb-0006v7-Us; Mon, 03 Jan 2022 04:49:19 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1n4FHa-0006v0-BF
 for apparmor@lists.ubuntu.com; Mon, 03 Jan 2022 04:49:18 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 7B20D3F132; 
 Mon,  3 Jan 2022 04:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1641185357;
 bh=2vLUpWaJsAtDpNJMPzXrgvJXgBHaPTzcx3LM+4t8W+E=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=OSvNHUu6bLShefn9pbO39PyxSEgOgVzkkEKVIGP2E+rEWcVH1FF9yeVoE+V9RddLt
 yOAjdm7SyRlPB855Eg8pKeBkgBVPIV5nhl6SZFkjcbmfl4asYGbO6vqJtacNgSAdTf
 7p27q8HwHhQcN5Yzmx37rl52IQaCNpizZwh8oEFUcDnecSygYQVKiuIzK2cMYNFFFz
 3nFastVqypQ4HQQYJviyVeMyGEcMAEt2y3dCKu/jFlRGwD/IPJ9j9QrQzn7Lhu/x4Q
 qR1RA1cRXYzq8hHHLxVHSyJSGsTX1q70h4+jn9JvITTGb5qapwvFzfWbnsY6vuJrEJ
 boM78Fg1A6nNQ==
To: Sina Kashipazha <s.kashipazha@protonmail.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
References: <6IXBC37fMQNZQNToEP-0OJhmnGhUB6wRYPj0f2999S5IfLYBzOZ5mcoYoPhcfLpSzu_NmNznwSb595TFITxi5UbVxk37391PqV4wKlKVxIM=@protonmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <a7299be5-f08a-a39d-63da-4e1c3c9e8a58@canonical.com>
Date: Sun, 2 Jan 2022 20:49:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6IXBC37fMQNZQNToEP-0OJhmnGhUB6wRYPj0f2999S5IfLYBzOZ5mcoYoPhcfLpSzu_NmNznwSb595TFITxi5UbVxk37391PqV4wKlKVxIM=@protonmail.com>
Content-Language: en-US
Subject: Re: [apparmor] Disable apparmor without restart
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

T24gMTIvMjgvMjEgMjowMCBBTSwgU2luYSBLYXNoaXBhemhhIHdyb3RlOgo+IEhleSB0aGVyZSwK
PiAKPiBJIGhhdmUgdHdvIGhvc3RzIGluIG15IHNldHVwLCBvbmUgb2YgdGhlbSB1c2VzIEFwcEFy
bW9yIChoMSksIGFuZCBhbm90aGVyIG9uZSBkb2Vzbid0IGhhdmUgaXQgKGgyKS4gSSB3YW50IHRv
IHVzZSB2aXJzaCB0byBsaXZlIG1pZ3JhdGUgbXkgVk1zIGZyb20gaDEgdG8gaDIsIGJ1dCBJJ20g
bm90IGFibGUgdG8gZG8gdGhhdCBiZWNhdXNlIHRoZSBoMiBob3N0IGRvZXNuJ3QgaGF2ZSB0aGUg
QXBwQXJtb3IgcG9saWN5Lgo+IAo+IEkgd2FzIHdvbmRlcmluZywgaXMgaXQgcG9zc2libGUgdG8g
ZWRpdCB0aGUgWE1MIGNvbmZpZ3VyYXRpb24gZmlsZSBvZiB0aGUgVk0gYW5kIGRpc2FibGUgQXBw
QXJtb3Igd2l0aG91dCByZXN0YXJ0aW5nIHRoZSBWTXM/Cj4gCgpBRkFJSyBubywgYnV0IHlvdSBj
YW4gbWFudWFsbHkgcmVtb3ZlIHRoZSBhcHBhcm1vciBwcm90ZWN0aW9uIG9uIHRoZSBWTSBieSB1
bmxvYWRpbmcgdGhlIHByb2ZpbGVzLgoKc3VkbyBhYS10ZWFyZG93bgoKd2lsbCByZW1vdmUgYXBw
YXJtb3IgcHJvdGVjdGlvbnMgZnJvbSB0aGUgd2hvbGUgc3lzdGVtLgoKaWYgeW91IHdhbnQgdG8g
YmUgbW9yZSBzZWxlY3RpdmUgeW91IGNhbiBqdXN0IHVubG9hZCB0aGUgdGhlIFZNcyBwcm9maWxl
cy4gVXNpbmcgYXBwYXJtb3JfcGFyc2VyIC1SCgo+IFNvbWUgZXh0cmEgaW5mbzoKPiAKPiByb290
QGgxKGFwcGFybW9yIGVuYWJsZWQpOn4jIHZpcnNoIGxpc3QKPiDCoElkIMKgIMKgTmFtZSDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBTdGF0ZQo+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiDCoDcgwqAgwqAgc29tZS1W
TSDCoCAgICAgICDCoCDCoCDCoCDCoCDCoCDCoCAgwqAgcnVubmluZwo+IAo+IHJvb3RAaDEoYXBw
YXJtb3IgZW5hYmxlZCk6fiMgdmlyc2ggZHVtcHhtbCA3wqB8IGdyZXAgYXBwYXJtb3IKPiDCoCA8
c2VjbGFiZWwgdHlwZT0nZHluYW1pYydtb2RlbD0nYXBwYXJtb3IncmVsYWJlbD0neWVzJwo+IAo+
IHJvb3RAaDEoYXBwYXJtb3IgZW5hYmxlZCk6fiMgdmlyc2ggY2FwYWJpbGl0aWVzIHwgZ3JlcCAt
QTEgc2VjbW9kZWwKPiDCoCDCoCA8c2VjbW9kZWw+Cj4gwqAgwqAgwqAgPG1vZGVsPmFwcGFybW9y
PC9tb2RlbD4KPiDCoCDCoCA8L3NlY21vZGVsPgo+IMKgIMKgIDxzZWNtb2RlbD4KPiDCoCDCoCDC
oCA8bW9kZWw+ZGFjPC9tb2RlbD4KPiDCoCDCoCA8L3NlY21vZGVsPgo+IMKgIDwvaG9zdD4KPiAK
PiAKPiAKPiByb290QGgyKGFwcGFybW9yIGRpc2FibGVkKTp+IyB2aXJzaCBjYXBhYmlsaXRpZXMg
fCBncmVwIC1BMSBzZWNtb2RlbAo+IMKgIMKgIDxzZWNtb2RlbD4KPiDCoCDCoCDCoCA8bW9kZWw+
bm9uZTwvbW9kZWw+Cj4gwqAgwqAgPC9zZWNtb2RlbD4KPiDCoCDCoCA8c2VjbW9kZWw+Cj4gwqAg
wqAgwqAgPG1vZGVsPmRhYzwvbW9kZWw+Cj4gwqAgwqAgPC9zZWNtb2RlbD4KPiDCoCA8L2hvc3Q+
Cj4gCj4gCj4gCj4gCj4gS2luZCByZWdhcmRzLAo+IFNpbmEKPiAKCgotLSAKQXBwQXJtb3IgbWFp
bGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVu
c3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9h
cHBhcm1vcgo=
