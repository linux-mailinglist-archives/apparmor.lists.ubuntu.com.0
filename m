Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B93244401
	for <lists+apparmor@lfdr.de>; Fri, 14 Aug 2020 05:50:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k6QjG-0003Es-VL; Fri, 14 Aug 2020 03:50:06 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1k6QfT-00031S-E3
 for apparmor@lists.ubuntu.com; Fri, 14 Aug 2020 03:46:11 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>)
 id 1k6Qf9-0007Qm-7C; Fri, 14 Aug 2020 03:46:10 +0000
Date: Fri, 14 Aug 2020 03:45:48 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Message-ID: <20200814034548.GA3096694@millbarge>
References: <CAODFaZ5jftC-cEVxLSwNB_RX15AswxgUVaDTf35bUqXte1M7Nw@mail.gmail.com>
 <20200804002056.GB2250578@millbarge>
 <CAODFaZ4io354t+qwQMBHzaMdN9hY9cGucBdot26DeuDgDsEOwA@mail.gmail.com>
 <90be476c-2702-ed53-ada9-94245703f23f@canonical.com>
 <CAODFaZ7KbnxEWC-btPdF-ykgU5Q0i3NGaqsfahJjNYsJ=72Hng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAODFaZ7KbnxEWC-btPdF-ykgU5Q0i3NGaqsfahJjNYsJ=72Hng@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0625880853778944061=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============0625880853778944061==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2020 at 10:46:46PM -0400, Murali Selvaraj wrote:
> Goal: Converting root process to non-root process by enabling required
> capabilities for the process.
> [...]
> Process (A) will be running in "non-root" but with all enabled capabiliti=
es
> and check the apparmor logs.
> Apparmor logs will show the required capabilities.

Yes, this should work fine. There's several ways I can think of to do
this:

- Run the program as root (it sounds like it already runs as root and
  you're converting it) and keep track of AppArmor DENIED or ALLOWED
  entries.

- Run the program via a systemd unit file and add capabilities to the
  program via the AmbientCapabilities=3D directive. If you know nothing
  about your application or how it works, you could add them all, and
  once you've learned what it requires, trim the list appropriately.

- Run the program via an executable with fscaps and set all the
  capabilities on the file.

If you already know something about the program, you could skip the
capabilities that it will obviously never use.

> In any event, AppArmor will usually see capability requests after the usu=
al
> DAC permissions are handled.
>=20
> Can you please explain this above statement with simple example?
>=20
> For example, Process (x) tries to open a file (/etc/security) which is ro=
ot
> permission but the process (x) runs in "non-root mode.
> Pls note, process (x) does not have permission to open this file
> ((/etc/security) )
>=20
> open =3D> sys_open() =3D> kernel further code for handing the code.
>=20
> sys_open() =3D> will return permission denied error due to permission iss=
ue.
>=20
> Here, capable() check won't happen. Does DAC take care of this check
> without using capability (CAP_DAC_READ_SEARCH)?
>=20
> In such a case, trying to understand when Kernel uses capable() to check
> CAP_DAC_READ_SEARCH/CAP_DAC_OVERRIDE before/after DAC.
> Can you please explain the relation between DAC, apparmor and linux
> capability with this context?

CAP_DAC_READ_SEARCH will only be used if you've changed the permissions on
/etc to forbid owner, group, or world read or execute permissions,
depending upon the owner and group of the file, and fsuid and groups of
the process.

CAP_DAC_OVERRIDE will only be used if /etc/security owner, group, or
world, permissions don't allow the operation to the process's fsuid and
groups.

Unix permissions are flexible -- and indeed, it is their flexiblity that
provides motivation for mandatory access control systems like AppArmor.
Your program may or may not need either of these capabilities, even if it
works with files owned by other users, because the permissions on those
files may also be set to allow your program to use them.

If you're writing an application from scratch it is probably worth taking
some time to decompose your application into smaller pieces determining
the flow of data through your application, and trying to use Unix users
and groups to do what you can to use the Unix permissions model to
enforce the right flow of data.

For example, the qmail suite of programs run with several users and a
strict dataflow through the program. The author, djb, said a dozen years
after writing qmail that he thinks this did not actually contribute to
qmail's better-than-average security record, but I disagree: This approach
also forced a clear understanding of responsibilities, data flows, etc.
(To be clear, I think djb could just as well write a secure qmail without
this restriction, but djb's skills are unique.)

Of course not all applications lend themselves to this kind of
decomposition.

If you are developing an application from scratch rather than porting
an existing application, aim for *no* capabilities. Try to replace every
capability with something else. If you need CAP_NET_BIND_SERVICE to bind
to a low TCP or UDP port, you could use systemd's socket activation
instead. That's two or three extra lines in systemd configuration and
no chance for introducing privilege dropping bugs.

The usual "classic Unix daemon" quite often just needs CAP_NET_BIND_SERVICE,
CAP_SETGID, and CAP_SETUID -- and the latter two, only to drop the
privileges that were required for the initial bind(2) call. systemd socket
activation and User=3D, Group=3D, etc directives means this can be done
completely outside of your own application and your application can run
without privileges at all.

AppArmor is a useful tool but standard tools and careful design work may
be able to reduce the amount of privileges an application needs in the
first place.

Thanks

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl82COgACgkQ8yFyWZ2N
Lpec6gf9Gf718ubMtEeJTzLfne3b5fqWdfDk8n0qxmRD1iJJiH7v+zaRIyOwQtY0
xfa1qkrCeCuF20NbBNINjShgICgJi7ji/KNQKTZtqfMU1vNDV7iPGhm/gdSTh2SL
9qahxyTyZh5y2VqZr7IHtU1tlPTXVDDfdgqVgUz5fBxtawIU6SWNvV250jRJrJ+i
+bFkcR86nxTjoRdLJiZr2ml8oZR6Lc+LXlvB7zx7PdSQ0lMNiiSF0RYqNNukTSMj
z50DqSzeqr7xc4MefmGeAyUYHXC6UfHx3TlZUKhQXsLufNHmtA09j/mqB3sO0/GN
jpZcyli/2jgZI7BJsJ9t2wFRWblHRA==
=KPUp
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--


--===============0625880853778944061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============0625880853778944061==--

