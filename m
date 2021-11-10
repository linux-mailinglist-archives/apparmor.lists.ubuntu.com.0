Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id AB08344CB1E
	for <lists+apparmor@lfdr.de>; Wed, 10 Nov 2021 22:13:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mkuu7-00083U-R0; Wed, 10 Nov 2021 21:13:11 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mkuu7-00083N-2l
 for apparmor@lists.ubuntu.com; Wed, 10 Nov 2021 21:13:11 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 8157F3F191; 
 Wed, 10 Nov 2021 21:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636578790;
 bh=d0wL+HGMwb10Gfvr1VNJQ8I1fQMg+3gZonyIa8o6LUM=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=jZ4ijNlMTpMG6HyQdWoVF1cdvO7h019aEEXlfJDZEC3LSVEBpkcf/Xdx1zLS4WRDl
 fLMKOpUAgyIimcqQ0ELphJLR7FpHeNjsv6k3rJPcUgkz47rnJOkcp9HFvCsSD3oSus
 DDikUgqoNCp2/lNSrrrmT24jCpiUpanPXqCgbrPjEzu77eGbu/XW4i257AZDLK5hs+
 7uV+Wbt9EAVdvhnvza8/PzOoiBPwjvIvbfzYkVPj/KzFpOvT1HMIqycHgUvQfXKboK
 CXSEhvFGt/V0OnfWqtZDhdYoKC44sKecSEM+Fntd0WUPC568d0FUWE98isQxqxUCfP
 Wtje2LWMk1qgw==
To: Simon Deziel <simon@sdeziel.info>, apparmor@lists.ubuntu.com
References: <trinity-948dd7ea-0e1b-4b22-92b7-b14d8f98ac02-1636452351170@3c-app-gmx-bs45>
 <8d4ec75d-3df3-6573-6a9f-605695a8beac@sdeziel.info>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <bf718360-1c0b-5d3e-ba97-4e60ac27a040@canonical.com>
Date: Wed, 10 Nov 2021 13:13:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8d4ec75d-3df3-6573-6a9f-605695a8beac@sdeziel.info>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gMTEvMTAvMjEgMTI6MjUgUE0sIFNpbW9uIERlemllbCB3cm90ZToKPiBIaSBDZWRyaWMsCj4g
Cj4gT24gMjAyMS0xMS0wOSAwNTowNSwgQ2VkcmljIE3DvGxsZXIgd3JvdGU6Cj4+IEhpLAo+Pgo+
PiBpbiB0aGUgbGFzdCB3ZWVrcywgSSB0cmllZCB0byBmaW5kIGEgY29uZmlndXJhdGlvbiBzZXQg
dG8gaGFyZGVuIHRoZSBNUVRUIG1lc3NhZ2UgYnJva2VyIE1vc3F1aXR0by4gVGhlcmVmb3JlLCBJ
IHdhbnQgdG8gdXNlIHByb3Blcmx5IGNvbmZpZ3VyZWQgcGVybWlzc2lvbnMgZm9yIGRpc2NyZXRp
b25hcnkgYWNjZXNzIGNvbnRyb2wgYW5kIGFuIEFwcEFybW9yIHByb2ZpbGUgZm9yIG1hbmRhdG9y
eSBhY2Nlc3MgY29udHJvbC4gSW4gYWRkaXRpb24sIEkgd2FudCB0byBhcHBseSBzeXN0ZW1kIHNh
bmRib3hpbmcgYW5kIHNlY3VyaXR5IGhhcmRlbmluZyBkaXJlY3RpdmVzIHRvIGNvbXBsZXRlIHRo
ZSBjb25maWd1cmF0aW9uIHNldC4KPj4KPj4gRm9yIG1vcmUgY29udGV4dDogU3lzdGVtZCBwcm92
aWRlcyBhIHNvY2tldCAvcnVuL3N5c3RlbWQvbm90aWZ5LCB3aGVyZSBpdCBsaXN0ZW5zIGZvciBt
ZXNzYWdlcyBzdWNoIGFzIHdoZXRoZXIgYSBzZXJ2aWNlIChlLmcuIE1vc3F1aXR0bykgaXMgcmVh
ZHkgKGluIHdoaWNoIGNhc2Ugc3lzdGVtZCB3aWxsIHRyYW5zaXRpb24gdGhlIHN0YXR1cyB0byBz
dGFydGVkKS4KPj4gVGhpcyBzb2NrZXQgaXMgb3duZWQgYnkgcm9vdCBhbmQgdGhlIHBlcm1pc3Np
b24gc2V0IGlzIDc3Ny4gQWxzbywgTW9zcXVpdHRvJ3MgQXBwQXJtb3IgcHJvZmlsZSBhbGxvd3Mg
d3JpdGUgYWNjZXNzIHRvIHRoaXMgc29ja2V0Lgo+Pgo+PiBXaXRoIHRoZXNlIHNldHRpbmcsIGV2
ZXJ5dGhpbmcgaXMgd29ya2luZyBmaW5lLiBObyBEZW55LW1lc3NhZ2VzIGluIGF1ZGl0ZCBiZWNh
dXNlIG9mIEFwcEFybW9yLiBUaGUgTW9zcXVpdHRvIHNlcnZpY2UgY291bGQgcmVwb3J0IGhpcyBz
dGF0dXMgdG8gdGhlIHNvY2tldCBhbmQgc3lzdGVtZCBzaG93cyBpdCB3aGVuIHVzaW5nIHN5c3Rl
bWN0bCBzdGF0dXMgbW9zcXVpdHRvLnNlcnZpY2UuCj4+Cj4+IEZvciBteSBsYXN0IHN0ZXAsIHVz
aW5nIHN5c3RlbWQgc2FuZGJveGluZyBhbmQgc2VjdXJpdHkgaGFyZGVuaW5nIGRpcmVjdGl2ZXMs
IEkgYWRkZWQgdGhlIGRpcmVjdGl2ZSBQcm90ZWN0SG9tZT15ZXMgKHNlZcKgaHR0cHM6Ly93d3cu
ZnJlZWRlc2t0b3Aub3JnL3NvZnR3YXJlL3N5c3RlbWQvbWFuL3N5c3RlbWQuZXhlYy5odG1sI1By
b3RlY3RIb21lPSkgdG8gTW9zcXVpdHRvJ3MgdW5pdCBmaWxlIGFuZCByZXN0YXJ0ZWQgdGhlIHNl
cnZpY2UuIE5vdywgYXVkaXRkIGxvZ3MgYSBkZW5pZWQgbWVzc2FnZSBmcm9tIEFwcEFybW9yIGZv
ciB0aGUgTW9zcXVpdHRvIGJpbmFyeSBmb3IgL3J1bi9zeXN0ZW1kL25vdGlmeSBhbmQgc3lzdGVt
ZCBkb2VzIG5vdCB1cGRhdGUgdGhlIHN0YXR1cyBvZiB0aGUgTW9zcXVpdHRvIHNlcnZpY2UuCj4+
Cj4+IFNlZSB0aGUga2VybmVsIG1lc3NhZ2Ugb3V0cHV0OiBbNjQ0LjExODk4NF0gYXVkaXQ6IHR5
cGU9MTQwMCBhdWRpdCgxNjM1OTQ1MjQ3LjU5MTozMyk6IGFwcGFybW9yPSJERU5JRUQiIG9wZXJh
dGlvbj0ic2VuZG1zZyIgaW5mbz0iRmFpbGVkIG5hbWUgbG9va3VwIC0gZGlzY29ubmVjdGVkIHBh
dGgiIGVycm9yPS0xMyBwcm9maWxlPSIvdXNyL3NiaW4vbW9zcXVpdHRvIiBuYW1lPSJydW4vc3lz
dGVtZC9ub3RpZnkiIHBpZD00NTIgY29tbT0ibW9zcXVpdHRvIiByZXF1ZXN0ZWRfbWFzaz0idyIg
ZGVuaWVkX21hc2s9InciIGZzdWlkPTEwNyBvdWlkPTAKPj4KPj4gV2hhdCBJIGZvdW5kIG91dCBz
byBmYXI6IFdoZW4gUHJvdGVjdEhvbWUgaXMgYWN0aXZhdGVkLCBzeXN0ZW1kIHN0YXJ0cyB0aGUg
YmluYXJ5IGluIGEgbmV3IG1vdW50IG5hbWVzcGFjZS4gV2hlbiBzdGFydGVkIGluIHRoaXMgbW91
bnQgbmFtZXNwYWNlLCBBcHBBcm1vciBkZW5pZXMgYWNjZXNzLCBvdGhlcndpc2Ugbm90Lgo+IAo+
IEFzIHlvdSBmb3VuZCBvdXQsIHVzaW5nIHN5c3RlbWQgbW91bnQgbmFtZXNwYWNlIGZlYXR1cmVz
IGNhdXNlcyB0aG9zZSAiZGlzY29ubmVjdGVkIHBhdGgiIGRlbmlhbHMuIEFGQUlLLCB0aGUgY3Vy
cmVudCB3b3JrYXJvdW5kIGlzIHRvIHNldCB0aGUgImF0dGFjaF9kaXNjb25uZWN0ZWQiIGZsYWcg
bGlrZSB0aGlzOgo+IAo+IHByb2ZpbGUgbW9zcXVpdHRvIC91c3Ivc2Jpbi9tb3NxdWl0dG8gZmxh
Z3M9KGF0dGFjaF9kaXNjb25uZWN0ZWQpIHsKPiDCoCAuLi4KPiB9Cj4gCj4gVGhpcyBpcyBnZW5l
cmFsbHkgbm90IGRlc2lyYWJsZSBkdWUgdG8gdGhlIHNlY3VyaXR5IGltcGxpY2F0aW9ucyBhcyBl
eHBsYWluZWQgaW4gaHR0cHM6Ly9naXRsYWIuY29tL2FwcGFybW9yL2FwcGFybW9yLy0vaXNzdWVz
LzEyNS4gVGhlcmUgaXMgQUZBSUsgbm8gb3RoZXIgd2F5IHRvIGdldCBtb3VudCBuYW1lc3BhY2Vz
IGFuZCBBcHBhcm1vciBzbyBJIHVzZSB0aG9zZSBtb3JlIG9mdGVuIHRoZW4gbm90Lgo+IAoKY29y
cmVjdC4gV2UgYXJlIHdvcmtpbmcgb24gZml4ZXMvaW1wcm92ZW1lbnRzIGJ1dCB0aGV5IGFyZSBu
b3QgYXZhaWxhYmxlIHlldC4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlz
dHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8v
bGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
