Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F8E9709
	for <lists+apparmor@lfdr.de>; Wed, 30 Oct 2019 08:08:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iPi67-0007oA-Nd; Wed, 30 Oct 2019 07:08:51 +0000
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <wampir990@gmail.com>) id 1iPi65-0007o4-KV
 for apparmor@lists.ubuntu.com; Wed, 30 Oct 2019 07:08:49 +0000
Received: by mail-lf1-f66.google.com with SMTP id j5so686791lfh.10
 for <apparmor@lists.ubuntu.com>; Wed, 30 Oct 2019 00:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:openpgp:message-id:date:mime-version
 :in-reply-to; bh=t1IpOeBI0iaJggfti8mHlVR80K7G+G/122AHDJl0FZk=;
 b=GMVVODlR6THR5wGtR2227QchDKqpeLwcQDSIk61SacfQI+DtJUzJVHTtsb2Pb06DdA
 2NCz5BMI1wj3sGJbuvC/0MdB41T9N4sdQIfyzblqDLVmKsYk3uyLvujG7xbrnSbmgFyP
 VvahmC55Dm36+Sur+qiiOZz9g1XJfmuFAZ8fBGrkVGOZN0oAm/YfuRi8n+Na5ud9L/Fc
 2saxmE1F/LHVokwPhXATvir7YFKIbClR/RdIeODHCt1kzwqU8cn+NlyqhIy14gEUT249
 GzI6xKvyTKhg/xkZccs8KtoB0+TfRK7Wn/wWR8fVa2NGgU8bqzRviIAG9ACueWPKQN1A
 yxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:mime-version:in-reply-to;
 bh=t1IpOeBI0iaJggfti8mHlVR80K7G+G/122AHDJl0FZk=;
 b=XaMvNzy82qyZCDtId5Ske2NHas8R3NZ6Ve1stNRa85HXrEXvbmysbcSi4FzRQ52XVw
 5/YC7shNF+TpbpYrIGn/Nvbs/WIqsekQR9O0swnaMlkWB1NvS5YBloidTyYMeXrA/TIG
 5wnyCa9CPjA8SJOhb2+4I84nUfCqn7BvzvgX808NVraYNVcl8PGuTjYSXL+edbpw37ed
 hqbsKrIRxyNxgd7UZLh3dei/jHzywlDacEom5WkVhPKgn9FUcsyFAAfISC1SlODEaOH7
 9PBvsXORNP7wYc3fdPJ+Xg4HfKcRL2IjHErsnzPsC0QdUnm8Ksq+Yjp5szhe9UJBeYGs
 DyPQ==
X-Gm-Message-State: APjAAAWXsCYeONJkTiyXwiIAT7v14pmEE4Ub9JdOR9Djs0R0Fj2Apa9n
 tonOXK5HlWlqGGXAsXI6L5Km5lfl
X-Google-Smtp-Source: APXvYqw2P25sEIYG/si4QXcguSn5PpcuvElwA8vjH2UXDdx2bzbef2G9GOVm7W3jGOrLJIwLj7XBcA==
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr5094711lfi.24.1572419328679; 
 Wed, 30 Oct 2019 00:08:48 -0700 (PDT)
Received: from mail.wampir.eu ([2002:589c:6791:0:399b:da40:b68a:eea3])
 by smtp.gmail.com with ESMTPSA id b28sm616528ljp.9.2019.10.30.00.08.46
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Oct 2019 00:08:47 -0700 (PDT)
Received: by mail.wampir.eu (Postfix, from userid 990)
 id D9F43A598; Wed, 30 Oct 2019 07:08:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin
X-Spam-Status: No
X-Spam-Score: 1.2  required: 5.0
Authentication-Results: mail.wampir.eu; dkim=none; dkim-atps=neutral
To: apparmor <apparmor@lists.ubuntu.com>
References: <3af23e54-c7fc-e35a-717f-03a3a376d50b@gmail.com>
 <2163705.lk1CSWkQ7O@tux.boltz.de.vu>
 <ae3e5dd7-5ac3-2a4c-e938-b8920e725d6a@gmail.com>
 <6369836.ZBJUOshDE2@tux.boltz.de.vu>
From: Jacek <wampir990@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <2a10b83e-ca79-8b90-8760-35200875b454@gmail.com>
Date: Wed, 30 Oct 2019 08:08:45 +0100
MIME-Version: 1.0
In-Reply-To: <6369836.ZBJUOshDE2@tux.boltz.de.vu>
Subject: Re: [apparmor] AA-logprof error
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
Content-Type: multipart/mixed; boundary="===============4448787635118895627=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4448787635118895627==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="LqPxm6J9A1P5OFmE8S0epOW6iQVKzz4vt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LqPxm6J9A1P5OFmE8S0epOW6iQVKzz4vt
Content-Type: multipart/mixed; boundary="xScyiG7uDUeWTJ3yyYfDo3Jp9oNusvaHK";
 protected-headers="v1"
From: Jacek <wampir990@gmail.com>
To: apparmor <apparmor@lists.ubuntu.com.>
Message-ID: <2a10b83e-ca79-8b90-8760-35200875b454@gmail.com>
Subject: Re: [apparmor] AA-logprof error
References: <3af23e54-c7fc-e35a-717f-03a3a376d50b@gmail.com>
 <2163705.lk1CSWkQ7O@tux.boltz.de.vu>
 <ae3e5dd7-5ac3-2a4c-e938-b8920e725d6a@gmail.com>
 <6369836.ZBJUOshDE2@tux.boltz.de.vu>
In-Reply-To: <6369836.ZBJUOshDE2@tux.boltz.de.vu>

--xScyiG7uDUeWTJ3yyYfDo3Jp9oNusvaHK
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello

Log from command aa-logprof -f /var/log/apparmor.log:

https://pastebin.com/raw/1887Semy


Original log from apparmor (from dmesg - command:=A0 dmesg | grep DENIED
>/var/log/apparmor.log ):

https://pastebin.com/raw/fcF37xtj

Cheers
Jacek

W dniu 29.10.2019 o=A014:33, Christian Boltz pisze:
> Hello,
>
> Am Dienstag, 29. Oktober 2019, 06:29:49 CET schrieb Jacek:
>> sys-apps/apparmor-utils-2.13.3
> I had some hope that 2.13.3 has this already fixed ;-)
>
> This makes my remaining question more important - can you please provid=
e=20
> the log messages that trigger this bug?
>
>     grep chrome /var/log/audit/audit.log | grep trace
>
> Note that the log filename might differ - if you don't have auditd=20
> running, it could also be /var/log/messages or /var/log/syslog. (To mak=
e=20
> things easier - aa-logprof prints the logfile it uses on startup.)
>
>
>>>> /usr/lib64/python3.6/site-packages/apparmor/rule/__init__.py in
>>>> is_covered(self=3D<PtraceRule> ptrace read
>>>> peer=3D/opt/google/\*/chrome,,
>>>> other_rule=3D<PtraceRule> ptrace read peer=3Dchrome,,
>>>> check_allow_deny=3DFalse, check_audit=3DFalse)
>
>
> Regards,
>
> Christian Boltz


--xScyiG7uDUeWTJ3yyYfDo3Jp9oNusvaHK--

--LqPxm6J9A1P5OFmE8S0epOW6iQVKzz4vt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEsq/Hyleni+6nqiBAOu067AdQmvEFAl25Nv0ACgkQOu067AdQ
mvHu/w/+KipAaYqunQJGqebrvmPWfpuSGtBT0vWziydWOgexAw+0F7pKJgZO2HaA
MYvdsMAEaxVOwwRfYREUTM4MH0iiGG+vgL4zkH8P27gKWTblBIS8D9SS1JBOy4BR
iKuen0qtoeI5j3tEsfLCvSZoJAKr/mKRuitjipRU5g2ByZbQab4Iws1i0NGe38dD
NSHJlqTVzuHk8yjKXGKzfrgeCx4Nj91lmbCsJ5Q7v319ZxRF8TVTVBXXZl3g/bKo
aZ0z7DhzVMgnzcdV+MCVdVxYICR2yONVk/Q/UDfHgZvfLEfJZoSBVv+ZmtrnAl7T
ysWcDn+ChEZLb7On64EEtQTNP7h4eUzELmwdNa0yQ55inna1En8stIp2p9NLoRvx
v2HJ4m6MPfLwvAcYgtObn6iAqkr2JyiGSUG4+Z8PoUzBzujlVo2pbDolvi3dHCD8
sjLqWiXQbHoLW6He28Kxc5GUPfkJime7xvPXCdLGiW+Nyaw3pJ9+w1GjRmzgltNN
MKqydua91oK+WF1Wc5MVgv11FbjMHsE+b8cR1aA9ZAgQuimiy1H5Xul0fYxVXG1/
PKywkhXniVeTPsdDK/vp6taF6TbGIYMkfaHK+RtWuN3ho7VpKgUbyJ8Gy0rdWoFE
9SHvCLC/8o3YkTR3zn7M2pDKOh5KvcjkT3WfH3DLdZwM8MuVxLw=
=e2Ac
-----END PGP SIGNATURE-----

--LqPxm6J9A1P5OFmE8S0epOW6iQVKzz4vt--


--===============4448787635118895627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============4448787635118895627==--

