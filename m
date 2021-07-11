Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 512823C3F29
	for <lists+apparmor@lfdr.de>; Sun, 11 Jul 2021 22:25:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1m2g0V-0001Bb-Oc; Sun, 11 Jul 2021 20:24:55 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1m2g0V-0001BV-2V
 for apparmor@lists.ubuntu.com; Sun, 11 Jul 2021 20:24:55 +0000
Received: from [192.168.192.153] (unknown [50.53.41.238])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 36428404A2
 for <apparmor@lists.ubuntu.com>; Sun, 11 Jul 2021 20:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626035094;
 bh=X9egMKre3+tIywGYVjxWxeaAJ1AFm4VnfRvbzmeXQOE=;
 h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type;
 b=AgxCgHgeLIMS7C+fmaqShxLwJOyAwcisO1AyS82gQwQqyGZeKxtOEUbbgSvNNxZup
 3N4vJNvc3m9eltrI9fLt6hruA7UVEZ4dDTwn0BWBRX/faUHz9xBJihopEjZKxHIsv7
 2I2kxFM/0ymtTf8dJUeY4dvpaxhWvT7I/lGPKCMwMB1aweNCwOMboXnoXPppdl6uXy
 aw671xKn0xuxzIoVgpr/GHbY8oismauD4m29fT7HR7bwmPfRSGmysPDW3TwaGDRLmh
 04FdHY1JXCttE8CynHYD4GrzaIfVDL2Ecs38KA1Wi6E8uT3+M5p826qgrldQB2fMx8
 VIhSiuKajg1aw==
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Organization: Canonical
Message-ID: <f328856d-5b89-4297-4c60-e8f7f674eb4f@canonical.com>
Date: Sun, 11 Jul 2021 13:24:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [apparmor] irc meeting Tues July 13, 18:00 UTC
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

VGhlIG5leHQgSVJDIG1lZXRpbmcgaXMgVHVlc2RheSBKdWx5IDEzLCBhdCAxODowMCBVVEMgaW4g
I2FwcGFybW9yIG9uIG9mdGMubmV0CgpQbGVhc2UgdXBkYXRlIHRoZSBhZ2VuZGEgaHR0cHM6Ly9n
aXRsYWIuY29tL2FwcGFybW9yL2FwcGFybW9yL3dpa2lzL01lZXRpbmdBZ2VuZGEgb3IgcmVwbHkg
dG8gdGhpcyBtYWlsIGlmIHlvdSBoYXZlIGl0ZW1zIHlvdSB3YW50IHRvIGFkZAoKLS0gCkFwcEFy
bW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5n
cyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlz
dGluZm8vYXBwYXJtb3IK
