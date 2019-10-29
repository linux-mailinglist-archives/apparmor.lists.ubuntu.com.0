Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4358BE8998
	for <lists+apparmor@lfdr.de>; Tue, 29 Oct 2019 14:34:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iPRdH-0000qI-Jq; Tue, 29 Oct 2019 13:33:59 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1iPRdG-0000qA-ES
 for apparmor@lists.ubuntu.com; Tue, 29 Oct 2019 13:33:58 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 036865C0091;
 Tue, 29 Oct 2019 14:33:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vniO2CjoT9tD; Tue, 29 Oct 2019 14:33:56 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Tue, 29 Oct 2019 14:33:56 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Tue, 29 Oct 2019 14:33:53 +0100
Message-ID: <6369836.ZBJUOshDE2@tux.boltz.de.vu>
In-Reply-To: <ae3e5dd7-5ac3-2a4c-e938-b8920e725d6a@gmail.com>
References: <3af23e54-c7fc-e35a-717f-03a3a376d50b@gmail.com>
 <2163705.lk1CSWkQ7O@tux.boltz.de.vu>
 <ae3e5dd7-5ac3-2a4c-e938-b8920e725d6a@gmail.com>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] AA-logprof error
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
Content-Type: multipart/mixed; boundary="===============9132942655839058906=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============9132942655839058906==
Content-Type: multipart/signed; boundary="nextPart1726209.4mxe5KkxKl"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1726209.4mxe5KkxKl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,

Am Dienstag, 29. Oktober 2019, 06:29:49 CET schrieb Jacek:
> sys-apps/apparmor-utils-2.13.3

I had some hope that 2.13.3 has this already fixed ;-)

This makes my remaining question more important - can you please provide 
the log messages that trigger this bug?

    grep chrome /var/log/audit/audit.log | grep trace

Note that the log filename might differ - if you don't have auditd 
running, it could also be /var/log/messages or /var/log/syslog. (To make 
things easier - aa-logprof prints the logfile it uses on startup.)


> >> /usr/lib64/python3.6/site-packages/apparmor/rule/__init__.py in
> >> is_covered(self=<PtraceRule> ptrace read
> >> peer=/opt/google/\*/chrome,,
> >> other_rule=<PtraceRule> ptrace read peer=chrome,,
> >> check_allow_deny=False, check_audit=False)



Regards,

Christian Boltz
-- 
> openSUSE [...] is a project driven by "Those who do, decide"
This is bullshit, sorry. Because "Those who undo, decide too".
[> Richard Brown and Stephan Kulow in opensuse-project]

--nextPart1726209.4mxe5KkxKl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAl24P8EACgkQxqaC6mPI
Lxwt0g/9G59FaaEIb3SC5fQ2Fay1uDkpb0qFYzFYeP+D57naUnTBAW56F2zC1Oe+
riveFl0gw+7PtBes9htZWdRSW2OvT5kx9tUODT3vsWmJYx5zTQmH76nS8YvcEAZp
2Bee6i17ZbtodbDQamDYdCH6t8Z6hiiEChQMySMFKHoFhu9u3CjduZ7YM2JG9Hx4
kAjflvzTBFgo5ucTFfK2FTjTKoHl76NPQXID8/9sRkOT5khy8ZBhaASLSD6xMjhU
04KwiaKxW1W6ls+4f6D695tPlfAoxN7pAV3tntesttWNHTo+Yec4UyldpYdq1T+V
yxcR+rFb4m8flwnJDi3HDo6xWqYl3iX/NQBG9IToAsdrEdEUWRC/5UZlZkGgOL9H
G5kOIGD++j4CmzlOGr0UwhDXhg3tssrxV5ufFXwG9lfFUazqpjuDr6ZOgQiNbyTp
ak8XRb7v2AQhRpSVU0uik+yhpVcp2lDaj9OoQs6wNQUb7ylcPY5ug2m/y+wQXlSK
Rnbw4x5XuEhKf0y0I7vRFOWqRxK4sKxTExWBBr5zQJF2jCkKkoiU5hx3Wh95fOwJ
KHH4FyIQvi/weuiA4QTlc5OQXZtdFxJmQH+elp9iE/CSI9m0ZI/rswXyutNzMp05
fbgE+XrdKF5lRQDSujSjgbP4tsO5YgKliivD3vApqWLZzomVYUc=
=PY6K
-----END PGP SIGNATURE-----

--nextPart1726209.4mxe5KkxKl--





--===============9132942655839058906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============9132942655839058906==--




