Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D0804A450E2
	for <lists+apparmor@lfdr.de>; Wed, 26 Feb 2025 00:22:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tn4Fd-0007GO-J6; Tue, 25 Feb 2025 23:22:09 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <hector.cao@canonical.com>)
 id 1tn4Fa-0007GG-Sz
 for apparmor@lists.ubuntu.com; Tue, 25 Feb 2025 23:22:06 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7EBE93F29B
 for <apparmor@lists.ubuntu.com>; Tue, 25 Feb 2025 23:22:06 +0000 (UTC)
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5df498f31ccso6687748a12.1
 for <apparmor@lists.ubuntu.com>; Tue, 25 Feb 2025 15:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740525726; x=1741130526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mH56kNNe/EtnWshhwgGRiaoCtATLxQu0A/HvikyGwRQ=;
 b=Q39V2nyr6LkpzbnQVQ/bPTgYk3uZ0MFt2BuTym7Pi5HqZTvtPMPKmRkvpwaYPMhfjr
 mOpCteEeDfLqFWou3xuLUVuiJ5u1pZms16GOJewcGXMD4iK4CeZTq3nnoyBqOBDCk76F
 567uqp55J+Rgmdx3NfZMY6NPXB+JD/Q8ws9KAnterYIN/UO2ZOD3ZWTX4SnEzIv4Gvzy
 CoLoK9fLBnZwA82seNKXsHujriaBm+FFBKb1mIPbNcncIT4bHWKijhYjBF5MgsMs88Lc
 qRZplUI0/wsf5CVZADBvv7ks0cb2vLcy8+o6Y6slwJgUs1l8mK2lL0QF3S6p94VoeT6v
 oIkw==
X-Gm-Message-State: AOJu0YwCR9/RJ3ys9ZxJvaEC/vfR10cOuNHamzplQfwk8zACtn3rMCfZ
 7Z7mEICR56OHo4EPHSogEb1uMAInypHXrw8Oae44+nPVrY9YlbhVG2NrFcIo5bgYgD7gI3uiB2j
 ftIqVcmx5fs4FC8d+lWhxYqs2WYq15Feetcw2rhKfiM67pc8oUzHvTvYkGdp+eyBpRmrglqZyF4
 QyxyQrSJJZqY7lECu30weFki6bRt1bTlGvU/T6/h27yqTRNoop
X-Gm-Gg: ASbGncvqe9gF0BBE/fam6RVLdTdOqShG2oL6ZAGkwCIpiW3SZY1/shGmDZ63kcGDt4Q
 yxK8qmSK8KIZFDLzHh1c9peWBdBCDAeDhQ87lGFh4vXd7VS3TT0R8vzh6C+DJ0dO2mgjL9qb+35
 i7hlI1F3D05t8Xha4D
X-Received: by 2002:a05:6402:5415:b0:5df:6de2:1e38 with SMTP id
 4fb4d7f45d1cf-5e0b70f3327mr16575285a12.17.1740525726024; 
 Tue, 25 Feb 2025 15:22:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8as/7awzsIIc0pwo3iWh1LNRG7inXGgqPcfBlCEt6cjpNqKPeqULSIWmD3/MsryVoBI+FRjay9pfkwA7w7oU=
X-Received: by 2002:a05:6402:5415:b0:5df:6de2:1e38 with SMTP id
 4fb4d7f45d1cf-5e0b70f3327mr16575265a12.17.1740525725525; Tue, 25 Feb 2025
 15:22:05 -0800 (PST)
MIME-Version: 1.0
References: <20250225090629.6741-1-hector.cao@canonical.com>
 <CAKCV-6tJRO=1Yp=9aAoaDFOUX=5zBX+wYRvkibt0TDpHi1mnUw@mail.gmail.com>
In-Reply-To: <CAKCV-6tJRO=1Yp=9aAoaDFOUX=5zBX+wYRvkibt0TDpHi1mnUw@mail.gmail.com>
From: Hector Cao <hector.cao@canonical.com>
Date: Wed, 26 Feb 2025 00:21:54 +0100
X-Gm-Features: AQ5f1JpbudLPKI89O1-StQNVmYJwmj_KTfYf5eBXNa0Zy32LIfcmXUx_2M6GfHI
Message-ID: <CABjvBV5B0ReSi4m-xS7WUXaja1A_zAaLVHJzqFtf+SoGv0rC0w@mail.gmail.com>
To: Ryan Lee <ryan.lee@canonical.com>
Content-Type: multipart/alternative; boundary="00000000000097be07062effb9c4"
Subject: Re: [apparmor] [PATCH] Add abstract profile for libnuma
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--00000000000097be07062effb9c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got it, thanks

On Wed, Feb 26, 2025 at 12:07=E2=80=AFAM Ryan Lee <ryan.lee@canonical.com> =
wrote:

> On Tue, Feb 25, 2025 at 1:06=E2=80=AFAM Hector Cao <hector.cao@canonical.=
com>
> wrote:
> >
> > For executables dynamically linked to libnuma, the runtimer linker
> > invokes libnuma functions (num_init) that try to access
> > /sys/devices/system/node/ and if the application's apparmor
> > profile does not allow this access, this access will be denied
> > by apparmor with following error message:
> >
> >   apparmor=3D"DENIED" operation=3D"open" class=3D"file"
> >   name=3D"/sys/devices/system/node/" comm=3D"qemu-bridge-hel"
> >   requested_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
> >
> > Here is the simplified call trace:
> >
> >   0 ... in ?? () from /lib/x86_64-linux-gnu/libnuma.so.1
> >   1 ... in call_init (...) at ./elf/dl-init.c:74
> >   2 ... in call_init (...) at ./elf/dl-init.c:120
> >   3 _dl_init (...) at ./elf/dl-init.c:121
> >   4 ... in _dl_start_user () from /lib64/ld-linux-x86-64.so.2
> >
> > This commit adds an abstract profile that applications that are
> > linked to libnuma can include in their apparmor profile.
> >
> > Signed-off-by: Hector Cao <hector.cao@canonical.com>
> > ---
> >  profiles/apparmor.d/abstractions/libnuma | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 profiles/apparmor.d/abstractions/libnuma
> >
> > diff --git a/profiles/apparmor.d/abstractions/libnuma
> b/profiles/apparmor.d/abstractions/libnuma
> > new file mode 100644
> > index 000000000..9126294c4
> > --- /dev/null
> > +++ b/profiles/apparmor.d/abstractions/libnuma
> > @@ -0,0 +1,19 @@
> > +# vim:syntax=3Dapparmor
> > +# ------------------------------------------------------------------
> > +#
> > +#    Copyright (C) 2025 Canonical Ltd.
> > +#
> > +#    This program is free software; you can redistribute it and/or
> > +#    modify it under the terms of version 2 of the GNU General Public
> > +#    License published by the Free Software Foundation.
> > +#
> > +# ------------------------------------------------------------------
> > +
> > +  abi <abi/4.0>,
> > +
> > +  # this abstract profile can be included by applications that are
> > +  # dynamically linked to libnuma
> > +  # libnuma defines the function num_init() as the .init function
> > +  # to be called by the runtime linker (ld) when libnuma is loaded
> > +
> > +  @{sys}/devices/system/cpu/node/ r,
>
> To allow local additions to the abstraction, please add "include if
> exists <abstractions/libnuma.d>" to the end of the abstraction. You
> can see examples of such include lines in e.g. the upstream
> abstractions/nameservice.
>
> > --
> > 2.45.2
> >
> >
>


--=20
Hector CAO
Software Engineer =E2=80=93 Partner Engineering Team
hector.cao@canonical.com
https://launc <https://launchpad.net/~hectorcao>hpad.net/~hectorcao
<https://launchpad.net/~hectorcao>

<https://launchpad.net/~hectorcao>

--00000000000097be07062effb9c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got it, thanks</div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26, 2025 a=
t 12:07=E2=80=AFAM Ryan Lee &lt;<a href=3D"mailto:ryan.lee@canonical.com">r=
yan.lee@canonical.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Tue, Feb 25, 2025 at 1:06=E2=80=AFAM Hector Cao &lt=
;<a href=3D"mailto:hector.cao@canonical.com" target=3D"_blank">hector.cao@c=
anonical.com</a>&gt; wrote:<br>
&gt;<br>
&gt; For executables dynamically linked to libnuma, the runtimer linker<br>
&gt; invokes libnuma functions (num_init) that try to access<br>
&gt; /sys/devices/system/node/ and if the application&#39;s apparmor<br>
&gt; profile does not allow this access, this access will be denied<br>
&gt; by apparmor with following error message:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0apparmor=3D&quot;DENIED&quot; operation=3D&quot;open&quot;=
 class=3D&quot;file&quot;<br>
&gt;=C2=A0 =C2=A0name=3D&quot;/sys/devices/system/node/&quot; comm=3D&quot;=
qemu-bridge-hel&quot;<br>
&gt;=C2=A0 =C2=A0requested_mask=3D&quot;r&quot; denied_mask=3D&quot;r&quot;=
 fsuid=3D1000 ouid=3D0<br>
&gt;<br>
&gt; Here is the simplified call trace:<br>
&gt;<br>
&gt;=C2=A0 =C2=A00 ... in ?? () from /lib/x86_64-linux-gnu/libnuma.so.1<br>
&gt;=C2=A0 =C2=A01 ... in call_init (...) at ./elf/dl-init.c:74<br>
&gt;=C2=A0 =C2=A02 ... in call_init (...) at ./elf/dl-init.c:120<br>
&gt;=C2=A0 =C2=A03 _dl_init (...) at ./elf/dl-init.c:121<br>
&gt;=C2=A0 =C2=A04 ... in _dl_start_user () from /lib64/ld-linux-x86-64.so.=
2<br>
&gt;<br>
&gt; This commit adds an abstract profile that applications that are<br>
&gt; linked to libnuma can include in their apparmor profile.<br>
&gt;<br>
&gt; Signed-off-by: Hector Cao &lt;<a href=3D"mailto:hector.cao@canonical.c=
om" target=3D"_blank">hector.cao@canonical.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 profiles/apparmor.d/abstractions/libnuma | 19 ++++++++++++++++++=
+<br>
&gt;=C2=A0 1 file changed, 19 insertions(+)<br>
&gt;=C2=A0 create mode 100644 profiles/apparmor.d/abstractions/libnuma<br>
&gt;<br>
&gt; diff --git a/profiles/apparmor.d/abstractions/libnuma b/profiles/appar=
mor.d/abstractions/libnuma<br>
&gt; new file mode 100644<br>
&gt; index 000000000..9126294c4<br>
&gt; --- /dev/null<br>
&gt; +++ b/profiles/apparmor.d/abstractions/libnuma<br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +# vim:syntax=3Dapparmor<br>
&gt; +# ------------------------------------------------------------------<=
br>
&gt; +#<br>
&gt; +#=C2=A0 =C2=A0 Copyright (C) 2025 Canonical Ltd.<br>
&gt; +#<br>
&gt; +#=C2=A0 =C2=A0 This program is free software; you can redistribute it=
 and/or<br>
&gt; +#=C2=A0 =C2=A0 modify it under the terms of version 2 of the GNU Gene=
ral Public<br>
&gt; +#=C2=A0 =C2=A0 License published by the Free Software Foundation.<br>
&gt; +#<br>
&gt; +# ------------------------------------------------------------------<=
br>
&gt; +<br>
&gt; +=C2=A0 abi &lt;abi/4.0&gt;,<br>
&gt; +<br>
&gt; +=C2=A0 # this abstract profile can be included by applications that a=
re<br>
&gt; +=C2=A0 # dynamically linked to libnuma<br>
&gt; +=C2=A0 # libnuma defines the function num_init() as the .init functio=
n<br>
&gt; +=C2=A0 # to be called by the runtime linker (ld) when libnuma is load=
ed<br>
&gt; +<br>
&gt; +=C2=A0 @{sys}/devices/system/cpu/node/ r,<br>
<br>
To allow local additions to the abstraction, please add &quot;include if<br=
>
exists &lt;abstractions/libnuma.d&gt;&quot; to the end of the abstraction. =
You<br>
can see examples of such include lines in e.g. the upstream<br>
abstractions/nameservice.<br>
<br>
&gt; --<br>
&gt; 2.45.2<br>
&gt;<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div style=3D"text-align:left"></div><div style=
=3D"text-align:left">Hector CAO<br></div><div style=3D"text-align:left">Sof=
tware Engineer =E2=80=93 Partner Engineering Team</div><div style=3D"text-a=
lign:left"><a href=3D"mailto:hector.cao@canonical.com" target=3D"_blank">he=
ctor.cao@canonical.com</a></div><div style=3D"text-align:left"><a href=3D"h=
ttps://launchpad.net/~hectorcao" target=3D"_blank">https://launc</a><a href=
=3D"https://launchpad.net/~hectorcao" target=3D"_blank">hpad.net/~hectorcao=
</a></div><div style=3D"text-align:left">
<p style=3D"line-height:100%;margin-bottom:0in"> =20
<a href=3D"https://launchpad.net/~hectorcao" target=3D"_blank"><img width=
=3D"96" height=3D"81" src=3D"https://ci3.googleusercontent.com/mail-sig/AIo=
rK4z5yECcB4DOFqFQjPXjogBAVC5Vv1klgihEnAZXkqybF5lNxe9SeDqtm-9dmSwj3Sbw2kDL58=
U"></a></p>

</div></div></div>

--00000000000097be07062effb9c4--

