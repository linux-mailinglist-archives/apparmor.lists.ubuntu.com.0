Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B092586B0
	for <lists+apparmor@lfdr.de>; Tue,  1 Sep 2020 06:09:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kCxby-0000CP-8d; Tue, 01 Sep 2020 04:09:34 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1kCxbv-0000CC-Om
 for apparmor@lists.ubuntu.com; Tue, 01 Sep 2020 04:09:31 +0000
Received: by mail-pl1-f173.google.com with SMTP id q3so4304030pls.11
 for <apparmor@lists.ubuntu.com>; Mon, 31 Aug 2020 21:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OE6kfl/J+R+g/B1DO8Orlsd7sNdH6DFhA0blYs8Br1M=;
 b=UUWT/BPBP00bJsMEs7QQs9E11q9YIACuSRAymXyPPs9XqzxMcAvx8rKO/pUQErmBc4
 rs7YJ6PBRgyUl2J8/dwXnF/GAJUX48zibAZpcDABswBxiAv2HS6JhrGyo3XDKV/q0ss8
 Zum0O4DL+tmY3RSz1OtXQhtsl/ZtVhPhwBdW7Zl4wyP6eKMfkGBZ5j5mOi0ce0yhgbpI
 7/oclyEUlPB25x5U9Oz8LosXJPtbcjeFAlAe7n090JTyB6PeHSrGo6VqGJ7gmO9I/XZo
 e13VR5WvFo07sFRaRzX8pEFmAP8wY27UvsyzR2fP8zjgHNTcWp6TJUD/rTW8BcpUhqeH
 guoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OE6kfl/J+R+g/B1DO8Orlsd7sNdH6DFhA0blYs8Br1M=;
 b=bTFuuP8sq6k4c1KQuWqouNdrGWgvexSwle5QqRdDHAX0eMm9rWLct5jUw7SVdciRRa
 GIeYlfOGd1V8b7wuFPIuA4ARkZ2Zt21Eeo6RZZHiWIFj7dW8TBR0nYQbtWxoRv1UnQon
 UR223v0P1dVLafNLi8HGYx1oC2B5Gre/eTBUtZWRkJjhQ8uGCpUww+85lEvMXYfDJ8/y
 MklKbxHQrmLytHaPySfRcKXRCR3N8xToVnbxMqbldwscFgKoovwG0jfRzPQWNniqg/D7
 KQPNxOMGOp5nKIrOrLkv9GVZvUc1tJhEflvoD5eK42zGh1gIJJWpJTc4R9msO767W+l0
 uWtg==
X-Gm-Message-State: AOAM531SFHfEJn/ImEmTlPAbYUiVr+UJ7Lkil1tUuK3TUJFnP/A6kslf
 rtOsJgjgi0IGX55vYrlPELu3ybH85HTFKS1bq4c=
X-Google-Smtp-Source: ABdhPJwGa3gx86sfnpJUJkvQVjmayuSOontiVOsPSLOenTxfrLfS0jelesuWoeLNmAt+txN89d7KqamLQd9G6/8IDcA=
X-Received: by 2002:a17:90a:4a97:: with SMTP id
 f23mr147460pjh.138.1598933369498; 
 Mon, 31 Aug 2020 21:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAJs3c4ymSpu5esJ2BV4YGLxuug-OLsMOqite02qKgWS4HSFDNA@mail.gmail.com>
 <20200901012007.GA2884930@millbarge>
 <CAJs3c4yASMzrZ40dAsZN7q3BTbDa+M+cpbVqFCzQG8pwaz027w@mail.gmail.com>
 <20200901032652.GC2884930@millbarge>
In-Reply-To: <20200901032652.GC2884930@millbarge>
From: swarna latha <sswarnas@gmail.com>
Date: Tue, 1 Sep 2020 00:09:18 -0400
Message-ID: <CAJs3c4zxqLheunm+Kw4nBAJc2h=_qUpKpaAsL82bR6QSSWxfwg@mail.gmail.com>
To: Seth Arnold <seth.arnold@canonical.com>
Received-SPF: pass client-ip=209.85.214.173; envelope-from=sswarnas@gmail.com;
 helo=mail-pl1-f173.google.com
Subject: Re: [apparmor] Apparmor profile enforce issue,
 when changing from root to non-root
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
Content-Type: multipart/mixed; boundary="===============3403360217719126186=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============3403360217719126186==
Content-Type: multipart/alternative; boundary="0000000000008231f405ae38afb6"

--0000000000008231f405ae38afb6
Content-Type: text/plain; charset="UTF-8"

Yes Seth.

My system works fine if the capability line is in the profile.

Below are my two queries...

1. Is listing all the capabilities same as adding the "capability, " line.
I dont see the same behaviour. Listing all the capabs is not working,
whereas
    adding the capability, line works
2. I am not able to identify the required capability from apparmor logs.
Ideally we should see it in the capable operation ? Is there any scenario
where
    capability is used, and apparmor does not log it...

Thanks,
Swarna
On Mon, Aug 31, 2020 at 11:26 PM Seth Arnold <seth.arnold@canonical.com>
wrote:

> On Mon, Aug 31, 2020 at 10:34:46PM -0400, swarna latha wrote:
> > I am getting the complete set of libraries used by my process with
> status=
> > AUDIT, right from /etc/ld.so.cache. It looks to me as though the profile
> is
> > not applied, though i have rules allowing the /etc/ld.so cache access.
> >
> > As i have these file entries in my profile, i am not getting
> > ALLOWED/DENIED, hence not able to regenerate the profile with these
> events.
>
> Hello Swarna, so, is it the case that your system works fine when the
> 'capability,' line is in the profile, but when you remove it and reload
> the profile, the application doesn't start *and* doesn't log anything
> different?
>
> Thanks
>

--0000000000008231f405ae38afb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes Seth.</div><div><br></div><div>My system works fi=
ne if the capability line is in the profile.</div><div><br></div><div>Below=
 are my two queries...</div><div><br></div><div>1. Is listing all the capab=
ilities same as adding the &quot;capability, &quot; line. I dont=C2=A0see t=
he same behaviour. Listing all the capabs is not working, whereas</div><div=
>=C2=A0 =C2=A0 adding the capability, line works</div><div>2. I am not able=
 to identify the required capability=C2=A0from apparmor logs. Ideally we sh=
ould see it in the capable operation ? Is there any scenario where</div><di=
v>=C2=A0 =C2=A0 capability is used, and apparmor does not log it...</div><d=
iv><br></div>Thanks,<div>Swarna<br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Aug 31, 2020 at 11:26 PM Seth Arnold &lt;<=
a href=3D"mailto:seth.arnold@canonical.com">seth.arnold@canonical.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon=
, Aug 31, 2020 at 10:34:46PM -0400, swarna latha wrote:<br>
&gt; I am getting the complete set of libraries used by my process with sta=
tus=3D<br>
&gt; AUDIT, right from /etc/ld.so.cache. It looks to me as though the profi=
le is<br>
&gt; not applied, though i have rules allowing the /etc/ld.so cache access.=
<br>
&gt; <br>
&gt; As i have these file entries in my profile, i am not getting<br>
&gt; ALLOWED/DENIED, hence not able to regenerate the profile with these ev=
ents.<br>
<br>
Hello Swarna, so, is it the case that your system works fine when the<br>
&#39;capability,&#39; line is in the profile, but when you remove it and re=
load<br>
the profile, the application doesn&#39;t start *and* doesn&#39;t log anythi=
ng<br>
different?<br>
<br>
Thanks<br>
</blockquote></div></div></div>

--0000000000008231f405ae38afb6--


--===============3403360217719126186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3403360217719126186==--

