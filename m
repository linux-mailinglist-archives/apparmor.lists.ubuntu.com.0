Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5799E3C752E
	for <lists+apparmor@lfdr.de>; Tue, 13 Jul 2021 18:45:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1m3LWq-0004Bv-7H; Tue, 13 Jul 2021 16:45:04 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1m3LWo-0004Ai-Ix
 for apparmor@lists.ubuntu.com; Tue, 13 Jul 2021 16:45:02 +0000
Received: from [192.168.192.153] (unknown [50.53.41.238])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 76F2D40616; 
 Tue, 13 Jul 2021 16:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626194701;
 bh=+wL0ZA101JE04fN0Hse/s2THwloZZWi/srqWaVye9EU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
 b=FjwB3yt2TEB8842940iLl88wId1/u9x15q2b41lAWrHC+cPNkVO6loTGndVajDpYH
 BYLi2lIgyajQ+rpaEvLfoaszJ/OsVaqnolR1tcJhlR20b7MZgHCkYHPJyBEZ5+Je9J
 31QYQAJ41nb3WZea+nLCadYz7yXy+aOCjvY3FyYPRxDddyJ+UKKS0v3e+KkVWxT7UR
 lWcZt9gUsyXculEl/UGN6bjcCdScBD6AYcnEZDubOSxc5x0GFrHdGqJ/kV58yd+oWO
 DcAphN9pVy0CsHkhS4kCAgHOT3H55RCPEohrptvXxao/b2UdQyiw9gDpW73cLgdpNA
 U2rTzKv1v9U9w==
To: swarna latha <sswarnas@gmail.com>, apparmor@lists.ubuntu.com
References: <CAJs3c4ycmJ-7QPHBSFOET+gomO4Svd953ELRs8s=T=f9L5xPUA@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <ed6f1cb2-ad9f-dafa-bd96-95bae77cb7db@canonical.com>
Date: Tue, 13 Jul 2021 09:44:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJs3c4ycmJ-7QPHBSFOET+gomO4Svd953ELRs8s=T=f9L5xPUA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [apparmor] Regarding apparmor logging
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

T24gNy8xMy8yMSA4OjI5IEFNLCBzd2FybmEgbGF0aGEgd3JvdGU6Cj4gSGksCj4gCj4gSSB3b3Vs
ZCBsaWtlIHRvIHJlZGlyZWN0IHRoZSBhcHBhcm1vciBsb2dzIGZyb20gam91cm5hbGN0bCB0byBt
eSBsb2cgZmlsZSwgc28gdGhhdCBpCj4gZ2V0IG9ubHkgYXBwYXJtb3IgbG9ncywgaSBjYW4gYWN0
IG9uLgo+IAo+IENhbiB5b3UgcGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueSBjb25m
aWcgb3B0aW9uIGZvciB0aGlzLCBvciBwb2ludCBtZSB0byB0aGUgY29kZSB3aGVyZSBJIGNhbiBz
cGVjaWZ5IG15IGxvZyBmaWxlLgo+IAoKYXBwYXJtb3IgdXNlcyB0aGUga2VybmVsIGF1ZGl0IHN1
YnN5c3RlbS4gSWYgeW91IGluc3RhbGwgYXVkaXRkIGl0cyBtZXNzYWdlcyB3aWxsIGdvIHRocm91
Z2ggYXVkaXRkIGFuZCB5b3Ugd291bGQgY29uZmlndXJlIGZpbHRlcmluZyBydWxlcyB0aGVyZS4g
SWYgeW91IGFyZSBub3QgdXNpbmcgYXVkaXRkIHRoZW4gdGhlIG1lc3NhZ2VzIHdpbGwgZ28gdGhy
b3VnaCB0aGUga2VybmVsIGRtZXNnIGJ1ZmZlciBhbmQgYmUgcGlja2VkIHVwIGFzIHBhcnQgb2Yg
dGhlIGtlcm5lbCBsb2cuIEluIHRoaXMgY2FzZSB5b3Ugd2lsbCBuZWVkIHRvIGNvbmZpZ3VyZSB5
b3VyIHVzZXJzcGFjZSBhdWRpdCBzeXN0ZW0sIHN5c3RlbWQsIHN5c2xvZywgcnN5c2xvZyAuLi4g
dG8gZmlsdGVyIHRoZSBydWxlcyB0byBhIHNlcGFyYXRlIGZpbGUuIEVhY2ggb2YgdGhlc2Ugc3lz
dGVtcyBhcmUgY2FwYWJsZSBvZiBkb2luZyB0aGlzLCBob3dldmVyIHRoZSBkZXRhaWxzIG9mIGRv
aW5nIGl0IGluIGVhY2ggb25lIGFyZSBkaWZmZXJlbnQuCgoKLS0gCkFwcEFybW9yIG1haWxpbmcg
bGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNj
cmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJt
b3IK
