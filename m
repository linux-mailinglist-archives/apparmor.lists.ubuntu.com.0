Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D14A32BA
	for <lists+apparmor@lfdr.de>; Sun, 30 Jan 2022 01:03:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nDxgR-0003uE-OK; Sun, 30 Jan 2022 00:03:07 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nDxgQ-0003u7-H1
 for apparmor@lists.ubuntu.com; Sun, 30 Jan 2022 00:03:06 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 4647D3F07C; 
 Sun, 30 Jan 2022 00:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643500986;
 bh=7k+y7PJ3gcJlzXgorU2zNnjUpve3rlNlya9TVwYp4hk=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=jENINqRqw3pqbJmZcbRC9FDajyZ8MAcWWeoUZJOf8ZlWcSzM3o6dXNdkxgL53QmtH
 1coGNJop/zo/HWBCHCN4IkbM6FKfz/YsdWp43KqLKDfVGH668cEREXFKO4WSABTrIn
 vYvuL3w5QlTrVm38J5bX/v6yXvverFoBmfFcIscq/lTwhIpJJUcfT1PmFMmkiJz+ge
 +BEipTyTjA2LrxJe23wa79vmXMHfCcqKi7BZlFay+/E5oJf6gZdw4gMCeNw6Iappzb
 iqRkDOintBf2DiavnqexfcmXbjY/iWYq6rhpiQ4LH5W00yGE8j3/rbG+N3JV5YP3/6
 wknNkY6kYzWRQ==
Message-ID: <9836f3d4-186f-7a6e-448d-8e94be5f634f@canonical.com>
Date: Sat, 29 Jan 2022 16:03:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, serge@hallyn.com
References: <20220129025229.39663-1-yang.lee@linux.alibaba.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220129025229.39663-1-yang.lee@linux.alibaba.com>
Subject: Re: [apparmor] [PATCH -next 3/3] apparmor: Fix some kernel-doc
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

T24gMS8yOC8yMiAxODo1MiwgWWFuZyBMaSB3cm90ZToKPiBEb24ndCB1c2UgLyoqIGZvciBub24t
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
bmVkLW9mZi1ieTogWWFuZyBMaSA8eWFuZy5sZWVAbGludXguYWxpYmFiYS5jb20+CgpqdXN0IGZv
ciBjb21wbGV0ZW5lc3MgKHRoaXMgaXMgYSBkdXAgb2YgW1BBVENIIDMvM10gYXBwYXJtb3I6IEZp
eCBzb21lIGtlcm5lbC1kb2MgY29tbWVudHMpCgpBY2tlZC1ieTogSm9obiBKb2hhbnNlbiA8am9o
bi5qb2hhbnNlbkBjYW5vbmljYWwuY29tPgoKSSBoYXZlIHB1bGxlZCB0aGlzIGludG8gbXkgdHJl
ZQoKPiAtLS0KPiAgc2VjdXJpdHkvYXBwYXJtb3IvYXBwYXJtb3Jmcy5jIHwgOCArKysrLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9zZWN1cml0eS9hcHBhcm1vci9hcHBhcm1vcmZzLmMgYi9zZWN1cml0eS9hcHBh
cm1vci9hcHBhcm1vcmZzLmMKPiBpbmRleCAxNWVmZTQwNzZmYzQuLjRkN2RmODU5NTQyZCAxMDA2
NDQKPiAtLS0gYS9zZWN1cml0eS9hcHBhcm1vci9hcHBhcm1vcmZzLmMKPiArKysgYi9zZWN1cml0
eS9hcHBhcm1vci9hcHBhcm1vcmZzLmMKPiBAQCAtOTgsNyArOTgsNyBAQCBzdGF0aWMgc3RydWN0
IHJhd2RhdGFfZl9kYXRhICpyYXdkYXRhX2ZfZGF0YV9hbGxvYyhzaXplX3Qgc2l6ZSkKPiAgI2Vu
ZGlmCj4gIAo+ICAvKioKPiAtICogYWFfbWFuZ2xlX25hbWUgLSBtYW5nbGUgYSBwcm9maWxlIG5h
bWUgdG8gc3RkIHByb2ZpbGUgbGF5b3V0IGZvcm0KPiArICogbWFuZ2xlX25hbWUgLSBtYW5nbGUg
YSBwcm9maWxlIG5hbWUgdG8gc3RkIHByb2ZpbGUgbGF5b3V0IGZvcm0KPiAgICogQG5hbWU6IHBy
b2ZpbGUgbmFtZSB0byBtYW5nbGUgIChOT1QgTlVMTCkKPiAgICogQHRhcmdldDogYnVmZmVyIHRv
IHN0b3JlIG1hbmdsZWQgbmFtZSwgc2FtZSBsZW5ndGggYXMgQG5hbWUgKE1BWUJFIE5VTEwpCj4g
ICAqCj4gQEAgLTE0OTksNyArMTQ5OSw3IEBAIGludCBfX2FhX2ZzX2NyZWF0ZV9yYXdkYXRhKHN0
cnVjdCBhYV9ucyAqbnMsIHN0cnVjdCBhYV9sb2FkZGF0YSAqcmF3ZGF0YSkKPiAgCj4gIC8qKiBm
bnMgdG8gc2V0dXAgZHluYW1pYyBwZXIgcHJvZmlsZS9uYW1lc3BhY2UgZmlsZXMgKiovCj4gIAo+
IC0vKioKPiArLyoKPiAgICoKPiAgICogUmVxdWlyZXM6IEBwcm9maWxlLT5ucy0+bG9jayBoZWxk
Cj4gICAqLwo+IEBAIC0xNTI2LDcgKzE1MjYsNyBAQCB2b2lkIF9fYWFmc19wcm9maWxlX3JtZGly
KHN0cnVjdCBhYV9wcm9maWxlICpwcm9maWxlKQo+ICAJfQo+ICB9Cj4gIAo+IC0vKioKPiArLyoK
PiAgICoKPiAgICogUmVxdWlyZXM6IEBvbGQtPm5zLT5sb2NrIGhlbGQKPiAgICovCj4gQEAgLTE4
ODgsNyArMTg4OCw3IEBAIHN0YXRpYyB2b2lkIF9fYWFfZnNfbGlzdF9yZW1vdmVfcmF3ZGF0YShz
dHJ1Y3QgYWFfbnMgKm5zKQo+ICAJCV9fYWFfZnNfcmVtb3ZlX3Jhd2RhdGEoZW50KTsKPiAgfQo+
ICAKPiAtLyoqCj4gKy8qCj4gICAqCj4gICAqIFJlcXVpcmVzOiBAbnMtPmxvY2sgaGVsZAo+ICAg
Ki8KCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20K
TW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5j
b20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=
