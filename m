Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D40A4294377
	for <lists+apparmor@lfdr.de>; Tue, 20 Oct 2020 21:47:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kUxb1-0004VR-5k; Tue, 20 Oct 2020 19:46:59 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1kUxax-0004VK-Os
 for apparmor@lists.ubuntu.com; Tue, 20 Oct 2020 19:46:55 +0000
Received: by mail-pj1-f45.google.com with SMTP id p3so1210166pjd.0
 for <apparmor@lists.ubuntu.com>; Tue, 20 Oct 2020 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=41v5GiLetaxHlrubdi/AvvpWLsYd/nODHvOoF6egTt8=;
 b=rOaZ2bs8slEHTAMi/iVmYMYTmi3aaNoB5cIEv80ta3S8GDDoItKgIcVY3doD4sqW2P
 m8a/g2RSgaVqZeKtf9so7McZGEoz5CpoZ9+dg+kHKlYMyShgOiDs0hM+mQjIisvwLTLV
 u7Ma2AS3b2FMFmOog8A3La1m08gWMcG1EcF9q3MT4LRPssGry/s30ru2TpIRts1Jl2nM
 OiDlPyIQDCpZqUjVtsA/Gt2qJaiJApXEVoTT8/zs3S47Ad6A/xB9roG1X3RkqXDg1K09
 aR+kVrh/I2G2xlsVfGDFfQkRVvknyehqXiHLu0o0UROAWd6dBVr10236A2vkoJcrNJcj
 5EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=41v5GiLetaxHlrubdi/AvvpWLsYd/nODHvOoF6egTt8=;
 b=idEnIf63ns/PlcwWtjCDsmYY+hQ/+UbMMaawKQu8j4pdGFiBSlU6bDs0JntFyzbIHQ
 egnGBSCAeFe/0RdFlGkTo5Jsbcbvj2Os4MUFu7aBcEw53jHInpyhD6js+X1Bwyc+8LQ9
 ZYjZi90s8NcGLhpJaMaakMLo5EDtS1NqcmARZ8GJAyy5x74Dl7WpsgdOmzWv8XA078wr
 pTfodb6Ak2DUK0ASGrepsoJrxFlp0MQ4xJY9R1lIipGXhVQmSMaaDMD4A2hNj/6QSnqR
 /MCd2WhtO9RXpgRokg0b7oBY9AOyvfoxhVtgWrTqgUcdZe2Uh9RZu5c6Eg6MZzCnxVTf
 9gCg==
X-Gm-Message-State: AOAM5325dB+ocirIv1xSkWPpo8lnMcSwBMNjj6JniE6OMYNH0KGGZRPs
 doYEwRjrBwSMOkV7k29HXPCZb1blUAixsamgr3o=
X-Google-Smtp-Source: ABdhPJyafac/O2zgZ55Gy9ajpgUwwBh6B1wj6QeqUwcZqMi4gbQAG+0GEwuVVmUsXLuneMcWXDSOuoVruewYJ97u5pI=
X-Received: by 2002:a17:90a:4b87:: with SMTP id
 i7mr4256211pjh.68.1603223213872; 
 Tue, 20 Oct 2020 12:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAJs3c4xwqOOLPVOW8bBPrpRkFceLYdFSgWmKBtwbu1o5vj4Fhw@mail.gmail.com>
 <f760dc51-7a5c-3162-2698-049710431dd6@canonical.com>
In-Reply-To: <f760dc51-7a5c-3162-2698-049710431dd6@canonical.com>
From: swarna latha <sswarnas@gmail.com>
Date: Tue, 20 Oct 2020 15:46:42 -0400
Message-ID: <CAJs3c4xz+Eb-LXZC4d6G=Pu8xXQeQaweQPbNE5Vngs7ywPxheg@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Received-SPF: pass client-ip=209.85.216.45; envelope-from=sswarnas@gmail.com;
 helo=mail-pj1-f45.google.com
Subject: Re: [apparmor] Regarding apparmor in container
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
Cc: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Content-Type: multipart/mixed; boundary="===============2719548653864953448=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============2719548653864953448==
Content-Type: multipart/alternative; boundary="000000000000289c6805b21f7ea1"

--000000000000289c6805b21f7ea1
Content-Type: text/plain; charset="UTF-8"

Thanks john for the quick reply..

My kernel version is 4.1.51-1.19

Tried below logging options, but didnt help. Not able to get logs, what is
blocking apparmor to play video.
 echo -n "noquiet" /sys/module/apparmor/parameters/audit
echo 0> /sys/module/apparmor/parameters/debug

On Tue, Oct 20, 2020 at 3:05 PM John Johansen <john.johansen@canonical.com>
wrote:

> On 10/20/20 9:12 AM, swarna latha wrote:
> > Hi,
> >
> > We are using apparmor to generate profile for a video application
> running in container.
> >
> > with apparmor in complaint mode, we see the video is not streaming, and
> we are not getting any apparmor logs. if we disable the apparmor profile,
> we see video streaming.
> >
> > Can you please let us know the reason for this behaviour... is it due to
> any permission issue or performance issue...
> >
> > if it is due to permission issue, why we are not getting apparmor logs
> in this case.
> >
>
> It is likely a permission issue but it is possible other parts of the
> kernel are interacting with apparmor
>
> what is your kernel version?
>
>
> As root can you enable debug mode,
>
>   echo 0> /sys/module/apparmor/parameters/debug
>
> this will give some logging output with extra info for so special cases.
>
> and can youturn off audit silencing
>
>   echo -n "noquiet" /sys/module/apparmor/parameters/audit
>
> this turns off deny rules silencing of denials.
>
>
> You can toggle these values live and do it one at a time if you like.
>

--000000000000289c6805b21f7ea1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks john for the quick reply..<div><br></div><div>My ke=
rnel version is=C2=A04.1.51-1.19</div><div><br></div><div>Tried below loggi=
ng options, but didnt help. Not able to get logs, what is blocking apparmor=
 to play video.</div><div>=C2=A0echo -n &quot;noquiet&quot; /sys/module/app=
armor/parameters/audit=C2=A0=C2=A0<br></div><div>echo 0&gt; /sys/module/app=
armor/parameters/debug=C2=A0=C2=A0<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 20, 2020 at 3:05 PM=
 John Johansen &lt;<a href=3D"mailto:john.johansen@canonical.com">john.joha=
nsen@canonical.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 10/20/20 9:12 AM, swarna latha wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; We are using apparmor to generate profile for a video application runn=
ing in container.<br>
&gt; <br>
&gt; with apparmor in complaint mode, we see the video is not streaming, an=
d we are not getting any apparmor logs. if we disable the apparmor profile,=
 we see video streaming.<br>
&gt; <br>
&gt; Can you please let us know the reason for this behaviour... is it due =
to any permission issue or performance issue...<br>
&gt; <br>
&gt; if it is due to permission issue, why we=C2=A0are not getting apparmor=
 logs in this case.<br>
&gt; <br>
<br>
It is likely a permission issue but it is possible other parts of the kerne=
l are interacting with apparmor<br>
<br>
what is your kernel version?<br>
<br>
<br>
As root can you enable debug mode,<br>
<br>
=C2=A0 echo 0&gt; /sys/module/apparmor/parameters/debug<br>
<br>
this will give some logging output with extra info for so special cases.<br=
>
<br>
and can youturn off audit silencing<br>
<br>
=C2=A0 echo -n &quot;noquiet&quot; /sys/module/apparmor/parameters/audit<br=
>
<br>
this turns off deny rules silencing of denials.<br>
<br>
<br>
You can toggle these values live and do it one at a time if you like.<br>
</blockquote></div>

--000000000000289c6805b21f7ea1--


--===============2719548653864953448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2719548653864953448==--

