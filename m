Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C4B4A32AF
	for <lists+apparmor@lfdr.de>; Sun, 30 Jan 2022 00:52:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nDxW6-00031t-9L; Sat, 29 Jan 2022 23:52:26 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nDxW5-00031m-En
 for apparmor@lists.ubuntu.com; Sat, 29 Jan 2022 23:52:25 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C36A641971; 
 Sat, 29 Jan 2022 23:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643500345;
 bh=mT/KhkttC35PJHSkS9845Gejq1lZjfsHSpks2UTTVX0=;
 h=Message-ID:Date:MIME-Version:Subject:From:To:References:
 In-Reply-To:Content-Type;
 b=wStvCEI6gQ86rxOGJMih05cEG8UHGP+UI4EcyHk3HazK/I51xUMAE69dI00SYo85k
 jLYM3yD4n2/8vcvVE94bMuze9CvTD9VHnPc1S2G0TD7KV5BcWdWg8PVK3QXrxWpb9S
 V/CdScd+fAt+PLdQhVzihQsMNtG8dxJtXVz3TEHpII0Q62nguo4Y9P/3z4uybKz123
 Qvw9HOO1laMj1M6BH2Bsu4lwEcRYMEdx+uhylDrskiC5euy2GtTE7yuaqbWclJmbAK
 aD0ZyxYquRKrc8rQOj+N+qXPMUScvN4RerXA0tJGF0YXyBIx2WvxfEb72/YwoOC092
 4czeFTlR6fcAw==
Message-ID: <b342c672-702c-d38a-004a-651151a01899@canonical.com>
Date: Sat, 29 Jan 2022 15:52:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
To: me@beroal.in.ua, apparmor@lists.ubuntu.com
References: <20220108175102.GA316223@fladday.local>
 <ecb22823-4145-ef3f-24a5-dfe3bacbdacd@canonical.com>
 <63cf6cab-9c0f-bffe-1763-78d7f24a8835@beroal.in.ua>
 <e1f9a749-ca94-e607-6300-0f9f3ca2f7ec@canonical.com>
Organization: Canonical
In-Reply-To: <e1f9a749-ca94-e607-6300-0f9f3ca2f7ec@canonical.com>
Subject: Re: [apparmor] loading a user version of a profile in place of the
 system profile
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

T24gMS8yOS8yMiAxNDo0OCwgSm9obiBKb2hhbnNlbiB3cm90ZToKPiBPbiAxLzI5LzIyIDA1OjE4
LCBtZUBiZXJvYWwuaW4udWEgd3JvdGU6Cj4+IEhpLiBXaWxsIGl0IGJlIGFubm91bmNlZCBvbiB0
aGlzIG1haWxpbmcgbGlzdCB3aGVuIHRoZSB1c2VyIHBvbGljeSBmZWF0dXJlIGhhcyBsYW5kZWQ/
IEknbSBpbnRlcmVzdGVkIHRvby4gSSBkaWRuJ3QgZXZlbiBrbm93IHRoYXQgb3JkaW5hcnkgdXNl
cnMgbWF5IGNyZWF0ZSB0aGVpciBvd24gcHJvZmlsZXMuCj4+Cj4gWWVzIGl0IHdpbGwgZ2V0IGFu
bm91bmNlZCwgaW4gcmVsZWFzZSBhbm5vdW5jZW1lbnRzIHRoYXQgZ28gdG8gdGhlIG1haWxpbmcg
bGlzdCwgd2ViIHNpdGUsIGFuZCB0d2l0dGVyLiBBdCB0aGUgbW9tZW50IG9yZGluYXJ5IHVzZXJz
IGNhbid0IGJ1dCB0aGF0IGlzIHRoZSBnb2FsLiBJdCB3aWxsIGJlIGNvbnRyb2xsZWQgKHNvIHN5
c3RlbSB3aWxsIGhhdmUgdG8gYmUgY29uZmlndXJlZCB0byBhbGxvdyBpdCkgYW5kIHdpbGwgYmUg
c3RhY2tlZCB3aXRoIHN5c3RlbSBwb2xpY3kgc28gYm90aCB3aWxsIGJlIGVuZm9yY2VkIGF0IHRo
ZSBzYW1lIHRpbWUuIE9idmlvdXNseSBpdCB3b24ndCBhbGxvdyBvdmVycmlkaW5nIG9yIGJ5cGFz
c2luZyBzeXN0ZW0gcG9saWN5Lgo+IAoKVG8gYmUgY2xlYXIsIHRoaXMgaXMgYSB3aXAgYW5kIHRo
ZXJlIGlzIHN0aWxsIGEgbG90IG9mIHdvcmsgdG8gYmUgZG9uZSBiZWZvcmUgdGhpcyBjYW4gbGFu
ZC4gSXQgd2lsbCBiZSByb2xsZWQgb3V0IGluIHBoYXNlcywgd2hlcmUgaXRzIGZpcnN0IHJlbGVh
c2Ugd2lsbCBiZSBmYWlybHkgYmFyZSBib25lcywgYW5kIHByb2JhYmx5IG5vdCBmb3IgZ2VuZXJh
bCBjb25zdW1wdGlvbiAodGhpbmsgb2YgaXQgYXMgYSBwcmV2aWV3KS4KCgotLSAKQXBwQXJtb3Ig
bWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9y
IHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5m
by9hcHBhcm1vcgo=
