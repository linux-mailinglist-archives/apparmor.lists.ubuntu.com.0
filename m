Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BA02A6F24
	for <lists+apparmor@lfdr.de>; Wed,  4 Nov 2020 21:45:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kaPeo-0004XF-WE; Wed, 04 Nov 2020 20:45:26 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1kaPen-0004X9-4x
 for apparmor@lists.ubuntu.com; Wed, 04 Nov 2020 20:45:25 +0000
Received: from 2.general.sarnold.us.vpn ([10.172.64.71] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>)
 id 1kaPel-00014n-3y; Wed, 04 Nov 2020 20:45:24 +0000
Date: Wed, 4 Nov 2020 20:45:21 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: swarna latha <sswarnas@gmail.com>
Message-ID: <20201104204521.GA343519@millbarge>
References: <CAJs3c4wJHm=HB_LiL1G-=2V20-D86e5Xxt6tTzMquD9b3Bv_kg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJs3c4wJHm=HB_LiL1G-=2V20-D86e5Xxt6tTzMquD9b3Bv_kg@mail.gmail.com>
Subject: Re: [apparmor] Regarding using apparmor to harden container
 configuration
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
Content-Type: multipart/mixed; boundary="===============5777685586754960474=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--===============5777685586754960474==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 04, 2020 at 11:31:54AM -0500, swarna latha wrote:
> 1. My process will be using a set of libraries and these libraries might be
> writing to some files in the rootfs or need some capabs. I dont see this
> files/capabs in my apparmor logs. Is this expected behaviour ?

Hello Swarna, you'll need to give a lot more information for useful
feedback. What kernel are you using? What container system are you using?
How are you loading the profiles? What profiles are you loading? Can you
see the loading messages in the logs? Have you confirmed with simple test
programs that AppArmor is working at all in your environment?

> 2. Is there any limitation for apparmor to monitor applications running in
> container or is it the same as an application running in the host ?

There's some subtlety to working with AppArmor in containers, yes; for
example, the chromium sandbox uses unprivileged user namespaces and then
proceeds to use capabilities 'within' that new user namespace. These
aren't "real" capabilities from the perspective of the outside world, they
shouldn't grant undue privileges to do things outside the container,
but within the container they should kind of work.

Here's some examples:

root@u20:/# mkdir /tmp/foo ; chmod 000 /tmp/foo
root@u20:/# echo "include <tunables/global> profile test { include <abstractions/base> /usr/bin/* rmix, /etc/** r, }" | apparmor_parser --replace
root@u20:/# aa-exec -p test cat /etc/shadow
root:*:18478:0:99999:7:::
[...]
root@u20:/# aa-exec -p test cat /root/.bashrc
cat: /root/.bashrc: Permission denied
root@u20:/# aa-exec -p test ls -l /tmp/foo
ls: cannot open directory '/tmp/foo': Permission denied

Within the container:
root@u20:/# ps auxwZ | grep sleep
test (enforce)                  root        1348  0.0  0.0   7228   460 pts/0    S    20:39   0:00 sleep 100
unconfined                      root        1353  0.0  0.0   8160   576 pts/0    S+   20:41   0:00 grep --color=auto sleep

Outside the container:
sarnold@millbarge:~$ ps auxwZ | grep sleep
lxd-u20_</var/snap/lxd/common/lxd>//&:lxd-u20_<var-snap-lxd-common-lxd>:test (enforce) 1000000 410011 0.0  0.0 7228 460 pts/0 S 20:39   0:00 sleep 100
unconfined                      sarnold   410547  0.0  0.0   6772   568 pts/2    S+   20:40   0:00 grep --color=auto sleep


And AppArmor has logged these events:

sarnold@millbarge:~$ grep -e 'DENIED.*u20' -e 'operation="profile_load"' /var/log/audit/audit.log | tail -4
type=AVC msg=audit(1604521212.527:644468): apparmor="STATUS" operation="profile_load" label="lxd-u20_</var/snap/lxd/common/lxd>//&:lxd-u20_<var-snap-lxd-common-lxd>:unconfined" name="test" pid=398872 comm="apparmor_parser"
type=AVC msg=audit(1604521274.330:644469): apparmor="DENIED" operation="open" namespace="root//lxd-u20_<var-snap-lxd-common-lxd>" profile="test" name="/root/.bashrc" pid=399475 comm="cat" requested_mask="r" denied_mask="r" fsuid=1000000 ouid=1000000
type=AVC msg=audit(1604521708.134:644474): apparmor="DENIED" operation="capable" namespace="root//lxd-u20_<var-snap-lxd-common-lxd>" profile="test" pid=403302 comm="ls" capability=2  capname="dac_read_search"
type=AVC msg=audit(1604521708.134:644474): apparmor="DENIED" operation="capable" namespace="root//lxd-u20_<var-snap-lxd-common-lxd>" profile="test" pid=403302 comm="ls" capability=1  capname="dac_override"

sarnold@millbarge:~$ uname -a
Linux millbarge 5.4.0-42-generic #46-Ubuntu SMP Fri Jul 10 00:24:02 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

Thanks

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAl+jEt0ACgkQ8yFyWZ2N
LpcATwgAhsEEbs9UFtSTG6tLlchPcXJJTFX7zemIdiHZxbHqRUcNDdeUC0mQumX6
mIxE1BQdKQ+OA5BFDeM4KmwK8JzdYH0z2JEAUABYzz9ueVgw+ufBu1NXLBSCh0FI
0cBCpAWzIZUfx7z666/yIo+JwyG3cv+TN5b7/r5FXDJqY/DuR2acxw4webavht9J
DsXm2jekrHvn2a+QmgzN+CfUiANGoZD3O8gh107hO2RHE3bMOGW1jv+Yw8Pdi+m1
1ougyaeqUWWExfQHug9tb0/CXcJN4jlYMwjluCMzJUULe9rKi2p90v+1tAtnjSZb
qnaSq8Eh7ICXf8BrwLUCKuUAf/F7vQ==
=YgZ+
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--


--===============5777685586754960474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5777685586754960474==--

