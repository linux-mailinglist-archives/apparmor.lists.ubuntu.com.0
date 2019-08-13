Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 986E88B874
	for <lists+apparmor@lfdr.de>; Tue, 13 Aug 2019 14:21:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hxVo1-0007mi-SG; Tue, 13 Aug 2019 12:21:37 +0000
Received: from mail-eopbgr1390084.outbound.protection.outlook.com
 ([40.107.139.84] helo=IND01-BO1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1hxVnz-0007lq-Bu
 for apparmor@lists.ubuntu.com; Tue, 13 Aug 2019 12:21:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NujR/ZG5diLkEUKmKLt8mNyRxw6zMgSJlvdQnRuFqJNeqP1YEIFYZDqDTTUurFei2wACqT5cKhmYu3z1jvaICtF5tkjfHvIHDO/JpVODgl4jhrpgpTxe3MzPfPEjfawN/7Fptku4xMt2z3MbkbjLz3dtPcV0vbVeqbObpGcepH3K3JSZu9xnPK5EmpIZCpFLiSa7oOrJyGV860VcVy+B+YDS1UCF4TTy3WyoJDNjmiP6mLCSoGhI0ckdhzR5itpwIKT4CjIEwEe7j6wGE7K8lU7giSGc6U/jiHAJH8XOUW0WovFjcYHUBhyX5Z1PPcS+1Tli2HyTRdPqAxFymhneqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1a56OiKU1k7Bq4YU7rFoLcTBhAQMtX5xawSPWrusCk=;
 b=G9kQKNaAVbi+QJqIUAS5q14IGnoVIeriPKbuSbFIjA8Bh7UkrTR4CXWGIewe0E6mCXa8063XNn25Gkx8wo+uIzmPeidAscP2ryHvM/c3k10csS3rIysHSTQvWIuED3P6wCLcKYxEUZ7+yorGfh5HEYyTuUB2vPJJMFiyggZOtoB6iuzHErVgg6YtIxE+UQM2FIRCsj20+3MQG6RRxFT7NLl+10gbyw/tAuFPsxqgfhDIXBfjclVXKx7Hdl8bfnts6Z/r7g6dLrVz6udv4+e8VEIMYUTVVGPQjmn540Yf4t6yAx7lLB1cd/pxdu9oC+n5jn2fw8tP1L8imFtmaVEwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iisc.ac.in; dmarc=pass action=none header.from=iisc.ac.in;
 dkim=pass header.d=iisc.ac.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1a56OiKU1k7Bq4YU7rFoLcTBhAQMtX5xawSPWrusCk=;
 b=cgjH+Pd70hqu9biiulykgEFcGQQ7oLal8MY3XvWpijI3H2X6uWpr+Z3bGWgWbJiF1dFUpL7tg5HYB0bdrDjssqDaW5CrYKueDVEg9eEi0HEmNU6CNaafKN0g4qifDWwC2Xv5mXV0pXfclKvDzp2HqUhqaWhAJ0YvLS9b4tCQuZA=
Received: from MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM (10.174.63.142) by
 MAXPR0101MB1258.INDPRD01.PROD.OUTLOOK.COM (52.134.130.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Tue, 13 Aug 2019 12:21:13 +0000
Received: from MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::59de:f1b2:6017:42c6]) by MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::59de:f1b2:6017:42c6%11]) with mapi id 15.20.2157.022; Tue, 13 Aug
 2019 12:21:13 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: AppArmor Child Profiles
Thread-Index: AQHVUcj2NiGOYeAJRU2HiKFm3K9tyQ==
Date: Tue, 13 Aug 2019 12:21:13 +0000
Message-ID: <MAXPR0101MB1132E410C073568A5D2C30F5FBD20@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-originating-ip: [14.139.128.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e11a32ce-4443-4ab8-0d54-08d71fe8bb7c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MAXPR0101MB1258; 
x-ms-traffictypediagnostic: MAXPR0101MB1258:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR0101MB1258CC4759CC751C0FAD447FFBD20@MAXPR0101MB1258.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(396003)(39860400002)(136003)(189003)(199004)(14454004)(99286004)(6506007)(7696005)(256004)(26005)(19627405001)(86362001)(71200400001)(486006)(71190400001)(8676002)(81156014)(1730700003)(476003)(81166006)(102836004)(186003)(786003)(107886003)(2906002)(316002)(3846002)(4326008)(25786009)(6116002)(53936002)(478600001)(6606003)(66066001)(2501003)(3480700005)(52536014)(7736002)(7116003)(2351001)(74316002)(76116006)(5660300002)(66446008)(66476007)(66556008)(64756008)(66946007)(55016002)(8936002)(9686003)(6916009)(33656002)(5640700003)(91956017)(54896002)(6436002)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR0101MB1258;
 H:MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GmdLyjHod36I3kUMJRArJzUkYrS07h8EtpwUXn25BgwmAQ6Idng1G00t5zzcwGUHWiDY8wCjxxbUr5kWi8U+YTGI93WC4eGr3k32zN1gw8lv4gQuys4dYasC+Xn6wYfJc/VdXKUX2byK7CDcLo52w4XW26X/dPWGBNyBGNzt6m7N/s6xPoBaPvJSyp0X4KJXnucfGvappunLWDYU0Vx0gQB5xUqrsbciPkxUPup7eJVZPVdTOkhRLvexZXCx+wiccOTrgshOGUYpq8ow3E1rihRDGkhRlQTc4A3i7RJZNeZlbwPX10PXxqjjyf3khWl0o8QROziANRbMXuDdJoRNAs6sjq3BuZb47JJbuuh9rfHBNd+59ixTjnix2Gz6nk5Z87YgTDXU2OUoSC3KddX7dWTk7iNv8482HfI5hABnB5w=
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: e11a32ce-4443-4ab8-0d54-08d71fe8bb7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 12:21:13.3098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yScIpSXm16tAhgSjT+SlZR5LT12EyeFnyvx6pVapt2lqtrp9EEO9MbccmBhEAucnSiSewfNOPebifH5lW/bijwlPIJFRjdkSqIPe09HH5lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1258
Subject: [apparmor] AppArmor Child Profiles
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
Content-Type: multipart/mixed; boundary="===============8465199496355541852=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8465199496355541852==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1132E410C073568A5D2C30F5FBD20MAXPR0101MB1132_"

--_000_MAXPR0101MB1132E410C073568A5D2C30F5FBD20MAXPR0101MB1132_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


We're looking for some help with respect to AppArmor child profiles.


In a scenario where 'parent_process' spawns (fork and exec) a number of chi=
ld

processes, we would like to achieve the following - if a profile exists for=
 any child

process, use it. Otherwise, don't inherit the parent's profile - instead, i=
nherit a

different default profile (presumably specified as a nested profile within =
the parent).


We have taken a good look at the use cases for the 'p', 'c', and 'i' exec f=
lags,

however, no combination of these flags seems to solve the problem:


a) px - Uses the child's profile (different) if it exists

b) cx - Uses the child's profile (nested) if it exists

c) pix - Uses the child's profile (different) if it exists, else inherits t=
he parent's profile

d) cix - Uses the child's profile (nested) if it exists, else inherits the =
parent's profile


Here's an example of what we would like:


Parent Process' Profile:


profile parent

{

     ...

     ...

     profile child_default

     {

          ...

          ...

     }

     ...

     ...

}


Is there a way by which we could say this: for all children spawned by pare=
nt,

check whether there exists a child profile (either a different profile in t=
he

file system, or a nested child profile) and if so use it, else use profile =
'child_default'?


We understand that doing this for a parent that spawns around 5 children ju=
st

involves creating 5 different profiles for each of them, and specifying exe=
c

transitions on each. However, doing this for a process that spawns more tha=
n

20 children (something like the init process) becomes cumbersome. Does

AppArmor provide support for this out of the box?


Thank you.





--_000_MAXPR0101MB1132E410C073568A5D2C30F5FBD20MAXPR0101MB1132_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p style=3D"margin-top:0; margin-bottom:0">Hi,</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">We're looking for some help with=
 respect to AppArmor child profiles.</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">In a scenario where 'parent_proc=
ess' spawns (fork and exec) a number of&nbsp;child</p>
<p style=3D"margin-top:0; margin-bottom:0">processes,&nbsp;we&nbsp;would li=
ke to achieve the following - if a profile exists for any&nbsp;child</p>
<p style=3D"margin-top:0; margin-bottom:0">process,&nbsp;use it. Otherwise,=
 don't inherit the parent's profile - instead, inherit a&nbsp;</p>
<p style=3D"margin-top:0; margin-bottom:0">different&nbsp;<span style=3D"fo=
nt-size:12pt">default profile (presumably specified as a nested profile wit=
hin the parent).</span></p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">We have taken a good look at the=
 use cases for the 'p', 'c', and 'i' exec flags,</p>
<p style=3D"margin-top:0; margin-bottom:0">however, no combination of these=
 flags seems to solve the problem:</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">a) px - Uses the child's&nbsp;pr=
ofile <span style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&qu=
ot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;=
Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16p=
x">
(different)&nbsp;</span>if it exists</p>
<p style=3D"margin-top:0; margin-bottom:0">b) cx - Uses the child's profile=
 (nested)&nbsp;if it exists</p>
<p style=3D"margin-top:0; margin-bottom:0">c) pix - Uses the child's profil=
e (different) if it exists, else inherits the parent's profile</p>
<p style=3D"margin-top:0; margin-bottom:0">d) cix - Uses the child's profil=
e (nested) if it exists, else inherits the parent's profile</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Here's an example of what we wou=
ld like:</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"><u>Parent Process' Profile:</u><=
/p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">profile parent</p>
<p style=3D"margin-top:0; margin-bottom:0">{</p>
<p style=3D"margin-top:0; margin-bottom:0">&nbsp; &nbsp; &nbsp;...</p>
<p style=3D"margin-top:0; margin-bottom:0">&nbsp; &nbsp; &nbsp;...</p>
<p style=3D"margin-top:0; margin-bottom:0">&nbsp; &nbsp; &nbsp;profile chil=
d_default</p>
<p style=3D"margin-top:0; margin-bottom:0">&nbsp; &nbsp; &nbsp;{</p>
<p style=3D"margin-top:0; margin-bottom:0">&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; ...</p>
<p style=3D"margin-top:0; margin-bottom:0">&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; ...</p>
<p style=3D"margin-top:0; margin-bottom:0">&nbsp; &nbsp; &nbsp;}</p>
<p style=3D"margin-top:0; margin-bottom:0">&nbsp; &nbsp; &nbsp;...</p>
<p style=3D"margin-top:0; margin-bottom:0">&nbsp; &nbsp; &nbsp;...</p>
<p style=3D"margin-top:0; margin-bottom:0">}</p>
<p style=3D"margin-top:0; margin-bottom:0"></p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Is there a way by which we could=
 say this: for all children spawned by parent,</p>
<p style=3D"margin-top:0; margin-bottom:0">check whether there exists a chi=
ld profile (either a different profile in the</p>
<p style=3D"margin-top:0; margin-bottom:0">file&nbsp;system, or a nested ch=
ild profile) and if so use it, else use profile 'child_default'?</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">We understand that doing this fo=
r a parent that spawns around 5 children just&nbsp;</p>
<p style=3D"margin-top:0; margin-bottom:0">involves creating 5 different pr=
ofiles for each of them, and specifying exec</p>
<p style=3D"margin-top:0; margin-bottom:0">transitions on each. However, do=
ing this for a process that spawns more than</p>
<p style=3D"margin-top:0; margin-bottom:0">20&nbsp;children (something like=
&nbsp;the init process) becomes cumbersome. Does&nbsp;</p>
<p style=3D"margin-top:0; margin-bottom:0">AppArmor provide support for thi=
s out of the box?</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Thank you.</p>
<p style=3D"margin-top:0; margin-bottom:0"></p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"></p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
</div>
</body>
</html>

--_000_MAXPR0101MB1132E410C073568A5D2C30F5FBD20MAXPR0101MB1132_--


--===============8465199496355541852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8465199496355541852==--

