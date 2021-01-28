Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E8308179
	for <lists+apparmor@lfdr.de>; Thu, 28 Jan 2021 23:54:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1l5GB2-0002Z7-UX; Thu, 28 Jan 2021 22:54:12 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1l5GB1-0002Yv-8f
 for apparmor@lists.ubuntu.com; Thu, 28 Jan 2021 22:54:11 +0000
Received: from mephala (unknown [IPv6:2001:16b8:30cb:3f00:2125:1e67:52fd:6c71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id BAFD824006C
 for <apparmor@lists.ubuntu.com>; Thu, 28 Jan 2021 23:54:10 +0100 (CET)
Date: Thu, 28 Jan 2021 23:54:05 +0100
From: Jonas =?UTF-8?B?R3Jvw59l?= Sundrup <jgs-apparmor@letopolis.de>
To: apparmor@lists.ubuntu.com
Message-ID: <20210128235405.4d6a97cb@mephala>
In-Reply-To: <ec488116-30cf-47e9-ccfd-fe83d1b282ec@canonical.com>
References: <20200828212408.0002e474@mephala>
 <ec488116-30cf-47e9-ccfd-fe83d1b282ec@canonical.com>
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

T24gMjAyMC0wOS0wNSwgSm9obiBKb2hhbnNlbiB3cm90ZToKPiBUaGlzIHdvdWxkIHBvaW50IHRv
IGEga2VybmVsIGNoYW5nZS4gRG8geW91IGtub3cgaG93IHRvIGJpc2VjdD8gT3IgYXJlCj4geW91
IHdpbGxpbmcgdG8gdGVzdCBkZWJ1ZyBrZXJuZWxzIGJ1aWx0IGZvciB5b3UgYmFzZWQgb24gYSBi
aXNlY3QuCgpZZXMsIHVuZm9ydHVuYXRlbHkgZHVlIHRvIHRpbWUgY29uc3RyYWludHMgSSBkaWRu
J3QgZ2V0IGFyb3VuZCB0bwpiaXNlY3RpbmcgdGhlIHByb2JsZW0ganVzdCB5ZXQuIEksIGhvd2V2
ZXIsIGFsc28gbm90aWNlZCB0aGF0IHRoZQpwcm9ibGVtIGlzIGdvbmUgYnkgbm93LCBzbyBJIHN1
c3BlY3QgdGhlIHVuZGVybHlpbmcgaXNzdWUgaGFzIGJlZW4gYmUKcmVzb2x2ZWQsIHBvc3NpYmx5
IGludGVudGlvbmFsbHkgb3IgYXMgYSBkcml2ZS1ieSBlZmZlY3Qgb2YgYW5vdGhlciBmaXguCgpF
aXRoZXIgd2F5IEkgd291bGQgY29uc2lkZXIgdGhpcyBmaXhlZCBhbmQgbGV0IGl0IGJlLCB1bmxl
c3MgeW91IHdvdWxkCnNheSB0aGF0IHdlIHNob3VsZCBzdGlsbCBpbnZlc3RpZ2F0ZSB0aGUgZGV0
YWlscyBvZiB0aGlzIHByb2JsZW0KZnVydGhlci4gRm9yIHRoZSByZWNvcmQ6IEknbSBjdXJyZW50
bHkgb24gTGludXggNS4xMC4xMC4KCk1hbnkgdGhhbmtzIGZvciB0aGUgaGVscCBuZXZlcnRoZWxl
c3MsIGFzIHdlbGwgYXMgZm9yIGJ1aWxkaW5nIGFuZAptYWludGFpbmluZyBBcHBBcm1vciEKCi0t
IApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkg
c2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
