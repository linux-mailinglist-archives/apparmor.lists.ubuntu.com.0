Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889167B9DE
	for <lists+apparmor@lfdr.de>; Wed, 25 Jan 2023 19:49:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pKkpo-0007LU-EB; Wed, 25 Jan 2023 18:49:24 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1pKkpm-0007L2-4A
 for apparmor@lists.ubuntu.com; Wed, 25 Jan 2023 18:49:22 +0000
Received: by mail-qt1-f170.google.com with SMTP id q15so16856505qtn.0
 for <apparmor@lists.ubuntu.com>; Wed, 25 Jan 2023 10:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9vbGxxQtrHg8DdZJKT3XYcQCqqQjGavQdDqEVINqQn8=;
 b=cUMPSb1R5SoN0Cok2k4bfCGImULB7kcCyaZ1AaB6p2NyfbYtxGDUIC+CRR9wfCzoD9
 dw0NBJlLB048unpcipguBLB08RvKO6xJiRJgZvmEiZnA2t7k3lIYTqMmNGBoT97fbrKL
 T70fB2VLnfKG1mHhnDetClBzVoxGbBP6fUE/x/7kyfRHA0WQRqOlgp9N/KxINkac/IYY
 iR47os3JbymnM9E8ii9WNjKF0eIHQ0t+p0tw+xUav4DQle+OnFO2xYNtf/4MPXfoqUZF
 pw+1vQBomf6+RV5djMmXEBs6HI0HEI5QgD9QyvJNgqw//B73nsI0NQvMR9EoFn+VCIaQ
 xE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9vbGxxQtrHg8DdZJKT3XYcQCqqQjGavQdDqEVINqQn8=;
 b=4e/QTjp87czwKN+Dd2TootzPds/F1ppxTQbipDgqH1riWUB49gd/2AuQycAJ+A/zhQ
 q/BKnpbvWnsJJcz7eWs713eaCSt2MPfqb406s8uf3KP0SvV+iZnSgKBn02liimvsfWHl
 6KY3ScyeJJ83UZI7+IxrGS40SrdhTCY3RRRfcFLHCnNkvI8dtKEL/cWSbip6gCIUEfxM
 LjIgKduOtypVIokdViJHcsG8K00aGqMd6uU61+1r8/A6SCZNsXzm0cLG/0o9ZWDnfSGF
 LyIVpNH9pe0h9fi3V8vGSygvLoPqAL9oJOQHWkgk8D7BahFUs2G9Lt3W2VgqUMxNBRQ0
 QOSA==
X-Gm-Message-State: AFqh2kqgOsb+nvDj+VD7fTl08TdIJHSaBspQYw3tkyXEruC+DCa37ROq
 bSpaNdkLIhlZx2QxXAYUpOPhoct8tVIX0JU/85AkW89F9q4=
X-Google-Smtp-Source: AMrXdXun3oAruv/FEjfED5cbJUZvXXs0nkb0c+7WcNNIBJ6jjVRIXZbMT/SExjrt8+0PX8XbdJr6Xzzfpi7S/hEkk48=
X-Received: by 2002:ac8:5314:0:b0:3b5:7aa6:7c61 with SMTP id
 t20-20020ac85314000000b003b57aa67c61mr1357839qtn.219.1674672560314; Wed, 25
 Jan 2023 10:49:20 -0800 (PST)
MIME-Version: 1.0
References: <CAODFaZ7JFh28gax0rdqfSh_OiBG5M+Ny8OG0KTt0dtQFakKPAA@mail.gmail.com>
 <2131651.irdbgypaU6@tux.boltz.de.vu>
 <CAODFaZ6FDOGi1OsET1BjWVY6hfFmmHD+gwHL0=3rVnfaeUc2uw@mail.gmail.com>
 <2270135.ElGaqSPkdT@tux.boltz.de.vu>
In-Reply-To: <2270135.ElGaqSPkdT@tux.boltz.de.vu>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Wed, 25 Jan 2023 13:49:09 -0500
Message-ID: <CAODFaZ52Y0unjbWZWUZEr5EX74M+SMDv8PFOuFXk2OkHuLZ4mQ@mail.gmail.com>
To: Christian Boltz <apparmor@cboltz.de>, apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="000000000000129dcc05f31b1787"
Received-SPF: pass client-ip=209.85.160.170;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-qt1-f170.google.com
Subject: Re: [apparmor] Apparmor: global profile queries
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

--000000000000129dcc05f31b1787
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

Thanks for the explanation.

My requirement is to find a way to avoid/block the script (sh /tmp/foo.sh)
execution  from directories like (/tmp/).
However I am unable to meet this requirement using the profile below.

cat bin.sh
profile sh_restriction /bin/sh  flags=(attach_disconnected,complain) {
  ptrace,
  signal,
  capability,
  /tmp/** r,
  audit /tmp/** x,
  / r,
  /** rwixkml,
}

If I update the line *audit /tmp/** r, *I am able to get all the read
operations in /tmp/.
Do we have any options to get ONLY execute operations (*sh /tmp/foo.sh*)
from the list ( without audit "read" operation logs ).

audit: type=1400 audit(1674669489.761:6): apparmor="AUDIT" operation="open"
profile="sh_restriction" name="/tmp/foo.sh" pid=8910 comm="sh"
requested_mask="r" fsuid=0 ouid=0

Please share your inputs.

Thanks
Murali.S

On Wed, Jan 25, 2023 at 7:56 AM Christian Boltz <apparmor@cboltz.de> wrote:

> Hallo,
>
> Am Mittwoch, 25. Januar 2023, 03:44:59 CET schrieben Sie:
> > Thanks for the details. I have created a profile for /bin/bash to add
> > a restriction to run the script in /tmp using sh /tmp/foo.sh.
> > For testing purposes, I added an audit as follows but it is NOT
> > working as expected.
>
> I'd argue it _does_ work as expected ;-)
>
> > profile bash /bin/bash.bash  flags=(attach_disconnected,complain) {
> >   ptrace,
> >   signal,
> >   capability,
> > *  audit /tmp/** ix,*
>
> So you still only audit execution, but "sh /tmp/foo.sh" only _reads_ the
> script. Add
>
>     audit /tmp/** r,
>
>
> BTW: If you have more questions, please answer on the mailinglist again.
>
>
> Regards,
>
> Christian Boltz
> --
> each feature contain at least one bug :)
> [Josef Reidinger in yast-devel]
>

--000000000000129dcc05f31b1787
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Christian,<div><br>Thanks for the explanation.<br><br>M=
y requirement is to find a way to avoid/block the script (sh /tmp/foo.sh) e=
xecution=C2=A0 from directories like (/tmp/).<br>However I am unable to mee=
t this requirement using the profile below.<br><br>cat bin.sh<br>profile sh=
_restriction /bin/sh =C2=A0flags=3D(attach_disconnected,complain) {<br>=C2=
=A0 ptrace,<br>=C2=A0 signal,<br>=C2=A0 capability,<br>=C2=A0 /tmp/** r,<br=
>=C2=A0 audit /tmp/** x,<br>=C2=A0 / r,<br>=C2=A0 /** rwixkml,<br>}<br><br>=
If I update the line <b>audit /tmp/** r, </b>I am able to get all the read =
operations in /tmp/. <br>Do we have any options to get ONLY execute operati=
ons (<b>sh /tmp/foo.sh</b>) from the list ( without audit &quot;read&quot; =
operation logs ).</div><div><br></div><div>audit: type=3D1400 audit(1674669=
489.761:6): apparmor=3D&quot;AUDIT&quot; operation=3D&quot;open&quot; profi=
le=3D&quot;sh_restriction&quot; name=3D&quot;/tmp/foo.sh&quot; pid=3D8910 c=
omm=3D&quot;sh&quot; requested_mask=3D&quot;r&quot; fsuid=3D0 ouid=3D0<br><=
/div><div><br>Please share your inputs.<br><br></div><div>Thanks</div><div>=
Murali.S</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jan 25, 2023 at 7:56 AM Christian Boltz &lt;<a href=
=3D"mailto:apparmor@cboltz.de">apparmor@cboltz.de</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hallo,<br>
<br>
Am Mittwoch, 25. Januar 2023, 03:44:59 CET schrieben Sie:<br>
&gt; Thanks for the details. I have created a profile for /bin/bash to add<=
br>
&gt; a restriction to run the script in /tmp using sh /tmp/foo.sh.<br>
&gt; For testing purposes, I added an audit as follows but it is NOT<br>
&gt; working as expected.<br>
<br>
I&#39;d argue it _does_ work as expected ;-)<br>
<br>
&gt; profile bash /bin/bash.bash=C2=A0 flags=3D(attach_disconnected,complai=
n) {<br>
&gt;=C2=A0 =C2=A0ptrace,<br>
&gt;=C2=A0 =C2=A0signal,<br>
&gt;=C2=A0 =C2=A0capability,<br>
&gt; *=C2=A0 audit /tmp/** ix,*<br>
<br>
So you still only audit execution, but &quot;sh /tmp/foo.sh&quot; only _rea=
ds_ the <br>
script. Add<br>
<br>
=C2=A0 =C2=A0 audit /tmp/** r,<br>
<br>
<br>
BTW: If you have more questions, please answer on the mailinglist again.<br=
>
<br>
<br>
Regards,<br>
<br>
Christian Boltz<br>
-- <br>
each feature contain at least one bug :)<br>
[Josef Reidinger in yast-devel]<br>
</blockquote></div>

--000000000000129dcc05f31b1787--

