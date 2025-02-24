Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A42EA418EE
	for <lists+apparmor@lfdr.de>; Mon, 24 Feb 2025 10:26:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tmUiq-000477-U4; Mon, 24 Feb 2025 09:25:56 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <hector.cao@canonical.com>)
 id 1tmUio-000470-Qb
 for apparmor@lists.ubuntu.com; Mon, 24 Feb 2025 09:25:54 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E06793F29F
 for <apparmor@lists.ubuntu.com>; Mon, 24 Feb 2025 09:25:50 +0000 (UTC)
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-abbc0572fc9so257227466b.0
 for <apparmor@lists.ubuntu.com>; Mon, 24 Feb 2025 01:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740389149; x=1740993949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xXQTIR83x01qmFX68s0HxjjNjaa4gW+23Z2TZ2Vd32E=;
 b=YTfYXwhbAEWCZuinELcVUfBCmihy++CR+xWKLMOIBacl9L+c63Drcjsfzd5gvArS2f
 I8jYCuiuzxai6RbXE9pRbJX897TgDtdUtIbI67Kzf5PSD0NXeDOt81lfQSUvWyTl90tc
 +Y4APchDANQJhYw7W8OuuT63G15qu68batI3et8nHra9wIAA1fr6K7xfrkftgEhMSKa/
 ByuBDVntoyQJl7ZyWYOWjqoEGfSawz5OV3t0edgh0Dq1e2z17vZzhI/rGVRwqc1KzrPR
 dufIAqoZDL91oEVLqQsm95EZ4d52LpYpEInlrejS5xhoWHXhPe8zRcLj6/PxImaGRtFc
 rURg==
X-Gm-Message-State: AOJu0Yy50op7lQnrWHa6y3FSZa/cQVrkaCZWFlNuGyGW43XZMjG8iUEH
 oJp+Uh5QOYxLB/T6RbyRJh+QFl4Mg4oZZjc91sG2p2oZNhzHIHeTo9/1JgONTd5hBsmrSCtFxWd
 PHnhcek/VgT7Hoyj92+lz1TQsd3iaYbUMT/uvl8KtjbX7dxt1o18sQEym5HGsUaCjIuHsCJE0lB
 IC1fuWvmKrWWOr0tCxdRUKuwNWyhbLDqs+PmOHx3Fwb8rwCQ+ca+ygNKYdsTE=
X-Gm-Gg: ASbGncu2djUGsnAqqLcvNSssANKVdscuKN/2oQkn9YXtXEraXDo7nDKRtwqTUNaw+lh
 OQUmfjQSQnAgy9u6i10fgMsPbAIFM3B2N1M616Yu5jF8phti/TQa1ECOkkAyr8UAJnz+/3/KTy0
 3DWUrK0R6rSyq+WDJ1hYoMsfvyvM2Q
X-Received: by 2002:a05:6402:4409:b0:5e0:815d:4e08 with SMTP id
 4fb4d7f45d1cf-5e0b70bbf50mr12230803a12.3.1740389148799; 
 Mon, 24 Feb 2025 01:25:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcyEEeFr/CDrrUnTkSa1XLHhaey846/LLF77NEUJofLfEIf7ePecrH6NO2S+GoaJZnr/o3D/9tXeYWt0GGfQY=
X-Received: by 2002:a05:6402:4409:b0:5e0:815d:4e08 with SMTP id
 4fb4d7f45d1cf-5e0b70bbf50mr12230777a12.3.1740389148293; Mon, 24 Feb 2025
 01:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20250213155741.1619500-1-hector.cao@canonical.com>
 <fcc0529d-50e8-4751-aa46-1cc0bce4bc6b@canonical.com>
In-Reply-To: <fcc0529d-50e8-4751-aa46-1cc0bce4bc6b@canonical.com>
From: Hector Cao <hector.cao@canonical.com>
Date: Mon, 24 Feb 2025 10:25:36 +0100
X-Gm-Features: AWEUYZk8_6TpDLTOmQBFNGhcOw73heitZKyJoS_8gizSW1UdiNtEKDBnujJK-1k
Message-ID: <CABjvBV738M2COgP=0oVcTybrQgPQmk0r8v77t4qmcd4Puu1H3Q@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: multipart/alternative; boundary="000000000000f492d7062edfec26"
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

--000000000000f492d7062edfec26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,
Agree, let me send another patch, this one can be considered obsolete

On Mon, Feb 24, 2025 at 10:02=E2=80=AFAM John Johansen <john.johansen@canon=
ical.com>
wrote:

> On 2/13/25 07:57, Hector Cao wrote:
> > For executables dynamically linked to libnuma, the runtimer linker
> > invokes libnuma functions (num_init) that try to access
> > /sys/devices/system/node/ and if the application's apparmor
> > profile does not allow this access, this access will be denied
> > by apparmor with following error message:
> >
> >    apparmor=3D"DENIED" operation=3D"open" class=3D"file"
> >    name=3D"/sys/devices/system/node/" comm=3D"qemu-bridge-hel"
> >    requested_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
> >
> > Here is the simplified call trace:
> >
> >    0 ... in ?? () from /lib/x86_64-linux-gnu/libnuma.so.1
> >    1 ... in call_init (...) at ./elf/dl-init.c:74
> >    2 ... in call_init (...) at ./elf/dl-init.c:120
> >    3 _dl_init (...) at ./elf/dl-init.c:121
> >    4 ... in _dl_start_user () from /lib64/ld-linux-x86-64.so.2
> >
> > Allow access to this sysfs folder so that we do not have to
> > specify this permission for every executable linked to libnuma
> >
> what is the advantage of not specifying it? abstractions/base
> violates POLA and needs to go away. So I am very reluctant to
> add anything to base.
>
> Instead of adding the rule to every application linking to
> libnuma we should probably have a numa abstraction. While it
> would have 1 rule atm. As we deconstruct base it will pick up
> a few other rules.
>
>
> > Changes in v2:
> >    - Fix typo: add missing ending '/' character to the path
> >
> > Signed-off-by: Hector Cao <hector.cao@canonical.com>
> > ---
> >   profiles/apparmor.d/abstractions/base | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/profiles/apparmor.d/abstractions/base
> b/profiles/apparmor.d/abstractions/base
> > index bf3f3184e..52cbab920 100644
> > --- a/profiles/apparmor.d/abstractions/base
> > +++ b/profiles/apparmor.d/abstractions/base
> > @@ -108,6 +108,8 @@
> >     @{sys}/devices/system/cpu/       r,
> >     @{sys}/devices/system/cpu/online r,
> >     @{sys}/devices/system/cpu/possible r,
> > +  # runtime initialization for binaries linked to libnuma
> > +  @{sys}/devices/system/node/     r,
> >
> >     # transparent hugepage support
> >     @{sys}/kernel/mm/transparent_hugepage/hpage_pmd_size r,
>
>
>

--=20
Hector CAO
Software Engineer =E2=80=93 Partner Engineering Team
hector.cao@canonical.com
https://launc <https://launchpad.net/~hectorcao>hpad.net/~hectorcao
<https://launchpad.net/~hectorcao>

<https://launchpad.net/~hectorcao>

--000000000000f492d7062edfec26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi John,</div>Agree, let me send another patch, this =
one can be considered obsolete=C2=A0</div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 24, 2=
025 at 10:02=E2=80=AFAM John Johansen &lt;<a href=3D"mailto:john.johansen@c=
anonical.com">john.johansen@canonical.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 2/13/25 07:57, Hector Cao wrote=
:<br>
&gt; For executables dynamically linked to libnuma, the runtimer linker<br>
&gt; invokes libnuma functions (num_init) that try to access<br>
&gt; /sys/devices/system/node/ and if the application&#39;s apparmor<br>
&gt; profile does not allow this access, this access will be denied<br>
&gt; by apparmor with following error message:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 apparmor=3D&quot;DENIED&quot; operation=3D&quot;open&quot=
; class=3D&quot;file&quot;<br>
&gt;=C2=A0 =C2=A0 name=3D&quot;/sys/devices/system/node/&quot; comm=3D&quot=
;qemu-bridge-hel&quot;<br>
&gt;=C2=A0 =C2=A0 requested_mask=3D&quot;r&quot; denied_mask=3D&quot;r&quot=
; fsuid=3D1000 ouid=3D0<br>
&gt; <br>
&gt; Here is the simplified call trace:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 0 ... in ?? () from /lib/x86_64-linux-gnu/libnuma.so.1<br=
>
&gt;=C2=A0 =C2=A0 1 ... in call_init (...) at ./elf/dl-init.c:74<br>
&gt;=C2=A0 =C2=A0 2 ... in call_init (...) at ./elf/dl-init.c:120<br>
&gt;=C2=A0 =C2=A0 3 _dl_init (...) at ./elf/dl-init.c:121<br>
&gt;=C2=A0 =C2=A0 4 ... in _dl_start_user () from /lib64/ld-linux-x86-64.so=
.2<br>
&gt; <br>
&gt; Allow access to this sysfs folder so that we do not have to<br>
&gt; specify this permission for every executable linked to libnuma<br>
&gt; <br>
what is the advantage of not specifying it? abstractions/base<br>
violates POLA and needs to go away. So I am very reluctant to<br>
add anything to base.<br>
<br>
Instead of adding the rule to every application linking to<br>
libnuma we should probably have a numa abstraction. While it<br>
would have 1 rule atm. As we deconstruct base it will pick up<br>
a few other rules.<br>
<br>
<br>
&gt; Changes in v2:<br>
&gt;=C2=A0 =C2=A0 - Fix typo: add missing ending &#39;/&#39; character to t=
he path<br>
&gt; <br>
&gt; Signed-off-by: Hector Cao &lt;<a href=3D"mailto:hector.cao@canonical.c=
om" target=3D"_blank">hector.cao@canonical.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0profiles/apparmor.d/abstractions/base | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/profiles/apparmor.d/abstractions/base b/profiles/apparmor=
.d/abstractions/base<br>
&gt; index bf3f3184e..52cbab920 100644<br>
&gt; --- a/profiles/apparmor.d/abstractions/base<br>
&gt; +++ b/profiles/apparmor.d/abstractions/base<br>
&gt; @@ -108,6 +108,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0@{sys}/devices/system/cpu/=C2=A0 =C2=A0 =C2=A0 =C2=
=A0r,<br>
&gt;=C2=A0 =C2=A0 =C2=A0@{sys}/devices/system/cpu/online r,<br>
&gt;=C2=A0 =C2=A0 =C2=A0@{sys}/devices/system/cpu/possible r,<br>
&gt; +=C2=A0 # runtime initialization for binaries linked to libnuma<br>
&gt; +=C2=A0 @{sys}/devices/system/node/=C2=A0 =C2=A0 =C2=A0r,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0# transparent hugepage support<br>
&gt;=C2=A0 =C2=A0 =C2=A0@{sys}/kernel/mm/transparent_hugepage/hpage_pmd_siz=
e r,<br>
<br>
<br>
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

--000000000000f492d7062edfec26--

