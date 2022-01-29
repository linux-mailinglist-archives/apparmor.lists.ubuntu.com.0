Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5254A32B0
	for <lists+apparmor@lfdr.de>; Sun, 30 Jan 2022 00:59:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nDxdC-0003cK-Rc; Sat, 29 Jan 2022 23:59:46 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nDxdB-0003cD-9r
 for apparmor@lists.ubuntu.com; Sat, 29 Jan 2022 23:59:45 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C6A9940E57; 
 Sat, 29 Jan 2022 23:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643500784;
 bh=MVZak3zbu1eAFTux4Sw6Mf40DF40XMJ5a+qfLFJumpc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=uR9BM+uT9n5Xdcu07wH15WQfEAwRCnIzzlbxh8oIHnifLd3KxPbgHV2qWxT9gwFc6
 6IkXyjJOgKAsxZyDUrlu5LnopTTIiiUFkGhXFcWS4N/qVtc41EXlyss9Z93KoJQ7BU
 j/Yz3KzlBTstaJtEooG1QIglsv8xPvtXZLcj1icQKZxgyYN+SWkDHKaH+chSTJtz+o
 EIHcxf65ml1E8FhQMEHOsikd6+u7/o8qy7fYnjRE+8DuE+l6QccO1dlsbutGUCJKJJ
 kh6LOsT6amgfaA6FyVg8s74Yn/IvE7kaJwl2KE2x7BL3hvwzTR/DRrm9b0vtjruohu
 eqZiMs2EKKRbw==
Message-ID: <7441eef2-5d5d-8bfe-42bb-423d0d865a52@canonical.com>
Date: Sat, 29 Jan 2022 15:59:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, serge@hallyn.com
References: <20220129025101.38355-1-yang.lee@linux.alibaba.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220129025101.38355-1-yang.lee@linux.alibaba.com>
Subject: Re: [apparmor] [PATCH -next 1/3] apparmor: Fix match_mnt_path_str()
 and match_mnt() kernel-doc comment
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

T24gMS8yOC8yMiAxODo1MCwgWWFuZyBMaSB3cm90ZToKPiBGaXggYSBzcGVsbGluZyBwcm9ibGVt
IGFuZCBjaGFuZ2UgQG1udHBhdGggdG8gQHBhdGggdG8gcmVtb3ZlIHdhcm5pbmdzCj4gZm91bmQg
YnkgcnVubmluZyBzY3JpcHRzL2tlcm5lbC1kb2MsIHdoaWNoIGlzIGNhdXNlZCBieSB1c2luZyAn
bWFrZSBXPTEnLgo+IAo+IHNlY3VyaXR5L2FwcGFybW9yL21vdW50LmM6MzIxOiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyCj4gJ2Rldm5hbWUnIG5vdCBkZXNjcmliZWQgaW4g
J21hdGNoX21udF9wYXRoX3N0cicKPiBzZWN1cml0eS9hcHBhcm1vci9tb3VudC5jOjMyMTogd2Fy
bmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlcgo+ICdkZXZubWUnIGRlc2NyaXB0aW9uIGlu
ICdtYXRjaF9tbnRfcGF0aF9zdHInCj4gc2VjdXJpdHkvYXBwYXJtb3IvbW91bnQuYzozNzc6IHdh
cm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIKPiAncGF0aCcgbm90IGRlc2NyaWJl
ZCBpbiAnbWF0Y2hfbW50Jwo+IHNlY3VyaXR5L2FwcGFybW9yL21vdW50LmM6Mzc3OiB3YXJuaW5n
OiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyCj4gJ21udHBhdGgnIGRlc2NyaXB0aW9uIGluICdt
YXRjaF9tbnQnCj4gCj4gUmVwb3J0ZWQtYnk6IEFiYWNpIFJvYm90IDxhYmFjaUBsaW51eC5hbGli
YWJhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIExpIDx5YW5nLmxlZUBsaW51eC5hbGliYWJh
LmNvbT4KQWNrZWQtYnk6IEpvaG4gSm9oYW5zZW4gPGpvaG4uam9oYW5zZW5AY2Fub25pY2FsLmNv
bT4KCkkgaGF2ZSBwdWxsZWQgdGhpcyBpbnRvIG15IHRyZWUKCj4gLS0tCj4gIHNlY3VyaXR5L2Fw
cGFybW9yL21vdW50LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvYXBwYXJtb3IvbW91
bnQuYyBiL3NlY3VyaXR5L2FwcGFybW9yL21vdW50LmMKPiBpbmRleCAyM2FhZmU2OGQ0OWEuLjVj
YzVkZTA2MmZjOCAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9hcHBhcm1vci9tb3VudC5jCj4gKysr
IGIvc2VjdXJpdHkvYXBwYXJtb3IvbW91bnQuYwo+IEBAIC0zMDQsNyArMzA0LDcgQEAgc3RhdGlj
IGludCBwYXRoX2ZsYWdzKHN0cnVjdCBhYV9wcm9maWxlICpwcm9maWxlLCBjb25zdCBzdHJ1Y3Qg
cGF0aCAqcGF0aCkKPiAgICogQHByb2ZpbGU6IHRoZSBjb25maW5pbmcgcHJvZmlsZQo+ICAgKiBA
bW50cGF0aDogZm9yIHRoZSBtbnRwbnQgKE5PVCBOVUxMKQo+ICAgKiBAYnVmZmVyOiBidWZmZXIg
dG8gYmUgdXNlZCB0byBsb29rdXAgbW50cGF0aAo+IC0gKiBAZGV2bm1lOiBzdHJpbmcgZm9yIHRo
ZSBkZXZuYW1lL3NyY19uYW1lIChNQVkgQkUgTlVMTCBPUiBFUlJQVFIpCj4gKyAqIEBkZXZuYW1l
OiBzdHJpbmcgZm9yIHRoZSBkZXZuYW1lL3NyY19uYW1lIChNQVkgQkUgTlVMTCBPUiBFUlJQVFIp
Cj4gICAqIEB0eXBlOiBzdHJpbmcgZm9yIHRoZSBkZXYgdHlwZSAoTUFZQkUgTlVMTCkKPiAgICog
QGZsYWdzOiBtb3VudCBmbGFncyB0byBtYXRjaAo+ICAgKiBAZGF0YTogZnMgbW91bnQgZGF0YSAo
TUFZQkUgTlVMTCkKPiBAQCAtMzU5LDcgKzM1OSw3IEBAIHN0YXRpYyBpbnQgbWF0Y2hfbW50X3Bh
dGhfc3RyKHN0cnVjdCBhYV9wcm9maWxlICpwcm9maWxlLAo+ICAvKioKPiAgICogbWF0Y2hfbW50
IC0gaGFuZGxlIHBhdGggbWF0Y2hpbmcgZm9yIG1vdW50Cj4gICAqIEBwcm9maWxlOiB0aGUgY29u
ZmluaW5nIHByb2ZpbGUKPiAtICogQG1udHBhdGg6IGZvciB0aGUgbW50cG50IChOT1QgTlVMTCkK
PiArICogQHBhdGg6IGZvciB0aGUgbW50cG50IChOT1QgTlVMTCkKPiAgICogQGJ1ZmZlcjogYnVm
ZmVyIHRvIGJlIHVzZWQgdG8gbG9va3VwIG1udHBhdGgKPiAgICogQGRldnBhdGg6IHBhdGggZGV2
bmFtZS9zcmNfbmFtZSAoTUFZQkUgTlVMTCkKPiAgICogQGRldmJ1ZmZlcjogYnVmZmVyIHRvIGJl
IHVzZWQgdG8gbG9va3VwIGRldm5hbWUvc3JjX25hbWUKCgotLSAKQXBwQXJtb3IgbWFpbGluZyBs
aXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2Ny
aWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1v
cgo=
