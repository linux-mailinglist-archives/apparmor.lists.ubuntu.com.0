Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 30281304BC
	for <lists+apparmor@lfdr.de>; Fri, 31 May 2019 00:23:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hWTSg-0004IK-5X; Thu, 30 May 2019 22:23:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <smcv@collabora.com>) id 1hWQLs-00016d-K7
 for apparmor@lists.ubuntu.com; Thu, 30 May 2019 19:04:36 +0000
Received: from localhost (unknown [IPv6:2a00:5f00:102:0:3aba:f8ff:fe58:9ca1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested) (Authenticated sender: smcv)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 62E79263AE2
 for <apparmor@lists.ubuntu.com>; Thu, 30 May 2019 20:04:36 +0100 (BST)
Date: Thu, 30 May 2019 20:04:34 +0100
From: Simon McVittie <smcv@collabora.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20190530190434.GA30663@horizon>
References: <7979059d-044a-3f1a-83f9-8254a8a51daa@zestysoft.com>
 <20190525001053.GB6058@hunt>
 <734c73ce-1e25-cc3a-ed3d-7edae3ee94fc@canonical.com>
 <77776c98-473e-eb98-2fe6-c29a1bfa7e28@zestysoft.com>
 <859df47c-6c0d-0be4-4590-6b05ce0fd0a0@zestysoft.com>
 <7ec74901-7e32-b279-01b6-fddf38b7d1d1@zestysoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ec74901-7e32-b279-01b6-fddf38b7d1d1@zestysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 30 May 2019 22:23:49 +0000
Subject: Re: [apparmor] Attempting FullSystemPolicy with Ubuntu 18.04.2
	LTS...
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

T24gVGh1LCAzMCBNYXkgMjAxOSBhdCAxMTo0NzozNSAtMDcwMCwgSWFuIHdyb3RlOgo+IEkgZGlk
IG5vdGljZSB0aGlzIGluIC92YXIvbG9nL3N5c2xvZzoKPiAKPiAgICAgTWF5IDMwIDEwOjQ2OjUx
IDE1NDYtdy1kZXYgZGJ1cy1kYWVtb25bOTQ5Nl06IFtzeXN0ZW1dIEFjdGl2YXRpbmcgc3lzdGVt
ZAo+ICAgICB0byBoYW5kLW9mZjogc2VydmljZSBuYW1lPSdvcmcuZnJlZWRlc2t0b3AuaG9zdG5h
bWUxJyB1bml0PQo+ICAgICAnZGJ1cy1vcmcuZnJlZWRlc2t0b3AuaG9zdG5hbWUxLnNlcnZpY2Un
IHJlcXVlc3RlZCBieSAnOjEuMjEnICh1aWQ9MCBwaWQ9Cj4gICAgIDEwMDU4IGNvbW09Ii91c3Iv
c2Jpbi9OZXR3b3JrTWFuYWdlciAtLW5vLWRhZW1vbiAiIGxhYmVsPQo+ICAgICAidXNyLnNiaW4u
TmV0d29ya01hbmFnZXIgKGNvbXBsYWluKSIKClRoaXMgZG9lcyBub3QsIGluIGl0c2VsZiwgaW5k
aWNhdGUgYSBidWcuIFdoZW5ldmVyIGRidXMtZGFlbW9uIGxvZ3MgYW4KImludGVyZXN0aW5nIiBh
Y3Rpb24gbGlrZSBzZXJ2aWNlIGFjdGl2YXRpb24sIGl0IGxvZ3MgYWxsIHRoZSBpbmZvcm1hdGlv
bgppdCBrbm93cyBhYm91dCB0aGUgcmVxdWVzdGluZyBwcm9jZXNzLCB3aGljaCBvbiBBcHBBcm1v
ciBzeXN0ZW1zIGluY2x1ZGVzCnRoZSBBcHBBcm1vciBsYWJlbC4KCihjb21wbGFpbikgbWVhbnMg
dGhlIHVzci5zYmluLk5ldHdvcmtNYW5hZ2VyIHByb2ZpbGUgaXMgbG9hZGVkIGluCiJjb21wbGFp
biIgbW9kZSwgbWVhbmluZyB0aGF0IGlmIE5NIGRvZXMgYW55dGhpbmcgdGhhdCB3b3VsZCB2aW9s
YXRlIGl0cwpBcHBBcm1vciBwb2xpY3ksIGl0IHdpbGwgYmUgbG9nZ2VkIGFzIEFMTE9XRUQgYW5k
IGFsbG93ZWQgdG8gaGFwcGVuLAppbnN0ZWFkIG9mIGJlaW5nIGRlbmllZC4gSWYgdGhpcyBpcyBu
b3Qgd2hhdCB5b3Ugd2FudGVkLCBwbGVhc2UgbG9vawptb3JlIGNsb3NlbHkgYXQgeW91ciBBcHBB
cm1vciBwb2xpY2llcy4KCiAgICBzbWN2CgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFy
bW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBo
dHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=
