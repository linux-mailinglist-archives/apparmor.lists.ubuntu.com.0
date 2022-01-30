Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F64A32B8
	for <lists+apparmor@lfdr.de>; Sun, 30 Jan 2022 01:00:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nDxds-0003lK-4D; Sun, 30 Jan 2022 00:00:28 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nDxdq-0003l3-42
 for apparmor@lists.ubuntu.com; Sun, 30 Jan 2022 00:00:26 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 9B74F3F07C; 
 Sun, 30 Jan 2022 00:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643500825;
 bh=e5WzvEWToWOPqX3/OmG5C06GGabZdWAfxa8w+ai7Ytc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=XoJcNGaA0c0tO87At0EEruVQbMb2Ipdz26unr3G4L3hNB2qGE/QyNaOGgb5lCZDSd
 nOjsKMxuOH1kboB2Re9PtyeXTy30sypnc05v0C+rsj/eECm8SfwCBNZi6ICPmFc+FK
 OyD7ergoXTlmdfSd/gZsER8GwUXKkozcR0AOaGpe6xMVfDYCTN17BRnJZuh2vW3x+Z
 aQ+Hx156Z2U73ABBTX9yIABp6X4ioK+scavhFx1d6pkYewPXyhj96N8eACYKGjokK9
 KHDxoySAamGqlj539lUUYAl+PPLYWDQoQnMyzCUC59f/cDIb/E+gcswOcWmtYD3nq9
 H5RLzJgyPseTg==
Message-ID: <d2957633-3685-b3dc-d41c-ee0948733783@canonical.com>
Date: Sat, 29 Jan 2022 16:00:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, serge@hallyn.com
References: <20220129025101.38355-1-yang.lee@linux.alibaba.com>
 <20220129025101.38355-3-yang.lee@linux.alibaba.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220129025101.38355-3-yang.lee@linux.alibaba.com>
Subject: Re: [apparmor] [PATCH 3/3] apparmor: Fix some kernel-doc comments
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

T24gMS8yOC8yMiAxODo1MSwgWWFuZyBMaSB3cm90ZToKPiBEb24ndCB1c2UgLyoqIGZvciBub24t
a2VybmVsLWRvYyBjb21tZW50cyBhbmQgY2hhbmdlIGZ1bmN0aW9uIG5hbWUKPiBhYV9tYW5nbGVf
bmFtZSB0byBtYW5nbGVfbmFtZSBpbiBrZXJuZWwtZG9jIGNvbW1lbnQgdG8gUmVtb3ZlIHNvbWUK
PiB3YXJuaW5ncyBmb3VuZCBieSBydW5uaW5nIHNjcmlwdHMva2VybmVsLWRvYywgd2hpY2ggaXMg
Y2F1c2VkIGJ5Cj4gdXNpbmcgJ21ha2UgVz0xJy4KPiAKPiBzZWN1cml0eS9hcHBhcm1vci9hcHBh
cm1vcmZzLmM6MTUwMzogd2FybmluZzogQ2Fubm90IHVuZGVyc3RhbmQgICoKPiAgb24gbGluZSAx
NTAzIC0gSSB0aG91Z2h0IGl0IHdhcyBhIGRvYyBsaW5lCj4gc2VjdXJpdHkvYXBwYXJtb3IvYXBw
YXJtb3Jmcy5jOjE1MzA6IHdhcm5pbmc6IENhbm5vdCB1bmRlcnN0YW5kICAqCj4gIG9uIGxpbmUg
MTUzMCAtIEkgdGhvdWdodCBpdCB3YXMgYSBkb2MgbGluZQo+IHNlY3VyaXR5L2FwcGFybW9yL2Fw
cGFybW9yZnMuYzoxODkyOiB3YXJuaW5nOiBDYW5ub3QgdW5kZXJzdGFuZCAgKgo+ICBvbiBsaW5l
IDE4OTIgLSBJIHRob3VnaHQgaXQgd2FzIGEgZG9jIGxpbmUKPiBzZWN1cml0eS9hcHBhcm1vci9h
cHBhcm1vcmZzLmM6MTA4OiB3YXJuaW5nOiBleHBlY3RpbmcgcHJvdG90eXBlIGZvcgo+IGFhX21h
bmdsZV9uYW1lKCkuIFByb3RvdHlwZSB3YXMgZm9yIG1hbmdsZV9uYW1lKCkgaW5zdGVhZAo+IAo+
IFJlcG9ydGVkLWJ5OiBBYmFjaSBSb2JvdCA8YWJhY2lAbGludXguYWxpYmFiYS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogWWFuZyBMaSA8eWFuZy5sZWVAbGludXguYWxpYmFiYS5jb20+CgpBY2tlZC1i
eTogSm9obiBKb2hhbnNlbiA8am9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tPgoKSSBoYXZlIHB1
bGxlZCB0aGlzIGludG8gbXkgdHJlZQoKCj4gLS0tCj4gIHNlY3VyaXR5L2FwcGFybW9yL2FwcGFy
bW9yZnMuYyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvYXBwYXJtb3IvYXBwYXJt
b3Jmcy5jIGIvc2VjdXJpdHkvYXBwYXJtb3IvYXBwYXJtb3Jmcy5jCj4gaW5kZXggMTVlZmU0MDc2
ZmM0Li40ZDdkZjg1OTU0MmQgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvYXBwYXJtb3IvYXBwYXJt
b3Jmcy5jCj4gKysrIGIvc2VjdXJpdHkvYXBwYXJtb3IvYXBwYXJtb3Jmcy5jCj4gQEAgLTk4LDcg
Kzk4LDcgQEAgc3RhdGljIHN0cnVjdCByYXdkYXRhX2ZfZGF0YSAqcmF3ZGF0YV9mX2RhdGFfYWxs
b2Moc2l6ZV90IHNpemUpCj4gICNlbmRpZgo+ICAKPiAgLyoqCj4gLSAqIGFhX21hbmdsZV9uYW1l
IC0gbWFuZ2xlIGEgcHJvZmlsZSBuYW1lIHRvIHN0ZCBwcm9maWxlIGxheW91dCBmb3JtCj4gKyAq
IG1hbmdsZV9uYW1lIC0gbWFuZ2xlIGEgcHJvZmlsZSBuYW1lIHRvIHN0ZCBwcm9maWxlIGxheW91
dCBmb3JtCj4gICAqIEBuYW1lOiBwcm9maWxlIG5hbWUgdG8gbWFuZ2xlICAoTk9UIE5VTEwpCj4g
ICAqIEB0YXJnZXQ6IGJ1ZmZlciB0byBzdG9yZSBtYW5nbGVkIG5hbWUsIHNhbWUgbGVuZ3RoIGFz
IEBuYW1lIChNQVlCRSBOVUxMKQo+ICAgKgo+IEBAIC0xNDk5LDcgKzE0OTksNyBAQCBpbnQgX19h
YV9mc19jcmVhdGVfcmF3ZGF0YShzdHJ1Y3QgYWFfbnMgKm5zLCBzdHJ1Y3QgYWFfbG9hZGRhdGEg
KnJhd2RhdGEpCj4gIAo+ICAvKiogZm5zIHRvIHNldHVwIGR5bmFtaWMgcGVyIHByb2ZpbGUvbmFt
ZXNwYWNlIGZpbGVzICoqLwo+ICAKPiAtLyoqCj4gKy8qCj4gICAqCj4gICAqIFJlcXVpcmVzOiBA
cHJvZmlsZS0+bnMtPmxvY2sgaGVsZAo+ICAgKi8KPiBAQCAtMTUyNiw3ICsxNTI2LDcgQEAgdm9p
ZCBfX2FhZnNfcHJvZmlsZV9ybWRpcihzdHJ1Y3QgYWFfcHJvZmlsZSAqcHJvZmlsZSkKPiAgCX0K
PiAgfQo+ICAKPiAtLyoqCj4gKy8qCj4gICAqCj4gICAqIFJlcXVpcmVzOiBAb2xkLT5ucy0+bG9j
ayBoZWxkCj4gICAqLwo+IEBAIC0xODg4LDcgKzE4ODgsNyBAQCBzdGF0aWMgdm9pZCBfX2FhX2Zz
X2xpc3RfcmVtb3ZlX3Jhd2RhdGEoc3RydWN0IGFhX25zICpucykKPiAgCQlfX2FhX2ZzX3JlbW92
ZV9yYXdkYXRhKGVudCk7Cj4gIH0KPiAgCj4gLS8qKgo+ICsvKgo+ICAgKgo+ICAgKiBSZXF1aXJl
czogQG5zLT5sb2NrIGhlbGQKPiAgICovCgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBB
cm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDog
aHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
