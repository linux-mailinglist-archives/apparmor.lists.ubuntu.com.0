Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E362E637
	for <lists+apparmor@lfdr.de>; Thu, 17 Nov 2022 21:57:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ovlwa-0002cL-Ld; Thu, 17 Nov 2022 20:57:08 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <janko.itm@gmail.com>) id 1ovlwS-0002XP-QQ
 for apparmor@lists.ubuntu.com; Thu, 17 Nov 2022 20:57:00 +0000
Received: by mail-wr1-f49.google.com with SMTP id bs21so5870195wrb.4
 for <apparmor@lists.ubuntu.com>; Thu, 17 Nov 2022 12:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2Lk4pRAqstx8pY+D+3spA+6dZ4r8P1zvvl5mGJmmavs=;
 b=bWCsCNoJ4CdL9iLv5dlsrLq0iZEEdrDAM4vRoGhsDoxvMH8Mg/Fgl/jmTCJFYpU6pd
 zzhWhmqxVxvHT49CUke2xFqEfiJzbAaoU11P8RCe9FIMW8u4aY34WUWtTvEIWRrjrxpa
 oHEotRZxNKNbPYYZAM06jUbAbXUKcYQT6MXF5VOYU0JYYJHfU7N8ffGdsGn+a9yLUBHQ
 vP43nodS9Bv+wqBI8kDL3kdr8fU4lwSAhqgg7bdAfRV/ObP4ew7Ku/31kp2qOt7DYbv4
 8INvNEAVKgjo14/f0WupIeda4NwrD3mUi+EQnhdmj5FilN1p5SMvJngFk3GqDS8cRw0M
 JhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Lk4pRAqstx8pY+D+3spA+6dZ4r8P1zvvl5mGJmmavs=;
 b=4U6ifZhpcPyPN8MgeCdf4YfZ99xrB6BxQf7mqCoyRP+LG1UcCYTbqcHWPU4GIB18oO
 tCWIQaJZK4k7gzkp1BGW+h49XpqiVQgrl3hhSPxBQHpLnaR1s/w+9hJ3Kxym2rlOqD8+
 juLHpuXnlLt8gQF9Y70APoemkKoaZxkSF/YoM2vyTxXx85wCDpvdqB/NEkMqwgP50nC5
 Y9kOibBVBzMfzvVgq8XbamnunVTlsxaR07JH1PDPhz6Nrvh/hCoraurrd09Yuvu/GXYm
 r9YOTvuZQAAezXToXxYPMe0VbC4qJmmrKw1OakJJAfqYQHcyGCQc6w6UKe4mSJd0kLq+
 1KXQ==
X-Gm-Message-State: ANoB5pmhex64wMPJDuoG8psJOYk4dyq6REX35NfNB4AHP0xFYAlqYXhu
 VbcWyMeNEzB/0gni1TyFxOou3I/uyUca6+8v7mXSliJITNXPSQ==
X-Google-Smtp-Source: AA0mqf7jxzppYOT/V/WMmytFRbyG21LswjQloyVHtiUvBr/Rgc300RZJO9Ng41jSoXdX3+OT9ape787ISHSN9Y51vuw=
X-Received: by 2002:a5d:534c:0:b0:241:b4ad:6c07 with SMTP id
 t12-20020a5d534c000000b00241b4ad6c07mr2429018wrv.683.1668718619185; Thu, 17
 Nov 2022 12:56:59 -0800 (PST)
MIME-Version: 1.0
References: <CAHRxeQ0Mf-mWnNGS1vGa0NMB-=dBvsweaQ-xPkibxC1VNmLmcg@mail.gmail.com>
 <cc664f3b-cb4f-51a6-f3f5-5df2313c3c00@canonical.com>
In-Reply-To: <cc664f3b-cb4f-51a6-f3f5-5df2313c3c00@canonical.com>
From: janko metelko <janko.itm@gmail.com>
Date: Thu, 17 Nov 2022 21:56:44 +0100
Message-ID: <CAHRxeQ0KkfadRpaUdUZRM2wN1FF4TB8H_Ko9OdkA0fu=phoyUA@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: multipart/alternative; boundary="00000000000086d76a05edb0d411"
Received-SPF: pass client-ip=209.85.221.49; envelope-from=janko.itm@gmail.com;
 helo=mail-wr1-f49.google.com
Subject: Re: [apparmor] any way of denying profiled executable(s) to be ran
	at all
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

--00000000000086d76a05edb0d411
Content-Type: text/plain; charset="UTF-8"

Thank you John for your very extensive and clear answer and explanation! I
had to read it twice to really get it, but now I see :). I find AppArmor
really interesting and also simple to use.

I will continue to explore AppArmor as I intend to use it on my servers and
my work computer. I find it funny that this technology seems so helpful and
I or my colleagues weren't even really aware of it.
I will also try to integrate it into a programming language I am working on
(ryelang.blogspot.com) as I think all serious apps of the future will have
to be well integrated with something like apparmor.
(I intend to make Rye so that it can also only evaluate source files signed
with specific ed25519 keys, but I have to make the Rye binary irreplaceable
then, it seems AA could also help me with that)

Thanks again!
Janko

On Wed, Nov 16, 2022 at 9:31 PM John Johansen <john.johansen@canonical.com>
wrote:

> On 11/16/22 11:59, janko metelko wrote:
> > Thank you for making AppArmor, if any of the developers are here. I am
> not a security guy, but such a solution seems like it should or will become
> an absolute must-use for any application deployment, locally or on a server.
> >
> > I have a question. I want to make a profile that prevents execution of
> any file from user-writable directories like /home /tmp, *except* if the
> executable has a AA profile.
> >
> > This would effectively mean that the user (or user level process) can't
> (knowingly or unknowingly) "install" and run anything that wasn't
> "confirmed" by root.
> >
> > It seems I can do this by creating an empty profile for /home/** which
> denies everything and then creating separate AA profiles for specific
> executable files inside /home that I allow to run.
> >
> > If I understand it right, all executables in /home without profiles will
> in this case crash or at least can't do any side effects since they are
> blocked from all IO/shared libs/configs/etc. In practice, they will
> probably just crash. It would be much nicer experience if such apps would
> be prevented to run, not start and crash.
> >
> > But I can only find directives in AA, that limit or allow certain
> resorces to the executable, and no directive, that would prevent executable
> to be ran in the first place.
> >
> > Is there any such solution? Am I maybe looking at it all wrong? Should I
> do this on another level, not with AppArmor?
> >
> > *Example*
> >
> > Maybe stupid example, but still. Let's say I want to prevent non-root
> users or RCEs from wget-ing into any other directory other than /tmp. I can
> simply create a profile for /usr/bin/wget { ... /tmp w, } and the job is
> done. But user/RCE can then simply do cp /usr/bin/wget ~/mywget and use
> wget for whatever it wants. If we prevent execution of non-profiled
> executables in user writable directories then he/it can't do that and our
> primary objective stands.
> >
> > I hope it makes some sense ... Thank you again. Ubuntu rocks also, and
> Xubuntu! :)
> >
>
> So lets split this into two cases.
> 1. Executing an application when confined
> 2. Executing an application when unconfined
>
> there are some differences so it is worth covering
>
> 1. Executing an application when confined
>
> When an application is confined all execs are covered by the profiles
> domain transition rules. Those rules require a qualifier to determine what
> should be done at exec.
> ix - inherit
> px - transition to a profile if it exists, otherwise FAIL the exec
> cx - transition to a child profile if it exists, otherwise FAIL the exec
> ux - transition to unconfined
>
> there are currently a set of fallback options available instead of failing
> the exec
> pix, cix - transition to profile if it exists, otherwise inherit current
> confinement
> pux, cux - transition to profile if it exists, otherwise transition to
> unconfined.
>
> you can also explicitly deny an exec with a deny rule
>
>    deny x /tmp/*,  # no need for a qualifier on deny rules
>
>
> So in this case there are a few ways to deny at exec time instead of
> crashing
>
>
> 2. Executing an application when unconfined
>
> This case is the currently problematic one. Where unconfined tasks
> essentially use an exec rule of
>
>    pix /**,
>
> meaning no exec will fail, it will either transition to a defined profile
> or allow the exec to continue as unconfined.
>
> Currently the only way to deal with this is indeed create a "trap" profile
> that doesn't grant permissions, causing the application to fault after exec
>
> profile trap /tmp/** {
>    # no permissions.
> }
>
>
> Obviously this is less than satisfactory. Ideally to avoid this you would
> be in situation #1, but the reality is that this just isn't how apparmor
> has been deployed and not all user tasks are confined.
>
>
> There is work going on to fix this, but it has not landed as of upstream
> kernel 6.1 or Ubuntu 22.10. When it lands (hopefully 23.04) you will be
> able to specify attachments that should be denied. Instead of having to
> create a trap profile. It will be a rule similar to what is in the profile.
>
>    deny x /tmp/**,
>
> and will have the longest left match prioritization, that attachments
> currently have. That is
>
>    deny x /**,
>
> would stop execution of anything that didn't have a profile defined. But
> since
>    profile example /bin/foo { }
>
> has a more specific attachment match it would take priority and allow exec
> under that profile.
>
>

-- 

Janko Metelko

Refaktor Labs, InvoiceFox, Cebelca.biz, UsrJoy ..

--00000000000086d76a05edb0d411
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you John for your very extensive and clear answ=
er and explanation! I had to read it twice to really get it, but now I see =
:). I find AppArmor really interesting and also simple to use.<br></div><di=
v><br></div><div>I will continue to explore AppArmor as I intend to use it =
on my servers and my work computer. I find it funny that this technology se=
ems so helpful and I or my colleagues weren&#39;t even really aware of it.<=
br></div><div>I will  also try to integrate it into a programming language =
I am working on (<a href=3D"http://ryelang.blogspot.com">ryelang.blogspot.c=
om</a>) as I think all serious apps of the future will have to be well inte=
grated with something like apparmor.</div><div>(I intend to make Rye so tha=
t it can also only evaluate source files signed with specific ed25519 keys,=
 but I have to make the Rye binary irreplaceable then, it seems AA could al=
so help me with that)<br><br></div><div>Thanks again!</div><div>Janko<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Nov 16, 2022 at 9:31 PM John Johansen &lt;<a href=3D"mailto:joh=
n.johansen@canonical.com">john.johansen@canonical.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On 11/16/22 11:59, jan=
ko metelko wrote:<br>
&gt; Thank you for making AppArmor, if any of the developers are here. I am=
 not a security guy, but such a solution seems like it should or will becom=
e an absolute must-use for any application deployment, locally or on a serv=
er.<br>
&gt; <br>
&gt; I have a question. I want to make a profile that prevents execution of=
 any file from user-writable directories like /home /tmp, *except* if the e=
xecutable has a AA profile.<br>
&gt; <br>
&gt; This would effectively mean that the user (or user level process) can&=
#39;t (knowingly or unknowingly) &quot;install&quot; and run anything that =
wasn&#39;t &quot;confirmed&quot; by root.<br>
&gt; <br>
&gt; It seems I can do this by creating an empty profile for /home/** which=
 denies everything and then creating separate AA profiles for specific exec=
utable files inside /home that I allow to run.<br>
&gt; <br>
&gt; If I understand it right, all executables in /home without profiles wi=
ll in this case crash or at least can&#39;t do any side effects since they =
are blocked from all IO/shared libs/configs/etc. In practice, they will pro=
bably just crash. It would be much nicer experience if such apps would be p=
revented to run, not start and crash.<br>
&gt; <br>
&gt; But I can only find directives in AA, that limit or allow certain reso=
rces to the executable, and no directive, that would prevent executable to =
be ran in the first place.<br>
&gt; <br>
&gt; Is there any such solution? Am I maybe looking at it all wrong? Should=
 I do this on another level, not with AppArmor?<br>
&gt; <br>
&gt; *Example*<br>
&gt; <br>
&gt; Maybe stupid example, but still. Let&#39;s say I want to prevent non-r=
oot users or RCEs from wget-ing into any other directory other than /tmp. I=
 can simply create a profile for /usr/bin/wget { ... /tmp w, } and the job =
is done. But user/RCE can then simply do cp /usr/bin/wget ~/mywget and use =
wget for whatever it wants. If we prevent execution of non-profiled executa=
bles in user writable directories then he/it can&#39;t do that and our prim=
ary objective stands.<br>
&gt; <br>
&gt; I hope it makes some sense ... Thank you again. Ubuntu rocks also, and=
 Xubuntu! :)<br>
&gt; <br>
<br>
So lets split this into two cases.<br>
1. Executing an application when confined<br>
2. Executing an application when unconfined<br>
<br>
there are some differences so it is worth covering<br>
<br>
1. Executing an application when confined<br>
<br>
When an application is confined all execs are covered by the profiles domai=
n transition rules. Those rules require a qualifier to determine what shoul=
d be done at exec.<br>
ix - inherit<br>
px - transition to a profile if it exists, otherwise FAIL the exec<br>
cx - transition to a child profile if it exists, otherwise FAIL the exec<br=
>
ux - transition to unconfined<br>
<br>
there are currently a set of fallback options available instead of failing =
the exec<br>
pix, cix - transition to profile if it exists, otherwise inherit current co=
nfinement<br>
pux, cux - transition to profile if it exists, otherwise transition to unco=
nfined.<br>
<br>
you can also explicitly deny an exec with a deny rule<br>
<br>
=C2=A0 =C2=A0deny x /tmp/*,=C2=A0 # no need for a qualifier on deny rules<b=
r>
<br>
<br>
So in this case there are a few ways to deny at exec time instead of crashi=
ng<br>
<br>
<br>
2. Executing an application when unconfined<br>
<br>
This case is the currently problematic one. Where unconfined tasks essentia=
lly use an exec rule of<br>
<br>
=C2=A0 =C2=A0pix /**,<br>
<br>
meaning no exec will fail, it will either transition to a defined profile o=
r allow the exec to continue as unconfined.<br>
<br>
Currently the only way to deal with this is indeed create a &quot;trap&quot=
; profile that doesn&#39;t grant permissions, causing the application to fa=
ult after exec<br>
<br>
profile trap /tmp/** {<br>
=C2=A0 =C2=A0# no permissions.<br>
}<br>
<br>
<br>
Obviously this is less than satisfactory. Ideally to avoid this you would b=
e in situation #1, but the reality is that this just isn&#39;t how apparmor=
 has been deployed and not all user tasks are confined.<br>
<br>
<br>
There is work going on to fix this, but it has not landed as of upstream ke=
rnel 6.1 or Ubuntu 22.10. When it lands (hopefully 23.04) you will be able =
to specify attachments that should be denied. Instead of having to create a=
 trap profile. It will be a rule similar to what is in the profile.<br>
<br>
=C2=A0 =C2=A0deny x /tmp/**,<br>
<br>
and will have the longest left match prioritization, that attachments curre=
ntly have. That is<br>
<br>
=C2=A0 =C2=A0deny x /**,<br>
<br>
would stop execution of anything that didn&#39;t have a profile defined. Bu=
t since<br>
=C2=A0 =C2=A0profile example /bin/foo { }<br>
<br>
has a more specific attachment match it would take priority and allow exec =
under that profile.<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><br><div>Janko Metelko</div><div><br></div><div>Refaktor La=
bs, InvoiceFox, Cebelca.biz, UsrJoy ..</div></div>

--00000000000086d76a05edb0d411--

