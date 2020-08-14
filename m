Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 620A8244FBC
	for <lists+apparmor@lfdr.de>; Sat, 15 Aug 2020 00:10:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k6hte-0006tU-P4; Fri, 14 Aug 2020 22:09:58 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1k6htd-0006tO-5E
 for apparmor@lists.ubuntu.com; Fri, 14 Aug 2020 22:09:57 +0000
Received: from mephala (unknown [IPv6:2001:16b8:308e:8f00:ac15:24dc:7dc:c188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id A84C1240046
 for <apparmor@lists.ubuntu.com>; Sat, 15 Aug 2020 00:09:56 +0200 (CEST)
Date: Sat, 15 Aug 2020 00:09:55 +0200
From: Jonas =?UTF-8?B?R3Jvw59l?= Sundrup <jgs-apparmor@letopolis.de>
To: apparmor@lists.ubuntu.com
Message-ID: <20200815000955.59888117@mephala>
In-Reply-To: <20200812002037.77fa6505@mephala>
References: <20200812002037.77fa6505@mephala>
X-Pect: The Spanish Inquisition
MIME-Version: 1.0
Subject: Re: [apparmor] Confinement inheritance with ix
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

T24gMjAyMC0wOC0xMiwgSm9uYXMgR3Jvw59lIFN1bmRydXAgd3JvdGU6Cj4gT3IgaW4gb3RoZXIg
d29yZHM6IHdoZXJlIGlzIG15IG1lbnRhbCBtb2RlbCBvZiBBcHBBcm1vciBzdGlsbAo+IGluY29y
cmVjdD8KCkFmdGVyIHNvbWUgZnVydGhlciBleHBlcmltZW50YXRpb24sIEkgdGhpbmsgSSBjYW4g
bm93IGFuc3dlciBteSBvd24KcXVlc3Rpb24gaGVyZSwgaWYgYW55b25lIG9ic2VydmVzIGEgc2lt
aWxhciBwcm9ibGVtIGFuZCBoYXBwZW5zIHRvIGZpbmQKbXkgb3JpZ2luYWwgbWFpbDoKClRoZSBl
eGVjdXRhYmxlIGluIHF1ZXN0aW9uLCBpbiB3aG9zZSBwcm9maWxlIHRoZSBpeC1jb25maW5lbWVu
dCBkaWQgbm90CndvcmssIHdhcyBpbiBmYWN0IG5vdCB0aGUgZXhlY3V0YWJsZSwgYnV0IGEgc3lt
bGluayB0byBpdCwgd2hpY2ggSQpkaWRuJ3QgZGlyZWN0bHkgbm90aWNlLiBXaGlsZSBodG9wIHdp
bGwgdGhlbiBub3RlIHRoZSBwcm9jZXNzIHZpYSBpdHMKKmV4ZWN1dGVkKiBuYW1lLCBha2EgdGhl
IG5hbWUgb2YgdGhlIHN5bWxpbmssIEFwcEFybW9yIHRyaWdnZXJzIG9ubHkKZm9yIHRoZSAqYWN0
dWFsKiBleGVjdXRhYmxlLiBBZnRlciByZWFsaXppbmcgdGhpcyBhbmQgYWRhcHRpbmcgdGhlCnBy
b2ZpbGVzIGFjY29yZGluZ2x5LCBldmVyeXRoaW5nIG5vdyB3b3JrcyBzbW9vdGhseSBhY2NvcmRp
bmcgdG8gdGhlCmRvY3VtZW50YXRpb24uIDopCgoKICB+IEpvbmFzCgoKLS0gCkFwcEFybW9yIG1h
aWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1
bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8v
YXBwYXJtb3IK
