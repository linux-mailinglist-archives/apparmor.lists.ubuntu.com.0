Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C44A4D5A0
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 09:03:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpNFF-0000Jq-P1; Tue, 04 Mar 2025 08:03:17 +0000
Received: from maynard.decadent.org.uk ([65.21.191.19])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ben@decadent.org.uk>)
 id 1tonFB-0001wq-0Z
 for apparmor@lists.ubuntu.com; Sun, 02 Mar 2025 17:36:49 +0000
Received: from [2a02:578:851f:1502:391e:c5f5:10e2:b9a3] (helo=deadeye)
 by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <ben@decadent.org.uk>)
 id 1tonF5-007SoF-2M; Sun, 02 Mar 2025 17:36:42 +0000
Received: from ben by deadeye with local (Exim 4.98)
 (envelope-from <ben@decadent.org.uk>) id 1tonF3-00000003rL6-12qI;
 Sun, 02 Mar 2025 18:36:41 +0100
Message-ID: <7286c87d1ad7b705d123f23ad213ec40a9f23351.camel@decadent.org.uk>
From: Ben Hutchings <ben@decadent.org.uk>
To: John Johansen <john.johansen@canonical.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, cve@kernel.org
Date: Sun, 02 Mar 2025 18:36:35 +0100
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Z2ofoIoxQj9X1BsaAHHv"
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a02:578:851f:1502:391e:c5f5:10e2:b9a3
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
Received-SPF: pass client-ip=65.21.191.19; envelope-from=ben@decadent.org.uk;
 helo=maynard.decadent.org.uk
X-Mailman-Approved-At: Tue, 04 Mar 2025 08:03:16 +0000
Subject: [apparmor] CVE-2024-56741: apparmor: test: Fix memory leak for
 aa_unpack_strdup()
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
Cc: apparmor@lists.ubuntu.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--=-Z2ofoIoxQj9X1BsaAHHv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

CVE-2024-56741 is supposed to be fixed by commit 7290f5923191 "apparmor:
test: Fix memory leak for aa_unpack_strdup()"=C2=A0but I think this
assignment should be rejected.

While a user-triggered memory leak may be exploitable for denial-of-
service, the code that was fixed here is a part of KUnit tests.
KUnit tests usually run a single time at boot, not under user control,
and can then later be invoked through debugfs by the root user.

Firstly, it is intended that the root user can deny service through the
reboot system call, so I don't think additional ways to do this are
security flaws.

Secondly, the KUnit documentation at <https://docs.kernel.org/dev-
tools/kunit/run_manual.html> says:

    Note:

    KUnit is not designed for use in a production system. It is possible
=C2=A0   that tests may reduce the stability or security of the system.

so I don't think security issues in KUnit tests generally deserve CVE
IDs.  (That said, the help text for CONFIG_KUNIT does not have such a
warning.)

Ben.

--=20
Ben Hutchings
Any smoothly functioning technology is indistinguishable
from a rigged demo.


--=-Z2ofoIoxQj9X1BsaAHHv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmfElyQACgkQ57/I7JWG
EQnXoQ//Utms7NmGWZ5h2MUx5gI1gYg65pGmAs7q4RNtBsRw0RASrQtmIRKZx4Wg
kc4nlmB5Vl1xnigli8ukg+OjgpXJVgmtoL5Q74Ed6ru5BpNx+jHrHBVPt/3YSCoc
miObFDjPBdlbJ9W93R4FrK4guJIYo1mgjxXRm64cMt+c+cjN5KlVEXsxEPM08JHK
T0TsBzoTM2r6gmx7jfqckAExdg5ZuwmgUsOqfrpwHtkd7GmgVcT/B2Em/1ojkgn3
K5ZsEFuyAMDIK2qfeFZx+O98yPf5zW75yjffemerOZE/+rzteSaDpFA/4JXll9q4
DniGs+xfz0K4nrg+yEwVp6jEkaNss5zAEEPvo05H9vsB3jnbg+dloflX6ufJRLFy
8jYVTDduc4Q+tTqci21ws2Sj9pVJDTUxvQWS4shQZbnA2keaCz3yaiCOUdYI4/js
Jcl0LFa2UVzCBTNGzYzMaUVkqEeIwe3WINBI95JrsjsyDC2lbOFNs/AD3NHPpERm
db2jdFy0Wc6J8q/m+G7OCs6K+9HrEO850G/QgCS3Bpx8yMIxh8DViXDmHLLtWjtk
jjmHc0RKo67bySGySf3YkD9rwVnmoapGGBkd4HMcOBwiMpPaQcsJDVRjqcfipigl
DC9rHF9FTeTE1/jjMs9WYcS92TSKwevJrUzvJW0QGUpAPDSViu8=
=gStR
-----END PGP SIGNATURE-----

--=-Z2ofoIoxQj9X1BsaAHHv--

