Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AED3E2318
	for <lists+apparmor@lfdr.de>; Fri,  6 Aug 2021 07:55:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mBsor-0004Es-8y; Fri, 06 Aug 2021 05:54:57 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mBsop-0004Em-MK
 for apparmor@lists.ubuntu.com; Fri, 06 Aug 2021 05:54:55 +0000
Received: from [192.168.192.153] (unknown [50.45.173.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 402653F04D
 for <apparmor@lists.ubuntu.com>; Fri,  6 Aug 2021 05:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628229295;
 bh=KGl819vJ8r+LLKoCyJTmAQht7FPZjC/UbyXHbpv5DmM=;
 h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type;
 b=Yopw7DNgNZ62agI07DxmM5zkEy836FOJwub/mxAZ9dRDE3nXJM1rjVm5wD3/J6WUF
 BZuNIpZ4/Gkcwl2NbMCRmruMaqCXmL9pTktkDf4v6wNrlZZv0pO8QXruILDw4wyJT8
 weIEAc45uffRGSRL0sM4+nUxluE/eGaTMpZpYLZbPOdpfe4WXINxLXTDmDPWH+Shw2
 7gDyGwIeMieg5aFEd6IbZ3JfXj6vThJs+pkDe+UkTryc5EFf6KHXCZzRX9jfi6nYP4
 fLW30ZBWRldmZlBlxRACtqiBOotk9sjNBMIUQvheKOWnAqT+3XBi1b9T+w+KXSPJrN
 RWoA7cNERinUA==
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Organization: Canonical
Message-ID: <f75be2ab-c108-1563-1c0e-58948faa2e5a@canonical.com>
Date: Thu, 5 Aug 2021 22:54:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [apparmor]  AppArmor 3.0.2 Released
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

VGhlIEFwcEFybW9yIGRldmVsb3BtZW50IHRlYW0gaXMgcGxlYXNlZCB0byBhbm5vdW5jZSB0aGUg
My4wLjIgcmVsZWFzZQpvZiB0aGUgQXBwQXJtb3IgdXNlciBzcGFjZSBjb21wb25lbnRzLiAKClRo
ZSByZWxlYXNlIGlzIGF2YWlsYWJsZSBvbgoKZ2l0bGFiCiAgICBodHRwczovL2dpdGxhYi5jb20v
YXBwYXJtb3IvYXBwYXJtb3IvLS9yZWxlYXNlcy92My4wLjIKCgpUaGUgcmVsZWFzZSBub3RlcyBh
cmUgYXZhaWxhYmxlIGF0CgogICBodHRwczovL2dpdGxhYi5jb20vYXBwYXJtb3IvYXBwYXJtb3Iv
LS93aWtpcy9SZWxlYXNlX05vdGVzXzMuMC4yCgpQbGVhc2UgcmVwb3J0IGFueSBidWdzIHlvdSBt
YXkgZmluZCB2aWEgdGhlIGdpdGxhYiBBcHBBcm1vciBwcm9qZWN0Cmh0dHBzOi8vZ2l0bGFiLmNv
bS9hcHBhcm1vci9hcHBhcm1vcgoKCkt1ZG9zIHRvIGV2ZXJ5b25lIHdobyBoZWxwZWQgbWFrZSB0
aGlzIHJlbGVhc2UgcG9zc2libGUuCgpUaGFua3MhCgoKCgotLSAKQXBwQXJtb3IgbWFpbGluZyBs
aXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2Ny
aWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1v
cgo=
