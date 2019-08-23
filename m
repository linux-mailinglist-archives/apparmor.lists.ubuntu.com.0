Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D54619AE60
	for <lists+apparmor@lfdr.de>; Fri, 23 Aug 2019 13:48:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i183Z-00051o-CR; Fri, 23 Aug 2019 11:48:37 +0000
Received: from mail-eopbgr1380059.outbound.protection.outlook.com
 ([40.107.138.59] helo=IND01-MA1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1i183W-00051Z-Hq
 for apparmor@lists.ubuntu.com; Fri, 23 Aug 2019 11:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WU4PFIWWKd+fRbsp0zMlCLN7KO3KJbWNTVme7SEmIbSTnzteFAkBSBZRt9DnCp38iqHlGOZT2B/KhihTAy0hDojlhMiAm9XvmbNqWTCQIcEXcIZ0NmHOI0xVSgM3jQYYKInlpr2k1xDwpubrmFdRoGoiAw/E1KRf4T8DNGzSFUSgqdMR2ASgc2VCQpLHqmYNRJvIk7jFop4mPOVY2hT4+6y2iA1vXIekpvE4ArCGbCqgtF1oAWg8dInP7W0GK1tKSthxl1URlv3O8PQEgz2XevTuv2fsKGN2pLpkr05t4fy9XpNnFGHuT1I/b/oflUTUC3fHuBEmMPma3noNDG9BOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn+p8lostxLgKvTbkMaZZf6VNDMikhmZ3ChuxJSQeoo=;
 b=CscUn7FFZskwXP+dMOI5qrh8uelDPX3QlhIi89ISUGsK3XXuVyD1xcyUy9oD2dSy9zF0nbl2riICi81GLwTCiB8lVKZoFyvYm2IJeLwi9xhtowDvfZBJnkoMUEyCzvZ9TpYbKfMUYYyi9R1WGSyFepRRcuAPAp0plZrkWEhsfCrO5NTGFP+gQpPd+DnM7wxayIwDckd4j7ZPMNmAUZPiEJtMe6PDLU66zdfeqNfV13Gotapjyjg8u8jkAnXNQMqFpQyrv35l31Qw6uJSHe3v7P4TFIZryrzT/Z6dvJjJwQYY9laXMuPdUpSkBxG2tvTmLMAcDV63YvrTX7wy4DhKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iisc.ac.in; dmarc=pass action=none header.from=iisc.ac.in;
 dkim=pass header.d=iisc.ac.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn+p8lostxLgKvTbkMaZZf6VNDMikhmZ3ChuxJSQeoo=;
 b=D9tLyffTQxzJlVRflXvXa8lb44TIHEh1YyKZvB33bcfhRsUsIwHArridVdsuGJYjFQtdLLDYYKO7OsGKL0Xweu6U4nD+Jj6dWY6xsaqF3jYskxQm3OYXy6LBycp6kZ+JnkfM4FqSitHdiqIc/DG1fq4gdIV4G2sWNG5iblCjtuM=
Received: from MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM (52.134.132.151) by
 MAXPR0101MB1593.INDPRD01.PROD.OUTLOOK.COM (52.134.131.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 11:48:30 +0000
Received: from MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d4df:a504:88fd:f459]) by MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d4df:a504:88fd:f459%12]) with mapi id 15.20.2178.020; Fri, 23 Aug
 2019 11:48:30 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: Seth Arnold <seth.arnold@canonical.com>
Thread-Topic: [apparmor] Help with AppArmor Full System Policy
Thread-Index: AQHVV+UM5PH9CoIoRk6vHDTOZXd+1KcH4OUAgADAQv0=
Date: Fri, 23 Aug 2019 11:48:30 +0000
Message-ID: <MAXPR0101MB184996F8EFB03008E4668FF2FBA40@MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0@MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM>,
 <20190823001852.GA25024@hunt>
In-Reply-To: <20190823001852.GA25024@hunt>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-originating-ip: [14.139.128.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38c67db7-137d-49ca-6ff9-08d727bfd172
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MAXPR0101MB1593; 
x-ms-traffictypediagnostic: MAXPR0101MB1593:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR0101MB159352263DC8A361B7EC094EFBA40@MAXPR0101MB1593.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(136003)(346002)(39860400002)(199004)(189003)(469094003)(53484002)(25786009)(8936002)(26005)(66066001)(6506007)(53546011)(478600001)(74316002)(33656002)(5660300002)(14454004)(99286004)(52536014)(66476007)(19627405001)(64756008)(4326008)(66556008)(7736002)(102836004)(76176011)(486006)(7696005)(86362001)(5024004)(256004)(54896002)(9686003)(186003)(54906003)(81156014)(55016002)(446003)(11346002)(476003)(6246003)(81166006)(8676002)(6116002)(66446008)(53936002)(3846002)(2906002)(91956017)(66946007)(76116006)(316002)(107886003)(71190400001)(6606003)(6916009)(229853002)(786003)(6436002)(71200400001)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR0101MB1593;
 H:MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5OEMh7IoSI9/zG0Xd8wBdhyxbFdqr1MSSyAIynK9CHupFaX9M+Fze9avVoC+9kMX04Ly6xVgRk26xGRytuGCVjBIXuw7MSti3ArA88nNty/WM8cCH4t87HZAerINpsYZEDPNUoNsio5YzLjzZic5AuEHG7mvwboJM6MJxdYqz26Xut5hKw4aq3cOp90A1SXjxWa2VI5GNXDNFfth1ydcEaOq380KlE/bAC1XiZ7yskQbyvjKBhCDc2uU8aNCVW9WHXgLVpNCE1VmjOanEeh3gsU5z/JUK8NLSzzT1f6HVl1jgecNecwOreD/n5ADPmkc+uf1rYWmoOjSY3CVr7Hj7tmE3GtzOoJCruDoj0kuFVKc/ChpOqqTKJKRqZxmQmFLDGIpqcnFh9/WbNCtwE8hQPupDCKGlXx0QyrTWESDkJM=
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c67db7-137d-49ca-6ff9-08d727bfd172
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 11:48:30.0879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LwGihnNPQYOds6lMEAkHO+K5U3iMvLY5tmFYwpyu4eGes+caeG3ULcVkh6DnGFN2+56+LD8FJRZvsUI2zvp3uWkklYOdqMaS7Fct9K21lRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1593
Subject: Re: [apparmor] Help with AppArmor Full System Policy
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
Cc: Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Content-Type: multipart/mixed; boundary="===============4149392876652393887=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============4149392876652393887==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB184996F8EFB03008E4668FF2FBA40MAXPR0101MB1849_"

--_000_MAXPR0101MB184996F8EFB03008E4668FF2FBA40MAXPR0101MB1849_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks a lot for clarifying this, Seth.

________________________________
From: Seth Arnold <seth.arnold@canonical.com>
Sent: 23 August 2019 05:48:52
To: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
Cc: apparmor@lists.ubuntu.com <apparmor@lists.ubuntu.com>; Rakesh Rajan Bec=
k <rakeshbeck@iisc.ac.in>
Subject: Re: [apparmor] Help with AppArmor Full System Policy

On Wed, Aug 21, 2019 at 06:10:30AM +0000, Abhishek Vijeev wrote:
> profile init-systemd /lib/systemd/** flags=3D(complain) {
>   /usr/bin/colord/**  cx ->  colord_profile,
>   profile colord_profile flags=3D(complain) {
>   }
> }

> However the dmesg audit logs show the profile name for colord-sane as:
> 'init-systemd//colord_profile//null-/usr/lib/colord/colord-sane' (sample
> logs are attached for reference). We don't understand where the suffix
> 'null-/usr/lib/colord/colord-sane' originates from, since we have
> specified an explicit 'cx' transition for all files within
> /usr/bin/colord/. Due to this problem, we are unable to confine colord
> and a bunch of other processes.

Your logs start after the profile transitions involved; the profile name
here shows the chain of execs that were taken to reach this point:

init-systemd//colord_profile//null-/usr/lib/colord/colord-sane

your init-system profile executed something in /usr/bin/colord/** and then
transitioned into the colord_profile child profile

that process then executed /usr/lib/colord/colord-sane

Because the init-systemd//colord_profile profile is in complain mode,
AppArmor ALLOWED the execution and created a new //null- profile.

If you take the profile out of complain mode, you'll get a DENIED when
the process tries to execute a program that isn't in the profile. You
can decide what profile the process should use after the exec by adding
appropriate Px, Cx, ix, etc rules to the init-systemd//colord_profile
profile.

I hope this helps.

Thanks

--_000_MAXPR0101MB184996F8EFB03008E4668FF2FBA40MAXPR0101MB1849_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Thanks a lot for clarifying this,=
 Seth.</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Seth Arnold &lt;seth.=
arnold@canonical.com&gt;<br>
<b>Sent:</b> 23 August 2019 05:48:52<br>
<b>To:</b> Abhishek Vijeev &lt;abhishekvijeev@iisc.ac.in&gt;<br>
<b>Cc:</b> apparmor@lists.ubuntu.com &lt;apparmor@lists.ubuntu.com&gt;; Rak=
esh Rajan Beck &lt;rakeshbeck@iisc.ac.in&gt;<br>
<b>Subject:</b> Re: [apparmor] Help with AppArmor Full System Policy</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Aug 21, 2019 at 06:10:30AM &#43;0000, Abhi=
shek Vijeev wrote:<br>
&gt; profile init-systemd /lib/systemd/** flags=3D(complain) {<br>
&gt;&nbsp;&nbsp; /usr/bin/colord/**&nbsp; cx -&gt;&nbsp; colord_profile,<br=
>
&gt;&nbsp;&nbsp; profile colord_profile flags=3D(complain) {<br>
&gt;&nbsp;&nbsp; }<br>
&gt; }<br>
<br>
&gt; However the dmesg audit logs show the profile name for colord-sane as:=
<br>
&gt; 'init-systemd//colord_profile//null-/usr/lib/colord/colord-sane' (samp=
le<br>
&gt; logs are attached for reference). We don't understand where the suffix=
<br>
&gt; 'null-/usr/lib/colord/colord-sane' originates from, since we have<br>
&gt; specified an explicit 'cx' transition for all files within<br>
&gt; /usr/bin/colord/. Due to this problem, we are unable to confine colord=
<br>
&gt; and a bunch of other processes.<br>
<br>
Your logs start after the profile transitions involved; the profile name<br=
>
here shows the chain of execs that were taken to reach this point:<br>
<br>
init-systemd//colord_profile//null-/usr/lib/colord/colord-sane<br>
<br>
your init-system profile executed something in /usr/bin/colord/** and then<=
br>
transitioned into the colord_profile child profile<br>
<br>
that process then executed /usr/lib/colord/colord-sane<br>
<br>
Because the init-systemd//colord_profile profile is in complain mode,<br>
AppArmor ALLOWED the execution and created a new //null- profile.<br>
<br>
If you take the profile out of complain mode, you'll get a DENIED when<br>
the process tries to execute a program that isn't in the profile. You<br>
can decide what profile the process should use after the exec by adding<br>
appropriate Px, Cx, ix, etc rules to the init-systemd//colord_profile<br>
profile.<br>
<br>
I hope this helps.<br>
<br>
Thanks<br>
</div>
</span></font></div>
</body>
</html>

--_000_MAXPR0101MB184996F8EFB03008E4668FF2FBA40MAXPR0101MB1849_--


--===============4149392876652393887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============4149392876652393887==--

