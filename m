Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0DC95A486
	for <lists+apparmor@lfdr.de>; Wed, 21 Aug 2024 20:12:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sgpot-0005sG-HN; Wed, 21 Aug 2024 18:12:31 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1sgpor-0005s7-PA
 for apparmor@lists.ubuntu.com; Wed, 21 Aug 2024 18:12:29 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 985C03F0F8
 for <apparmor@lists.ubuntu.com>; Wed, 21 Aug 2024 18:12:29 +0000 (UTC)
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a7aa7e86b5eso587789366b.2
 for <apparmor@lists.ubuntu.com>; Wed, 21 Aug 2024 11:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724263949; x=1724868749;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1uWLkKWIpx8bPr8qs3PNE2aQjpNxNiaRO8WZbqJro9Y=;
 b=mk2UQmwKE29DIrm+cO+58XARXDjx5wDBXeCfH4BayG8iL8zkahUPB6InlGU9BUqVa4
 i0c+QDuoL/ZPPaWRIczX3gvNgSPFR2DlrJGsk2aVVz6fFCriBivLqwoMv5VWKD/ZrxJv
 fcEfjPOdTCzrZx/w5JAWsVrOF9K22w5ngJD/Op01ahY2VMM8Jor+p66MA6+pyyzUTMiF
 v3PGIHVJ95ACJsuMhp895i/Y39ItLyjhyQyQazvIF0VhhZ9M6cIt05XPLAThogljNjpc
 LozstcnFScEEticOOM6IUfATkobGxMhW8gjp0EiHS2u9IQAZkm85+PFN8jz5JeXoMRTP
 amHQ==
X-Gm-Message-State: AOJu0YzYty/hxZZVuNG76mySCo6OaK7gSD7BKhOP2JCOKK32DkwNU/ZO
 oPr8/c3F9d+zkR0WmndcIFJUv2pxiTobddQhFqk0ABOdFoczo+dyQZtxOAqO0V3IHA8WCzhNwZs
 KnF/FJQhkW07ygLzKlaOVZffiQLFoVw5A2+9WY7pI3alhSLrGIvs0xe7qOXjiCEmkNDVAKBkDJ7
 bjpeKzRPj8DvOCkKALYg+yCjrWEbrJPtHfXyKLoXsu6DPAMApIihY5mIY+
X-Received: by 2002:a17:907:1c84:b0:a86:746a:dced with SMTP id
 a640c23a62f3a-a86746adf6dmr239221366b.19.1724263949148; 
 Wed, 21 Aug 2024 11:12:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK/W6yhIj955Qy47yITEBP1Xs4V5THdPQd2YAKtLxg2rdDFEB2kAhjO6IT+zZ98KsO5O5clyNFeKRPK3k04sk=
X-Received: by 2002:a17:907:1c84:b0:a86:746a:dced with SMTP id
 a640c23a62f3a-a86746adf6dmr239218366b.19.1724263948199; Wed, 21 Aug 2024
 11:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAKCV-6sG6apr7WRBEhSqkeOEhF+h1UmgA4ur=RPDBoL7r-q3uw@mail.gmail.com>
In-Reply-To: <CAKCV-6sG6apr7WRBEhSqkeOEhF+h1UmgA4ur=RPDBoL7r-q3uw@mail.gmail.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Wed, 21 Aug 2024 11:12:16 -0700
Message-ID: <CAKCV-6tSbdTJv6WYC4NQv630qzycYSh6ou_9CrU3k8GsdD4fHA@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="00000000000021eb920620357c82"
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

--00000000000021eb920620357c82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After further analysis, the root cause turned out to be the xmatch not
being set up properly when allocating a null profile for learning in
complain mode. Thus, I am withdrawing the above patch and instead
attaching a new patch that does this setup in aa_alloc_null.

Ryan

On Mon, Aug 19, 2024 at 1:05=E2=80=AFPM Ryan Lee <ryan.lee@canonical.com> w=
rote:
>
> find_attach loops over profile entries and first checks for a DFA, fallin=
g
> back onto a strcmp otherwise. However, the check if (attach->xmatch->dfa)
> did not account for the possibility that (attach->xmatch) could be null.
> This occured with a sequence of profile replacements that resulted in a
> kernel BUG print due to the null pointer dereference.
>
> To avoid this issue, first check that (attach->xmatch) is not null.
>
> The one-line patch is attached to the email.
>
> Ryan

--00000000000021eb920620357c82
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-apparmor-allocate-xmatch-for-nullpdf-inside-aa_alloc.patch"
Content-Disposition: attachment; 
	filename="0001-apparmor-allocate-xmatch-for-nullpdf-inside-aa_alloc.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m0467tvr0>
X-Attachment-Id: f_m0467tvr0

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
ciBudWxsIHByb2ZpbGVzLgotLS0KIHNlY3VyaXR5L2FwcGFybW9yL3BvbGljeS5jIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9zZWN1cml0eS9hcHBh
cm1vci9wb2xpY3kuYyBiL3NlY3VyaXR5L2FwcGFybW9yL3BvbGljeS5jCmluZGV4IGY1MDNkY2Qz
YWM3NC4uNjM4YjBkNjc1M2VmIDEwMDY0NAotLS0gYS9zZWN1cml0eS9hcHBhcm1vci9wb2xpY3ku
YworKysgYi9zZWN1cml0eS9hcHBhcm1vci9wb2xpY3kuYwpAQCAtNjU5LDYgKzY1OSw3IEBAIHN0
cnVjdCBhYV9wcm9maWxlICphYV9hbGxvY19udWxsKHN0cnVjdCBhYV9wcm9maWxlICpwYXJlbnQs
IGNvbnN0IGNoYXIgKm5hbWUsCiAKIAkvKiBUT0RPOiBpZGVhbGx5IHdlIHNob3VsZCBpbmhlcml0
IGFiaSBmcm9tIHBhcmVudCAqLwogCXByb2ZpbGUtPmxhYmVsLmZsYWdzIHw9IEZMQUdfTlVMTDsK
Kwlwcm9maWxlLT5hdHRhY2gueG1hdGNoID0gYWFfZ2V0X3BkYihudWxscGRiKTsKIAlydWxlcyA9
IGxpc3RfZmlyc3RfZW50cnkoJnByb2ZpbGUtPnJ1bGVzLCB0eXBlb2YoKnJ1bGVzKSwgbGlzdCk7
CiAJcnVsZXMtPmZpbGUgPSBhYV9nZXRfcGRiKG51bGxwZGIpOwogCXJ1bGVzLT5wb2xpY3kgPSBh
YV9nZXRfcGRiKG51bGxwZGIpOwotLSAKMi40My4wCgo=
--00000000000021eb920620357c82--

