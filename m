Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E060326F0A
	for <lists+apparmor@lfdr.de>; Sat, 27 Feb 2021 22:32:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lG7C7-0002x8-3L; Sat, 27 Feb 2021 21:32:11 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1lG7C4-0002wM-Ii
 for apparmor@lists.ubuntu.com; Sat, 27 Feb 2021 21:32:08 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id DAFF15C01AE;
 Sat, 27 Feb 2021 22:32:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FdrDqYUTUnXT; Sat, 27 Feb 2021 22:32:05 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Sat, 27 Feb 2021 22:32:04 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Sat, 27 Feb 2021 22:32:01 +0100
Message-ID: <3193579.oVCXLik4gb@tux.boltz.de.vu>
In-Reply-To: <trinity-8ec36262-f18c-4589-b8dc-91a6d7be3eb6-1614197267130@3c-app-gmx-bs73>
References: <trinity-9878cf5b-24f9-455c-a35b-82da31b41e7f-1614161820960@3c-app-gmx-bs53>
 <6901047.gQ41x59yMm@tux.boltz.de.vu>
 <trinity-8ec36262-f18c-4589-b8dc-91a6d7be3eb6-1614197267130@3c-app-gmx-bs73>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] What are "AARE"s, exactly?
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
Content-Type: multipart/mixed; boundary="===============7169222719962517705=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============7169222719962517705==
Content-Type: multipart/signed; boundary="nextPart1742665.NAextbAEGE"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1742665.NAextbAEGE
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Cc: TheDiveO@gmx.eu
Subject: Re: [apparmor] What are "AARE"s, exactly?
Date: Sat, 27 Feb 2021 22:32:01 +0100
Message-ID: <3193579.oVCXLik4gb@tux.boltz.de.vu>
In-Reply-To: <trinity-8ec36262-f18c-4589-b8dc-91a6d7be3eb6-1614197267130@3c-app-gmx-bs73>
References: <trinity-9878cf5b-24f9-455c-a35b-82da31b41e7f-1614161820960@3c-app-gmx-bs53> <6901047.gQ41x59yMm@tux.boltz.de.vu> <trinity-8ec36262-f18c-4589-b8dc-91a6d7be3eb6-1614197267130@3c-app-gmx-bs73>

Hello,

Am Mittwoch, 24. Februar 2021, 21:07:47 CET schrieb TheDiveO@gmx.eu:
> > It seems the apparmor.d manpage lacks a mention of AARE at one place
> > - the place they are explained ;-)
> 
> Especially a proper definition, it seems. As it is, today's definition
> rather looks like cats having a jolly good time with a keyboard, and
> especially the weird keys.

;-)

> > That place is the "Globbing" section. Have a look at it, it should
> > help to understand the AARE syntax.
> 
> Ah, thanks for that pointer! It does help understanding the AARE
> syntax ... but unfortunately only to _some_ extend. For instance,
> this does not explain the additional features that seems to be
> defined, like using variables; but then, the globbing section doesn't
> cover variables either.

You can use variables inside an AARE, and also inside alternations:

    /foo/@{bar}/** r,
    /foo/{@{bar},baz}/** r,

(of course you need to define the variable @{bar} in the preamble)

> For instance, in the context of specifying a peer using an AARE: does
> that mean that I could specify a set of matching profile names (task
> labels), such as "foo*"? or "/usr/bin/*"?

Yes.

> > If you still have questions, feel free to ask - maybe the manpage
> > needs more improvements ;-)
> 
> ...I would suspect so...

I tried some additions to the apparmor.d manpage. Before I submit them 
to gitlab - do the changes include everything you missed? (If not, feel 
free to propose a better text ;-)

--- a/parser/apparmor.d.pod
+++ b/parser/apparmor.d.pod
@@ -1513,9 +1513,10 @@
 F</etc/apparmor.d/tunables/global>. F</etc/apparmor.d/tunables/global> 
 is typically included at the beginning of an AppArmor profile.

-=head2 Globbing
+=head2 Globbing (AARE)

-File resources may be specified with a globbing syntax similar to that
+File resources and other parameters accepting an AARE
+may be specified with a globbing syntax similar to that
 used by popular shells, such as csh(1), bash(1), zsh(1).

 =over 4
@@ -1548,6 +1549,12 @@
 matching a, b or c

 will expand to one rule to match ab, one rule to match cd

+Can also include variables.
+
+=item B<@{variable}>
+
+will expand to all values assigned to the given variable.
+
 =back

 When AppArmor looks up a directory the pathname being looked up will



Regards,

Christian Boltz
-- 
* mrdocs wonders when darix sleeps
<sshaw> mrdocs: robots don't need sleep
[from #opensuse-buildservice]

--nextPart1742665.NAextbAEGE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAmA6ulEACgkQxqaC6mPI
Lxz0dxAAyKDTm2PaYfvDlJw3pYFNI7wSgbEvUSmXBcUPn9ZH75fu2er+jhKwDhpc
uwF8X3i6MI/HQH0tCwbtGMDUD1yp8Bx6Kk+AxkACCoJVzx5tjsykgZzSUI35/FN6
2Ox5Ksoz0eoFAufyN4rPF9WdsFO0LVhvgPXWRomS44TpQClgin7eTG9DTNK6iwEk
d2NTklI6bvC9Z157hbKgW5QhwnQfoegRnX9HU5snFR5AqCzMGwUZj5TwUEG2oFpn
F+fIHXmQNBvhC9EHcOgHT/9icziiUUGOSMnzhN8+bW7OOoQoLgpS7uxevfYFGT8K
TavFeE/+ijcbqqryx4n8lOUI4z2ZNaN7F/KCH2CpizGsIeKaHZhKShie8g+7DN1u
eD3Yhpd8AqB7BN8iyEJOGLRMAPQaT2pGOKQiIkHG2n6ZlEY8qdh+p7HYH2w0Zd1n
jrd770VW/hYZZiODf3lyeIRnguD+g7YNQt+edTF+4NzkonN9IYV4bd3QbKHkPFvK
yK5vA4UvowN7Ck/jhvMLcgttircIC1Y9YiF2I+ItHvHSXaku1nyUHDIvkzitufAW
I/k53SA3lHzF0gg6hzRuYBHGwTdQkCk2pHju3mwrLJ05cyMjqNC/fWLZvJokR2bl
HHFdpB/RnukWVIjqmMep/6hLBOa+rFSYNnUXWXWZR8L5GOdFExk=
=+eO7
-----END PGP SIGNATURE-----

--nextPart1742665.NAextbAEGE--





--===============7169222719962517705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7169222719962517705==--




