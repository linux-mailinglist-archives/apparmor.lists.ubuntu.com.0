Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3C94AB19C
	for <lists+apparmor@lfdr.de>; Sun,  6 Feb 2022 20:20:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nGn4y-0004Gn-6y; Sun, 06 Feb 2022 19:20:08 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nGn4w-0004Fx-RG
 for apparmor@lists.ubuntu.com; Sun, 06 Feb 2022 19:20:06 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 4B8A440DF8
 for <apparmor@lists.ubuntu.com>; Sun,  6 Feb 2022 19:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644175206;
 bh=at1TlRk0YUEZZ0i5/5YuTc3xnqtr6b7YIvlpCcvd4v4=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=vBckjCWhMEyFFl/f7iyf1F4lvFETSK0bZR/OWrmf4DrNhRy0JXBYSU9vQr3sBm1/R
 eZ8a/qbzsLNyn0/HNzHh8JCq93IQDBN5ATXWkJnf+SaXy+j0P6mMXaCSlz3pdd4wP3
 rq53x17OOxHQG81eDqk/l8mnf6hTyzxEDNzPaJ04tHrCv3HIo7rv92TQWTYYlVRAw3
 MCfSE52rTcGuk1caMhwSj4xFhZ5rqosshuvTYnODoDoWDY+QFvETLrKOC2Ropb+dyl
 U0pgtxotrB+/Ik9ftWZ5oYJsqVXbZukhG/W3xFhs+uggZmuV/h5O5pQ/hF3rezyvtx
 26/YlrGXocNIA==
Message-ID: <64c6c4c8-ed6d-bd1e-5919-c7f7d03343d5@canonical.com>
Date: Sun, 6 Feb 2022 11:19:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Subject: [apparmor]  irc meeting Tues Feb 8
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

VGhlIG5leHQgaXJjIG1lZXRpbmcgaXMgVHVlc2RheSBGZWJydWFyeSA4LCBhdCAxODowMCBVVEMg
aW4gI2FwcGFybW9yIG9uIG9mdGMubmV0CgpQbGVhc2UgdXBkYXRlIHRoZSBhZ2VuZGEgaHR0cHM6
Ly9naXRsYWIuY29tL2FwcGFybW9yL2FwcGFybW9yL3dpa2lzL01lZXRpbmdBZ2VuZGEgb3IgcmVw
bHkgdG8gdGhpcyBtYWlsIGlmIHlvdSBoYXZlIGl0ZW1zIHlvdSB3YW50IHRvIGFkZAoKLS0gCkFw
cEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0
aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4v
bGlzdGluZm8vYXBwYXJtb3IK
