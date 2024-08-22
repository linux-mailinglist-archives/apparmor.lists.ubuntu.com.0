Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 164E095C126
	for <lists+apparmor@lfdr.de>; Fri, 23 Aug 2024 00:53:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1shGgW-0003to-Hi; Thu, 22 Aug 2024 22:53:40 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1shGgU-0003te-Ib
 for apparmor@lists.ubuntu.com; Thu, 22 Aug 2024 22:53:38 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E42C23F283
 for <apparmor@lists.ubuntu.com>; Thu, 22 Aug 2024 22:53:37 +0000 (UTC)
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a868403dbdeso121970866b.1
 for <apparmor@lists.ubuntu.com>; Thu, 22 Aug 2024 15:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724367217; x=1724972017;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j67XjmtbDynXstOHtehBju1p7R/p/XZdekc6+FjY7Rw=;
 b=fxVmxsoGtNrfzI0jO7o37vhPUdNTM8spYfiB6W/AUAnZRTVEOrCKAC+rO9eCNqeMA4
 5fKXmJpCPL9nel0VKb5gEJ8n+PPOMfsb8iRUC45Hxgc7PfzTHuJG/pTy3dlZ+Rj//+/8
 vCv1KhGEEPJijpXGDMwPwxtb4pndl/VWO+GA6QGwVeSUXjBh0i77K2KB13dxdwZLaD6D
 aaATdUqeAx1vQCSxa6ro/HwW96KCiGoIxm2V9aWWZIIRPZyS2wmTnRWpoxODke2Tu0rz
 dKHkAePlu5QeEJjyXMoYjeSiN6ugSvv7l+VPWkNSHYStnzTXXzae6fCfhWhtOybdbqi9
 IzCA==
X-Gm-Message-State: AOJu0YwA9gMk+enPpuXLr/g78rEsnagoaNsmnbKkPwnGeXJA8Jcf7eWb
 Fvr5dqDhuw55Y02lZBWtyDbfE1mHvcWvFvL/iveRnmkLph5LhlNF0F1z68uRTOWNQD0a3dWHwsP
 FmaRWp226CMOBeQkLuzoLbh3jTlkUE+xBbXRYoz4lc7qw1/cgPHDABWj86r/GlOS5kPAr068+Pi
 lDawBNW7AHCyn6PRE2jkub2Xg3uxgjuJPIEGVFgKwKeowzF3bh0jrBVPeT
X-Received: by 2002:a17:907:e269:b0:a77:cf9d:f495 with SMTP id
 a640c23a62f3a-a86a52ec097mr14791266b.40.1724367217419; 
 Thu, 22 Aug 2024 15:53:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgXW8XvSnAvZ+EChvc0Eiv4XFO6QfLDUVOcJi6X8Gr2wgcgzosF3rwlnGtgHyrTuKV9DmlkAnjfvGQ5k0Ze0c=
X-Received: by 2002:a17:907:e269:b0:a77:cf9d:f495 with SMTP id
 a640c23a62f3a-a86a52ec097mr14789166b.40.1724367216653; Thu, 22 Aug 2024
 15:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAKCV-6sG6apr7WRBEhSqkeOEhF+h1UmgA4ur=RPDBoL7r-q3uw@mail.gmail.com>
 <CAKCV-6tSbdTJv6WYC4NQv630qzycYSh6ou_9CrU3k8GsdD4fHA@mail.gmail.com>
In-Reply-To: <CAKCV-6tSbdTJv6WYC4NQv630qzycYSh6ou_9CrU3k8GsdD4fHA@mail.gmail.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Thu, 22 Aug 2024 15:53:25 -0700
Message-ID: <CAKCV-6s3W2u9C37c35JxUgRMuK=+srLxmP-B3MeA5rXxYOkEfQ@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="000000000000695e4106204d8700"
Subject: Re: [apparmor] [PATCH] apparmor: fix null pointer deref in
 find_attach when xmatch is null
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--000000000000695e4106204d8700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just realized that I forgot to add sign off on my patch, so I'm
resending it with the Signed-off-by line added.

On Wed, Aug 21, 2024 at 11:12=E2=80=AFAM Ryan Lee <ryan.lee@canonical.com> =
wrote:
>
> After further analysis, the root cause turned out to be the xmatch not
> being set up properly when allocating a null profile for learning in
> complain mode. Thus, I am withdrawing the above patch and instead
> attaching a new patch that does this setup in aa_alloc_null.
>
> Ryan
>
> On Mon, Aug 19, 2024 at 1:05=E2=80=AFPM Ryan Lee <ryan.lee@canonical.com>=
 wrote:
> >
> > find_attach loops over profile entries and first checks for a DFA, fall=
ing
> > back onto a strcmp otherwise. However, the check if (attach->xmatch->df=
a)
> > did not account for the possibility that (attach->xmatch) could be null=
.
> > This occured with a sequence of profile replacements that resulted in a
> > kernel BUG print due to the null pointer dereference.
> >
> > To avoid this issue, first check that (attach->xmatch) is not null.
> >
> > The one-line patch is attached to the email.
> >
> > Ryan

--000000000000695e4106204d8700
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-apparmor-allocate-xmatch-for-nullpdf-inside-aa_alloc_signed.patch"
Content-Disposition: attachment; 
	filename="0001-apparmor-allocate-xmatch-for-nullpdf-inside-aa_alloc_signed.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m05votzl0>
X-Attachment-Id: f_m05votzl0

RnJvbSA0NzlkYTM2YmM1ZmYxNzEzOGM5ODlmODY2MjFhYzkyZmUyZDQwMjFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSeWFuIExlZSA8cnlhbi5sZWVAY2Fub25pY2FsLmNvbT4KRGF0
ZTogV2VkLCAyMSBBdWcgMjAyNCAxMTowMTo1NiAtMDcwMApTdWJqZWN0OiBbUEFUQ0hdIGFwcGFy
bW9yOiBhbGxvY2F0ZSB4bWF0Y2ggZm9yIG51bGxwZGYgaW5zaWRlIGFhX2FsbG9jX251bGwKCmF0
dGFjaC0+eG1hdGNoIHdhcyBub3Qgc2V0IHdoZW4gYWxsb2NhdGluZyBhIG51bGwgcHJvZmlsZSwg
d2hpY2ggaXMgdXNlZCBpbgpjb21wbGFpbiBtb2RlIHRvIGFsbG9jYXRlIGEgbGVhcm5pbmcgcHJv
ZmlsZS4gVGhpcyB3YXMgY2F1c2luZyBkb3duc3RyZWFtCmZhaWx1cmVzIGluIGZpbmRfYXR0YWNo
LCB3aGljaCBleHBlY3RlZCBhIHZhbGlkIHhtYXRjaCBidXQgZGlkIG5vdCBmaW5kCm9uZSB1bmRl
ciBhIGNlcnRhaW4gc2VxdWVuY2Ugb2YgcHJvZmlsZSB0cmFuc2l0aW9ucyBpbiBjb21wbGFpbiBt
b2RlLgoKVGhpcyBwYXRjaCBlbnN1cmVzIHRoZSB4bWF0Y2ggaXMgc2V0IHVwIHByb3Blcmx5IGZv
ciBudWxsIHByb2ZpbGVzLgoKU2lnbmVkLW9mZi1ieTogUnlhbiBMZWUgPHJ5YW4ubGVlQGNhbm9u
aWNhbC5jb20+Ci0tLQogc2VjdXJpdHkvYXBwYXJtb3IvcG9saWN5LmMgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2FwcGFybW9yL3Bv
bGljeS5jIGIvc2VjdXJpdHkvYXBwYXJtb3IvcG9saWN5LmMKaW5kZXggZjUwM2RjZDNhYzc0Li42
MzhiMGQ2NzUzZWYgMTAwNjQ0Ci0tLSBhL3NlY3VyaXR5L2FwcGFybW9yL3BvbGljeS5jCisrKyBi
L3NlY3VyaXR5L2FwcGFybW9yL3BvbGljeS5jCkBAIC02NTksNiArNjU5LDcgQEAgc3RydWN0IGFh
X3Byb2ZpbGUgKmFhX2FsbG9jX251bGwoc3RydWN0IGFhX3Byb2ZpbGUgKnBhcmVudCwgY29uc3Qg
Y2hhciAqbmFtZSwKIAogCS8qIFRPRE86IGlkZWFsbHkgd2Ugc2hvdWxkIGluaGVyaXQgYWJpIGZy
b20gcGFyZW50ICovCiAJcHJvZmlsZS0+bGFiZWwuZmxhZ3MgfD0gRkxBR19OVUxMOworCXByb2Zp
bGUtPmF0dGFjaC54bWF0Y2ggPSBhYV9nZXRfcGRiKG51bGxwZGIpOwogCXJ1bGVzID0gbGlzdF9m
aXJzdF9lbnRyeSgmcHJvZmlsZS0+cnVsZXMsIHR5cGVvZigqcnVsZXMpLCBsaXN0KTsKIAlydWxl
cy0+ZmlsZSA9IGFhX2dldF9wZGIobnVsbHBkYik7CiAJcnVsZXMtPnBvbGljeSA9IGFhX2dldF9w
ZGIobnVsbHBkYik7Ci0tIAoyLjQzLjAKCg==
--000000000000695e4106204d8700--

