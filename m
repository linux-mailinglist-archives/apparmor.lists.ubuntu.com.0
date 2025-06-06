Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F10AD0674
	for <lists+apparmor@lfdr.de>; Fri,  6 Jun 2025 18:12:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uNZfy-0004Cr-Qk; Fri, 06 Jun 2025 16:12:14 +0000
Received: from mail-out.emea.daimler.com ([141.113.9.133])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <sathya.panneerselvam@mercedes-benz.com>)
 id 1uNUML-00082i-6U
 for apparmor@lists.ubuntu.com; Fri, 06 Jun 2025 10:31:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H31Ng0JQzlFPy5N89MWBWv7GDTAKBpVgOV8vCyKXW/YiPb6xMDoLYFVbN5YglTUqJ5ctIt2v65D5h42DKLLTodtdxju6MwWBcMoxse4i84Ovyu4svEOuNLdI+NK5I41ElPrp0paV4CPFHpTRVs8k7b0+Dl+6IE5nsiBT6BeDyM9daWBUOdowsCVmLIkyGOmMfoLV3kMGZ++q2Cgl1MHQiUClkQqMczam7baFD+4IBbKFHOqGDq5DI13xImgvalV9qWTmlrCDFYIGqnKNUQY4/fK4pMPd7VDgbb1t8zBPgy+Yc9vHKZ3mmh7zB2EsZlhOahbuNJFlnqQRbfLxXAesZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTHBfMiuQRuzNLV+lQbcV9MyVuCrSbvJHAQARVSDbBs=;
 b=pVIb59RKOoA5mTYQ0GOoa5h5tuAN15YeiiVaHnBA6Fs/7aqjJrB1sWqG5uYk87fp1Rt8UCo/LfRVuTHrgZmt6mgDWIJNRY5vJ394HR9yWawHUxKFeDTRJvTu7mfFMZNJf771xJMvmzJZdPxfgTkqPuYPZK/5oGOvhImZfsGo5S8rAGE+vJLghGXmfEV8w8/Axboc705uz8dvqA18mVqTt344Omj8Evk0/SsFOHCMZQLEr5JaATBY/8pIw/4tSUP2y/zHpX0QzKnPwG9vjscZbPq+gmt/YNOuR8AjpBD6vUKx5y4FKAooHL28/KgwFuSCIS44cMFE3MJBaJH/Tzcvcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mercedes-benz.com; dmarc=pass action=none
 header.from=mercedes-benz.com; dkim=pass header.d=mercedes-benz.com; arc=none
From: <sathya.panneerselvam@mercedes-benz.com>
To: <apparmor@lists.ubuntu.com>
Thread-Topic: Licensing issue in libapparmor
Thread-Index: AdvWzhP7pEHXqR1ER6udEz3+FB4B1w==
Date: Fri, 6 Jun 2025 10:31:34 +0000
Message-ID: <VI1PR07MB3215A3CB1B0B36428C9B0EC0DE6EA@VI1PR07MB3215.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR07MB3215:EE_|DB5PR07MB9514:EE_
x-ms-office365-filtering-correlation-id: 3ca4680e-9ad5-4256-ec1b-08dda4e54f72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?fvK7AT3409a1m0jDjQUgHFb3N0F3YNUPm6yeFNMx5v9HFhSErG7UXtNn50?=
 =?iso-8859-1?Q?DK9h5at6ZMgtjm+qy+yeaDjSIrroJEhWWqtd8A2s6FKIKRjnn8emllhka8?=
 =?iso-8859-1?Q?ykcDgfoSCI8gY2sjxkB6XbTL/YqpgXuok1Uj5iF8JHDBg7/sTYUw/WjWm/?=
 =?iso-8859-1?Q?0YlAJ59YOtjWDoZzeR0j7IseZ2Txim6zorg5wSjpktwYzQzxTIK1Sf+lwV?=
 =?iso-8859-1?Q?Qx3S7SniAac2B9DSMO/ZUv2lOhDdFpH+4iTwe7Wrmjo+acOJkThtPD2h/4?=
 =?iso-8859-1?Q?yRxNtSFMJ4nAVlpUsNH0r58FOEyX8rs/uSynFn68wW28KwLG+JJQMus7XK?=
 =?iso-8859-1?Q?0OJ+Z0Fr0KAwTJ7ulMWa1OVQsxOO+N66Dt3GWnVZiRYoS85YJyHe6ERphr?=
 =?iso-8859-1?Q?Ns3CZBFXkvmvTCbsBZwuBYvWtBQyqIdXu2hoQHvjiIfAShqXELjH9xwcUq?=
 =?iso-8859-1?Q?ciY/4TxacMpTwGrq2+BgHxB1K5Occ6PHfK4cYwq/b+UTscY2IKnpduoySG?=
 =?iso-8859-1?Q?be8uqkVN0/gb+LxQdmqDq9Q6kQwaavq9mNdxgi+a1Tt6dWyvZHdp1jbd2N?=
 =?iso-8859-1?Q?E48etKV7KWQ+b9twgschkUq22e/nVMaEuEb3eA2tWvoueCv0lxYXw2PtAb?=
 =?iso-8859-1?Q?Q3Z8HBu4AATfZD+56BQT1n0XZCp7Urn/4iqamc75v33Aw/rdUwhOBGwUBm?=
 =?iso-8859-1?Q?aMdvkXQWYziMOsh3SgO8+bKQrfYBwv/ayQtUQkpQOv30VdyMwGyH6QS6Bd?=
 =?iso-8859-1?Q?7vs6+7GuPsBjRug/8XxtqKQMl7uaJTj/uujNimBcFdWy4/3c3oMO2hp3a7?=
 =?iso-8859-1?Q?mJfeSYKOEJwa3aVpwIDVNnpyPvA/pw3IahZnSAwWFTNXvf7air5lGu0n/0?=
 =?iso-8859-1?Q?Fw3SHrnDFUReUl4pJQlTeqTwfY0eKUDj10Z6y5XOZRWfTpsB3HNIbecnVQ?=
 =?iso-8859-1?Q?+ivr4n1S9/kmuCYzig7FYoaXEgDyudRYjvxZ2ppO3BqSBcKwVRQJKShDuK?=
 =?iso-8859-1?Q?qQG/Q5wx6UaMeDMQLFWmmLfqC8CeY1307MQAspYK6sNO0KBMzBSTq/yVYi?=
 =?iso-8859-1?Q?DAsQ2anhFCXuf6XVhZ8qbO7ZI1JPjR5EzjyTmWA9w5cho+oo2IIsKCpX48?=
 =?iso-8859-1?Q?vh+TRV9+Qq2n1ggfeRcq4oLmUzA/i5fq1p1NHqhgbih/APip/ds/nmWNer?=
 =?iso-8859-1?Q?ECi6FdSVN+zFPRZHjDd/5RxK0GShugB1xKK5FB3SL7tZHGjbuCC82pQ2LB?=
 =?iso-8859-1?Q?/aZZxqnp+nQYKUFsORVyqHPE5W8zAUG5BEy38pc4kJkfSceL7yQSMjAO0A?=
 =?iso-8859-1?Q?d59VGVKKK+UxP+ip5Kaj+pO+P4X6w0dtvaXrubQ/mnum3eRY2EFX1xlAbz?=
 =?iso-8859-1?Q?bE3DRo+z5bY5iyO2PhkpasDeN5uDF+Sj904jh8ZRWR/jzuv6KfJ48Q7IFi?=
 =?iso-8859-1?Q?N82dfym+/mqQWlx40jxTXBdgJl+uaumdusHEZbix56WgiSb4HxsUSkne9+?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR07MB3215.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(4053099003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2Qq+Ru4p6P2rvEZRXM04suQfe3N6We3/EoV13J+rJsTBxAR8gT4UacxgLJ?=
 =?iso-8859-1?Q?/rrQGCFQ7D0w1Ja/r7a8WUm1xdSITqzsluQ8ZwcBEPjC1TMh6ObWlI1q0w?=
 =?iso-8859-1?Q?qj7D9WYQNTzMosvCF3CEv7thmyna9YCevERpcI4Rgdz6D+BvL4t6GpNdYV?=
 =?iso-8859-1?Q?cTpbeXK4rUGC8udR6ykzUdA6K9iGm3hTzIavfJSxXOGpAUdk6kHQegd3h4?=
 =?iso-8859-1?Q?KSKK2gQ/zoqaHAbJtMFv3c7rfSkkYYEleLrA0S1oe547e63P7RkWtDK8TI?=
 =?iso-8859-1?Q?F9k3bFPl3kO+3QeT1hVaLMqINpr0+IT1vZhpUqMCg0RtqzNV15zluz52O3?=
 =?iso-8859-1?Q?Fm7L0G7FtFYH8EmsPMtZgodl9CQ2V9SAr1lm+r3BmvoE+PPmumuxTq6QdL?=
 =?iso-8859-1?Q?UhqlgoOkwSZ0A0SgokmtaYjHQxXexcxfsJJVkLOJ784Za46OyThAxmPmgi?=
 =?iso-8859-1?Q?BzRatGDyxkrfEM7G1BO3jpKkLl92ngH23ZfFLAIQ+nEJRe2rpgSGg141XD?=
 =?iso-8859-1?Q?MigfVEnCxVkqSsfYCDvnTZMq+J2c8zIj1JPCef1mDm+5kazk76y5n9d2oP?=
 =?iso-8859-1?Q?XO90sxgG+tshVsy+Xe+vIKCw3ZOkPAM2qWn+QjmSWDltxlclny3YA0C6Mk?=
 =?iso-8859-1?Q?wFX8ifEhFHZzLRdiglC/PaiKNY4GpLeUPKPysndrJRifgvDMbPh/QCjK76?=
 =?iso-8859-1?Q?umS4eHmIJv3wFqXRkEhUMGHO6XRo9ZWjJ2hbjglTtlamF3hJtGhqi/rwT8?=
 =?iso-8859-1?Q?kl4vJL0/7utlLdVmFdUlK8TxTK/+wt/VpdNPVUExUO56HGGSKC/Rk9JZ9T?=
 =?iso-8859-1?Q?7jc2YuQMt75MyIR4raXCm7czWNQiRfpVXEnr7PrHB9B5YGc7J2GwWBu6yN?=
 =?iso-8859-1?Q?lL6UYKSkwTG4naITPFD40pmwaFZhgcbx2XupvCxXafXZtGW9dmCV2AYq28?=
 =?iso-8859-1?Q?8N5P+1p/5Neoqt1ma179G1IFRqfWGWD4MtuotZZ+CF+TY78UwgcPkgQUyN?=
 =?iso-8859-1?Q?f0DWvYzO9Pu7Pz9KXFV9Y3GqNezcwdWcFEepXuRgB6n97HZ4BGOBYWRrZ4?=
 =?iso-8859-1?Q?QqMUWSPecBO71uDUMt/5gIkwz9aGqtmOb0dL9lQJvDBKZ7Atme7wBJqr3Z?=
 =?iso-8859-1?Q?EGKfIbuN/jPANF+PgSRl2zrGomF8113b6Na8kTED7jPRU9J1QFtfNYR67Y?=
 =?iso-8859-1?Q?UgOWO5s0wfP0r5J5fw0hfkZcAgPOt/Jos2NEwZrb5SH6b0xvTJasytG0Mt?=
 =?iso-8859-1?Q?+aushGZ1ynWSAfRxCmfLcaDf4o8IjF5/6bFB/FcqSh1mcVIIs7q7tsObRb?=
 =?iso-8859-1?Q?D0duMrurJmHU5ZeY4aPWvzPlDZeN2odsmeeJZoyaLp1illjXoCyJC+O4nm?=
 =?iso-8859-1?Q?ESMlIFig0PrzgUQKNcEMlTSkV8QLdUejnX7fgE6JJEIRgB9x2mXWkzplTa?=
 =?iso-8859-1?Q?Gejwp+fP3kHcQYLAytp4KcfRP2rEfBHQPPdyBhohQZJL9ZG3Nz2cvBMCIV?=
 =?iso-8859-1?Q?dwOIB5M3mZnVmfHV/nSl7TiIdk2xC/z56wL4kCcQXgFkSufhBY3X06fiOE?=
 =?iso-8859-1?Q?U/YnnpXIYkQ3EJ1jGk7YWt1vVMY8j71nU/x6dyNt+eUBeULUMXjYSQHutq?=
 =?iso-8859-1?Q?CeXvWyEXf3j0sHGw5Jt3Jt2kxAZWfNv/7/?=
Content-Type: multipart/related;
 boundary="_004_VI1PR07MB3215A3CB1B0B36428C9B0EC0DE6EAVI1PR07MB3215eurp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Q3wy5X+MfZYfNvs4VhcAuLG88e9o6OTxkbBVB329JXAN/dpL/oo1C6goRlW2+RAXRseunZg4tiyIm4S7xJXekIBgMmIjKygtxO7r1IJWe8H0aUp6Rz+35FKbHfdThBw+ooVUP2CM3C+4S7MJgBVyo2euC+xYIbIH7AZHeJJbNyBxGTJ11r9/PrhRhRDI+sdJ7cp0SZFOjXcS1Saw0Y4CUsoh8ZzPuJkQSkYVU77QiyIL5bg+3Vln4IOG2kE/xm6CPKFEHWbd1s6hGv25+JMGf46S1gftOU9gHj1WWPwAqAoTuvBvq4xsVQjkh0SXyrQYcQnXxXHcuBJllsXEGmTgGGZFODJ3/f9lf+mYIO4sEHorbJ/40Kgcsih5h24Ocw3i3f/gxD+BlPqdjvFPCWkQg0Xu0T7Q3sqXQtyKC35awgEwzDR20oqX75O4udU2GZXQh8qwXZw9tDbUfqcRtSzusD8ek+u3v3xDT+34kg8uJW9h6o79/IIFmmhJCV/X2GE2GFNnY4x50k3ZnzNLOd5hGd/IWa9JPjUbP2qPo+U3rgAMDru0XzyfVbOiYqAA+jUgnmh7s15YBO514mJWCRsrUxjEKYJd5lvTqejRvf2mOPZ1E/B2Lb3EJDoyBNcUBGRBLIdXJVPzzk3QQW3zkeOIkcmd5SVHBM3KXTJb7WXs++Y=
X-OriginatorOrg: mercedes-benz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR07MB3215.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca4680e-9ad5-4256-ec1b-08dda4e54f72
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 10:31:34.3707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9652d7c2-1ccf-4940-8151-4a92bd474ed0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GMTRRN6z0W0ajPpfGKGDq1PiRVQITMAvcIC+bqvLf7re3mNDLTkmP5tXwd0yzCgzlVIIabxhCCwp+c7aIA4vBNMry0zP6H0Dyzok9hKh7c8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR07MB9514
Received-SPF: pass client-ip=141.113.9.133;
 envelope-from=sathya.panneerselvam@mercedes-benz.com;
 helo=mail-out.emea.daimler.com
X-Mailman-Approved-At: Fri, 06 Jun 2025 16:12:13 +0000
Subject: [apparmor] Licensing issue in libapparmor
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
Cc: ruth_isabel.sanchez@mercedes-benz.com, anton.bashlykov@mercedes-benz.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--_004_VI1PR07MB3215A3CB1B0B36428C9B0EC0DE6EAVI1PR07MB3215eurp_
Content-Type: multipart/alternative;
	boundary="_000_VI1PR07MB3215A3CB1B0B36428C9B0EC0DE6EAVI1PR07MB3215eurp_"

--_000_VI1PR07MB3215A3CB1B0B36428C9B0EC0DE6EAVI1PR07MB3215eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Team,

Some time ago, we identified three files under libapparmor containing incon=
sistent license information in their headers, which appears to conflict wit=
h the library's overall licensing terms. This seems to be an error, and in =
the interest of correcting it, we filed [Issue491<https://gitlab.com/apparm=
or/apparmor/-/issues/491>] three months ago. As the issue remains unaddress=
ed to date, I am reaching out through this channel to seek your attention a=
nd support in resolving the matter.

Thank you and looking forward to a resolution.

Best Regards,
Sathya

[cid:image001.png@01DBD6DE.EFB19CC0]
Sathya Sundar Panneerselvam | sathya.panneerselvam@mercedes-benz.com<mailto=
:sathya.panneerselvam@mercedes-benz.com> | +49 (160) 8640083 | License Mana=
gement | MBition GmbH | Friedrich-Krause-Ufer 16, 13353 Berlin, Germany
Gesch=E4ftsf=FChrer/Board of Directors: Steven Bentley, Rainer Schwarz | Re=
gistergericht/Court of Registry: Amtsgericht Charlottenburg HRB-Nr./Commerc=
ial Register No.: 188241 B




If you are not the addressee, please inform us immediately that you have re=
ceived this e-mail by mistake, and delete it. We thank you for your support=
.


--_000_VI1PR07MB3215A3CB1B0B36428C9B0EC0DE6EAVI1PR07MB3215eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"DE">Dear Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"DE"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">Some time ago, we identified three files under <b>li=
bapparmor</b> containing inconsistent license information in their headers,=
 which appears to conflict with the library&#8217;s overall licensing terms=
. This seems to be an error, and in the
 interest of correcting it, we filed [<a href=3D"https://gitlab.com/apparmo=
r/apparmor/-/issues/491">Issue491</a>] three months ago. As the issue remai=
ns unaddressed to date, I am reaching out through this channel to seek your=
 attention and support in resolving
 the matter.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you and looking forward to a resolution.<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Sathya<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"DE"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"border-collapse:collapse">
<tbody>
<tr style=3D"height:26.05pt">
<td width=3D"142" valign=3D"top" style=3D"width:106.35pt;border:none;border=
-right:solid #A6A6A6 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:26.05pt">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:#1F497D;mso-fa=
reast-language:DE"><img border=3D"0" width=3D"121" height=3D"35" style=3D"w=
idth:1.2638in;height:.3611in" id=3D"Picture_x0020_1" src=3D"cid:image001.pn=
g@01DBD6DE.EFB19CC0"></span><span style=3D"font-size:12.0pt;color:#1F497D;m=
so-ligatures:standardcontextual"><o:p></o:p></span></p>
</td>
<td width=3D"803" valign=3D"top" style=3D"width:602.4pt;padding:0cm 5.4pt 0=
cm 5.4pt;height:26.05pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:8.0pt;color:#1F497D;mso-ligatures:standardcontextual">Sathya Sundar Pan=
neerselvam |
</span><span style=3D"font-size:8.0pt;mso-ligatures:standardcontextual"><a =
href=3D"mailto:sathya.panneerselvam@mercedes-benz.com"><span style=3D"color=
:blue">sathya.panneerselvam@mercedes-benz.com</span></a><span style=3D"colo=
r:#1F497D"> | +49 (160) 8640083 | License
 Management | </span></span><span style=3D"font-size:8.0pt;color:#1F497D;ms=
o-ligatures:standardcontextual;mso-fareast-language:DE">MBition GmbH | Frie=
drich-Krause-Ufer 16, 13353 Berlin, Germany<br>
Gesch=E4ftsf=FChrer/Board of&nbsp;Directors:&nbsp;Steven Bentley, Rainer Sc=
hwarz |&nbsp;Registergericht/Court of&nbsp;Registry: Amtsgericht&nbsp;Charl=
ottenburg HRB-Nr./Commercial Register No.:&nbsp;188241 B</span><span style=
=3D"font-size:12.0pt;color:#1F497D;mso-ligatures:standardcontextual"><o:p><=
/o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;mso-ligatures:standa=
rdcontextual"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//DE">
<table cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
<font face=3D"sans-serif, Arial, Helvetica" size=3D"-1" color=3D"#808080"><=
br>
If you are not the addressee, please inform us immediately that you have re=
ceived this e-mail by mistake, and delete it. We thank you for your support=
.<br>
<br>
</font>
</table>
</body>
</html>

--_000_VI1PR07MB3215A3CB1B0B36428C9B0EC0DE6EAVI1PR07MB3215eurp_--

--_004_VI1PR07MB3215A3CB1B0B36428C9B0EC0DE6EAVI1PR07MB3215eurp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=5313;
	creation-date="Fri, 06 Jun 2025 10:31:34 GMT";
	modification-date="Fri, 06 Jun 2025 10:31:34 GMT"
Content-ID: <image001.png@01DBD6DE.EFB19CC0>
Content-Transfer-Encoding: base64

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
AAAAAElFTkSuQmCC

--_004_VI1PR07MB3215A3CB1B0B36428C9B0EC0DE6EAVI1PR07MB3215eurp_--

