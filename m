Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id F305B4A326B
	for <lists+apparmor@lfdr.de>; Sat, 29 Jan 2022 23:48:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nDwWC-00076V-3s; Sat, 29 Jan 2022 22:48:28 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nDwWA-00076O-1Q
 for apparmor@lists.ubuntu.com; Sat, 29 Jan 2022 22:48:26 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 8272F40E51; 
 Sat, 29 Jan 2022 22:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643496503;
 bh=0s1/K/1DLA6TYsBYuyy2neEkUdk+K2v/hkr++Js1UuA=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=LVYardQaSIwaUjazR73bPaMdar0HI/IxUyPLgrI35tgxb95LPxKkT+/6dMSDMTRMP
 Os7soHIxKXh/kHy9RzgoukCHT7jK0ylwUSyCtO5qQB90zCUSiZuTTNrtSH4WbC0MQf
 FKZs90pF2gy4+04eS3Wu2mAX4v7cR92wfqmY8HRdYyjlQqGeEtSI/rsvHogQIX+JVw
 0J2Gn3oPJMtMuAQ9h4ZxRsTUc25ptq/SK7s4owO2jAZXdwAMRCIpWtepeov5UQlQTC
 9L5GcLa0FX6AyeiX/Snxrpnx0stc6oR6Qz0fMizt5HH/hoGtgW3P2/TS4Lkk2nS+eJ
 wgMR8voVs8Suw==
Message-ID: <e1f9a749-ca94-e607-6300-0f9f3ca2f7ec@canonical.com>
Date: Sat, 29 Jan 2022 14:48:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: me@beroal.in.ua, apparmor@lists.ubuntu.com
References: <20220108175102.GA316223@fladday.local>
 <ecb22823-4145-ef3f-24a5-dfe3bacbdacd@canonical.com>
 <63cf6cab-9c0f-bffe-1763-78d7f24a8835@beroal.in.ua>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <63cf6cab-9c0f-bffe-1763-78d7f24a8835@beroal.in.ua>
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

T24gMS8yOS8yMiAwNToxOCwgbWVAYmVyb2FsLmluLnVhIHdyb3RlOgo+IEhpLiBXaWxsIGl0IGJl
IGFubm91bmNlZCBvbiB0aGlzIG1haWxpbmcgbGlzdCB3aGVuIHRoZSB1c2VyIHBvbGljeSBmZWF0
dXJlIGhhcyBsYW5kZWQ/IEknbSBpbnRlcmVzdGVkIHRvby4gSSBkaWRuJ3QgZXZlbiBrbm93IHRo
YXQgb3JkaW5hcnkgdXNlcnMgbWF5IGNyZWF0ZSB0aGVpciBvd24gcHJvZmlsZXMuCj4gClllcyBp
dCB3aWxsIGdldCBhbm5vdW5jZWQsIGluIHJlbGVhc2UgYW5ub3VuY2VtZW50cyB0aGF0IGdvIHRv
IHRoZSBtYWlsaW5nIGxpc3QsIHdlYiBzaXRlLCBhbmQgdHdpdHRlci4gQXQgdGhlIG1vbWVudCBv
cmRpbmFyeSB1c2VycyBjYW4ndCBidXQgdGhhdCBpcyB0aGUgZ29hbC4gSXQgd2lsbCBiZSBjb250
cm9sbGVkIChzbyBzeXN0ZW0gd2lsbCBoYXZlIHRvIGJlIGNvbmZpZ3VyZWQgdG8gYWxsb3cgaXQp
IGFuZCB3aWxsIGJlIHN0YWNrZWQgd2l0aCBzeXN0ZW0gcG9saWN5IHNvIGJvdGggd2lsbCBiZSBl
bmZvcmNlZCBhdCB0aGUgc2FtZSB0aW1lLiBPYnZpb3VzbHkgaXQgd29uJ3QgYWxsb3cgb3ZlcnJp
ZGluZyBvciBieXBhc3Npbmcgc3lzdGVtIHBvbGljeS4KCgoKCgotLSAKQXBwQXJtb3IgbWFpbGlu
ZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vi
c2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBh
cm1vcgo=
