Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 477A41581A9
	for <lists+apparmor@lfdr.de>; Mon, 10 Feb 2020 18:49:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1j1DBf-0003sE-Le; Mon, 10 Feb 2020 17:49:35 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1j1DBe-0003s5-L7
 for apparmor@lists.ubuntu.com; Mon, 10 Feb 2020 17:49:34 +0000
Received: from static-50-53-33-191.bvtn.or.frontiernet.net ([50.53.33.191]
 helo=[192.168.192.153]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>)
 id 1j1DBe-0004s5-6T; Mon, 10 Feb 2020 17:49:34 +0000
To: "mailinglisten@posteo.de" <mailinglisten@posteo.de>,
 apparmor@lists.ubuntu.com
References: <bf20d814-6389-94f9-cc46-af7266465ad8@posteo.de>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <e6baaa57-5375-8bbb-7313-651f426a1f76@canonical.com>
Date: Mon, 10 Feb 2020 09:49:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <bf20d814-6389-94f9-cc46-af7266465ad8@posteo.de>
Content-Language: en-GB
Subject: Re: [apparmor] Accessing DMI data!?
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gMi8xMC8yMCA3OjIzIEFNLCBtYWlsaW5nbGlzdGVuQHBvc3Rlby5kZSB3cm90ZToKPiBoZWxs
bywKPiAKPiBpIGp1c3QgZGlzY292ZXJlZCwgc29tZSBhcHBzIGRlc2lyZSBhY2Nlc3MgdG8gRE1J
IGRhdGEsIHByZWNpc2VseSB0bwo+IC9zeXMvZGV2aWNlcy92aXJ0dWFsL2RtaS9pZC8KPiAKPiBJ
biB0aGUgY2FzZSBvZiBhdWRpbyBzb2Z0d2FyZSBpIGNhbiB1bmRlcnN0YW5kIGl0IG1heSBuZWVk
IHRvIGtub3cgb24KPiB3aGF0IGhhcmR3YXJlIGl0IHJ1bnMuCj4gCj4gYnV0IGEgd2ViIGJyb3dz
ZXI/IHdoeSB3b3VsZCBhIHdlYmJyb3dzZXIgbmVlZCB0byBrbm93IHRoZSBiaW9zIHZlcnNpb24K
PiBvciBjb21wdXRlciBtb2RlbCBuYW1lPwo+IAo+IHRoZSBvbmUgd2hvIHJlYWxseSBiZW5lZml0
cyBmcm9tIHN1Y2ggaW5mb3JtYXRpb24gaXMgYSBwb3NzYmxlIGF0dGFja2VyLAo+IHRodXMgZm9y
IGEgd2ViIGJyb3dzZXIgaSB3b3VsZCBkZW55IGFjY2VzcyB0byB0aGlzIGRhdGEuCj4gCj4gd2hh
dCBkbyB5b3UgdGhpbms/Cj4gCgpHZW5lcmFsbHkgc3BlYWtpbmcgdGhlIHdlYiBicm93c2VyIGRv
ZXNuJ3QgbmVlZCBhY2Nlc3MgdG8gaXQuIFlvdSBjYW4gZGVueQphY2Nlc3MgdG8gaXQgYW5kIHRo
ZSB3ZWIgYnJvd3NlciBzaG91bGQgZnVuY3Rpb24uIEhvd2V2ZXIgc29tZSBmZWF0dXJlcwptYXkg
bm90IHdvcmssIGxpa2UgdGhlIGNocm9tZSBleHRlbnNpb24gQVBJIHRoYXQgd2FzIGFscmVhZHkg
cG9pbnRlZCBvdXQuCgpQcm9maWxlcyBhcmUgYWx3YXlzIHRyeWluZyB0byBiYWxhbmNlIHVzYWJp
bGl0eSBhZ2FpbnN0IGF0dGFjayBzdXJmYWNlLgpVbmZvcnR1bmF0ZWx5IHRoZSB3ZWIgYnJvd3Nl
ciBwcm9maWxlIGFyZSByZWFsbHkgbG9vc2UgYmVjYXVzZSB3ZWIgYnJvd3NlcnMKcHJlc2VudCBh
cGlzIHRvIGRvIGFsbCBraW5kcyBvZiB0aGluZyBhbmQgdGhlIGdvYWwgaXMgdG8gbm90IGJyZWFr
IHRoZQphdmVyYWdlIHVzZXIgYXMgdGhhdCBqdXN0IHJlc3VsdHMgaW4gYXBwYXJtb3IgYmVpbmcg
ZGlzYWJsZWQuCgpZb3UgY2FuIHRpZ2h0ZW4gdXAgdGhlIGJyb3dzZXIgcHJvZmlsZXMgYSBmYWly
IGJpdCBmb3IgbG9jYWwgdXNlIHdpdGgKbGl0dGxlIHRvIG5vIHBhaW4gZm9yIG1vc3QgdXNlIGNh
c2VzLgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29t
Ck1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUu
Y29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
