Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D6293C97EE
	for <lists+apparmor@lfdr.de>; Thu,  3 Oct 2019 07:21:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iFtYT-0007ux-QD; Thu, 03 Oct 2019 05:21:33 +0000
Received: from mail-eopbgr1390077.outbound.protection.outlook.com
 ([40.107.139.77] helo=IND01-BO1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1iFtYR-0007ur-8K
 for apparmor@lists.ubuntu.com; Thu, 03 Oct 2019 05:21:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvS0DVNu8XfXaN0JVaTNd9kaYuT7z96gvwJW6Z+Qm4PaQULSx2BLn37XRYxsisKNrYt48qrAOSx+ogPA6utt2/ylfzynqSQMqLu+t9vD0+iLP1tM58ni//+G6rmzs/xsXkUnj1B1dQqAIAG/R0igSuDSMP/2P7qPNBcuO/dfPOMw4nYTtZ7rrvNaXV4yvGB/fn01CNA+DfF6q+XjLlIDsNH4JtO1aNtQIJRbTbQScBu/WL1EAVLzdn1BmpwqyRPpTp5e04xpNEYzRkHj0Xl90LMOYxGDQ0DUi6V0LLU0l+20r1G57QllALfKnRCFwXny6ALqX7vEj+Tr01Yob3Jqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7ionxWYBuo8v2sVyYT2reCGOzY0f/xxAQvd3x1BybE=;
 b=gGB6mYia10wc2dmddnc1jClhq1NjwYnDTDs+CAnHjMJTsmdGBL+Lf7Run8Qhatibgxw+Ak2QZKeIjFfPTxOXdwRi5FJbQPVZStkU0ozh8gWtCSv0X/S1wxy2wqKd2r+rNLzY1W+GOE5ntqBIMVn13DVXnUM1nkjNH9787HEB7HzMtl0XeLzz/KMmWcy4Vz+9zT7VKKtbw1+hTzfUkhqXp0VMEYjm/nBBvhqYrYWqzX3KsIYOoRkpnKvHQT934qorB3L5jjLMdGaT6NrxVkKwyuu6Njw17bmcGdhjUPmAzvh+gRAIG84kKVwFj9n+ZCCa+BwIJUGE1rW4nWjJ83Jg7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iisc.ac.in; dmarc=pass action=none header.from=iisc.ac.in;
 dkim=pass header.d=iisc.ac.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7ionxWYBuo8v2sVyYT2reCGOzY0f/xxAQvd3x1BybE=;
 b=buCu2k3D2enflQnPpdAtqlSyaVgGchzrln3KWDLaZiVhsrQDG5Sw703gsZWjWFzHQlK4/XrCg8OAiofQZrjLdIGaaetVF0Z3h5NDivtCNswQbg8sNxNaKF78eC6BRmfhdIZcsQvkvbPDUNTs1MBs2/9VkpIYmFP1CYSMDEgRcU8=
Received: from MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM (52.134.132.151) by
 MAXPR0101MB1146.INDPRD01.PROD.OUTLOOK.COM (52.134.131.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 05:21:26 +0000
Received: from MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::51fd:5109:627:7064]) by MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::51fd:5109:627:7064%7]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 05:21:26 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: [apparmor] Query about AppArmor's Profile Transitions
Thread-Index: AQHVeaXI31imCAHzZEuf6SWDaf5WMg==
Date: Thu, 3 Oct 2019 05:21:26 +0000
Message-ID: <MAXPR0101MB1849265774BBCC379F1C22CFFB9F0@MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-originating-ip: [14.139.128.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e23b3346-a49d-440c-3065-08d747c18a13
x-ms-traffictypediagnostic: MAXPR0101MB1146:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR0101MB1146A26721CCF001D5227B1BFB9F0@MAXPR0101MB1146.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(396003)(136003)(39850400004)(189003)(199004)(478600001)(14454004)(105004)(33656002)(2501003)(186003)(7736002)(476003)(25786009)(52536014)(71200400001)(26005)(486006)(71190400001)(66946007)(66556008)(76116006)(66446008)(64756008)(66476007)(6506007)(53546011)(8936002)(81156014)(81166006)(1730700003)(8676002)(102836004)(2906002)(86362001)(316002)(786003)(54896002)(99286004)(5640700003)(2351001)(9686003)(7696005)(3846002)(6916009)(6436002)(6116002)(256004)(14444005)(107886003)(19627405001)(6246003)(74316002)(5660300002)(4326008)(66066001)(229853002)(55016002)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR0101MB1146;
 H:MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3g4xRQSrP9cvr9CI/MrpvlX5k9WITW0G/rNw+KrMOnsFLsVLRcPOovkvUFZlK1VoYuOhkakem6NRxGoXiePMCyUNK+UIGMeBnQGimlenV6LxFDDLHYc/XBVM69y9WewER7XA5wbB1JUQHmGCmMEGIBz1ho3JZ1iQG3WM8CC7rbLmbzFZFgHgbnlf2SaO6wULIbm/bu74l9DbwcjmVNxExntG3TTj/HHoGgFMi7GNOxg3865GROIqlkie8stTFRpIzN92cZ+bSjtWmVhZl0PEX4NkUYYLb03rvtzJzjOqx8bJDzsZ8jaPdtIHLE0cIEPF5jYakopvWyr25Qj0bsFAEtOaeXEW1bEL8oSPfAIZc+bE3c7Njt0GfnEpM6tuaWy0ZdNRzlqZV8Zo6oxgY4V8rowyddtXxaLm2kF7Tnjar+Q=
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: e23b3346-a49d-440c-3065-08d747c18a13
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 05:21:26.5338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jHhwvoYqGBAzoxW1D4qcGLVkvGqJqBRlA8Heuyvw/L4MpU9UIWcGxWzb43qpiZOnEc1ZZHzPoyy4nkXgPALRwKg3Aq/pfJYjHIiQuecVAxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1146
Subject: Re: [apparmor] Query about AppArmor's Profile Transitions
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
Cc: Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>
Content-Type: multipart/mixed; boundary="===============4262796954821640981=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============4262796954821640981==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1849265774BBCC379F1C22CFFB9F0MAXPR0101MB1849_"

--_000_MAXPR0101MB1849265774BBCC379F1C22CFFB9F0MAXPR0101MB1849_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thank you for the reply John, Seth. It's great to know that a more expressi=
ve policy language is in the works.

We had a good look at stacking, but it doesn't seem to help accomplish quit=
e what we have in mind:

a) Confine 'init'
b) When init executes any other process, perform a discrete profile transit=
ion. But, if no discrete profile exists, transition to a 'default' (highly =
restricted) child profile defined in init's profile (this is basically what=
 would be a 'pcx' transition).

Even if we were to specify the default profile as a discrete profile, the f=
ollowing example is the closest that stacking can bring us to what we would=
 like, and hopefully illustrates our problem better:

profile init-systemd /**
{
     /program px -> program //& default
}

profile default
{
     . . .
}

a) If the discrete profile for 'program' doesn't exist, I understand that '=
program //& default' would evaluate to just 'default', which is what we wou=
ld like. So far so good.
b) But, if the discrete profile for 'program' does exist, we would like it =
to transition here, and not perform an intersection of 'program' and 'defau=
lt'. Since 'default' is highly restrictive, this would result in the inters=
ection of the 2 profiles becoming highly restrictive as well.

________________________________
From: Seth Arnold
Sent: Tuesday, 01 October 2019 23:47
To: Abhishek Vijeev
Cc: apparmor@lists.ubuntu.com; Rakesh Rajan Beck
Subject: Re: [apparmor] Query about AppArmor's Profile Transitions

On Tue, Oct 01, 2019 at 05:25:21PM +0000, Abhishek Vijeev wrote:
> Currently, AppArmor allows 'pix' and 'cix' transitions. However, we would=
 like to extend AppArmor to
> allow a 'pcix' transition. To clarify what we mean by 'pcix', we're looki=
ng for a way by which we
> can specify the following policy: 'look for a specific profile, but if on=
e doesn't exist, look for a
> child profile, otherwise inherit the current profile'. Are there any chal=
lenges to implementing
> this? Also, is this a feature that is planned for release in future versi=
ons of AppArmor?

I do have to wonder if whatever you're trying to solve would be better
handled via stacking profiles instead.

What are you trying to achieve?

Thanks

--_000_MAXPR0101MB1849265774BBCC379F1C22CFFB9F0MAXPR0101MB1849_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you for the reply John, Seth. It's great to know that a more expressi=
ve policy language is in the works.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
We had a good look at stacking, but it doesn't seem to help accomplish quit=
e what we have in mind:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
a) Confine 'init'</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
b) When init executes any other process, perform a discrete profile transit=
ion. But, if no discrete profile exists, transition to a 'default' (highly =
restricted) child profile defined in init's profile (this is basically what=
 would be a 'pcx' transition).</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Even if we were to specify the default profile as a discrete profile, the f=
ollowing example is the closest that stacking can bring us to what we would=
 like, and hopefully illustrates our problem better:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
profile init-systemd /**</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
{</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;/program px -&gt; program //&amp; default</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
}</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
profile default</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
{</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;. . .</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
}</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
a) If the discrete profile for 'program' doesn't exist, I understand that '=
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important">program //&amp; d=
efault' would evaluate to just 'default',
 which is what we would like. So far so good.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important">b) But, if the di=
screte profile for 'program' does exist, we would like it to transition her=
e, and not perform an intersection
 of 'program' and 'default'. Since 'default' is highly restrictive, this wo=
uld result in the intersection of the 2 profiles becoming highly restrictiv=
e as well.</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>From:</b> Seth Arnold<br>
<b>Sent:</b> Tuesday, 01 October 2019 23:47<br>
<b>To:</b> Abhishek Vijeev<br>
<b>Cc:</b> apparmor@lists.ubuntu.com; Rakesh Rajan Beck<br>
<b>Subject:</b> Re: [apparmor] Query about AppArmor's Profile Transitions
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, Oct 01, 2019 at 05:25:21PM &#43;0000, Abhi=
shek Vijeev wrote:<br>
&gt; Currently, AppArmor allows 'pix' and 'cix' transitions. However, we wo=
uld like to extend AppArmor to<br>
&gt; allow a 'pcix' transition. To clarify what we mean by 'pcix', we're lo=
oking for a way by which we<br>
&gt; can specify the following policy: 'look for a specific profile, but if=
 one doesn't exist, look for a<br>
&gt; child profile, otherwise inherit the current profile'. Are there any c=
hallenges to implementing<br>
&gt; this? Also, is this a feature that is planned for release in future ve=
rsions of AppArmor?<br>
<br>
I do have to wonder if whatever you're trying to solve would be better<br>
handled via stacking profiles instead.<br>
<br>
What are you trying to achieve?<br>
<br>
Thanks<br>
</div>
</span></font></div>
</body>
</html>

--_000_MAXPR0101MB1849265774BBCC379F1C22CFFB9F0MAXPR0101MB1849_--


--===============4262796954821640981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============4262796954821640981==--

