Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BF840D2BD
	for <lists+apparmor@lfdr.de>; Thu, 16 Sep 2021 07:03:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mQjYC-0006lO-NR; Thu, 16 Sep 2021 05:03:08 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mQjYA-0006lH-Dm
 for apparmor@lists.ubuntu.com; Thu, 16 Sep 2021 05:03:06 +0000
Received: from [192.168.192.153] (unknown [50.45.173.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id BC9D13F234; 
 Thu, 16 Sep 2021 05:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631768586;
 bh=0CJ5dtdT/85qzKEdiLll9ML+twj0Rz9oLADtdzc7e1A=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=M/RDD7a4gIUaoVrDJuKiT6T8rT13DzR4sjurPfKEFMEEEeLQqrEsSydB0sFxxQjCa
 D/00lZNrMaj47SLx985IaG6/u+k2vItqa2/kIOKdT3SshXpnX8eyYMtPtz7WF1X7Fz
 MBCzZJfB1K8MoY0VGbGB5t6g/Z60iUZT5XDwFtXrPUUZj4uzAAE0rIOTpxMdq61Xcu
 BdoLXe42foMxhOT2OGt5MsP5YkPDpOHzXj79YZjh+k/UxVIjDHSGOQxzvmfa5Kc9ne
 bJghshlU7Fv0GX3onYrXPWzlcMA12OstUze/0wQT/NWJicJdsTR8xmjcZGsRnT0HQx
 hmPDjxk7uXs/w==
To: Forest <forestix@sonic.net>, apparmor@lists.ubuntu.com
References: <0pc5kg1g4kb6p70e781h28c3mc6vddk8fk@4ax.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <83fd01dc-da59-55ca-d15b-9f1d79b4fbae@canonical.com>
Date: Wed, 15 Sep 2021 22:03:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0pc5kg1g4kb6p70e781h28c3mc6vddk8fk@4ax.com>
Content-Language: en-US
Subject: Re: [apparmor] How to extend an existing profile?
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

T24gOS8xNS8yMSA4OjE2IFBNLCBGb3Jlc3Qgd3JvdGU6Cj4gSSBuZWVkIG15IGN1c3RvbSBBcHBB
cm1vciBwcm9maWxlIHRvIG1pbWljIG9uZSBvZiB0aG9zZSBpbmNsdWRlZCB3aXRoIExYQywKPiB3
aXRoIGEgbmV3IG5hbWUgYW5kIGEgZmV3IGFkZGl0aW9uYWwgcnVsZXMuICBJcyB0aGVyZSBhIHdh
eSB0byBkbyB0aGlzCj4gd2l0aG91dCBjb3B5aW5nIHRoZSBjb250ZW50cyBvZiB0aGUgdXBzdHJl
YW0gcHJvZmlsZT8gIFNvbWUgd2F5IGZvciBvbmUKPiBwcm9maWxlIHRvIGluaGVyaXQgdGhlIHJ1
bGVzIG9mIGFub3RoZXIgcHJvZmlsZT8KPiAKQXRtIGFwcGFybW9yIHBvbGljeSBkb2VzIG5vdCBz
dXBwb3J0IGluaGVyaXRhbmNlLiBTZWUgYmVsb3cgZm9yIG1vcmUKCj4gSSBjb25zaWRlcmVkICNp
bmNsdWRlLCBidXQgdGhhdCBsb29rcyBsaWtlIGEgc2ltcGxlIHRleHQgaW1wb3J0IHRoYXQgd291
bGQKPiBwdWxsIGluIHRoZSB3aG9sZSB1cHN0cmVhbSBmaWxlLCBpbmNsdWRpbmcgaXRzIGhlYWRl
ciwgYW5kIHRoZXJlZm9yZSBub3QKPiB3b3JrLgo+IAp1bmZvcnR1bmF0ZWx5IHRoYXQgaXMgdGhl
IGNhc2UKCj4gQXMgYSBsYXN0IHJlc29ydCwgSSBzdXBwb3NlIEkgY291bGQgY29weSB0aGUgdXBz
dHJlYW0gcHJvZmlsZSdzIGNvbnRlbnRzCj4gaW50byBhIG5ldyBmaWxlIGFsb25nIHdpdGggbXkg
YWRkaXRpb25zLCBidXQgdGhhdCB3b3VsZCBkdXBsaWNhdGUgdXBzdHJlYW0KPiBwb2xpY3kgYW5k
IHJpc2sgZmFsbGluZyBvdXQgb2Ygc3luYyB3aXRoIHVwc3RyZWFtIGNoYW5nZXMuCj4gClRoaXMg
aXMgdW5mb3J0dW5hdGVseSB3aGF0IHlvdSBhcmUgZ29pbmcgdG8gaGF2ZSB0byBkbyBhdG0uCgpI
b3cgd2Ugd291bGQgaGFuZGxlIHRoaXMgYXMgYW4gdXBzdHJlYW0gY3VycmVudGx5IGlzIHJlZmFj
dG9yIHRoZSBwcm9maWxlCmludG8gYSBzaGFyZWQgaW5jbHVkZSwgYnV0IHVuZm9ydHVuYXRlbHkg
dGhpcyBkb2Vzbid0IHJlYWxseSB3b3JrIGZvciB5b3UuCgo+IFRoZSB1c2UgY2FzZSBpcyB0byBn
ZXQgU3RlYW0ncyBwcmVzc3VyZS12ZXNzZWwgd29ya2luZyBpbiBMWEMgY29udGFpbmVycy4KPiAK
ClNvIHRoaXMgaGFzIGJlZW4gYnJvdWdodCB1cCBiZWZvcmUgYW5kIGlzIHNvbWV0aGluZyB3ZSBu
ZWVkIGFuZCBoYXZlIGV2ZW4KdG95ZWQgd2l0aCBidXQgaGF2ZW4ndCBzZXR0bGVkIG9uIHRoZSBi
ZXN0IHdheSB0byBkbyB0aGlzIE9uZSBvZiB0aGUgc3RpY2tpbmcKcG9pbnQgaGFzIGJlZW4gaG93
IHRvIGhhbmRsZSBkZWxldGluZyBydWxlcywgZGVueSBjYW4gYmUgdXNlZCBmb3IgYWxsb3cgcnVs
ZXMKYnV0IHdlIGN1cnJlbnRseSBkb24ndCBoYXZlIChidXQgYXJlIHdvcmtpbmcgb24pIGEgbWVj
aGFuaXNtIHRvIHJlbW92ZSBkZW55CnJ1bGVzLgoKVG8gZml4IHRoaXMgd2UgaGF2ZSBiZWVuIHdv
cmtpbmcgb24gc3VwcG9ydCBmb3IgcG9saWN5IGNvbXBvc2l0aW9uLCBzbwp5b3UgY291bGQgZG8g
c29tZXRoaW5nIGxpa2UKCnByb2ZpbGUgZXhhbXBsZSB7CgogICB7IGluY2x1ZGUgPGZvbz4gfSBl
eGNlcHQgewogICAgICAgIGRlbnkgdyBmb28sCiAgICAgICAgLi4uCiAgIH0KfQoKClRoaXMgd291
bGQgZ2l2ZSB0aGUgbWVjaGFuaXNtIHdlIG5lZWQgdG8gZG8gcnVsZSByZW1vdmFsIHdpdGggaW5o
ZXJpdGFuY2UuClNvbWUgdGhpbmcgbGlrZQoKcHJvZmlsZSBleGFtcGxlIHsKICAgaW5oZXJpdCBm
b29iYXIgZXhjZXB0IHsKICAgICAuLi4KICAgfQoKICAgYWxsb3cgciAvYS9uZXcvcnVsZSwKICAg
Li4uCn0KCk9mIGNvdXJzZSBzeW50YXggaXNuJ3QgZmluYWxpemVkLCBhbmQgZmVlZGJhY2sgYW5k
IGlkZWFzIGFyZSB3ZWxjb21lLgpIb3BlZnVsbHkgdGhpcyBpcyBzb21ldGhpbmcgd2UgY2FuIGxh
bmQgc29vbmVyIHRoYW4gbGF0ZXIuCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9y
QGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRw
czovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=
