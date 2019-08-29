Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 13104A2B2E
	for <lists+apparmor@lfdr.de>; Fri, 30 Aug 2019 01:52:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i3UDE-000804-2k; Thu, 29 Aug 2019 23:52:20 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <olnes@ncu.com.ua>) id 1i3K4y-0001ve-A8
 for apparmor@lists.ubuntu.com; Thu, 29 Aug 2019 13:03:08 +0000
Received: by mail-ot1-f68.google.com with SMTP id r20so3307946ota.5
 for <apparmor@lists.ubuntu.com>; Thu, 29 Aug 2019 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ncu.com.ua; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=2UlO+CDNYxrADwFKC1KDjgrhn/dVQuu9VhE1RJkJU8c=;
 b=nj8aBcBsVN93enzCuP3/bTxvjCVjrDdXH9dLN/9SVuQqzWheDYAWVXhgosFHeZSgA2
 5ui2oHXpKtguZCBikJBwNkJaWyewaWHQ9ZOzTtRma8G2+Ml08ulJtUmtgaOx0kANriJc
 gtaAeiOWCQ0PDlBrqOXA46hXcSdd4QMN38GhMqCkpLCeuZgCjpNcD0K+vDuJTvEYQFgP
 cTZmIrvUFh0hwZgXcRm/TDt0IIuXcDTa3Jc1XOB2CRtrzPQfRk55NHQThUvIravW3gPQ
 /baQtxYdIXbKQ4eh95j3UHscyMo8mgYU40HjRxCKefPmQld+DHngBqN+PZboItxEBnsV
 894Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2UlO+CDNYxrADwFKC1KDjgrhn/dVQuu9VhE1RJkJU8c=;
 b=Pax5PGgECmvKqFwXCwod5p3dlQgvPlkgWvrRmT+ZOESp4LcPjOySfAfdYu3KOYYhnZ
 +9dpvY/mNt5/L6np+4zsYDXGjhz5kiGJkYNTxY0h37Jyg3bcV5hp8gyX9DntXMLQ7jH2
 +PBQJNP/Q2b7Z7sAaNmpMdq/AGABXuGLnf5907nHJUxGTT6CTONJtscLuc7YxCEc5SXU
 0Yw4k/c/IHAabcKrrRc+yAY98AATvFDJGGPDrVlVbJ48a33B7hmC7wJMBYE4BknB6TrJ
 n+phgi11cy7eFXP0nFh5hlMIyr0ZIh6M0+zJgBQI/Oc6rIDriukWfqpLlgs3e76YW12C
 y5pQ==
X-Gm-Message-State: APjAAAXByv7//iYVd7FV92BwGih31/mjcU1RsDrXrkdNOzhXqZBbaZQf
 lhA27ZiSWI+SeNiQ6P3sZ+ABwTKbjE8aMZCczsbR/kjRMw4=
X-Google-Smtp-Source: APXvYqy/7AiikL+SFaqwdjeVLVCa01iynFgSdC/s6hdkv7DSGUcfxYunKH/5Vs0kw6rEfYamJlSg/XMdLlq/be8dDw4=
X-Received: by 2002:a9d:7b46:: with SMTP id f6mr7256943oto.365.1567083786533; 
 Thu, 29 Aug 2019 06:03:06 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?0J7Qu9C10LrRgdCw0L3QtNGAINCd0LXRidCw0LTQuNC8?=
 <olnes@ncu.com.ua>
Date: Thu, 29 Aug 2019 16:02:52 +0300
Message-ID: <CACROBpxumMCdow_pZqTQXhjjOv3G6YGpztfJ-sLEL9+EUuCaYA@mail.gmail.com>
To: apparmor@lists.ubuntu.com, security@apparmor.net
X-Mailman-Approved-At: Thu, 29 Aug 2019 23:52:18 +0000
Subject: [apparmor] Apparmor
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
Content-Type: multipart/mixed; boundary="===============8411714957598024536=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8411714957598024536==
Content-Type: multipart/alternative; boundary="0000000000006e109e059141207e"

--0000000000006e109e059141207e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I want to limit the users of my computer so that they cannot transfer their
files to other users. I limited the chmod command.
But through the Nautilus program, users can change the properties of files.

Tell me how to limit users who own files.

I wanted to do this through the Apparmore profile for Nautilus, but I don=
=E2=80=99t
know how.

I read that there is a chmod rule in Apparmore syntax (
https://web.archive.org/web/20171230174731/http://wiki.apparmor.net/index.p=
hp/AppArmor_Core_Policy_Reference#Chmod_rules
)
But for some reason it does not work. Help me please.

--0000000000006e109e059141207e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I want to limit the users of my computer so that they cann=
ot transfer their files to other users. I limited the chmod command.<br>But=
 through the Nautilus program, users can change the properties of files.<br=
><br>Tell me how to limit users who own files.<br><br>I wanted to do this t=
hrough the Apparmore profile for Nautilus, but I don=E2=80=99t know how.<br=
><br>I read that there is a chmod rule in Apparmore syntax (<a href=3D"http=
s://web.archive.org/web/20171230174731/http://wiki.apparmor.net/index.php/A=
ppArmor_Core_Policy_Reference#Chmod_rules">https://web.archive.org/web/2017=
1230174731/http://wiki.apparmor.net/index.php/AppArmor_Core_Policy_Referenc=
e#Chmod_rules</a>)<br>But for some reason it does not work. Help me please.=
<br></div>

--0000000000006e109e059141207e--


--===============8411714957598024536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8411714957598024536==--

