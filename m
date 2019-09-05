Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9ACA9A5E
	for <lists+apparmor@lfdr.de>; Thu,  5 Sep 2019 08:09:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i5kxn-0005cv-H9; Thu, 05 Sep 2019 06:09:47 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.86_2) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1i5kxl-0005cp-UR
 for apparmor@lists.ubuntu.com; Thu, 05 Sep 2019 06:09:45 +0000
Received: from mail-vs1-f72.google.com ([209.85.217.72])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1i5kxl-00008j-Fz
 for apparmor@lists.ubuntu.com; Thu, 05 Sep 2019 06:09:45 +0000
Received: by mail-vs1-f72.google.com with SMTP id h11so125674vsj.15
 for <apparmor@lists.ubuntu.com>; Wed, 04 Sep 2019 23:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KUrV+lRkwmQ6PYWGa65kk19e1KpId+QLOzcUWVpjyj4=;
 b=cjKTjn27iNVohPs7zvR+DnjQUYobzpJyuOuaEV6kHA6orBLpKKevWSrNxeVWeChDPw
 LiqZCsys2jBbVNzbKaS2dRon7o3r5bzWee1+py734WT+m24cBuQSs9Rva1VjZ6BgaYBr
 WOLcPqIbsVxIr6lFGqL+M6pVP1MOU0YoeuIdeJAK85FwtMilTfInPkl+DrgnVJHnN5Q5
 Uce7JmkGi9UtkYaFvgX3lf6gwhBvAYKACZ2TyqsF7kx+BIBAt9L63u1Gc1mBGx6AZDaO
 bjBltKcGfto7LRMB2yY+qGpFdDhm6KwXaGBAe3CYJVuIbYChsKvGyulYu5vqxaiP1oZ8
 xFHg==
X-Gm-Message-State: APjAAAU5Y+nsK+2wsx59DR/Z8JvWC8xR0qliJp3UORw+PcOB1SoSOaGm
 DL6Tz83jcIy4HyAxWYeKnnAuqw3EWdN5fN2wuas/jh0yWcIVeyQ8PGKRg5njl7S1Xvliu/IfOwT
 MmLp5MirPiiQuD1tok24kcCWpwVRezRDWwTLFnbFh0iqjNnzBwzOSSQ==
X-Received: by 2002:a67:783:: with SMTP id 125mr948329vsh.16.1567663784603;
 Wed, 04 Sep 2019 23:09:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqynbBKJwoVQlRns2S1ujxF6Zj6qy2LrVYmFcjZ6UcqLRUhUUTAjGHx6mGJt0fHvjGY6lpRkfet8VZsSKK1eCwY=
X-Received: by 2002:a67:783:: with SMTP id 125mr948323vsh.16.1567663784410;
 Wed, 04 Sep 2019 23:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <CABRH9Vx7CSxROBCMV5fbNPN-Sct4kFB_D2TawAWt_0KqD_C6KQ@mail.gmail.com>
 <20190904231133.GA4082@hunt>
In-Reply-To: <20190904231133.GA4082@hunt>
From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date: Thu, 5 Sep 2019 08:09:18 +0200
Message-ID: <CAATJJ0JSALj=dL71fAge0vDgb11GFSy+hwFDAs=Q916bw-2bkQ@mail.gmail.com>
To: Seth Arnold <seth.arnold@canonical.com>
Subject: Re: [apparmor] apparmor & clamav
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

T24gVGh1LCBTZXAgNSwgMjAxOSBhdCAxOjExIEFNIFNldGggQXJub2xkIDxzZXRoLmFybm9sZEBj
YW5vbmljYWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgU2VwIDA0LCAyMDE5IGF0IDA4OjAyOjU2
UE0gKzAyMDAsIEJpcmdlciBCaXJnZXIgd3JvdGU6Cj4gPiBUaGlzIGxvb2tzIHByb21pc2luZyB0
byB0cm91Ymxlc2hvb3QuIEFueSBpZGVhcz8KPgo+IERvIHlvdSBrbm93IHdoYXQgd2luYmluZGQg
ZG9lcyB3aXRoIHRoaXMgcGlwZT8gQXJlIHRoZXJlIGFueSBsb2NhbAo+IGNvbmZpZ3VyYXRpb24g
Y2hhbmdlcyB0aGF0IHdvdWxkIGhhdmUgcHV0IHRoaXMgcGlwZSBpbiB0aGlzIGRpcmVjdG9yeT8K
Pgo+IEl0IGZlZWxzIGEgbG90IGxpa2UgYSBuZXcgbmFtZSBmb3IgdGhlIHBpcGVzIGxpc3RlZCBp
bgo+IDxhYnN0cmFjdGlvbnMvd2luYmluZD46Cj4KPiAgIC90bXAvLndpbmJpbmRkL3BpcGUgIHJ3
LAo+ICAgL3Zhci97bGliLHJ1bn0vc2FtYmEvd2luYmluZGRfcHJpdmlsZWdlZC9waXBlIHJ3LAo+
Cj4gRG9lcyB0aGlzIHNvdW5kIHJpZ2h0PyBPciBpcyB0aGlzIHBpcGUgc29tZXRoaW5nIGRpZmZl
cmVudCBmcm9tIHRoZXNlPwoKSSB0aGluayBJIGhhdmUgc2VlbiB0aGlzIGRlbnkgY29tZSB1cCBp
biBvdGhlciBjYXNlcyBhbmQgbmV2ZXIgc3BvdHRlZApleGFjdGx5IHdoZXJlIGl0IGNhbWUgZnJv
bS4KQnV0IEkgd2FudGVkIHRvIHVzZSB0aGlzIGNoYW5jZSBhbmQgZmluZCB0aGUgYmFzZSBjb25m
aWcgZm9yIGl0LgpJdCB0dXJucyBvdXQgdGhhdCBpdCBpcyBldmVuIGluIHRoZSBiYXNlIHNhbWJh
IGNvbmZpZywgYW5kIHRoZXJlYnkgSQphZ3JlZSB3aXRoIFNldGggdGhhdCB0aGlzIG1pZ2h0IGJl
IGFub3RoZXIgZW50cnkgZm9yIHRoZSBhYnN0cmFjdGlvbi4KCkhlcmUgc21iLmNvbmYgKDUpCiAg
ICAgICB3aW5iaW5kZCBzb2NrZXQgZGlyZWN0b3J5IChHKQogICAgICAgICAgVGhpcyBzZXR0aW5n
IGNvbnRyb2xzIHRoZSBsb2NhdGlvbiBvZiB0aGUgd2luYmluZCBkYWVtb24ncyBzb2NrZXQuCiAg
ICAgICAgICBFeGNlcHQgd2l0aGluIGF1dG9tYXRlZCB0ZXN0IHNjcmlwdHMsIHRoaXMgc2hvdWxk
IG5vdCBiZQphbHRlcmVkLCBhcyB0aGUgY2xpZW50IHRvb2xzIChuc3Nfd2luYmluZCBldGMpIGRv
IG5vdCBob25vdXIgdGhpcwpwYXJhbWV0ZXIuIENsaWVudCB0b29scyBtdXN0IHRoZW4gYmUgYWR2
aXNlZCBvZiB0aGUKICAgICAgICAgIGFsdGVyZWQgcGF0aCB3aXRoIHRoZSBXSU5CSU5ERF9TT0NL
RVRfRElSIGVudmlyb25tZW50IHZhcmFpYmxlLgogICAgICAgICAgRGVmYXVsdDogd2luYmluZGQg
c29ja2V0IGRpcmVjdG9yeSA9IC92YXIvcnVuL3NhbWJhL3dpbmJpbmRkCgpBbmQgc2luY2UgL3Zh
ci9ydW4gPT4gL3J1biB3ZSBzZWUgdGhlIHJlcG9ydGVkIGRlbnkuCgpjdQpDaHJpc3RpYW4KCj4g
VGhhbmtzCj4KPiA+ID4gT24gU2VwIDQsIDIwMTksIGF0IDAzOjAxLCBCaXJnZXIgQmlyZ2VyIHZp
YSBjbGFtYXYtdXNlcnMgPAo+ID4gY2xhbWF2LXVzZXJzQGxpc3RzLmNsYW1hdi5uZXQ+IHdyb3Rl
Ogo+ID4gPgo+ID4KPiA+IEZyb20gVWJ1bnR1IHN5c2xvZzoKPiA+ID4gU2VwIDQgMDg6NDA6MDEg
emVudHlhbCBrZXJuZWw6IFszNDUxOTAuOTk4Mzk3XSBhdWRpdDogdHlwZT0xNDAwCj4gPiBhdWRp
dCgxNTY3NTc5MjAxLjA0NDo4Myk6IGFwcGFybW9yPSJERU5JRUQiIG9wZXJhdGlvbj0iY29ubmVj
dCIKPiA+IHByb2ZpbGU9Ii91c3IvYmluL2ZyZXNoY2xhbSIgbmFtZT0iL3J1bi9zYW1iYS93aW5i
aW5kZC9waXBlIiBwaWQ9MTI2OQo+ID4gY29tbT0iZnJlc2hjbGFtIiByZXF1ZXN0ZWRfbWFzaz0i
d3IiIGRlbmllZF9tYXNrPSJ3ciIgZnN1aWQ9MCBvdWlkPTAKPgo+IC0tCj4gQXBwQXJtb3IgbWFp
bGluZyBsaXN0Cj4gQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQo+IE1vZGlmeSBzZXR0aW5ncyBv
ciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGlu
Zm8vYXBwYXJtb3IKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1
bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMu
dWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==
