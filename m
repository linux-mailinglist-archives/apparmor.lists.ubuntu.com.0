Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 54794294428
	for <lists+apparmor@lfdr.de>; Tue, 20 Oct 2020 22:58:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kUyiU-0003Wn-3F; Tue, 20 Oct 2020 20:58:46 +0000
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1kUyiR-0003Wa-K2
 for apparmor@lists.ubuntu.com; Tue, 20 Oct 2020 20:58:43 +0000
Received: by mail-pg1-f195.google.com with SMTP id 19so67704pge.12
 for <apparmor@lists.ubuntu.com>; Tue, 20 Oct 2020 13:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jA82dD8uR67zwnX4Rku3gPNRxz6q6lZaMU92omrEQsE=;
 b=QP8oe5N9hosmXYc+2l+TDmmYB+eqQhyUODVruxUCqwkpYZSZklDcA1COyELaS51LIo
 zTfgXKtoTb/E+H+TMrnIPX2LO8a6/OSl6s1yY/RUIXcennDusznp32TQ25INWHbGSFPc
 B0Y1egxFFsu+0KTUU5PYdhABnprTxTt12H8f4sXKFuYZg8rYpMdRKU8JT82CHkK7ot80
 maypgmXBlqNLnyydHlXOjvTV8bHY782+qbmjaNEPG+Pg/Q1OM6Tu0LADbg80F2ZrugZP
 gRzuFISe26GzkbktwUuc3RbORv7lPBO2AJ8K7sSqk2HKUZ9Vi3R8erf37j8G5MX+AUOz
 bymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jA82dD8uR67zwnX4Rku3gPNRxz6q6lZaMU92omrEQsE=;
 b=WSu+lJfISh30m6tu9RSzgQa7snHXRUQnVxcp+2wwzjEqjMZ1VAu1Png/99PJzU78Gc
 T0Qi2huF3vBVmrxM8HrsXVTemsEP00QkVUtwFjOZDuFMiEEzibWG8cOUAC5Ias3f6sSq
 shT00DuN+stkX1of2L8Vgq5vIPSxc1D3l3qlO0iMgPE1vwf3q6XJjZmJV4R8DaNntn5a
 oabWvmY4aFDjkFhoxSQQulY/z8VP/AMIf+ErYRxIOrNn8mWZ+9yVxtv6kHoryo/7u9/X
 kkM3IM0YrAlBbSAtAtf/HTyq0RG3NmrylHutcTeFnTwwXPa3OHX2jOBeeJgE3ofj1yEP
 RLBw==
X-Gm-Message-State: AOAM530BgrwlbftatQRz1SVe2Z5ZcthF7lT8MWUx+AfQJCtp+VvWsBNl
 t6sXgo9o/4gDadvzb7fpgenMrq2n4HNs2sON5MPRawnU4xw=
X-Google-Smtp-Source: ABdhPJyxFMiuOW7GmYqPADoWg5MMC1os0iS8mkXHleLI41aDxUOi9dDvgkl+R/Xencki1WDR+Y+gyUy08Lr67WjG9JI=
X-Received: by 2002:aa7:8f37:0:b029:155:30d4:f8db with SMTP id
 y23-20020aa78f370000b029015530d4f8dbmr4635529pfr.42.1603227521475; Tue, 20
 Oct 2020 13:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAJs3c4xwqOOLPVOW8bBPrpRkFceLYdFSgWmKBtwbu1o5vj4Fhw@mail.gmail.com>
 <f760dc51-7a5c-3162-2698-049710431dd6@canonical.com>
 <CAJs3c4xz+Eb-LXZC4d6G=Pu8xXQeQaweQPbNE5Vngs7ywPxheg@mail.gmail.com>
 <a7eff0c0-b372-4f63-266a-daddbc2aeded@sdeziel.info>
In-Reply-To: <a7eff0c0-b372-4f63-266a-daddbc2aeded@sdeziel.info>
From: swarna latha <sswarnas@gmail.com>
Date: Tue, 20 Oct 2020 16:58:30 -0400
Message-ID: <CAJs3c4xJvMHe+i43RQRU7=wFXV5hxxoXyd6UPF_ggXLP0Zr+XA@mail.gmail.com>
To: Simon Deziel <simon@sdeziel.info>
Received-SPF: pass client-ip=209.85.215.195; envelope-from=sswarnas@gmail.com;
 helo=mail-pg1-f195.google.com
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
Content-Type: multipart/mixed; boundary="===============4832406870250375985=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============4832406870250375985==
Content-Type: multipart/alternative; boundary="000000000000e9692305b2207ecc"

--000000000000e9692305b2207ecc
Content-Type: text/plain; charset="UTF-8"

Does it mean, we will not be able to get apparmor logs for applications
running in container ?

And container has its own dmesg buffer ?

Are there any  ways to use apparmor to generate profile for applications
running in containers ?

Thanks,
Swarna

On Tue, Oct 20, 2020 at 3:55 PM Simon Deziel <simon@sdeziel.info> wrote:

> On 2020-10-20 3:46 p.m., swarna latha wrote:
> > Thanks john for the quick reply..
> >
> > My kernel version is 4.1.51-1.19
> >
> > Tried below logging options, but didnt help. Not able to get logs, what
> is
> > blocking apparmor to play video.
> >  echo -n "noquiet" /sys/module/apparmor/parameters/audit
> > echo 0> /sys/module/apparmor/parameters/debug
>
> So far, what I've seen with containers is that dmesg/kernel logs are
> only visible from the host's context, not the containers themselves.
>
> HTH,
> Simon
>
> --
> AppArmor mailing list
> AppArmor@lists.ubuntu.com
> Modify settings or unsubscribe at:
> https://lists.ubuntu.com/mailman/listinfo/apparmor
>

--000000000000e9692305b2207ecc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does it mean, we will not be able to get apparmor logs for=
 applications running in container ?<div><br></div><div>And container has i=
ts own dmesg buffer ?</div><div><br></div><div>Are there any=C2=A0 ways to =
use apparmor to generate profile for applications running in containers ?</=
div><div><br></div><div>Thanks,</div><div>Swarna</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 20, 2020=
 at 3:55 PM Simon Deziel &lt;<a href=3D"mailto:simon@sdeziel.info">simon@sd=
eziel.info</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 2020-10-20 3:46 p.m., swarna latha wrote:<br>
&gt; Thanks john for the quick reply..<br>
&gt; <br>
&gt; My kernel version is 4.1.51-1.19<br>
&gt; <br>
&gt; Tried below logging options, but didnt help. Not able to get logs, wha=
t is<br>
&gt; blocking apparmor to play video.<br>
&gt;=C2=A0 echo -n &quot;noquiet&quot; /sys/module/apparmor/parameters/audi=
t<br>
&gt; echo 0&gt; /sys/module/apparmor/parameters/debug<br>
<br>
So far, what I&#39;ve seen with containers is that dmesg/kernel logs are<br=
>
only visible from the host&#39;s context, not the containers themselves.<br=
>
<br>
HTH,<br>
Simon<br>
<br>
-- <br>
AppArmor mailing list<br>
<a href=3D"mailto:AppArmor@lists.ubuntu.com" target=3D"_blank">AppArmor@lis=
ts.ubuntu.com</a><br>
Modify settings or unsubscribe at: <a href=3D"https://lists.ubuntu.com/mail=
man/listinfo/apparmor" rel=3D"noreferrer" target=3D"_blank">https://lists.u=
buntu.com/mailman/listinfo/apparmor</a><br>
</blockquote></div>

--000000000000e9692305b2207ecc--


--===============4832406870250375985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============4832406870250375985==--

