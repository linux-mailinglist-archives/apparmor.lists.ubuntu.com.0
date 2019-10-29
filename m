Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D7AE7FBA
	for <lists+apparmor@lfdr.de>; Tue, 29 Oct 2019 06:30:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iPK4p-0001y4-AO; Tue, 29 Oct 2019 05:29:55 +0000
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <wampir990@gmail.com>) id 1iPK4n-0001xy-2x
 for apparmor@lists.ubuntu.com; Tue, 29 Oct 2019 05:29:53 +0000
Received: by mail-lf1-f67.google.com with SMTP id z12so9527841lfj.9
 for <apparmor@lists.ubuntu.com>; Mon, 28 Oct 2019 22:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:references:openpgp:message-id:date:mime-version
 :in-reply-to; bh=YbWrb4Kmamu9eVpcj+EHb32tJkcEOwthrBOjx5yQLqk=;
 b=jp/Zd7bQXRzjB4h+1Qo3PWn1IxRbDqOGWmZXdS1AyqTfDj+mKiqe26GoYhfliFIJjO
 Hw3wt8qp8aWo4cpH23BscMy48c5LN0IQaHpkOTaZxxow/HSFCAfTEEfRcpG42Z90bbQB
 dOoedP2fu0u46EBNxYQBnHt+JMYM25ZmyPCYlbaghHepcwoMwXsFs5wlXIRnhx7zktJt
 /M31ryvFfDLIDcIUF307pSX+ZkGWhYFlFIo0scRqCsDIErTlm16w/pubSs3MC7wxHW2E
 SXIXpJknCJTiKaTiw8wNiJuidChWhDeXYa+JKW/EfWau5Ya0TObYna8/NkQgvL07ZEGQ
 DYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:openpgp:message-id
 :date:mime-version:in-reply-to;
 bh=YbWrb4Kmamu9eVpcj+EHb32tJkcEOwthrBOjx5yQLqk=;
 b=AK7KxQ3bGUHtpaHwHFe/8lAyzQ20jh5Ub8voZIW++XzEDy88GuAOGUUiapf7fVzbQ1
 70z2DPqOlCXxOt4cgMu/Ycuhz574/z9MbYRnphUNI+ZzVpu1OQAHLX78XDS0T2wJGPlf
 25iXK36/voV0E1RLslzs6xv+RBm5ZnGhasA1+MANdROhXGy8OX08hU3rtIwZ0yguqMjI
 wqGVfwhd2neQi8Ka9TJ9fUvQSC2X59SSanb5fOapp0WinZu+T+Nj4DjGQoH5Yw48OkhF
 lHH10RXOMrLnkjD6nW0Yu6J4CJFcCgl963/UFF9nFU4WbJth/jvEdX9PbFhujJIqgonv
 V3uQ==
X-Gm-Message-State: APjAAAUAHJBfJ/R4b9RXso+C5NdtGFp/p0WNLNas4JeiFqBIAKD5LKQu
 WYzzLoHVJixjEzLLxMft92D0cK8B
X-Google-Smtp-Source: APXvYqzWB4ZL4TXPNNGc4oMs3FPHkf9+4us6Q+p0obRaLrGc6GTCOOqdXLM0VpySZFAKsctRXdg4eQ==
X-Received: by 2002:ac2:5109:: with SMTP id q9mr903169lfb.145.1572326992128;
 Mon, 28 Oct 2019 22:29:52 -0700 (PDT)
Received: from mail.wampir.eu ([2002:589c:6791:0:69e8:36b0:e4cf:52cc])
 by smtp.gmail.com with ESMTPSA id v203sm7724414lfa.25.2019.10.28.22.29.51
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 22:29:51 -0700 (PDT)
Received: by mail.wampir.eu (Postfix, from userid 990)
 id E10CDC481; Tue, 29 Oct 2019 05:29:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin
X-Spam-Status: No
X-Spam-Score: 1.2  required: 5.0
From: Jacek <wampir990@gmail.com>
Authentication-Results: mail.wampir.eu; dkim=none; dkim-atps=neutral
To: apparmor@lists.ubuntu.com
References: <3af23e54-c7fc-e35a-717f-03a3a376d50b@gmail.com>
 <2163705.lk1CSWkQ7O@tux.boltz.de.vu>
Openpgp: preference=signencrypt
Message-ID: <ae3e5dd7-5ac3-2a4c-e938-b8920e725d6a@gmail.com>
Date: Tue, 29 Oct 2019 06:29:49 +0100
MIME-Version: 1.0
In-Reply-To: <2163705.lk1CSWkQ7O@tux.boltz.de.vu>
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
Content-Type: multipart/mixed; boundary="===============3584154017958582642=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3584154017958582642==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="eBHn287qL7IfBudglERqPUNdyt0ShR97x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eBHn287qL7IfBudglERqPUNdyt0ShR97x
Content-Type: multipart/mixed; boundary="Fx0A0A5t5i0I1gQLlKsac0WVtgNjNFVLR";
 protected-headers="v1"
From: Jacek <wampir990@gmail.com>
To: apparmor@lists.ubuntu.com
Message-ID: <ae3e5dd7-5ac3-2a4c-e938-b8920e725d6a@gmail.com>
Subject: Re: [apparmor] AA-logprof error
References: <3af23e54-c7fc-e35a-717f-03a3a376d50b@gmail.com>
 <2163705.lk1CSWkQ7O@tux.boltz.de.vu>
In-Reply-To: <2163705.lk1CSWkQ7O@tux.boltz.de.vu>

--Fx0A0A5t5i0I1gQLlKsac0WVtgNjNFVLR
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Gentoo Linux:

Linux version 5.3.7-g1 (root@localhost) (gcc version 8.3.0 (Gentoo
Hardened 8.3.0-r1 p1.1)) #1 SMP PREEMPT Fri Oct 18 23:58:37 CEST 2019


=A0Apparmor version:
sys-apps/apparmor-2.13.3
sys-apps/apparmor-utils-2.13.3
sys-libs/libapparmor-2.13.3

Cheers

W dniu 28.10.2019 o=A018:37, Christian Boltz pisze:
> Hello,
>
> Am Montag, 28. Oktober 2019, 04:54:31 CET schrieb Jacek:
>> AA-logprof is not compatible with the apparmor-kernel API, which
>> causes errors with some log messages.
> I've seen a similar bugreport recently - looks like there's some "fun"
> with ptrace rules going on :-(
>
> Which AppArmor version do you use?
> Which distribution?
>
> Can you please provide the log lines that trigger this bug? You should
> get them with grep chrome /var/log/audit/audit.log | grep trace
> Note that the filename will differ depending on your distribution - if
> you don't have auditd running, it could also be /var/log/messages or
> /var/log/syslog. (To make things easier - aa-logprof prints the
> logfile it uses on startup.)
>
> Since this is most likely about the chrome profile, please also attach
> that profile.
>
>
> The most relevant lines from the crash report are:
>
>> error
>> Python 3.6.9: /usr/bin/python3.6
>> Mon Oct 28 04:46:06 2019
> [...]
>> /usr/lib64/python3.6/site-packages/apparmor/rule/__init__.py in
>> is_covered(self=3D<PtraceRule> ptrace read peer=3D/opt/google/\*/chrom=
e,,
>> other_rule=3D<PtraceRule> ptrace read peer=3Dchrome,,
>> check_allow_deny=3DFalse, check_audit=3DFalse)
>
>
> Regards,
>
> Christian Boltz





--Fx0A0A5t5i0I1gQLlKsac0WVtgNjNFVLR--

--eBHn287qL7IfBudglERqPUNdyt0ShR97x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEsq/Hyleni+6nqiBAOu067AdQmvEFAl23zk0ACgkQOu067AdQ
mvFn+RAAg6kDdiueOKPUtGcOvwYp6Bc04sLRkndRDpuJoawDU2sEvADeu5IF0nhm
jHz+GPTvC6aSxw1cojtXyOEDSKV92u6QeQkI0oy8XDH5V999BQIGBDdcw7UkZtjq
6TDccJf/g6eM6FWrHy/pvMqCNqnA2MnUH4V3Rf2qJo3mNu3ig4gHLsZ1WsZMvJvi
iqdV4IRwaE9zFszh3N1Mjpul6gdlpdBFkIV2dQfHQwjknKKcrUqvxyIV5tEFfSiV
Lct12r5c4bXV8IkAHjaH5xW+wRptR5Sgj3Dk8CUics0j8I5tConRtVzag6T8gayy
raPMFpxdvxwAhr7TeafWTAolWOSpNNgTEgcvVUAkMfw8fxSgfTR+Kek7ZW+73x+r
LYwFAtNjUIEi8f+XS9R4i3q99EeKg/u8W5YQr8FhCAAQbL6z7n9qYb3k61npAtqj
0toAqkwc54KiYRICcZbwHwKzZPQpgDUp/Y6rNwVgOd9gj+WtejSQSDxkqlx4D2IN
NZHepVmNTZmpxcRdMruUV2uccg6vSsbcPqn5Wtl52twMOgdQ8/GY4zySBlpYVyRN
vsNiP/q8DgV8jxjyc1Nmd3dVbyeaJyc6JiB9tJ/4pQWQlH8mtsTDMcWmYaf6lNzF
+ctenvLxB00Bw/cXWka+aa+PBTUY871jochTumTyU5dV3LLlf0M=
=TTvn
-----END PGP SIGNATURE-----

--eBHn287qL7IfBudglERqPUNdyt0ShR97x--


--===============3584154017958582642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3584154017958582642==--

