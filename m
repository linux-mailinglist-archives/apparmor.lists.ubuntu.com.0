Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB97250876
	for <lists+apparmor@lfdr.de>; Mon, 24 Aug 2020 20:52:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kAHZV-0005jL-Na; Mon, 24 Aug 2020 18:51:57 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1kAHZT-0005ir-Mr
 for apparmor@lists.ubuntu.com; Mon, 24 Aug 2020 18:51:55 +0000
Received: by mail-ej1-f54.google.com with SMTP id l2so7221941eji.3
 for <apparmor@lists.ubuntu.com>; Mon, 24 Aug 2020 11:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yXK/VFpGHVR4q841IBcIjJaCJRFWtrzxPgVqmSHxsHc=;
 b=WUlbzU95INzeQLuTPBQIEtFI1837VWNC2avwwhvOJT20Li5pQcsRm6UUB/pd3DHyG4
 Utty/V87zKueFs4jt03AuySe/KFSOylBzSkliPIzbSf6rzeDh1uoWlw5Gm8JUsgE1hLy
 AraeU/IwLOtdmwaIMTUItdVNKuhRAuE502cmRGpdYVjciL9jb8u5fyG/nh9VBI1T1eYq
 4ie4tObg+2GyuE9Yz7WNVL1jVSjEipExNb6j/02UhHr3LzYzr0uWUc+/FxU3jAS13AjC
 2QHt36ghFZL+AG2wQiLrlR6IKHiwl2qNylK0KCawCXVwcgXN+Kw9Yl34qerpO1Fca032
 CDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yXK/VFpGHVR4q841IBcIjJaCJRFWtrzxPgVqmSHxsHc=;
 b=gH4YNjUqwlkFqu9um+j2XmT1SlpikUz33HdTpEpghbBreulYFE4QaaS6etceT+8SZZ
 i1iuz1EyjRt6teVavWmM5+RTr+obVC6LPLJkxztRXF3PPH/qJZ5/hEla55KwqeAIwaHs
 BUF3jBjbLOo+Io/03O33x2+DhQeLj+3pzR/XBGcnojpshtxtYjv4pycNSAcRXPYhYt8Q
 Q8I+ncHehZhXnsIGreAMrtQ8IZSPYfwK/kmN6MHkW7NqMB352KdT+OjLOTA1wfzoP2rj
 29gNgewnT40RTGEJ6dU5aW5DcSWb7NC0WB2egjI3wuvqLzEZSXmG7Ew5QbOwpv36CiIu
 0Dyw==
X-Gm-Message-State: AOAM530YWHV3RuthAtfW6pfBXQHSZ8x/zZXL2vYWLk9g3afdJseIGBvk
 buPOpEulK85/wRWU0blv9FGRKnO3BjR4fuGhqbSz0hjZKnk=
X-Google-Smtp-Source: ABdhPJwVrVQ4jkssC75jAe+KAt9RxZUJv9ttNWaQmlXllRKKTQgajZW94Ss3gQT87J6L809OOwpP+F9YsdO8RBK2kMo=
X-Received: by 2002:a17:907:2713:: with SMTP id
 w19mr6780332ejk.357.1598295114577; 
 Mon, 24 Aug 2020 11:51:54 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Mon, 24 Aug 2020 14:51:44 -0400
Message-ID: <CAODFaZ7xL+h_QM1k689LMKC4TV=JYMyZScoGPEaiYP9Vax9QeQ@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.218.54;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-ej1-f54.google.com
Subject: [apparmor] Apparmor - Basic queries
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
Content-Type: multipart/mixed; boundary="===============5468067405286343563=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============5468067405286343563==
Content-Type: multipart/alternative; boundary="0000000000008cfa2f05ada41475"

--0000000000008cfa2f05ada41475
Content-Type: text/plain; charset="UTF-8"

Hi All,

Please go through the below details and clarify with examples.

Q1:How do we identify required capabilities from apparmor logs.

I am looking to find out the list of capabilities are used for the
application/process using apparmor.
I have set up the apparmor and am able to see few capabilities NOT all CAPs
in apparmor logs.
Do we have any simple exercise/method to find the required capabilities for
the process specific from apparmor logs.
It will help us to set the required capabilities for the security reason.

Q2:How do we know the process/application enough to cover  full code
coverage for its required capabilities?

Do we have any suggested procedure/method to confirm the coverage of
application, especially for real-time application?

Q3:  In case of long run test cases, how to ensure all apparmor event logs
are stored even uptime is more than 2 days?

Do we have any configuration to keep apparmor logs for more than 2 days?

Thanks
Murali.S

--0000000000008cfa2f05ada41475
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>Please go through th=
e below details and clarify with examples.=C2=A0=C2=A0</div><div><br></div>=
Q1:How do we identify required capabilities from apparmor logs.<br><br>I am=
 looking to find out the list of capabilities are used for the application/=
process using apparmor.<br>I have set up the apparmor and am able to see fe=
w capabilities NOT all CAPs in apparmor logs.<br>Do we have any simple exer=
cise/method to find the required capabilities for the process specific from=
 apparmor logs.<br>It will help us to set the required capabilities for the=
 security reason.<br><br>Q2:How do we know the process/application enough t=
o cover =C2=A0full code coverage for its required capabilities?<br><br>Do w=
e have any suggested procedure/method to confirm the coverage of applicatio=
n, especially for real-time application?<br><br>Q3: =C2=A0In case of long r=
un test cases, how to ensure all apparmor event logs are stored even uptime=
 is more than 2 days? <br><br>Do we have any configuration to keep apparmor=
 logs for more than 2 days?<br><div><br></div><div>Thanks<br></div><div>Mur=
ali.S</div></div>

--0000000000008cfa2f05ada41475--


--===============5468067405286343563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5468067405286343563==--

