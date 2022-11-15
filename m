Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E7162A406
	for <lists+apparmor@lfdr.de>; Tue, 15 Nov 2022 22:24:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ov3PR-0001Yw-G2; Tue, 15 Nov 2022 21:23:57 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sonixxfx@gmail.com>) id 1ov3PP-0001Yh-SA
 for apparmor@lists.ubuntu.com; Tue, 15 Nov 2022 21:23:56 +0000
Received: by mail-pl1-f180.google.com with SMTP id y4so14459253plb.2
 for <apparmor@lists.ubuntu.com>; Tue, 15 Nov 2022 13:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wTAJdzczVHQ4TehYkMx9OLw/PyoPfcpO4uKvQaa7T9A=;
 b=KISfiK+BQzElDwPKUh1SN34oB9vj8D7ERceB49kfTSwm+slt6E9P67BEeciEEF8gl0
 lNMZCLQNGIWXy0dcObD2ttrqHGUdQS6RHE0fIpYuVd1YyqdaZZvmA0HjBBrvPTfnOKVC
 TtPijEb7GStMI7liOy6vhOkODwFSq/tvDxL4zQT9cQ5kadcegLVTIEl19LnF60MVMpDU
 Wdzwoig5Y3aiH4BSLquNh0GDCJkl22Xye6JHMTMxvAE0cs2hbazVgepe+nInW+hD84YT
 dcCt/HFvJxc0xwI9eWkrTxB74qgTlDKOhF4Pa4vCqWYRRVMXbDQGsYH8d2gRLUW++6wy
 4Yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wTAJdzczVHQ4TehYkMx9OLw/PyoPfcpO4uKvQaa7T9A=;
 b=cTttxyahhhklNz5586crJ+N5nlEKPKI0Kt6qryFHvzvwGyS6hOaOuh/4oyvQcManB9
 k/ndaIEzJW8O48mPWZPyC44h8QqmjQZiv0Jc35lBlXOiNTG3DaU6xxefr4TvUqPNAsg1
 Gk4t/y+Ftc1sc4j1dfX9VxXrijgX5l2eJkJuBIdcup7ZDSiHyKOkFXYztW/2KvVrePvn
 fKNTt61h4HNM1fTD/1klVaeCJnjlKUtNPaO+9+Gc/gknXdAoGaw1cfTlTmL2K1pGbLpn
 B6ur61JhZruhY32VKHyLO8NSnOCLm4Y3nalpudR73sOcZsHcjHc4X+BcpedY49RUCbND
 v+7g==
X-Gm-Message-State: ANoB5pljcLP2vk0IUyaMLXFhuXea351RYOKL7CL4fe71F7oWyDwQQGhu
 wu0NJKpRdip4cVgPQNHLDyJ1rh8deQI2hnrCsiiKk31YGtKQheJ7
X-Google-Smtp-Source: AA0mqf61qk7S7lc+TOS5iDr5QyQPe3O7yGEHEruypVTchTE+thfSPQ0VrNDU8XFjW4hZFdNFjHTNECgJ0YfYfUxTB6o=
X-Received: by 2002:a17:90b:3947:b0:218:4e27:6f95 with SMTP id
 oe7-20020a17090b394700b002184e276f95mr254225pjb.173.1668547433357; Tue, 15
 Nov 2022 13:23:53 -0800 (PST)
MIME-Version: 1.0
References: <CAKO675mVM316f3jdy+6Fz4MKAkKP+rmEJKqhGPiBPiuM=3jAzQ@mail.gmail.com>
 <afb647b3-e9a7-24ae-0a94-99cdd2b02b49@canonical.com>
 <CAKO675=Pbn42nZ5d5ViqHXK4McPOyK2BXfh4dOFhp4xhUA=Ypg@mail.gmail.com>
In-Reply-To: <CAKO675=Pbn42nZ5d5ViqHXK4McPOyK2BXfh4dOFhp4xhUA=Ypg@mail.gmail.com>
From: Sonixxfx <sonixxfx@gmail.com>
Date: Tue, 15 Nov 2022 22:23:42 +0100
Message-ID: <CAKO675mn-0StCMUsxF1qO2mUDQK9jRPTB6AOeJiG-G9DGMGH2w@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="0000000000000e672b05ed88f961"
Received-SPF: pass client-ip=209.85.214.180; envelope-from=sonixxfx@gmail.com;
 helo=mail-pl1-f180.google.com
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

--0000000000000e672b05ed88f961
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Op di 15 nov. 2022 om 19:08 schreef Sonixxfx <sonixxfx@gmail.com

Sorry for mailing to you directly John.

Op di 15 nov. 2022 om 18:06 schreef John Johansen <
> john.johansen@canonical.com>:
>
>> On 11/15/22 06:30, Sonixxfx wrote:
>> > Hi,
>> >
>> > I was trying Apparmor today, but now my snaps won't run anymore. I hav=
e
>> tried a couple of things to solve it, including disabling Apparmor, but =
it
>> didn't help.
>> > When i try to start Brave for example dmesg shows me:
>> >
>>
>> how did you disable apparmor?
>>
>> systemctl disable apparmor
>>
>> or
>>
>> systemctl disable snapd.apparmor
>>
>> or
>>
>> systemctl stop apparmor
>>
>> or did you edit /etc/grub/defaults
>>
>>
> I ran
>
> sudo systemctl stop apparmor.service
>
> to disable Apparmor.
>
>
> I ran
>
> sudo systemctl disable apparmor.service
>
> to unload the kernel module.
>
>
> Should I have run:
>
> sudo systemctl disable snapd.apparmor ?
>
> > brave_brave.desktop[9095]: snap-confine has elevated permissions and is
>> not confined but should be. Refusing to continue to avoid permission
>> escalation attacks
>> > brave_brave.desktop[9095]: Please make sure that the snapd.apparmor
>> service is enabled and started.
>> >
>> > These messages are also shown when I have Apparmor enabled and started=
.
>> >
>>
>> what does aa-status return?
>>
>>
> I have already reinstalled my OS, sorry. But I am curious what you answer
> to my question.
>
>
>
>> > Can someone tell me how I can resolve this?
>> >
>>
>> so snaps by-pass the apparmor userspace service and only use the kernel
>> component. They run their own service to manage snap confinement. What d=
o
>> you get for
>>
>> systemctl status snapd.apparmor
>>
>>
>> and of course if it is not running you can do
>>
>> systemctl start snapd.apparmor
>>
>> or make sure it runs after reboot
>>
>> systemctl enable snapd.apparmor
>>
>>
> Thanks for the info =F0=9F=98=83
>

--0000000000000e672b05ed88f961
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Op di 15 nov. 2022 om 19:08 schreef Sonixxfx &lt;<a href=
=3D"mailto:sonixxfx@gmail.com">sonixxfx@gmail.com</a><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Sorry for mailing to you directly John.=
=C2=A0</div><div dir=3D"auto"><br></div><div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Op di 15 nov.=
 2022 om 18:06 schreef John Johansen &lt;<a href=3D"mailto:john.johansen@ca=
nonical.com" target=3D"_blank">john.johansen@canonical.com</a>&gt;:<br></di=
v><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 11/15/22 06:30, Sonixxfx wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I was trying Apparmor today, but now my snaps won&#39;t run anymore. I=
 have tried a couple of things to solve it, including=C2=A0disabling=C2=A0A=
pparmor, but it didn&#39;t help.<br>
&gt; When i try to start Brave for example dmesg shows me:<br>
&gt; <br>
<br>
how did you disable apparmor?<br>
<br>
systemctl disable apparmor<br>
<br>
or<br>
<br>
systemctl disable snapd.apparmor<br>
<br>
or<br>
<br>
systemctl stop apparmor<br>
<br>
or did you edit /etc/grub/defaults<br>
<br></blockquote><div><br></div><div>I ran=C2=A0</div><div><br></div><div>s=
udo systemctl stop apparmor.service=C2=A0</div><div><br></div><div>to disab=
le Apparmor.</div><div>=C2=A0</div><div><br></div><div>I ran</div><div><br>=
</div><div>sudo systemctl disable apparmor.service=C2=A0</div><div><br></di=
v><div>to unload the kernel module.</div><div><br></div><div><br></div><div=
>Should I have run:</div><div><br></div><div>sudo systemctl disable snapd.a=
pparmor ?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt; brave_brave.desktop[9095]: snap-confine has elevated permissions and i=
s not confined but should be. Refusing to continue to avoid permission esca=
lation attacks<br>
&gt; brave_brave.desktop[9095]: Please make sure that the snapd.apparmor se=
rvice is enabled and started.<br>
&gt; <br>
&gt; These messages are also shown when I have Apparmor enabled and started=
.<br>
&gt; <br>
<br>
what does aa-status return?<br>
<br></blockquote><div><br></div><div>I have already reinstalled my OS, sorr=
y. But I am curious what you answer to my question.</div><div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Can someone tell me how I can resolve this?<br>
&gt; <br>
<br>
so snaps by-pass the apparmor userspace service and only use the kernel com=
ponent. They run their own service to manage snap confinement. What do you =
get for<br>
<br>
systemctl status snapd.apparmor<br>
<br>
<br>
and of course if it is not running you can do<br>
<br>
systemctl start snapd.apparmor<br>
<br>
or make sure it runs after reboot<br>
<br>
systemctl enable snapd.apparmor<br>
<br></blockquote><div><br></div><div>Thanks for the info =F0=9F=98=83</div>=
</div></div>
</blockquote></div></div>

--0000000000000e672b05ed88f961--

