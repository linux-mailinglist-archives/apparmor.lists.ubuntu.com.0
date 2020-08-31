Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C74225A536
	for <lists+apparmor@lfdr.de>; Wed,  2 Sep 2020 07:54:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kDK7G-00042p-Gn; Wed, 02 Sep 2020 04:11:22 +0000
Received: from mail.actia.se ([195.67.112.82])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.ernberg@actia.se>) id 1kClCB-0001YF-KN
 for apparmor@lists.ubuntu.com; Mon, 31 Aug 2020 14:54:07 +0000
Received: from S036ANL.actianordic.se (192.168.16.117) by
 S036ANL.actianordic.se (192.168.16.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Mon, 31 Aug 2020 16:54:06 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2044.004; Mon, 31 Aug 2020 16:54:06 +0200
From: John Ernberg <john.ernberg@actia.se>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: Some apparmor profile statements are not honored for an
 application
Thread-Index: AQHWf6aT/JmlTW8cAkSEf+D5bHxTSw==
Date: Mon, 31 Aug 2020 14:54:06 +0000
Message-ID: <c4f02e0b-fcb7-492c-245e-57f3fd40c7ad@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.11.250.6]
Content-ID: <30737AEF4C424B44B13603CDA0A9D705@actia.se>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Sep 2020 04:08:53 +0000
Subject: [apparmor] Some apparmor profile statements are not honored for an
	application
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

SGksDQoNCkkgc2VlbSB0byBoYXZlIGEgYml0IG9mIGFuIG9kZCBwcm9ibGVtIGluIHRoYXQgc29t
ZSBvZiB0aGUgcHJvZmlsZSANCnN0YXRlbWVudHMgZG8gbm90IGFwcGVhciBob25vcmVkIGFuZCB0
aGUgbGlicmFyeSBsb2FkcyB0aGV5IHN0YXRlbWVudHMgDQphbGxvdyBhcmUgdGh1cyBkZW5pZWQu
IFRoZXJlIGlzIHRoZSBvbmx5IHByb2dyYW0gaW4gdGhlIHN5c3RlbSBzbyBmYXIgDQp0aGF0IGlz
IHJ1bm5pbmcgY29uZmluZWQuIFRoZSBwcm9ncmFtIGluIHF1ZXN0aW9uIG9ubHkgaGFuZGxlcyBm
aWxlcyBhbmQgDQpsaWJyYXJ5IGxvYWRzLg0KDQpJIGRvdWJsZSBjaGVja2VkIHRoZSBzeW50YXgg
b2YgdGhlIGZhaWxpbmcgcnVsZXMsIHRoZXkgYXJlIGFsaWduZWQgd2l0aCANCmZ1bmN0aW9uYWwg
cnVsZXMuIEkgcmUtZGlkIHRoZW0gYnkgY29weS1wYXN0aW5nIHRoZSBmaWxlIG5hbWUgaW4gdGhl
IA0KYXVkaXQgbWVzc2FnZSBhbmQgdGhlbiBjb3B5LXBhc3RlZCB0aGUgZmxhZ3MgZnJvbSBhIGZ1
bmN0aW9uYWwgcnVsZSwgDQpqdXN0IHRvIGJlIHN1cmUuIE5vIGNoYW5nZS4NCg0KSSBoYXZlIGNo
ZWNrZWQgdGhlIHN0YXRlbWFjaGluZSBwcm9kdWNlZCB3aXRoIGFwcGFybW9yX3BhcnNlIC1EIA0K
ZGZhLXN0YXRlcyBhbmQgaXQgbG9va3MgY29ycmVjdCwgaG93ZXZlciwgd2hlbiBJIGR1bXAgdGhl
IHN0YXRlbWFjaGluZSANCnRyYW5zaXRpb25zIGluIHRoZSBrZXJuZWwgdGhleSBhcmUgYSBsaXR0
bGUgb2ZmIGNvbXBhcmVkIHRvIHRoZSANCnN0YXRlbWFjaGluZSBnZW5lcmF0ZWQgYnkgYXBwYXJt
b3JfcGFyc2UgLUQgZGZhLXN0YXRlcyBjb21tYW5kIHdoZW4gDQpsb2dnaW5nIGluIGFhX2RmYV9t
YXRjaCBvbiB0aGUga2VybmVsIHNpZGUsIGl0IHJlYWxseSBsb29rcyBsaWtlIHRoZSANCm1hY2hp
bmUgbWFrZXMgaW5jb3JyZWN0IGxvb2t1cHMuDQoNCkkgaGF2ZSBub3RpY2VkIHRyYW5zaXRpb25z
IHRvIElEcyBvdGhlciB0aGFuIHRob3NlIGV4cGVjdGVkIHdoZW4gDQpjb21wYXJpbmcgdG8gdGhl
IGRmYS1zdGF0ZXMsIGFuZCBpdCBzZWVtcyB0byBzdGFydCBza2lwcGluZyBjaGFyYWN0ZXJzIA0K
aW4gdGhlIHBhdGhzIG9yIGdvaW5nIGJleW9uZCB0aGUgZW5kIG9mIHRoZSBwYXRoIHN0cmluZyBm
b3Igc29tZSBwYXRocy4NClRoZXNlIHBhdGhzIGFyZSB0aGUgcGF0aHMgZm9yIHdoaWNoIHN0YXRl
bWVudHMgYXJlIG5vdCBob25vcmVkLg0KDQpUcnlpbmcgdG8gYWRkIGRlYnVnIHRvIHRoZSBtYXRj
aF9jaGFyIG1hY3JvIG9uIHRoZSBrZXJuZWwgc2lkZSBzZWVtcyB0byANCmJyZWFrIHRoZSBzdGF0
ZW1hY2hpbmUgY29tcGxldGVseSwgc28gSSB3YXNuJ3QgYWJsZSB0byBkZWJ1ZyB0aGlzIHJvdXRl
IA0KZnVydGhlci4NCg0KSSdtIHJ1bm5pbmcgdmVyc2lvbiAyLjEzLjMgb2YgdGhlIHVzZXJzcGFj
ZSB0b29scywgYW5kIGtlcm5lbCA1LjQuMjQgDQoodmVuZG9yIGtlcm5lbCwgY2FuJ3QgdXBncmFk
ZSwgY2FuJ3QgdHJ5IG1haW5saW5lIGR1ZSB0byBtaXNzaW5nIHN1cHBvcnQgDQpmb3IgdGhlIFNv
QyBJJ20gdXNpbmcpLCB3aXRoIHRoZSBsYXRlc3QgNS40IHN0YWJsZSBwYXRjaGVzIGZvciBhcHBh
cm1vciANCmFwcGxpZWQgb24gdG9wLg0KDQpUaGUgcnVsZXMgaXMgY29tcGlsZWQgb24gbXkgbWFj
aGluZSAoeDg2XzY0KSBhbmQgZW1iZWRkZWQgaW4gbXkgdGFyZ2V0IA0KKGFhcmNoNjQpIHJlYWRv
bmx5IHJvb3Rmcy4gVGFyZ2V0IGhhcyBhIHJlYWRvbmx5IGZpbGVzeXN0ZW0uDQoNClRoZSBydWxl
IGlzIGxvYWRlZCBvbiB0YXJnZXQgd2l0aCB0aGUgZm9sbG93aW5nIGNvbW1hbmQ6DQogICAgIC9z
YmluL2FwcGFybW9yX3BhcnNlciAtSyAtQiAvZXRjL2FwcGFybW9yLmQvbXlwcm9ncmFtDQpXaGVy
ZSBteXByb2dyYW0gaXMgdGhlIHByb2ZpbGUgZm9yIG15IHByb2dyYW0NCg0KU28gZmFyIEkgaGF2
ZSBub3QgYmVlbiBhYmxlIHRvIGNyZWF0ZSBhIHNoYXJlYWJsZSByZXByb2R1Y2VyIHdoaWNoLCAN
CnVuZm9ydHVuYXRlbHksIG1ha2VzIHRoaXMgYWxsIHRoZSBtb3JlIGhhcmRlci4NCg0KSSB3b3Vs
ZCBhcHByZWNpYXRlIGFueSBzdWdnZXN0aW9ucyBpbiBob3cgdG8gcHJvY2VlZCBvciB3aGF0IGtp
bmQgb2YgDQppbmZvIEkgc2hvdWxkIGJlIGxvb2tpbmcgYXQgaW4gb3JkZXIgdG8gZmluZCBvdXQg
d2hhdCBpcyBnb2luZyB3cm9uZy4NCg0KVGhhbmsgeW91IGluIGFkdmFuY2UuDQoNCkJlc3QgcmVn
YXJkcyAvLyBKb2huIEVybmJlcmcNCg0KKG5vdCBzdWJzY3JpYmVkIHRvIHRoZSBtYWlsaW5nIGxp
c3QpCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpN
b2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
