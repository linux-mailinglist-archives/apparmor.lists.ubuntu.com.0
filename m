Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB7294D6A
	for <lists+apparmor@lfdr.de>; Wed, 21 Oct 2020 15:23:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kVE5X-00076R-Ll; Wed, 21 Oct 2020 13:23:35 +0000
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1kVE5V-000768-7Y
 for apparmor@lists.ubuntu.com; Wed, 21 Oct 2020 13:23:33 +0000
Received: by mail-pf1-f179.google.com with SMTP id e10so1489822pfj.1
 for <apparmor@lists.ubuntu.com>; Wed, 21 Oct 2020 06:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pLXYRclvBmr/j2zmjdIsgRagLOuQna4KaHQ4L8GjiTY=;
 b=SI9nf/dvT1OwlhTO2NGY8FJ+n8wyDtd0d+wcB6YIbMQN2eISgC60P+tQ3CdfRm/Yg7
 G/69nq2S6Ci/cugNiTTp1hp/V2VpXVeF2DJzyoWyWNeK+AtswBM7YrZjhr6wlpiDhx5p
 tr2PW7YKFOpcf/0b5H+QGhVN3/WgVDagJd/lNtkvcaWQ1IsB83JVxSeUlCcdTkGoRnho
 gGDtbSeg5sdssr0exd0NVHVn00OYwJoF9ls6DdgT8AgYBdcBlOWy0pXeBLrESj/LAE/K
 MYFhc/z0T+WfcSaWzgA+vrck+1xTBwIK0wIBXNb6bjJQ1PJq/b/cY0URqMyLnZBypxYv
 ePaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLXYRclvBmr/j2zmjdIsgRagLOuQna4KaHQ4L8GjiTY=;
 b=Wy6dCS0ePwPu9DTofB+xLqYVVcqP+VPoBGD5AB1n6blRhV9b2XC7oxWc7/+xRBc4cl
 5zsfb2UPHNg52ZWRiGjGn0BfWE7p6wtrClCBOOOL0R03fkVkrrKQTdxuZ+hZKrFyjgj6
 6cv2NaaUE5GUft69Sm6vXLYUO5bMWf1RvxG2LsKbOIWyBLQn0Nb3syxv+ifI3Nj/c2eJ
 Ab30gXf5AmZAz2iSDpIiVErecWeKx9NiLf0q2vdYDGXB0s7cCdcqfuTDGYbKDC5Lx8oJ
 eznNZGiIx1GCjWN9EkN/Z39uAwZSeEqpWt+gMngVeeeDGBV93GLPAnf541vGwvCVm+oK
 jOYw==
X-Gm-Message-State: AOAM5330DVKOVfniWLcTVjivZgjar5otHx6nKhuiOUZTFUkB7akwQ0sa
 0RUUFFuoy04m2NZYGznsyPOm4GjlbalV1PtEu1E=
X-Google-Smtp-Source: ABdhPJwCGnXghcDuuaFgTMA1NtUqANOIO4Gt519jCGMAsyTZjt36+vtCMKZUuUWbGkCAEQVLB5KSu6ssigcIQGNAc5o=
X-Received: by 2002:a63:3193:: with SMTP id x141mr3400355pgx.254.1603286611219; 
 Wed, 21 Oct 2020 06:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAJs3c4xwqOOLPVOW8bBPrpRkFceLYdFSgWmKBtwbu1o5vj4Fhw@mail.gmail.com>
 <f760dc51-7a5c-3162-2698-049710431dd6@canonical.com>
 <CAJs3c4xz+Eb-LXZC4d6G=Pu8xXQeQaweQPbNE5Vngs7ywPxheg@mail.gmail.com>
 <a7eff0c0-b372-4f63-266a-daddbc2aeded@sdeziel.info>
 <ce387075-b00c-1211-ae18-223fb8bae115@canonical.com>
 <CAJs3c4x9U4T_RqdgPMQbogJwn_ysH-qw4FD2Kgp1peOBomU-hA@mail.gmail.com>
 <29810ef4-4f69-0ed4-e9dc-6026ddb4c0ee@canonical.com>
In-Reply-To: <29810ef4-4f69-0ed4-e9dc-6026ddb4c0ee@canonical.com>
From: swarna latha <sswarnas@gmail.com>
Date: Wed, 21 Oct 2020 09:23:20 -0400
Message-ID: <CAJs3c4y66-eOOg=qGO3yCXPEPMAwczw87FSM4E3Jij+baKzNDQ@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Received-SPF: pass client-ip=209.85.210.179; envelope-from=sswarnas@gmail.com;
 helo=mail-pf1-f179.google.com
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
Cc: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="===============1699595917229569545=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============1699595917229569545==
Content-Type: multipart/alternative; boundary="000000000000ef567705b22e40c5"

--000000000000ef567705b22e40c5
Content-Type: text/plain; charset="UTF-8"

Thanks john, that will be of great help.

I am trying to capture apparmor profile for hardening container, and i was
not able to get the complete profile.



On Tue, Oct 20, 2020 at 5:38 PM John Johansen <john.johansen@canonical.com>
wrote:

> On 10/20/20 2:16 PM, swarna latha wrote:
> > Hi,
> >
> > i see similar behaviour, i am not able to use mrCx, mrUx options to
> capture the apparmor logs of the process inside container.
> >
> > The process in the container is executed only if give ix. But i am not
> getting apparmor logs of this process.
> >
> that pretty much says you are hitting NO_NEW_PRIVS
>
> > is there any patch i can apply on 4.1 kernel to capture apparmor logs
> for this process.
>
> We can certainly create a patch to log something. Let me see what I can
> cherry-pick/backport to 4.1
>
> >
> > Thanks,
> > Swarna
> >
> > On Tue, Oct 20, 2020 at 4:55 PM John Johansen <
> john.johansen@canonical.com <mailto:john.johansen@canonical.com>> wrote:
> >
> >     oops forgot to check that you were in the reply, so this only went to
> >     simon and the list
> >
> >     On 10/20/20 12:55 PM, Simon Deziel wrote:
> >     > On 2020-10-20 3:46 p.m., swarna latha wrote:
> >     >> Thanks john for the quick reply..
> >     >>
> >     >> My kernel version is 4.1.51-1.19
> >     >>
> >     >> Tried below logging options, but didnt help. Not able to get
> logs, what is
> >     >> blocking apparmor to play video.
> >     >>  echo -n "noquiet" /sys/module/apparmor/parameters/audit
> >     >> echo 0> /sys/module/apparmor/parameters/debug
> >     >
> >     > So far, what I've seen with containers is that dmesg/kernel logs
> are
> >     > only visible from the host's context, not the containers
> themselves.
> >     >
> >
> >     this is usually true. In addition are you getting no apparmor logs,
> or
> >     just no apparmor log for this issue. Those are two different things
> to
> >     debug.
> >
> >     With that said I suspect the issue is NO_NEW_PRIVS, see prctl(2).
> When
> >     that is set apparmor can not transition its profile, and will fail
> execs
> >     that request a profile transition.
> >
> >     Looking at the 4.1 kernel apparmor is not auditing NO_NEW_PRIVS
> >     causing a failure in profile transitions (its an external restriction
> >     and not exactly part of apparmor). Which would also align with what
> >     you are seeing.
> >
> >     When it comes to NO_NEW_PRIVS on the 4.1 kernel you basically have
> >     three choices.
> >
> >     1. Don't transition the profile, use ix
> >
> >     2. transition the profile before the container does
> >         prctl(PR_SET_NO_NEW_PRIVS).
> >
> >     3. If a container task is unconfined it can transition into a
> >        profile even after NO_NEW_PRIVS is set but once it does that it
> >        won't be able to transition the profile again.
> >
> >     --
> >     AppArmor mailing list
> >     AppArmor@lists.ubuntu.com <mailto:AppArmor@lists.ubuntu.com>
> >     Modify settings or unsubscribe at:
> https://lists.ubuntu.com/mailman/listinfo/apparmor
> >
>
>

--000000000000ef567705b22e40c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks john, that will be of great help.<div><br></div><di=
v>I am trying to capture apparmor profile=C2=A0for hardening container, and=
 i was not able to get the complete profile.</div><div><br></div><div><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Oct 20, 2020 at 5:38 PM John Johansen &lt;<a href=3D"mailto:jo=
hn.johansen@canonical.com">john.johansen@canonical.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On 10/20/20 2:16 PM, =
swarna latha wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; i see similar behaviour, i am not able to use mrCx, mrUx options to ca=
pture the apparmor logs of the process inside container.<br>
&gt; <br>
&gt; The process in the container is executed only if give ix. But i am not=
 getting apparmor logs of this process.<br>
&gt; <br>
that pretty much says you are hitting NO_NEW_PRIVS<br>
<br>
&gt; is there any patch i can apply on 4.1 kernel to capture apparmor logs =
for this process.<br>
<br>
We can certainly create a patch to log something. Let me see what I can che=
rry-pick/backport to 4.1<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Swarna<br>
&gt; <br>
&gt; On Tue, Oct 20, 2020 at 4:55 PM John Johansen &lt;<a href=3D"mailto:jo=
hn.johansen@canonical.com" target=3D"_blank">john.johansen@canonical.com</a=
> &lt;mailto:<a href=3D"mailto:john.johansen@canonical.com" target=3D"_blan=
k">john.johansen@canonical.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0oops forgot to check that you were in the reply, so=
 this only went to<br>
&gt;=C2=A0 =C2=A0 =C2=A0simon and the list<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 10/20/20 12:55 PM, Simon Deziel wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On 2020-10-20 3:46 p.m., swarna latha wrote:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Thanks john for the quick reply..<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; My kernel version is 4.1.51-1.19<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Tried below logging options, but didnt hel=
p. Not able to get logs, what is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; blocking apparmor to play video.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 echo -n &quot;noquiet&quot; /sys/mod=
ule/apparmor/parameters/audit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; echo 0&gt; /sys/module/apparmor/parameters=
/debug<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; So far, what I&#39;ve seen with containers is =
that dmesg/kernel logs are<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; only visible from the host&#39;s context, not =
the containers themselves.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0this is usually true. In addition are you getting n=
o apparmor logs, or<br>
&gt;=C2=A0 =C2=A0 =C2=A0just no apparmor log for this issue. Those are two =
different things to<br>
&gt;=C2=A0 =C2=A0 =C2=A0debug.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0With that said I suspect the issue is NO_NEW_PRIVS,=
 see prctl(2). When<br>
&gt;=C2=A0 =C2=A0 =C2=A0that is set apparmor can not transition its profile=
, and will fail execs<br>
&gt;=C2=A0 =C2=A0 =C2=A0that request a profile transition.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Looking at the 4.1 kernel apparmor is not auditing =
NO_NEW_PRIVS<br>
&gt;=C2=A0 =C2=A0 =C2=A0causing a failure in profile transitions (its an ex=
ternal restriction<br>
&gt;=C2=A0 =C2=A0 =C2=A0and not exactly part of apparmor). Which would also=
 align with what<br>
&gt;=C2=A0 =C2=A0 =C2=A0you are seeing.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0When it comes to NO_NEW_PRIVS on the 4.1 kernel you=
 basically have<br>
&gt;=C2=A0 =C2=A0 =C2=A0three choices.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A01. Don&#39;t transition the profile, use ix<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A02. transition the profile before the container does=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 prctl(PR_SET_NO_NEW_PRIVS).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A03. If a container task is unconfined it can transit=
ion into a<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0profile even after NO_NEW_PRIVS is set=
 but once it does that it<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0won&#39;t be able to transition the pr=
ofile again.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0AppArmor mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:AppArmor@lists.ubuntu.com" target=
=3D"_blank">AppArmor@lists.ubuntu.com</a> &lt;mailto:<a href=3D"mailto:AppA=
rmor@lists.ubuntu.com" target=3D"_blank">AppArmor@lists.ubuntu.com</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0Modify settings or unsubscribe at: <a href=3D"https=
://lists.ubuntu.com/mailman/listinfo/apparmor" rel=3D"noreferrer" target=3D=
"_blank">https://lists.ubuntu.com/mailman/listinfo/apparmor</a><br>
&gt; <br>
<br>
</blockquote></div>

--000000000000ef567705b22e40c5--


--===============1699595917229569545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============1699595917229569545==--

