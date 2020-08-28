Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2475225612A
	for <lists+apparmor@lfdr.de>; Fri, 28 Aug 2020 21:24:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kBjyt-0003Xs-TF; Fri, 28 Aug 2020 19:24:11 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1kBjys-0003Xm-6m
 for apparmor@lists.ubuntu.com; Fri, 28 Aug 2020 19:24:10 +0000
Received: from mephala (unknown [IPv6:2001:16b8:303a:7100:50ad:28c8:f1d9:63ed])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id C47FF2405F0
 for <apparmor@lists.ubuntu.com>; Fri, 28 Aug 2020 21:24:09 +0200 (CEST)
Date: Fri, 28 Aug 2020 21:24:08 +0200
From: Jonas =?UTF-8?B?R3Jvw59l?= Sundrup <jgs-apparmor@letopolis.de>
To: apparmor@lists.ubuntu.com
Message-ID: <20200828212408.0002e474@mephala>
X-Pect: The Spanish Inquisition
MIME-Version: 1.0
Subject: [apparmor] Kernel-regression?
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

SGksCgpJIGFwcGFyZW50bHkganVzdCByYW4gaW50byBhIGtlcm5lbCByZWdyZXNzaW9uIHdpdGgg
QXBwQXJtb3IgYW5kIEknbQpsb29raW5nIGZvciB0aGUgY29ycmVjdCBidWd0cmFja2VyIG5vdy4K
ClRoZSBzaXR1YXRpb24gYXQgaGFuZCBpcyByb3VnaGx5IHRoZSBmb2xsb3dpbmc6CgovdXNyL2Jp
bi9lbGVtZW50LWRlc2t0b3AKICBpcyBhIGJhc2gtc2NyaXB0LCB0aGVyZWZvcmUgc3Bhd25zIGEg
YmFzaAogICAgc3Bhd25zICJlbGVjdHJvbiAvdXNyL2xpYi9lbGVtZW50L2VsZW1lbnQuYXNhciIK
CkkgaGF2ZSBhIHByb2ZpbGUgZm9yIC91c3IvYmluL2VsZW1lbnQtZGVza3RvcCBjb250YWluZXJp
emluZyB0aGlzIHN0YWNrCnVzaW5nIGl4IGZvciBleGVjdXRpb24uIFRoaXMsIGlmIEkgaGF2ZSB0
aGlzIGNvcnJlY3RseSwgc2hvdWxkIHNwYXduCmV2ZXJ5IHN1YnByb2Nlc3Mgb2YgdGhlIGFmb3Jl
bWVudGlvbmVkIGV4ZWN1dGFibGUgaW4gdGhlIHNhbWUgcHJvZmlsZSwKaGVuY2UgdGhpcyBzaG91
bGQgYWxzbyB3b3JrIHJlY3Vyc2l2ZWx5LgpJIG9ic2VydmUgdGhlIHByb2JsZW0gc3BlY2lmaWNh
bGx5IGZvciB0aGUgZWxlbWVudC1kZXNrdG9wLXByb2ZpbGUsIEkKaGF2ZSBvdGhlciBBcHBBcm1v
ci1wcm9maWxlcyB0aGF0IHN0aWxsIHdvcmsgYXMgaW50ZW5kZWQuCgpJdCBkb2VzIHdvcmsgb24g
TGludXggNS44LjEsIGJ1dCBpdCBhcHBhcmVudGx5IGRvZXNuJ3QgYW55bW9yZSBvbiA1LjguMgph
bmQgNS44LjMsIHdoZXJlIEkgZ2V0IGEgcGVybWlzc2lvbiBkZW5pZWQgZm9yIGJhc2ggZm9yCi9l
dGMvbGQuc28uY2FjaGUgYXMgd2VsbCBhcyAvdXNyL2xpYi9saWJyZWFkbGluZS5zby44LjAgKGFs
YmVpdCBub3QKY2hhbmdpbmcgdGhlIEFwcEFybW9yLXByb2ZpbGUsIGFuZCBib3RoIGFyZSB3aGl0
ZWxpc3RlZCBmb3IgcmVhZGluZwood2hpY2ggaXMgdGhlIHBlcm1pc3Npb24gdGhhdCdzIGRlbmll
ZCBieSBBcHBBcm1vciBhY2NvcmRpbmcgdG8gZG1lc2cpLApvbmUgdmlhICIvdXNyLyoqIHJtaXgs
IiwgdGhlIG90aGVyIHZpYSAiL2V0Yy9sZC5zby5jYWNoZSBtciwiIHRoZXJlZm9yZQpJIGFtIDkw
JSBzdXJlIHRoYXQgdGhpcyBpcyBub3QgYSBtaXN0YWtlIG9uIG15IHNpZGUgYW5kIDEwJSBzdXJl
IHRoYXQKSSBtaXNzZWQgc29tZXRoaW5nLCBidXQgZG9uJ3Qga25vdyB3aGF0KS4KClRoZSBidWcg
c2VlbXMgdG8gYmUgaW4gdGhlICJpeCIsIGFzIGV4cGxpY2l0bHkgd2hpdGVsaXN0aW5nIGJvdGgg
ZmlsZXMKaW4gdGhlIHByb2ZpbGUgbWFudWFsbHkgZG9lcyBub3QgcmVzb2x2ZSB0aGUgc2l0dWF0
aW9uLCBhdCBsZWFzdCBub3QKZm9yIGxpYnJlYWRsaW5lLCBhbmQgdGhlIHByb2Nlc3MgdGhhdCBk
aWVzIG9uIGl0IGlzIHRoZSBiYXNoIGluIHRoZQpzZWNvbmQgc3RhZ2UuIChJIHNvbWVob3cgbWFu
YWdlZCB0byBmaXggaXQgZm9yIGxkLnNvLmNhY2hlLCBub3Qgc3VyZSB3aHkKdGhhdCB3b3JrcyB3
aGVyZWFzIGZvciBsaWJyZWFkbGluZSBpdCBkb2Vzbid0KS4KClRoZSBxdWVzdGlvbiBub3cgaXM6
IHdoaWNoIGJ1Z3RyYWNrZXIgZG9lcyB0aGlzIGdvIHRvIHRvIGJlIGJlc3QKcmVwb3J0ZWQgaWYg
aXQgY29udGludWVzIHRvIGJlIGEgYnVnPyBLZXJuZWwgb3IgQXBwQXJtb3ItVG9vbHM/ClNlZW1z
IHRvIGJlIHRoZSBrZXJuZWwsIGJ1dCBJIGRvbid0IGtub3cgaG93IEFwcEFybW9yIGlzIGltcGxl
bWVudGVkLAppZiBpdCdzIHNvbWV0aGluZyBpbXBsZW1lbnRlZCBpbiBlQlBGIGl0J3MgcG9zc2li
bHkgbm90IHRoZSBrZXJuZWw/CgpNYXliZSBJIGhhdmUgYW5vdGhlciBpZGVhIGZvciB0aGUgcm9v
dCBjYXVzZSwgYnV0IGN1cnJlbnRseSBJJ20gYSBiaXQKb3V0IG9mIGlkZWFzLiAoT3BlbiBmb3Ig
aWRlYXMsIHRob3VnaCwgaWYgYW55b25lIGhhcyBhIGd1ZXNzIHdoYXQncyB0aGUKaXNzdWUgYXQg
cGxheS4pCgoKVGhhbmtzLApKb25hcwoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1v
ckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0
cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
