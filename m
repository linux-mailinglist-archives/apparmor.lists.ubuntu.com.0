Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 307DA3282B0
	for <lists+apparmor@lfdr.de>; Mon,  1 Mar 2021 16:41:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lGkfN-00007V-Od; Mon, 01 Mar 2021 15:41:01 +0000
Received: from mail-eopbgr1310115.outbound.protection.outlook.com
 ([40.107.131.115] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <indhuja.a@tataelxsi.co.in>) id 1lGkfM-000073-IE
 for apparmor@lists.ubuntu.com; Mon, 01 Mar 2021 15:41:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYvBM0mMW3JURqjxXEvt6/BpVleyfpYXD1mtmBoJ/VJJhXNF2N5YckggdMWjfjNetY17m/dFMK9dy3T0wb2cmhpDP+bh0GufKiJ6idlb5/p847EVVIzcdmb3ukCzGD0/CrpWZJBQ6oxsm+EmLjUS9OKQLzgfIXNwTHBd4cq3k1oQQL5jRFnLkzKYXX8Is7ZGX6Rgc3rcz5EeWmHSLLt/SpTepd8b/LD2HFWhvI5Nm1mUbKe/vjuo1cc68fOrjHgtf/wb7U0MoVHAyEcQV9pyF9C3SFIpYl/LvJpny3tJr70KAlyJ2mLnuuftQY1/7ycurw34Pk6EMr1zj9MrZfsBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSmTFuhtK7y5MIfSO+xevHF0CWMYOl9aLGgf7YEnM4w=;
 b=YS1JNFaHboxLZWl2BWDcQOUH5SHL8OYLSEBZI9nxGyhC7mYYCYRg9oRTIh0FP5QGXzvO1U+f101T8aKOoAzMsdfrsGWtsA9kJ47G+GHHxT1BISJVpdnD8ICPKsagwnqRlmJ2r9OQd1uQBJWS56FKdl8A+6FPSFhtvw94J9OBGje4tfwlAit21qFO4wA/SXVNydwFqz2w138IT+D9sM+uRo4Xr7qZn4YvkxrtHNRcyvTIP3Cyh0JBzFuPV9rjHdRcv2KA6EOce0qCm8+r6AR4lew+pjVGmDeyV85j8x2sH4ilmrg+d4v8s6fwslxxZyp/X6n7L7uqdFeA23peqzXFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tataelxsi.co.in; dmarc=pass action=none
 header.from=tataelxsi.co.in; dkim=pass header.d=tataelxsi.co.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tataelxsi.co.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSmTFuhtK7y5MIfSO+xevHF0CWMYOl9aLGgf7YEnM4w=;
 b=Ykux6nyLC0ibRa3Mb6wL4UAqykGX0xpFQW0pGGrB3TbtDeTYtrB4VXKDq6lNdFjtZCg1c+Yi72NLS8sb+gG1Sh1rEEiCRuqooCbS2+PQV1bd7NwBAQgf5SSJhenNaXROo7RMOD4Si3tB+QS8aP28N/q37ZKtXnBf/Xv1wf7BpWGui7wZoi1lFV5/5jCS2zBF+MN/ZNwa35ESZ3kbXdCOnkS9eRNHY+gHYkL8dyaED4KjBpV19ZxmBhecKMrwZ5s+JxYmO8aF624AETv/+qntz2NvSyVy5MHjRHzk9HmoSKoIUZ1p8uW774e+D1I72cEgfT7mLhNiEUfqXstSYJ4aOg==
Received: from PS2PR04MB3719.apcprd04.prod.outlook.com (20.179.113.214) by
 PS1PR0401MB2107.apcprd04.prod.outlook.com (10.170.182.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Mon, 1 Mar 2021 15:40:57 +0000
Received: from PS2PR04MB3719.apcprd04.prod.outlook.com
 ([fe80::9022:683b:2d85:253c]) by PS2PR04MB3719.apcprd04.prod.outlook.com
 ([fe80::9022:683b:2d85:253c%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 15:40:57 +0000
From: Indhuja A V S <indhuja.a@tataelxsi.co.in>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: File permission mode
Thread-Index: AQHXDq0qgzxHG5EaaEqW21qfiIniGQ==
Date: Mon, 1 Mar 2021 15:40:56 +0000
Message-ID: <PS2PR04MB37190144D36EBE2DB14529FFA09A9@PS2PR04MB3719.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ubuntu.com; dkim=none (message not signed)
 header.d=none;lists.ubuntu.com; dmarc=none action=none
 header.from=tataelxsi.co.in;
x-originating-ip: [165.225.122.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3a899f2b-5959-4046-50c6-08d8dcc8680b
x-ms-traffictypediagnostic: PS1PR0401MB2107:
x-microsoft-antispam-prvs: <PS1PR0401MB21074A9301DEAA47D8F7AD08A09A9@PS1PR0401MB2107.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tlu7eSoSiXzyDm8LNYkEw3pPJe5zEj/TQkrCtNhGa0WP+hI1air+/646cF+dFoIGw7xPkoab5MahNj/Fj8DcU+5BQ0J//AqmoPTQAtyx88Sg5wYzgfxmd4YleiwCc6yyU3Ff9p06g/06oVmpW36y0Wb1Zmgpix5iBebIgKXGrxXIy/kJFfKlnCJgVg9A1OxtUSH6JVUdUk5wC6aPE46PaFPud7hTdX/uzf4UZJqyI72lsMYeio22rVFlFr2gnF+aJZFU15VgvQHBaeumf04GVvf5tVyyJmV0pv8TLaQ/yn2XnXAOY6nR3Ue/At7OGUaRcUJrsdNjOUxq/YPq6W5DZqZDildl7p5l2t+UE6nFxiy3VFrHRIM6i5dpyQG+WIy+RZf/M2oEeX9P2lx0Dm1NsDLhIEr14g87rnUflc4/KI/M2a116qP3UWfCKP/1JUHLhQzU2Vl3Fqeg0pF09ZChukgAF1qhL6f621a5ZA6vRtKt4n+zgGjvjOJvMQo1z8J4CPSqJg99r9sCdCnKWKmCqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR04MB3719.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(8676002)(7116003)(6916009)(7696005)(3480700007)(86362001)(6506007)(478600001)(19627405001)(5660300002)(8936002)(55236004)(71200400001)(66946007)(76116006)(91956017)(2906002)(186003)(26005)(52536014)(66476007)(316002)(66556008)(55016002)(9686003)(66446008)(64756008)(33656002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?Idu0A7BlvgH7l0iAImIViCEBSN90XE2vNMKKtNgGkzL2L0Q3t9mTLMRYhv?=
 =?iso-8859-1?Q?WiPzLtMU9nvEkjNJn4RiDbzP0Xib9kAgNDiUyGi9zaSsIT39Pe3hevaftL?=
 =?iso-8859-1?Q?otFhGvMA+HyK78VfH/kAC0vbF5dB6VO4djKNpPF1AOQRZ4tOBVH6kTiBkV?=
 =?iso-8859-1?Q?GHPKs5mq0Z5V/GdWuiR4AN54cyPWM1SyzrLM2Tb43mM7UJtZByuV7K223w?=
 =?iso-8859-1?Q?sMjqsUbrrE0kvCpF1eYaWhnndpnrIkH2a28i7WQdftkmresuNayy+7nYBH?=
 =?iso-8859-1?Q?kunGB0brzYSqrOOTo1LqbHsIfeYev95hqQdGPhGMh+cCuCg/94+6XH0vo9?=
 =?iso-8859-1?Q?lxRgQDFpVfcxj+U1KoojqvFzjxl9VfxpbcY/cbn3iPuoXlUV5yUdlOZ4SC?=
 =?iso-8859-1?Q?NOD+BOG3ozayRnm+tDtjJ2s/NkVUMy+QWr8u3lbUYvZvTLr8a8wOtaNucd?=
 =?iso-8859-1?Q?kXAnFM7iszM+Qk3D42IMnGudYBmpIOrp98yY6GVJG9YXOvh/JGv+Q3E7lA?=
 =?iso-8859-1?Q?ZTqfg+6wDJsdMu9gJjsR0URe70gnJXwxkMTKpeliFycRZJyzdl9toSokcf?=
 =?iso-8859-1?Q?q1yuV4V31Prh1sZLw2f0EHycdvSKGMH4XP0ogHfWhKohziF3BMimbWsX9A?=
 =?iso-8859-1?Q?I/Ho2jnO1tjSvNnj3PyJ/CGpg/zdFARYhbAuJHwCe8sq++3K7U1R+OAJYq?=
 =?iso-8859-1?Q?ytK3rAUDjGcC9KzvTgJz5fhHfQLaY6M48bLkM3Ccvp92AQaFVWvOME10Zc?=
 =?iso-8859-1?Q?igJKEo4y7nAGE7PVfhXt9CzvTQyndNoyONg78CgfqW180esxzO2eWUqetq?=
 =?iso-8859-1?Q?Vpvrg2VN51vSrTvjxO1VJAYJju4vobdSGSKF/W/GG7OvS923qWepLtF2kd?=
 =?iso-8859-1?Q?HMhRUrBRwdVHhocZwfQAMojf+8M/R1gUE7CjHsB+/kKZMiWN2EOazn6Rx7?=
 =?iso-8859-1?Q?ZZgktIJgQaj5KJIsnE/eKbleahGmh0/kspRf3a/7arehEEKIHI4/Xfs9wB?=
 =?iso-8859-1?Q?I8EaWHD2ckiVDtWAdsN7CljR49uSJIV6GlQf7SaNarbLkrFFXcgX0qhn0S?=
 =?iso-8859-1?Q?bBSmUUKsyffT7nrmCB+AAT+CzYtuSTiHtXSdAgJQwtPPaeQE8jJSuXgH+P?=
 =?iso-8859-1?Q?dssJM5DhU6lTnAhxRv1zm2fYgDmKdW6VN/icYBNvx9kwt7HkPhWn/VT5gc?=
 =?iso-8859-1?Q?KTxOV+Unf0YhAfZ3YiD0PYGFl2db6cIQvEu5lNlhAzLNMUL3z+0hOqhNoG?=
 =?iso-8859-1?Q?xI3OvM5N0GSjzpLFacVrrBqpLrpXsvLje/11Vq7Gix2MQvWc8hdLeHhQYo?=
 =?iso-8859-1?Q?nTT5FO1VP9yU5aYrx8knCgZMC0GRpEXCt6dJU4qNq+O6u3A=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: tataelxsi.co.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR04MB3719.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a899f2b-5959-4046-50c6-08d8dcc8680b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 15:40:56.9317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ad6a39dd-96b6-4368-82da-f2ec4d92e26a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MCLkkeB+g7bIYGEHa/fmQKFAA8WMtGNnr/MyGMbCmsT7iwKcTLxXhN+UPBv5fbDGjFTw+ABgbsMp85ip+DvfP65f6LU/ngSdAJ67SfM9B6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0401MB2107
Subject: [apparmor] File permission mode
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
Content-Type: multipart/mixed; boundary="===============3509179714729929945=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============3509179714729929945==
Content-Language: en-IN
Content-Type: multipart/alternative;
	boundary="_000_PS2PR04MB37190144D36EBE2DB14529FFA09A9PS2PR04MB3719apcp_"

--_000_PS2PR04MB37190144D36EBE2DB14529FFA09A9PS2PR04MB3719apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I have the following questions regarding file permission access modes,

a) Why multiple writes are used in "/dev/shm/* rww" and "/dev/shm/filename =
www"? What difference does it make by using multiple writes instead of a si=
ngle write?

b) What is the difference between rwk and krw? I can understand that order =
of execution is different but how is it useful?

Thanks and regards
Indhuja
________________________________
Disclaimer: This email and any files transmitted with it are confidential a=
nd intended solely for the use of the individual or entity to whom they are=
 addressed. If you are not the intended recipient of this message , or if t=
his message has been addressed to you in error, please immediately alert th=
e sender by reply email and then delete this message and any attachments. I=
f you are not the intended recipient, you are hereby notified that any use,=
 dissemination, copying, or storage of this message or its attachments is s=
trictly prohibited. Email transmission cannot be guaranteed to be secure or=
 error-free, as information could be intercepted, corrupted, lost, destroye=
d, arrive late or incomplete, or contain viruses. The sender, therefore, do=
es not accept liability for any errors, omissions or contaminations in the =
contents of this message which might have occurred as a result of email tra=
nsmission. If verification is required, please request for a hard-copy vers=
ion.
________________________________

--_000_PS2PR04MB37190144D36EBE2DB14529FFA09A9PS2PR04MB3719apcp_
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
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have the&nbsp;following questions regarding file permission access modes,=
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
a) Why multiple writes are used in &quot;/dev/shm/* rww&quot; and &quot;/de=
v/shm/filename www&quot;? What difference does it make by using multiple wr=
ites instead of a single write?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
b) What is the difference between rwk and krw? I can understand that order =
of execution is different but how is it useful?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks and regards</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Indhuja&nbsp;</div>
<hr>
<span style=3D"font-size:12pt;  font-family: 'Cambria','times new roman','g=
aramond',serif; color:#000106;"><i>Disclaimer: This email and any files tra=
nsmitted with it are confidential and intended solely for the use of the in=
dividual or entity to whom they are
 addressed. If you are not the intended recipient of this message , or if t=
his message has been addressed to you in error, please immediately alert th=
e sender by reply email and then delete this message and any attachments. I=
f you are not the intended recipient,
 you are hereby notified that any use, dissemination, copying, or storage o=
f this message or its attachments is strictly prohibited. Email transmissio=
n cannot be guaranteed to be secure or error-free, as information could be =
intercepted, corrupted, lost, destroyed,
 arrive late or incomplete, or contain viruses. The sender, therefore, does=
 not accept liability for any errors, omissions or contaminations in the co=
ntents of this message which might have occurred as a result of email trans=
mission. If verification is required,
 please request for a hard-copy version. </i></span><br>
<hr>
</body>
</html>

--_000_PS2PR04MB37190144D36EBE2DB14529FFA09A9PS2PR04MB3719apcp_--


--===============3509179714729929945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3509179714729929945==--

