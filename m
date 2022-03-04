Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 556084CDB30
	for <lists+apparmor@lfdr.de>; Fri,  4 Mar 2022 18:43:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nQBxT-0003Fl-41; Fri, 04 Mar 2022 17:43:15 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nQBxR-0003FX-1T
 for apparmor@lists.ubuntu.com; Fri, 04 Mar 2022 17:43:13 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id F2F3B3F631; 
 Fri,  4 Mar 2022 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646415791;
 bh=WxSWF1u2NPQKV+mi5AwufCkMafXQxphZH+krw9eVlJg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=iOZQpLU2Kog2FFFczm/WOXK3VGs2BHDCCJ7Jx1rXTZRSnHpYhh0qHZxR8ADLHWS/x
 sn6yq8n3cKQj0kpJ4mMqowvWl2hfqroGWZs204Be6okedQpp8nAjRxYQS0UEoxjhOp
 RKxWUEMbyMYEgse21OGfxxdOmHDsAR3SeC2q6dG0XhqvXnYQs5oCsgIfSjJApcfx8n
 pGLgEV6vNE8Y14w/sITMeNYOTcPnNuQvylzuwdeP3R9BzRtJLON/IaX+vQA2+Pbu17
 gbicBOBLcuk0L9HYqjL5Ei0HIuh9Jhe2hP1vbo5VpfHKcJ/nKdQRoqy9cp4GFlz6HD
 i270LoNHFlsNg==
Message-ID: <0ea7559b-8e9f-5c85-87eb-0bcf5fddef10@canonical.com>
Date: Fri, 4 Mar 2022 09:42:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
 mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
References: <20220304052444.C157EC340E9@smtp.kernel.org>
 <217ec524-7ade-7e1f-b81a-4a9a3ff90397@infradead.org>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <217ec524-7ade-7e1f-b81a-4a9a3ff90397@infradead.org>
Subject: Re: [apparmor] mmotm 2022-03-03-21-24 uploaded
 (security/apparmor/policy_unpack.o)
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

T24gMy80LzIyIDA5OjMyLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gCj4gCj4gT24gMy8zLzIyIDIx
OjI0LCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+PiBUaGUgbW0tb2YtdGhlLW1vbWVudCBzbmFwc2hv
dCAyMDIyLTAzLTAzLTIxLTI0IGhhcyBiZWVuIHVwbG9hZGVkIHRvCj4+Cj4+ICAgIGh0dHBzOi8v
d3d3Lm96bGFicy5vcmcvfmFrcG0vbW1vdG0vCj4+Cj4+IG1tb3RtLXJlYWRtZS50eHQgc2F5cwo+
Pgo+PiBSRUFETUUgZm9yIG1tLW9mLXRoZS1tb21lbnQ6Cj4+Cj4+IGh0dHBzOi8vd3d3Lm96bGFi
cy5vcmcvfmFrcG0vbW1vdG0vCj4+Cj4+IFRoaXMgaXMgYSBzbmFwc2hvdCBvZiBteSAtbW0gcGF0
Y2ggcXVldWUuICBVcGxvYWRlZCBhdCByYW5kb20gaG9wZWZ1bGx5Cj4+IG1vcmUgdGhhbiBvbmNl
IGEgd2Vlay4KPj4KPj4gWW91IHdpbGwgbmVlZCBxdWlsdCB0byBhcHBseSB0aGVzZSBwYXRjaGVz
IHRvIHRoZSBsYXRlc3QgTGludXMgcmVsZWFzZSAoNS54Cj4+IG9yIDUueC1yY1kpLiAgVGhlIHNl
cmllcyBmaWxlIGlzIGluIGJyb2tlbi1vdXQudGFyLmd6IGFuZCBpcyBkdXBsaWNhdGVkIGluCj4+
IGh0dHBzOi8vb3psYWJzLm9yZy9+YWtwbS9tbW90bS9zZXJpZXMKPiAKPiBvbiB4ODZfNjQ6Cj4g
Cj4gbGQ6IHNlY3VyaXR5L2FwcGFybW9yL3BvbGljeV91bnBhY2subzogaW4gZnVuY3Rpb24gYGRl
ZmxhdGVfY29tcHJlc3MnOgo+IG1tb3RtLTIwMjItMDMwMy0yMTI0L1g2NC8uLi9zZWN1cml0eS9h
cHBhcm1vci9wb2xpY3lfdW5wYWNrLmM6MTA2OTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgemxp
Yl9kZWZsYXRlX3dvcmtzcGFjZXNpemUnCj4gbGQ6IG1tb3RtLTIwMjItMDMwMy0yMTI0L1g2NC8u
Li9zZWN1cml0eS9hcHBhcm1vci9wb2xpY3lfdW5wYWNrLmM6MTA3NTogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0byBgemxpYl9kZWZsYXRlSW5pdDInCj4gbGQ6IG1tb3RtLTIwMjItMDMwMy0yMTI0L1g2
NC8uLi9zZWN1cml0eS9hcHBhcm1vci9wb2xpY3lfdW5wYWNrLmM6MTA5MjogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgemxpYl9kZWZsYXRlJwo+IGxkOiBtbW90bS0yMDIyLTAzMDMtMjEyNC9YNjQv
Li4vc2VjdXJpdHkvYXBwYXJtb3IvcG9saWN5X3VucGFjay5jOjExMjI6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYHpsaWJfZGVmbGF0ZUVuZCcKPiAKPiAKPiAKPiBGdWxsIHJhbmRjb25maWcgZmls
ZSBpcyBhdHRhY2hlZC4KPiAKCnllcyB0aGFua3MgZm9yIHRoZSByZXBvcnQsCgp0aGUgZml4IGlz
IGFscmVhZHkgYmFraW5nIGluIGFwcGFybW9yLW5leHQKYzI0ODk2MTdiM2I5IGFwcGFybW9yOiBG
aXggdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgemxpYl9kZWZsYXRlX3dvcmtzcGFjZXNpemUnCgp0
aGlzIGhhcHBlbnMgd2hlbiBDT05GSUdfU0VDVVJJVFlfQVBQQVJNT1JfRVhQT1JUX0JJTkFSWSBp
cyBub3Qgc2V0IGFuZCBoZW5jZSBaTElCX0lORkxBVEUvREVGTEFURSBhcmVuJ3Qgc2VsZWN0ZWQg
YW5kIHRoZSBrZXJuZWwgaXMgY29uZmlnZWQgd2l0aG91dCB0aGVtLiBCYXNpY2FsbHkgc29tZSBi
bG9ja3Mgb2YgY29kZSBuZWVkIHRvIGJlIHdyYXBwZWQgaW4gI2lmZGVmLgoKLS0gCkFwcEFybW9y
IG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBv
ciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGlu
Zm8vYXBwYXJtb3IK
