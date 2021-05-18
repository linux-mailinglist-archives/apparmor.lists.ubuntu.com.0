Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C0031387F2A
	for <lists+apparmor@lfdr.de>; Tue, 18 May 2021 20:01:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lj423-00049e-OA; Tue, 18 May 2021 18:01:27 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1lj422-00049Y-4s
 for apparmor@lists.ubuntu.com; Tue, 18 May 2021 18:01:26 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id A5BDC240026
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 20:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1621360885; bh=cz4F62Q85IoeLZ0JTU9hlqC53Dd2OBlpMFPBZChZ+p8=;
 h=Subject:To:From:Date:From;
 b=jld0f80VA24V90VptJAnRhfNGJogpbuHTuUTeN31U3NnOoxriXZX0ZVkAX+Y1JwBh
 WxSahRgqB0bQkQ1TpUD+ep/54FBxH+Vkqu3hH/LJ9/lx7F7I64z5W0y6/l5s/VNVBV
 SBPcF5hwZnObuVK3uFmzK+OtbvM4hzHa2AS1tYucG+vg2A2Odq9BGW0akNxPFrQKyQ
 k8JlshhmjGEWL3JzyHJa0gc4+cyE+jU9HHVe3BOFvD+8WwK+WbKHJ/uUV5G8EZ44Yu
 a5vsqwQxkkGmjP+UNWNADE3WC9zUB1FtNg8+ziCA6fiwBiRFlY3CeBC7nfwA5ta49r
 i/o0dS/TfGAkg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Fl3j11dbqz9rxL
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 20:01:25 +0200 (CEST)
To: apparmor@lists.ubuntu.com
References: <3cda1806-59e6-b229-5504-60e237245385@posteo.de>
 <f94c4f1b-a498-489a-712d-ba26f1779edc@canonical.com>
From: Malte Gell <mailinglisten@posteo.de>
Message-ID: <ba462e72-bc4d-093d-6db7-96d29b64403b@mailinglisten.posteo.de>
Date: Tue, 18 May 2021 18:01:24 +0000
MIME-Version: 1.0
In-Reply-To: <f94c4f1b-a498-489a-712d-ba26f1779edc@canonical.com>
Content-Language: de-DE
Subject: Re: [apparmor] confining the clipboard?
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

QW0gMTguMDUuMjEgdW0gMTk6NTAgc2NocmllYiBKb2huIEpvaGFuc2VuOgo+IE9uIDUvMTgvMjEg
MTA6NDYgQU0sIG1haWxpbmdsaXN0ZW5AcG9zdGVvLmRlIHdyb3RlOgo+PiBCeSB0aGUgd2F5LCBp
cyB0aGVyZSBhIHJ1bGUgaW4gQUEgdG8gY29uZmluZSBhY2Nlc3MgdG8gdGhlIGNsaXBib2FyZD8K
Pj4gRGlkbsK0dCBmaW5kIHNvbWV0aGluZyBpbiB0aGEgZGlyZWN0aW9uIGluIHRoZSBtYW4gcGFn
ZXMuLi4KPj4KPj4gSSBqdXN0IGxlYXJudCBzb21lb25lIGxvc3QgaGlzIG1vbmV5LCBhZnRlciBj
b3B5aW5nIGhpcyB3YWxsZXQgaW50byB0aGUKPj4gY2xpcGJvYXJkIGFuZCBzb21lIGV2aWwgd2Vi
IHNpdGUgc3RlYWxpbmcgaXQuLi4uIGNyZWF0aXZpdHkgcmVhbGx5IGhhcwo+PiBubyBsaW1pdHMg
Oy0pCj4+Cgo+IG5vIGFwcGFybW9yIGRvZXMgbm90IGNvbnRyb2wgYWNjZXNzIHRvIHRoZSBjbGlw
Ym9hcmQgYXQgdGhpcyB0aW1lLgoKT2ssIGhvcGVmdWxseSBpdCB3aWxsIGluIHRoZSBmdXR1cmUu
IEkgdGhpbmsgdGhlIGNsaXBib2FyZCByZWFsbHkgY2FuIGJlCmEgdnVsbmVyYWJsZSBwbGFjZS4u
Li4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpN
b2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
