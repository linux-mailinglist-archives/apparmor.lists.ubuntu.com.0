Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF1436A306
	for <lists+apparmor@lfdr.de>; Sat, 24 Apr 2021 22:48:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1laPCb-00087s-I9; Sat, 24 Apr 2021 20:48:33 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1laPCa-00087f-CE
 for apparmor@lists.ubuntu.com; Sat, 24 Apr 2021 20:48:32 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id B64E15C01AF;
 Sat, 24 Apr 2021 22:48:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uH5anUkXxHN2; Sat, 24 Apr 2021 22:48:30 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Sat, 24 Apr 2021 22:48:30 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Sat, 24 Apr 2021 22:48:27 +0200
Message-ID: <1845778.uqYG4e8EI7@tux.boltz.de.vu>
In-Reply-To: <CAODFaZ4hxO9Rmj04AFAn0nGA=8LPFUdUERUNDEGznF2HEDesww@mail.gmail.com>
References: <CAODFaZ5-vQeqWtgWmwO=Qp21=JjeC5zJCzZ-zkpQT2hQNONqcQ@mail.gmail.com>
 <CAODFaZ7jKw4vugyvUsVeckzMmEooj6kPGRfJwbNbrH_uG=awOQ@mail.gmail.com>
 <CAODFaZ4hxO9Rmj04AFAn0nGA=8LPFUdUERUNDEGznF2HEDesww@mail.gmail.com>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
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
Cc: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Content-Type: multipart/mixed; boundary="===============0591793537318343298=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============0591793537318343298==
Content-Type: multipart/signed; boundary="nextPart1783022.xGtHm5fRn2"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1783022.xGtHm5fRn2
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Cc: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Subject: Re: [apparmor] Apparmor: Query on adding many capabilities in the custom header file
Date: Sat, 24 Apr 2021 22:48:27 +0200
Message-ID: <1845778.uqYG4e8EI7@tux.boltz.de.vu>
In-Reply-To: <CAODFaZ4hxO9Rmj04AFAn0nGA=8LPFUdUERUNDEGznF2HEDesww@mail.gmail.com>
References: <CAODFaZ5-vQeqWtgWmwO=Qp21=JjeC5zJCzZ-zkpQT2hQNONqcQ@mail.gmail.com> <CAODFaZ7jKw4vugyvUsVeckzMmEooj6kPGRfJwbNbrH_uG=awOQ@mail.gmail.com> <CAODFaZ4hxO9Rmj04AFAn0nGA=8LPFUdUERUNDEGznF2HEDesww@mail.gmail.com>

Hello,

Am Samstag, 24. April 2021, 15:46:22 CEST schrieb Murali Selvaraj:
> Can you please guide me to resolve the above query on the header file
> with enabling many capabilities in the header file?

a) /nvram2/apparmor_boot/caps/common

    capability chown dac_override dac_read_search fowner fsetid kill ipc_lock sys_nice setpcap pc_owner sys_ptrace sys_chroot,

or (same meaning, but more readable)

    capability chown,
    capability dac_override,
    capability dac_read_search,
    capability fowner,
    capability fsetid,
    capability kill,
    capability ipc_lock,
    capability sys_nice,
    capability setpcap,
    capability pc_owner,
    capability sys_ptrace,
    capability sys_chroot,


b) /nvram2/apparmor_boot/usr.bin.test

    profile test /usr/bin/test flags=(attach_disconnected) {
        #include "/nvram2/apparmor_boot/caps/common"
        capability setuid,
        capability setgid,

        /sys/devices/system/cpu/online r,
        [... all your other rules ...]
    }

Note that you need to move the include inside the profile.


Regards,

Christian Boltz
-- 
>In Yast2-System-Editor /etc/sysconfig-Dateien in
>System-Kernel-MODULES_LOADED_ON_BOOT ide-scsi eintragen.
*JAUUUUUUUULLLLL* *ARRRGGHHHH*
Man reiche mir eine Klinik-Jahrespackung von $SCHMERZMITTEL!!!
[> Heinz Dittmar und David Haller in suse-linux]

--nextPart1783022.xGtHm5fRn2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmCEhBsACgkQxqaC6mPI
LxyGkxAAqKhUldeaWyISdT/y3l0ag4f1h8AtSzJzZbPqszXYkv+dgzei0bEG5e2a
XY8kOBPhw/7r9Rx0AkXFUEa1QbEJ6lFUzEAzkjyDPAll2/DIHXhDumnaMBC1ZkHW
2p2uvnAMbGYFljKyFLq438U4jp2/7Gh5ZR+7sIbEEZMDEn1hHQQ021iQ52lOl6R+
eAnBhXNI5bPDivdBz/UiAyG9XByo8zurnmRQHY7iUNx6JMmpeeQQo7nczsWCxzh+
1yIRvts5cogPyCwee/wGSXhHxIkHvGjze/fpB4RrFtl62ES+DJGgC6y/iG3Ayv3q
ZW6OZ2igmX3jZx4e9zOZzCLFYIaWGysJ0qC7eIYQBlEeuSmuLVK90slYDZOmYkzJ
qRGy3M5t6+1cm9ryGPFiPXOouA+zLcipl9IXtPuUDJFRs5zI/pQpHXpaD1HuRb1H
mrFXq5ozJ8v+WlfYv+0mOzewOXitW9dy3GLB8ulnHGnI8PHQWMo05+8ZsF/ESaev
VOrrxt4rP0nwyYiDA/JL5CuQKX9G3GIEH+CJ+/FX7UkQPrNPVk2ECeAALGxSrCU6
RRoDpodL7LXWM7pWyAHQgJoyCoOgHZD8CBFvKmii8N3KaTLIp4losDjcPMljBH6v
5W8I3SEhOlTHyMeaQluAo5kFp+ZFL1TVS9NjYSc+VkTrzMAy+So=
=swVg
-----END PGP SIGNATURE-----

--nextPart1783022.xGtHm5fRn2--





--===============0591793537318343298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============0591793537318343298==--




