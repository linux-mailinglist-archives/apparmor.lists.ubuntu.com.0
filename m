Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E892BEA546
	for <lists+apparmor@lfdr.de>; Wed, 30 Oct 2019 22:18:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iPvMW-0004F5-98; Wed, 30 Oct 2019 21:18:40 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1iPvMV-0004DI-4S
 for apparmor@lists.ubuntu.com; Wed, 30 Oct 2019 21:18:39 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id 97C255C0084
 for <apparmor@lists.ubuntu.com>; Wed, 30 Oct 2019 22:18:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OyR9vftqcqTp for <apparmor@lists.ubuntu.com>;
 Wed, 30 Oct 2019 22:18:36 +0100 (CET)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Wed, 30 Oct 2019 22:18:36 +0100 (CET)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Wed, 30 Oct 2019 22:18:33 +0100
Message-ID: <3123834.6SKfGVQhCn@tux.boltz.de.vu>
In-Reply-To: <2a10b83e-ca79-8b90-8760-35200875b454@gmail.com>
References: <3af23e54-c7fc-e35a-717f-03a3a376d50b@gmail.com>
 <6369836.ZBJUOshDE2@tux.boltz.de.vu>
 <2a10b83e-ca79-8b90-8760-35200875b454@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8018747433703226992=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8018747433703226992==
Content-Type: multipart/signed; boundary="nextPart5011721.sTbpfEb7PC"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5011721.sTbpfEb7PC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,

Am Mittwoch, 30. Oktober 2019, 08:08:45 CET schrieb Jacek:
> Log from command aa-logprof -f /var/log/apparmor.log:
> https://pastebin.com/raw/1887Semy

Thanks, that helped :-)


Reproducer:

a) have the following profile:

profile chrome-sandbox {
  ptrace read peer=/opt/google/\*/chrome,
}

b) run

aa-logprof -f <(echo '[  116.472008] audit: type=1400 audit(1572414763.823:331): apparmor="DENIED" operation="ptrace" profile="chrome-sandbox" pid=9310 comm="chrome-sandbox" requested_mask="read" denied_mask="read" peer="chrome"') -d ../profiles/apparmor.d/

(the -d part is only needed for my test setup)


Note the \* part in the profile - this looks wrong because I don't 
believe there's a directory named * under /opt/google/ ;-)  My guess 
is that the rule was meant as /opt/google/<whatever>/chrome.

Workaround: adjust/fix the rule to
  ptrace read peer=/opt/google/*/chrome,
(= remove the backslash)

Now the interesting question is how you got that strange (and most
probably wrong) rule.
- If you created the profile yourself, did you use the aa-* tools or an
  editor?
- If the profile is shipped by a package, please open a bugreport and
  ask to get the backslash removed.

Please also check the whole profile - if there are multiple rules with a
"wrong" backslash, only removing one won't help too much ;-)


Now that I have a reproducer, I'll look into fixing the crash.
Unfortunately the code that converts rules to regexes is interesting[tm], 
which means it might take some time until I can come up with a patch.
As far as I already know / found out, * gets replaced by
(((?<=/)[^/\x00]+)|((?<!/)[^/\x00]*))   (which hopefully means "one or 
more chars, but no /"). Now I'll "only" need to find a sane way to handle 
\* in a(n even more) special way...


Regards,

Christian Boltz
-- 
> Be aware that a s390x / and most ppc64 are not a smart phones
> nor net books.
They just don't fit into the pocket. :)
[> Dr. Werner Fink and Kay Sievers in opensuse-factory]

--nextPart5011721.sTbpfEb7PC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAl25/ikACgkQxqaC6mPI
LxyjtRAArC3ZgmhpzswlVqPPP8GNfv3jAqHCA45xBm3y44igpZoJ6KeSPAPvCPyI
MoRIL4DMwiBhT5biZ+La6V4m3R4lGpR6j5GLqGpXigRHQ8aKXMW4bx/kmgcX1pNw
iEiutXj8UxYGjtnLeCQ8/fgCANd59A3KxJhlH2f3P/P0/QhLBcv5bfZCZ/pbX55I
Bf+/4fv7QDpkI031Zq0/TDv9QQ43cC6kjbzM5m74WqUA7pUJ3nTecLYlzHEFvD9E
zOV4m5t/2Iskvs+jqLXmCnwMwt00/HGNFU3+IoTVPLThG7WhWw5mArsphvgI6PO+
45xarUYIsYsPSJlYJw6v1A5ybccliY/G22jMhnj2VS6TKlBhXgxuPe7cemrGx49q
CCjQY6KuUYXFfXE1S7cLO5sxTmadvr34Hjr8WdRe72qOW2AM2j0q1EmRSnLnu3V/
nQ7jexexDqtDpjQlD8XqxMgelMaSbeYhu4UrS7lLpHl5zFkUtme5h4aZZ9AeOYwH
fdrrXt5VOY3Ja3iAhvsQatMTC9Ihawn6E/Mtg7qLWL9ens2GqSMNbnDXLX7U69Y+
sb/pLdWWZcyUTfRASlGTW9F1H1d6XyiQ6rMCc2vBrTpACDU1/r09AD5Wexcb8gnU
3pO6kfWodOLiLcSyigiZSrdvfnpvYFaLGyCAkvPutQsk26DoE+o=
=RVju
-----END PGP SIGNATURE-----

--nextPart5011721.sTbpfEb7PC--





--===============8018747433703226992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8018747433703226992==--




