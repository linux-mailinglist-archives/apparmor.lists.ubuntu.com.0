Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 58860E5E05
	for <lists+apparmor@lfdr.de>; Sat, 26 Oct 2019 18:09:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iOOcp-0001mK-G9; Sat, 26 Oct 2019 16:09:11 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1iOOcn-0001m7-E8
 for apparmor@lists.ubuntu.com; Sat, 26 Oct 2019 16:09:09 +0000
Received: from static-50-53-33-191.bvtn.or.frontiernet.net ([50.53.33.191]
 helo=[192.168.192.153]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>)
 id 1iOOcn-0002u8-22; Sat, 26 Oct 2019 16:09:09 +0000
To: Mikhail Morfikov <mmorfikov@gmail.com>, apparmor@lists.ubuntu.com
References: <8fcb6087-4bc0-2956-c17e-8ca7d24767b1@gmail.com>
From: John Johansen <john.johansen@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=john.johansen@canonical.com; prefer-encrypt=mutual; keydata=
 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
Organization: Canonical
Message-ID: <7686320e-da36-add7-de0f-6fd5924c7873@canonical.com>
Date: Sat, 26 Oct 2019 09:08:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8fcb6087-4bc0-2956-c17e-8ca7d24767b1@gmail.com>
Subject: Re: [apparmor] Question about "too many specified profile
	transitions"
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
Content-Type: multipart/mixed; boundary="===============7338073571379967935=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7338073571379967935==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="tz60oV2qfMIdZ2lAeSlB7iNhRyeqU3Wqr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tz60oV2qfMIdZ2lAeSlB7iNhRyeqU3Wqr
Content-Type: multipart/mixed; boundary="xxHKjAgTEpMxSHSKUlW2NGMKcnU5YQocI";
 protected-headers="v1"
From: John Johansen <john.johansen@canonical.com>
To: Mikhail Morfikov <mmorfikov@gmail.com>, apparmor@lists.ubuntu.com
Message-ID: <7686320e-da36-add7-de0f-6fd5924c7873@canonical.com>
Subject: Re: Question about "too many specified profile transitions"
References: <8fcb6087-4bc0-2956-c17e-8ca7d24767b1@gmail.com>
In-Reply-To: <8fcb6087-4bc0-2956-c17e-8ca7d24767b1@gmail.com>

--xxHKjAgTEpMxSHSKUlW2NGMKcnU5YQocI
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 10/14/19 8:57 PM, Mikhail Morfikov wrote:
> Should the rules in the following test profile count as a profile trans=
itions?
>=20
yes those are all unique profile transitions.

> profile test /bin/test {
>   /file1 rwl -> /some-file1,
>   /file2 rwl -> /some-file2,
>   /file3 rwl -> /some-file3,
>   /file4 rwl -> /some-file4,
>   /file5 rwl -> /some-file5,
>   /file6 rwl -> /some-file6,
>   /file7 rwl -> /some-file7,
>   /file8 rwl -> /some-file8,
>   /file9 rwl -> /some-file9,
>   /file10 rwl -> /some-file10,
>   /file11 rwl -> /some-file11,
>   /file12 rwl -> /some-file12,
>   /file13 rwl -> /some-file13,
> }
>=20
> When I try to load this profile, I get:
>=20
>   # apparmor_parser -r test-profile
>   Profile test has too many specified profile transitions.
>=20

Unfortunately apparmor only supports 12 of this style of transition in a
profile atm. There are 2 patch sets in the works to help address this. A
smaller patch that can be backported to older kernels, and userspaces. It=

will raise the limit to 28 of this style of transition in a profile.

There is also a larger rework of how the permission set is stored and
accessed in apparmor, that will effectively remove the limit, allowing
for a few billion transitions if your computer can support it. But that
is a much larger patchset and will require a newer release of apparmor.





--xxHKjAgTEpMxSHSKUlW2NGMKcnU5YQocI--

--tz60oV2qfMIdZ2lAeSlB7iNhRyeqU3Wqr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE7cSDD705q2rFEEf7BS82cBjVw9gFAl20b6MACgkQBS82cBjV
w9go1xAAsiGDO4V5unNMyAYc8oYwYAC0V0G4vCurPrptBdE8714sTZt3cWN8t1YB
qVs/3I6om8bk4+WAhW/Y8tTEa6FHSezP22t0LC+ceySQZ04n2OUihWw/G1WVobCj
4507gVjdm18KGELbJFwTgesrHaTWVns6VvMjNcBlSKD8PDx8MDcZomxr3FBerdFE
+IvXf0p4LRy6Xp/9SS+0RUpENUxmgRtbdSglHxIFXyeVpY+0zoFytosm8EatdEVU
YX6bzIMhQt5P8i05yE/r92w+DvtXgCCixvFQ6KVLZ0bUyg5YcV2yeFqLMnfC+5Y3
BGWKACbgdWG0GafckuX0/AlYKXszymVr6jiF55oH9ZW5jz73e3dIvNFQvNJthm5e
GGQhOY5eq4qZzX24VMRQSD2ExcUc7RnGbqm06uEzOMVTYbwwERPQO2AyZ+KInE9z
QFCaEZZ0tBx+HwpEixxhY31sq/dKansJeHLLrgWtK0cg9kbOZBoz5+xoAWOe2wmJ
bU2uW1HrbP+VvZ33tEQ9Zcet3pGblnFFB1B4rlSuz3XiFVpqnkNO9eeleFZXCvha
8BF1vbXRbTrvTlwGoMRfSJ9skPwLXrkHwrc6PsrJlKUL77Aucmk2xhN7hYKccJQr
R1El73d14ZlP+8dt7FW6dZ5MtM4XatUJ68ljarKoZKuy8dMcHtg=
=dm7x
-----END PGP SIGNATURE-----

--tz60oV2qfMIdZ2lAeSlB7iNhRyeqU3Wqr--


--===============7338073571379967935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7338073571379967935==--

