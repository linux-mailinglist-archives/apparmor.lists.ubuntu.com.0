Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89F36DF4C
	for <lists+apparmor@lfdr.de>; Wed, 28 Apr 2021 21:01:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lbpRJ-00036c-JN; Wed, 28 Apr 2021 19:01:37 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lbpRI-00036V-8k
 for apparmor@lists.ubuntu.com; Wed, 28 Apr 2021 19:01:36 +0000
Received: by mail-lf1-f50.google.com with SMTP id 2so8199010lft.4
 for <apparmor@lists.ubuntu.com>; Wed, 28 Apr 2021 12:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=03FgQ3ollyl6QmoroqbPvJAUr0M0s0sTaQuKtZBtW1A=;
 b=EAzsKD4FC4046zKHTtNne6Fq/16VuxxHinAYP3yY4Q5HhMmC3Pgg0E/6Z7mxmFwyx2
 K3e7a/a+zduKkyeWX2U4It7Vz+9gUTtFSDbQ4zfdoPlGu3A0aAGtp/TDuIDkE84dw7U3
 j+dz4CYDXQ8gBxYK1feQ4LcX+W4CEwbg12z8VLvf0CbGV1Ns9PiAca2UuYZNQ2vtgpXo
 hS0kTSs9vftJL7WjKjvFNm3ET9+S4fktZBaAx6kFm95BNWiC66/ni7QO7UdGqrx0fQX6
 NXNNNCWKkaYHb9E2gqEM8b7ZdePj1QVjzxS6PDPi4NK8UapGdVv21YOJj/dvMvoVFisH
 Rd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=03FgQ3ollyl6QmoroqbPvJAUr0M0s0sTaQuKtZBtW1A=;
 b=Lh4Gt3gCMYJLRhQ/enlC4q1nr3SNliyCj7xNKyZ8pQUai9qYI43S27GUbfXz48jSjp
 HGCUYchD5jy/EuvO9PVG0xeBUVS5/DG2aZeJZls8gB3xUO7du8t4kQJhRs497Fphi6mV
 ENXugyCUqzlFZU/vRqDlggAzf0uGNDYFNgT1QhhL9Uk7l8RmFn01eswQ02nq3aXi2ALU
 nakZNdRzwBX9/GLmfs+w7Q1S0LzRK0XXCEkFBuc6o229iAoDg87kOrZD6g+S5yX+LPmN
 jp9T8xIsz3u8YuXYM0lrkVAAqx730O7Ldds7/k1UGVT+ITOQBZK2s5nBKgljfcmOFbo0
 GWCA==
X-Gm-Message-State: AOAM532isrsPjY0EkFa0tw+IC+NKnji0fjTwJBW5hrx6lP5eey329++8
 L89s8sxAbfivCbPf9rWAZ8fv0p1dT9LqVp+MScU=
X-Google-Smtp-Source: ABdhPJzhPpsu6qWICzSnNKjughuaDmWbpNrtFgHj9NtIpABJj5T72ZO/qOqGSOXWOLoD+BT36hfhRkiHJ17f4L32zt8=
X-Received: by 2002:a05:6512:78c:: with SMTP id
 x12mr21558965lfr.462.1619636495124; 
 Wed, 28 Apr 2021 12:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ5-vQeqWtgWmwO=Qp21=JjeC5zJCzZ-zkpQT2hQNONqcQ@mail.gmail.com>
 <CAODFaZ7jKw4vugyvUsVeckzMmEooj6kPGRfJwbNbrH_uG=awOQ@mail.gmail.com>
 <CAODFaZ4hxO9Rmj04AFAn0nGA=8LPFUdUERUNDEGznF2HEDesww@mail.gmail.com>
 <1845778.uqYG4e8EI7@tux.boltz.de.vu>
In-Reply-To: <1845778.uqYG4e8EI7@tux.boltz.de.vu>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Thu, 29 Apr 2021 00:31:23 +0530
Message-ID: <CAODFaZ7+_anXqMbkyHrupc8CMxS0OfaGTX0EF_mZx46=7TF-=g@mail.gmail.com>
To: Christian Boltz <apparmor@cboltz.de>
Received-SPF: pass client-ip=209.85.167.50;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lf1-f50.google.com
Subject: Re: [apparmor] Apparmor: Query on adding many capabilities in the
 custom header file
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
Cc: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

VGhhbmtzIENocmlzdGlhbiAgZm9yIHRoZSBpbnB1dHMuCgpJIGhhdmUgY3JlYXRlZCBhIGhlYWRl
ciBmaWxlIGFzIGZvbGxvd3MgYW5kIGluY2x1ZGVkIGluIHRoZSBhcHBhcm1vciBwcm9maWxlLgoK
YWRtaW5AdGVzdDovZXRjL2FwcGFybW9yLmQjIGNhdCBjYXBzL2RlZmF1bHQKY2FwYWJpbGl0eSBj
aG93biBkYWNfb3ZlcnJpZGUgZGFjX3JlYWRfc2VhcmNoIGZvd25lciBmc2V0aWQga2lsbAppcGNf
bG9jayBzeXNfbmljZSBzZXRwY2FwIGlwY19vd25lciBzeXNfcHRyYWNlIHN5c19jaHJvb3QsCmFk
bWluQHRlc3Q6L2V0Yy9hcHBhcm1vci5kIwoKcHJvZmlsZSA6CmNhdCB1c3IuYmluLmZvbwpwcm9m
aWxlIGZvby91c3IvYmluL2ZvbyBmbGFncz0oYXR0YWNoX2Rpc2Nvbm5lY3RlZCkgewogICAgI2lu
Y2x1ZGUgPGNhcHMvZGVmYXVsdD4KICAgIGNhcGFiaWxpdHkgc2V0Z2lkLAogICAgY2FwYWJpbGl0
eSBzZXR1aWQsCiAgICAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9vbmxpbmUgciwKICAgIC9zeXMv
ZGV2aWNlcy9zeXN0ZW0vY3B1L3Bvc3NpYmxlIHIsCiAgICAvc3lzL2RldmljZXMvc3lzdGVtL2Nw
dS9wcmVzZW50IHIsCn0KCmFkbWluQHRlc3Q6fiMgc2ggL2V0Yy9hcHBhcm1vci9hcHBhcm1vcl9w
YXJzZS5zaApXYXJuaW5nIGZyb20gc3RkaW4gKGxpbmUgMSk6IGNvbmZpZyBmaWxlICcvZXRjL2Fw
cGFybW9yL3BhcnNlci5jb25mJyBub3QgZm91bmQKQXBwQXJtb3IgcGFyc2VyIGVycm9yIGZvciAv
ZXRjL2FwcGFybW9yLmQvY2FwcyBpbgovZXRjL2FwcGFybW9yLmQvY2Fwcy9kZWZhdWx0IGF0IGxp
bmUgMTogc3ludGF4IGVycm9yLCB1bmV4cGVjdGVkClRPS19DQVBBQklMSVRZLCBleHBlY3Rpbmcg
JGVuZAphZG1pbkB0ZXN0On4jCgpUaGlzIHN5bnRheCBpc3N1ZSBpbnR1cm4gc2V0IGFwcGFybW9y
IHNlcnZpY2UgYXMgYSBmYWlsZWQgc3RhdGUuICBCdXQKdGhlIHByb2Nlc3MvcHJvZmlsZSBsb2Fk
ZWQgaW4gZW5mb3JjZS1tb2RlLgril48gYXBwYXJtb3Iuc2VydmljZSAtIEFwcEFybW9yIGluaXRp
YWxpemF0aW9uCiAgICAgTG9hZGVkOiBsb2FkZWQgKC9saWIvc3lzdGVtZC9zeXN0ZW0vYXBwYXJt
b3Iuc2VydmljZTsgZW5hYmxlZDsKdmVuZG9yIHByZXNldDogZW5hYmxlZCkKICAgICBBY3RpdmU6
IGZhaWxlZCAoUmVzdWx0OiBleGl0LWNvZGUpIHNpbmNlIFN1biAyMDIxLTA0LTI1IDIzOjIwOjEy
ClVUQzsgMiBkYXlzIGFnbwogICAgICAgRG9jczogbWFuOmFwcGFybW9yKDcpCiAgICAgICAgICAg
ICBodHRwOi8vd2lraS5hcHBhcm1vci5uZXQvCiAgICBQcm9jZXNzOiAyNjU4IEV4ZWNTdGFydD0v
ZXRjL2FwcGFybW9yL2FwcGFybW9yX3BhcnNlLnNoCihjb2RlPWV4aXRlZCwgc3RhdHVzPTEvRkFJ
TFVSRSkKICAgTWFpbiBQSUQ6IDI2NTggKGNvZGU9ZXhpdGVkLCBzdGF0dXM9MS9GQUlMVVJFKQoK
QWZ0ZXIgbG9hZGluZyB0aGUgcHJvZmlsZSAoZW5mb3JjZSBtb2RlKSwgdGhlIGhlYWRlciBmaWxl
IGNoYW5nZSBoYXMKYmVlbihjYXBhYmlsaXR5KSBhcHBsaWVkLgpCdXQgSSBoYXZlIHNlZW4gdGhp
cyBzeW50YXggZXJyb3IgaW4gYXBwYXJtb3Igc3lzdGVtZCBzZXJ2aWNlLgoKSSBjb25maXJtZWQg
dGhhdCB0aGlzIGlzIGR1ZSB0byBoZWFkZXIgZmlsZSBbIEkgaGFkIGNvbW1lbnQgdGhpcyBsaW5l
CmFuZCBkbyBub3Qgc2VlIGFueSBlcnJvciBdCgpDYW4geW91IHBsZWFzZSBoZWxwIHVzIHRvIHJl
c29sdmUgdGhpcyBzeW50YXggZXJyb3IgKEFwcEFybW9yIHBhcnNlcgplcnJvciBmb3IgL2V0Yy9h
cHBhcm1vci5kL2NhcHMgaW4gL2V0Yy9hcHBhcm1vci5kL2NhcHMvZGVmYXVsdCBhdCBsaW5lCjE6
IHN5bnRheCBlcnJvciwgdW5leHBlY3RlZCBUT0tfQ0FQQUJJTElUWSwgZXhwZWN0aW5nICRlbmQp
CgpUaGFua3MKTXVyYWxpLlMKCk9uIFN1biwgQXByIDI1LCAyMDIxIGF0IDI6MTggQU0gQ2hyaXN0
aWFuIEJvbHR6IDxhcHBhcm1vckBjYm9sdHouZGU+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBBbSBT
YW1zdGFnLCAyNC4gQXByaWwgMjAyMSwgMTU6NDY6MjIgQ0VTVCBzY2hyaWViIE11cmFsaSBTZWx2
YXJhajoKPiA+IENhbiB5b3UgcGxlYXNlIGd1aWRlIG1lIHRvIHJlc29sdmUgdGhlIGFib3ZlIHF1
ZXJ5IG9uIHRoZSBoZWFkZXIgZmlsZQo+ID4gd2l0aCBlbmFibGluZyBtYW55IGNhcGFiaWxpdGll
cyBpbiB0aGUgaGVhZGVyIGZpbGU/Cj4KPiBhKSAvbnZyYW0yL2FwcGFybW9yX2Jvb3QvY2Fwcy9j
b21tb24KPgo+ICAgICBjYXBhYmlsaXR5IGNob3duIGRhY19vdmVycmlkZSBkYWNfcmVhZF9zZWFy
Y2ggZm93bmVyIGZzZXRpZCBraWxsIGlwY19sb2NrIHN5c19uaWNlIHNldHBjYXAgcGNfb3duZXIg
c3lzX3B0cmFjZSBzeXNfY2hyb290LAo+Cj4gb3IgKHNhbWUgbWVhbmluZywgYnV0IG1vcmUgcmVh
ZGFibGUpCj4KPiAgICAgY2FwYWJpbGl0eSBjaG93biwKPiAgICAgY2FwYWJpbGl0eSBkYWNfb3Zl
cnJpZGUsCj4gICAgIGNhcGFiaWxpdHkgZGFjX3JlYWRfc2VhcmNoLAo+ICAgICBjYXBhYmlsaXR5
IGZvd25lciwKPiAgICAgY2FwYWJpbGl0eSBmc2V0aWQsCj4gICAgIGNhcGFiaWxpdHkga2lsbCwK
PiAgICAgY2FwYWJpbGl0eSBpcGNfbG9jaywKPiAgICAgY2FwYWJpbGl0eSBzeXNfbmljZSwKPiAg
ICAgY2FwYWJpbGl0eSBzZXRwY2FwLAo+ICAgICBjYXBhYmlsaXR5IHBjX293bmVyLAo+ICAgICBj
YXBhYmlsaXR5IHN5c19wdHJhY2UsCj4gICAgIGNhcGFiaWxpdHkgc3lzX2Nocm9vdCwKPgo+Cj4g
YikgL252cmFtMi9hcHBhcm1vcl9ib290L3Vzci5iaW4udGVzdAo+Cj4gICAgIHByb2ZpbGUgdGVz
dCAvdXNyL2Jpbi90ZXN0IGZsYWdzPShhdHRhY2hfZGlzY29ubmVjdGVkKSB7Cj4gICAgICAgICAj
aW5jbHVkZSAiL252cmFtMi9hcHBhcm1vcl9ib290L2NhcHMvY29tbW9uIgo+ICAgICAgICAgY2Fw
YWJpbGl0eSBzZXR1aWQsCj4gICAgICAgICBjYXBhYmlsaXR5IHNldGdpZCwKPgo+ICAgICAgICAg
L3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvb25saW5lIHIsCj4gICAgICAgICBbLi4uIGFsbCB5b3Vy
IG90aGVyIHJ1bGVzIC4uLl0KPiAgICAgfQo+Cj4gTm90ZSB0aGF0IHlvdSBuZWVkIHRvIG1vdmUg
dGhlIGluY2x1ZGUgaW5zaWRlIHRoZSBwcm9maWxlLgo+Cj4KPiBSZWdhcmRzLAo+Cj4gQ2hyaXN0
aWFuIEJvbHR6Cj4gLS0KPiA+SW4gWWFzdDItU3lzdGVtLUVkaXRvciAvZXRjL3N5c2NvbmZpZy1E
YXRlaWVuIGluCj4gPlN5c3RlbS1LZXJuZWwtTU9EVUxFU19MT0FERURfT05fQk9PVCBpZGUtc2Nz
aSBlaW50cmFnZW4uCj4gKkpBVVVVVVVVVVVMTExMTCogKkFSUlJHR0hISEgqCj4gTWFuIHJlaWNo
ZSBtaXIgZWluZSBLbGluaWstSmFocmVzcGFja3VuZyB2b24gJFNDSE1FUlpNSVRURUwhISEKPiBb
PiBIZWlueiBEaXR0bWFyIHVuZCBEYXZpZCBIYWxsZXIgaW4gc3VzZS1saW51eF0KCi0tIApBcHBB
cm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGlu
Z3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2FwcGFybW9yCg==
