Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0679AC3E82
	for <lists+apparmor@lfdr.de>; Tue,  1 Oct 2019 19:25:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iFLtw-0005u9-5Z; Tue, 01 Oct 2019 17:25:28 +0000
Received: from mail-eopbgr1380072.outbound.protection.outlook.com
 ([40.107.138.72] helo=IND01-MA1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1iFLts-0005tO-R6
 for apparmor@lists.ubuntu.com; Tue, 01 Oct 2019 17:25:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rem9KxyHzb51jTxf7Xw/uGOOHcJuS3cPaaV9Ay1nzsts5xdC+ZZq0IYy5ZvCHGQh/JcZujJudwQ8/PbXgv2pXp+153DXJi4BopU5aqx0VFqlCEGZzIBNyI96V9EyyToVmhBd94+OdHO4NOxCQeMnpYGhSctNO7XOFeHSAwLptRd7XNi2WHJMSlbFf8Gm3V2sKOUzG6FI53MHmbFZYpi4JFYvBYQXnZv5rOK7XxMFmlSIGBjvZeXYEENh0uAEfC5RsmfCXd23/cYA6lpFWQriL9dWd74vnJrC+FlsSB6igQvF02xfC/oVEbntng1t7RUU6eRwyu3QltaSxjVaDSLA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd7kNNvUylGQB1eIYp5w4NsWMojcIPlMEFxCHwtb07Y=;
 b=GSoXN6JAPw+XPoEub5OdY9+UNjIf9aaUnqRlm2d5tD3gS182BqHltHDDuYwgZbkgUavyKe84OoNhkEBO35E8zXV0BVlEuZ6VoW2NliGPpZ9N/A0KYnP4j6E4Z+TT5VRZytID442pkfy3H9bz6+LfcYgRJJZiUu8YS9S+Tx++kfeh2TyONEgWs6i9yWcSnq15rkrYqm/ZWvM6zLcci79yC0oXzB99H3I0hpOsh5x6rSeKHTMrrPQHHpXZI4NjRrTBAJJiySEzjqkBHywOlYXuqv8mULmyeOeK+ul3m5D0LAxvwy0532rUQ0CDef6f+bPOg7tmxSKLbbNBIs3nQlRezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iisc.ac.in; dmarc=pass action=none header.from=iisc.ac.in;
 dkim=pass header.d=iisc.ac.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd7kNNvUylGQB1eIYp5w4NsWMojcIPlMEFxCHwtb07Y=;
 b=qWRNysgNI+uOTx78ic/QXP8VOh/2BFwtTK6LxOdsTkRHS2lbMNWnSGZ366U0kU+ctBGunCgL+sYvNvQRLKEwA3X8MNrIhl0o9xzpsi1BNQFrr6c65qsYKgt3NZeWhDoVmB75O1gA3ulJ6kW/scDHwTPYBxYUCa8DdrZObfIDYKE=
Received: from MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM (52.134.132.151) by
 MAXPR0101MB1961.INDPRD01.PROD.OUTLOOK.COM (52.134.130.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 17:25:21 +0000
Received: from MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::51fd:5109:627:7064]) by MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::51fd:5109:627:7064%7]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 17:25:21 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: Query about AppArmor's Profile Transitions
Thread-Index: AQHVeH0r7YNQO4OkDUmL/twYD8/vZg==
Date: Tue, 1 Oct 2019 17:25:21 +0000
Message-ID: <MAXPR0101MB1849CE559A8177539D0CBFC8FB9D0@MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-originating-ip: [183.82.21.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 012bba39-cc75-4165-dc62-08d746945629
x-ms-traffictypediagnostic: MAXPR0101MB1961:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR0101MB1961DDC1BA768D59112FA72DFB9D0@MAXPR0101MB1961.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(396003)(346002)(39860400002)(136003)(199004)(189003)(1730700003)(486006)(6916009)(2501003)(476003)(66066001)(6436002)(107886003)(3846002)(6116002)(256004)(33656002)(5640700003)(52536014)(105004)(6506007)(71200400001)(71190400001)(8676002)(81156014)(4326008)(64756008)(99286004)(786003)(316002)(8936002)(19627405001)(86362001)(478600001)(54896002)(74316002)(25786009)(5660300002)(7696005)(9686003)(7736002)(102836004)(66946007)(66556008)(66446008)(66476007)(186003)(81166006)(55016002)(26005)(14454004)(2351001)(4744005)(76116006)(2906002)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR0101MB1961;
 H:MAXPR0101MB1849.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DMKrB2bic/3lOVbp2E1Rrc8Wzsu7VaQOToRqImE0bT7zuWx+eWT9IkbwRbaFsE9u19tugi3UTjWhYda+6V9sRtgweIzGAt3TuwY15TFiGNZVCWHHzUZXg06b103cZBlEQZn5GDJ+6/uYb4QK8z5csWfjfcB6d8kTAVMQxC1LCuOIY5dw9jpNKau6XD/lqzbjZE8EuTLjKYANdYcDgIikS/N6FaxkVQopPpFa6j6KAv8ptrmi8fhnzoWeKJyYHTRE6ktBQGb9R2CfH1HWjDXeIobWfnUESZ9SXzxNDaYkRfUYf+7u922MHG9CH4cuFZwklLpwF/v10jaUGCugKok129wZftAfgVzQLnv+ScK//id8unxdNQCS1gytEMxtDlo7mDmZw8FHuuC/pIhelbE9mtEjBV4rlhzJV476s9xmcmg=
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 012bba39-cc75-4165-dc62-08d746945629
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 17:25:21.0387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 043dWyRy34iGca9VBne7DxUM4RJW3oAlzKOie8zcq0qqqDcqXAHScBNZG+fLiI2Kywk+/ktK0NtEA+AbrXvTqPwMAuueQR9wFQNZd5hAW9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1961
Subject: [apparmor] Query about AppArmor's Profile Transitions
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
Content-Type: multipart/mixed; boundary="===============0966702581560281762=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============0966702581560281762==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1849CE559A8177539D0CBFC8FB9D0MAXPR0101MB1849_"

--_000_MAXPR0101MB1849CE559A8177539D0CBFC8FB9D0MAXPR0101MB1849_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

We had a small question regarding AppArmor's profile transitions.

Currently, AppArmor allows 'pix' and 'cix' transitions. However, we would l=
ike to extend AppArmor to
allow a 'pcix' transition. To clarify what we mean by 'pcix', we're looking=
 for a way by which we
can specify the following policy: 'look for a specific profile, but if one =
doesn't exist, look for a
child profile, otherwise inherit the current profile'. Are there any challe=
nges to implementing
this? Also, is this a feature that is planned for release in future version=
s of AppArmor?

Thank you,
Abhishek Vijeev.

--_000_MAXPR0101MB1849CE559A8177539D0CBFC8FB9D0MAXPR0101MB1849_
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
<span>Hi,<br>
</span>
<div><br>
</div>
<div>We had a small question regarding AppArmor's profile transitions.<br>
</div>
<div><br>
</div>
<div>Currently, AppArmor allows 'pix' and 'cix' transitions. However, we wo=
uld like to extend AppArmor to<br>
</div>
<div>allow a 'pcix' transition. To clarify what we mean by 'pcix', we're lo=
oking for a way by which we<br>
</div>
<div>can specify the following policy: 'look for a specific profile, but if=
 one doesn't exist, look for a<br>
</div>
<div>child profile, otherwise inherit the current profile'. Are there any c=
hallenges to implementing<br>
</div>
<div>this? Also, is this a feature that is planned for release in future ve=
rsions of AppArmor?<br>
</div>
<div><br>
</div>
<div>Thank you,<br>
</div>
<span>Abhishek Vijeev.</span><br>
</div>
</body>
</html>

--_000_MAXPR0101MB1849CE559A8177539D0CBFC8FB9D0MAXPR0101MB1849_--


--===============0966702581560281762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============0966702581560281762==--

