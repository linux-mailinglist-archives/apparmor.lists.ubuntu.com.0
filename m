Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA740FE0F
	for <lists+apparmor@lfdr.de>; Fri, 17 Sep 2021 18:42:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mRGw3-0006xa-T2; Fri, 17 Sep 2021 16:41:59 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mRGw1-0006xU-Rf
 for apparmor@lists.ubuntu.com; Fri, 17 Sep 2021 16:41:57 +0000
Received: from [192.168.192.153] (unknown [50.45.173.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 4F60D40D50; 
 Fri, 17 Sep 2021 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631896917;
 bh=2V3NaaYzj7jjQ1+2tKiDrmkz9z74a2V0DjhAoy1a6JU=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=R0TnD7lWY3M8kcsDLZhcjWFekJw4NbJ5r3XTPZUTZzUqDi+bwnFWOViZ62Ku29xhh
 RLlyuhMrP23XE6WZVSm1/DL8U9mUuZgkaLoQumt5NCgI34kwAzoamhcluBafkdmJ+6
 NUHfOYxH4yE1CTKUyO4tkbWYg76G8sQYUxbqOccFuffdmSZ1h1K5yvbTHjP2m1kxwt
 c5opn6M6wjhbp7O9ThMhTkdjF5qekz0awTSrfvA3gTRHD0keppKBvFki28DgJMaBL8
 ZrjCaE8t06Z0q+IqUIEJpq0b1ui7EM9ebBKDxfTlbh1VvenddXLGkx2e9lmFJky0sf
 iHSrm/z1NtyKw==
To: =?UTF-8?Q?Michael_Str=c3=b6der?= <michael@stroeder.com>,
 apparmor <apparmor@lists.ubuntu.com>
References: <3609ccf1-0146-1632-6d30-aa68f600bfb7@stroeder.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <20c49947-4091-5b09-5df2-10509aa523c0@canonical.com>
Date: Fri, 17 Sep 2021 09:41:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3609ccf1-0146-1632-6d30-aa68f600bfb7@stroeder.com>
Content-Language: en-US
Subject: Re: [apparmor] config check exceptions
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

T24gOS8xNy8yMSA3OjU3IEFNLCBNaWNoYWVsIFN0csO2ZGVyIHdyb3RlOgo+IEhJIQo+IAo+IEkg
aGF2ZSB0aGUgZm9sbG93aW5nIGFuc2libGUgdGFzayBmb3IgaW5zdGFsbGluZyByc3lzbG9nIGNv
bmZpZyBmaWxlOgo+IAo+IC0gbmFtZTogIkdlbmVyYXRlIHJzeXNsb2cgY29uZmlndXJhdGlvbiIK
PiAgIHRlbXBsYXRlOgo+ICAgICBzcmM6ICJyc3lzbG9nLmNvbmYuajIiCj4gICAgIGRlc3Q6ICIv
ZXRjL3JzeXNsb2cuY29uZiIKPiAgICAgb3duZXI6IHJvb3QKPiAgICAgZ3JvdXA6IHJvb3QKPiAg
ICAgbW9kZTogMG8wNjQ0Cj4gICAgIHZhbGlkYXRlOiAiL3Vzci9zYmluL3JzeXNsb2dkIC1OIDEg
LWYgJXMiCj4gICBub3RpZnk6Cj4gICAgIC0gInJlc3RhcnQgcnN5c2xvZyIKPiAKPiBBcyB5b3Ug
Y2FuIHNlZSB0aGUgYXJndW1lbnQgInZhbGlkYXRlIiBpbnZva2VzIHJzeXNsb2dkIGV4ZWN1dGFi
bGUgdG8KPiBjaGVjayB0aGUgY29uZmlnICpiZWZvcmUqIGluc3RhbGxpbmcgaXQgdG8gdGhlIGZp
bmFsIGRlc3RpbmF0aW9uLgo+ID4gVGhpcyBsZWFkcyB0byB2aW9sYXRpb24gb2YgQXBwQXJtb3Ig
cHJvZmlsZQo+IC9ldGMvYXBwYXJtb3IuZC91c3Iuc2Jpbi5yc3lzbG9nZCBhbHNvIGFwcGxpZWQg
d2hlbiBydW5uaW5nIHRoaXMKPiBleGVjdXRhYmxlIG9ubHkgZm9yIGNvbmZpZyB2YWxpZGF0aW9u
Ogo+IAo+IHR5cGU9QVZDIG1zZz1hdWRpdCgxNjMxODgzNzAzLjA2MTozNjAzKTogYXBwYXJtb3I9
IkRFTklFRCIKPiBvcGVyYXRpb249Im9wZW4iIHByb2ZpbGU9Ii91c3Ivc2Jpbi9yc3lzbG9nZCIK
PiBuYW1lPSIvcm9vdC8uYW5zaWJsZS90bXAvYW5zaWJsZS10bXAtMTYzMTg4MzY5OS41MDM2NzMt
OTQxNi0yNDI3NDYzNzA4Nzk5Njgvc291cmNlIgo+IHBpZD0xMzc2MCBjb21tPSJyc3lzbG9nZCIg
cmVxdWVzdGVkX21hc2s9InIiIGRlbmllZF9tYXNrPSJyIiBmc3VpZD0wIG91aWQ9MAo+IAo+IEJ1
dCBJJ2QgbGlrZSB0byBhdm9pZCBhZGRpbmcgcnVsZXMgdG8gZ3JhbnQgcmVhZCBhY2Nlc3MgdG8K
PiAvcm9vdC8uYW5zaWJsZS90bXAvLgo+IAo+IEFueSBpZGVhIGhvdyB0byBkaXNhYmxlIHRoZSBB
cHBBcm1vciBwcm9maWxlIG9ubHkgaW4gY2FzZSBvZiB0aGlzIGNvbmZpZwo+IGNoZWNrPwo+IAoK
U28gSSB0aGluayBhbGwgeW91IG5lZWQgdG8gZG8gaXMgY3JlYXRlIGEgc2Vjb25kYXJ5IHByb2Zp
bGUsIGxldHMgY2FsbCBpdApyc3lzbG9nZC1jb25maWdjaGVjay4gR2l2ZSBpdCBhbGwgdGhlIHNh
bWUgcnVsZXMgYXMgdGhlIHJzeXNsb2dkIHByb2ZpbGUgYW5kIHRoZQpleHRyYSBydWxlIHRvIGFs
bG93IGFjY2VzcyB0byAvcm9vdC8uYW5zaWJsZS90bXAvCgpNYWtlIHN1cmUgdGhlIG5ldyBwcm9m
aWxlIGlzIGxvYWRlZC4gTm93IHlvdSBjYW4gc3RhcnQgcnN5c2xvZ2QgdXNpbmcgYWEtZXhlYyB0
bwpwdXQgaXQgaW4gdGhlIGFsdGVybmF0ZSBwcm9maWxlCgogIGFhLWV4ZWMgLXAgcnN5c2xvZy1j
b25maWdjaGVjayAtLSAvdXNyL3NiaW4vcnN5c2xvZ2QgLU4xIC1mICVzCgoKCi0tIApBcHBBcm1v
ciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mg
b3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2FwcGFybW9yCg==
