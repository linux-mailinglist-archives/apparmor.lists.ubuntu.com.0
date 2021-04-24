Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1D836A169
	for <lists+apparmor@lfdr.de>; Sat, 24 Apr 2021 15:46:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1laIcG-0006Lq-Pv; Sat, 24 Apr 2021 13:46:36 +0000
Received: from mail-lj1-f176.google.com ([209.85.208.176])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1laIcF-0006Li-2O
 for apparmor@lists.ubuntu.com; Sat, 24 Apr 2021 13:46:35 +0000
Received: by mail-lj1-f176.google.com with SMTP id o5so25671393ljc.1
 for <apparmor@lists.ubuntu.com>; Sat, 24 Apr 2021 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SOxZ3zK6JGhqQ5nmLuU+apfRJpRDjXdOEXJeC2zNtwY=;
 b=uT/8mKl+oyd5kIdtqeiXgBiBQZ+J58fnSO7wCauVAN6bgFEszxrTkY0kl6je8xUlTo
 VRQvG7GJuqM0d5LZVD6VamtbZEroo5jqJaa09EfkEEvoeKVL8I5P9r3OaVOqO3BHiHGs
 RQ71Qt0W0Yju/zTIRorPlnUvbGt6LZl5j3p+cJNAEDcB9NCT9OdLHD/jUgbVQS3x6W8t
 687h6/CO8wh4+NHUVjUO4jCf0q2tcuHfkCEXdSqH/40RQrnmfD3vpyP11hTMRfmzKI2T
 FecyLbFOVjXOGyO7/j/lBFnQRwyEZkAk7IVpFWkv8TkVjEjiy8U2Ep1KUHOWPmhmHvOU
 0yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SOxZ3zK6JGhqQ5nmLuU+apfRJpRDjXdOEXJeC2zNtwY=;
 b=elHaLzd0wd0SV+EW8QlDdRTmf9MEvxVONNjJcesUlJ3YkeSgOdIgWEOVqvAS3zARfv
 ivgfflMym0NwmXd5tZBxtPYf7QI77zZbc1sTb0AXiHOgusdp07ozKseH4P71by1rqGlI
 VGy2CNDXasapJxnpkZYkErUCs7kFtS6ysPvWR3uW6gxjLgXKdvE4HPShxpSf+zd1TMbN
 v8wPa3P0GhXen+S6R1NF9rRHLadjSA2cr3e2q5jVQzrdnhHrDwb4TkV0YbBdZKPM41fR
 QjjPxl5KQj8JJ6VXuUFXEWL5JXFlSPooLYE2iME0ClIrJ4yKYNOEL3nuD4y5qcb8Lni6
 2+Pw==
X-Gm-Message-State: AOAM533g9r+6tGnokteGis3OIAisggfuTUG+Bw+AKCMB5rh8hx/XKy4g
 hE9HDnqbbbaGS3sV66neCkmnPmHV9DVq0G5L2Zw=
X-Google-Smtp-Source: ABdhPJx0DS1OwDbrjuFpkFMjSb6BcnT/2DY9bj2FeW2Qzy+ITEjyuxThOOO/I/MYEExTPRxVMkncV1xO+vJUj7NRIMI=
X-Received: by 2002:a05:651c:1190:: with SMTP id
 w16mr2701709ljo.386.1619271994012; 
 Sat, 24 Apr 2021 06:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ5-vQeqWtgWmwO=Qp21=JjeC5zJCzZ-zkpQT2hQNONqcQ@mail.gmail.com>
 <f0c9334a-7b73-8f48-d1ee-4294efb00120@canonical.com>
 <CAODFaZ7jKw4vugyvUsVeckzMmEooj6kPGRfJwbNbrH_uG=awOQ@mail.gmail.com>
In-Reply-To: <CAODFaZ7jKw4vugyvUsVeckzMmEooj6kPGRfJwbNbrH_uG=awOQ@mail.gmail.com>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Sat, 24 Apr 2021 19:16:22 +0530
Message-ID: <CAODFaZ4hxO9Rmj04AFAn0nGA=8LPFUdUERUNDEGznF2HEDesww@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Received-SPF: pass client-ip=209.85.208.176;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f176.google.com
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
Cc: Seth Arnold <seth.arnold@canonical.com>, apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

SGkgSm9obi9TZXRoLAoKQ2FuIHlvdSBwbGVhc2UgZ3VpZGUgbWUgdG8gcmVzb2x2ZSB0aGUgYWJv
dmUgcXVlcnkgb24gdGhlIGhlYWRlciBmaWxlCndpdGggZW5hYmxpbmcgbWFueSBjYXBhYmlsaXRp
ZXMgaW4gdGhlIGhlYWRlciBmaWxlPwoKVGhhbmtzCk11cmFsaS5TCgpPbiBUaHUsIEFwciAyMiwg
MjAyMSBhdCA5OjE1IFBNIE11cmFsaSBTZWx2YXJhago8bXVyYWxpLnNlbHZhcmFqMjAwM0BnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gSGkgSm9obiwKPgo+IEkgYW0gc3RpbGwgZmFjaW5nIGJlbG93IGVy
cm9yIHdoaWxlIHBhcnNpbmcgdGhlIHByb2ZpbGUuCj4KPiBXaGlsZSBwYXJzaW5nIHByb2ZpbGVz
IHNoIC14IC9ldGMvYXBwYXJtb3IvYXBwYXJtb3JfcGFyc2Uuc2gKPiBBcHBBcm1vciBwYXJzZXIg
ZXJyb3IgZm9yIC9udnJhbTIvYXBwYXJtb3JfYm9vdC91c3IuYmluLnRlc3QgaW4KPiAvbnZyYW0y
L2FwcGFybW9yX2Jvb3QvdXNyLmJpbi50ZXN0IGF0IGxpbmUgNTogc3ludGF4IGVycm9yLCB1bmV4
cGVjdGVkCj4gVE9LX1NFVF9WQVIsIGV4cGVjdGluZyBUT0tfSUQgb3IgVE9LX0VORF9PRl9SVUxF
Cj4KPiBtdXJhbGlAbGludXg6L252cmFtMi9hcHBhcm1vcl9ib290IyBjYXQgY2Fwcy9jb21tb24K
PiBAe2RlZmF1bHRfY2Fwc309Y2hvd24sZGFjX292ZXJyaWRlLGRhY19yZWFkX3NlYXJjaCxmb3du
ZXIsZnNldGlkLGtpbGwsaXBjX2xvY2ssc3lzX25pY2Usc2V0cGNhcCxwY19vd25lcixzeXNfcHRy
YWNlLHN5c19jaHJvb3QKPgo+ICNpbmNsdWRlICIvbnZyYW0yL2FwcGFybW9yX2Jvb3QvY2Fwcy9j
b21tb24iCj4gcHJvZmlsZSB0ZXN0IC91c3IvYmluL3Rlc3QgZmxhZ3M9KGF0dGFjaF9kaXNjb25u
ZWN0ZWQpIHsKPiAgICAgY2FwYWJpbGl0eSBzZXR1aWQsCj4gICAgIGNhcGFiaWxpdHkgc2V0Z2lk
LAo+ICAgICBjYXBhYmlsaXR5IEB7ZGVmYXVsdF9jYXBzfSwgID09PT4+IFRoaXMgbGluZSBzaG93
cyBzeW50YXggZXJyb3IgWwo+IHN5bnRheCBlcnJvciwgdW5leHBlY3RlZCBUT0tfU0VUX1ZBUiwg
ZXhwZWN0aW5nIFRPS19JRCBvcgo+IFRPS19FTkRfT0ZfUlVMRSBdCj4gICAgIC9zeXMvZGV2aWNl
cy9zeXN0ZW0vY3B1L29ubGluZSByLAo+ICAgICAvZXRjL3NlY3VyaXR5LyogciwKPiAgICAgL3By
b2MvZHJpdmVyL25nMS8qIHJ3LAo+ICAgICAvcHJvYy9zeXMva2VybmVsL25ncm91cHNfbWF4IHIs
Cj4gICAgIC91c3IvY2NzcC9ldGhhZ2VudC8gciwKPiAgICAgL3Byb2MvKi9jb21tIHIsCj4gICAg
IC9wcm9jLyovYXV4diByLAo+ICAgICAvcHJvYy8qL2NtZGxpbmUgciwKPiAgICAgL3Byb2MvKi9l
bnZpcm9uIHIsCj4gICAgIC9wcm9jLyovbGltaXRzIHIsCj4gICAgIC9wcm9jLyovc3RhdCByLAo+
IH0KPgo+IENhbiB5b3UgcGxlYXNlIGhlbHAgdXMgdG8gcmVzb2x2ZSB0aGlzIGVycm9yPwo+Cj4g
VGhhbmtzCj4gTXVyYWxpLlMKPgo+IE9uIFRodSwgQXByIDIyLCAyMDIxIGF0IDEwOjUxIEFNIEpv
aG4gSm9oYW5zZW4KPiA8am9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiA0LzIwLzIxIDEwOjAxIEFNLCBNdXJhbGkgU2VsdmFyYWogd3JvdGU6Cj4gPiA+IEhpIEFs
bCwKPiA+ID4KPiA+ID4gQXMgcGVyIG91ciBkZXNpZ24gLCB3ZSBhcmUgYXBwbHlpbmcgY2VydGFp
biBjYXBhYmlsaXRpZXMgdG8gYWxsIG15IHByb2ZpbGVzLgo+ID4gPgo+ID4gPiAtPiBjcmVhdGVk
IGN1c3RvbSBpbmNsdWRlIGZpbGVzIGFzIGZvbGxvdyBpbiAjaW5jbHVkZSAicmVsYXRpdmVfcGF0
aCIKPiA+ID4gICAgQHtkZWZhdWx0X2NhcHN9PWNob3duLGRhY19vdmVycmlkZSxkYWNfcmVhZF9z
ZWFyY2gsZm93bmVyLGZzZXRpZCxraWxsLGlwY19sb2NrLHN5c19uaWNlLHNldHBjYXAsaXBjX293
bmVyLHN5c19wdHJhY2Usc3lzX2Nocm9vdAo+ID4gPgo+ID4gPiAtPiBBZGRpbmcgdGhpcyBoZWFk
ZXIgZmlsZSBpbiB0aGUgcmVxdWlyZWQgYXBwYXJtb3IgcHJvZmlsZXMuCj4gPiA+ICAgICNpbmNs
dWRlICJyZWxhdGl2ZV9wYXRoIgo+ID4gPiAgICBjYXBhYmlsaXR5IEB7ZGVmYXVsdF9jYXBzfSwK
PiA+ID4KPiA+ID4gLT4gV2hpbGUgcGFyc2luZyB0aGUgYXBwYXJtb3IgcHJvZmlsZXMgaW50byBL
ZXJuZWwsIG9ic2VydmluZyBiZWxvdyBlcnJvcnMuCj4gPiA+ICAgIHN5bnRheCBlcnJvciwgdW5l
eHBlY3RlZCBUT0tfRVFVQUxTLCBleHBlY3RpbmcgVE9LX01PREUKPiA+ID4KPiA+ID4gQ2FuIHNv
bWVvbmUgaGVscCBtZSB0byBjbGFyaWZ5IHRoZSBhYm92ZSBxdWVyaWVzLgo+ID4gPgo+ID4KPiA+
IEF0IHRoaXMgdGltZSB2YXJpYWJsZSBhc3NpZ25tZW50IGNhbiBub3QgYmUgZG9uZSBpbiB0aGUg
cHJvZmlsZSBib2R5LiBJdCBjYW4gb25seSBhcHBlYXIgaW4gdGhlIHByb2ZpbGUgaGVhZGVyLiBZ
b3UgbmVlZCB0byByZXdvcmsgeW91ciBwcm9maWxlIHRvIGRvCj4gPgo+ID4gaW5jbHVkZSAicmVs
YXRpdmVfcGF0aCIKPiA+Cj4gPiBwcm9maWxlIGV4YW1wbGUgewo+ID4KPiA+ICAgY2FwYWJpbGl0
eSBAe2RlZmF1bHRfY2Fwc30sCj4gPiB9Cj4gPgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApB
cHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBh
dDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK
