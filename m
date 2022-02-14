Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7BD4B406D
	for <lists+apparmor@lfdr.de>; Mon, 14 Feb 2022 04:40:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nJSE1-0003bX-PI; Mon, 14 Feb 2022 03:40:29 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nJSE0-0003bO-50
 for apparmor@lists.ubuntu.com; Mon, 14 Feb 2022 03:40:28 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 6C8E13FCCC; 
 Mon, 14 Feb 2022 03:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644810027;
 bh=6JLxTZevHMlYVeby6Lh6UMpeElkbmngwOfI8fZ79xvs=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=vbNM+WcB0HwKMysA+G3Flz3Xwz9BisL3jgsF+SgUnRpMhPqpcy1L6cQEjdSIKiXb2
 bpmU7iCYAzm+H5DaTXTgbi4K2ql2nKoWeX8YcCEsctpwtW0COIvPdEPvkqFWxBMupb
 8j2VSnMdN4leF6TM/dpkGSmq8LlBUth3R9YPRdmd+pSlbR7zLQzwsut/+wgAdTz77j
 +TM9bK7Xs8Tb8m41ljhuihvpucpKV6U9gEg3ADBgWX/AhVww6UK2bn4VMwVQJ3t771
 HkQQk+PnG1e4HLzoOgf6TWrXi1zjsu7tzbU+qlqrluaj5P8BIELViE2RN4YIqO+zZe
 WeHJHsAjq9f0Q==
Message-ID: <f42b0010-3a7b-e781-5b7e-ac975c36c102@canonical.com>
Date: Sun, 13 Feb 2022 19:40:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: trix@redhat.com, jmorris@namei.org, serge@hallyn.com, nathan@kernel.org,
 ndesaulniers@google.com
References: <20220213213228.2806682-1-trix@redhat.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220213213228.2806682-1-trix@redhat.com>
Subject: Re: [apparmor] [PATCH] apparmor: fix aa_label_asxprint return check
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
Cc: linux-security-module@vger.kernel.org, llvm@lists.linux.dev,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gMi8xMy8yMiAxMzozMiwgdHJpeEByZWRoYXQuY29tIHdyb3RlOgo+IEZyb206IFRvbSBSaXgg
PHRyaXhAcmVkaGF0LmNvbT4KPiAKPiBDbGFuZyBzdGF0aWMgYW5hbHlzaXMgcmVwb3J0cyB0aGlz
IGlzc3VlCj4gbGFiZWwuYzoxODAyOjM6IHdhcm5pbmc6IDJuZCBmdW5jdGlvbiBjYWxsIGFyZ3Vt
ZW50Cj4gICBpcyBhbiB1bmluaXRpYWxpemVkIHZhbHVlCj4gICBwcl9pbmZvKCIlcyIsIHN0cik7
Cj4gICBefn5+fn5+fn5+fn5+fn5+fn4KPiAKPiBzdHIgaXMgc2V0IGZyb20gYSBzdWNjZXNzZnVs
IGNhbGwgdG8gYWFfbGFiZWxfYXN4cHJpbnQoJnN0ciwgLi4uKQo+IE9uIGZhaWx1cmUgYSBuZWdh
dGl2ZSB2YWx1ZSBpcyByZXR1cm5lZCwgbm90IGEgLTEuICBTbyBjaGFuZ2UKPiB0aGUgY2hlY2su
Cj4gCj4gRml4ZXM6IGYxYmQ5MDQxNzVlOCAoImFwcGFybW9yOiBhZGQgdGhlIGJhc2UgZm5zKCkg
Zm9yIGRvbWFpbiBsYWJlbHMiKQo+IFNpZ25lZC1vZmYtYnk6IFRvbSBSaXggPHRyaXhAcmVkaGF0
LmNvbT4KCkFja2VkLWJ5OiBKb2huIEpvaGFuc2VuIDxqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5j
b20+Cgp0aGFua3MgSSBoYXZlIHB1bGxlZCB0aGlzIGludG8gbXkgdHJlZQoKPiAtLS0KPiAgc2Vj
dXJpdHkvYXBwYXJtb3IvbGFiZWwuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2Fw
cGFybW9yL2xhYmVsLmMgYi9zZWN1cml0eS9hcHBhcm1vci9sYWJlbC5jCj4gaW5kZXggOWViOWE5
MjM3OTI2Li5hNjU4YjY3Yzc4NGMgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvYXBwYXJtb3IvbGFi
ZWwuYwo+ICsrKyBiL3NlY3VyaXR5L2FwcGFybW9yL2xhYmVsLmMKPiBAQCAtMTc0NCw3ICsxNzQ0
LDcgQEAgdm9pZCBhYV9sYWJlbF94YXVkaXQoc3RydWN0IGF1ZGl0X2J1ZmZlciAqYWIsIHN0cnVj
dCBhYV9ucyAqbnMsCj4gIAlpZiAoIXVzZV9sYWJlbF9obmFtZShucywgbGFiZWwsIGZsYWdzKSB8
fAo+ICAJICAgIGRpc3BsYXlfbW9kZShucywgbGFiZWwsIGZsYWdzKSkgewo+ICAJCWxlbiAgPSBh
YV9sYWJlbF9hc3hwcmludCgmbmFtZSwgbnMsIGxhYmVsLCBmbGFncywgZ2ZwKTsKPiAtCQlpZiAo
bGVuID09IC0xKSB7Cj4gKwkJaWYgKGxlbiA8IDApIHsKPiAgCQkJQUFfREVCVUcoImxhYmVsIHBy
aW50IGVycm9yIik7Cj4gIAkJCXJldHVybjsKPiAgCQl9Cj4gQEAgLTE3NzIsNyArMTc3Miw3IEBA
IHZvaWQgYWFfbGFiZWxfc2VxX3hwcmludChzdHJ1Y3Qgc2VxX2ZpbGUgKmYsIHN0cnVjdCBhYV9u
cyAqbnMsCj4gIAkJaW50IGxlbjsKPiAgCj4gIAkJbGVuID0gYWFfbGFiZWxfYXN4cHJpbnQoJnN0
ciwgbnMsIGxhYmVsLCBmbGFncywgZ2ZwKTsKPiAtCQlpZiAobGVuID09IC0xKSB7Cj4gKwkJaWYg
KGxlbiA8IDApIHsKPiAgCQkJQUFfREVCVUcoImxhYmVsIHByaW50IGVycm9yIik7Cj4gIAkJCXJl
dHVybjsKPiAgCQl9Cj4gQEAgLTE3OTUsNyArMTc5NSw3IEBAIHZvaWQgYWFfbGFiZWxfeHByaW50
ayhzdHJ1Y3QgYWFfbnMgKm5zLCBzdHJ1Y3QgYWFfbGFiZWwgKmxhYmVsLCBpbnQgZmxhZ3MsCj4g
IAkJaW50IGxlbjsKPiAgCj4gIAkJbGVuID0gYWFfbGFiZWxfYXN4cHJpbnQoJnN0ciwgbnMsIGxh
YmVsLCBmbGFncywgZ2ZwKTsKPiAtCQlpZiAobGVuID09IC0xKSB7Cj4gKwkJaWYgKGxlbiA8IDAp
IHsKPiAgCQkJQUFfREVCVUcoImxhYmVsIHByaW50IGVycm9yIik7Cj4gIAkJCXJldHVybjsKPiAg
CQl9CgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29t
Ck1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUu
Y29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
