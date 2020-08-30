Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E810B256F31
	for <lists+apparmor@lfdr.de>; Sun, 30 Aug 2020 17:50:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kCPbH-00063a-UZ; Sun, 30 Aug 2020 15:50:35 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1kCPbF-00063O-UG
 for apparmor@lists.ubuntu.com; Sun, 30 Aug 2020 15:50:33 +0000
Received: from mephala (unknown [IPv6:2001:16b8:30bc:8000:ccb6:ce09:a678:97cc])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id 6F9BC240147;
 Sun, 30 Aug 2020 17:50:33 +0200 (CEST)
Date: Sun, 30 Aug 2020 17:50:32 +0200
From: Jonas =?UTF-8?B?R3Jvw59l?= Sundrup <jgs-apparmor@letopolis.de>
To: Christian Boltz <apparmor@cboltz.de>
Message-ID: <20200830175032.7d066992@mephala>
In-Reply-To: <2582813.ijAbYlV0QE@tux.boltz.de.vu>
References: <20200828212408.0002e474@mephala> <20200828214036.772f6ba2@mephala>
 <2582813.ijAbYlV0QE@tux.boltz.de.vu>
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
Cc: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

SGksCgoKT24gMjAyMC0wOC0zMCwgQ2hyaXN0aWFuIEJvbHR6IHdyb3RlOgo+IC0gZGlkIHlvdSBy
ZWxvYWQgdGhlIHByb2ZpbGUgYWZ0ZXIgY2hhbmdpbmcgaXQ/CgpZZXMsIHZpYSBhYS10ZWFyZG93
biAmJiBzeXN0ZW1jdGwgcmVzdGFydCBhcHBhcm1vci5zZXJ2aWNlIGFuZApyZXN0YXJ0aW5nIGVs
ZW1lbnQte2Rlc2t0b3AsbGF1bmNoZXJ9IGFmdGVyd2FyZHMgZm9yIHRoZSBwcm9maWxlcyB0bwp0
YWtlIGVmZmVjdC4gSSBoYXZlIG1hZGUgc3VyZSB0aGF0IG5vIHByb2Nlc3NlcyBvZgplbGVtZW50
LXtkZXNrdG9wLGxhdW5jaGVyfSByZW1haW4gYmVmb3JlIGRvaW5nIHNvIHRvIGF2b2lkIGl0IHN0
aWxsCmJlaW5nIHVuY29uZmluZWQgZHVlIHRvIHRoZSB0ZWFyZG93bi4KCgo+IC0gZGlkIHlvdSBs
b2FkIHRoZSBuZXcgcHJvZmlsZXM/CgpZZXMsIHZpYSBhYS10ZWFyZG93biAmJiBzeXN0ZW1jdGwg
cmVzdGFydCBhcHBhcm1vci5zZXJ2aWNlLCBzZWUgYWJvdmUKCgo+IC0gZG8geW91IHNlZSBhbnkg
ZXJyb3JzIHdoZW4gKHJlKWxvYWRpbmcgdGhlIHByb2ZpbGVzIHdpdGgKPiAgICAgIGFwcGFybW9y
X3BhcnNlciAtciAvZXRjL2FwcGFybW9yLmQvCgpOby4KCgo+IC0gYXJlIHRoZSBwcm9jZXNzZXMg
Y29uZmluZWQgdW5kZXIgdGhlIGV4cGVjdGVkIHByb2ZpbGU/IENoZWNrIHdpdGgKPiAgICAgIHBz
IFphdXggfCBncmVwIGVsZW1lbnQKCmV2ZXJ5IG91dHB1dHRlZCBsaW5lIChleGNlcHQgdGhlIGdy
ZXAgYWJvdmUpIGlzIGxpc3RlZCB3aXRoCiIoZW5mb3JjZSkiICh3aGljaCBtZWFucyB0aGF0IGFs
bCBwcm9jZXNzZXMgYXJlIGNvbmZpbmVkLCByaWdodD8gb3IgaXMKdGhlcmUgc29tZXRoaW5nIGVs
c2UgdG8gd2F0Y2ggb3V0IGZvcj8pCgoKPiBJZiB0aGUgYWJvdmUgZG9lc24ndCBoZWxwLCBzZWVp
bmcgdGhlIHByb2ZpbGUgYW5kIHRoZSBvdXRwdXQgb2YKPiBhYS1zdGF0dXMgICB3b3VsZCBwcm9i
YWJseSBiZSBoZWxwZnVsLgoKYWEtc3RhdHVzIGxvb2tzIHVuc3VzcGljaW91czogaHR0cHM6Ly9w
Lm5uZXYuZGUvOTU0NwoKUHJvZmlsZSAoYWZ0ZXIgcmVzb2x2aW5nIGFsbCBpbmNsdWRlcyk6IGh0
dHBzOi8vcC5ubmV2LmRlLzk1NDgKVGhpcyBpcyB0aGUgcHJvZmlsZSBmb3IgL3Vzci9iaW4vZWxl
bWVudC1kZXNrdG9wLCB0aGUgcHJvZmlsZSBpdHNlbGYKc3RhcnRzIGF0IGxpbmUgOTkuCk15IHBy
b2ZpbGUgZm9yIC91c3IvbG9jYWwvYmluL2VsZW1lbnQtbGF1bmNoZXIgaXMgaWRlbnRpY2FsLCBl
eGNlcHQgZm9yCmxpbmUgOTkuCgplbGVtZW50LWRlc2t0b3AgdGhyb3dzIHRoZSBhZm9yZW1lbnRp
b25lZCBlcnJvciB3aXRoIGxpYnJlYWRsaW5lLAplbGVtZW50LWxhdW5jaGVyIHdvcmtzIGFic29s
dXRlbHkgZmluZS4KCkNoZWNrc3VtcyBmb3IgYm90aCBlbGVtZW50LWRlc2t0b3AgYW5kIGVsZW1l
bnQtbGF1bmNoZXIgYXJlIGlkZW50aWNhbCwKYXMgYm90aCBleGVjdXRhYmxlcyBhcmUgaWRlbnRp
Y2FsICh5ZXMsIEkgaGF2ZSBqdXN0IHNoYTFzdW1tZWQgYm90aCBvZgp0aGVtIHRvIGF2b2lkIG1l
IHNjcmV3aW5nIHNvbWV0aGluZyB1cC4uLikuCgoKPiBbMV0gSSdtIHNvcnJ5IGlmIHNvbWUgb2Yg
dGhlbSBsb29rIGxpa2UgInNpbGx5IHF1ZXN0aW9ucyIsIGJ1dCBwbGVhc2UKPiAgICAgY2hlY2sg
dGhlbSBuZXZlcnRoZWxlc3MgOy0pCgpObyB3b3JyaWVzLCBjZXJ0YWlubHkgc2VlIHdoYXQgeW91
IGFyZSBjaGVja2luZyB0aGVyZSBhbmQgd2h5LiA6KQoKCklmIHlvdSBoYXZlIGFueSBpZGVhcyB3
aGF0IHN0aWxsIHRvIHRyeSwgSSdtIGhhcHB5IHRvIHRyeSB0aGVtLi4uCgoKICB+IEpvbmFzCgot
LSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5
IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFp
bG1hbi9saXN0aW5mby9hcHBhcm1vcgo=
