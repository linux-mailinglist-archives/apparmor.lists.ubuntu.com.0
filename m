Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D622224137C
	for <lists+apparmor@lfdr.de>; Tue, 11 Aug 2020 01:00:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k5Glk-0003vu-70; Mon, 10 Aug 2020 22:59:52 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1k5Gli-0003vo-7K
 for apparmor@lists.ubuntu.com; Mon, 10 Aug 2020 22:59:50 +0000
Received: from mephala (unknown [IPv6:2001:16b8:307e:9500:f5e6:5e27:99da:f5b7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id 9E9DB240964
 for <apparmor@lists.ubuntu.com>; Tue, 11 Aug 2020 00:59:49 +0200 (CEST)
Date: Tue, 11 Aug 2020 00:59:48 +0200
From: Jonas =?UTF-8?B?R3Jvw59l?= Sundrup <jgs-apparmor@letopolis.de>
To: <apparmor@lists.ubuntu.com>
Message-ID: <20200811005948.6aa1a0c1@mephala>
X-Pect: The Spanish Inquisition
MIME-Version: 1.0
Subject: [apparmor] restricting file access to processes "within" profile
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

SGksCgpJJ20gdHJ5aW5nIHRvIHJlc3RyaWN0IHRoZSBhY2Nlc3MgdG8gL2Rldi9zaG0uIFNvbWUg
YXBwbGljYXRpb25zIGRvCnJlcXVpcmUgaXQsIGFtb25nIHRoZXNlIG11bHRpcHJvY2Vzcy1hcHBs
aWNhdGlvbnMuIEkgZG8gc3VzcGVjdAooYWx0aG91Z2ggSSBoYXZlIG5vdCB5ZXQgZXhwbGljaXRs
eSB0ZXN0ZWQgaXQpLCB0aGF0IGFsbCBwcm9jZXNzZXMKbWlnaHQgbmVlZCB0byByZWFkIGFuZCBw
b3RlbnRpYWxseSB3cml0ZSBmaWxlcyB0aGVyZSB0aGF0IGhhdmUgYmVlbgpjcmVhdGVkIGJ5IGFu
b3RoZXIgcHJvY2VzcyBvZiB0aGVpciB0cmVlLiBIZW5jZSwgSSdtIHRoaW5raW5nIGFib3V0IGhv
dwp0byBiZXN0IHJlc3RyaWN0IGFjY2VzcyB0aGVyZSBhcyB3ZWxsIGFuZCB0aGUgbmF0dXJhbCB0
aG91Z2ggd291bGQgYmUKYWxvbmcgdGhlIGxpbmVzIG9mIGFwcGFybW9yLXByb2ZpbGVzLCBzbyB0
aGUgb3JpZ2luYWwgYmluYXJ5IGFuZApldmVyeXRoaW5nIGl0IHNwYXducy4gRG9lcyBhcHBhcm1v
ciBoYXZlIHNvbWV0aGluZyBpbiB0aGlzIHJlZ2FyZD8KClRoZSBzdHJpY3Rlc3Qgb3B0aW9uIEkg
Y3VycmVudGx5IHNlZSBpcwoKICAgIG93bmVyIC9kZXYvc2htLyoqIHJ3CgpidXQgdGhhdCB3b3Vs
ZCBub3QgaGF2ZSB0d28gcHJvY2Vzc2VzIHVuZGVyIHRoZSBzYW1lIHVzZXIgYnV0IGluCmRpZmZl
cmVudCBwcm9maWxlcyBzdGlsbCBub3Qgc2VwYXJhdGVkLgoKR2l2ZW4gdGhhdCBBcHBBcm1vciBy
ZXZvbHZlcyBhcm91bmQgZmlsZXBhdGhzLCBpdCBmZWVscyB0byBtZSBsaWtlIGl0Cm1pZ2h0IGFj
dHVhbGx5IG5vdCBiZSBkZXNpZ25lZCBmb3IgdGhpcyBwYXJ0aWN1bGFyIHVzZWNhc2UsIGJ1dCBh
cyBteQpleHBlcmllbmNlIHdpdGggQXBwQXJtb3IgaXMgc3RpbGwgbGltaXRlZCBtYXliZSBJJ20g
bHVja3kgYW5kIHRoZXJlIGlzCnNvbWV0aGluZyBJIGhhdmVuJ3Qgc2VlbiB5ZXQgdGhhdCBhbGxv
d3MgZXZlbiB0aGlzIGtpbmQgb2YgY29udGFpbm1lbnQuClRoaXMgd291bGQgY2VydGFpbmx5IGFs
c28gYmUgdXNlZnVsIGZvciB0aGluZ3MgbGlrZSAvdG1wIGlmIG9uZSB3ZXJlIHRvCm5haWwgZG93
biB0aGUgcHJvY2Vzc2VzIGluIHF1ZXN0aW9uLgoKClRoYW5rcyBpbiBhZHZhbmNlLApKb25hcwoK
LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
