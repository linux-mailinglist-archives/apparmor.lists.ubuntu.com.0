Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 580992BC6F
	for <lists+apparmor@lfdr.de>; Tue, 28 May 2019 02:11:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hVPiO-0006xg-PM; Tue, 28 May 2019 00:11:40 +0000
Received: from secure.zestysoft.com ([63.205.203.253])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@zestysoft.com>) id 1hVPiN-0006xZ-5D
 for apparmor@lists.ubuntu.com; Tue, 28 May 2019 00:11:39 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by secure.zestysoft.com (Postfix) with ESMTP id B8E2DADC00F
 for <apparmor@lists.ubuntu.com>; Mon, 27 May 2019 17:11:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com B8E2DADC00F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559002296;
 bh=SmSZH8y+VU7Bt0DSN7Uzol6wYMG8+Ek8crpxaS7wvZE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=e+Ir1dJs+YgcRZJMWX7RaHZLmON7gNBa3pvggln/fiiq79PDzNlSlA22v/QMib5yh
 2HuZYHeVH0r9c2K4NJMaV16I2TZ56dGIp9a+T7upneggyWCAKXw9ieSnPxY1zuhCit
 21AtAE0kRgGw9n7RoG3oMdBl5W9ExRFqDwaxnQpA=
X-Virus-Scanned: amavisd-new at zestysoft.com
Received: from secure.zestysoft.com ([127.0.0.1])
 by localhost (secure.zestysoft.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afrJBYnL2Pdx for <apparmor@lists.ubuntu.com>;
 Mon, 27 May 2019 17:11:35 -0700 (PDT)
Received: from [172.20.3.88] (unknown [4.79.43.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by secure.zestysoft.com (Postfix) with ESMTPSA id 35825ADC00E
 for <apparmor@lists.ubuntu.com>; Mon, 27 May 2019 17:11:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com 35825ADC00E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559002295;
 bh=SmSZH8y+VU7Bt0DSN7Uzol6wYMG8+Ek8crpxaS7wvZE=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=uEnFU/Klvv3sNxm6PDLm4YEuwA4ZHV3tcejIUQwlSq2eLHhbmwDffdMrEjiQcGoYn
 afqww7vF85zZVkev+YZcYbYjVIK2x4gWjk/3lLYhoPCOTGimIvWFc7JqC8qwrgfh3w
 mrid0Y45cH/wbixaONdytKFJMQYRVZqiLjUlHHyg=
To: apparmor@lists.ubuntu.com
References: <7979059d-044a-3f1a-83f9-8254a8a51daa@zestysoft.com>
 <20190525001053.GB6058@hunt>
 <734c73ce-1e25-cc3a-ed3d-7edae3ee94fc@canonical.com>
 <77776c98-473e-eb98-2fe6-c29a1bfa7e28@zestysoft.com>
From: Ian <apparmor@zestysoft.com>
Message-ID: <859df47c-6c0d-0be4-4590-6b05ce0fd0a0@zestysoft.com>
Date: Mon, 27 May 2019 17:11:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <77776c98-473e-eb98-2fe6-c29a1bfa7e28@zestysoft.com>
Content-Language: en-US
Subject: Re: [apparmor] Attempting FullSystemPolicy with Ubuntu 18.04.2
	LTS...
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

Ck9uIDUvMjcvMTkgMTI6MDggUE0sIElhbiB3cm90ZToKPgo+IERvZXMgYXBwYXJtb3IgaGF2ZSB0
aGUgc2FtZSBwcm9ibGVtIGFzIHNlbGludXggd2hlcmUgdGhlcmUgYXJlIAo+ICJzZWN1cml0eSBh
d2FyZSIgcHJvZ3JhbXMgdGhhdCBkb24ndCBwcm9wZXJseSBob25vciBlbmZvcmNlbWVudCAKPiBz
ZXR0aW5ncywgb3IgaXMgdGhpcyBhbiBpbmhlcml0YW5jZSBwcm9ibGVtIHRoYXQgSSdtIG5vdCBj
b3JyZWN0bHkgCj4gYWRkcmVzc2luZz8KPgo+Cj4KQWRkaW5nICJhdHRhY2hfZGlzY29ubmVjdGVk
IiB0byB0aGUgZmxhZ3MgcGFyYW1ldGVyIG9mIHRoZSBpbml0LXN5c3RlbWQgCnByb2ZpbGUgd2Fz
IHJlcXVpcmVkIHRvIGdldCB0aGUgc3lzdGVtIHRvIGZ1bGx5IGJvb3QuwqAgSSBhc3N1bWUgdGhp
cyB3YXMgCm5lY2Vzc2FyeSBiZWNhdXNlIG9mIHRoZSB0cmFuc2l0aW9uIGZyb20gaW5pdHJhbWZz
LCBob3dldmVyIHRoZSAKIkFMTE9XRUQiIGF1ZGl0IGxvZyBlbnRyaWVzIHJlYWxseSB0aHJldyBt
ZSB0aGVyZSAtLSB0aGF0IGFuZCBteSBhYmlsaXR5IAp0byBydW4gbG90cyBvZiBvdGhlciBjb21t
YW5kcyB3aXRob3V0IGlzc3VlIGluIHRoYXQgImVtZXJnZW5jeSIgbW9kZSAKZGlkbid0IG1ha2Ug
dGhpcyBhbiBvYnZpb3VzIGZpeC4KClRoaXMgaW5pdHJhbWZzIHRyYW5zaXRpb24gaXMgYSB0cmlj
a3kgYml0IG9mIGJ1c2luZXNzIC0tIEkgYXNzdW1lIEknbGwgCndhbnQgdG8gaGF2ZSBhIGRpZmZl
cmVudCBwcm9maWxlIGZvciBzeXN0ZW1kIGZvciB0aGUgY2hyb290ZWQgc3lzdGVtIGFuZCAKdGhh
dCB3aGVuIHRoZSBhcHBhcm1vciBzZXJ2aWNlIHN0YXJ0cywgdGhlIHByb2ZpbGUgd2lsbCBnZXQg
cmVwbGFjZWQsIApob3dldmVyIEkgdGhvdWdodCB0aGF0IHByb2ZpbGUgY2hhbmdlcyBsaWtlIHRo
aXMgYXJlbid0IHNlZW4gYnkgCmN1cnJlbnRseSBleGVjdXRpbmcgcHJvY2Vzc2VzIC0tIG9uZSBo
YXMgdG8gcmVzdGFydCB0aGUgcHJvY2VzcyBmb3IgdGhlIApjaGFuZ2UgdG8gdGFrZSBlZmZlY3Q/
wqAgVGhlbiB0aGVyZSdzIHRoZSB0aW1pbmcgb2Ygd2hlbiBqb3VybmFsZCBhbmQgCmF1ZGl0ZCBz
dGFydHMuwqAgSWRlYWxseSBJJ2QgbGlrZSB0byBrZWVwIHRoZSBmdWxsLXBlcm1pc3Npb24gcHJv
ZmlsZSBJIApzZXQgdXAgaW4gaW5pdHRhbWZzIGZvciBzeXN0ZW1kLCBidXQgdGhlbiBzb21laG93
IGRlbnkgYW55IHR5cGUgb2YgCmluaGVyaXRhbmNlIG9uY2UgdGhlIEFwcEFybW9yIHNlcnZpY2Ug
c3RhcnRzLgoKQW55IGFkdmljZSBvbiBob3cgdG8gcHJvY2VlZD8gLS0gSWYgaXQgaXMgdHJ1ZSB0
aGF0IGFsbCBjaGlsZCBwcm9jZXNzZXMgCndpbGwsIGJ5IGRlZmF1bHQsIGluaGVyaXQgdGhlIHBl
cm1pc3Npb25zIGZyb20gdGhlIGluaXQtc3lzdGVtZCBwcm9maWxlIAp1bmxlc3MgSSBhZGQgZGVu
eSBydWxlcyAtLSBJJ20gYmFjayBhdCBzcXVhcmUgb25lIHdpdGggYSBibGFja2xpc3Qgc2V0dXAu
CgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1v
ZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29t
L21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
