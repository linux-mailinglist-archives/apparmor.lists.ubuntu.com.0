Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D825E729A
	for <lists+apparmor@lfdr.de>; Fri, 23 Sep 2022 05:58:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1obZpN-0005Q5-Cs; Fri, 23 Sep 2022 03:58:13 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1obZpL-0005Px-Pm
 for apparmor@lists.ubuntu.com; Fri, 23 Sep 2022 03:58:11 +0000
Received: by mail-pj1-f47.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so4463520pjq.3
 for <apparmor@lists.ubuntu.com>; Thu, 22 Sep 2022 20:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=coqYnBiRW0+A3LjEd6r4BV1DAvQZSVic/4WCsRiisSI=;
 b=XjZNS2JWEjQHbg8baI17xgVK72bcPST2AoCltwJi0di7ogZwmB1lN0PWlQg8lPseH3
 erTnzBI5aZiWr80uMn5TJ0bTaMG3/PrtXpC0gg1VYd3usxN/aooB/UxolhWMqNOMaf2p
 5huOD6cw8hVgqzBE3qwvu4PiGfvVWEsucuhHcvTKXxcMl73nn/vXKW5DZ9ve3p9hMQl9
 53GEkl5+ugVevpCEnYncOBim8jR6IJovmPplmsWDiDXcbQGpS+vWeoHuDrKeP9chQLnQ
 lVeH5NBbfZDFWVhj4nnFr6rO/W8qETK2PZeTOgaRpGF6ZwpqioFd7xtXrr6NvvD96QIS
 PAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=coqYnBiRW0+A3LjEd6r4BV1DAvQZSVic/4WCsRiisSI=;
 b=fSnNZ9RiGaJWx5nrOAPXaHTOcMa8ajVaYSM1CG0lnLoZach9DrvleM5azYUgqVa/1r
 OSinMGoJV6upCpgOqXtiyPcRthfZSIaSOMqmypRIx05oZ1mU1CgATJmgkWeS/umbVN7I
 4fmcPm8UYJpkAdgXyGHluwqw9REzJxyM7+OgZ5nMpE2zfizu+72GWheN6XH4LlKyfF3j
 CCWrds+2eMPp5kEC6f8Da+U1q4C2xFWedKBnW6jEUITbdQSIpZwlVgqGqFoBuhHqiGsY
 3wcdQKrewA5DX0Uv4KR5OMw2yoYeJhzOqBfrBqxzl4mer/Y73tNHtf+svF4TBX1qlbfU
 isPw==
X-Gm-Message-State: ACrzQf2sRXq/I7sTtNwgjkPAfvAG78jDe5JxaqA/OZ+JqjysnC+Rt8dB
 742R8cMNPzZjuzQdxZpwBRLdP14VOM4a+WRbXMQ3+XeI
X-Google-Smtp-Source: AMsMyM6LxDwvmORV67fQ+S2uKBT7GG9syFZJhtuVdn7DVcYlpYFT1Y5WWwkZuf+8cruNOMztJaXAeqhnxyM1x7M+UFM=
X-Received: by 2002:a17:902:e494:b0:178:5b6d:636 with SMTP id
 i20-20020a170902e49400b001785b6d0636mr6342324ple.64.1663905489856; Thu, 22
 Sep 2022 20:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ7h_jsi4spSXwygYs4Bz8i8TzphvqRaiCYEVgc+sE2wsQ@mail.gmail.com>
 <20220922210004.GA473551@millbarge>
 <CAODFaZ5pjHP+-afASNLU8oopWYfBZmChQ2eE-ASyPgtFBqcHHA@mail.gmail.com>
 <20220923002148.GA618690@millbarge>
In-Reply-To: <20220923002148.GA618690@millbarge>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Thu, 22 Sep 2022 23:57:59 -0400
Message-ID: <CAODFaZ74YqWTbjtC8p1G9+b5DCimtUWt4p3Fzjqi55Q70Wn4Eg@mail.gmail.com>
To: Seth Arnold <seth.arnold@canonical.com>
Content-Type: multipart/alternative; boundary="000000000000a9abfd05e9502fde"
Received-SPF: pass client-ip=209.85.216.47;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-pj1-f47.google.com
Subject: Re: [apparmor] Apparmor : Common Query
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

--000000000000a9abfd05e9502fde
Content-Type: text/plain; charset="UTF-8"

Thanks Seth

On Thu, Sep 22, 2022, 8:21 PM Seth Arnold <seth.arnold@canonical.com> wrote:

> On Thu, Sep 22, 2022 at 07:16:32PM -0400, Murali Selvaraj wrote:
> > -> How do we approach preparing an Apparmor profile for a shell script as
> > the first time I am doing this.
> > -> As our embedded device like legacy and many scripts internally invokes
> > few other scripts based on the different scenarios.
> > -> In such cases, do we have any suggestion to generate an Apparmor
> profile
> > for shell script or any example in our earlier forum queries (If
> possible,
> > please share here as I could not find it).
>
> What will execute your shell script? is it already confined? How you start
> to write the profile depends upon how the script is executed.
>
> The easiest is to use complain mode and the interactive tools to get most
> of the way there. This can work great if the script is launched via a
> systemd service, or by a daemon that accepts on-demand commands to run
> it, etc. If it's run via sysv-init or other unusual process supervisor
> system it might be a challenge to get the execution environment close
> to production use.
>
> If it's run by a systemd service, something like the following might work:
>
> in one terminal:
> sudo aa-genprof /path/to/shell/script.sh
>
> in another terminal:
> sudo systemctl start servicename
> sudo systemctl stop servicename
>
> return to the first terminal and answer the questions.
>
> Then repeat the start process, interact with whatever service it provides
> a little bit, then stop it again, and then answer more genprof questions.
>
> Hopefully you can iterate to something that's pretty close to final
> quality this way.
>
> If your script isn't started via a 'clean' process supervisor like
> systemd, you may need to write a complain mode profile by hand, reboot,
> use aa-logprof to get questions / answers; and repeat via repeated
> reboots.
>
> I hope this helps.
>
> Thanks
>

--000000000000a9abfd05e9502fde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks Seth</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Sep 22, 2022, 8:21 PM Seth Arnold &lt=
;<a href=3D"mailto:seth.arnold@canonical.com">seth.arnold@canonical.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Sep 22, 2022 at=
 07:16:32PM -0400, Murali Selvaraj wrote:<br>
&gt; -&gt; How do we approach preparing an Apparmor profile for a shell scr=
ipt as<br>
&gt; the first time I am doing this.<br>
&gt; -&gt; As our embedded device like legacy and many scripts internally i=
nvokes<br>
&gt; few other scripts based on the different scenarios.<br>
&gt; -&gt; In such cases, do we have any suggestion to generate an Apparmor=
 profile<br>
&gt; for shell script or any example in our earlier forum queries (If possi=
ble,<br>
&gt; please share here as I could not find it).<br>
<br>
What will execute your shell script? is it already confined? How you start<=
br>
to write the profile depends upon how the script is executed.<br>
<br>
The easiest is to use complain mode and the interactive tools to get most<b=
r>
of the way there. This can work great if the script is launched via a<br>
systemd service, or by a daemon that accepts on-demand commands to run<br>
it, etc. If it&#39;s run via sysv-init or other unusual process supervisor<=
br>
system it might be a challenge to get the execution environment close<br>
to production use.<br>
<br>
If it&#39;s run by a systemd service, something like the following might wo=
rk:<br>
<br>
in one terminal:<br>
sudo aa-genprof /path/to/shell/script.sh<br>
<br>
in another terminal:<br>
sudo systemctl start servicename<br>
sudo systemctl stop servicename<br>
<br>
return to the first terminal and answer the questions.<br>
<br>
Then repeat the start process, interact with whatever service it provides<b=
r>
a little bit, then stop it again, and then answer more genprof questions.<b=
r>
<br>
Hopefully you can iterate to something that&#39;s pretty close to final<br>
quality this way.<br>
<br>
If your script isn&#39;t started via a &#39;clean&#39; process supervisor l=
ike<br>
systemd, you may need to write a complain mode profile by hand, reboot,<br>
use aa-logprof to get questions / answers; and repeat via repeated<br>
reboots.<br>
<br>
I hope this helps.<br>
<br>
Thanks<br>
</blockquote></div>

--000000000000a9abfd05e9502fde--

