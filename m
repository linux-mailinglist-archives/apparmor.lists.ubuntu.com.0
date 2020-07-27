Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8522FE38
	for <lists+apparmor@lfdr.de>; Tue, 28 Jul 2020 01:57:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k0CJc-0007tP-6R; Mon, 27 Jul 2020 23:13:52 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <amitavmohanty01@gmail.com>) id 1k0AaV-0002V9-Bb
 for apparmor@lists.ubuntu.com; Mon, 27 Jul 2020 21:23:11 +0000
Received: by mail-vs1-f42.google.com with SMTP id j186so9060168vsd.10
 for <apparmor@lists.ubuntu.com>; Mon, 27 Jul 2020 14:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=alhdc6SrYN4fpixgZHjvGkdesP/O5fQXO3oMsKOtQSk=;
 b=OSsFQrA0p1Sei/LBdCjRb7E3pBykvxx6xU4rRwQFqZl6OsjcQxBkD+L3UIdOsaNL5i
 2YrnYghMBZ/McUNBST+biRLU7/odurhQ5F54TSrAuL2HjQ192YAolGlxvlfm42pyD2T+
 JbzGDhRY4nz5f9QRQ7OgnCPZ+ltE49ifhPlgFXL1G6KrUM9vP/qWhmmBNHCKntRCxVhL
 3UFLahNR+NP9HyHsgZ3sDbJLGJeZe+5sCWkrjdP3izHkIC/wZIF7V2ALBpmBCDz+88Tq
 AnpF74zS7405OIEZxT6crJcZEXIiGlHbQbmCbwQb3HD6oA1diYaagT7F9e40AJOZQws3
 V+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=alhdc6SrYN4fpixgZHjvGkdesP/O5fQXO3oMsKOtQSk=;
 b=kaFx43t3GvFYRQL7rD/aI4sCfdAa75dSSLkh5aqSPCA4KXFpXbSaWbrUpoIVPGEAZa
 0V+l8olLdKbverqtQU2yyGg8Lx4cFE/CESRmTnNtchWt/A8OfPnGCbAyZe13AkpdhIh7
 Nz1Et2Lzmv8Uk0EeQCXewR9m7k+EK1mtCyNMOfDSer5sCuJ6exK9CfYNGzvO90QOnUTr
 njHo0ya0TwK6qlO4mrdL+UZSSYXzLn5r+IXQ0JuagkoPmbyHK7ScQxEC9WnmukMN/bVH
 kAZT+G2tRy3Z/AWfW/M8SUJyODJYm2O2oEKoRxe3V1isKWao/pVb+1XRHtmnYu4S9uHE
 2U6A==
X-Gm-Message-State: AOAM531MdE4r+6jHk+s+BqRjF2WnI5d0KmYlcgCDnJdhoUdAXfo4niEx
 VSSH759OB9jYoC5J0gRbTbBZzRxZLSq2yC/GmzQjvcPP
X-Google-Smtp-Source: ABdhPJz4Es3aKtcOw62ttu6wtL1K4A3GzN/7VcyRtLawsrbcENO8R4NlfZYIGpPWHZgRWfjQqUbH6uHmAuii+thY+D4=
X-Received: by 2002:a67:b909:: with SMTP id q9mr16893575vsn.132.1595884989854; 
 Mon, 27 Jul 2020 14:23:09 -0700 (PDT)
MIME-Version: 1.0
From: Amitav Mohanty <amitavmohanty01@gmail.com>
Date: Tue, 28 Jul 2020 02:52:56 +0530
Message-ID: <CAG0uzYPzaMLKxniLHha0-xTmbN2NpDGSOLumBJfFYchKee-_1Q@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.217.42;
 envelope-from=amitavmohanty01@gmail.com; helo=mail-vs1-f42.google.com
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:13:51 +0000
Subject: [apparmor] Portable profiles
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
Content-Type: multipart/mixed; boundary="===============9204199485215408018=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============9204199485215408018==
Content-Type: multipart/alternative; boundary="000000000000ec372505ab72ed53"

--000000000000ec372505ab72ed53
Content-Type: text/plain; charset="UTF-8"

Hi

I am reading up on Apparmor recently. I see that Ubuntu and openSUSE have
packaged profiles in their repositories. However, other distributions are
just asking people to create the profiles using tools or manually or modify
profiles from the above distributions. I think that sort of hinders the
adoption of Apparmor. I would love to hear your thoughts on this.

Also, I was thinking of having some tool as the following:

have a base profile template for an application
    |
    |
   \ /
have a generator tool         <-- a distro-specific list of locations
(libraries included)
    |
    |
   \ /
create a profile usable in the distro directly from the profile template
maintained in the common repo

Let me know what you think.

Regards,
Amitav

--000000000000ec372505ab72ed53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><div><br></div><div>I am reading up on Apparm=
or recently. I see that Ubuntu and openSUSE have packaged profiles in their=
 repositories. However, other distributions are just asking people to creat=
e the profiles using tools or manually or modify profiles from the above di=
stributions. I think that sort of hinders the adoption of Apparmor. I would=
 love to hear your thoughts on this.</div><div><br></div><div>Also, I was t=
hinking of having some tool as the following:</div><div><br></div><div>have=
 a base profile template for an application</div><div>=C2=A0=C2=A0=C2=A0 |<=
br></div><div>=C2=A0=C2=A0=C2=A0 |</div><div>=C2=A0=C2=A0 \ /</div><div>hav=
e a generator tool=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;-- a=
 distro-specific list of locations (libraries included)</div><div><div>=C2=
=A0=C2=A0=C2=A0 |<br></div><div>=C2=A0=C2=A0=C2=A0 |</div><div>=C2=A0=C2=A0=
 \ /</div><div>create a profile usable in the distro directly from the prof=
ile template maintained in the common repo</div><div><br></div><div>Let me =
know what you think.</div><div><br></div><div>Regards,</div><div>Amitav<br>=
</div></div></div>

--000000000000ec372505ab72ed53--


--===============9204199485215408018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============9204199485215408018==--

