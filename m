Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D67184317C
	for <lists+apparmor@lfdr.de>; Wed, 12 Jun 2019 23:37:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hbAw5-0008Rm-Fg; Wed, 12 Jun 2019 21:37:37 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.86_2) (envelope-from <seth.arnold@canonical.com>)
 id 1hbAw3-0008Rg-6K
 for apparmor@lists.ubuntu.com; Wed, 12 Jun 2019 21:37:35 +0000
Received: from 1.general.sarnold.us.vpn ([10.172.64.70] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <seth.arnold@canonical.com>)
 id 1hbAw2-0002VF-6C; Wed, 12 Jun 2019 21:37:34 +0000
Date: Wed, 12 Jun 2019 14:37:32 -0700
From: Seth Arnold <seth.arnold@canonical.com>
To: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
Message-ID: <20190612213732.GC18268@hunt>
References: <9A7F1FD4-2A3E-4F39-B6F2-7E351F787CA8@getmailspring.com>
MIME-Version: 1.0
In-Reply-To: <9A7F1FD4-2A3E-4F39-B6F2-7E351F787CA8@getmailspring.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [apparmor] Questions about AppArmor's Code
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
Cc: Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Content-Type: multipart/mixed; boundary="===============2117908900005540276=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============2117908900005540276==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2019 at 12:32:53PM +0000, Abhishek Vijeev wrote:
> Hi,
>=20
> I have a few questions about AppArmor's code and would be grateful if
> you could kindly answer them.

[I've stripped your urls of some get-mail-spring style links]

> 1) The documentation at this link
> https://gitlab.com/apparmor/apparmor/wikis/AppArmor_Core_Policy_Reference=
#address-expr
> mentions the possibility of specifying a network rule as "network tcp
> src 192.168.1.1:80 dst 170.1.1.0:80". However this doesn't work, and
> after a little digging, I found out that the productions rules for this
> policy were available only in the grammar specification of AppArmor 2.1
> (line number 670 of
> https://gitlab.com/apparmor/apparmor/blob/apparmor-2.1/parser/parser_yacc=
=2Ey
> ). I find this extremely useful, and am considering trying to add this
> to AppArmor as part of a larger project. Could you kindly clarify the
> reason for its removal? Were there any hurdles that made it difficult to
> accomplish this?

Fine-grained networking controls have been on the most often desired
features for perhaps fifteen years.

Some small portions of fine-grained networking may be simple enough to
implement as a project. Controlling bind, listen, and connect might be
straight forward enough. However, a more fully-featured implementation
that mediates sockets passed in, or sockets shared among multiple domains,
etc., would require significantly more work to implement.

Quite a lot of the mediation points available in the Linux kernel aren't
in process context. There's mechanisms available to cope with this, but
they're not nearly as easy to use as doing the mediation when running in
process context.

I'm rusty on this at this point, but if you search lwn for secmark, secid,
you'll probably find some useful articles. (Figuring out which ones are
useful is left as an exercise for the reader. :)

> 2) At what stage during the kernel boot process does AppArmor load the
> profiles? And from where does it obtain them? (am I correct in
> understanding that the profiles are stored in
> /sys/kernel/security/apparmor/policy ?)

The kernel boot process does not load any apparmor policy. Policy is
loaded by userspace.

If you want to have a confined init, you'll need to modify your initramfs
to load policy before switching to the system init.

Most distributions use the sysv-initscripts, or a fork from them from
years ago, and some systemd unit files to call the initscripts. These
usually load policy from /etc/apparmor.d/ but packaging systems like click
and snap loaded policy from elsewhere, and libvirt and snapd (among
others) will dynamically generate and load policy as needed.

> 3) Why does function 'aa_alloc_profile( )' allocate extra memory ? It
> seems to be allocating memory for 3 objects of type 'struct aa_profile'.
> (line number 262 of
> https://github.com/torvalds/linux/blob/master/security/apparmor/policy.c
> )

This is allocating space for a single struct aa_profile and two pointers:

https://github.com/torvalds/linux/blob/master/security/apparmor/include/pol=
icy.h#L162

struct aa_profile {
	struct aa_policy base;
	struct aa_profile __rcu *parent;
	/* ... */
	aa_label label;
};

https://github.com/torvalds/linux/blob/master/security/apparmor/include/lab=
el.h#L134

struct aa_label {
	struct kref count;
	struct rb_node node;
	/* ... */
	struct aa_profile *vec[];
};

The pointers are for the final vec: https://en.wikipedia.org/wiki/Flexible_=
array_member

Thanks

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl0BcJgACgkQ8yFyWZ2N
LpdyNAf+I079mnQPaZS9J6y71P7X89Lsv+T+s1xD+A129jh0B8K0nYQCKII0bg58
OgnEzngrLE74aVRa0D/RmHpOviYJSttASNMC93hOYg1Sv+NqVX4vKzQTBzJRefS3
PgUKi/7/STzEC74rE75YxeIMkZQLlHAXHnXUSvpjez4fAcRnaMIKqs/ZVU7Mjh1f
o4M4od+JxOQLBqBVghtNDa83vDeRkFxActesBkDP6w+rjWe8ASVV+fZ++BN6FjXc
dAMIf0h1oAJIT73pk8pmF63LkDPTqPXMeUWOfcBd18givNVFeh5zKjY9LRPoaKAj
04B63C2XuDH/513Ci0AEUeqZx7P6BA==
=P3+U
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--


--===============2117908900005540276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2117908900005540276==--

