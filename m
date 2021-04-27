Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E21B36BD64
	for <lists+apparmor@lfdr.de>; Tue, 27 Apr 2021 04:35:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lbDZR-0001j7-4P; Tue, 27 Apr 2021 02:35:29 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lbDZO-0001iz-BJ
 for apparmor@lists.ubuntu.com; Tue, 27 Apr 2021 02:35:26 +0000
Received: by mail-lj1-f172.google.com with SMTP id a25so53193938ljm.11
 for <apparmor@lists.ubuntu.com>; Mon, 26 Apr 2021 19:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Lp187iL/xgD0D7E0Y+3UyHS+q1RA6WiAS8XTos5kqI=;
 b=mb3OIYLT5oXUBwo6jNoMN8bdFmRm1WaxNPYpwJ+AaEK6hmvuM1BG4E15QJSfa8E/h2
 F4DtCeqsiCbTcCT+pONXMwc+NAng6jlQ5f6VbNZpLTpXi+xhn1JkTLIiY5QnlHvs8vkk
 acPDUZYzws7GuLr4B2rE1CV0XucOZkG0qP1NfppHI650+9PD2bq2hiF9UduJGOI2Iwif
 ZtlLq6FizzgKTx6RLc0Pg4IGbOc2rBSCSeNpdopvC6lgp6WoQe3EzFx1iBqq6V36qyK8
 XGZqdi4aLsTC1HNXhCAliRKnI8vx32q+pMGA0OAsWbbnqE3l2Hjzr2ZTeWiZD+JnPs2c
 h7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Lp187iL/xgD0D7E0Y+3UyHS+q1RA6WiAS8XTos5kqI=;
 b=dlbfxAz43jf4ppuG7LFJSZ8Fq7js41ytXHTKNH/+zIiGwGXO9NKH4tOxbzxk5CKovn
 tRJUipiAcF8BV997wqDHPDrMbGm9Bwki1EHV+swGcq4hsMY7ku9VDdR7MiiWOqYYEaQ/
 DSUTQomvRWKtcY68A0fyNntO+0AGjWCKxjFg6RRPtJyFbW+W04H7q4hcq1NWNFSAPS/Z
 p0i6K8l/fow/LDHttkM+fIZBRZ0eqf2iABxlqJJ51lUcOwBWufObQdDTEzNbvS/zRfQt
 jFWdP0rDxEybNcuSnYsvveB/Me+4+KOT6b+F9KiBrrnfJHKST8VAiPJIZbAkW7lK0Mx9
 Eyow==
X-Gm-Message-State: AOAM533tVJn1A6bX6Sx0gtBMKTYpqJKObHiyv0rU/AUXKGpUELJSF52k
 sv9bgYjjsny1jzGDCFnrIr88u4xmAqRoB/ysRXuiTsiA
X-Google-Smtp-Source: ABdhPJwIvpBDL4mHe0Jnum+jmWpqzWG9lzVfrnECIWkE+nCFhpACAJM19u4MSiBicXfsFXqKRERu6jCfi0OcC2KOZ+g=
X-Received: by 2002:a2e:2a44:: with SMTP id q65mr15190988ljq.115.1619490924667; 
 Mon, 26 Apr 2021 19:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ4afdxmm8b0oTTerRWZr+=2LW6_ueT6Y3HuL=mdYRs84A@mail.gmail.com>
 <CAODFaZ4Xj+hHZyta2PEtnk=pqq=poAbr7H03Xk-wAutJqzaU=A@mail.gmail.com>
 <20210427022604.GA2825476@millbarge>
In-Reply-To: <20210427022604.GA2825476@millbarge>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 27 Apr 2021 08:05:12 +0530
Message-ID: <CAODFaZ6O_zC293dt1Sn3pS_ZT7WQnt9oT8fqEC8HL7xsW0vNUg@mail.gmail.com>
To: Seth Arnold <seth.arnold@canonical.com>
Received-SPF: pass client-ip=209.85.208.172;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f172.google.com
Subject: Re: [apparmor] Apparmor: Profile optimization
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
Content-Type: multipart/mixed; boundary="===============1389305856810502477=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============1389305856810502477==
Content-Type: multipart/alternative; boundary="0000000000004828d005c0eb1dbe"

--0000000000004828d005c0eb1dbe
Content-Type: text/plain; charset="UTF-8"

Thanks Seth and apologize I did not receive your response email.

Will take a look before asking the question.

Regards
Murali.S

On Tue, Apr 27, 2021, 7:56 AM Seth Arnold <seth.arnold@canonical.com> wrote:

> On Mon, Apr 26, 2021 at 08:58:54PM +0530, Murali Selvaraj wrote:
> > Hi John/Seth,
> >
> > Please clarify the below queries which we are looking for to define
> > the profiles for embedded devices.
> > Kindly do the needful.
>
> In what way was my response here not clear enough?
>
> https://lists.ubuntu.com/archives/apparmor/2021-April/012261.html
>
> When you don't understand something in one of our responses, *please*
> address whatever it is that you didn't understand rather than just
> re-asking the same question over and over again.
>
> It's not worth our time to just keep guessing about what you didn't
> understand, or why you didnt understand it. You've got to help us out
> here, you can't just demand over and over again.
>
> I'm happy to help people who are trying to learn but you've got to at
> least *try* what we suggest and respond in kind.
>
> Thanks
>

--0000000000004828d005c0eb1dbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thanks Seth and apologize I did not receive your res=
ponse email.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Will take a=
 look before asking the question.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Regards</div><div dir=3D"auto">Murali.S<br><br><div class=3D"gmai=
l_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 27,=
 2021, 7:56 AM Seth Arnold &lt;<a href=3D"mailto:seth.arnold@canonical.com"=
>seth.arnold@canonical.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">On Mon, Apr 26, 2021 at 08:58:54PM +0530, Murali Selvaraj wrote:<br>
&gt; Hi John/Seth,<br>
&gt; <br>
&gt; Please clarify the below queries which we are looking for to define<br=
>
&gt; the profiles for embedded devices.<br>
&gt; Kindly do the needful.<br>
<br>
In what way was my response here not clear enough?<br>
<br>
<a href=3D"https://lists.ubuntu.com/archives/apparmor/2021-April/012261.htm=
l" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ubuntu.com=
/archives/apparmor/2021-April/012261.html</a><br>
<br>
When you don&#39;t understand something in one of our responses, *please*<b=
r>
address whatever it is that you didn&#39;t understand rather than just<br>
re-asking the same question over and over again.<br>
<br>
It&#39;s not worth our time to just keep guessing about what you didn&#39;t=
<br>
understand, or why you didnt understand it. You&#39;ve got to help us out<b=
r>
here, you can&#39;t just demand over and over again.<br>
<br>
I&#39;m happy to help people who are trying to learn but you&#39;ve got to =
at<br>
least *try* what we suggest and respond in kind.<br>
<br>
Thanks<br>
</blockquote></div></div></div>

--0000000000004828d005c0eb1dbe--


--===============1389305856810502477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============1389305856810502477==--

