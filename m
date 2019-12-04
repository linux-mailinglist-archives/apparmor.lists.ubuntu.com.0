Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 624AB11361F
	for <lists+apparmor@lfdr.de>; Wed,  4 Dec 2019 21:05:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1icatv-0004xE-RJ; Wed, 04 Dec 2019 20:05:31 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1icatt-0004wg-S8
 for apparmor@lists.ubuntu.com; Wed, 04 Dec 2019 20:05:29 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 9CE3616005E
 for <apparmor@lists.ubuntu.com>; Wed,  4 Dec 2019 21:05:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1575489928; bh=jUAN74attU/FiVlzSRMXbR0wCdYEykCKB+2/FAzENMk=;
 h=Subject:To:From:Date:From;
 b=HHHGnkw3x2zo2ptwBpnlTZKfQOThWiZsdan9PksvO3JPMvtdppiAElr1MACxN/Imi
 B8SqcQmn/4eAI5O8ZVrJkidnD4c2iqLduKvmSgXOZj+P9RMIj12kz8wi7sil7Sp+WA
 dAEc0rIdjJdsTtS+Q1d0ZY79nz6D+i5wK4PTpTXcREnTJ/mEGcKVxjskvKdAOKcrnH
 uSIbtO3k16Ni51jOW+X6v5/qPdsaXy1VFvuU0IcynPvR4G2VVyGqDRnCSGtmNiVcYQ
 GYRsVG+0AvkTsqx5TvlvEFtYdwM7Rxh1qS/tJEukR0X6KkFPxbW8IlYX+qZ5hifq8k
 Te+agm+3XJ97A==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47SqbD1vX0z6tm9;
 Wed,  4 Dec 2019 21:05:28 +0100 (CET)
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
References: <e5f73bfa-f5b9-6f3f-3ecb-298a60ac34ad@posteo.de>
 <7d25f674-38a6-9924-4ab3-7b75147c1cda@canonical.com>
From: mailing list <mailinglisten@posteo.de>
Message-ID: <595fa422-be8a-1fc6-31a4-b17872456ba9@posteo.de>
Date: Wed, 4 Dec 2019 21:05:28 +0100
MIME-Version: 1.0
In-Reply-To: <7d25f674-38a6-9924-4ab3-7b75147c1cda@canonical.com>
Content-Language: de-DE
Subject: Re: [apparmor] cupsd profile?
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

QW0gMDMuMTIuMTkgdW0gMTc6NDYgc2NocmllYiBKb2huIEpvaGFuc2VuOgo+IE9uIDEyLzMvMTkg
ODozNiBBTSwgbWFpbGluZyBsaXN0IHdyb3RlOgo+PiBIZWxsbyEKPj4KPj4gV2hlbiBsb29raW5n
IHdpdGggR29vZ2xlLCBJIGZpbmQgYSBsb3QgZGlzY3Vzc2lvbnMgYWJvdXQgY3VwcyBhbmQgQUEs
Cj4+IGJ1dCBub3QgdGhlIGJhcmUgY3Vwc2QgQUEgcHJvZmlsZS4uLi4KPj4gQ2FuIHNvbWVvbmUg
cG9pbnQgbWUgdG8gdGhlIGN1cHNkIHByb2ZpbGUgb3IgcG9zdCB0aGUgcHJvZmlsZSBoZXJlPwo+
PiBUaGFueCEKPj4KPiAKPiBUaGUgcHJvZmlsZSBvbiB1YnVudHUgbGl2ZXMgaW4gdGhlIGN1cHMt
ZGFlbW9uIHBhY2thZ2UgYW5kIHRoZXJlIGlzCj4gYW5vdGhlciBwcm9maWxlIGZvciB0aGUgYnJv
d3NlciBpbiB0aGUgY3Vwcy1icm93c2VkIHBhY2thZ2UuCj4gCj4gSSBoYXZlIGF0dGFjaGVkIGJv
dGggb2YgdGhvc2UgcHJvZmlsZXMuCgpUaGFua3MhIFdpbGwgdGFrZSBhIGxvb2sgYXQgaXQhCgoK
CgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9k
aWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20v
bWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=
