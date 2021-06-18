Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3363ADF41
	for <lists+apparmor@lfdr.de>; Sun, 20 Jun 2021 17:50:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1luziP-0005jq-TZ; Sun, 20 Jun 2021 15:50:29 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <ratankgupta31@gmail.com>) id 1lu8tS-0003ZB-3X
 for apparmor@lists.ubuntu.com; Fri, 18 Jun 2021 07:26:22 +0000
Received: by mail-ed1-f45.google.com with SMTP id n20so7260839edv.8
 for <apparmor@lists.ubuntu.com>; Fri, 18 Jun 2021 00:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Di5ujz3YReS/47ZSM2PvMTDY7g2k/+9orsV5RYOvBkw=;
 b=nq3HtTap8ojdcRT6JNB9O5t/XTJn0tZaODHUxzcXDzlEwx4Jfr6BzLjkBbEMUbrXx1
 z3Ij3I1MDpNUEUgeRzjtOcv5iOJixbNlzPmDW0fI32vdmil1quAt0XlqM4DN11ePjx0l
 qajLR/PyxWFZwHryvRkRqK+9CLU77WxLyLw6dMVaoWtu5DpR31qSrnujO2hTiv2iX2up
 jJDwjG9jMxT9RfsmbHI6MU7ca2czlntaF4vIMsqe/uECEUrmU208/j0RnK0azC1em47s
 6yET2xzQn5/usPKIsYYs7RfKjDtFexKzWuM83YPdQ2l6QMEIOx/vZ/vOb11G13uD9G/U
 85wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Di5ujz3YReS/47ZSM2PvMTDY7g2k/+9orsV5RYOvBkw=;
 b=on/DDTlsjsWHZ4JOoXzsCMABWW3a2NqYeeLmb0RDUsPjovRtWekcQOWCYRzqPs+DHx
 wHA4MWTYIa20hoKVPDSY0T7IW2BhjmErmuAIZLKIvNLXt/uuEegXp3iENMti39DxLI07
 xoke3n/Ko3N2fJnMQjlcckBMD/2MBSFeYiiFeteByEcmG0LJJluYZ3ve82x+ExnLfbMt
 Fh2M9Qh0Uc9X0L6QlQuQ2Gq7fAdgMLUykGMFGT3sA8DZFCPN3qo/UhJhf62SmrMH4xMz
 4+9MPsPfHhFiWGhMu4ghMV1Yh1JPUiA61gFvvEqJXpa256DG4S3+k635N0aA5rT4+euY
 3ZvA==
X-Gm-Message-State: AOAM530CTHljKn/pLlgt3JftyPhi5KvW//UgHEk2nLAZ86j6K1e0eIhJ
 K9RSSBhd3ANHddtzhl3eNS7nHxbsKvVD46UHYX1Q95U7Z2Y=
X-Google-Smtp-Source: ABdhPJwJJKqf+uafBSrNJIjqaMW7QoYb0nFktR2ahMKmS5FqboNI0+lEcMcTUQ7mglPG1M7g/TpLLq0fUvX5UfOuwIE=
X-Received: by 2002:a05:6402:524b:: with SMTP id
 t11mr3149984edd.327.1624001181316; 
 Fri, 18 Jun 2021 00:26:21 -0700 (PDT)
MIME-Version: 1.0
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Fri, 18 Jun 2021 12:56:10 +0530
Message-ID: <CAMhqiMoZbABJ5yRL4O8tN14ur0H+2cCXP=g00QgPSjuPmN0Z0w@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.208.45;
 envelope-from=ratankgupta31@gmail.com; helo=mail-ed1-f45.google.com
X-Mailman-Approved-At: Sun, 20 Jun 2021 15:50:28 +0000
Subject: [apparmor] apparmor is not getting started
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
Content-Type: multipart/mixed; boundary="===============2658733940658950427=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============2658733940658950427==
Content-Type: multipart/alternative; boundary="00000000000086fc9d05c5053d28"

--00000000000086fc9d05c5053d28
Content-Type: text/plain; charset="UTF-8"

Hi Team,

It would be really helpful if you can look at the following email and guide
me what I am missing?

I am trying to enable the apparmor in the following linux,
https://github.com/openbmc/linux
<https://github.com/openbmc/openbmc/tree/master/meta-ibm/recipes-kernel/linux>

I pulled the http://git.yoctoproject.org/cgit/cgit.cgi/meta-security layer
and pulled the apparmor from the meta-security.

My kernel is built with the following option flags to enable the
apparmor(Highlighted in *BOLD*)

CONFIG_PCI=y
CONFIG_PCIEPORTBUS=y
CONFIG_PCI_DEBUG=y
CONFIG_PCI_STUB=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCIE_ASPEED=y
CONFIG_SCSI=y
CONFIG_BLK_DEV_SD=y
CONFIG_CHR_DEV_SG=y
CONFIG_USB_NET_DRIVERS=y
CONFIG_SENSORS_ADT7475=y
CONFIG_USB_UHCI_HCD=y
CONFIG_USB_STORAGE=y
CONFIG_USB_ETH=y
CONFIG_MSDOS_FS=y
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_UTF8=y
CONFIG_SENSORS_ADT7475=y

CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_PATH=y
*CONFIG_SECURITY_APPARMOR=y*

*CONFIG_SECURITY_APPARMOR_HASH=yCONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y*

*CONFIG_DEFAULT_SECURITY="apparmor"CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1*
CONFIG_AUDIT=y
define KFEATURE_COMPATIBILITY all

root@abc:~# aa-status
apparmor not present.


root@abc:~#

root@abc:~# apparmor_status
apparmor not present.
root@abc:~#

root@abc:~# systemctl status aaparmor
Unit aaparmor.service could not be found.
root@abc:~# systemctl status apparmor
* apparmor.service - AppArmor initialization
     Loaded: loaded (/lib/systemd/system/apparmor.service; enabled; vendor
preset: enabled)
     Active: inactive (dead)

*Condition: start condition failed at Thu 1970-01-01 00:00:14 UTC; 51 years
5 months ago             `- ConditionSecurity=apparmor was not met*
       Docs: man:apparmor(7)
             http://wiki.apparmor.net/

Jan 01 00:00:14 abc systemd[1]: Condition check resulted in AppArmor
initialization being skipped.

Regards
Ratan Gupta

--00000000000086fc9d05c5053d28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>It would be really =
helpful if you can look at the following email and guide me what I am missi=
ng?</div><div><br></div><div>I am trying=C2=A0to enable the apparmor in the=
 following linux,</div><a href=3D"https://github.com/openbmc/openbmc/tree/m=
aster/meta-ibm/recipes-kernel/linux" rel=3D"noopener noreferrer" target=3D"=
_blank" style=3D"box-sizing:inherit;text-decoration-line:none;font-family:S=
lack-Lato,appleLogo,sans-serif;font-size:15px;font-variant-ligatures:common=
-ligatures;background-color:rgb(248,248,248)">https://github.com/openbmc/li=
nux</a><div><br></div><div>I pulled the=C2=A0<a href=3D"http://git.yoctopro=
ject.org/cgit/cgit.cgi/meta-security" target=3D"_blank">http://git.yoctopro=
ject.org/cgit/cgit.cgi/meta-security</a>=C2=A0layer and pulled the apparmor=
 from the meta-security.<br></div><div><br></div><div>My kernel is built=C2=
=A0with the following=C2=A0option flags to enable the apparmor(Highlighted =
in=C2=A0<b>BOLD</b>)</div><div><br></div><div>CONFIG_PCI=3Dy<br>CONFIG_PCIE=
PORTBUS=3Dy<br>CONFIG_PCI_DEBUG=3Dy<br>CONFIG_PCI_STUB=3Dy<br>CONFIG_PCI_IO=
V=3Dy<br>CONFIG_PCI_PRI=3Dy<br>CONFIG_PCIE_ASPEED=3Dy<br>CONFIG_SCSI=3Dy<br=
>CONFIG_BLK_DEV_SD=3Dy<br>CONFIG_CHR_DEV_SG=3Dy<br>CONFIG_USB_NET_DRIVERS=
=3Dy<br>CONFIG_SENSORS_ADT7475=3Dy<br>CONFIG_USB_UHCI_HCD=3Dy<br>CONFIG_USB=
_STORAGE=3Dy<br>CONFIG_USB_ETH=3Dy<br>CONFIG_MSDOS_FS=3Dy<br>CONFIG_VFAT_FS=
=3Dy<br>CONFIG_FAT_DEFAULT_UTF8=3Dy<br>CONFIG_SENSORS_ADT7475=3Dy<br><br>CO=
NFIG_SECURITYFS=3Dy<br>CONFIG_SECURITY_NETWORK=3Dy<br>CONFIG_SECURITY_PATH=
=3Dy<br><b>CONFIG_SECURITY_APPARMOR=3Dy</b><br><b>CONFIG_SECURITY_APPARMOR_=
HASH=3Dy<br>CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3Dy</b><br><b>CONFIG_DEFA=
ULT_SECURITY=3D&quot;apparmor&quot;<br>CONFIG_SECURITY_APPARMOR_BOOTPARAM_V=
ALUE=3D1</b><br>CONFIG_AUDIT=3Dy<br>define KFEATURE_COMPATIBILITY all<br></=
div><div><div><br></div><div>root@abc:~# aa-status<br>apparmor not present.=
</div><div><br></div><div><br>root@abc:~#<br><br>root@abc:~# apparmor_statu=
s<br>apparmor not present.<br>root@abc:~#<br><br>root@abc:~# systemctl stat=
us aaparmor<br>Unit aaparmor.service could not be found.<br>root@abc:~# sys=
temctl status apparmor<br>* apparmor.service - AppArmor initialization<br>=
=C2=A0 =C2=A0 =C2=A0Loaded: loaded (/lib/systemd/system/apparmor.service; e=
nabled; vendor preset: enabled)<br>=C2=A0 =C2=A0 =C2=A0Active: inactive (de=
ad)<br>=C2=A0=C2=A0<b>Condition: start condition failed at Thu 1970-01-01 0=
0:00:14 UTC; 51 years 5 months ago<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0`- ConditionSecurity=3Dapparmor was not met</b><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Docs: man:apparmor(7)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<a href=3D"http://wiki.apparmor.net/" target=3D"_blank">ht=
tp://wiki.apparmor.net/</a><br><br>Jan 01 00:00:14 abc systemd[1]: Conditio=
n check resulted in AppArmor initialization being skipped.<br></div></div><=
div><br></div><div>Regards<font color=3D"#888888"><br></font></div><font co=
lor=3D"#888888"><div>Ratan Gupta</div></font></div>

--00000000000086fc9d05c5053d28--


--===============2658733940658950427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2658733940658950427==--

