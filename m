Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D7294A3F0B6
	for <lists+apparmor@lfdr.de>; Fri, 21 Feb 2025 10:44:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tlPZk-00054m-J5; Fri, 21 Feb 2025 09:44:04 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <esh.jordan@gmail.com>)
 id 1tlPZh-000545-SE
 for apparmor@lists.ubuntu.com; Fri, 21 Feb 2025 09:44:02 +0000
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-4be68eadf2fso605187137.1
 for <apparmor@lists.ubuntu.com>; Fri, 21 Feb 2025 01:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740131040; x=1740735840;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KDSefU20fgGglHNCFcWlUz+6WrehwsvPU1vmed9gnCE=;
 b=Nk4CZ1uL5M50rSGFBwP/csvcjl1rsW7FCyjeNLxRjbzl17mHPK+tfZqG/e5hv60+At
 fQ9A/mFxkek2HEsfNtc5AWxB1oaftA4su7sRCKgmn3kUTnU1WRIzWkcT0KyW0Ig/hiqk
 UzygFfvix5YS4NucYSRYahstCBUwUISqwBn7SkOrnB65xDVJT3WtXXkKw0cMWXJzfQ16
 hfPQW3m93OnjkBmeEudrhh798tlB6r7fnUPMfr1HN6nzaCHPGaR2z5IX1eDmbstRpWQO
 qHTf6DaU7POLPE6t9x70WvtDeWwhruecJvQQL8kNihq52UvOmgItD7hRrePqQe/paiNi
 M+SA==
X-Gm-Message-State: AOJu0YxMJClWfsht3N1B7iOhA5aaPj/ZskHnvxRx3A5jL2dek7vBxJ/O
 Trw7BZPL/NgCPJlWO8I7ANgA4YnAWkgIxBjtPTTx84nnZA5rfxvAHEOcrwyM3bFgWr97zrqju0X
 iryuiyXNqRquWdcB/cnRX74VVnJ2g8u8oRvg=
X-Gm-Gg: ASbGnctnTPR0tUZktWWhfQ/MMqhC8Rbz0ar6QmmbcdTBSLfv17LGWN15EiG4d7vg6W4
 F6rlOnPqGDZP69/7QR4pwnRnYj0CvlQqjTbaCa7ML2FI71lN4JlcryqkJd6Eux6Pn4EN5ua2Ejr
 p6adMsJA==
X-Google-Smtp-Source: AGHT+IGmBex0Ap461aNkosCil7k+9zA0GJxjjD1w4FIHgustmfQe/hhoXCoQAbAXf0sO1orgwU0l7YdXugYrVsZdobQ=
X-Received: by 2002:a05:6102:4411:b0:4bb:d7f0:6e70 with SMTP id
 ada2fe7eead31-4bfbffcc850mr1613001137.5.1740131040401; Fri, 21 Feb 2025
 01:44:00 -0800 (PST)
MIME-Version: 1.0
References: <CAM0LVXntUf3Cqid9dWZOtAoSyLVLJC+m5HUnoci3=JRbsWJC1A@mail.gmail.com>
 <CAKCV-6s5rz=3FpQ5MkSpn-B+VjaE5TpZFJ=_p6E1H5-LsQ-rnw@mail.gmail.com>
In-Reply-To: <CAKCV-6s5rz=3FpQ5MkSpn-B+VjaE5TpZFJ=_p6E1H5-LsQ-rnw@mail.gmail.com>
From: Jordan Esh <esh.jordan@gmail.com>
Date: Fri, 21 Feb 2025 20:43:48 +1100
X-Gm-Features: AWEUYZn7uFGRWMFL3kfvAtoR5POZba_Q5nM1xebsZGf2mScP8Tqe8cYMxDHs-KY
Message-ID: <CAM0LVXmNRJPxaU448S4dzWyQ3w27LQ=GzqqDrkB6wKPXcz_Ncw@mail.gmail.com>
To: Ryan Lee <ryan.lee@canonical.com>
Content-Type: multipart/alternative; boundary="00000000000086a616062ea3d4b8"
Received-SPF: pass client-ip=209.85.217.44; envelope-from=esh.jordan@gmail.com;
 helo=mail-vs1-f44.google.com
Subject: Re: [apparmor] Ubuntu 25.04 wpa_supplicant profile requests denied
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

--00000000000086a616062ea3d4b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Awesome, thanks very much Ryan!

On Fri, Feb 21, 2025 at 4:00=E2=80=AFAM Ryan Lee <ryan.lee@canonical.com> w=
rote:

> Hi Jordan,
>
> This is an issue that was reported in Launchpad at
> https://bugs.launchpad.net/ubuntu/+source/apparmor/+bug/2098838. We
> are aware of what's broken and am working on a fixed AppArmor package
> that should resolve this breakage.
>
> Ryan
>
>
> On Thu, Feb 20, 2025 at 5:49=E2=80=AFAM Jordan Esh <esh.jordan@gmail.com>=
 wrote:
> >
> > I have recently upgraded to Ubuntu 25.04 (Plucky Puffin) on my laptop,
> and have been unable to successfully enable Wi-Fi.
> > After doing some digging, it seems that the configuration in the
> wpa_supplicant profile for AppArmor might be the issue, as requests to
> create a netlink socket and open the HW device are being denied.
> > I'm new to AppArmor, but if somebody could point me in the right
> direction, I'm happy to test some changes to the profile and open a PR on
> GitLab. Any help would be greatly appreciated :)
> >
> > Device: ThinkPad-E470
> > AppArmor: amd64 4.1.0~beta5-0ubuntu2
> > Distro: Ubuntu 25.04
> > Kernel 6.12.0-15-generic
> >
> > Relevant dmesg output:
> >>
> >> [ 8667.092192] audit: type=3D1400 audit(1740054455.567:405):
> apparmor=3D"DENIED" operation=3D"create" class=3D"net" profile=3D"wpa_sup=
plicant"
> pid=3D13506 comm=3D"wpa_supplicant" family=3D"netlink" sock_type=3D"raw" =
protocol=3D0
> requested=3D"create" denied=3D"create"
> >> [ 8667.092289] audit: type=3D1400 audit(1740054455.568:408):
> apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"wpa_supp=
licant"
> name=3D"/sys/devices/pci0000:00/0000:00:1d.3/0000:05:00.0/ieee80211/phy0/=
name"
> pid=3D13506 comm=3D"wpa_supplicant" requested_mask=3D"r" denied_mask=3D"r=
" fsuid=3D0
> ouid=3D0
> >> [ 8667.092303] audit: type=3D1400 audit(1740054455.568:409):
> apparmor=3D"DENIED" operation=3D"create" class=3D"net" profile=3D"wpa_sup=
plicant"
> pid=3D13506 comm=3D"wpa_supplicant" family=3D"inet" sock_type=3D"dgram" p=
rotocol=3D0
> requested=3D"create" denied=3D"create"
> >> [ 9502.961011] audit: type=3D1107 audit(1740055291.439:410): pid=3D132=
3
> uid=3D101 auid=3D4294967295 ses=3D4294967295 subj=3Dunconfined
> msg=3D'apparmor=3D"DENIED" operation=3D"dbus_method_call" bus=3D"system"
> path=3D"/fi/w1/wpa_supplicant1" interface=3D"org.freedesktop.DBus.Propert=
ies"
> member=3D"GetAll" name=3D":1.287" mask=3D"receive" pid=3D15679
> label=3D"wpa_supplicant" peer_pid=3D13634 peer_label=3D"unconfined"
> >
> >
> > wpa_supplicant systemctl status output:
> >>
> >> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]:
> socket(PF_INET,SOCK_DGRAM): Permission denied
> >> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]:
> socket(PF_INET,SOCK_DGRAM): Permission denied
> >> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0:
> Failed to initialize driver interface
> >> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0:
> CTRL-EVENT-DSCP-POLICY clear_all
> >> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: netlink:
> Failed to open netlink socket: Permission denied
> >> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: Failed to
> initialize driver 'nl80211'
> >> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]:
> socket(PF_INET,SOCK_DGRAM): Permission denied
> >> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]:
> socket(PF_INET,SOCK_DGRAM): Permission denied
> >> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0:
> Failed to initialize driver interface
> >> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0:
> CTRL-EVENT-DSCP-POLICY clear_all
> >
> >
> > NetworkManager systemctl status output:
> >>
> >> Feb 20 23:43:39 jordan-ThinkPad-E470 NetworkManager[16051]: <error>
> [1740055419.5700] device (wlp5s0): Couldn't initialize supplicant
> interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant
> couldn't grab this interface.
> >> Feb 20 23:43:49 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>
> [1740055429.5650] device (wlp5s0): re-acquiring supplicant interface (#2)=
.
> >> Feb 20 23:43:49 jordan-ThinkPad-E470 NetworkManager[16051]: <error>
> [1740055429.5660] device (wlp5s0): Couldn't initialize supplicant
> interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant
> couldn't grab this interface.
> >> Feb 20 23:43:59 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>
> [1740055439.5657] device (wlp5s0): re-acquiring supplicant interface (#3)=
.
> >> Feb 20 23:43:59 jordan-ThinkPad-E470 NetworkManager[16051]: <error>
> [1740055439.5714] device (wlp5s0): Couldn't initialize supplicant
> interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant
> couldn't grab this interface.
> >> Feb 20 23:44:09 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>
> [1740055449.5719] device (wlp5s0): re-acquiring supplicant interface (#4)=
.
> >> Feb 20 23:44:09 jordan-ThinkPad-E470 NetworkManager[16051]: <error>
> [1740055449.5763] device (wlp5s0): Couldn't initialize supplicant
> interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant
> couldn't grab this interface.
> >> Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>
> [1740055459.5658] device (wlp5s0): re-acquiring supplicant interface (#5)=
.
> >> Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: <error>
> [1740055459.5712] device (wlp5s0): Couldn't initialize supplicant
> interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant
> couldn't grab this interface.
> >> Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: <info>
> [1740055459.5713] device (wlp5s0): supplicant interface keeps failing,
> giving up
> >
> >
>

--00000000000086a616062ea3d4b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Awesome, thanks very much Ryan!</div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, Feb 21, 2025 at 4:00=E2=80=AFAM Ryan Lee &lt;<a href=3D"mailto:ryan.lee@=
canonical.com">ryan.lee@canonical.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hi Jordan,<br>
<br>
This is an issue that was reported in Launchpad at<br>
<a href=3D"https://bugs.launchpad.net/ubuntu/+source/apparmor/+bug/2098838"=
 rel=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net/ubuntu/+so=
urce/apparmor/+bug/2098838</a>. We<br>
are aware of what&#39;s broken and am working on a fixed AppArmor package<b=
r>
that should resolve this breakage.<br>
<br>
Ryan<br>
<br>
<br>
On Thu, Feb 20, 2025 at 5:49=E2=80=AFAM Jordan Esh &lt;<a href=3D"mailto:es=
h.jordan@gmail.com" target=3D"_blank">esh.jordan@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; I have recently upgraded to Ubuntu 25.04 (Plucky Puffin) on my laptop,=
 and have been unable to successfully enable Wi-Fi.<br>
&gt; After doing some digging, it seems that the configuration in the wpa_s=
upplicant profile for AppArmor might be the issue, as requests to create a =
netlink socket and open the HW device are being denied.<br>
&gt; I&#39;m new to AppArmor, but if somebody could point me in the right d=
irection, I&#39;m happy to test some changes to the profile and open a PR o=
n GitLab. Any help would be greatly appreciated :)<br>
&gt;<br>
&gt; Device: ThinkPad-E470<br>
&gt; AppArmor: amd64 4.1.0~beta5-0ubuntu2<br>
&gt; Distro: Ubuntu 25.04<br>
&gt; Kernel 6.12.0-15-generic<br>
&gt;<br>
&gt; Relevant dmesg output:<br>
&gt;&gt;<br>
&gt;&gt; [ 8667.092192] audit: type=3D1400 audit(1740054455.567:405): appar=
mor=3D&quot;DENIED&quot; operation=3D&quot;create&quot; class=3D&quot;net&q=
uot; profile=3D&quot;wpa_supplicant&quot; pid=3D13506 comm=3D&quot;wpa_supp=
licant&quot; family=3D&quot;netlink&quot; sock_type=3D&quot;raw&quot; proto=
col=3D0 requested=3D&quot;create&quot; denied=3D&quot;create&quot;<br>
&gt;&gt; [ 8667.092289] audit: type=3D1400 audit(1740054455.568:408): appar=
mor=3D&quot;DENIED&quot; operation=3D&quot;open&quot; class=3D&quot;file&qu=
ot; profile=3D&quot;wpa_supplicant&quot; name=3D&quot;/sys/devices/pci0000:=
00/0000:00:1d.3/0000:05:00.0/ieee80211/phy0/name&quot; pid=3D13506 comm=3D&=
quot;wpa_supplicant&quot; requested_mask=3D&quot;r&quot; denied_mask=3D&quo=
t;r&quot; fsuid=3D0 ouid=3D0<br>
&gt;&gt; [ 8667.092303] audit: type=3D1400 audit(1740054455.568:409): appar=
mor=3D&quot;DENIED&quot; operation=3D&quot;create&quot; class=3D&quot;net&q=
uot; profile=3D&quot;wpa_supplicant&quot; pid=3D13506 comm=3D&quot;wpa_supp=
licant&quot; family=3D&quot;inet&quot; sock_type=3D&quot;dgram&quot; protoc=
ol=3D0 requested=3D&quot;create&quot; denied=3D&quot;create&quot;<br>
&gt;&gt; [ 9502.961011] audit: type=3D1107 audit(1740055291.439:410): pid=
=3D1323 uid=3D101 auid=3D4294967295 ses=3D4294967295 subj=3Dunconfined msg=
=3D&#39;apparmor=3D&quot;DENIED&quot; operation=3D&quot;dbus_method_call&qu=
ot; bus=3D&quot;system&quot; path=3D&quot;/fi/w1/wpa_supplicant1&quot; inte=
rface=3D&quot;org.freedesktop.DBus.Properties&quot; member=3D&quot;GetAll&q=
uot; name=3D&quot;:1.287&quot; mask=3D&quot;receive&quot; pid=3D15679 label=
=3D&quot;wpa_supplicant&quot; peer_pid=3D13634 peer_label=3D&quot;unconfine=
d&quot;<br>
&gt;<br>
&gt;<br>
&gt; wpa_supplicant systemctl status output:<br>
&gt;&gt;<br>
&gt;&gt; Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: socket=
(PF_INET,SOCK_DGRAM): Permission denied<br>
&gt;&gt; Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: socket=
(PF_INET,SOCK_DGRAM): Permission denied<br>
&gt;&gt; Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0=
: Failed to initialize driver interface<br>
&gt;&gt; Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0=
: CTRL-EVENT-DSCP-POLICY clear_all<br>
&gt;&gt; Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: netlin=
k: Failed to open netlink socket: Permission denied<br>
&gt;&gt; Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: Failed=
 to initialize driver &#39;nl80211&#39;<br>
&gt;&gt; Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: socket=
(PF_INET,SOCK_DGRAM): Permission denied<br>
&gt;&gt; Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: socket=
(PF_INET,SOCK_DGRAM): Permission denied<br>
&gt;&gt; Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0=
: Failed to initialize driver interface<br>
&gt;&gt; Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0=
: CTRL-EVENT-DSCP-POLICY clear_all<br>
&gt;<br>
&gt;<br>
&gt; NetworkManager systemctl status output:<br>
&gt;&gt;<br>
&gt;&gt; Feb 20 23:43:39 jordan-ThinkPad-E470 NetworkManager[16051]: &lt;er=
ror&gt; [1740055419.5700] device (wlp5s0): Couldn&#39;t initialize supplica=
nt interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplican=
t couldn&#39;t grab this interface.<br>
&gt;&gt; Feb 20 23:43:49 jordan-ThinkPad-E470 NetworkManager[16051]: &lt;wa=
rn&gt;=C2=A0 [1740055429.5650] device (wlp5s0): re-acquiring supplicant int=
erface (#2).<br>
&gt;&gt; Feb 20 23:43:49 jordan-ThinkPad-E470 NetworkManager[16051]: &lt;er=
ror&gt; [1740055429.5660] device (wlp5s0): Couldn&#39;t initialize supplica=
nt interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplican=
t couldn&#39;t grab this interface.<br>
&gt;&gt; Feb 20 23:43:59 jordan-ThinkPad-E470 NetworkManager[16051]: &lt;wa=
rn&gt;=C2=A0 [1740055439.5657] device (wlp5s0): re-acquiring supplicant int=
erface (#3).<br>
&gt;&gt; Feb 20 23:43:59 jordan-ThinkPad-E470 NetworkManager[16051]: &lt;er=
ror&gt; [1740055439.5714] device (wlp5s0): Couldn&#39;t initialize supplica=
nt interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplican=
t couldn&#39;t grab this interface.<br>
&gt;&gt; Feb 20 23:44:09 jordan-ThinkPad-E470 NetworkManager[16051]: &lt;wa=
rn&gt;=C2=A0 [1740055449.5719] device (wlp5s0): re-acquiring supplicant int=
erface (#4).<br>
&gt;&gt; Feb 20 23:44:09 jordan-ThinkPad-E470 NetworkManager[16051]: &lt;er=
ror&gt; [1740055449.5763] device (wlp5s0): Couldn&#39;t initialize supplica=
nt interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplican=
t couldn&#39;t grab this interface.<br>
&gt;&gt; Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: &lt;wa=
rn&gt;=C2=A0 [1740055459.5658] device (wlp5s0): re-acquiring supplicant int=
erface (#5).<br>
&gt;&gt; Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: &lt;er=
ror&gt; [1740055459.5712] device (wlp5s0): Couldn&#39;t initialize supplica=
nt interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplican=
t couldn&#39;t grab this interface.<br>
&gt;&gt; Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: &lt;in=
fo&gt;=C2=A0 [1740055459.5713] device (wlp5s0): supplicant interface keeps =
failing, giving up<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--00000000000086a616062ea3d4b8--

