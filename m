Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 091D929446C
	for <lists+apparmor@lfdr.de>; Tue, 20 Oct 2020 23:17:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kUz0A-0004Vn-Ky; Tue, 20 Oct 2020 21:17:02 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1kUz07-0004TS-PF
 for apparmor@lists.ubuntu.com; Tue, 20 Oct 2020 21:16:59 +0000
Received: by mail-pl1-f174.google.com with SMTP id y1so52505plp.6
 for <apparmor@lists.ubuntu.com>; Tue, 20 Oct 2020 14:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=iWjvhWhnAdwK0CM+hApN4Oiu5vSt/Zst+wTFq62Kg68=;
 b=KDX1DGaHSvUgHJqGIJ/Ha0Yo6JZ7WJHG0FciL+8H/OlHJnv9SgzaWnQNYLdA4hslZa
 UymYKYms+fppBhjwN0OgXDxjTOpGx8RIZqhT15A88WvjNdswvDjdhTKGuInf/fKill4v
 +7D0VnHE8ATCWbnPq4PfdUlv6grc9XWYQQELwUUZ7wMj0Pbctx7suOCWloYahN+avHAV
 ERtU8XEIteuf29YE/YYF8WEnaQOd0sL6A4NviD4I//l3nSwr4+xH8BOO38FQiC+j02J0
 pcr/iuAOKLpHhunlbbcLaJg5OORqVqcYvA7RQ2y5/u8hAULGXGtDDaYulOtDrY57axM/
 leDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=iWjvhWhnAdwK0CM+hApN4Oiu5vSt/Zst+wTFq62Kg68=;
 b=CJpOASISCF+18+x2qi8atHoFEu9yTZe2RQRs6C2YNSCN2nQFV4xeMPFz8R8IWer5wR
 j3FzpN8Z0p5Go/Lxs22XvajDgR+mLCCi5k7iC1vMhGKIHWi4jKl/FMDl4is5xHL5JmEV
 7ikQ2EoOivvoW20mHhmsQz8a/2h2yOhTs9eexvQimCL1xj/W9p/hhybwhDYYlJdWfYyA
 Ez5XHHtZNt26wADkAPbuuJtztFaEwg9IO8v8ZveZl4LmUXlrEeDtJcscSjcfY8zpR9SI
 1oCud4B+meJqDO6/pZ70yAZR3qK7oBI16wKqqaZpsZnvU29dwdwHOOYqNgJT6zBGc0ws
 9vgQ==
X-Gm-Message-State: AOAM533g2ZmnLo2Xb0NM+ClcYmydA0Ih9a8A4TdVjL86i7cLH3s3DjhU
 06zsVby5ygZJu8ndkw/r8WFhhmfAhtv8LAtuXdc=
X-Google-Smtp-Source: ABdhPJxs5PoaYy/1ZV0UvRdW/na6OqA3Mayd03KmWvSwPVPtIb2naTZ5YWTVlCGWOwztw2I7PrvNpa6y1E/AFoF2S1U=
X-Received: by 2002:a17:902:a3c9:b029:d5:df0c:f217 with SMTP id
 q9-20020a170902a3c9b02900d5df0cf217mr5681plb.59.1603228617758; Tue, 20 Oct
 2020 14:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAJs3c4xwqOOLPVOW8bBPrpRkFceLYdFSgWmKBtwbu1o5vj4Fhw@mail.gmail.com>
 <f760dc51-7a5c-3162-2698-049710431dd6@canonical.com>
 <CAJs3c4xz+Eb-LXZC4d6G=Pu8xXQeQaweQPbNE5Vngs7ywPxheg@mail.gmail.com>
 <a7eff0c0-b372-4f63-266a-daddbc2aeded@sdeziel.info>
 <ce387075-b00c-1211-ae18-223fb8bae115@canonical.com>
In-Reply-To: <ce387075-b00c-1211-ae18-223fb8bae115@canonical.com>
From: swarna latha <sswarnas@gmail.com>
Date: Tue, 20 Oct 2020 17:16:46 -0400
Message-ID: <CAJs3c4x9U4T_RqdgPMQbogJwn_ysH-qw4FD2Kgp1peOBomU-hA@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.214.174; envelope-from=sswarnas@gmail.com;
 helo=mail-pl1-f174.google.com
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
Content-Type: multipart/mixed; boundary="===============8070819483759352113=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8070819483759352113==
Content-Type: multipart/alternative; boundary="000000000000415da005b220c0e0"

--000000000000415da005b220c0e0
Content-Type: text/plain; charset="UTF-8"

Hi,

i see similar behaviour, i am not able to use mrCx, mrUx options to capture
the apparmor logs of the process inside container.

The process in the container is executed only if give ix. But i am not
getting apparmor logs of this process.

is there any patch i can apply on 4.1 kernel to capture apparmor logs for
this process.

Thanks,
Swarna

On Tue, Oct 20, 2020 at 4:55 PM John Johansen <john.johansen@canonical.com>
wrote:

> oops forgot to check that you were in the reply, so this only went to
> simon and the list
>
> On 10/20/20 12:55 PM, Simon Deziel wrote:
> > On 2020-10-20 3:46 p.m., swarna latha wrote:
> >> Thanks john for the quick reply..
> >>
> >> My kernel version is 4.1.51-1.19
> >>
> >> Tried below logging options, but didnt help. Not able to get logs, what
> is
> >> blocking apparmor to play video.
> >>  echo -n "noquiet" /sys/module/apparmor/parameters/audit
> >> echo 0> /sys/module/apparmor/parameters/debug
> >
> > So far, what I've seen with containers is that dmesg/kernel logs are
> > only visible from the host's context, not the containers themselves.
> >
>
> this is usually true. In addition are you getting no apparmor logs, or
> just no apparmor log for this issue. Those are two different things to
> debug.
>
> With that said I suspect the issue is NO_NEW_PRIVS, see prctl(2). When
> that is set apparmor can not transition its profile, and will fail execs
> that request a profile transition.
>
> Looking at the 4.1 kernel apparmor is not auditing NO_NEW_PRIVS
> causing a failure in profile transitions (its an external restriction
> and not exactly part of apparmor). Which would also align with what
> you are seeing.
>
> When it comes to NO_NEW_PRIVS on the 4.1 kernel you basically have
> three choices.
>
> 1. Don't transition the profile, use ix
>
> 2. transition the profile before the container does
>     prctl(PR_SET_NO_NEW_PRIVS).
>
> 3. If a container task is unconfined it can transition into a
>    profile even after NO_NEW_PRIVS is set but once it does that it
>    won't be able to transition the profile again.
>
> --
> AppArmor mailing list
> AppArmor@lists.ubuntu.com
> Modify settings or unsubscribe at:
> https://lists.ubuntu.com/mailman/listinfo/apparmor
>

--000000000000415da005b220c0e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>i see similar beha=
viour, i am not able to use mrCx, mrUx options to capture the apparmor logs=
 of the process inside container.</div><div><br></div><div>The process in t=
he container is executed only if give ix. But i am not getting apparmor log=
s of this process.</div><div><br></div><div>is there any patch i can apply =
on 4.1 kernel to capture apparmor logs for this process.</div><div><br></di=
v><div>Thanks,</div><div>Swarna</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 20, 2020 at 4:55 PM John J=
ohansen &lt;<a href=3D"mailto:john.johansen@canonical.com">john.johansen@ca=
nonical.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">oops forgot to check that you were in the reply, so this only we=
nt to<br>
simon and the list<br>
<br>
On 10/20/20 12:55 PM, Simon Deziel wrote:<br>
&gt; On 2020-10-20 3:46 p.m., swarna latha wrote:<br>
&gt;&gt; Thanks john for the quick reply..<br>
&gt;&gt;<br>
&gt;&gt; My kernel version is 4.1.51-1.19<br>
&gt;&gt;<br>
&gt;&gt; Tried below logging options, but didnt help. Not able to get logs,=
 what is<br>
&gt;&gt; blocking apparmor to play video.<br>
&gt;&gt;=C2=A0 echo -n &quot;noquiet&quot; /sys/module/apparmor/parameters/=
audit<br>
&gt;&gt; echo 0&gt; /sys/module/apparmor/parameters/debug<br>
&gt; <br>
&gt; So far, what I&#39;ve seen with containers is that dmesg/kernel logs a=
re<br>
&gt; only visible from the host&#39;s context, not the containers themselve=
s.<br>
&gt; <br>
<br>
this is usually true. In addition are you getting no apparmor logs, or<br>
just no apparmor log for this issue. Those are two different things to<br>
debug.<br>
<br>
With that said I suspect the issue is NO_NEW_PRIVS, see prctl(2). When<br>
that is set apparmor can not transition its profile, and will fail execs<br=
>
that request a profile transition. <br>
<br>
Looking at the 4.1 kernel apparmor is not auditing NO_NEW_PRIVS<br>
causing a failure in profile transitions (its an external restriction<br>
and not exactly part of apparmor). Which would also align with what<br>
you are seeing.<br>
<br>
When it comes to NO_NEW_PRIVS on the 4.1 kernel you basically have<br>
three choices.<br>
<br>
1. Don&#39;t transition the profile, use ix<br>
<br>
2. transition the profile before the container does<br>
=C2=A0 =C2=A0 prctl(PR_SET_NO_NEW_PRIVS).<br>
<br>
3. If a container task is unconfined it can transition into a<br>
=C2=A0 =C2=A0profile even after NO_NEW_PRIVS is set but once it does that i=
t<br>
=C2=A0 =C2=A0won&#39;t be able to transition the profile again.<br>
<br>
-- <br>
AppArmor mailing list<br>
<a href=3D"mailto:AppArmor@lists.ubuntu.com" target=3D"_blank">AppArmor@lis=
ts.ubuntu.com</a><br>
Modify settings or unsubscribe at: <a href=3D"https://lists.ubuntu.com/mail=
man/listinfo/apparmor" rel=3D"noreferrer" target=3D"_blank">https://lists.u=
buntu.com/mailman/listinfo/apparmor</a><br>
</blockquote></div></div>

--000000000000415da005b220c0e0--


--===============8070819483759352113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8070819483759352113==--

