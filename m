Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 187E419C87D
	for <lists+apparmor@lfdr.de>; Thu,  2 Apr 2020 20:02:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jK4Ab-000200-6I; Thu, 02 Apr 2020 18:02:25 +0000
Received: from confino.investici.org ([212.103.72.250])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <intrigeri@boum.org>) id 1jK4AZ-0001zt-Te
 for apparmor@lists.ubuntu.com; Thu, 02 Apr 2020 18:02:23 +0000
Received: from mx1.investici.org (unknown [127.0.0.1])
 by confino.investici.org (Postfix) with ESMTP id 5726C2170A;
 Thu,  2 Apr 2020 18:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boum.org;
 s=stigmate; t=1585850543;
 bh=RuBTfYvgXbtAmqas3c3X7+RoSBHPhwmtdy4sFJXCQcA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=h0lsEDOZFyOyzyYv1Jx+ZAYaTc875x0SKsEFYcPh5BNcst3SUT2D6tZ1x07/bYuea
 GIA/UN8cOHw2RIPvdNvMJXaXclbC89V4fBCvJziU3YqTjh6qFmpRgQJyc9Mir1XLJf
 79fD8lUt+5wdKR5ug2n1NSRht3A0oiMRe8rlCfb4=
Received: from [212.103.72.250] (mx1.investici.org [212.103.72.250])
 (Authenticated sender: intrigeri@boum.org) by localhost (Postfix) with
 ESMTPSA id 01B0020FBD; Thu,  2 Apr 2020 18:02:22 +0000 (UTC)
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id 4B8E31882042;
 Thu,  2 Apr 2020 20:02:17 +0200 (CEST)
Message-Id: <87tv2122c6.fsf@manticora>
From: intrigeri <intrigeri@boum.org>
To: Alberto Mardegan <mardy@users.sourceforge.net>, apparmor@lists.ubuntu.com
In-Reply-To: <5b6ba4a3-452e-bcd4-0dbb-f1a6c8b468a0@users.sourceforge.net>
References: <33f7799a-9184-990b-01d7-d27d61d918f7@users.sourceforge.net>
 <87369m2e3l.fsf@manticora>
 <5b6ba4a3-452e-bcd4-0dbb-f1a6c8b468a0@users.sourceforge.net>
Date: Thu, 02 Apr 2020 20:02:17 +0200
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

SGksCgpBbGJlcnRvIE1hcmRlZ2FuICgyMDIwLTA0LTAyKToKPiBPbiAwMi8wNC8yMCAxNjo0OCwg
aW50cmlnZXJpIHdyb3RlOgo+PiBBdCBUYWlscyB3ZSBkbyBzaGlwIGEgYmluYXJ5LCBjb21waWxl
ZCBwb2xpY3kgaW4gb3VyIGxpdmUgc3lzdGVtOgo+PiAKPj4gICBodHRwczovL3NhbHNhLmRlYmlh
bi5vcmcvdGFpbHMtdGVhbS90YWlscy8tL2Jsb2IvbWFzdGVyL2NvbmZpZy9jaHJvb3RfbG9jYWwt
aG9va3MvOTktY2FjaGUtQXBwQXJtb3ItcG9saWN5Cj4+ICAgaHR0cHM6Ly9zYWxzYS5kZWJpYW4u
b3JnL3RhaWxzLXRlYW0vdGFpbHMvLS9ibG9iL21hc3Rlci9jb25maWcvY2hyb290X2xvY2FsLWhv
b2tzLzAxLWNoZWNrLWZvci1vdXRkYXRlZC1BcHBBcm1vci1mZWF0dXJlLXNldAo+Cj4gQSBjb3Vw
bGUgb2YgcXVlc3Rpb25zOgo+Cj4gMSkgd2hlcmUgaXMgYXBwYXJtb3JfcGFyc2VyIGJlaW5nIHJ1
bj8gSXMgaXQgYSBjaHJvb3Q/CgpJdCdzIHJ1biBhcyBwYXJ0IG9mIHRoZSBUYWlscyBidWlsZC4g
SW5kZWVkLCBpdCdzIHJ1biBpbiBhIGNocm9vdAood2hpY2ggaXRzZWxmIGlzIGluIGEgdmFncmFu
dC1saWJ2aXJ0IFZNKS4KCj4gMikgeW91ciBzY3JpcHRzIGFyZSBjaGVja2luZyB0aGUgZmVhdHVy
ZXMgaW4KPiAvdXNyL3NoYXJlL2FwcGFybW9yLWZlYXR1cmVzOyBJIGRvbid0IGhhdmUgdGhpcyBk
aXJlY3RvcnkgaW4gdGhpcwo+IG1hY2hpbmU7IHdoYXQgaXMgaXQ/CgpUaGF0J3MgYSBEZWJpYW4g
dGhpbmcsIEkgZ3Vlc3MgeW91IGNhbiBpZ25vcmUgaXQuCgotLSAKQXBwQXJtb3IgbWFpbGluZyBs
aXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2Ny
aWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1v
cgo=
