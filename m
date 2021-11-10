Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D14044CA94
	for <lists+apparmor@lfdr.de>; Wed, 10 Nov 2021 21:25:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mkuAH-00059C-9W; Wed, 10 Nov 2021 20:25:49 +0000
Received: from nat64.dcmtl.stgraber.org ([45.45.148.0] helo=mx2.sdeziel.info)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <simon@sdeziel.info>) id 1mkuAF-000595-Nw
 for apparmor@lists.ubuntu.com; Wed, 10 Nov 2021 20:25:48 +0000
Received: from mail.sdeziel.info (mail.sdeziel.info
 [IPv6:2001:470:b1c3:7942::25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by mx2.sdeziel.info (Postfix) with ESMTPS id 4HqGZL18QPzyS2
 for <apparmor@lists.ubuntu.com>; Wed, 10 Nov 2021 20:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.sdeziel.info (Postfix) with ESMTP id 4HqGYk43y7zmmR
 for <apparmor@lists.ubuntu.com>; Wed, 10 Nov 2021 20:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sdeziel.info; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :subject:subject:from:from:references:content-language
 :user-agent:mime-version:date:date:message-id:received; s=
 mail2111; t=1636575913; x=1637180714; bh=Yhr2H7W8/q22c3DXfiPMKAT
 20u69m7+xB60Q/Yua8Pc=; b=bQeIUMdd8WyahnzzqTNm7cHe3CfQnLPmEmOEyYm
 /zhLLJLcSARSoGKlWTdExdKN2yVffBPMkQcInjXOoQZO3i6EELi3TvlF7mJalSR1
 ur6INMLlVG89us23nOLH1RZbrnxQ6Mhby8++BDuj1FG+CUFna/00iwQrFMX3Ngyv
 Y28DHoUxjAwow/8+M0ACI4HvAv8s1kihfYNOnaXCTSf0whyHU766pAiuERKdl0sS
 Ty7gKUAHcp6zWP89U4v7+fxSYozNSIAw4eLN4BlKb+JFcZSuZQ1n4+UCObBRuI86
 80AayL5O7CkqABP7hIaq531hfKzN70gb98MngTuCt9zx7jw==
Received: from [IPV6:2001:470:b1c3:7943::2] (unknown
 [IPv6:2001:470:b1c3:7943::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested) (Authenticated sender: simon)
 by mail.sdeziel.info (Postfix) with ESMTPSA id 4HqGYj0c21zmly
 for <apparmor@lists.ubuntu.com>; Wed, 10 Nov 2021 20:25:12 +0000 (UTC)
Message-ID: <8d4ec75d-3df3-6573-6a9f-605695a8beac@sdeziel.info>
Date: Wed, 10 Nov 2021 15:25:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: apparmor@lists.ubuntu.com
References: <trinity-948dd7ea-0e1b-4b22-92b7-b14d8f98ac02-1636452351170@3c-app-gmx-bs45>
From: Simon Deziel <simon@sdeziel.info>
In-Reply-To: <trinity-948dd7ea-0e1b-4b22-92b7-b14d8f98ac02-1636452351170@3c-app-gmx-bs45>
Subject: Re: [apparmor] AppArmor denies access,
 when systemd namespace used by hardening directive (e.g.
 ProtectHome)
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

SGkgQ2VkcmljLAoKT24gMjAyMS0xMS0wOSAwNTowNSwgQ2VkcmljIE3DvGxsZXIgd3JvdGU6Cj4g
SGksCj4gCj4gaW4gdGhlIGxhc3Qgd2Vla3MsIEkgdHJpZWQgdG8gZmluZCBhIGNvbmZpZ3VyYXRp
b24gc2V0IHRvIGhhcmRlbiB0aGUgTVFUVCBtZXNzYWdlIGJyb2tlciBNb3NxdWl0dG8uIFRoZXJl
Zm9yZSwgSSB3YW50IHRvIHVzZSBwcm9wZXJseSBjb25maWd1cmVkIHBlcm1pc3Npb25zIGZvciBk
aXNjcmV0aW9uYXJ5IGFjY2VzcyBjb250cm9sIGFuZCBhbiBBcHBBcm1vciBwcm9maWxlIGZvciBt
YW5kYXRvcnkgYWNjZXNzIGNvbnRyb2wuIEluIGFkZGl0aW9uLCBJIHdhbnQgdG8gYXBwbHkgc3lz
dGVtZCBzYW5kYm94aW5nIGFuZCBzZWN1cml0eSBoYXJkZW5pbmcgZGlyZWN0aXZlcyB0byBjb21w
bGV0ZSB0aGUgY29uZmlndXJhdGlvbiBzZXQuCj4gCj4gRm9yIG1vcmUgY29udGV4dDogU3lzdGVt
ZCBwcm92aWRlcyBhIHNvY2tldCAvcnVuL3N5c3RlbWQvbm90aWZ5LCB3aGVyZSBpdCBsaXN0ZW5z
IGZvciBtZXNzYWdlcyBzdWNoIGFzIHdoZXRoZXIgYSBzZXJ2aWNlIChlLmcuIE1vc3F1aXR0bykg
aXMgcmVhZHkgKGluIHdoaWNoIGNhc2Ugc3lzdGVtZCB3aWxsIHRyYW5zaXRpb24gdGhlIHN0YXR1
cyB0byBzdGFydGVkKS4KPiBUaGlzIHNvY2tldCBpcyBvd25lZCBieSByb290IGFuZCB0aGUgcGVy
bWlzc2lvbiBzZXQgaXMgNzc3LiBBbHNvLCBNb3NxdWl0dG8ncyBBcHBBcm1vciBwcm9maWxlIGFs
bG93cyB3cml0ZSBhY2Nlc3MgdG8gdGhpcyBzb2NrZXQuCj4gCj4gV2l0aCB0aGVzZSBzZXR0aW5n
LCBldmVyeXRoaW5nIGlzIHdvcmtpbmcgZmluZS4gTm8gRGVueS1tZXNzYWdlcyBpbiBhdWRpdGQg
YmVjYXVzZSBvZiBBcHBBcm1vci4gVGhlIE1vc3F1aXR0byBzZXJ2aWNlIGNvdWxkIHJlcG9ydCBo
aXMgc3RhdHVzIHRvIHRoZSBzb2NrZXQgYW5kIHN5c3RlbWQgc2hvd3MgaXQgd2hlbiB1c2luZyBz
eXN0ZW1jdGwgc3RhdHVzIG1vc3F1aXR0by5zZXJ2aWNlLgo+IAo+IEZvciBteSBsYXN0IHN0ZXAs
IHVzaW5nIHN5c3RlbWQgc2FuZGJveGluZyBhbmQgc2VjdXJpdHkgaGFyZGVuaW5nIGRpcmVjdGl2
ZXMsIEkgYWRkZWQgdGhlIGRpcmVjdGl2ZSBQcm90ZWN0SG9tZT15ZXMgKHNlZcKgaHR0cHM6Ly93
d3cuZnJlZWRlc2t0b3Aub3JnL3NvZnR3YXJlL3N5c3RlbWQvbWFuL3N5c3RlbWQuZXhlYy5odG1s
I1Byb3RlY3RIb21lPSkgdG8gTW9zcXVpdHRvJ3MgdW5pdCBmaWxlIGFuZCByZXN0YXJ0ZWQgdGhl
IHNlcnZpY2UuIE5vdywgYXVkaXRkIGxvZ3MgYSBkZW5pZWQgbWVzc2FnZSBmcm9tIEFwcEFybW9y
IGZvciB0aGUgTW9zcXVpdHRvIGJpbmFyeSBmb3IgL3J1bi9zeXN0ZW1kL25vdGlmeSBhbmQgc3lz
dGVtZCBkb2VzIG5vdCB1cGRhdGUgdGhlIHN0YXR1cyBvZiB0aGUgTW9zcXVpdHRvIHNlcnZpY2Uu
Cj4gCj4gU2VlIHRoZSBrZXJuZWwgbWVzc2FnZSBvdXRwdXQ6IFs2NDQuMTE4OTg0XSBhdWRpdDog
dHlwZT0xNDAwIGF1ZGl0KDE2MzU5NDUyNDcuNTkxOjMzKTogYXBwYXJtb3I9IkRFTklFRCIgb3Bl
cmF0aW9uPSJzZW5kbXNnIiBpbmZvPSJGYWlsZWQgbmFtZSBsb29rdXAgLSBkaXNjb25uZWN0ZWQg
cGF0aCIgZXJyb3I9LTEzIHByb2ZpbGU9Ii91c3Ivc2Jpbi9tb3NxdWl0dG8iIG5hbWU9InJ1bi9z
eXN0ZW1kL25vdGlmeSIgcGlkPTQ1MiBjb21tPSJtb3NxdWl0dG8iIHJlcXVlc3RlZF9tYXNrPSJ3
IiBkZW5pZWRfbWFzaz0idyIgZnN1aWQ9MTA3IG91aWQ9MAo+IAo+IFdoYXQgSSBmb3VuZCBvdXQg
c28gZmFyOiBXaGVuIFByb3RlY3RIb21lIGlzIGFjdGl2YXRlZCwgc3lzdGVtZCBzdGFydHMgdGhl
IGJpbmFyeSBpbiBhIG5ldyBtb3VudCBuYW1lc3BhY2UuIFdoZW4gc3RhcnRlZCBpbiB0aGlzIG1v
dW50IG5hbWVzcGFjZSwgQXBwQXJtb3IgZGVuaWVzIGFjY2Vzcywgb3RoZXJ3aXNlIG5vdC4KCkFz
IHlvdSBmb3VuZCBvdXQsIHVzaW5nIHN5c3RlbWQgbW91bnQgbmFtZXNwYWNlIGZlYXR1cmVzIGNh
dXNlcyB0aG9zZSAKImRpc2Nvbm5lY3RlZCBwYXRoIiBkZW5pYWxzLiBBRkFJSywgdGhlIGN1cnJl
bnQgd29ya2Fyb3VuZCBpcyB0byBzZXQgdGhlIAoiYXR0YWNoX2Rpc2Nvbm5lY3RlZCIgZmxhZyBs
aWtlIHRoaXM6Cgpwcm9maWxlIG1vc3F1aXR0byAvdXNyL3NiaW4vbW9zcXVpdHRvIGZsYWdzPShh
dHRhY2hfZGlzY29ubmVjdGVkKSB7CiAgIC4uLgp9CgpUaGlzIGlzIGdlbmVyYWxseSBub3QgZGVz
aXJhYmxlIGR1ZSB0byB0aGUgc2VjdXJpdHkgaW1wbGljYXRpb25zIGFzIApleHBsYWluZWQgaW4g
aHR0cHM6Ly9naXRsYWIuY29tL2FwcGFybW9yL2FwcGFybW9yLy0vaXNzdWVzLzEyNS4gVGhlcmUg
aXMgCkFGQUlLIG5vIG90aGVyIHdheSB0byBnZXQgbW91bnQgbmFtZXNwYWNlcyBhbmQgQXBwYXJt
b3Igc28gSSB1c2UgdGhvc2UgCm1vcmUgb2Z0ZW4gdGhlbiBub3QuCgpIVEgsClNpbW9uCgoKLS0g
CkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBz
ZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxt
YW4vbGlzdGluZm8vYXBwYXJtb3IK
