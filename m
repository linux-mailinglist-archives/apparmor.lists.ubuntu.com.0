Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB85366D04
	for <lists+apparmor@lfdr.de>; Wed, 21 Apr 2021 15:41:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lZD6s-00056G-KA; Wed, 21 Apr 2021 13:41:42 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1lZD6m-000568-8u
 for apparmor@lists.ubuntu.com; Wed, 21 Apr 2021 13:41:36 +0000
Received: by mail-pf1-f177.google.com with SMTP id i190so28849518pfc.12
 for <apparmor@lists.ubuntu.com>; Wed, 21 Apr 2021 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6Y63SKK4DcuD1OlFSAI/xb2mojCWgrUfh0ki22a/2So=;
 b=DU6UPQEdKdjIBipCzs6eh+unfazc12yGPgs9EXFSlxw8UVwZGfQYfGm4rdz/YDNnqZ
 nrXyn8BxACpefwMV0Fx0uUCzWZeza4WzDGSWaWRr4e6Z6OFZrvHmm/prO50+H/AanT3f
 LOtQqK+QW1Xnb+/03RdAHTiECdfd2i+IUl8Ud7r+S1jlvEFcCbEcKJVMpNAS2jZ6EIow
 BqHF4Z5eOtHCHNuzjxwkxevKU8JrK3CsQfehLCmwfbrzeSOLuo++c/hLMpanx0Lt7ppk
 GzjERaVQCtk95bf0bVtIxlo96W0PnlOUThGXoYIMUIsePkNCq+U2YeeR2LHbXbJm1k/z
 iGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6Y63SKK4DcuD1OlFSAI/xb2mojCWgrUfh0ki22a/2So=;
 b=RWBRqKNOEMJwbAzDaZBqcF51/gMPglUOsCoPtbTfpYn/5ehC0QXrH660M+hKgTgxdT
 Tirv5jTiN7UC4vdP4wPzcBUcOuPRAxmTcGPFbxzMeiphwmY4GxSCA2sAXcRL8h3rcdh6
 T9n5CCnIG6Y4pNSa4HU7YTunve1SNBsHvCEcL29Rvw+jfY0uolxXnAyCvXeuTKmHBbub
 PMBiCEqa3f6ctikVOWvtM1BGZNBmhiW3tJ6U7V3yZYezJABfp4CSfpE4n4dWnx0OC4Ki
 duADLeSQbrYki1aaUmBvGP/5r6FeUzPLNwIh23+6YYQQ4IyW8j9khZ7E2MROW7DYkTKB
 yhsg==
X-Gm-Message-State: AOAM532WBfZ0++PUaGv2CD2WLNv4X8JzTjHtk5iLUEnhlZvX//6I6KDW
 r2pdlaG9+ItdE7KC66ttAEUWrkd8iF0i22tT1vNGVe14Kgs=
X-Google-Smtp-Source: ABdhPJwp9YrPD/GCzvgHLWhGaZIS1MY9+iGNGNhkLIGCv8o4d/YHRErBWQyEfyiJaeN32I5Q/FuWDFjYEhSoxJjCWaE=
X-Received: by 2002:a17:90a:1d4b:: with SMTP id
 u11mr11138786pju.74.1619012493954; 
 Wed, 21 Apr 2021 06:41:33 -0700 (PDT)
MIME-Version: 1.0
From: swarna latha <sswarnas@gmail.com>
Date: Wed, 21 Apr 2021 09:41:23 -0400
Message-ID: <CAJs3c4xaFpc52=XGW9=Xk_mTOzZ1wcRAexFNUTbMaFKXihuWWQ@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.210.177; envelope-from=sswarnas@gmail.com;
 helo=mail-pf1-f177.google.com
Subject: [apparmor] Regarding header file for default capabilities
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
Content-Type: multipart/mixed; boundary="===============5746007505514460765=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============5746007505514460765==
Content-Type: multipart/alternative; boundary="00000000000096d1cc05c07bb8e7"

--00000000000096d1cc05c07bb8e7
Content-Type: text/plain; charset="UTF-8"

Hi,

We are working on enforcing profile for a process. This process uses a
library to
run the process in non-root mode, which in turn needs a set of
capabilities.

When creating a profile, we want this capabilities to be kept separate and
want this to be included. when we tried to add the capability in a
separate file as
capability chown, in "common_caps" and included that in our main profile,
getting error as "unexpected TOK_capabiltiy, expecting $end".

we are not able to use Variables in capability, as it seems we can use
variables only in FILE RULE and not in CAPABILITY rule.

As this library is not an executable, we are not able to define child/sub
profile also.

Can someone throw lights on how to implement  a set of default
capabilities to be added in all profiles (preferably in header file)

Thanks,
Swarna

--00000000000096d1cc05c07bb8e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><br></div><div>We are working on enforcing pro=
file for a process. This process uses a library to=C2=A0</div><div>run the =
process in non-root mode, which in turn needs a set of capabilities.=C2=A0<=
/div><div><br></div><div>When creating a profile, we want this capabilities=
 to be kept separate and want this to be included. when we tried to add the=
 capability in a separate=C2=A0file as</div><div>capability chown, in &quot=
;common_caps&quot; and included that in our main profile, getting error as =
&quot;unexpected TOK_capabiltiy, expecting $end&quot;.</div><div><br></div>=
<div>we are not able to use Variables in capability, as it seems we can use=
 variables only in FILE RULE and not in CAPABILITY rule.</div><div><br></di=
v><div>As this library is not an executable, we are not able to define chil=
d/sub profile also.</div><div><br></div><div>Can someone throw lights on ho=
w to implement=C2=A0 a set of default capabilities=C2=A0to be added in all =
profiles (preferably in header file)</div><div><br></div><div>Thanks,</div>=
<div>Swarna</div></div>

--00000000000096d1cc05c07bb8e7--


--===============5746007505514460765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5746007505514460765==--

