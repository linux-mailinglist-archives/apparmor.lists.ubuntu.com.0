Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCE34B01D9
	for <lists+apparmor@lfdr.de>; Thu, 10 Feb 2022 02:20:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nHy8L-0006JR-JD; Thu, 10 Feb 2022 01:20:29 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nHy8K-0006JK-1w
 for apparmor@lists.ubuntu.com; Thu, 10 Feb 2022 01:20:28 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A3EDF3FFDD
 for <apparmor@lists.ubuntu.com>; Thu, 10 Feb 2022 01:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644456026;
 bh=4x9tcTAsBCiJR2vqqKrsNhc8DrgrXYHwR4U5wtb/L+8=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=oW4HT1cni4QWz5WYaQuKzAaO6kQ5fHv7KbzlBXSf/uOIbSXigfvGDoFLSAzZ+qPiB
 SlCfjuEOmjCB5FXGDt4tSXVWCisvIjNv63OnyMf2+zedzw2KfzmoKR9hASmHgIxkjg
 DIoLvgoAk2fZtpGJ6+oXTgTiGJEaiGet860VWN5vVn/pyW3MQFnOFzU1kDjTDbgCzv
 ndJy4ZoPY1/D2Y+FuOaOPVrK6gk8q+NuI2GN3Bsh7rqZmpvyqtO6Q6UrFdmgytAIgl
 LMsFkPv3xXWosREFPasVpTjzwbroUg78sBO47lZHVDzpInMQgVY8gwMW4g7O9G9F6z
 nxE7g4GG+SX/Q==
Message-ID: <78bca943-b6ca-c697-dd1f-163b88073d0f@canonical.com>
Date: Wed, 9 Feb 2022 17:20:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Subject: [apparmor]  AppArmor 3.0.4 Released
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
My4wLjQgcmVsZWFzZQpvZiB0aGUgQXBwQXJtb3IgdXNlciBzcGFjZSBjb21wb25lbnRzLiAKClRo
ZSByZWxlYXNlIGlzIGF2YWlsYWJsZSBvbgoKZ2l0bGFiCiAgICBodHRwczovL2dpdGxhYi5jb20v
YXBwYXJtb3IvYXBwYXJtb3IvLS9yZWxlYXNlcy92My4wLjQKCgpUaGUgcmVsZWFzZSBub3RlcyBh
cmUgYXZhaWxhYmxlIGF0CgogICBodHRwczovL2dpdGxhYi5jb20vYXBwYXJtb3IvYXBwYXJtb3Iv
LS93aWtpcy9SZWxlYXNlX05vdGVzXzMuMC40CgpQbGVhc2UgcmVwb3J0IGFueSBidWdzIHlvdSBt
YXkgZmluZCB2aWEgdGhlIGdpdGxhYiBBcHBBcm1vciBwcm9qZWN0Cmh0dHBzOi8vZ2l0bGFiLmNv
bS9hcHBhcm1vci9hcHBhcm1vcgoKCkt1ZG9zIHRvIGV2ZXJ5b25lIHdobyBoZWxwZWQgbWFrZSB0
aGlzIHJlbGVhc2UgcG9zc2libGUuCgpUaGFua3MhCgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlz
dApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmli
ZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
