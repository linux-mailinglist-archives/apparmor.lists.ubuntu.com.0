Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 844C22A205
	for <lists+apparmor@lfdr.de>; Sat, 25 May 2019 02:11:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hUKH3-0003iS-A8; Sat, 25 May 2019 00:10:57 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.86_2) (envelope-from <seth.arnold@canonical.com>)
 id 1hUKH1-0003iL-CT
 for apparmor@lists.ubuntu.com; Sat, 25 May 2019 00:10:55 +0000
Received: from 1.general.sarnold.us.vpn ([10.172.64.70] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <seth.arnold@canonical.com>)
 id 1hUKH0-0004TI-Q9
 for apparmor@lists.ubuntu.com; Sat, 25 May 2019 00:10:55 +0000
Date: Fri, 24 May 2019 17:10:53 -0700
From: Seth Arnold <seth.arnold@canonical.com>
To: apparmor@lists.ubuntu.com
Message-ID: <20190525001053.GB6058@hunt>
References: <7979059d-044a-3f1a-83f9-8254a8a51daa@zestysoft.com>
MIME-Version: 1.0
In-Reply-To: <7979059d-044a-3f1a-83f9-8254a8a51daa@zestysoft.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [apparmor] Attempting FullSystemPolicy with Ubuntu 18.04.2
	LTS...
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
Content-Type: multipart/mixed; boundary="===============7698551315792887666=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============7698551315792887666==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2019 at 03:28:21PM -0700, Ian wrote:
> It's like I'm only getting a few of these at a time -- I added this to the
> kernel boot parameter: 'audit_backlog_limit=3D65536' but that didn't seem=
 to
> affect the number of these that I was shown. I assume some type of
> throttling might be occurring but there was no notice of this happening on
> the console.

Hello Ian,

The audit_backlog_limit parameter likely only applies to the auditd
daemon. If your audit messages are written to dmesg instead, you'll
reach a different rate limiting method. (Though I thought that one would
include a message about printk rate limits being hit.)

Regular printk message rate can be controlled via
/proc/sys/kernel/printk_ratelimit
/proc/sys/kernel/printk_ratelimit_burst
details are in the kernel source file Documentation/sysctl/kernel.txt

> 1) Can I separate out the different "comm" matches into different profile
> files or do I need to maintain one monolithic file?

You can't filter directly on comm. (You can do the profile transitions on
exec, though, as you already know.)

> 2) If I want to worry about restricting binaries later, but only want to
> "whitelist" at this point in time, is there a generic profile that I can
> create that will grant all permissions?

We should probably write a tool to generate one appropriate for the system
it's on, since it's not obvious how to do this by hand. But "Allow
Everything" profiles probably shouldn't be the norm, so maybe a little
friction is worthwhile.

Anyway, it would look something like:

profile profilename /attachment/specification {
  network,
  signal,
  file,
  mount,
  pivot_root,
  ptrace,
  unix,
  dbus,
}

> 3) Why did this "Warning from stdin (line 1): /sbin/apparmor_parser: cann=
ot
> use or update cache, disable, or for" disappear when I started to use
> profile files instead of echo for apparmor_parser?

The filename used for the compiled cache files is based on the filename of
the input files.

> 4) Will I be able to retain the apparmor profile files that come with
> Ubuntu?=A0 I assume I'll need to duplicate most of the stuff I've done in
> initramfs into /etc/apparmor.d somewhere?

Likely these will need some changes. You'll probably want more strict
profiles than we've provided, anyway, since we've written the profiles
with the contrasting goals of providing some safety but without too
much compromise in useability. If you're doing this full-system policy
investigation you'll probably want to make different tradeoffs than
we have.

> 5) How does apparmor handle multiple profiles that match on the same file=
?=A0
> Is the reason why my separate init profile file ignored because the
> init-systemd one already matched on it?

This is a bit involved.

There's attachments using attachment specifications from unconfined
processes and Px rules with wildcards, then there's profile-directed
transitions.

When going from unconfined to confined, or when using a Px rule where at
least some of the pathname is written with wildcards or other globbing,
then AppArmor will try to apply policy in the order of most specific to
least specific name. A profile attachment without wildcards should beat a
profile with wildcards or globbing. Multiple profile attachments with
wildcards or globs should pick the longest match.

Profile-directed transitions (-> in the rules) will take precedence
over the attachment-directed transitions. I believe in this case every
execution must have exactly one possible outcome but I'm less sure
of this.

I hope this helps.

Thanks

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAlzoiAUACgkQ8yFyWZ2N
Lpeyogf+L1ekiSCRTOFwqcWWi70mG5wYlMwkwYkaruxMnYThzcrYtUYO2mSefmp5
u+kRx1tyewgngcOwR3fxUOk0Ob98odMIuAflQmuaSmHCyPQpB3B2lpmJUo5uil0p
g196ZNhg2iu34ZvPsFwGP6G6aWDlreBzqCK7dQYmL7ABoNoqEdQHlvO7vJfHoSGO
9t2WKMcOkD3kHy5kVGWxscmP6lRvenHmFemJ/BSMg29YnJB618uUBSeHnXXdJk+8
u6C8A/PO6E8HWGdigrZQkp9RTTmax4+wjYC9rrnO5zdN3a5rWJlcd6H6QtOoCcZx
urInzNhViqLrhMCS+x8LTXeSfVqmmw==
=4guX
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--


--===============7698551315792887666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7698551315792887666==--

