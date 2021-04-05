Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id F1272354887
	for <lists+apparmor@lfdr.de>; Tue,  6 Apr 2021 00:19:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lTXYa-00013i-HJ; Mon, 05 Apr 2021 22:18:52 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1lTXYY-00013b-OW
 for apparmor@lists.ubuntu.com; Mon, 05 Apr 2021 22:18:50 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>)
 id 1lTXYY-0001wt-32; Mon, 05 Apr 2021 22:18:50 +0000
Date: Mon, 5 Apr 2021 22:18:48 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Message-ID: <20210405221848.GA3209843@millbarge>
References: <CAODFaZ4_k=8JWue+YSwMCs7BTbBLCPknpkfbock+HYo1kJgaqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAODFaZ4_k=8JWue+YSwMCs7BTbBLCPknpkfbock+HYo1kJgaqg@mail.gmail.com>
Subject: Re: [apparmor] Apparmor: Queries
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
Cc: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="===============6065236890801002623=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============6065236890801002623==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2021 at 01:09:02AM +0530, Murali Selvaraj wrote:
> -> From the aa-log-prof, we are able to generate an apparmor profile
> for the required process. In order to confirm the profile(by
> theoretically)
>    if we compare cat /proc/<pid>/maps | grep -i lib this output will
> it be sufficient or any possibility of the libraries may
>    not be in this entry cat /proc/<pid>/maps?

Hello Murali,

/proc/pid/maps only reflects libraries that are currently in use. It's
possible for applications to use dlopen(3) to dynamically load libraries
at runtime (think "plugins") -- and probably some applications do
something very similar for dynamically loaded libraries but do it
themselves rather than using dlopen(3).

So /proc/pid/maps is good enough for most applications but it is not
comprehensive in the general case.

> -> Like a library, do we have any other way to find the list of
> configuration, temporary files using by process can be identified
>    by simple tools or from any /proc entries like above? This is just
> to confirm about our profile.

You could use filesystem auditing rules or syscall auditing rules with
auditd, or you could use ebpf tools like opensnoop from the iovisor
project to catch file and directory opens, reads, writes. There's a lot of
systemcalls that do file IO, though, and it'd be easy to overlook one that
your application uses.

You could use perf to enumerate all the syscalls that your application
uses in its test suite, and then audit all the file-related syscalls.

> -> For example, one of my process is running in "non-root" owner which
> has read/write access to /proc/<test>/<test_2>/
>    While generate profile for this process, Do I need to add this
> entry /proc/<test>/<test_2>/* rw, Or without adding this entry
>    will it able to do read/write operation /proc/<test>/<test_2>/?

I'm sorry, I don't understand this question.

A confined process needs to have AppArmor rules to allow whatever it is
that you actually want to allow.

> Can you please explain the difference for the below entries in the
> apparmor profile?
>=20
> /tmp/lock_file rw,
> /tmp/lock_file rwc,

'c' is how the kernel portion of AppArmor reports a file creation attempt.
'c' is not accepted in the userspace portion of AppArmor policies, so your
second rule will fail to compile:

$ echo "profile p { /a c, }" | apparmor_parser -Qd
AppArmor parser error, in stdin line 1: syntax error, unexpected TOK_ID, ex=
pecting TOK_MODE


> /tmp/test.css ww,
> /tmp/test.css w
> /tmp/initialized rww,
> /tmp/initialized rw,

The second 'w' is redundant and doesn't do anything. The parser accepts
this without error, though:

$ echo "profile p { /a ww, }" | apparmor_parser -Qd
----- Debugging built structures -----
Name:		p
Profile Mode:	Enforce
--- Entries ---
Mode:	wa:wa	Name:	(/a)


> /tmp/driver krw,
> /tmp/driver rw,

The version with 'k' lets your application call flock(2) on the file
/tmp/driver.

> By default, while device boots apparmor profiles are loaded to Kernel
> and the corresponding process read from the profile during the process
> execution,
> -> As per our code, the process kills/crashes by unknown reason; we
> have a mechanism to restart by itself.
>  In that case, during the process restart, will it start as per
> profile or without profile?

This depends on how the application was originally started and how you'll
restart it, as well as the application policy that you've written. If the
supervisor that you're using to start the application is responsible for
restarting the application, it'll probably go fine. If a different
mechanism is being used to restart the application, it might not.

> I would like to understand the reason for below DENIED logs, what does
> it really expect?
> Do I need to add the entry like /tmp/test c or /tmp/test rw or
> /tmp/test rwk? Pls share the difference for each mentioned
> possibility?
>=20
> 2021 Apr 04 17:35:05 admin kernel: audit: type=3D1400
> audit(1617557705.711:207): apparmor=3D"DENIED" operation=3D"mknod"
> profile=3D"example" name=3D"/tmp/test" pid=3D11410 comm=3D"application"
> requested_mask=3D"c" denied_mask=3D"c" fsuid=3D0 ouid=3D0
>=20
> What is really this log expecting?

For this specific entry two possibilities make sense:

/tmp/test w,
owner /tmp/test w,

The application may need other permissions later; AppArmor can't know when
the file is created if the application will read from it, lock it, execute
it, etc. It won't know those things until the application actually issues
syscalls for that.

Thanks

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmBrjMQACgkQ8yFyWZ2N
LpfxiAgAt3wNVk5uXBAUSiTbVvsRjeQG9dbVGcekKbo3b/mSmH93I3DdftO0lhkB
Eja8WjCgrCWy117YbBcenEYPzKDUPXh9BTSYqJRloKaJhEK89wpK8tb401/u5wDe
0/bCwKXp4iHk3j8cGFTN3RZGP/mbK7DVCTNuSCDw86dREQMGfiVJda7asLClScJV
Hkvht+7ffv5cr1TbMnIVvirVmzBklPLueYxHqq8jO0F8hRAFBZaI/sypSA7wZScQ
+l9pkZLmR3Ydr7YPx3u+F8BU/8jYBnQ9QnPGxy2TFYi/FgMGcr7P/ggRD0DASVPG
dzR3YZQ+y0qFfUvlRIT8JSfd1jLENA==
=4ODu
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--


--===============6065236890801002623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6065236890801002623==--

