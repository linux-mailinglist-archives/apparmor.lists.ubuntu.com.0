Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 238B723B19E
	for <lists+apparmor@lfdr.de>; Tue,  4 Aug 2020 02:21:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k2khR-0000Tb-Bg; Tue, 04 Aug 2020 00:21:01 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1k2khP-0000TA-UE
 for apparmor@lists.ubuntu.com; Tue, 04 Aug 2020 00:20:59 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>)
 id 1k2khP-00010d-59; Tue, 04 Aug 2020 00:20:59 +0000
Date: Tue, 4 Aug 2020 00:20:56 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Message-ID: <20200804002056.GB2250578@millbarge>
References: <CAODFaZ5jftC-cEVxLSwNB_RX15AswxgUVaDTf35bUqXte1M7Nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAODFaZ5jftC-cEVxLSwNB_RX15AswxgUVaDTf35bUqXte1M7Nw@mail.gmail.com>
Subject: Re: [apparmor] Apparmor: Query
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
Content-Type: multipart/mixed; boundary="===============5938722052857301093=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============5938722052857301093==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Murali,

On Mon, Aug 03, 2020 at 02:03:38PM -0400, Murali Selvaraj wrote:
> Query 1:
>=20
> - But I do not see CAP_DAC_OVERRIDE and CAP_KILL in apparmor event logs.

AppArmor does not have a mechanism to grant capabilities that a process
does not already have. The kernel will query LSMs to see if a capability
is allowed to be used if the process already has the capability in
question. (There may be exceptions to this, there's hundreds of these
checks scattered throughout the kernel.)

You'll only see these requests in AppArmor logs if the process had these
capabilities. By using su to switch to the 'nobody' account, you only have
access to whatever privileges the nobody account already has: additional
access to root_squashed files on NFS, any other processes mistakenly
running as user nobody, etc.

Because this doesn't include any capabilities in the process's
capabilities sets, AppArmor won't even see the requests.

> Query 2:
>=20
> - How apparmor identities how many capabilities are needed for the proces=
s?

The kernel will call capable() in the codepaths as necessary; the security
module interface will get the calls, without context, after the rest of
the kernel's capabilities handling. It's difficult to follow because it's
been heavily optimized for performance.

In any event, AppArmor will usually see capability requests after the
usual DAC permissions are handled.


> Query 3:
>=20
> - Does all system calls need capability when it runs in a non-root proces=
s,
> how does apparmor mapping the linux capabilities?

"root processes" means both uid 0 as well as having capabilities in the
effective capability set. (Perhaps it'd also make sense to consider the
other capability sets in the process?) A uid 0 process with no
capabilities still has considerable power, since many important files like
/etc/sudoers are owned by uid 0, and modifying these files through DAC
permissions alone could be used to then gain capabilities. However, a uid
0 process with no capabilities couldn't itself initiate a reboot in the
kernel, or override DAC restrictions on files, etc.

A process with capabilities need not be uid 0 though I can't immediately
point any common examples.

Linux's uid namespaces makes things a bit more complicated: a process can
have namespace-level capabilities that do not extend to capabilities in
the init namespace. (Consider something like an LXD guest: there may be
different users within the guest, and the 'root' user with the LXD guest
can do privileged operations over the namespace, eg manage the routing
table used for that network namespace, but not be able to manage the
routing table used by the network namespace for the init process.)

See the user_namespaces(7) and unshare(2) manpages for some more informatio=
n.

> Can someone please clarify these queries?

I'm afraid my description probably made things worse.

Let me try one quick simple thing:

Run your example with and without root privileges. You'll see the
difference in AppArmor log output. Hopefully that helps. :)

Thanks

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl8oqeQACgkQ8yFyWZ2N
Lpc1HQf/c9DqrbDkYKjnzl6Sjr0nLyd/dMXj5gRiW8wks44L8hRo50b97uCdkdUu
AbvTUG1Gg+l/jIALSVARSdrK9rrXkxB65W/oFM06FjhbhAVNxXeS3gUvpOljoBY8
/6ASoFJiwPqjLNC0w2vs6ABcChiS493M/ALzTse6Vq6bLnmHsp7Kozs9g/YIN1Gw
A4ma6xM4l6R+CcZKNrSB9KOuGkWaLaKHy2XZ/mZG9flpGj9csKGOfM5ttpp/mkmR
ZLiaHgwgvF+wAHGA8M4E7YpnnuOVMIggUrSKUiovZT11Pyp1pm+KzU9f5NEgs0Qx
yvAcmPi0tsPnR+4Ww761xE+7c3qwRQ==
=xpPC
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--


--===============5938722052857301093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5938722052857301093==--

