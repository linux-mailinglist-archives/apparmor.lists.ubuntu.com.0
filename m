Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FC29161D
	for <lists+apparmor@lfdr.de>; Sun, 18 Aug 2019 12:25:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hzIMv-0001Ye-66; Sun, 18 Aug 2019 10:25:01 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@cboltz.de>) id 1hzIMt-0001YS-C0
 for apparmor@lists.ubuntu.com; Sun, 18 Aug 2019 10:24:59 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id D7D465C00DC
 for <apparmor@lists.ubuntu.com>; Sun, 18 Aug 2019 12:24:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pb9RAhMdgQxk for <apparmor@lists.ubuntu.com>;
 Sun, 18 Aug 2019 12:24:57 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA
 for <apparmor@lists.ubuntu.com>; Sun, 18 Aug 2019 12:24:57 +0200 (CEST)
From: Christian Boltz <apparmor@cboltz.de>
To: apparmor@lists.ubuntu.com
Date: Sun, 18 Aug 2019 12:24:55 +0200
Message-ID: <8656614.ltYWEj7lmW@tux.boltz.de.vu>
In-Reply-To: <MAXPR0101MB1132E410C073568A5D2C30F5FBD20@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB1132E410C073568A5D2C30F5FBD20@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: Re: [apparmor] AppArmor Child Profiles
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
Content-Type: multipart/mixed; boundary="===============7945266306901898425=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============7945266306901898425==
Content-Type: multipart/signed; boundary="nextPart4610242.2t0tuRMtVW"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4610242.2t0tuRMtVW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,

Am Dienstag, 13. August 2019, 14:21:13 CEST schrieb Abhishek Vijeev:
> In a scenario where 'parent_process' spawns (fork and exec) a number
> of child
> processes, we would like to achieve the following - if a profile
> exists for any child
> process, use it. Otherwise, don't inherit the parent's profile -
> instead, inherit a
> different default profile (presumably specified as a nested profile
> within the parent).

> Is there a way by which we could say this: for all children spawned by
> parent,
> check whether there exists a child profile (either a different profile
> in the
> file system, or a nested child profile) and if so use it, else use
> profile 'child_default'?

You can do that by using globs, which are "less specific" and only get 
used if there is no exact match.

profile parent {
    /bin/foo Cx,
    /bin/bar Cx,
    /bin/baz Cx,

    profile foo /bin/foo {
    }

    profile default /bin/* {   # or   profile default /**
        # gets used for /bin/bar and /bin/baz, but not for /bin/foo
    }
}

You can also use wildcards in the Cx rules if you want to allow to 
execute everything in /bin/. In this case, replace all Cx rules in my 
example with   /bin/* Cx,   - the specific child profile for /bin/foo 
will still be used.


Regards,

Christian Boltz
-- 
Oh, you mean hardware. You still own a real HW these days :P?
[Jiri Slaby in opensuse-factory]

--nextPart4610242.2t0tuRMtVW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcMqgYN4EKq6xsVGWxqaC6mPILxwFAl1ZJ3cACgkQxqaC6mPI
Lxws6RAAkfL6yZf2Fhcunudv17Ijph+OE7Gal8SLsjzoXDhCBi8tSOccQE0o40PM
Eq48gfej0tYHY65ZNyY0WXq/w3/2IIKyZpxsforMnHk/CK9+9dDZ+LRfCfsjUYr7
7n23RLCV140Don+Ut5oBzE17R0pzMf58mevbPcy/G8RKogLrf2dmsOixd62hOC9U
5A8ct7IzVWMEX2LQwp7l8oodRQ9PtDgr0ex2dVLIZmYpEQPUM819Yt1oiTJBzk1J
VJ3NzCKFDtyeX7ERlRK/09/uLcmyVd8PJ2mEdhEXdaOguwKz/AQvjS2Fux2ifWId
VkozYW/7497h/ZKKLUFTl8yJpJd4KPNZwwp/r6s1Fm1fdIF92QH8ejr0WarNiL8c
mrRBo1q3YroWJN+DbABGIq1e7fuE9B8KYiMttOaBO7Qh6A/4oo4WyTTvK8Bi/kuT
aQvYw4uWLpKFkgc3yBBRWIJupO27WB2OIC1rs7g2llr3G2i5znr3TfBUYVlMvkqr
EJHH4hLvd/q3IaFUx9/AuVN/Gv5zoEeIRTNUYGIJdT+RfRIKLE/p3JbI8D93/kvc
EtA09tzDzycWY+C3NWzQvZog05IBL5U9wF7fhvbNReZNR4+wNGfvjpqUPi0wd6Q5
W/WnfQQryOVeViK1wAR9gOYtaCOPcqAJreDfQNvrk5LTkYUExgQ=
=vMPR
-----END PGP SIGNATURE-----

--nextPart4610242.2t0tuRMtVW--





--===============7945266306901898425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7945266306901898425==--




