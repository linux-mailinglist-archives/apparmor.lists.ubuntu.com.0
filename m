Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C5062C95B
	for <lists+apparmor@lfdr.de>; Wed, 16 Nov 2022 21:00:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ovOZu-00064Q-V3; Wed, 16 Nov 2022 20:00:10 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <janko.itm@gmail.com>) id 1ovOZs-00063y-Ke
 for apparmor@lists.ubuntu.com; Wed, 16 Nov 2022 20:00:08 +0000
Received: by mail-wr1-f50.google.com with SMTP id bs21so31751516wrb.4
 for <apparmor@lists.ubuntu.com>; Wed, 16 Nov 2022 12:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TgI3SonUfkXVMbinGwDBbiCLAOsniilPdmRYutZSTSw=;
 b=TWlff/FrE0uax09jIagduRTn+v1OdvZ+Muj70lwGBa9W6bSFSu8IrZUhCFLqarzU86
 Y1+PKrJWdEFEq8szal0qpHv9o16vfXfbF+nTkmfktNJwr7Kt7VDWgG8v5Wksj+pOeUHo
 xgL7MO6eUX1NyeExtfvn+uuW3Kn9O0hHUknDX6TrRwA76oEYVf396f6Kk3mRhq+Aoa03
 BvL6veZ1U2n4nuS4UByNal735/1/QNbxoMdx54u1l3ShZ0+iFIR5X84K/KOrJDh4CrN8
 +AVm7aaYclpQAc2YzoOD7wlOCzVusRYj7cmuon0MZsF0+A0pIK3XIXMvl6uhsWPJwC2t
 oOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TgI3SonUfkXVMbinGwDBbiCLAOsniilPdmRYutZSTSw=;
 b=f+C+RwxFf3lF1iM5MX2rbiT+RkLGKjlAkLnjjGpVbDnoyHQUJGA/UEWJK8H16om6aS
 7XyB1EIwV49vcl4KiHA8X0gvlJ6Gye4MnrPiomjVIgoIxnpsxc6sIxJscz9yLWxe/Wns
 gFZvC3bfhKt/yZjkGluiIt7y0zkaXm5Lvy4ZwM27C+IZApVknoyrhUT4KlQmw1iCou1o
 T0LdA7bsFtmZK1psePhi2QXqtd5l5zMdNMqDOhN9SgilxK+kLdELmmxxkwjDamh9Uvq8
 eGHMKcv7aN+9Cob4jlj20QIOdPYe6w1Bio2hALDr20GSXluR8aIwq3G+JImcN/rYbY6B
 HN6Q==
X-Gm-Message-State: ANoB5pnBlQ0RMGet5TA5TpxCePooqMR5OdvNbqTtoGJ7Im/7ugqGJqtB
 K3y4OH9x+5LAL59L8KbeWprWk2Ja+UIW5Y8ZdVK0UDt9PCP4qQ==
X-Google-Smtp-Source: AA0mqf4PqsBzgLx3YNjpQm8wuvdUpAyJ34qO2T3u1+/HUZQS/5cVgc6K9P7b6+E8aKIG4gypEylGa2iKuIshaf0NpJU=
X-Received: by 2002:adf:d225:0:b0:22e:2efe:3176 with SMTP id
 k5-20020adfd225000000b0022e2efe3176mr14476494wrh.241.1668628807442; Wed, 16
 Nov 2022 12:00:07 -0800 (PST)
MIME-Version: 1.0
From: janko metelko <janko.itm@gmail.com>
Date: Wed, 16 Nov 2022 20:59:55 +0100
Message-ID: <CAHRxeQ0Mf-mWnNGS1vGa0NMB-=dBvsweaQ-xPkibxC1VNmLmcg@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="00000000000054637c05ed9bebdf"
Received-SPF: pass client-ip=209.85.221.50; envelope-from=janko.itm@gmail.com;
 helo=mail-wr1-f50.google.com
Subject: [apparmor] any way of denying profiled executable(s) to be ran at
	all
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

--00000000000054637c05ed9bebdf
Content-Type: text/plain; charset="UTF-8"

Thank you for making AppArmor, if any of the developers are here. I am not
a security guy, but such a solution seems like it should or will become an
absolute must-use for any application deployment, locally or on a server.

I have a question. I want to make a profile that prevents execution of any
file from user-writable directories like /home /tmp, *except* if the
executable has a AA profile.

This would effectively mean that the user (or user level process) can't
(knowingly or unknowingly) "install" and run anything that wasn't
"confirmed" by root.

It seems I can do this by creating an empty profile for /home/** which
denies everything and then creating separate AA profiles for specific
executable files inside /home that I allow to run.

If I understand it right, all executables in /home without profiles will in
this case crash or at least can't do any side effects since they are
blocked from all IO/shared libs/configs/etc. In practice, they will
probably just crash. It would be much nicer experience if such apps would
be prevented to run, not start and crash.

But I can only find directives in AA, that limit or allow certain resorces
to the executable, and no directive, that would prevent executable to be
ran in the first place.

Is there any such solution? Am I maybe looking at it all wrong? Should I do
this on another level, not with AppArmor?

*Example*

Maybe stupid example, but still. Let's say I want to prevent non-root users
or RCEs from wget-ing into any other directory other than /tmp. I can
simply create a profile for /usr/bin/wget { ... /tmp w, } and the job is
done. But user/RCE can then simply do cp /usr/bin/wget ~/mywget and use
wget for whatever it wants. If we prevent execution of non-profiled
executables in user writable directories then he/it can't do that and our
primary objective stands.

I hope it makes some sense ... Thank you again. Ubuntu rocks also, and
Xubuntu! :)

Janko

--00000000000054637c05ed9bebdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-css-1dbjc4n"><div dir=3D"auto" class=
=3D"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmail-r-a023e6 gmail-r-=
16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gmail-r-qvutc0" id=3D"=
gmail-id__15trkguzrgp" lang=3D"en"><span class=3D"gmail-css-901oao gmail-cs=
s-16my406 gmail-r-poiln3 gmail-r-bcqeeo gmail-r-qvutc0">Thank you for makin=
g AppArmor, if any of the developers are here. I am not a security guy, but=
 such a solution seems like it should or will become an absolute must-use f=
or any application deployment, locally or on a server.<br></span></div><div=
 dir=3D"auto" class=3D"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmai=
l-r-a023e6 gmail-r-16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gma=
il-r-qvutc0" lang=3D"en"><span class=3D"gmail-css-901oao gmail-css-16my406 =
gmail-r-poiln3 gmail-r-bcqeeo gmail-r-qvutc0"><br></span></div><div class=
=3D"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmail-r-a023e6 gmail-r-=
16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gmail-r-qvutc0" lang=
=3D"en"><span class=3D"gmail-css-901oao gmail-css-16my406 gmail-r-poiln3 gm=
ail-r-bcqeeo gmail-r-qvutc0">I have a question. I want to make a profile th=
at prevents execution of any file from user-writable directories like /home=
 /tmp, *except* if the executable has a AA profile.</span></div><div class=
=3D"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmail-r-a023e6 gmail-r-=
16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gmail-r-qvutc0" lang=
=3D"en"><span class=3D"gmail-css-901oao gmail-css-16my406 gmail-r-poiln3 gm=
ail-r-bcqeeo gmail-r-qvutc0"><br></span></div><div dir=3D"auto" class=3D"gm=
ail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmail-r-a023e6 gmail-r-16dba4=
1 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gmail-r-qvutc0" lang=3D"en">=
<span class=3D"gmail-css-901oao gmail-css-16my406 gmail-r-poiln3 gmail-r-bc=
qeeo gmail-r-qvutc0">This would effectively mean that the user (or user lev=
el process) can&#39;t (knowingly or unknowingly) &quot;install&quot; and ru=
n anything that wasn&#39;t &quot;confirmed&quot; by root.<br><br></span></d=
iv><div class=3D"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmail-r-a0=
23e6 gmail-r-16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gmail-r-q=
vutc0" lang=3D"en"><span class=3D"gmail-css-901oao gmail-css-16my406 gmail-=
r-poiln3 gmail-r-bcqeeo gmail-r-qvutc0">It seems I can do this by creating =
an empty profile for /home/** which denies everything and then creating sep=
arate AA profiles for specific executable files inside /home that I allow t=
o run.<br></span></div><div class=3D"gmail-css-901oao gmail-r-18jsvk2 gmail=
-r-37j5jr gmail-r-a023e6 gmail-r-16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmai=
l-r-bnwqim gmail-r-qvutc0" lang=3D"en"><span class=3D"gmail-css-901oao gmai=
l-css-16my406 gmail-r-poiln3 gmail-r-bcqeeo gmail-r-qvutc0"><br></span></di=
v><div class=3D"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmail-r-a02=
3e6 gmail-r-16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gmail-r-qv=
utc0" lang=3D"en"><span class=3D"gmail-css-901oao gmail-css-16my406 gmail-r=
-poiln3 gmail-r-bcqeeo gmail-r-qvutc0">If I understand it right, all execut=
ables in /home without profiles will in this case crash or at least can&#39=
;t do any side effects since they are blocked from all IO/shared libs/confi=
gs/etc. In practice, they will probably just crash. It would be much nicer =
experience if such apps would be prevented to run, not start and crash.<br>=
<br></span></div><div class=3D"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j=
5jr gmail-r-a023e6 gmail-r-16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bn=
wqim gmail-r-qvutc0" lang=3D"en"><span class=3D"gmail-css-901oao gmail-css-=
16my406 gmail-r-poiln3 gmail-r-bcqeeo gmail-r-qvutc0">But I can only find d=
irectives in AA, that limit or allow certain resorces to the executable, an=
d no directive, that would prevent executable to be ran in the first place.=
 <br><br>Is there any such solution? Am I maybe looking at it all wrong? Sh=
ould I do this on another level, not with AppArmor?<br><br></span></div><di=
v class=3D"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmail-r-a023e6 g=
mail-r-16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gmail-r-qvutc0"=
 lang=3D"en"><span class=3D"gmail-css-901oao gmail-css-16my406 gmail-r-poil=
n3 gmail-r-bcqeeo gmail-r-qvutc0">*Example*<br><br></span></div><div class=
=3D"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmail-r-a023e6 gmail-r-=
16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gmail-r-qvutc0" lang=
=3D"en"><span class=3D"gmail-css-901oao gmail-css-16my406 gmail-r-poiln3 gm=
ail-r-bcqeeo gmail-r-qvutc0">Maybe stupid example, but still. Let&#39;s say=
 I want to prevent non-root users or RCEs from wget-ing into any other dire=
ctory other than /tmp. I can simply create a profile for /usr/bin/wget { ..=
. /tmp w, } and the job is done. But user/RCE can then simply do cp /usr/bi=
n/wget ~/mywget and use wget for whatever it wants. If we prevent execution=
 of non-profiled executables in user writable directories then he/it can&#3=
9;t do that and our primary objective stands.<br></span></div><div class=3D=
"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmail-r-a023e6 gmail-r-16d=
ba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gmail-r-qvutc0" lang=3D"e=
n"><span class=3D"gmail-css-901oao gmail-css-16my406 gmail-r-poiln3 gmail-r=
-bcqeeo gmail-r-qvutc0"><br></span></div><div class=3D"gmail-css-901oao gma=
il-r-18jsvk2 gmail-r-37j5jr gmail-r-a023e6 gmail-r-16dba41 gmail-r-rjixqe g=
mail-r-bcqeeo gmail-r-bnwqim gmail-r-qvutc0" lang=3D"en"><span class=3D"gma=
il-css-901oao gmail-css-16my406 gmail-r-poiln3 gmail-r-bcqeeo gmail-r-qvutc=
0">I hope it makes some sense ... Thank you again. Ubuntu rocks also, and X=
ubuntu! :)<br></span></div><div class=3D"gmail-css-901oao gmail-r-18jsvk2 g=
mail-r-37j5jr gmail-r-a023e6 gmail-r-16dba41 gmail-r-rjixqe gmail-r-bcqeeo =
gmail-r-bnwqim gmail-r-qvutc0" lang=3D"en"><span class=3D"gmail-css-901oao =
gmail-css-16my406 gmail-r-poiln3 gmail-r-bcqeeo gmail-r-qvutc0"><br></span>=
</div><div class=3D"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmail-r=
-a023e6 gmail-r-16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gmail-=
r-qvutc0" lang=3D"en"><span class=3D"gmail-css-901oao gmail-css-16my406 gma=
il-r-poiln3 gmail-r-bcqeeo gmail-r-qvutc0">Janko<br></span></div><div class=
=3D"gmail-css-901oao gmail-r-18jsvk2 gmail-r-37j5jr gmail-r-a023e6 gmail-r-=
16dba41 gmail-r-rjixqe gmail-r-bcqeeo gmail-r-bnwqim gmail-r-qvutc0" lang=
=3D"en"><span class=3D"gmail-css-901oao gmail-css-16my406 gmail-r-poiln3 gm=
ail-r-bcqeeo gmail-r-qvutc0"><br></span></div></div></div>

--00000000000054637c05ed9bebdf--

