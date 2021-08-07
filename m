Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FDE3E3434
	for <lists+apparmor@lfdr.de>; Sat,  7 Aug 2021 11:02:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mCIDZ-0003Aa-6q; Sat, 07 Aug 2021 09:02:09 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mCIDX-0003AC-He
 for apparmor@lists.ubuntu.com; Sat, 07 Aug 2021 09:02:07 +0000
Received: from [192.168.192.153] (unknown [50.45.173.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 1B1233F22C
 for <apparmor@lists.ubuntu.com>; Sat,  7 Aug 2021 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628326927;
 bh=F9p0BNB98t6cVYrvD8rPJRKLeOSrByraqCqMwwA0JJU=;
 h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type;
 b=jR5VUnHG6cDzoj5ss00T89s/iqE1IUBVtF6s0cYcr8iTB5mPcTVQhaxOyIripHmXC
 wbQXkyr9YTCGypcKxfgORcM9gQqWCpSymv7eXcrIumauC5w9pr4MeWCdYg5CFW2qU/
 wZ1s806HQftt6DIVuPEDPCJH+shIwwwRFtJwg68unPEF6pQ+bPUgaYDI9V5IDMNSmg
 ax0XPOc3ohe0WOUfRlO80p4wdQQY6LFRh9DRK+JO/Gw60GvahzBeX25dSc2ZGR1YYe
 77RyUDkiM7VurG94z3BNUtYUuIpD8PuB1w5N/55FXakSD7WmwZ0V8aCRfYrovDDqoM
 IXWXrhTdK999A==
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Organization: Canonical
Message-ID: <154dc043-2508-5e68-28d9-173215f1393c@canonical.com>
Date: Sat, 7 Aug 2021 02:02:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [apparmor] AppArmor 3.0.3 Released
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

VGhlIEFwcEFybW9yIDMuMC4zIHJlbGVhc2Ugb2YgdGhlIEFwcEFybW9yIHVzZXIgc3BhY2UgY29t
cG9uZW50cyBmaXhlcyBhIGJ1aWxkIGZhaWx1cmUgaW4gc29tZSBlbnZpcm9ubWVudHMgaW4gdGhl
IDMuMC4yIHJlbGVhc2UKClRoZSByZWxlYXNlIGlzIGF2YWlsYWJsZSBvbgoKZ2l0bGFiCiAgICBo
dHRwczovL2dpdGxhYi5jb20vYXBwYXJtb3IvYXBwYXJtb3IvLS9yZWxlYXNlcy92My4wLjMKCgpU
aGUgcmVsZWFzZSBub3RlcyBhcmUgYXZhaWxhYmxlIGF0CgogICBodHRwczovL2dpdGxhYi5jb20v
YXBwYXJtb3IvYXBwYXJtb3IvLS93aWtpcy9SZWxlYXNlX05vdGVzXzMuMC4zCgpQbGVhc2UgcmVw
b3J0IGFueSBidWdzIHlvdSBtYXkgZmluZCB2aWEgdGhlIGdpdGxhYiBBcHBBcm1vciBwcm9qZWN0
Cmh0dHBzOi8vZ2l0bGFiLmNvbS9hcHBhcm1vci9hcHBhcm1vcgoKClRoYW5rcyEKCgoKLS0gCkFw
cEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0
aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4v
bGlzdGluZm8vYXBwYXJtb3IK
