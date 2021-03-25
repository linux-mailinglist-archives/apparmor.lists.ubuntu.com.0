Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B23034939C
	for <lists+apparmor@lfdr.de>; Thu, 25 Mar 2021 15:05:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lPQbg-0006VX-2R; Thu, 25 Mar 2021 14:05:04 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <tarunikaa123@gmail.com>) id 1lPQbd-0006UU-DG
 for apparmor@lists.ubuntu.com; Thu, 25 Mar 2021 14:05:01 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so2784590pjb.0
 for <apparmor@lists.ubuntu.com>; Thu, 25 Mar 2021 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:date:from:subject:thread-topic:message-id:to
 :content-transfer-encoding;
 bh=uT7DeEKXcedtD9r6nyqT7g4UuBgXDQzzp7V5OtjCWVw=;
 b=uSAv0OXKrjnzjifzLvBjN3o9ZxiA2jFndM4sGkh2DKiM6QTj2wJ7MChxE2yn/Z0dkq
 6Ycjc7c7GvDipKiK8A1Tdh1k9I3ggS8vMXUEX4iifIwT+ReHaCQ3Es4EPdMUMAlqiYmr
 FlQfQnUrur4NUjqaEUYqcMDxkTIGdkG88cCy46d5gSe9DtEZ9AGnja3/2hDZgifl/60C
 LqTp22WzPHMdvtEzmHUk5/JVP2tkHJ3c3nsI71wzM13S6AGxSpTS4eZnj1nzESmoMc1r
 chTDMO5yRwx8+8MKy9wGPXzPvB/oo1/wrcU2b8cMB0fB0rCc3kofapwCoHW+RNpce2ua
 lZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :message-id:to:content-transfer-encoding;
 bh=uT7DeEKXcedtD9r6nyqT7g4UuBgXDQzzp7V5OtjCWVw=;
 b=Q1YXMtmfAz4KE1tlnLuIbggAUxv9ivWCBhBpLMwrwkU3OAbbx1GxBFUUC52VAofP+0
 L8dpzq0RmSFKwx2DFNyTwqHJoyJfufP7bcWWlnNNe/wXbZMX87Fil3dPFlTXxVYZnOED
 xAAk0CCXoMHR38Stj1pMkmZLnME3JJKnsyyI6qgS/LNZi2t5hL6qXuL/PwVcDXUZ8ywa
 /bMVnP3ytHuLunXQ7YMD3os8f6v1XM9ocqkdGmtZbHEwoCJeCs05JyXiakYfqxOWc3UL
 EiGu9utvKSIvx+d6dEaWTfWXIidtdF8f/aNfBJgxFGBRMjYOkwdI9Q1OjmdeSGDz6XrA
 sWUQ==
X-Gm-Message-State: AOAM530T3JfddovQF2lsKFc2iCgqz51JuSXQOaCY9eTx8tZRuO1xE+af
 x/CMYQnig0rvAemxiYtvMmSElFB0uF4=
X-Google-Smtp-Source: ABdhPJzrRANl2xqVnrl9Zo4nDcRkUZ2IkbU8yiDsHC2c/Wc7ipblmMPT8itdkgtBoWmMku2DVQa0zg==
X-Received: by 2002:a17:90a:fa0b:: with SMTP id
 cm11mr9382923pjb.140.1616681099053; 
 Thu, 25 Mar 2021 07:04:59 -0700 (PDT)
Received: from DESKTOP-9CH1U7M ([123.201.104.126])
 by smtp.gmail.com with ESMTPSA id y23sm6104779pfo.50.2021.03.25.07.04.57
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Mar 2021 07:04:58 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 25 Mar 2021 19:34:52 +0530
From: <tarunikaa123@gmail.com>
Thread-Topic: Apparmor profile query
Message-ID: <849E40C5-2315-4229-B04B-848844F2A10A@hxcore.ol>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Received-SPF: pass client-ip=209.85.216.45;
 envelope-from=tarunikaa123@gmail.com; helo=mail-pj1-f45.google.com
Subject: [apparmor] Apparmor profile query
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
Content-Type: multipart/mixed; boundary="===============8978313353614086100=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8978313353614086100==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1363628442;
	mso-list-type:hybrid;
	mso-list-template-ids:-1292042554 -1 67698713 67698715 67698703 67698713 6=
7698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:20.4pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:56.4pt;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:92.4pt;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:128.4pt;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:164.4pt;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:200.4pt;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:236.4pt;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:272.4pt;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:308.4pt;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style></head><body lang=3DEN-IN link=3Dblue vlink=3D"#954F72" style=3D=
'word-wrap:break-word'><div class=3DWordSection1><p class=3DMsoNormal><span=
 lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-US>Hi Team,<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN=
-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>I h=
ave a query regarding file access permissions on Apparmor profiles.<o:p></o=
:p></span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></sp=
an></p><p class=3DMsoNormal><span lang=3DEN-US>Here =E2=80=98sample.c=E2=80=
=99&nbsp;is a C program and&nbsp;=E2=80=98sample=E2=80=99 is the&nbsp;binar=
y executable obtained on running it.<o:p></o:p></span></p><p class=3DMsoNor=
mal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><sp=
an lang=3DEN-US>=E2=80=98/usr/bin/sample&nbsp;rw, =E2=80=99 is one of the p=
olicies mentioned in an Apparmor profile.<o:p></o:p></span></p><p class=3DM=
soNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNorma=
l><span lang=3DEN-US>My process which has Apparmor profile defined,&nbsp;ac=
cesses this =E2=80=98sample=E2=80=99 binary to fetch a value from it.<o:p><=
/o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></=
span></p><ol style=3D'margin-top:0cm' start=3D1 type=3D1><li class=3DMsoLis=
tParagraph style=3D'margin-left:-15.6pt;mso-list:l0 level1 lfo1'><span lang=
=3DEN-US>Why do I not have execute permission x in my profile for the binar=
y and just rw ? <o:p></o:p></span></li><li class=3DMsoListParagraph style=
=3D'margin-left:-15.6pt;mso-list:l0 level1 lfo1'><span lang=3DEN-US>Isn't i=
t supposed to be =E2=80=98/usr/bin/sample&nbsp;rwx=E2=80=99, as the binary =
file needs to be executed by the process ?<o:p></o:p></span></li></ol><p cl=
ass=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DM=
soNormal><span lang=3DEN-US>Could someone please guide?</span></p><p class=
=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p=
><p class=3DMsoNormal>Thanks,<o:p></o:p></p><p class=3DMsoNormal>Tarunikaa<=
o:p></o:p></p></div></body></html>=



--===============8978313353614086100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8978313353614086100==--
