Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC16137BB8
	for <lists+apparmor@lfdr.de>; Sat, 11 Jan 2020 06:38:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iq9Tu-0006hb-61; Sat, 11 Jan 2020 05:38:42 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1iq9Tr-0006hP-OW
 for apparmor@lists.ubuntu.com; Sat, 11 Jan 2020 05:38:39 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 2073016005E
 for <apparmor@lists.ubuntu.com>; Sat, 11 Jan 2020 06:38:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1578721119; bh=r5iOPgG8+ZwhY/gy7+X4CMVtp+Z38SxQG6E1vLFYzxQ=;
 h=To:From:Subject:Date:From;
 b=k/lQGdH8C3x1kwqlKmGDR8inbbVIYKl1TyyQLjL6p3gJqx0QnEzO1fD7zX7JITpal
 g2FzUmNd94bmiisXX1o+1tpyjB/YLdGXhVGONPFXjCuY/6px597OmlJscn8jUPWHdM
 zY4dQ0JWrJteM4I0kPeGcTIsVdlX3vZDgAzf4Q9hYooWwZe/Ph1Y6JGDDfV2Y+by7J
 JLecUZQN+TnTQYjZwvfbB7EqHNfa4XilkxJvdAmpqiggkWxHyvtgHe8tZ4wWXv0fHH
 NQbY6i080qhyfWkRXiKpXUZNnmCRXN4WBuo76HkFhFf0/tCUscqBUB2ffxP2eroCUc
 AD8YYGAAiGN0w==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47vpYV4FhYz6tm6
 for <apparmor@lists.ubuntu.com>; Sat, 11 Jan 2020 06:38:38 +0100 (CET)
To: apparmor@lists.ubuntu.com
From: mailing list <mailinglisten@posteo.de>
Message-ID: <c94da22f-6b7d-757e-37e8-79366940d7bc@posteo.de>
Date: Sat, 11 Jan 2020 06:38:38 +0100
MIME-Version: 1.0
Content-Language: de-DE
Subject: [apparmor] wildcard syntax
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

SGkgdGhlcmUsCgpkb2VzIEFBIHVuZGVyc3RhbmQgdGhlID8gYXMgYSB3aWxkY2FyZCBmb3Igc2lu
Z2xlIGNoYXJhY3RlcnM/CkUuZy4gVmlydHVhbEJveCBzZWVtcyB0byB3YW50IGNyZWF0aW5nIHRl
bXBvcmFyeSBmaWxlcyBsaWtlCgokSE9NRS8jNDU2NzgzNjEKClRoZXNlIHRlbXAgZmlsZXMgYWx3
YXlzIHN0YXJ0IHdpdGggaGFzaCBrZXkgc3ltYm9sIHdoaWNoIG1heQphZGRpdGlvbmFsbHkgdHJv
dWJsZSBBQSBydWxlPwoKV291bGQgdGhlIHJ1bGUKCiRIT01FLyM/Pz8/Pz8/PyBtcncsCgpjb3Zl
ciB0aGUgc3ludGF4IG9mIHN1Y2ggdGVtcCBmaWxlcz8gV2hhdCBhYm91dCB0aGUgaGFzaCBrZXku
CgpEbyBJIG5lZWQgdG8gdGVsbCBBQSB0byBzZWUgdGhlIGhhc2gga2V5L3BvdW5kIHN5bWJvbCBv
bmx5IGFzICJwbGFpbgpzeW1ib2wiPwoKT2ssIEkgbm93IHRyaWVkCiRIT01FLyM/Pz8/Pz8/PyBt
cncsClRoZSBwb3VuZCBzaWduIHNlZW0gdG8gYmUgc2VlbiBqdXN0IGFzIHBsYWluIHN5bWJvbCwg
YXMgZGVzaXJlZC4KCgpUaGFua3MhCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9y
QGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRw
czovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=
