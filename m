Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BA63A7263
	for <lists+apparmor@lfdr.de>; Tue, 15 Jun 2021 01:14:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lsvmJ-0006VZ-3v; Mon, 14 Jun 2021 23:13:59 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lsvmG-0006VS-Ov
 for apparmor@lists.ubuntu.com; Mon, 14 Jun 2021 23:13:56 +0000
Received: by mail-lj1-f179.google.com with SMTP id r14so22225332ljd.10
 for <apparmor@lists.ubuntu.com>; Mon, 14 Jun 2021 16:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=XyJHx8Z60ZBKwHjksc2xb6w79eo7dxnG6YYi6+j2+2g=;
 b=K3+FmiAEt6MfW7cuNu/601t8qaQj0qgdO+Tjnuty59uGnTnz83ibpibqx8X9ufHGgc
 /rbFMvW7kymiQZeFp98HBbLq45fwgwCS4QhKMpzqAT+Ux5yplGYvfLfQ+is7etMR1CrH
 FhEFo2zbAx3DqLy2ZUEAl3MzUEkwFS+3KwakwkI4QULZauk3RrNmv4NRQ7wOVWTi3JXZ
 Px0AY4CFtQ831H68O1bQIXAu5ZLN3++IRFu8DMZGKuET8HXEw1z6/znXcTSD1mKTUIJ9
 b+5YaM+QfyZxumwctVev1qNlCj2m3lEtS6qevjEniZqDWq2qQOtVTxqizwOIg672dNdf
 w1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=XyJHx8Z60ZBKwHjksc2xb6w79eo7dxnG6YYi6+j2+2g=;
 b=lQQ1URiM6icU/thTmGuUesjFTtLZ5AYWFSPiTWS3+Vb4ul7pNYBYS/wQDVZPo2Sw07
 d+CsYiX3kqFrejIA4sDDMTol3L2GGI+sVjhJynJCfs4AGPJ8uLChQwudug4RXiU5tc1f
 bG3Od6u9SGkA0inSAIf/AcOFLrlO5TyYyxZeKHdZ2s0ztGLUw5O+UdGfbFeupKxDNDod
 b+nKkhWrC0rLfpPkt8y7qSYMsXDiMrUzAxYyZXZs2G7oICtwU6AOqVfMyd/XgIs/1wHe
 9spOjtTRGbgSf8N4331KWscgYYBsi8Yk/HGkOTcBDoLWzvSQBGPlmvLunholKjlRQ3Hg
 kfcQ==
X-Gm-Message-State: AOAM5310XVOJlAx+KDFvS75ZeWOUVoXJ4D3wZyBDAYU9b3k/gQtN1mXf
 2PExlJquwMqN9yiwOHIAadcLAvxCglADR7faqzXEVGhQV9c=
X-Google-Smtp-Source: ABdhPJwHSt96BbDzAhC51ezLobNYug26yX3zdUJ3jOUY6LbaHmWmtmQydfwsMJj1Tu/9YIqrVva/iA+KmTpusj1o+ew=
X-Received: by 2002:a2e:921a:: with SMTP id k26mr4521584ljg.505.1623712435853; 
 Mon, 14 Jun 2021 16:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ7Th4AxW0kdavbnNdq6+U+vNyytSm1rU5SrA1ah+BZ0+g@mail.gmail.com>
 <f438b235-da3c-86f9-a847-e60b84023ab1@schaufler-ca.com>
 <CAODFaZ7YTmYuTB=QAjXevfnE=di8yqKtVK-nvTCyjhUAQRGvTA@mail.gmail.com>
In-Reply-To: <CAODFaZ7YTmYuTB=QAjXevfnE=di8yqKtVK-nvTCyjhUAQRGvTA@mail.gmail.com>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 15 Jun 2021 04:43:44 +0530
Message-ID: <CAODFaZ5fP=qm3T16VGjNrqEKF3OWpc=J9BX3m4iNYwJs2whCiw@mail.gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>, apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.208.179;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f179.google.com
Subject: Re: [apparmor] When DAC fails/invokes Apparmor Hooks with example
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

SGkgQ2FzZXksCgpJIHdhcyBleHBlY3RpbmcgQXBwYW1vciBsb2dzIGZvciB0aGUgYWJvdmUgc2Ny
aXB0IHdoZW4gaXQgcnVucyBpbgpBcHBhcm1vIGNvbXBsYWluIG1vZGUuCkRvIEkgbmVlZCB0byB1
cGRhdGUvbW9kaWZ5IHRvIHJlYWNoIEFwcGFybW9yIExTTSBob29rcz8KClBsZWFzZSBzaGFyZSB5
b3VyIGlucHV0cy4KClRoYW5rcwpNdXJhbGkuUwoKT24gVHVlLCBKdW4gMTUsIDIwMjEgYXQgNDoz
MiBBTSBNdXJhbGkgU2VsdmFyYWoKPG11cmFsaS5zZWx2YXJhajIwMDNAZ21haWwuY29tPiB3cm90
ZToKPgo+IEhpIENhc2V5LAo+Cj4gSSBhbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGF0IG9uY2Ug
YSBEQUMgY2hlY2sgcGFzc2VzLCBpdCB3aWxsIGludm9rZQo+IEFwcGFybW9yIGxvZ3MuCj4gSSBs
b2FkZWQgdGhpcyBzY3JpcHQgd2l0aCBhbiBlbXB0eSBwcm9maWxlIGluIGNvbXBsaWFudCBtb2Rl
IHRvCj4gY2FwdHVyZSBBcHBhcm1vciBsb2dzLgo+Cj4gQXMgbWVudGlvbmVkLCBJIGNvdWxkIG5v
dCBzZWUgQXBwYXJtb3IgbG9ncy4gRG8gSSBuZWVkIHRvIGNoYW5nZQo+IGFueXRoaW5nIGluIHRo
ZSBzY3JpcHQgdG8gaW52b2tlIEFwcGFybW9yL0xTTSBob29rcyB0byBjb2xsZWN0Cj4gQXBwYXJt
b3IgbG9ncy4KPgo+IFRoYW5rcwo+IE11cmFsaS5TCj4KPiBPbiBUdWUsIEp1biAxNSwgMjAyMSBh
dCA0OjI0IEFNIENhc2V5IFNjaGF1ZmxlciA8Y2FzZXlAc2NoYXVmbGVyLWNhLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gT24gNi8xNC8yMDIxIDM6NDUgUE0sIE11cmFsaSBTZWx2YXJhaiB3cm90ZToKPiA+
ID4gSGkgQWxsLAo+ID4gPgo+ID4gPiBJbiBnZW5lcmFsLCBBcHBhcm1vciBob29rcyB3aWxsIGJl
IGNhbGxlZCBhZnRlciBEQUMgY2hlY2svdmFsaWRhdGlvbi4KPiA+ID4gSSB3b3VsZCBsaWtlIHRv
IHVuZGVyc3RhbmQgdGhlIHRoZW9yeSBieSB3cml0aW5nIGludG8gYSBzYW1wbGUgc2NyaXB0Cj4g
PiA+IGFzIGZvbGxvd3MuCj4gPiA+Cj4gPiA+IENyZWF0ZWQgYW4gZW1wdHkgcHJvZmlsZSBmb3Ig
dGhpcyBkZW1vLnNoIGluIGNvbXBsYWluIG1vZGUgdG8gdW5kZXJzdGFuZCB3aGF0Cj4gPiA+IHRo
ZSBvcGVyYXRpb24gaGFzIGJlZW4gZG9uZSBhcyBwYXJ0IG9mIHRoZSBzY3JpcHQuCj4gPiA+Cj4g
PiA+IEhvd2V2ZXIsIEkgY291bGQgbm90IHNlZSBhbnkgYXBwYXJtb3IgbG9ncyAoY29tcGxhaW50
IG1vZGUgbG9ncwo+ID4gPiBBTExPV0VEKSBmb3IgdGhpcyBzY3JpcHQgcHJvZmlsZS4KPiA+ID4g
Q2FuIHlvdSBwbGVhc2Ugc3VnZ2VzdCB3aGF0IGNoYW5nZXMgbmVlZCB0byBiZSBkb25lIGluIHRo
ZSBzY3JpcHQgaW4KPiA+ID4gb3JkZXIgdG8gcmVhY2ggQXBwYXJtb3IgaG9va3MKPiA+ID4gdG8g
Z2V0IHRoZSBBcHBhcm1vciBsb2dzLgo+ID4gPgo+ID4gPiBBbHNvLCBwbHMgYWR2aXNlIG1lIG9u
IGhvdyB0byBmaW5kIHdoZW4gREFDIHdvdWxkIGJlIGZhaWxlZC9EQUMgZ2l2ZW4KPiA+ID4gZGV0
YWlscyB0byBBcHBhcm1vciBob29rcy4KPiA+ID4gUGxzIHNoYXJlIGFueSBlYXN5IHJlZmVyZW5j
ZSBjb2RlIG9yIHNhbXBsZSBjb2RlIGZvciB1bmRlcnN0YW5kaW5nLgo+ID4gPgo+ID4gPiAjIS9i
aW4vYmFzaAo+ID4gPiB3aGlsZSBbIDEgXSA7IGRvCj4gPiA+IGVjaG8gLW4gIkhvdyBBcHBhcm1v
ciBjYWxsZWQgYWZ0ZXIgREFDIgo+ID4gPiBjYXQgL3Byb2Mvc2VsZi9hdHRyL2N1cnJlbnQKPiA+
ID4ga2lsbCAtMTEgMQo+ID4gPiBpcHRhYmxlcyAtLWxpc3QKPiA+ID4gcGluZyA4LjguOC44Cj4g
PiA+IHNsZWVwIDYwCj4gPiA+IGRvbmUKPiA+Cj4gPiBXaGF0IGRvIHlvdSBleHBlY3QgdGhpcyBz
Y3JpcHQgdG8gZG8/Cj4gPgo+ID4gPgo+ID4gPiBUaGFua3MKPiA+ID4gTXVyYWxpLlMKPiA+ID4K
Ci0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2Rp
Znkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
