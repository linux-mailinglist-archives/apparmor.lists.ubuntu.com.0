Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C4888971E9
	for <lists+apparmor@lfdr.de>; Wed, 21 Aug 2019 08:10:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i0JpV-0008Jq-Ps; Wed, 21 Aug 2019 06:10:45 +0000
Received: from mail-eopbgr1390072.outbound.protection.outlook.com
 ([40.107.139.72] helo=IND01-BO1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1i0JpR-0008JP-56
 for apparmor@lists.ubuntu.com; Wed, 21 Aug 2019 06:10:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlbmiY4V/XyfU47CFykADSuDfPFQvp/q6FH8LIHn7+fe7GywobnKZlTuqsXOtYbQz7fqD9AeqfEOzJP03EY+jPLmcBz2S9WfmC+xNx8xT1tbdE8W0u5m8W4RB+udtGP7cTlGRT8v+n2gpUNoi6v+epn9600sWGyTMTebpuhzF08KzxjDwqKxTBpDWHy9pyU5GdMi9VH+ndCgSfU39N4P1TSWQQ4Q2SW662bTmriptisJ+jQ6O4nzmreYNoUvfCiVU1koLqegQseN19XqK4yjIhJMilt/0qfaRAs8Ps24gZT5X0cCl542SOEsxkzFHstTWBn4I3R9mjGzv2yhvCLzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJlAiLnSE+x79VjEejD8tkjWQkECtwfvtKZH9OBFWUQ=;
 b=h60aTmgjUPtijBbdU7Av7HfKV/8cd5VXOZSRcLsWbk4yP6ivpW2d7lGjaeIDMN6lpBdZw0+Xj/FmptDtSC4I9XNo/kIhSV0FjnvTEmuTErRmMyu+BVPpDJJnipEZY4wgJgMwPiv9F8p+q8GxHM+rUfggwfl6lwE0iNG+/4wp6u7zdBEwAVGrSAs4+hNiNDZLHS9pz046JKSH/ZQ+nVZ9vPzrKKDs9u+MmcUmsfglG4Ceu6h3NH0J46Q7ThRVHh/71XHCvRRpWJxALCqZ5SJnbwW+dKJ0WT7Gomm4G64ELqEQXfVUQEtBBCHSFmJLoeai/KPkHltpEojx6QDfJRt1AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iisc.ac.in; dmarc=pass action=none header.from=iisc.ac.in;
 dkim=pass header.d=iisc.ac.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJlAiLnSE+x79VjEejD8tkjWQkECtwfvtKZH9OBFWUQ=;
 b=kqpkadr2ymS8IJhFHO0khPbHY8hCeWNYMBgISOtUB3rR3L+JAjWH+xndAe3+jyGzEeI+hIiUPNgLpDDiDXESZWplX93xLDo09adYjDVVjquj09axnu5Q5ZQV3BcoHxcd5dMmCdLprxSOopvIguFd3KGW2LME0IeCn1F1ZRL9zOw=
Received: from MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM (52.134.132.151) by
 MAXPR0101MB1131.INDPRD01.PROD.OUTLOOK.COM (52.134.132.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 06:10:30 +0000
Received: from MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d4df:a504:88fd:f459]) by MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d4df:a504:88fd:f459%12]) with mapi id 15.20.2178.018; Wed, 21 Aug
 2019 06:10:30 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: Help with AppArmor Full System Policy
Thread-Index: AQHVV+UM5PH9CoIoRk6vHDTOZXd+1A==
Date: Wed, 21 Aug 2019 06:10:30 +0000
Message-ID: <MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0@MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-originating-ip: [14.139.128.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfc69048-115a-4f92-b8b4-08d725fe4505
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:MAXPR0101MB1131; 
x-ms-traffictypediagnostic: MAXPR0101MB1131:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR0101MB1131A0790E5C27A385AC8D2AFBAA0@MAXPR0101MB1131.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39850400004)(376002)(366004)(396003)(346002)(136003)(189003)(199004)(19627405001)(966005)(66066001)(74316002)(53336002)(99286004)(26005)(7696005)(1015004)(66446008)(54896002)(66616009)(66556008)(478600001)(2906002)(107886003)(6436002)(76116006)(7736002)(66476007)(6306002)(55016002)(5660300002)(236005)(5640700003)(9686003)(6606003)(64756008)(6916009)(25786009)(66946007)(4326008)(53936002)(14454004)(316002)(8936002)(3846002)(606006)(186003)(99936001)(2501003)(8676002)(1730700003)(486006)(6116002)(71200400001)(71190400001)(81156014)(256004)(6506007)(52536014)(5024004)(102836004)(86362001)(2351001)(81166006)(786003)(476003)(33656002)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR0101MB1131;
 H:MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YdNghOpiWG0Sk6lmuiA9uL9mj/r6JXmoNCFnVub0XCSamOm829/rR+18i5hj5b69po0WP2S62cOMv+968V5nmWuW6Q8flYN0Zw+KWrmSW4FvCJcnTGQuOd+FDBtO9fACQ4syDAmDR0aUkAmj/UYgRH/3UUSPuYGv/T88RGGhuuE4nA7A9rPcehM3DbQsgSvDDrVsSIjEwWb3rTgsh6xQPsG54ltIPRDfuNXyq/eeeOQZT5liDzofHUOvqGrSOSw1ikWOT3cnNnIl321cjedFVcqyauJZ6vGGoLO4ZVEHzAITihKZRx5nKiIsb+oyTHOmHrwpmsW6nL05uMR+tatl+1UTpEWzTZDG44eSz1r5T02FxVvRnoVai/GW8Q5FFBOqx50JEhcyL+MHslAO6IvDK9w2wFU8lnpH8hNy8uvviC8=
Content-Type: multipart/mixed;
 boundary="_004_MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0MAXPR0101MB1849_"
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc69048-115a-4f92-b8b4-08d725fe4505
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 06:10:30.2719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oJOPeR8SgYZgr6vSR+jLztyCh+rG8hkaXcRpckJr2T4vj9oq13Xy1pN3igQHUw2RduP4uZ7MtU+6Eiz8wNOTRuwYrJ/0RBLdajNyhxhZlS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1131
Subject: [apparmor] Help with AppArmor Full System Policy
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--_004_MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0MAXPR0101MB1849_
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0MAXPR0101MB1849_"

--_000_MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0MAXPR0101MB1849_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


We have successfully confined init according to documentation on this page:=
 https://gitlab.com/apparmor/apparmor/wikis/FullSystemPolicy, and verified =
that it is working with the help of ps -auxZ.


Currently, we are trying to confine system daemons/services. But sometimes =
the confinement doesn't work. For example, daemon colord-sane has the follo=
wing profile:



profile init-systemd /lib/systemd/** flags=3D(complain) {
  ...

  /usr/bin/colord/**  cx ->  colord_profile,

  profile colord_profile flags=3D(complain) {
   ...
   ...
  }

  ...
}

However the dmesg audit logs show the profile name for colord-sane as: 'ini=
t-systemd//colord_profile//null-/usr/lib/colord/colord-sane' (sample logs a=
re attached for reference). We don't understand where the suffix 'null-/usr=
/lib/colord/colord-sane' originates from, since we have specified an explic=
it 'cx' transition for all files within /usr/bin/colord/. Due to this probl=
em, we are unable to confine colord and a bunch of other processes.

Kindly let us know if there's any reason for this.

Thank you.



--_000_MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0MAXPR0101MB1849_
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
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hi,</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">We have successfully confined ini=
t according to documentation on this page:&nbsp;<a href=3D"https://gitlab.c=
om/apparmor/apparmor/wikis/FullSystemPolicy" class=3D"OWAAutoLink" id=3D"LP=
lnk527846" previewremoved=3D"true">https://gitlab.com/apparmor/apparmor/wik=
is/FullSystemPolicy</a>,
 and v<span style=3D"font-size: 12pt;">erified that it is working with the =
help of ps -auxZ.</span></p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Currently, we are trying to confi=
ne system daemons/services. But sometimes the confinement doesn't work. For=
 example, daemon colord-sane has the following profile:</p>
<br>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div>profile init-systemd /lib/systemd/** flags=3D(complain) {</div>
<div>&nbsp; ...</div>
<div><br>
</div>
<div>&nbsp; /usr/bin/colord/**&nbsp; cx -&gt;&nbsp; colord_profile,</div>
<div><br>
</div>
<div>&nbsp; profile colord_profile flags=3D(complain)&nbsp;{</div>
<div>&nbsp; &nbsp;...</div>
<div>&nbsp; &nbsp;...</div>
<div>&nbsp; }</div>
<div><br>
</div>
<div></div>
<div>&nbsp; ...</div>
<div>}</div>
<div><br>
</div>
<div>However the&nbsp;dmesg audit logs show the&nbsp;profile name for color=
d-sane as: 'init-systemd//colord_profile//null-/usr/lib/colord/colord-sane'=
&nbsp;(sample logs are attached for reference).&nbsp;We don't understand wh=
ere the suffix '<span style=3D"font-family: Calibri, Helvetica, sans-serif,=
 EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, Noto=
ColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSy=
mbols; font-size: 16px;">null-/usr/lib/colord/colord-sane'
 originates from, since we have specified an explicit 'cx' transition for a=
ll files within /usr/bin/colord/. Due to this problem, we are unable to con=
fine colord and a bunch of other processes.</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont,=
 &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji,=
 &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font=
-size: 16px;"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont,=
 &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji,=
 &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font=
-size: 16px;">Kindly let us know if there's any reason for this.</span></di=
v>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont,=
 &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji,=
 &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font=
-size: 16px;"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont,=
 &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji,=
 &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font=
-size: 16px;">Thank you.</span></div>
<div><br>
</div>
<br>
<p></p>
</div>
</body>
</html>

--_000_MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0MAXPR0101MB1849_--

--_004_MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0MAXPR0101MB1849_
Content-Type: text/plain; name="dmesg_logs_sample.txt"
Content-Description: dmesg_logs_sample.txt
Content-Disposition: attachment; filename="dmesg_logs_sample.txt"; size=3305;
	creation-date="Wed, 21 Aug 2019 06:10:16 GMT";
	modification-date="Wed, 21 Aug 2019 06:10:16 GMT"
Content-Transfer-Encoding: base64

WyAgICAxLjkxMTUxNl0gYXVkaXQ6IHR5cGU9MTQwMCBhdWRpdCgxNTY2Mjg3Mzc1LjM4NDoyKTog
YXBwYXJtb3I9IlNUQVRVUyIgb3BlcmF0aW9uPSJwcm9maWxlX2xvYWQiIHByb2ZpbGU9InVuY29u
ZmluZWQiIG5hbWU9ImluaXQtc3lzdGVtZCIgcGlkPTM1MCBjb21tPSJhcHBhcm1vcl9wYXJzZXIi
ClsgICAgMS45MTIxOThdIGF1ZGl0OiB0eXBlPTE0MDAgYXVkaXQoMTU2NjI4NzM3NS4zODQ6NSk6
IGFwcGFybW9yPSJTVEFUVVMiIG9wZXJhdGlvbj0icHJvZmlsZV9sb2FkIgpwcm9maWxlPSJ1bmNv
bmZpbmVkIiBuYW1lPSJpbml0LXN5c3RlbWQvL2NvbG9yZF9wcm9maWxlIiBwaWQ9MzUwIGNvbW09
ImFwcGFybW9yX3BhcnNlciIKCgoKWyAgIDE2LjI3MDc0NV0gYXVkaXQ6IHR5cGU9MTQwMCBhdWRp
dCgxNTY2Mjg3Mzg5Ljc1Njo0NDU3Nik6IGFwcGFybW9yPSJBTExPV0VEIiBvcGVyYXRpb249Im9w
ZW4iIHByb2ZpbGU9ImluaXQtc3lzdGVtZC8vY29sb3JkX3Byb2ZpbGUvL251bGwtL3Vzci9saWIv
Y29sb3JkL2NvbG9yZC1zYW5lIiBuYW1lPSIvdXNyL2xpYi94ODZfNjQtbGludXgtZ251L3NhbmUv
bGlic2FuZS1lcGppdHN1LnNvLjEuMC4yNyIgcGlkPTIyNDkgY29tbT0iY29sb3JkLXNhbmUiIHJl
cXVlc3RlZF9tYXNrPSJyIiBkZW5pZWRfbWFzaz0iciIgZnN1aWQ9MTE3IG91aWQ9MApbICAgMTYu
MjcwNzUxXSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE1NjYyODczODkuNzU2OjQ0NTc3KTogYXBw
YXJtb3I9IkFMTE9XRUQiIG9wZXJhdGlvbj0ib3BlbiIgcHJvZmlsZT0iaW5pdC1zeXN0ZW1kLy9j
b2xvcmRfcHJvZmlsZS8vbnVsbC0vdXNyL2xpYi9jb2xvcmQvY29sb3JkLXNhbmUiIG5hbWU9Ii91
c3IvbGliL3g4Nl82NC1saW51eC1nbnUvc2FuZS9saWJzYW5lLWVwaml0c3Uuc28uMS4wLjI3IiBw
aWQ9MjI0OSBjb21tPSJjb2xvcmQtc2FuZSIgcmVxdWVzdGVkX21hc2s9InIiIGRlbmllZF9tYXNr
PSJyIiBmc3VpZD0xMTcgb3VpZD0wClsgICAxNi4yNzI3NTVdIGF1ZGl0OiB0eXBlPTE0MDAgYXVk
aXQoMTU2NjI4NzM4OS43NTY6NDQ1NzgpOiBhcHBhcm1vcj0iQUxMT1dFRCIgb3BlcmF0aW9uPSJm
aWxlX21tYXAiIHByb2ZpbGU9ImluaXQtc3lzdGVtZC8vY29sb3JkX3Byb2ZpbGUvL251bGwtL3Vz
ci9saWIvY29sb3JkL2NvbG9yZC1zYW5lIiBuYW1lPSIvdXNyL2xpYi94ODZfNjQtbGludXgtZ251
L3NhbmUvbGlic2FuZS1lcGppdHN1LnNvLjEuMC4yNyIgcGlkPTIyNDkgY29tbT0iY29sb3JkLXNh
bmUiIHJlcXVlc3RlZF9tYXNrPSJybSIgZGVuaWVkX21hc2s9InJtIiBmc3VpZD0xMTcgb3VpZD0w
ClsgICAxNi4yODIzOTldIGF1ZGl0OiB0eXBlPTE0MDAgYXVkaXQoMTU2NjI4NzM4OS43NjQ6NDQ1
NzkpOiBhcHBhcm1vcj0iQUxMT1dFRCIgb3BlcmF0aW9uPSJvcGVuIiBwcm9maWxlPSJpbml0LXN5
c3RlbWQvL2NvbG9yZF9wcm9maWxlLy9udWxsLS91c3IvbGliL2NvbG9yZC9jb2xvcmQtc2FuZSIg
bmFtZT0iL2Rldi9idXMvdXNiLyIgcGlkPTIyNDkgY29tbT0iY29sb3JkLXNhbmUiIHJlcXVlc3Rl
ZF9tYXNrPSJyIiBkZW5pZWRfbWFzaz0iciIgZnN1aWQ9MTE3IG91aWQ9MApbICAgMTYuMjgyNDQ4
XSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE1NjYyODczODkuNzY0OjQ0NTgwKTogYXBwYXJtb3I9
IkFMTE9XRUQiIG9wZXJhdGlvbj0ib3BlbiIgcHJvZmlsZT0iaW5pdC1zeXN0ZW1kLy9jb2xvcmRf
cHJvZmlsZS8vbnVsbC0vdXNyL2xpYi9jb2xvcmQvY29sb3JkLXNhbmUiIG5hbWU9Ii9zeXMvYnVz
LyIgcGlkPTIyNDkgY29tbT0iY29sb3JkLXNhbmUiIHJlcXVlc3RlZF9tYXNrPSJyIiBkZW5pZWRf
bWFzaz0iciIgZnN1aWQ9MTE3IG91aWQ9MApbICAgMTYuMjgyNDk1XSBhdWRpdDogdHlwZT0xNDAw
IGF1ZGl0KDE1NjYyODczODkuNzY0OjQ0NTgxKTogYXBwYXJtb3I9IkFMTE9XRUQiIG9wZXJhdGlv
bj0ib3BlbiIgcHJvZmlsZT0iaW5pdC1zeXN0ZW1kLy9jb2xvcmRfcHJvZmlsZS8vbnVsbC0vdXNy
L2xpYi9jb2xvcmQvY29sb3JkLXNhbmUiIG5hbWU9Ii9zeXMvYnVzL3VzYi9kZXZpY2VzLyIgcGlk
PTIyNDkgY29tbT0iY29sb3JkLXNhbmUiIHJlcXVlc3RlZF9tYXNrPSJyIiBkZW5pZWRfbWFzaz0i
ciIgZnN1aWQ9MTE3IG91aWQ9MApbICAgMTYuMjgyNTg5XSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0
KDE1NjYyODczODkuNzY0OjQ0NTgyKTogYXBwYXJtb3I9IkFMTE9XRUQiIG9wZXJhdGlvbj0ib3Bl
biIgcHJvZmlsZT0iaW5pdC1zeXN0ZW1kLy9jb2xvcmRfcHJvZmlsZS8vbnVsbC0vdXNyL2xpYi9j
b2xvcmQvY29sb3JkLXNhbmUiIG5hbWU9Ii9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6
MDYuMC91c2IyLzItMS91ZXZlbnQiIHBpZD0yMjQ5IGNvbW09ImNvbG9yZC1zYW5lIiByZXF1ZXN0
ZWRfbWFzaz0iciIgZGVuaWVkX21hc2s9InIiIGZzdWlkPTExNyBvdWlkPTAKWyAgIDE2LjI4MjY1
MF0gYXVkaXQ6IHR5cGU9MTQwMCBhdWRpdCgxNTY2Mjg3Mzg5Ljc2NDo0NDU4Myk6IGFwcGFybW9y
PSJBTExPV0VEIiBvcGVyYXRpb249Im9wZW4iIHByb2ZpbGU9ImluaXQtc3lzdGVtZC8vY29sb3Jk
X3Byb2ZpbGUvL251bGwtL3Vzci9saWIvY29sb3JkL2NvbG9yZC1zYW5lIiBuYW1lPSIvcnVuL3Vk
ZXYvZGF0YS9jMTg5OjEyOSIgcGlkPTIyNDkgY29tbT0iY29sb3JkLXNhbmUiIHJlcXVlc3RlZF9t
YXNrPSJyIiBkZW5pZWRfbWFzaz0iciIgZnN1aWQ9MTE3IG91aWQ9MApbICAgMTYuMjgyNzYxXSBh
dWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE1NjYyODczODkuNzY0OjQ0NTg0KTogYXBwYXJtb3I9IkFM
TE9XRUQiIG9wZXJhdGlvbj0ib3BlbiIgcHJvZmlsZT0iaW5pdC1zeXN0ZW1kLy9jb2xvcmRfcHJv
ZmlsZS8vbnVsbC0vdXNyL2xpYi9jb2xvcmQvY29sb3JkLXNhbmUiIG5hbWU9Ii9zeXMvZGV2aWNl
cy9wY2kwMDAwOjAwLzAwMDA6MDA6MGIuMC91c2IxL3VldmVudCIgcGlkPTIyNDkgY29tbT0iY29s
b3JkLXNhbmUiIHJlcXVlc3RlZF9tYXNrPSJyIiBkZW5pZWRfbWFzaz0iciIgZnN1aWQ9MTE3IG91
aWQ9MApbICAgMTYuMjgyODAwXSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE1NjYyODczODkuNzY0
OjQ0NTg1KTogYXBwYXJtb3I9IkFMTE9XRUQiIG9wZXJhdGlvbj0ib3BlbiIgcHJvZmlsZT0iaW5p
dC1zeXN0ZW1kLy9jb2xvcmRfcHJvZmlsZS8vbnVsbC0vdXNyL2xpYi9jb2xvcmQvY29sb3JkLXNh
bmUiIG5hbWU9Ii9ydW4vdWRldi9kYXRhL2MxODk6MCIgcGlkPTIyNDkgY29tbT0iY29sb3JkLXNh
bmUiIHJlcXVlc3RlZF9tYXNrPSJyIiBkZW5pZWRfbWFzaz0iciIgZnN1aWQ9MTE3IG91aWQ9MAo=

--_004_MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0MAXPR0101MB1849_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--_004_MAXPR0101MB18496A0ED534699EA0D9F74EFBAA0MAXPR0101MB1849_--

