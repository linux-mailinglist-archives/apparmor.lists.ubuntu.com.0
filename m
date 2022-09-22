Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BE48D5E6B3C
	for <lists+apparmor@lfdr.de>; Thu, 22 Sep 2022 20:49:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1obRFr-00015N-8X; Thu, 22 Sep 2022 18:48:59 +0000
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1obRFp-000158-3w
 for apparmor@lists.ubuntu.com; Thu, 22 Sep 2022 18:48:57 +0000
Received: by mail-pg1-f170.google.com with SMTP id u69so10045588pgd.2
 for <apparmor@lists.ubuntu.com>; Thu, 22 Sep 2022 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=SgDkbySRruabVy6B+s8IQugh17sCj1fxapu2zeiEASk=;
 b=PqK2Q9QhpE0UWaMAYRND6rNgBjJmieMfxu7/HT9KFIFY3kqyBRHwNUzyhPRpV1HVp5
 s8a857PRTMnHRKdfdxzmQLm+5VKp1T8JwzIuo1uypdrVSYaCvR0o5mbeWy0V6zB6pu2n
 Z8f+Sv6VHANW6ayxYJXuUZc8qdB7VoGIXaEOvXUrHKHBOb/IfcPoQYYsjhsTHDytcwxv
 +J4NhOnm0liDx2pDBydielGSJ1mHULs52LDTU5p08rKW3J1OxIqQMoRjsUmmpd0ZVyVO
 +G+zN/fgNs1TpFTcW5tcSK+cQ6hGDogG8BVC/f5bJuzHJb7m+DcZ3IwX8Gt/haP22kAr
 wY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=SgDkbySRruabVy6B+s8IQugh17sCj1fxapu2zeiEASk=;
 b=q6xwsIO5LCYngn0I1VTIM7a5xUroe09YTKLt7LNefYXfqJE4+3XvuKzvATy504Ivl4
 /rRYaqFuI2wuCizKyToxq67XwOQUD8pGOlqqRragXtM1vs+TMnaUkMvT6bCmR5pQ8b67
 E2UKVjZ/L8ymUrU+YLOoQB4whrEWR6Zcpho24mM79k0O9n8eJkibqAglbFq40KSp0Hjj
 /MyAGN+bh3WsDm+Kck//qMZSdyCnzlUcEO10oVhjxb3ebDE3MrPOCD7bwQ8Ap3nFiH+Q
 ScTs89puE1XKySNwnNxlBTVHXTUSXAhg/Q1X4P7IqQZLUmZPtZvk5tQ0I0MJNooccYw+
 8Flw==
X-Gm-Message-State: ACrzQf3xRq/dGzgtInfbn6AsUyz0EgauFF93tuMF400dhCNmioYpEtL1
 +ojrLhdNc3fRN02kCzChtjN7OiZv6oeT17HzgtaYffCtG4w=
X-Google-Smtp-Source: AMsMyM4BSTs8N7z3iXPpAi2/t9sq+cUTKnlOS2fdmFotKBT2xy5gA+BS4dhCXe1pjZfyZdjsXiYukaZbpsVDVP4ZMT4=
X-Received: by 2002:a63:454a:0:b0:439:c6a4:b0db with SMTP id
 u10-20020a63454a000000b00439c6a4b0dbmr4289968pgk.450.1663872535053; Thu, 22
 Sep 2022 11:48:55 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Thu, 22 Sep 2022 14:48:43 -0400
Message-ID: <CAODFaZ7h_jsi4spSXwygYs4Bz8i8TzphvqRaiCYEVgc+sE2wsQ@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="00000000000067488f05e94883f2"
Received-SPF: pass client-ip=209.85.215.170;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-pg1-f170.google.com
Subject: [apparmor] Apparmor : Common Query
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

--00000000000067488f05e94883f2
Content-Type: text/plain; charset="UTF-8"

Hi All,

Please see below two queries and share your valuable inputs.

*Question 1: *

I am trying to generate an Apparmor profile similar to the below pseudo
script.

*foo.sh*
#!/bin/sh
if condition
   /bin/sh script_1.sh
fi
/bin/sh script_2.sh
while [ condition ]
do
   if [ condition ]
        /bin/sh script_3.sh
   else
        /bin/sh script_4.sh
   fi
done

*Queries:*

-  If we create a separate profile for each script (for instance,
script1_1.sh)  and consolidate to one profile for foo.sh
-  However, we will try to perform/exercise all possible test cases to
execute all code paths while running in complain mode to gather logs
   for preparing the profiles.
-  Do we have any recommendations to prepare an Apparmor profile for Linux
scripts?

*Question 2:*

- In my embedded system most of the rootfs files are in READ-ONLY except a
few directory,files are READ-WRITE (for instance, non-volatile partitions
and so on).
- All libraries in my device rootfs are located in READ-ONLY folders (
/lib/, /usr/lib and so on).
- While preparing profiles for my applications, I am adding each entry of
the library as per the application access.

  /lib/** mr,
  /usr/lib/** mr,

- Since all libraries are in READ-ONLY, if we allow all libraries (with
wild-card) any possible security leak?
- Do we still have command-line injection possible to the library too? I am
trying to understand here, how do we affect security leaks if we allow all
libraries (since they are in READ-ONLY directory).

Thanks
Murali.S

--00000000000067488f05e94883f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>Please see below two queries and share your=
 valuable inputs.<br><br><b><font face=3D"arial black, sans-serif">Question=
 1: </font></b><br><br>I am trying to generate an Apparmor profile similar =
to the below pseudo script.<br><br><b>foo.sh</b><br>#!/bin/sh<br>if conditi=
on<br>=C2=A0 =C2=A0/bin/sh script_1.sh<br>fi<br>/bin/sh script_2.sh<br>whil=
e [ condition ]<br>do =C2=A0<br>=C2=A0 =C2=A0if [ condition ]<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /bin/sh script_3.sh<br>=C2=A0 =C2=A0else<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /bin/sh script_4.sh<br>=C2=A0 =C2=A0fi<br>done<br><br><b><fo=
nt face=3D"times new roman, serif">Queries:</font></b><br><br>- =C2=A0If we=
 create a separate profile for each script (for instance, script1_1.sh) =C2=
=A0and consolidate to one profile for foo.sh<br>- =C2=A0However, we will tr=
y to perform/exercise all possible test cases to execute all code paths whi=
le running in complain mode to gather logs<br>=C2=A0 =C2=A0for preparing th=
e profiles.<br>- =C2=A0Do we have any recommendations to prepare an Apparmo=
r profile for Linux scripts?<br><br><b><font face=3D"arial black, sans-seri=
f">Question 2:</font></b><br><br>- In my embedded system most of the rootfs=
 files are in READ-ONLY except a few directory,files are READ-WRITE (for in=
stance, non-volatile partitions and so on).<br>- All libraries in my device=
 rootfs are located in READ-ONLY folders ( /lib/, /usr/lib and so on).<br>-=
=C2=A0While preparing profiles for my applications, I am adding each entry =
of the library as per the application access.<br><br>=C2=A0 /lib/** mr,<br>=
=C2=A0 /usr/lib/** mr,<br><br>- Since all libraries are in READ-ONLY, if we=
 allow all libraries (with wild-card) any possible security leak?<br>-=C2=
=A0Do we still have command-line injection possible to the library too? I a=
m trying to understand here, how do we affect security leaks if we allow al=
l libraries (since they are in READ-ONLY directory).<br><div><br></div><div=
>Thanks</div><div>Murali.S</div></div>

--00000000000067488f05e94883f2--

