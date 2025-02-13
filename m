Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 647EAA35047
	for <lists+apparmor@lfdr.de>; Thu, 13 Feb 2025 22:10:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tigTi-0007r7-Q8; Thu, 13 Feb 2025 21:10:34 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <hector.cao@canonical.com>)
 id 1tigTg-0007qe-KY
 for apparmor@lists.ubuntu.com; Thu, 13 Feb 2025 21:10:32 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1A8A33F302
 for <apparmor@lists.ubuntu.com>; Thu, 13 Feb 2025 21:10:31 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5deb766de79so1233732a12.3
 for <apparmor@lists.ubuntu.com>; Thu, 13 Feb 2025 13:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739481030; x=1740085830;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5a/kU2DZSP5W3hb8NGi29me/HVQSw2ccZZ9mUEakK4c=;
 b=iuJHjIQdAb8/KCkUr4VDPVm3EbPCKN9MHYQjJJ+JHQhUt4iW6YU3S7hoB4uGfJ6yfW
 65peLTiPP0UydHIV/SReuaHHRHeHgeWhLPKl4xgbQCw0UcNmRVxETipZSFVOxwcsJ+iC
 BrEVNzc1b2OImq5dG1aB9aeiFwp9rUxghvPBpugOKebPFAdQRpsde9eWScQWI2azHMJG
 vpzTONbKsYfJSPeYBxVxcDmhd2LaY4dcGflCjqrBV1iBIYC9m4CBSBUDp3tGrVdDIq+G
 DPGwPQ7SnCAx6Ybjchh1PyxqGOfQPBGnIJP/YZLRMfgYS0TE5TeqQS5LIg2pqz6OJKFf
 hNmA==
X-Gm-Message-State: AOJu0Yw0UoiCJxEoJXMgPEeCggKZlFJc5Tlm0aRgkbPus+QTDPjE/yLm
 pu2BPkroki9wbv7TboFEnNkt9q3RHEshG2fDT13jOaSkenvSFYCiFdquUmvYxPYjZgoabj4U/3T
 6kSnFpL+++aoKR0pAZhSI/8viYonJ/5JXvaJL780xvKj7KNncVGocy3l2kgVIpMjUSB1kZLesBz
 a89CsOWUSL667oSjhQQM1zsqKUxYHDCq/YNuNFK5JBwMNko8ddl9QghsclOP4AvA==
X-Gm-Gg: ASbGncsaS6f5zYpdKzPM07yiRwCls/Ttr97xLUJ3HV4JfipNHBq7mYr9Va9CmEI9mXv
 z18F8FI0YF3e0F3YPMk4mvZfEZbGcaLPsYQ9lACM0n8nPbsIxx1GTbWt9f77vAjVlNpIyKvYyGE
 t7eZY2E6KyaTCYv1wKmg==
X-Received: by 2002:a05:6402:3885:b0:5d1:f009:925e with SMTP id
 4fb4d7f45d1cf-5dec9d55aa8mr4730654a12.16.1739481030222; 
 Thu, 13 Feb 2025 13:10:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGF+56G/GacFirRwWEwTkknahMug0xR3yarQMspRgoUfdHgQjcK95VJBgta9x96e5Q3MLsk/OObaAHYROr/38M=
X-Received: by 2002:a05:6402:3885:b0:5d1:f009:925e with SMTP id
 4fb4d7f45d1cf-5dec9d55aa8mr4730638a12.16.1739481029791; Thu, 13 Feb 2025
 13:10:29 -0800 (PST)
MIME-Version: 1.0
References: <20250213155741.1619500-1-hector.cao@canonical.com>
 <CAKCV-6v4MxM71sfp4E+s9WSyiQnXgSU6K7Ep9cA_Df3mA-q+sg@mail.gmail.com>
In-Reply-To: <CAKCV-6v4MxM71sfp4E+s9WSyiQnXgSU6K7Ep9cA_Df3mA-q+sg@mail.gmail.com>
From: Hector Cao <hector.cao@canonical.com>
Date: Thu, 13 Feb 2025 22:10:19 +0100
X-Gm-Features: AWEUYZnsmG87E7She2CjBlhUpQjgkDOIMcZlFnujBWFPJgXXLl9m-MYybX7vYL8
Message-ID: <CABjvBV75WA=5Xri_R7ETSLKV43Nam9NFkjbttRAgvhC8fj1FdQ@mail.gmail.com>
To: Ryan Lee <ryan.lee@canonical.com>
Content-Type: multipart/alternative; boundary="000000000000dfec26062e0c7cf9"
Subject: Re: [apparmor] [PATCH v2] Allow access to sys devices nodes for
	libnuma
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

--000000000000dfec26062e0c7cf9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 7:57=E2=80=AFPM Ryan Lee <ryan.lee@canonical.com> w=
rote:

> On Thu, Feb 13, 2025 at 7:58=E2=80=AFAM Hector Cao <hector.cao@canonical.=
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
> > Allow access to this sysfs folder so that we do not have to
> > specify this permission for every executable linked to libnuma
>
> IMO this should go into a dedicated numa abstraction and not be added
> to abstractions/base.
>
>
I agree, I have also considered this option but finally went for putting
the permission
in the base abstraction, but, I think it is also appropriate to have a
dedicated abstraction for
this use case of libnuma.

If possible, I would like to have an +1 from another reviewer for the
proposed approach done by Ryan
before modifying the patch.


> >
> > Changes in v2:
> >   - Fix typo: add missing ending '/' character to the path
> >
> > Signed-off-by: Hector Cao <hector.cao@canonical.com>
> > ---
> >  profiles/apparmor.d/abstractions/base | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/profiles/apparmor.d/abstractions/base
> b/profiles/apparmor.d/abstractions/base
> > index bf3f3184e..52cbab920 100644
> > --- a/profiles/apparmor.d/abstractions/base
> > +++ b/profiles/apparmor.d/abstractions/base
> > @@ -108,6 +108,8 @@
> >    @{sys}/devices/system/cpu/       r,
> >    @{sys}/devices/system/cpu/online r,
> >    @{sys}/devices/system/cpu/possible r,
> > +  # runtime initialization for binaries linked to libnuma
> > +  @{sys}/devices/system/node/     r,
> >
> >    # transparent hugepage support
> >    @{sys}/kernel/mm/transparent_hugepage/hpage_pmd_size r,
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

--000000000000dfec26062e0c7cf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 13,=
 2025 at 7:57=E2=80=AFPM Ryan Lee &lt;<a href=3D"mailto:ryan.lee@canonical.=
com">ryan.lee@canonical.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Thu, Feb 13, 2025 at 7:58=E2=80=AFAM Hector C=
ao &lt;<a href=3D"mailto:hector.cao@canonical.com" target=3D"_blank">hector=
.cao@canonical.com</a>&gt; wrote:<br>
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
&gt; Allow access to this sysfs folder so that we do not have to<br>
&gt; specify this permission for every executable linked to libnuma<br>
<br>
IMO this should go into a dedicated numa abstraction and not be added<br>
to abstractions/base.<br>
<br></blockquote><div><br></div><div>I agree, I have also considered this o=
ption but finally went for putting the permission</div><div>in the base abs=
traction, but, I think it is also appropriate to have a dedicated abstracti=
on for</div><div>this use case of libnuma.</div><div><br></div><div>If poss=
ible, I would like to have an +1 from another reviewer for the proposed app=
roach done by Ryan</div><div>before modifying the patch.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Changes in v2:<br>
&gt;=C2=A0 =C2=A0- Fix typo: add missing ending &#39;/&#39; character to th=
e path<br>
&gt;<br>
&gt; Signed-off-by: Hector Cao &lt;<a href=3D"mailto:hector.cao@canonical.c=
om" target=3D"_blank">hector.cao@canonical.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 profiles/apparmor.d/abstractions/base | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/profiles/apparmor.d/abstractions/base b/profiles/apparmor=
.d/abstractions/base<br>
&gt; index bf3f3184e..52cbab920 100644<br>
&gt; --- a/profiles/apparmor.d/abstractions/base<br>
&gt; +++ b/profiles/apparmor.d/abstractions/base<br>
&gt; @@ -108,6 +108,8 @@<br>
&gt;=C2=A0 =C2=A0 @{sys}/devices/system/cpu/=C2=A0 =C2=A0 =C2=A0 =C2=A0r,<b=
r>
&gt;=C2=A0 =C2=A0 @{sys}/devices/system/cpu/online r,<br>
&gt;=C2=A0 =C2=A0 @{sys}/devices/system/cpu/possible r,<br>
&gt; +=C2=A0 # runtime initialization for binaries linked to libnuma<br>
&gt; +=C2=A0 @{sys}/devices/system/node/=C2=A0 =C2=A0 =C2=A0r,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 # transparent hugepage support<br>
&gt;=C2=A0 =C2=A0 @{sys}/kernel/mm/transparent_hugepage/hpage_pmd_size r,<b=
r>
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

</div></div></div></div>

--000000000000dfec26062e0c7cf9--

