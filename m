Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C55A3030
	for <lists+apparmor@lfdr.de>; Fri, 30 Aug 2019 08:43:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i3acY-0005E1-Ru; Fri, 30 Aug 2019 06:42:54 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kobuslgoosen@gmail.com>) id 1i3acV-0005DX-LQ
 for apparmor@lists.ubuntu.com; Fri, 30 Aug 2019 06:42:51 +0000
Received: by mail-vs1-f52.google.com with SMTP id l63so4076468vsl.10
 for <apparmor@lists.ubuntu.com>; Thu, 29 Aug 2019 23:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kn34R6lWGkrdBOpgx+RK4k06Me7BzxnWfDwjNN7VlUE=;
 b=rz5OIM2lPiHk6LjOQgzSeN9zOFRC7WQ1gjW+9K1VwtoVDpOkq2KKVV7o8yVGuKyOd8
 k0CrhcO3gioDDGMecxCR3cGLKnJosCBlxNi0AtNva72fEzyw/2aJp/md1qHxTsOjv6El
 dqqPPIcHoj8aQe6Yv1ZklOJ9vSOZQRKsAkJ/TK5paOptMUbvyfMYZz4vvX7Ux3KP+gUQ
 nhFs5xCBlZogMpEAIjqrlOpCe9BJPqDQqPmffNcTfkdKovBZDO9ZBT+kbRRT/W6It1MD
 GObuQERehZgaEz02VhPPy1vE5laaT9sMgJ82WHlo7phsDpM9WsiNkH4MyZyvVpHgjyR7
 QfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kn34R6lWGkrdBOpgx+RK4k06Me7BzxnWfDwjNN7VlUE=;
 b=GVbU75CbtyCIMfvO18l7D9HfaYPYiHlt/2kR3i2BVPbghO/V55sksM2r0c4MUw0491
 HtN4R8gcHu23EwjQm9Ydstqw56xePaAqv+WiYED8bbUC7DbVKxws0AW1wSx5dBLl5gSg
 vA9wUCpiaB1Yyt3LO4a2quRtrjjhol9xBv1g+w+AZkKnpkkAKHrmdw9c58sY10P4q2uI
 z+ZLWLWKvta9hH5lzfk3INuudkOT8/04AydvGSr1bpZZZzUwNqTuRyWVRdZCwnqSyGuM
 v2aybOhmT+nx2gF6Tpsro1zifKhj+1sMQeyQoITOoEbaPffwZYLGulaS1nFNRx/Lpf14
 MaPA==
X-Gm-Message-State: APjAAAUo0eo3Vq8NNgjuT0TZba3YSppv9od7SjcjbmVeaJ6igcB0CDy1
 BFJ7hmublfZdHlp+HC+kJwy40L+Mpb1GatgDnrO04Q==
X-Google-Smtp-Source: APXvYqyLOI9xIhPTpeEye9KNHKeCJpNLyRmN6XZ5aj6jUF6PnhQ4R7xEd6CFcFpU1yQYEqfjrlO4dMLhZx7Z/GzSHKA=
X-Received: by 2002:a67:cf8c:: with SMTP id g12mr7691099vsm.8.1567147370120;
 Thu, 29 Aug 2019 23:42:50 -0700 (PDT)
MIME-Version: 1.0
From: Kobus Goosen <kobuslgoosen@gmail.com>
Date: Fri, 30 Aug 2019 08:42:37 +0200
Message-ID: <CAGriS4yUNm3uwNNZKX9V6Usy9Zg3A8D3SjzZx7Z6r6TauGKb9A@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Subject: [apparmor] Deny mount globally
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
Content-Type: multipart/mixed; boundary="===============8394156107301809310=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8394156107301809310==
Content-Type: multipart/alternative; boundary="0000000000004e8c0305914fee2a"

--0000000000004e8c0305914fee2a
Content-Type: text/plain; charset="UTF-8"

Hi,
I just wanted to ask if there is an elegant way to block
mounting/unmounting in general.
I have an industrial device that has a read-only rootfs, so there's limited
system damage that a user could make. However I'd like to disable mounting
so it's never possible to remount the rootfs in read/write more.
My initial idea involved creating a profile for SSHD, and adding "  deny
mount," to it. This initially worked (after I changed bash from Ux to ix),
but causes a host of other issues.


*Kobus Goosen *
*071 608 4149*
*kobuslgoosen@gmail.com <kobuslgoosen@gmail.com>*

--0000000000004e8c0305914fee2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"ltr">Hi,=C2=A0</div><div dir=3D"ltr">I just w=
anted to ask if there is an elegant way to block mounting/unmounting in gen=
eral.=C2=A0</div><div dir=3D"ltr">I have an industrial device that has a re=
ad-only rootfs, so there&#39;s limited system damage that a user could make=
. However I&#39;d like to disable mounting so it&#39;s never possible to re=
mount the rootfs in read/write more.=C2=A0</div><div dir=3D"ltr">My initial=
 idea involved creating a profile for SSHD, and adding &quot;=C2=A0 deny mo=
unt,&quot; to it. This initially worked (after I changed bash from Ux to ix=
), but causes a host of other issues.=C2=A0</div><div dir=3D"ltr"><br></div=
><div dir=3D"ltr"><br clear=3D"all"><div dir=3D"auto"><div dir=3D"ltr" clas=
s=3D"m_-5616168428495683490gmail_signature" data-smartmail=3D"gmail_signatu=
re"><div dir=3D"ltr"><i><font color=3D"#0b5394">Kobus Goosen=C2=A0</font></=
i><div><i><font color=3D"#0b5394">071 608 4149</font></i></div><div><i><fon=
t color=3D"#0b5394"><a href=3D"mailto:kobuslgoosen@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">kobuslgoosen@gmail.com</a></font></i></div><div><br=
></div></div></div></div></div></div>

--0000000000004e8c0305914fee2a--


--===============8394156107301809310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8394156107301809310==--

