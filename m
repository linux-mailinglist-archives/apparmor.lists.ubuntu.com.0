Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EC53B6972
	for <lists+apparmor@lfdr.de>; Mon, 28 Jun 2021 22:05:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lxxVl-0004jS-Er; Mon, 28 Jun 2021 20:05:41 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lxxVj-0004jI-Ho
 for apparmor@lists.ubuntu.com; Mon, 28 Jun 2021 20:05:39 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <seth.arnold@canonical.com>) id 1lxxVi-0002Yy-U3
 for apparmor@lists.ubuntu.com; Mon, 28 Jun 2021 20:05:39 +0000
Date: Mon, 28 Jun 2021 20:05:36 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20210628200536.GA36743@millbarge>
References: <CAODFaZ7dHuXBCCRZC0oHQHk0HneMvMF_GWHyOE7y=w-BiQpLyg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAODFaZ7dHuXBCCRZC0oHQHk0HneMvMF_GWHyOE7y=w-BiQpLyg@mail.gmail.com>
Subject: Re: [apparmor] Addressing limitations in DAC
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
Content-Type: multipart/mixed; boundary="===============5605729705893251076=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============5605729705893251076==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 27, 2021 at 03:01:10AM +0530, Murali Selvaraj wrote:
> - I would like to understand limitations in DAC which are addressed in
> Apparmor. Please share any simple examples to understand this query.

The usual example is users using chmod 777 on their own documents because
they heard once that this solves permissions problems. A MAC tool
restricts what processes can do with this file, even though the DAC
permisssions allow all processes to read and write the file.

A less user-oriented example is something like Apache: you may want it to
serve your website, but not serve your /etc/passwd file (which is
intentionally world readable.)

> - Does command line injection (SECVUL) issue be addressed if we use
> Apparmor?  If so, give a real time example for the reference.

Not really, though it depends upon the specifics of your software: if
your software accepts filenames as command line parameters, AppArmor can
help ensure that it only has permission to open some subset of files on
the system.

> - In other words, by restricting the system resource using Apparmor,
> what are the major security leaks are we avoiding? Pls share
> additional details if available.

You can make sure that your web server can only serve web pages,
your database server can only import and export data through specific
locations, your interactive users over ssh can't perform administrative
actions without using your specific auditing tool, You could make sure
that the software that analyzes photos can't do networking and can't
run anything else that can do networking, either. Or you could make
sure that some proprietary tool that you must run but you can't audit
the source code for can't read your ssh and gpg keys and can only write
into its specific directory.

If you've got a computer that only does one thing, maybe a MAC isn't very
useful. But if your computer does two or more things, you can specify what
interactions are allowed, using which communication channels.

Thanks

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmDaK4wACgkQ8yFyWZ2N
Lpf2Ywf/TrbsSmuw+mw9nc3IH4NqAievTcwhkfKMj9OT2wcdeWwOXl6XVjRk0gza
NiUSoyYCp7Fl9LzFf/cGTM7gxSkV2kM6PhrIUde9yCI+cvdA6qH6FvZaHhWjQRTz
yzEhsufv0AViyxLzcF4Xf2nykft/EfEFU8unswvAm7fon9e2wunoxwUVsHyenoy0
F/eJfQMdogMbdJKgXT/xskQtDb5Kwo9rNA2Zw9kmHBrWB+pCx25aUwNBw75f4hmN
OMhHznHfBw0kRk9W3Lb5RDmo4/x1Q7cAqQQHas2nbc6ouAufwKAFkM/bm9Z94Q80
7WqUeGcZfoEDZ64XdYTLnfv1tgMOEQ==
=Jqg1
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--


--===============5605729705893251076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5605729705893251076==--

