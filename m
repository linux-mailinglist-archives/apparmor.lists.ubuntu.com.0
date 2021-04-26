Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13536B5CB
	for <lists+apparmor@lfdr.de>; Mon, 26 Apr 2021 17:29:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lb3Aa-0006hi-K3; Mon, 26 Apr 2021 15:29:08 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lb3AY-0006hb-R1
 for apparmor@lists.ubuntu.com; Mon, 26 Apr 2021 15:29:06 +0000
Received: by mail-lj1-f178.google.com with SMTP id b38so23439840ljf.5
 for <apparmor@lists.ubuntu.com>; Mon, 26 Apr 2021 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=eAj+RgfzeciYeMLJGBvUFNzvX2q2x2CVyMpsseJ/kko=;
 b=BYQ0T6VB485VK2QtZxxEY8kF8HMHPzkTSLZ7XVptp/+P+yqZoBJaUfP5msAK0xBbBF
 ag4qXMJ6qAkea5Bd3wldBba4t3LrTumYWjaXajPaGgo5crsZU09QD7g/ETvDufCAk7lv
 K3EX822ijUOh0dtKw46mPaE3pMr72VXgsgw04YZbAu6guJwNYPGUfR+tUfbHy3DP6W3Q
 eC1xa5efXjJDZGE1oVSg3uLF8DHWAxrVcAWxzwDa5hx7258XSTMivloZdhBcTAOhxO7G
 fMJDTsKtMI0Qhm+x/Kn/MHnJbMqYvCrBZzB6nxKD/QiczzkIZjLY1uRcvqQ/YMeHig9f
 X18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=eAj+RgfzeciYeMLJGBvUFNzvX2q2x2CVyMpsseJ/kko=;
 b=IlgfyGBgRAOI6Lggfx8BSdJUb2TS7WEJx8uOP9juJ3YNz0qWrsI97POfSYXXE37az0
 dZpPrh8ncf5y42HYnR5QKMoRsuWNuQZQ8TPUD87IDh6g20GVh9Phob1p83xs/Us94Vp8
 vCvcu197weRhhn2P2xFlQM4afblpqKQvxGtUaMQMlY6V/6C7MDGyei+tgtLWYtc+9x+0
 DYxbXfCrYd5T/UBaK80Hw/cPNMACTIpGtveUx6N3SunExNZCq6/nzFb4p6SPo4nnT8hX
 qn2onGpAYemu4PD9lxtXXpZY+TuZ3R4NoPrpU9OHeKXj8FUFBYbHVbrmXIuFuOeu8z8f
 IJyQ==
X-Gm-Message-State: AOAM531N9yPMDxNILDKQn4NrYPVP2JJDCGF487BmrqG/wymWlNywmhyv
 ajtaki5LtcYzT3W4bdVQIaw2QPPtQXxOVdTT1F226X2R
X-Google-Smtp-Source: ABdhPJzdEsyhdeTf6JUw0S39HjJ16lTEvPN1H96dcvReZ4wQwA3EeSY3kCsJ/eLvu1QEZq3xok9g7NDJTJEZr8bV3mc=
X-Received: by 2002:a2e:a369:: with SMTP id i9mr13462975ljn.273.1619450945505; 
 Mon, 26 Apr 2021 08:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ4afdxmm8b0oTTerRWZr+=2LW6_ueT6Y3HuL=mdYRs84A@mail.gmail.com>
In-Reply-To: <CAODFaZ4afdxmm8b0oTTerRWZr+=2LW6_ueT6Y3HuL=mdYRs84A@mail.gmail.com>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Mon, 26 Apr 2021 20:58:54 +0530
Message-ID: <CAODFaZ4Xj+hHZyta2PEtnk=pqq=poAbr7H03Xk-wAutJqzaU=A@mail.gmail.com>
To: apparmor@lists.ubuntu.com, John Johansen <john.johansen@canonical.com>, 
 Seth Arnold <seth.arnold@canonical.com>
Received-SPF: pass client-ip=209.85.208.178;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f178.google.com
Subject: Re: [apparmor] Apparmor: Profile optimization
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

SGkgSm9obi9TZXRoLAoKUGxlYXNlIGNsYXJpZnkgdGhlIGJlbG93IHF1ZXJpZXMgd2hpY2ggd2Ug
YXJlIGxvb2tpbmcgZm9yIHRvIGRlZmluZQp0aGUgcHJvZmlsZXMgZm9yIGVtYmVkZGVkIGRldmlj
ZXMuCktpbmRseSBkbyB0aGUgbmVlZGZ1bC4KClRoYW5rcwpNdXJhbGkuUwoKT24gRnJpLCBBcHIg
MTYsIDIwMjEgYXQgMTE6MTggUE0gTXVyYWxpIFNlbHZhcmFqCjxtdXJhbGkuc2VsdmFyYWoyMDAz
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbGwsCj4KPiBXZSBoYXZlIG9ic2VydmVkIGZldyBj
b25maWd1cmF0aW9uIGZpbGVzIGFyZSBwcmVzZW50IGluIC90bXAgd2hpY2ggYXJlCj4gbmVlZGVk
IGZvciBjZXJ0YWluIHByb2Nlc3Nlcy4KPiBGb3IgZXhhbXBsZSwgZmV3IG9mIHRoZSBmaWxlcyBh
cmUgaGlkZGVuIGZpbGVzIGxvY2F0ZWQgaW4gL3RtcC8uCj4KPiBJbiB0aGF0IGNhc2UsIHNoYWxs
IHdlIGFkZCBiZWxvdyBlbnRyeQo+Cj4gL3RtcC8qKiBydywKPgo+IG9yIERvIHdlIG5lZWQgdG8g
YWRkIGVudHJpZXMgZm9yIGZpbGUgc3BlY2lmaWMgYXMgYmVsb3cKPgo+IC90bXAvZmlsZS50eHQg
ciwKPiAvdG1wLy5pbml0X2NvbXBsZXRlIHJ3LAo+Cj4gV2hpY2ggd291bGQgYmUgdGhlIGJlc3Qg
d2F5IGZvciBzZWN1cml0eSBjb25jZXJuIGVzcGVjaWFsbHkgZm9yCj4gZW1iZWRkZWQgZGV2aWNl
cyA/Cj4gUGxlYXNlIGFkdmlzZS4KPgo+IFRoYW5rcwo+IE11cmFsaS5TCgotLSAKQXBwQXJtb3Ig
bWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9y
IHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5m
by9hcHBhcm1vcgo=
