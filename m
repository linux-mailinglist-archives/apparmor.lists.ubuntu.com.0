Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC52A69D3
	for <lists+apparmor@lfdr.de>; Wed,  4 Nov 2020 17:32:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kaLhh-0005EX-RQ; Wed, 04 Nov 2020 16:32:09 +0000
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1kaLhf-0005EP-Ed
 for apparmor@lists.ubuntu.com; Wed, 04 Nov 2020 16:32:07 +0000
Received: by mail-pg1-f182.google.com with SMTP id z24so17044609pgk.3
 for <apparmor@lists.ubuntu.com>; Wed, 04 Nov 2020 08:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1hXrzNOb7CzntHhvColAHto+i7npXIsL4Clf+oC3ies=;
 b=s/t7b9mH2WH/YwzE6lxrINRX96MnSQX8iPEyE4xZqnE5FqwUmVtYMW9A+F3aBu5t1z
 O3B3oShIp+ESygDFzoEgD2uwdTX/UUCfLahW9HownExxjnKDT4/v+4/oWaxlCHW4KjRo
 1zoFfO2j8QA1Oml1iWDnaGm5bqcVc0GkDNWYlVxMQ+Wayf41aI36PWdRJy3pv+rOzSdR
 HhieM6xDFG5C30iUdZ7qF3dwIEz2T3HHOe9JPaKfRjsEt48vk39tt6k7K3y70vf6hmfv
 /hYpfm7lBA4gRDRqRAuLtSjQPquxas3UBuks+8hH0DpNifS/iY+uO/yrKtr7BXUW+ya3
 YUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1hXrzNOb7CzntHhvColAHto+i7npXIsL4Clf+oC3ies=;
 b=JhaNBhLDapoIP8bh4UuFZ9Lcero/UmonEFJZnpBRCg2AnzDEZoqzP4bUJouD7ifmJp
 2l4qVrEkDCpattFWmiOY1rsvq7TcyIYX3wiLE64E/Sh9T7ak3w5maM6/Gx77nh2QVZLY
 uL41/qFKo8iE1PB6lmVik9QFPmtLnSeQNrY+MnvyugR0S452KITV10a7yDr7YYYmfnIx
 JnZI2hGlrBz1yWU4CdIiK1Gv0ZlHlYB3RUmei6aoEzClyISCAHLYBBCcWtErQwXa69Ws
 41K4AiCLKq6NURWSamFHEHDY8asJ1QH2/eoVuCQePt5NAI+hLynGGtGwV6yilY7aMDN9
 bpVg==
X-Gm-Message-State: AOAM530Q2o1dTA6faJz2q1T0e2XaX30GeFcVhmUddd/aGMVD5tLCsfPB
 boMbZ9HowpxHbJkO+PjNTVFhiXqSoEtddJDp2VA22AqwGR0=
X-Google-Smtp-Source: ABdhPJz3y9e9hKbNGUkW6kOK6coenRZZbsAXsTVHCQDscmv/gZuNllSFVryXedsgEYJzBiOAkrHxr0X9zTDOlp8fCPg=
X-Received: by 2002:a17:90a:fd8d:: with SMTP id
 cx13mr5064223pjb.138.1604507525319; 
 Wed, 04 Nov 2020 08:32:05 -0800 (PST)
MIME-Version: 1.0
From: swarna latha <sswarnas@gmail.com>
Date: Wed, 4 Nov 2020 11:31:54 -0500
Message-ID: <CAJs3c4wJHm=HB_LiL1G-=2V20-D86e5Xxt6tTzMquD9b3Bv_kg@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.215.182; envelope-from=sswarnas@gmail.com;
 helo=mail-pg1-f182.google.com
Subject: [apparmor] Regarding using apparmor to harden container
	configuration
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
Content-Type: multipart/mixed; boundary="===============6821590246347303715=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============6821590246347303715==
Content-Type: multipart/alternative; boundary="00000000000016125305b34a8515"

--00000000000016125305b34a8515
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to use apparmor to harden the rootfs of the container
configuration.

I have few queries regarding this.

1. My process will be using a set of libraries and these libraries might be
writing to some files in the rootfs or need some capabs. I dont see this
files/capabs in my apparmor logs. Is this expected behaviour ?

2. Is there any limitation for apparmor to monitor applications running in
container or is it the same as an application running in the host ?

Can you please clarify the above queries ?

Thanks,
Swarna

--00000000000016125305b34a8515
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to use apparmor to hard=
en the rootfs of the container configuration.</div><div><br></div><div>I ha=
ve few queries regarding this.</div><div><br></div><div>1. My process will =
be using a set of libraries and these libraries might be writing to some fi=
les in the rootfs or need some capabs. I dont see this files/capabs in my a=
pparmor logs. Is this expected behaviour ?</div><div><br></div><div>2. Is t=
here any limitation for apparmor to monitor applications=C2=A0running in co=
ntainer or is it the same as an application running in the host ?</div><div=
><br></div><div>Can you please clarify the above queries ?</div><div><br></=
div><div>Thanks,</div><div>Swarna</div></div>

--00000000000016125305b34a8515--


--===============6821590246347303715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6821590246347303715==--

