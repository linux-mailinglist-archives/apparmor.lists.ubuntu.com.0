Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C6483A872A
	for <lists+apparmor@lfdr.de>; Wed,  4 Sep 2019 20:03:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i5Zcd-0001yU-Rm; Wed, 04 Sep 2019 18:03:11 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <birger.solna@gmail.com>) id 1i5Zcb-0001yJ-Iv
 for apparmor@lists.ubuntu.com; Wed, 04 Sep 2019 18:03:09 +0000
Received: by mail-io1-f49.google.com with SMTP id j4so46181023iog.11
 for <apparmor@lists.ubuntu.com>; Wed, 04 Sep 2019 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cjwvxLSJGwSGBOXAUkXxptqXFzquhlaNJtO7i1H1Hmo=;
 b=MFFFjeX5ysPSzQNxdT2Yj1W9U4sN4n79E86w5OSM086J481FfIuQqRmXjteKWDQLj2
 iU551dxhV1RkNPdLL/F/MsCRQdqpek1CiaofSuqCPQLS50+PoqOlzK5FY3NqvOfyek8E
 AWzuQhnQ5SW8pndaJIknYS44Wpw98s/VB50Q964KwFc/w0x66jISTtyBFWMH8buLAy/U
 Dy+39nolRGROxMMyTNOQpnR15Sts+fkJB0lGxiRQ9kyTlcgM+nW/koBwPOS6xgUNU9n5
 ByogcI7F5vf15Ks9X2/Ol/HU8ekPsc/Egyz4W0WE7jJ4GxHO+lN61ipv4QstOVdIfm9H
 mDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cjwvxLSJGwSGBOXAUkXxptqXFzquhlaNJtO7i1H1Hmo=;
 b=f/2NOMMRv4TxWKa3LgFPocfr5Cj/fKNjYnSOyWXfTagMUNsYCRJOM2VZovLfbJCz4U
 0hJUiQGQrW3CV1kg5+EFMVqi9t6Jy96I0WonSA7PkOz3m81ne5HUH5Iu5vcotHCLlrX4
 RVFnP/U20tu9626/bgrJWMTWW9uDDwrtanhyHl2nFnNeq503ppO77XcvwYMTEULmVbl7
 hUXhCTH5as9AnY8zVSvwBZyfhJdDnaFlWH7X9S2Sp1Y8RdYIw7tNJ3Ul8XKatPLTezjX
 Iou6+7ddAizAag2r6YwJe/yqS/7Ia566ORy/agcWMm8WvARxMMfCU6IU8ru0NC8NMIix
 S7KA==
X-Gm-Message-State: APjAAAVV/hMaE32qELwzRpd+/V8dtpobUURy3klKxIeLMlKYDzy9ZR+t
 SpJ334T69k1gwkHzzsYvamqfxLoXt3V2618SP0kv7A==
X-Google-Smtp-Source: APXvYqzoos7gil9/bd2ud3c7XGx9/sFw4n1RwuZvFi9g1qjK4Vjnzm6+zyBUKs53r3Nk95p3CsWMkHOqs81kTxZxdZ4=
X-Received: by 2002:a02:a0c6:: with SMTP id i6mr46847608jah.7.1567620187753;
 Wed, 04 Sep 2019 11:03:07 -0700 (PDT)
MIME-Version: 1.0
From: Birger Birger <birger.solna@gmail.com>
Date: Wed, 4 Sep 2019 20:02:56 +0200
Message-ID: <CABRH9Vx7CSxROBCMV5fbNPN-Sct4kFB_D2TawAWt_0KqD_C6KQ@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Subject: [apparmor] apparmor & clamav
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
Content-Type: multipart/mixed; boundary="===============8738298605574817489=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8738298605574817489==
Content-Type: multipart/alternative; boundary="0000000000006f0f140591be048c"

--0000000000006f0f140591be048c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks promising to troubleshoot. Any ideas?

Sent from my =EF=A3=BF iPhone

> On Sep 4, 2019, at 03:01, Birger Birger via clamav-users <
clamav-users@lists.clamav.net> wrote:
>

From Ubuntu syslog:
> Sep 4 08:40:01 zentyal kernel: [345190.998397] audit: type=3D1400
audit(1567579201.044:83): apparmor=3D"DENIED" operation=3D"connect"
profile=3D"/usr/bin/freshclam" name=3D"/run/samba/winbindd/pipe" pid=3D1269
comm=3D"freshclam" requested_mask=3D"wr" denied_mask=3D"wr" fsuid=3D0 ouid=
=3D0

--0000000000006f0f140591be048c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div style=3D"font-family:sans-serif;font-size:12.8px" di=
r=3D"auto"><div style=3D"width:328px;margin:16px 0px"><div>This looks promi=
sing to troubleshoot. Any ideas?=C2=A0</div><div dir=3D"auto"><br>Sent from=
 my =EF=A3=BF iPhone<br><br>&gt; On Sep 4, 2019, at 03:01, Birger Birger vi=
a clamav-users &lt;<a href=3D"mailto:clamav-users@lists.clamav.net" style=
=3D"text-decoration-line:none;color:rgb(66,133,244)" target=3D"_blank" rel=
=3D"noreferrer">clamav-users@lists.clamav.net</a>&gt; wrote:<br>&gt;</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">From Ubuntu syslog:<br>&gt; Se=
p 4 08:40:01 zentyal kernel: [345190.998397] audit: type=3D1400 audit(15675=
79201.044:83): apparmor=3D&quot;DENIED&quot; operation=3D&quot;connect&quot=
; profile=3D&quot;/usr/bin/freshclam&quot; name=3D&quot;/run/samba/winbindd=
/pipe&quot; pid=3D1269 comm=3D&quot;freshclam&quot; requested_mask=3D&quot;=
wr&quot; denied_mask=3D&quot;wr&quot; fsuid=3D0 ouid=3D0<br></div></div><di=
v style=3D"height:0px"></div></div><br></div>

--0000000000006f0f140591be048c--


--===============8738298605574817489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8738298605574817489==--

