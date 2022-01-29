Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 196D04A32B4
	for <lists+apparmor@lfdr.de>; Sun, 30 Jan 2022 01:00:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nDxdT-0003hC-Vf; Sun, 30 Jan 2022 00:00:03 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nDxdS-0003h5-PK
 for apparmor@lists.ubuntu.com; Sun, 30 Jan 2022 00:00:02 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 29F2841ACE; 
 Sun, 30 Jan 2022 00:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643500802;
 bh=aIUC2hjxOfuGOfoZkng+G/9QpgCwaD5HPPeTqAP3wPc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=iJQPkoDjNi2gojVdm7YPA2QHYnXlWIrScCNgnfJcF+OB0eo9Wvly9/cSHZtjbl5+F
 k7InZd/j7E1lAN7AAO57eJ0URJWBT+Xw9BgVVRqS0F4IIeSJ4NsSidNp1zsU2CJaAg
 rlPIp7eiWnEpMoVErpqG9V6HIe/wDxVF/mhHnBFr8kbAIVNXK68CghouwnVLBmnJ5W
 0URm4TADdPT12oa0LruknM/4LHXcdElHa62ebmvR2wWQi9F/XsH49kwhihzzmUo0el
 GG46qxAM8LL43vY0PVGeNUV3HTezMde1WM8Dj3qRqXDe2IbE3RaB/UaeKpRuQtP5mt
 xXWFEbiE5d3uw==
Message-ID: <eca2206d-562f-a85f-ca51-01afcba63dc8@canonical.com>
Date: Sat, 29 Jan 2022 15:59:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, serge@hallyn.com
References: <20220129025101.38355-1-yang.lee@linux.alibaba.com>
 <20220129025101.38355-2-yang.lee@linux.alibaba.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220129025101.38355-2-yang.lee@linux.alibaba.com>
Subject: Re: [apparmor] [PATCH -next 2/3] apparmor: Fix some kernel-doc
	comments
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
Cc: Abaci Robot <abaci@linux.alibaba.com>,
 linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 jmorris@namei.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gMS8yOC8yMiAxODo1MSwgWWFuZyBMaSB3cm90ZToKPiBBZGQgdGhlIGRlc2NyaXB0aW9uIG9m
IEBuc19uYW1lLCBjaGFuZ2UgZnVuY3Rpb24gbmFtZSBhYV91MTZfY2h1bmNrIHRvCj4gdW5wYWNr
X3UxNl9jaHVuayBhbmQgdmVyaWZ5X2hlYWQgdG8gdmVyaWZ5X2hlYWRlciBpbiBrZXJuZWwtZG9j
IGNvbW1lbnQKPiB0byByZW1vdmUgd2FybmluZ3MgZm91bmQgYnkgcnVubmluZyBzY3JpcHRzL2tl
cm5lbC1kb2MsIHdoaWNoIGlzIGNhdXNlZAo+IGJ5IHVzaW5nICdtYWtlIFc9MScuCj4gCj4gc2Vj
dXJpdHkvYXBwYXJtb3IvcG9saWN5X3VucGFjay5jOjIyNDogd2FybmluZzogZXhwZWN0aW5nIHBy
b3RvdHlwZSBmb3IKPiBhYV91MTZfY2h1bmNrKCkuIFByb3RvdHlwZSB3YXMgZm9yIHVucGFja191
MTZfY2h1bmsoKSBpbnN0ZWFkCj4gc2VjdXJpdHkvYXBwYXJtb3IvcG9saWN5X3VucGFjay5jOjY3
ODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yCj4gbWVtYmVyICduc19uYW1lJyBub3Qg
ZGVzY3JpYmVkIGluICd1bnBhY2tfcHJvZmlsZScKPiBzZWN1cml0eS9hcHBhcm1vci9wb2xpY3lf
dW5wYWNrLmM6OTUwOiB3YXJuaW5nOiBleHBlY3RpbmcgcHJvdG90eXBlIGZvcgo+IHZlcmlmeV9o
ZWFkKCkuIFByb3RvdHlwZSB3YXMgZm9yIHZlcmlmeV9oZWFkZXIoKSBpbnN0ZWFkCj4gCj4gUmVw
b3J0ZWQtYnk6IEFiYWNpIFJvYm90IDxhYmFjaUBsaW51eC5hbGliYWJhLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBZYW5nIExpIDx5YW5nLmxlZUBsaW51eC5hbGliYWJhLmNvbT4KQWNrZWQtYnk6IEpv
aG4gSm9oYW5zZW4gPGpvaG4uam9oYW5zZW5AY2Fub25pY2FsLmNvbT4KCkkgaGF2ZSBwdWxsZWQg
dGhpcyBpbnRvIG15IHRyZWUKCj4gLS0tCj4gIHNlY3VyaXR5L2FwcGFybW9yL3BvbGljeV91bnBh
Y2suYyB8IDUgKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvYXBwYXJtb3IvcG9saWN5X3VucGFj
ay5jIGIvc2VjdXJpdHkvYXBwYXJtb3IvcG9saWN5X3VucGFjay5jCj4gaW5kZXggNTVkY2E5ZTNh
ZjUwLi4zY2MwZmQyZGZmODcgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvYXBwYXJtb3IvcG9saWN5
X3VucGFjay5jCj4gKysrIGIvc2VjdXJpdHkvYXBwYXJtb3IvcG9saWN5X3VucGFjay5jCj4gQEAg
LTIxNCw3ICsyMTQsNyBAQCBzdGF0aWMgdm9pZCAqa3ZtZW1kdXAoY29uc3Qgdm9pZCAqc3JjLCBz
aXplX3QgbGVuKQo+ICB9Cj4gIAo+ICAvKioKPiAtICogYWFfdTE2X2NodW5jayAtIHRlc3QgYW5k
IGRvIGJvdW5kcyBjaGVja2luZyBmb3IgYSB1MTYgc2l6ZSBiYXNlZCBjaHVuawo+ICsgKiB1bnBh
Y2tfdTE2X2NodW5rIC0gdGVzdCBhbmQgZG8gYm91bmRzIGNoZWNraW5nIGZvciBhIHUxNiBzaXpl
IGJhc2VkIGNodW5rCj4gICAqIEBlOiBzZXJpYWxpemVkIGRhdGEgcmVhZCBoZWFkIChOT1QgTlVM
TCkKPiAgICogQGNodW5rOiBzdGFydCBhZGRyZXNzIGZvciBjaHVuayBvZiBkYXRhIChOT1QgTlVM
TCkKPiAgICoKPiBAQCAtNjcxLDYgKzY3MSw3IEBAIHN0YXRpYyBpbnQgZGF0YWNtcChzdHJ1Y3Qg
cmhhc2h0YWJsZV9jb21wYXJlX2FyZyAqYXJnLCBjb25zdCB2b2lkICpvYmopCj4gIC8qKgo+ICAg
KiB1bnBhY2tfcHJvZmlsZSAtIHVucGFjayBhIHNlcmlhbGl6ZWQgcHJvZmlsZQo+ICAgKiBAZTog
c2VyaWFsaXplZCBkYXRhIGV4dGVudCBpbmZvcm1hdGlvbiAoTk9UIE5VTEwpCj4gKyAqIEBuc19u
YW1lOiBwb2ludGVyIG9mIG5ld2x5IGFsbG9jYXRlZCBjb3B5IG9mICVOVUxMIGluIGNhc2Ugb2Yg
ZXJyb3IKPiAgICoKPiAgICogTk9URTogdW5wYWNrIHByb2ZpbGUgc2V0cyBhdWRpdCBzdHJ1Y3Qg
aWYgdGhlcmUgaXMgYSBmYWlsdXJlCj4gICAqLwo+IEBAIC05MzksNyArOTQwLDcgQEAgc3RhdGlj
IHN0cnVjdCBhYV9wcm9maWxlICp1bnBhY2tfcHJvZmlsZShzdHJ1Y3QgYWFfZXh0ICplLCBjaGFy
ICoqbnNfbmFtZSkKPiAgfQo+ICAKPiAgLyoqCj4gLSAqIHZlcmlmeV9oZWFkIC0gdW5wYWNrIHNl
cmlhbGl6ZWQgc3RyZWFtIGhlYWRlcgo+ICsgKiB2ZXJpZnlfaGVhZGVyIC0gdW5wYWNrIHNlcmlh
bGl6ZWQgc3RyZWFtIGhlYWRlcgo+ICAgKiBAZTogc2VyaWFsaXplZCBkYXRhIHJlYWQgaGVhZCAo
Tk9UIE5VTEwpCj4gICAqIEByZXF1aXJlZDogd2hldGhlciB0aGUgaGVhZGVyIGlzIHJlcXVpcmVk
IG9yIG9wdGlvbmFsCj4gICAqIEBuczogUmV0dXJucyAtIG5hbWVzcGFjZSBpZiBvbmUgaXMgc3Bl
Y2lmaWVkIGVsc2UgTlVMTCAoTk9UIE5VTEwpCgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApB
cHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBh
dDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
