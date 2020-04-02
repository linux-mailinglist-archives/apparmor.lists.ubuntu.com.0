Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7620919C302
	for <lists+apparmor@lfdr.de>; Thu,  2 Apr 2020 15:48:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jK0Ck-0003Zl-FO; Thu, 02 Apr 2020 13:48:22 +0000
Received: from confino.investici.org ([212.103.72.250])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <intrigeri@boum.org>) id 1jK0Ci-0003Yg-9L
 for apparmor@lists.ubuntu.com; Thu, 02 Apr 2020 13:48:20 +0000
Received: from mx1.investici.org (unknown [127.0.0.1])
 by confino.investici.org (Postfix) with ESMTP id C86442108B;
 Thu,  2 Apr 2020 13:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boum.org;
 s=stigmate; t=1585835299;
 bh=1/HABg8XEdIzXCCNVELE5D1tiKujRifhO9Ch/nhuEwo=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=qehNMm7L7NCuAJRDt4Vhel++0hIkRcyCFgpqbI086fAiz8ip/L5agR/j3ILZQvoV4
 xXmPERUfugdzYato+YIuWxe/+UoG8kYynMvFDfEt4k3EMOXGvzrAICxlwQRKyeVzau
 MH09Peb5uN1vRtGvnsVml+H2cvRI8UmNBoApkl2Y=
Received: from [212.103.72.250] (mx1.investici.org [212.103.72.250])
 (Authenticated sender: intrigeri@boum.org) by localhost (Postfix) with
 ESMTPSA id 7A81B21086; Thu,  2 Apr 2020 13:48:19 +0000 (UTC)
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id DEAD81882042;
 Thu,  2 Apr 2020 15:48:14 +0200 (CEST)
Message-Id: <87369m2e3l.fsf@manticora>
From: intrigeri <intrigeri@boum.org>
To: Alberto Mardegan <mardy@users.sourceforge.net>, apparmor@lists.ubuntu.com
In-Reply-To: <33f7799a-9184-990b-01d7-d27d61d918f7@users.sourceforge.net>
References: <33f7799a-9184-990b-01d7-d27d61d918f7@users.sourceforge.net>
Date: Thu, 02 Apr 2020 15:48:14 +0200
MIME-Version: 1.0
Subject: Re: [apparmor] Generating the profile cache on a different machine
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

SGksCgpBbGJlcnRvIE1hcmRlZ2FuICgyMDIwLTA0LTAyKToKPiBNeSBmaXJzdCBxdWVzdGlvbiBp
cyB3aGV0aGVyIHRoaXMgaXMgYWN0dWFsbHkgZG9hYmxlOiBpcyB0aGUgYmluYXJ5Cj4gZm9ybWF0
IG9mIGEgY2FjaGVkIHByb2ZpbGUgaW5kZXBlbmRlbnQgZnJvbSB0aGUgbWFjaGluZSBhcmNoaXRl
Y3R1cmUgaW4KPiB3aGljaCBpdCBpcyBnZW5lcmF0ZWQ/CgpJIGRvbid0IGtub3cgYWJvdXQgYXJj
aGl0ZWN0dXJlIHBvcnRhYmlsaXR5LgoKQXQgVGFpbHMgd2UgZG8gc2hpcCBhIGJpbmFyeSwgY29t
cGlsZWQgcG9saWN5IGluIG91ciBsaXZlIHN5c3RlbToKCiAgaHR0cHM6Ly9zYWxzYS5kZWJpYW4u
b3JnL3RhaWxzLXRlYW0vdGFpbHMvLS9ibG9iL21hc3Rlci9jb25maWcvY2hyb290X2xvY2FsLWhv
b2tzLzk5LWNhY2hlLUFwcEFybW9yLXBvbGljeQogIGh0dHBzOi8vc2Fsc2EuZGViaWFuLm9yZy90
YWlscy10ZWFtL3RhaWxzLy0vYmxvYi9tYXN0ZXIvY29uZmlnL2Nocm9vdF9sb2NhbC1ob29rcy8w
MS1jaGVjay1mb3Itb3V0ZGF0ZWQtQXBwQXJtb3ItZmVhdHVyZS1zZXQKCkV2ZXJ5dGhpbmcgSSB3
cml0ZSBiZWxvdyBzaG91bGQgYmUgY2hlY2tlZCBieSBwZW9wbGUgd2hvIGtub3cgdGhlCmludGVy
bmFscyBiZXR0ZXIgdGhhbiBtZToKCj4gQWxzbzogaXMgdGhlIGtlcm5lbCB2ZXJzaW9uIG9mIHRo
ZSBob3N0IG1hY2hpbmUgKHRoYXQgaXMsIHdoZXJlIHRoZQo+IGFwcGFybW9yX3BhcnNlciBjb21t
YW5kIGlzIGJlaW5nIHJ1bikgaW5kaWZmZXJlbnQ/Cj4gT3IgZG9lcyBpdCBoYXZlIHRvIGJlIGFw
cGFybW9yLWVuYWJsZWQ/CgpJIGRvbid0IHRoaW5rIHRoZSBrZXJuZWwgdGhhdCBjb21waWxlcyB0
aGUgcG9saWN5IG5lZWRzIHRvIGhhdmUKQXBwQXJtb3IgZW5hYmxlZC4KCj4gSSBzZWUgdGhhdCB0
aGVyZSdzIGEgYC5mZWF0dXJlc2AgZmlsZSB1bmRlciB0aGUgY2FjaGUvIGRpcmVjdG9yeSwgYnV0
Cj4gaXQncyBub3QgY2xlYXIgdG8gbWUgaWYgaXQncyByZWxhdGVkIHRvIHRoZSBhcHBhcm1vciAq
dXNlcnNwYWNlIHRvb2xzKgo+IGZlYXR1cmVzLCBvciB0byB0aGUga2VybmVsLgoKSXQncyBhYm91
dCB0aGUgc2V0IG9mIGtlcm5lbCBmZWF0dXJlcyB0aGF0IHRoZSBwYXJzZXIgd2lsbCB1c2UKaW4g
dGhlIGNvbXBpbGVkIHBvbGljeS4gRm9yIGV4YW1wbGUsIGl0IGF2b2lkcyBjb21waWxpbmcgcG9s
aWN5CnRoYXQgdXNlcyBmZWF0dXJlcyBwcmVzZW50IGluIHRoZSBrZXJuZWwgdXNlZCBhdCBjb21w
aWxlIHRpbWUsCmJ1dCBub3QgYnkgdGhlIGtlcm5lbCB1c2VkIGF0IHJ1biB0aW1lLgoKCi0tIApB
cHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0
dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2FwcGFybW9yCg==
