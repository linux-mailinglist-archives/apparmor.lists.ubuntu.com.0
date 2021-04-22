Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 644C93676BF
	for <lists+apparmor@lfdr.de>; Thu, 22 Apr 2021 03:25:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lZO5t-0006Jg-Qi; Thu, 22 Apr 2021 01:25:25 +0000
Received: from sonic313-22.consmr.mail.ir2.yahoo.com ([77.238.179.189])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <moocan2112@yahoo.fr>) id 1lZO5s-0006Ja-AP
 for AppArmor@lists.ubuntu.com; Thu, 22 Apr 2021 01:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s2048;
 t=1619054723; bh=PMSRBP1SSHzvVs7m+onrozVoKjVPAgssq/SPkLgBGQI=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=XgGcEO4z4QXMXt6vhIUTHDxqx4JF5fajgzbiVK2Pb8p6JNgYF3tnIuCW0jW0RBRVwfOo9st9vp4ZL/izVbml69Rauq/y185o7VH6J8Y5n61ZKuvflBjGAReZGrckD2UBYGETXSejaMY5ThXFfQiHvdOXrZTPrxzlFdswMrDhlsn2xMKpwZIT3YnXcnN8IszBbIotIS4lPAkidhhVVEdUe/Ym2f/6dEAjkiIWXMfC6ohIq0AnGbAgoTEygHiROkgJ0WxwmnT7X9jwpyJC1S+FNaJg1po3chPV9HpLTe/YpITGvmk/5vBIsaBBuZxhGkHX6+vDtv2xUeb8B6vglqcJ7A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619054723; bh=sF0w/sULSULLDGRCeLsbsRHY5TtiUTgAGMfxRWeL2fh=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=CctRDQREWsexo7xm4y3AP1FDdS4xfZX5KGH5YGi1QjCIx/CxF25Z4gpazPwjGLz4YlyoZXf7knV1csGeTEJ48+t7YHMnSp7SY6kVsvKW3R4hYjFPBWMgkq1Mj8kQBrAG0kBvNdraMGkFZg6HiPI5yS0ikhypnFOc/VSZ3OLnxYRIn60YgXJTO3bkYZYrcd19H6GrVTF+MRKdrpAE7ptghSsjxfaxiO71wfmTM2E4XDOnjK8iU5GFn0rUHvI5zVmE/GpYwMDhCJ60N9y1elTPcv62fDWaFec+Hf4POEgvQznniDo1iDqSj3BCtn8fep02752ev8Lb+CXgvBcrLBj0UA==
X-YMail-OSG: 9VEDX10VM1leykrDwcUqU52N39zWv3nvFlUJKYdekravOj.9ZIaE1cp8Y3PCKae
 zly.m5x_cOPWsPw1.M0VvafuGh9wpl5Fac.fhAX0TDpKtyqzcSeO_6F9Qr1IjmqFzY2YfHQItAdU
 4JuIZJBaDEUm4IzsqrbMtRW7AGwkwZrZMHGVpJvod9o5_DtvnydlCpK_pb7Ts0oxdFLNlP.koLiz
 pOkN8VNWHBJesYVY17lqmeq4sv7EiENK.blb.RsJyNk2vM.cN7J0xmMmd8_go27BfXJT86PIEmTR
 aPBaD4gqQKmbidsz6w42X11r4MtSLqZuFjiqKw2LzPEbK1JNDgAwIrNblQZeRQaRIDymgkACSSQ6
 Vwbl84jvcq5bVW3T5sk3aFDV_PCMUH9KFsCVACBTEuEtTYmzclBoOxHqZjiumicAwAB1vNR6s4F5
 aoQmU1cudojJuJZaPTeErjsh6qxaSz0c_6oOKLD7qP1UUKrY3l9G.iHTxJ_PLDzwi_6UIx11nUgn
 bs6RAtcd5oK0GHclHskQmV1z583mFjwLlHoksIvoblk1MmjqyiPYuRf7.bLy49m_eon1lQX90R_Y
 wDsr9HfXQ6lCbEbDzqztD68LMuaCY665hbyEIKdwUs6s5dMgENZR7ZNoLwzBVFIziMpmK2OHP8Mg
 BMQfcARBxYoGhKyOxydwISAQWZJuloXQH03gDeY_SG5jAmSB4JILbth7O6xvsSqlTPUTIbhvooFx
 cyNWZDRIhFScv9K9l5mibNrRh9Iz4Pfg03DO6GTA0CjPxQGuSdOwq8cP7pxQE4d1DNgvu8GlHy0Q
 DRwchWNYtiJI2JVge_no2aareH0PiKb64Ar9rQcFtGAKgOIEz7Pvh7vr_7e6rGPki.jSadNp620n
 OSjIBSqHmhpQEEnr7rV2O_vftkHrp3BEyHTZ58cGMBJVfDtkGBm5WSXy1Hvyft8xmADi_7vzqV7w
 1PQ3AQral9o9TUfWTqtp5c4QufT7WalxDhW.psXTRGQcnLcDDgSpTLbEOHFq0OcfHutt.t.u40cC
 cDtd29zJDb7meRxaM1vXsy9LjrJKu90qLoYTzm7NXVvn8EDTl6xDuMDRzbDCJ.led31SxKGDHGRZ
 WzmB0LXmK8keJMVmwbqf5th3GFz0J76NHQNTMyv4hSbNHF4k_6WcBy8widH64vMWpsyR5TY6YHYn
 IWzAPTmuGOTjv0ysuEa1IPNI4E1cL2MyYWpicN_GTcOB23qPBNOd7_8OMizgkwT3zX4a5x4rnBPZ
 p9RttqCBoulhrDJG5.Ts9Zt.IDNgwhMvEOowdhSGSaWKRTvzvYFoI0zLErad_To2UDn7acUXqjDJ
 ..rNS7tB6RhXsZH5tVv18LyMrhXqu78HbJ_RS0KqZmRJp0on1lu6fNPGRRY5MFV71E1.Lg.zA2Qp
 x4gAHxQMPnUJ897nu4DXM2o9il9iY3y6m2Z7yStMi7HF05yzu5rLRVxePFFfmW4vJ74aNm_jcuZf
 H_uMF5fANNi_iOpXs9V_Zz4WcJ5LnDLmcCEmXuSpzhaY8GJsFQu4h7OuXQL.Rh0vN5Q9mn4AQiox
 3ZvmHnjQ6ZLqaDyeTyl4bz8t9PGR_rgxqDxre0gptX.i9Gb8v8zcVr7C1vpmzQVfqDdK1Ha2Lgox
 LCq3IdxtNpohjbuIbbhK_cr8Q48mSZT._7RgYwEtfWNY_BCn4zD8YD86lxJlZy3KyoIcpky1kl_j
 _i.gUxjTxRMk.LUZ8x56GGMtdnfestRd.C8CjNHG5hikJgal7PFyfKiUH2GGWPrS4l4f8DJWnEJZ
 5o8YCTEOkZ2AVJYqGQ2E.qxnTXWjrJK_grcICOhPh6CUET_a1rErYvNQlIrELJObMCmOF3KbPTc8
 XR_6z.d2lsnQZbFdb48U.Eu8vX5O_EwTMwtgRH0vkEHbCVqBWEFEhAZeT0cBsZOHiBWXb03XNJ8P
 1Eag8pgIKvKgVMV1ZKg5RSDkwrjNvXDP2z516FOsLoEnpj9aF6.as9x0w_3vtwiO2MNG0qgXxVNl
 DnRAI8AAW3SbpF7jakXA9wg9ybBgM.IJuRy6.PLSOT5LNx2b3QAi56XeN3HwreAJNnrmmUgJNiu2
 jxY3XZfD9vlXeylhWq5N0910ZpVCQfO4T3q3PAyDDRr6b7Qs0odPgs3dF0uyfFYqCW7SG4tqB8ta
 a..PXGnBy2w9MxTOKJF39pH0FgK6tG0l_euJHynvaw7nQ9J0mSpTmhoC6U6iIrQ_S5aayIzKfJZi
 f96C8tMVAdzaSXG5b3WNRWCxek7fca4PWgq3eKs8ukIW8D2zxPgFGJiNWkNkfwd1dK9waBPNKq9d
 fqB.iv8DH7LBmPj6wUaOZMe8.dFkoKjBzpXLJB.jv5wn7DjfbiOQP5Aqj3azeGggSAdpQCmegjlu
 _NfpOufpAW9aBJYf9l.Fy_LABsediHw--
X-Sonic-MF: <moocan2112@yahoo.fr>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ir2.yahoo.com with HTTP; Thu, 22 Apr 2021 01:25:23 +0000
Date: Thu, 22 Apr 2021 01:23:40 +0000 (UTC)
From: Hans Gruber <moocan2112@yahoo.fr>
To: "AppArmor@lists.ubuntu.com" <AppArmor@lists.ubuntu.com>
Message-ID: <105423785.7781397.1619054620734@mail.yahoo.com>
MIME-Version: 1.0
References: <105423785.7781397.1619054620734.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.18121 YMailNorrin Mozilla/5.0 (X11; Linux x86_64;
 rv:86.0) Gecko/20100101 Firefox/86.0
Subject: [apparmor] Apparmor Link rules
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
Content-Type: multipart/mixed; boundary="===============8049878465950867211=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8049878465950867211==
Content-Type: multipart/alternative; 
	boundary="----=_Part_7781396_339171866.1619054620733"
Content-Length: 4539

------=_Part_7781396_339171866.1619054620733
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,
I'm trying to secure and restrict access of a bash script which need to perform actions on a symlink (update timestamp and create it if missing).
Is it possible to use an AppArmor Link Rules for a symbolic link or is it only for hard link ?
I don't find information about symbolic link.
According to AppArmor Core Policy Reference at https://gitlab.com/apparmor/apparmor/-/wikis/AppArmor_Core_Policy_Reference only hard link is specified. 
Bash script use ln which requires two rules/path/symlink rw,/path/[A-Za-Z0-9][A-Za-Z0-9][A-Za-Z0-9][A-Za-Z0-9][A-Za-Z0-9][A-Za-Z0-9][A-Za-Z0-9][A-Za-Z0-9] rw,

The second one is required because ln create a temporary file as /path/CgX8vf6d and it names
changes each time. Without this rule ln fail and audit record denied access for /path/CgX8vf6d in creation.But I don't like this rule because it opens potential access to all files in /path in rw which is a sensitive folder. 
I would like to know if it's possible to use a link rule to avoid the second one which require rw for read and creation.

I tried using a link rule but it never worked but it could be misuse by myself.
Thank you in advance.
Regards





------=_Part_7781396_339171866.1619054620733
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div dir=
=3D"ltr" data-setdir=3D"false">Hello,</div><div dir=3D"ltr" data-setdir=3D"=
false"><br></div><div dir=3D"ltr" data-setdir=3D"false">I'm trying to secur=
e and restrict access of a bash script which need to perform actions on a s=
ymlink (update timestamp and create it if missing).</div><div dir=3D"ltr" d=
ata-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Is it=
 possible to use an AppArmor Link Rules for a symbolic link or is it only f=
or hard link ?<br></div><div dir=3D"ltr" data-setdir=3D"false">I don't find=
 information about symbolic link.</div><div dir=3D"ltr" data-setdir=3D"fals=
e"><br></div><div dir=3D"ltr" data-setdir=3D"false">According to AppArmor C=
ore Policy Reference at <a href=3D"https://gitlab.com/apparmor/apparmor/-/w=
ikis/AppArmor_Core_Policy_Reference" rel=3D"nofollow" target=3D"_blank">htt=
ps://gitlab.com/apparmor/apparmor/-/wikis/AppArmor_Core_Policy_Reference</a=
> only hard link is specified. </div><div dir=3D"ltr" data-setdir=3D"false"=
><br></div><div dir=3D"ltr" data-setdir=3D"false">Bash script use ln which =
requires two rules</div><div dir=3D"ltr" data-setdir=3D"false">/path/symlin=
k rw,</div><div dir=3D"ltr" data-setdir=3D"false">/path/[A-Za-Z0-9][A-Za-Z0=
-9][A-Za-Z0-9][A-Za-Z0-9][A-Za-Z0-9][A-Za-Z0-9][A-Za-Z0-9][A-Za-Z0-9] rw,<b=
r></div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" d=
ata-setdir=3D"false">The second one is required because ln create a tempora=
ry file as /path/CgX8vf6d and it names<br></div><div dir=3D"ltr" data-setdi=
r=3D"false">changes each time. Without this rule ln fail and audit record d=
enied access for /path/CgX8vf6d in creation.</div><div dir=3D"ltr" data-set=
dir=3D"false"><span class=3D"VIiyi" lang=3D"en"><span class=3D"JLqJ4b ChMk0=
b" data-language-for-alternatives=3D"en" data-language-to-translate-into=3D=
"fr" data-phrase-index=3D"0"><span>But I don't like this rule because it op=
ens potential access to all files in /path in rw which is a sensitive folde=
r.</span></span></span>  </div><div dir=3D"ltr" data-setdir=3D"false"><br><=
/div><div dir=3D"ltr" data-setdir=3D"false">I would like to know if it's po=
ssible to use a link rule to avoid the second one which require rw for read=
 and creation.<br></div><div dir=3D"ltr" data-setdir=3D"false"><br></div><d=
iv dir=3D"ltr" data-setdir=3D"false">I tried using a link rule but it never=
 worked but it could be misuse by myself.</div><div dir=3D"ltr" data-setdir=
=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Thank you in ad=
vance.</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"lt=
r" data-setdir=3D"false">Regards</div><div dir=3D"ltr" data-setdir=3D"false=
"><br></div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"lt=
r" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false"><=
br></div><div dir=3D"ltr" data-setdir=3D"false"><br></div></div></body></ht=
ml>
------=_Part_7781396_339171866.1619054620733--


--===============8049878465950867211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8049878465950867211==--

