Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A462B5C0
	for <lists+apparmor@lfdr.de>; Wed, 16 Nov 2022 09:57:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ovEEZ-0002HL-8J; Wed, 16 Nov 2022 08:57:27 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sonixxfx@gmail.com>) id 1ovEEW-0002HB-CS
 for apparmor@lists.ubuntu.com; Wed, 16 Nov 2022 08:57:24 +0000
Received: by mail-lj1-f182.google.com with SMTP id k19so20950391lji.2
 for <apparmor@lists.ubuntu.com>; Wed, 16 Nov 2022 00:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YVhUcy6g86PtnU3FIgE19yRvKOj7CSzloFY4NtMRhNY=;
 b=c7hVX5t+YEGuzEx351jaIduyeXjfWnvZ3knmNykjSFnf3GexzM/YL5dSd27owI+Dk9
 q1YTx0Dlj9M2ab+0Gc0bJe3O7Yjbo52Gv4bI7ZUK9uFcRg3pxet50cU2wZvsyA8fDdIV
 rxVMXGmBJ+cURPIMeYDJrWBkGuQK4tfgl7jvN80TAtq//zUdDtOE3svNETQ6Cy4AytKB
 Lj35NEIQ7Lrjfc2AaEOSkkiciwKoWCz2rSpU4n6/zlNmkbYeoD67wnqt1U9Nzn/iZYfC
 w8miqN5lc6T8qyxkgSY70iDW8AoW1rOulh2SZRIZeM2LXLFzWbFBK08nDpmO3NUDw0xp
 Me6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YVhUcy6g86PtnU3FIgE19yRvKOj7CSzloFY4NtMRhNY=;
 b=518YcRgpeeEhV3ZqJ6WQrH/Ry1ByOBwTZTwoJsG99ku4Sdytp6cKutloeV6Qlp8t3G
 oVm0MQ0Jn/Au4wR9bru32+9lHwDP7gOwPufDHq84XFF1N2ZZxDNurX/w4AmqypwSJuc1
 64gYRwE1rEycJAqruzSvx04uw1amJiwrvRxtmHO7JJ3qmKX0nTdcIOKFu8rH+RFi9mib
 NeBdeDun6kEPJwo+uLnCHTMnxaRC4mvUofQd3n1xg3QztLD1mHwAklwswUrtFPW2TYP1
 9j+6e5Hk/uWaGiRR4cxZ5vkcH4XKHd2Yu4fD+df0Cj/M090KaMhb6/qL482G+lW8Gbh6
 nC+g==
X-Gm-Message-State: ANoB5pkG3DbsR5VP1B2AVBM87zRMAoNZzJfFM5YkKPjvCjgDqs+EbYkx
 MXJUHnYwsuTpR3FfykPpYgh8Pijqhj5Y9fyUjNs=
X-Google-Smtp-Source: AA0mqf6pjR37+1beYaGCansB2rwJzdFOu/o/aS7UCZwyw6OpMp4uUamR0ZnGRPP8FgUskZ2WwlltgJHvs65FHEe9GcQ=
X-Received: by 2002:a05:651c:32f:b0:277:1e9b:2b07 with SMTP id
 b15-20020a05651c032f00b002771e9b2b07mr7958125ljp.242.1668589043106; Wed, 16
 Nov 2022 00:57:23 -0800 (PST)
MIME-Version: 1.0
References: <CAKO675mVM316f3jdy+6Fz4MKAkKP+rmEJKqhGPiBPiuM=3jAzQ@mail.gmail.com>
 <afb647b3-e9a7-24ae-0a94-99cdd2b02b49@canonical.com>
 <CAKO675=Pbn42nZ5d5ViqHXK4McPOyK2BXfh4dOFhp4xhUA=Ypg@mail.gmail.com>
 <139fb540-de33-7625-a45d-55eca86b5802@canonical.com>
In-Reply-To: <139fb540-de33-7625-a45d-55eca86b5802@canonical.com>
From: Sonixxfx <sonixxfx@gmail.com>
Date: Wed, 16 Nov 2022 09:57:11 +0100
Message-ID: <CAKO675npJ6p-on+5tS+qtEK-OfyEKd3kka=6GQrNmdDn0FdEOQ@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="00000000000030c7ed05ed92a981"
Received-SPF: pass client-ip=209.85.208.182; envelope-from=sonixxfx@gmail.com;
 helo=mail-lj1-f182.google.com
Subject: Re: [apparmor] Snaps are blocked by Apparmor on Ubuntu 22.04
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--00000000000030c7ed05ed92a981
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Op di 15 nov. 2022 om 23:53 schreef John Johansen <
john.johansen@canonical.com>:

> On 11/15/22 10:08, Sonixxfx wrote:
> > Op di 15 nov. 2022 om 18:06 schreef John Johansen <
> john.johansen@canonical.com <mailto:john.johansen@canonical.com>>:
> >
> >     On 11/15/22 06:30, Sonixxfx wrote:
> >      > Hi,
> >      >
> >      > I was trying Apparmor today, but now my snaps won't run anymore.
> I have tried a couple of things to solve it, including disabling Apparmor=
,
> but it didn't help.
> >      > When i try to start Brave for example dmesg shows me:
> >      >
> >
> >     how did you disable apparmor?
> >
> >     systemctl disable apparmor
> >
> >     or
> >
> >     systemctl disable snapd.apparmor
> >
> >     or
> >
> >     systemctl stop apparmor
> >
> >     or did you edit /etc/grub/defaults
> >
> >
> > I ran
> >
> > sudo systemctl stop apparmor.service
> >
> this will unload policy and make everything unconfined until reboot or th=
e
> service is started again. It is important to note that restarting the
> service will NOT re-confine applications that are unconfined. They must b=
e
> restarted.
>
> > to disable Apparmor.
> >
> > I ran
> >
> > sudo systemctl disable apparmor.service
> >
> > to unload the kernel module.
>
> this does not unload the kernel module, as apparmor is built into the
> kernel. At this time there is no option to make an of the LSMs loadable
> modules. What this does is partially disable systemd services that load
> policy/manage state.
>
> Partially because it only does late stage service disabling, there is
> early stage that can still run (not used by default on Ubuntu) and this c=
an
> really mess up your system.
> >
> >
> > Should I have run:
> >
> > sudo systemctl disable snapd.apparmor ?
> >
>
> no the only safe way to disable apparmor is to set apparmor=3D0 as a kern=
el
> parameter, you can do this temporarily in grub when booting or in
> /etc/defaults/grub and the update-grub
>
>
>
Oke, thanks.


> >      > brave_brave.desktop[9095]: snap-confine has elevated permissions
> and is not confined but should be. Refusing to continue to avoid permissi=
on
> escalation attacks
> >      > brave_brave.desktop[9095]: Please make sure that the
> snapd.apparmor service is enabled and started.
> >      >
> >      > These messages are also shown when I have Apparmor enabled and
> started.
> >      >
> >
> >     what does aa-status return?
> >
> >
> > I have already reinstalled my OS, sorry. But I am curious what you
> answer to my question.
> >
> >      > Can someone tell me how I can resolve this?
> >      >
> >
> >     so snaps by-pass the apparmor userspace service and only use the
> kernel component. They run their own service to manage snap confinement.
> What do you get for
> >
> >     systemctl status snapd.apparmor
> >
> >
> >     and of course if it is not running you can do
> >
> >     systemctl start snapd.apparmor
> >
> >     or make sure it runs after reboot
> >
> >     systemctl enable snapd.apparmor
> >
> >
> > Thanks for the info =F0=9F=98=83
>
>

--00000000000030c7ed05ed92a981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Op di 15 nov. 2022 om 23:53 schreef John Joha=
nsen &lt;<a href=3D"mailto:john.johansen@canonical.com">john.johansen@canon=
ical.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 11/15/22 10:08, Sonixxfx wrote:<br>
&gt; Op di 15 nov. 2022 om 18:06 schreef John Johansen &lt;<a href=3D"mailt=
o:john.johansen@canonical.com" target=3D"_blank">john.johansen@canonical.co=
m</a> &lt;mailto:<a href=3D"mailto:john.johansen@canonical.com" target=3D"_=
blank">john.johansen@canonical.com</a>&gt;&gt;:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 11/15/22 06:30, Sonixxfx wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I was trying Apparmor today, but now my snaps=
 won&#39;t run anymore. I have tried a couple of things to solve it, includ=
ing=C2=A0disabling=C2=A0Apparmor, but it didn&#39;t help.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; When i try to start Brave for example dmesg s=
hows me:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0how did you disable apparmor?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0systemctl disable apparmor<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0or<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0systemctl disable snapd.apparmor<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0or<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0systemctl stop apparmor<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0or did you edit /etc/grub/defaults<br>
&gt; <br>
&gt; <br>
&gt; I ran<br>
&gt; <br>
&gt; sudo systemctl stop apparmor.service<br>
&gt; <br>
this will unload policy and make everything unconfined until reboot or the =
service is started again. It is important to note that restarting the servi=
ce will NOT re-confine applications that are unconfined. They must be resta=
rted.<br>
<br>
&gt; to disable Apparmor.<br>
&gt; <br>
&gt; I ran<br>
&gt; <br>
&gt; sudo systemctl disable apparmor.service<br>
&gt; <br>
&gt; to unload the kernel module.<br>
<br>
this does not unload the kernel module, as apparmor is built into the kerne=
l. At this time there is no option to make an of the LSMs loadable modules.=
 What this does is partially disable systemd services that load policy/mana=
ge state.<br>
<br>
Partially because it only does late stage service disabling, there is early=
 stage that can still run (not used by default on Ubuntu) and this can real=
ly mess up your system.<br>
&gt; <br>
&gt; <br>
&gt; Should I have run:<br>
&gt; <br>
&gt; sudo systemctl disable snapd.apparmor ?<br>
&gt; <br>
<br>
no the only safe way to disable apparmor is to set apparmor=3D0 as a kernel=
 parameter, you can do this temporarily in grub when booting or in /etc/def=
aults/grub and the update-grub<br>
<br>
<br></blockquote><div><br></div><div>Oke, thanks.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; brave_brave.desktop[9095]: snap-confine has e=
levated permissions and is not confined but should be. Refusing to continue=
 to avoid permission escalation attacks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; brave_brave.desktop[9095]: Please make sure t=
hat the snapd.apparmor service is enabled and started.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; These messages are also shown when I have App=
armor enabled and started.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0what does aa-status return?<br>
&gt; <br>
&gt; <br>
&gt; I have already reinstalled my OS, sorry. But I am curious what you ans=
wer to my question.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Can someone tell me how I can resolve this?<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0so snaps by-pass the apparmor userspace service and=
 only use the kernel component. They run their own service to manage snap c=
onfinement. What do you get for<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0systemctl status snapd.apparmor<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0and of course if it is not running you can do<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0systemctl start snapd.apparmor<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0or make sure it runs after reboot<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0systemctl enable snapd.apparmor<br>
&gt; <br>
&gt; <br>
&gt; Thanks for the info =F0=9F=98=83<br>
<br>
</blockquote></div></div>

--00000000000030c7ed05ed92a981--

