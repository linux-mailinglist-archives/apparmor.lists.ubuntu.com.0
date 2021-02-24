Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C154323A50
	for <lists+apparmor@lfdr.de>; Wed, 24 Feb 2021 11:17:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lErE8-0000ST-8E; Wed, 24 Feb 2021 10:17:04 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <TheDiveO@gmx.eu>) id 1lErE6-0000Qx-Fe
 for AppArmor@lists.ubuntu.com; Wed, 24 Feb 2021 10:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1614161821;
 bh=FbmSy+C9a/mmk9Opcd2BrmsbEpN7Z2Y6iclmT+gJi3Q=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=KjAh2BvLCmQaMmBUMWE4x9fvRm2wnRyE9KUIZuHfz+LP95GeEEn8tTCOYMnG9UTgJ
 afG/cuPUZclHAFDH4KMwAv0y2Ic5kEyOOCUvgFK5/O8hF9nEIMsdmJGx6r/f+4VuaI
 n2GBmxv0uAech79k9flgNvJKNupx7EMAVZEavdGg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [84.173.155.199] ([84.173.155.199]) by web-mail.gmx.net
 (3c-app-gmx-bs53.server.lan [172.19.170.137]) (via HTTP); Wed, 24 Feb 2021
 11:17:01 +0100
MIME-Version: 1.0
Message-ID: <trinity-9878cf5b-24f9-455c-a35b-82da31b41e7f-1614161820960@3c-app-gmx-bs53>
From: TheDiveO@gmx.eu
To: AppArmor@lists.ubuntu.com
Date: Wed, 24 Feb 2021 11:17:01 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:4X0516qvA9GbSeMEJeMOf23F6BZMuN9oiXdSjL5nLdkgsULy3xT/nb+kFyI56W7Wxqaal
 bT2DnjG9HJpaveIibYX+5VzLacMl184s+GQrvSJKBLD4iwwn4xor8Sfipf1fdALX6gnV7KxdJpIz
 0sdYuIMZcFXIoa8SmO+eFRS7nN9YXS4Ip+C4+Li18bnlSG0dBgiQNqUkZhfG/fNe5VyLN04OfshP
 b9zNyNWMHbZaH0vyaMrVBAebODxDIGN7k1n2mLiePT6AEymGxbMzRJrvswDoaT+p5C24z5aF4VaV
 Yc=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VhX8CN3xvg8=:TuACsx2QLsorZp89hL8K5K
 Dda0L/UDElCLGNIFPR/+AbfWIbnlANJU7RsCEAU9HI8LryIZ+BhRtC93aRx8K2n6RuQLXGKnt
 x0PKXYgos6xkgSGb+dWxVzr750/Z5Sk4HCe4bCXiRLFO2HQKQ9FeWWJ29y6VHjgSw+NH6OOFX
 Qe+spLDyzLOGDurPKyWYbDG5Vvxt5QpKW5GVbGQeHFiLqGKtyNZYaCICH0EnMX4uSMDIfndvC
 tZa5vKMn62YFIFa8jkcvBYA4mjuzwNhAaeKTiEygKh0umup3s3quzmHMsBy3a6UkDRRjERbVH
 UZ6BxhRn6BPeO/QTMvvB1bccNBYSFOCIzKl/v9qbrHZTiQNKSQo1Fr7xVCw9WBBt3m4Uo4HJJ
 mviz0NgVbQ4bfveLnq6laUGojSY7s6LT3+rFtO3NmhH+IjfW6CxwqTjqxEJU5+xibUs5Vzj+B
 8jI+Ix9e9q/VxfkV8yduueOn+MXjL6J38vLlVSeziMowkSIICDBWqEW7paq8PPR9aXE6cvJrb
 1PEcKRhM/WT5HKD0IIYRO9Ku1BzdwPYZepBMJmK41tj6JoNYFnzlg5WGDCNgrs5ibqUR+T8ud
 jrGP+UybP3CTk=
Subject: [apparmor] What are "AARE"s, exactly?
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

VGhlIG1hbiBwYWdlIGZvciBhcHBhcm1vci5kIG1lbnRpb25zIHRoZSAiQUFSRSIgZWxlbWVudCBp
biBhIGxvdCBvZiBwbGFjZXMsIHN1Y2ggYXMgZm9yIHNwZWNpZnlpbmcgcGVlcnMuIFVuZm9ydHVu
YXRlbHksIHRoZSBtYW4gcGFnZSAob3IgaXRzIHNvdXJjZSBwYXJzZXIvYXBwYXJtb3IuZC5wb2Qp
IG9ubHkgc2F5cyAiQUFSRSBoYXZlIHNwZWNpYWwgbWVhbmluZ3M7IHNlZSBiZWxvdy4gTWF5IGlu
Y2x1ZGUgVkFSSUFCTEUiLiBGdXJ0aGVyIGRvd24sIHRoZXJlIGlzIGEgdGVyc2UgImRlZmluaXRp
b24iIGluIGZvcm0gb2YgIj8qW117fSIgd2hpY2ggSSBzaW1wbHkgZG8gbm90IHVuZGVyc3RhbmQu
CgpEaXNjbGFpbWVyOiBJJ3ZlIGV2ZW4gZm91bmQgYW5kIHJlYWQgdGhlIGRvY3VtZW50cyBpbiBh
cHBhcm1vci9kb2N1bWVudGF0aW9uLyoub2R0LCBidXQgbWlnaHQgdmVyeSB3ZWxsIG1pc3NlZCBh
IGNydWNpYWwgaGludCBhYm91dCBBQVJFIHRoZXJlLgoKSSBjYW4gaW1hZ2luZSB0aGF0ICJBQVJF
IiBtZWFucyAiQXBwQXJtb3IgcmVnIGV4cCIgYW5kIGFsc28gZm91bmQgdXRpbHMvYXBwYXJtb3Iv
YWFyZS5weS4gVW5mb3J0dW5hdGVseSwgSSdtIHN0aWxsIG5vdCBjbGVhciBmcm9tIHJlYWRpbmcg
dGhlIFB5dGhvbiBzb3VyY2Ugb2YgYWFyZS5weSBhYm91dCB3aGF0IEFBUkVzIHJlYWxseSBhcmUg
YW5kIGhvdyB0aGV5IG1pZ2h0IGRpZmZlciBmcm9tIHJlZ3VsYXIgZXhwcmVzc2lvbnMgKHdoaWNo
IG9uZXMpIGFuZCBpZiB0aGV5IGluY2x1ZGUgZ2xvYmJpbmcgb3Igbm90PwoKQ2FuIHlvdSBwbGVh
c2UgaGVscCBvdXQgYW5kIGV4cGxhaW4gd2hhdCBBQVJFcyBhcmUgZnJvbSBhIHVzZXIncyBwZXJz
cGVjdGl2ZT8KClRoYW5rIHlvdSB2ZXJ5IG11Y2ghCgpIYXJhbGQKCi0tIApBcHBBcm1vciBtYWls
aW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5z
dWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Fw
cGFybW9yCg==
