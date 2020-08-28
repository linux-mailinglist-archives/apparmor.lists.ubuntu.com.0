Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAE9256175
	for <lists+apparmor@lfdr.de>; Fri, 28 Aug 2020 21:40:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kBkEp-0004QJ-Vp; Fri, 28 Aug 2020 19:40:39 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1kBkEo-0004QD-3e
 for apparmor@lists.ubuntu.com; Fri, 28 Aug 2020 19:40:38 +0000
Received: from mephala (unknown [IPv6:2001:16b8:303a:7100:50ad:28c8:f1d9:63ed])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id ABD2D24091C
 for <apparmor@lists.ubuntu.com>; Fri, 28 Aug 2020 21:40:37 +0200 (CEST)
Date: Fri, 28 Aug 2020 21:40:36 +0200
From: Jonas =?UTF-8?B?R3Jvw59l?= Sundrup <jgs-apparmor@letopolis.de>
To: apparmor@lists.ubuntu.com
Message-ID: <20200828214036.772f6ba2@mephala>
In-Reply-To: <20200828212408.0002e474@mephala>
References: <20200828212408.0002e474@mephala>
X-Pect: The Spanish Inquisition
MIME-Version: 1.0
Subject: Re: [apparmor] Kernel-regression?
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

T2ssIHRoaW5ncyBnZXQgZnVua3ksIEkgdHJpZWQgc29tZSBhcmJpdHJhdHkgdGhpbmdzIGFuZCBm
b3VuZC4uLgppbnRlcmVzdGluZyBiZWhhdmlvcjoKCk5hbWVseSwgSSBoYXZlIGNvcGllZCB0aGF0
IGJhc2hzY3JpcHQgL3Vzci9iaW4vZWxlbWVudC1kZXNrdG9wIHRvCi91c3IvbG9jYWwvYmluL2Vs
ZW1lbnRsYXVuY2hlciBhbmQgY29waWVkIHRoZSBwcm9maWxlIGZvcgplbGVtZW50LWRlc2t0b3Ag
dG8gYSBzZWNvbmQgZmlsZSwgYW5kIG9ubHkgYWRqdXN0ZWQgdGhlIHBhdGguCgpTbyAvdXNyL2Jp
bi9lbGVtZW50LWRlc2t0b3AgYW5kIC91c3IvbG9jYWwvYmluL2VsZW1lbnRsYXVuY2hlciBhcmUK
aWRlbnRpY2FsLCB0aGUgcHJvZmlsZSBmaWxlcyBmb3IgdGhlIHR3byBhcmUgaWRlbnRpY2FsIGV4
Y2VwdCB0aGUgb25lCm9wZW5pbmctbGluZSBvZiB0aGUgcHJvZmlsZSB3aGVyZSB0aGV5IGFyZSBy
ZWZlcnJpbmcgdG8gdGhlIHR3bwpkaWZmZXJlbnQgcGF0aHMvZXhlY3V0YWJsZXMuCgovdXNyL2xv
Y2FsL2Jpbi9lbGVtZW50bGF1bmNoZXIgcGVyZmVjdGx5IHdvcmtzIGFuZCB0aGUgIGFwcGFybW9y
LXBvbGljeQppcyBhcHBsaWVkIGFzIHNwZWNpZmllZCwgL3Vzci9iaW4vZWxlbWVudC1kZXNrdG9w
LgoKTW92aW5nIGVsZW1lbnRsYXVuY2hlciB0byBlaXRoZXIKCi91c3IvbG9jYWwvYmluL2VsZW1l
bnRsYXVuY2hlcgovdXNyL2xvY2FsL2Jpbi9lbGVtZW50LWxhdW5jaGVyCi91c3IvYmluL2VsZW1l
bnRsYXVuY2hlcgoKKGFuZCBhZGp1c3RpbmcgdGhlIHBhdGggaW4gdGhlIHByb2ZpbGUgYWNjb3Jk
aW5nbHkpIGRvZXNuJ3QgYnJlYWsKYW55dGhpbmcsIGV2ZXJ5dGhpbmcgd29ya3MgcGVyZmVjdGx5
LgoKL3Vzci9iaW4vZWxlbWVudC1kZXNrdG9wIGhvd2V2ZXIgc3RpbGwgeWllbGRzCgovYmluL2Jh
c2g6IGVycm9yIHdoaWxlIGxvYWRpbmcgc2hhcmVkIGxpYnJhcmllczogbGlicmVhZGxpbmUuc28u
ODoKY2Fubm90IG9wZW4gc2hhcmVkIG9iamVjdCBmaWxlOiBQZXJtaXNzaW9uIGRlbmllZAoKRG9l
cyBhbnlvbmUgaGF2ZSBhbiBpZGVhIHdoYXQgY291bGQgYmUgZ29pbmcgb24gaGVyZT8KCgogIH4g
Sm9uYXMKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNv
bQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
