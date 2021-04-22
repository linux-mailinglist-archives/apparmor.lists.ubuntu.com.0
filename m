Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE1A368416
	for <lists+apparmor@lfdr.de>; Thu, 22 Apr 2021 17:45:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lZbWO-0000fH-PT; Thu, 22 Apr 2021 15:45:40 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lZbWN-0000fA-Hu
 for apparmor@lists.ubuntu.com; Thu, 22 Apr 2021 15:45:39 +0000
Received: by mail-lj1-f178.google.com with SMTP id u25so14071695ljg.7
 for <apparmor@lists.ubuntu.com>; Thu, 22 Apr 2021 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NBYxd/YOHd+CrznOde7BLW+hRArk/EmpEaGT4oohDms=;
 b=ClHwaC8/bJA86GA+OTVsXWntRJpqmqk3TZ+KZSYn64b16gmZDCIAMNreXdHIh6Ft0/
 8TSiguj5eLxOiJzgLgmJ+6zuH4DwcEFrbPFLg6pswjQvA5YwbgPuY/ZXY2ZuuWTJnwV+
 Cse+3aG/narfH8swuEHY5+SZaOkh7PEpkJM0m9obTbk85W75K9WBQeoD3x65ElQGZxEX
 CsFg8pv7JLCgyXFJnhCjY8vgzfbzR4DtmbCykl2gX8mWH7F1Kh+D4ge15z/G4aVhtzjo
 T2dbfnU6Rduh6BpNba7kC6c8pouPfMxyY6VGdKfOldt5dZ+YFR95mZ2sIjTVLvpNxGFj
 UOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NBYxd/YOHd+CrznOde7BLW+hRArk/EmpEaGT4oohDms=;
 b=Y5lfq8dMuNdrOByx8HrCJ4elgELW9E38bKjPAEmWyxHjQrnQSayqWKVOkfIsta2D2q
 rEVWH54ubVFbK9yWuiZFqXg/TobFOUyvnC6EV80zZNAqRO0c1eY0aC5AP5slEk0Hj9Sb
 8P9w8pDf1rITGuTUC+x+oQseJYwnYNqdlVDlrNTfbv4OvGa7264TKVCeVenNRDXqGur4
 ubmaQeyvKVzZibAhQzWTXOfNaULtah1CyVygwZKfR/jm+7gpBMTvF9QxP32j7pnlxLJ+
 hP3yyu1L2vFzux+uBJXczOTAFjkUPiNEbnGbk6M1lnZNKbn0ShSYPAJ9ovqzpeJaEdQU
 0W6g==
X-Gm-Message-State: AOAM532imUXbaFaImr6CYfo//MEpTw7WCCzDrPAsLPJg51or1I+uIZc7
 OnleeQvRD15UD7Bt8R5tPB9dq8FnKctsPOr4eb92j4TNtvU=
X-Google-Smtp-Source: ABdhPJzm3D9BvZqP7BTvhDF1rgGYC7GvsiiReD28QV4LuD8KC1GQppE1PwI5kGLwK6tcc4hspyP1XMEBJb5kOSEh9m8=
X-Received: by 2002:a2e:2f05:: with SMTP id v5mr2916494ljv.63.1619106338539;
 Thu, 22 Apr 2021 08:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ5-vQeqWtgWmwO=Qp21=JjeC5zJCzZ-zkpQT2hQNONqcQ@mail.gmail.com>
 <f0c9334a-7b73-8f48-d1ee-4294efb00120@canonical.com>
In-Reply-To: <f0c9334a-7b73-8f48-d1ee-4294efb00120@canonical.com>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Thu, 22 Apr 2021 21:15:27 +0530
Message-ID: <CAODFaZ7jKw4vugyvUsVeckzMmEooj6kPGRfJwbNbrH_uG=awOQ@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Received-SPF: pass client-ip=209.85.208.178;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f178.google.com
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

SGkgSm9obiwKCkkgYW0gc3RpbGwgZmFjaW5nIGJlbG93IGVycm9yIHdoaWxlIHBhcnNpbmcgdGhl
IHByb2ZpbGUuCgpXaGlsZSBwYXJzaW5nIHByb2ZpbGVzIHNoIC14IC9ldGMvYXBwYXJtb3IvYXBw
YXJtb3JfcGFyc2Uuc2gKQXBwQXJtb3IgcGFyc2VyIGVycm9yIGZvciAvbnZyYW0yL2FwcGFybW9y
X2Jvb3QvdXNyLmJpbi50ZXN0IGluCi9udnJhbTIvYXBwYXJtb3JfYm9vdC91c3IuYmluLnRlc3Qg
YXQgbGluZSA1OiBzeW50YXggZXJyb3IsIHVuZXhwZWN0ZWQKVE9LX1NFVF9WQVIsIGV4cGVjdGlu
ZyBUT0tfSUQgb3IgVE9LX0VORF9PRl9SVUxFCgptdXJhbGlAbGludXg6L252cmFtMi9hcHBhcm1v
cl9ib290IyBjYXQgY2Fwcy9jb21tb24KQHtkZWZhdWx0X2NhcHN9PWNob3duLGRhY19vdmVycmlk
ZSxkYWNfcmVhZF9zZWFyY2gsZm93bmVyLGZzZXRpZCxraWxsLGlwY19sb2NrLHN5c19uaWNlLHNl
dHBjYXAscGNfb3duZXIsc3lzX3B0cmFjZSxzeXNfY2hyb290CgojaW5jbHVkZSAiL252cmFtMi9h
cHBhcm1vcl9ib290L2NhcHMvY29tbW9uIgpwcm9maWxlIHRlc3QgL3Vzci9iaW4vdGVzdCBmbGFn
cz0oYXR0YWNoX2Rpc2Nvbm5lY3RlZCkgewogICAgY2FwYWJpbGl0eSBzZXR1aWQsCiAgICBjYXBh
YmlsaXR5IHNldGdpZCwKICAgIGNhcGFiaWxpdHkgQHtkZWZhdWx0X2NhcHN9LCAgPT09Pj4gVGhp
cyBsaW5lIHNob3dzIHN5bnRheCBlcnJvciBbCnN5bnRheCBlcnJvciwgdW5leHBlY3RlZCBUT0tf
U0VUX1ZBUiwgZXhwZWN0aW5nIFRPS19JRCBvcgpUT0tfRU5EX09GX1JVTEUgXQogICAgL3N5cy9k
ZXZpY2VzL3N5c3RlbS9jcHUvb25saW5lIHIsCiAgICAvZXRjL3NlY3VyaXR5LyogciwKICAgIC9w
cm9jL2RyaXZlci9uZzEvKiBydywKICAgIC9wcm9jL3N5cy9rZXJuZWwvbmdyb3Vwc19tYXggciwK
ICAgIC91c3IvY2NzcC9ldGhhZ2VudC8gciwKICAgIC9wcm9jLyovY29tbSByLAogICAgL3Byb2Mv
Ki9hdXh2IHIsCiAgICAvcHJvYy8qL2NtZGxpbmUgciwKICAgIC9wcm9jLyovZW52aXJvbiByLAog
ICAgL3Byb2MvKi9saW1pdHMgciwKICAgIC9wcm9jLyovc3RhdCByLAp9CgpDYW4geW91IHBsZWFz
ZSBoZWxwIHVzIHRvIHJlc29sdmUgdGhpcyBlcnJvcj8KClRoYW5rcwpNdXJhbGkuUwoKT24gVGh1
LCBBcHIgMjIsIDIwMjEgYXQgMTA6NTEgQU0gSm9obiBKb2hhbnNlbgo8am9obi5qb2hhbnNlbkBj
YW5vbmljYWwuY29tPiB3cm90ZToKPgo+IE9uIDQvMjAvMjEgMTA6MDEgQU0sIE11cmFsaSBTZWx2
YXJhaiB3cm90ZToKPiA+IEhpIEFsbCwKPiA+Cj4gPiBBcyBwZXIgb3VyIGRlc2lnbiAsIHdlIGFy
ZSBhcHBseWluZyBjZXJ0YWluIGNhcGFiaWxpdGllcyB0byBhbGwgbXkgcHJvZmlsZXMuCj4gPgo+
ID4gLT4gY3JlYXRlZCBjdXN0b20gaW5jbHVkZSBmaWxlcyBhcyBmb2xsb3cgaW4gI2luY2x1ZGUg
InJlbGF0aXZlX3BhdGgiCj4gPiAgICBAe2RlZmF1bHRfY2Fwc309Y2hvd24sZGFjX292ZXJyaWRl
LGRhY19yZWFkX3NlYXJjaCxmb3duZXIsZnNldGlkLGtpbGwsaXBjX2xvY2ssc3lzX25pY2Usc2V0
cGNhcCxpcGNfb3duZXIsc3lzX3B0cmFjZSxzeXNfY2hyb290Cj4gPgo+ID4gLT4gQWRkaW5nIHRo
aXMgaGVhZGVyIGZpbGUgaW4gdGhlIHJlcXVpcmVkIGFwcGFybW9yIHByb2ZpbGVzLgo+ID4gICAg
I2luY2x1ZGUgInJlbGF0aXZlX3BhdGgiCj4gPiAgICBjYXBhYmlsaXR5IEB7ZGVmYXVsdF9jYXBz
fSwKPiA+Cj4gPiAtPiBXaGlsZSBwYXJzaW5nIHRoZSBhcHBhcm1vciBwcm9maWxlcyBpbnRvIEtl
cm5lbCwgb2JzZXJ2aW5nIGJlbG93IGVycm9ycy4KPiA+ICAgIHN5bnRheCBlcnJvciwgdW5leHBl
Y3RlZCBUT0tfRVFVQUxTLCBleHBlY3RpbmcgVE9LX01PREUKPiA+Cj4gPiBDYW4gc29tZW9uZSBo
ZWxwIG1lIHRvIGNsYXJpZnkgdGhlIGFib3ZlIHF1ZXJpZXMuCj4gPgo+Cj4gQXQgdGhpcyB0aW1l
IHZhcmlhYmxlIGFzc2lnbm1lbnQgY2FuIG5vdCBiZSBkb25lIGluIHRoZSBwcm9maWxlIGJvZHku
IEl0IGNhbiBvbmx5IGFwcGVhciBpbiB0aGUgcHJvZmlsZSBoZWFkZXIuIFlvdSBuZWVkIHRvIHJl
d29yayB5b3VyIHByb2ZpbGUgdG8gZG8KPgo+IGluY2x1ZGUgInJlbGF0aXZlX3BhdGgiCj4KPiBw
cm9maWxlIGV4YW1wbGUgewo+Cj4gICBjYXBhYmlsaXR5IEB7ZGVmYXVsdF9jYXBzfSwKPiB9Cj4K
Ci0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2Rp
Znkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
