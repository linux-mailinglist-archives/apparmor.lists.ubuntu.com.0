Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CEB3280E2
	for <lists+apparmor@lfdr.de>; Mon,  1 Mar 2021 15:31:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lGjZx-0003qy-BB; Mon, 01 Mar 2021 14:31:21 +0000
Received: from mail-eopbgr1310133.outbound.protection.outlook.com
 ([40.107.131.133] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <indhuja.a@tataelxsi.co.in>) id 1lGjZu-0003qs-5H
 for apparmor@lists.ubuntu.com; Mon, 01 Mar 2021 14:31:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3yzr8pCOtpLPS9eFq9mSgEnU/MUyCu2N8ZgBIrM3hFxfmjQy68+zgbtZNU1GgZU0RMNWBBh+/lENQSfbR4gNAcg99ymXLyQmr/RiW8dpbpRh1jlhgEVbaZvuPj0umJEtt0WGh3ihxXHz/13SNBqueuoEuaNdpoyG021FBSiU+OKXBoWsUC+bJRay/BCdGLS4clsPNVgtdmla+zeXamMDzWTpRuxBdnrAszU44BfenXuRhATKatHsYeDfFNZpX41IhsGAnQrYQfQykKtJOZ8NvTTxfsN/uKTno6ntPKd7pvyYpsJ4VEmD7XVDdlPlDmN4WM9CgIYZaocy/2d0Ceq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/289mALhArYSxCeqZyYReypC9El6qnmcTYNniUwExk=;
 b=bub57EGOnJfVcYThhoZ+mmoQEI3o721WSqLVa+T1DNQIsdUJz/kPHvAFQwf/geJ8jvaq2fmRC1agn4gx2DZ+O1PeP7O96qxQBvr73KscvkijpVhhVimXyr392BEpni9c4DMqzJiTfnF2u83a5zxmXo7Rps4MvvfyIuIpEyv+PEjtru6GC3drDHe8KTlvLicp8l3G7CAke4bhKZFwi6NMD775THN8A8IxIpojGEJgdqfY/PFeLsnCo2t4LNn1W12YGoaAyDNMQkQz7H4qTOu7v/p3uZQPmKrV/NjFJpwRYNUUP3+NpCdJVO+FXnRx1vwn4kJN0HMYM3QHMkJx+eZmZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tataelxsi.co.in; dmarc=pass action=none
 header.from=tataelxsi.co.in; dkim=pass header.d=tataelxsi.co.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tataelxsi.co.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/289mALhArYSxCeqZyYReypC9El6qnmcTYNniUwExk=;
 b=hHGXOWUrNL0ch5328EP6ChQzBkqTzTfRD+PtDnXYlPT2vUViisZ/v4TWIxZRfFbSDec82f4dL/GcQBxtcn/wYpb9Vxa9FLZVFyM0InTyi0dm8oQcU6e9LN18w7ivi+oxP9KkjmKE+1wdDY+6E8g5YWrxwO6fsSYNeGyvGDrmEl9WxJZ3aBZp7WOqVvyiq6mHmOoQF9aRUmpwiqmqDhi156DE2JUUhyeWochlryF29jGvc6M8C0mAGj5aRXTIOv2B5xV+oHUQvkcsZVS2vwne0jGe9fBa4dWurr65a94Tz8xXApG+jP8PG20Z2wk1NwnxZrp7CfOM+5QedO+3mLiSEQ==
Received: from PS2PR04MB3719.apcprd04.prod.outlook.com (2603:1096:300:66::22)
 by PSBPR04MB4037.apcprd04.prod.outlook.com (2603:1096:301:4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 14:31:14 +0000
Received: from PS2PR04MB3719.apcprd04.prod.outlook.com
 ([fe80::9022:683b:2d85:253c]) by PS2PR04MB3719.apcprd04.prod.outlook.com
 ([fe80::9022:683b:2d85:253c%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 14:31:14 +0000
From: Indhuja A V S <indhuja.a@tataelxsi.co.in>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: Logging in AppArmor
Thread-Index: AQHXDqeBH64kZDPgG0+geD4EFBJgwA==
Date: Mon, 1 Mar 2021 14:31:13 +0000
Message-ID: <PS2PR04MB3719167F6D93AB6CFC4F7EB3A09A9@PS2PR04MB3719.apcprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 1262ed18-15f1-4a27-d972-08d8dcbeaad4
x-ms-traffictypediagnostic: PSBPR04MB4037:
x-microsoft-antispam-prvs: <PSBPR04MB40375DEECE14446EB7911530A09A9@PSBPR04MB4037.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UyzCoUu2CoDVGMlH5kp//YlGPiXafhDAtlgr38MQ01XEYTaEOHlDbkIDgMqRyAMneFFcDmOMnXKNp3LJZJ28sSUxrI0nebLMEcipf+U8YCY0jV1bN28FcbXCPZ/kHtMuct78Lt1hEMnl4X5XlPNqlC0JHuehqqJPXIknFxhzadccbRA/NVMq1foc0E586SPnNKIUDMj8YfB8UN/z/2xDfU8yuWUL/NIscHQSZam572cKCevW7UYRyA6K8cE2dPRLha+eXR6NuwGE3apfJaY4BY131fZmV8IpJbA4mz1zz9vubkfDVEdkdLEzSQyPUxaaGNp+Q+Lfo6QLLXlyGBadhf7kbO1P1YEZpHvhf/QT4TBGrfgGKUholl3tJmdSh2DArr85o/rQvhSourwmJGsba7GuRKqjzhsVG9JFmt0EMQzHOhTeQxXDP1DOEfHzadM/5Yl16gNV2xfd+COTIvH9cub/C+BAW5TGH45WvGgq5YVFfxoWMe1/ZywunddB++S81pW81Z8dyGPxiiCpGHf6Mg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR04MB3719.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(316002)(55016002)(2906002)(83380400001)(76116006)(3480700007)(33656002)(478600001)(8936002)(86362001)(8676002)(7696005)(71200400001)(6506007)(9686003)(186003)(66556008)(19627405001)(91956017)(66446008)(5660300002)(52536014)(66476007)(6916009)(55236004)(66946007)(64756008)(26005)(7116003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?ITOQQ9OhRxIzFaGkfEiuVqVSzMX157a/ukg6JBuqy8KpcILpRuovN3Fndv?=
 =?iso-8859-1?Q?Wk82THiwN/SZ4Yeb5yyoIj/3zDrfLfXLIQoQrnOG/neHBQZY/9nfTD9Yuk?=
 =?iso-8859-1?Q?hqeAF+GqTUmDWaysr2s3m2iyNJYnaVpGuWQGFSIHi3PHrY+YA+EcEkzv/M?=
 =?iso-8859-1?Q?8B1EM6SBYyxfOBFn8ACfuYDmWPHUCB/29KkqsWufWlt/xkCgDOxFOcVyff?=
 =?iso-8859-1?Q?jaF4LZu6rjYr/QDPc9No+y4iQRR5qfbPgUTwLLnZiTU0kkl8tq/ywQpT7l?=
 =?iso-8859-1?Q?wAsesnRE2ac6yL02453gtB9LqAMf3IxXvDpbtYPdyfQZPD9c6L2Hax41f/?=
 =?iso-8859-1?Q?spGx4P/8Z7hzbHI1XWrhzw4RfUlSBe2aJyz32jh9JtLpE5rN56zrqYS/YL?=
 =?iso-8859-1?Q?rT69L8CpO5xO6BYFhOdz3IXburXhh/3XxmT+rrsVdoPNVsX3h+/B1HkP9W?=
 =?iso-8859-1?Q?UFf74ZbPFR0Y7OXtMxJv15ovDxMiLdieouON+6ols+sO1K9jauk24KyKsz?=
 =?iso-8859-1?Q?/vhrFCiy80MUkLnouqLq/fsI90RYLCPWpTQEoA3E579ZknUWFirse5CsfN?=
 =?iso-8859-1?Q?8mjJ7t68lTOL8hsXgGv5EGp/huUUJQMcr13F4GWafwjw8EFlkJ08Eyrbon?=
 =?iso-8859-1?Q?tqjMgdYnw5ievp3xyy4BvanZCU4EY+SAa4fJ9/0nGXhrvEVBbzMu9fvyZh?=
 =?iso-8859-1?Q?ABiJ5xO9k8Q9Cbk2JkXVn/bsqxD0ShqI5TJWqRmq/ck4k0DAonRQ6qbUuZ?=
 =?iso-8859-1?Q?3yKmAeRBjsymgCFKdorrPiLImnVHgkMVxngKsBFDd4pYClq+0KTNQXgYFu?=
 =?iso-8859-1?Q?KAOKm3z+3kLLXHqmyVUFor90TS8m6oint+FFidm1zhgWdZVu2gK3BwGPWj?=
 =?iso-8859-1?Q?EVXg+oadmBchGyYOMwBOksv8Iq6kzTiGmW4fRJG2Rj2OtwO3yZvrWORo3P?=
 =?iso-8859-1?Q?+e8Por1TEIWh7VAOuzWk5vYLZgiBa51rqkKU7koxg6s4q4OlzwErXYffD1?=
 =?iso-8859-1?Q?rog00MzAs2FkWyP81CmvSoFnsYWz2RzqntGx4VHypwMYYDzXSdlBxVNm4K?=
 =?iso-8859-1?Q?ncbAAEHyupNivqHgEBulwFZUust0minHvrtg6lgDaU1RWsuYTNLaJJ9hI+?=
 =?iso-8859-1?Q?QZ+GfnhTELyCUSKb1SB1VA2WewwqO12+3RGsK/hSbaK1/mrgs2TJVNuofp?=
 =?iso-8859-1?Q?hyKk6157CkUsAOzB9JcxfimE804YQ1i+c5Qvni1APtgcEqRz3F0VBeDBQh?=
 =?iso-8859-1?Q?HAU2sAQ7oK8b12Bhbwdt5+bhfyYNm/PJF7dCYrHhxUBojlh5Nnok/IBnBn?=
 =?iso-8859-1?Q?XSNsh8PjhEeFc5RtKOqF8tUu9TFneFsG1e7L+LVtN5poe84=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: tataelxsi.co.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR04MB3719.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1262ed18-15f1-4a27-d972-08d8dcbeaad4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 14:31:13.9968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ad6a39dd-96b6-4368-82da-f2ec4d92e26a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CeN0oBFp6IUW5wPFvBHIUfjXvZATWo1PU1Ktedbip/NLDYSQoslrLSKJBPnYwLYveZMBpwgTU8aYhQO38i0kgc1PlFT8Tx3iFI5noTxJQuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR04MB4037
Subject: [apparmor] Logging in AppArmor
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
Content-Type: multipart/mixed; boundary="===============6613043327203169160=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============6613043327203169160==
Content-Language: en-IN
Content-Type: multipart/alternative;
	boundary="_000_PS2PR04MB3719167F6D93AB6CFC4F7EB3A09A9PS2PR04MB3719apcp_"

--_000_PS2PR04MB3719167F6D93AB6CFC4F7EB3A09A9PS2PR04MB3719apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

While using aa-logprof (AppArmor version 2.13.4), there were few mentions o=
f "audit[ID]:" and "kernel: audit:" for the same capability(dac_override) i=
n journalctl. Could someone please let me know the difference between them?=
 Why 2 lines are getting logged for dac_override alone?

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

--_000_PS2PR04MB3719167F6D93AB6CFC4F7EB3A09A9PS2PR04MB3719apcp_
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
Hello,
<div><br>
</div>
While using aa-logprof (AppArmor version 2.13.4), there were few mentions o=
f &quot;audit[ID]:&quot; and &quot;kernel: audit:&quot; for the same capabi=
lity(dac_override) in journalctl. Could someone please let me know the diff=
erence between them? Why 2 lines are getting logged
 for dac_override alone?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks and regards</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Indhuja</div>
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

--_000_PS2PR04MB3719167F6D93AB6CFC4F7EB3A09A9PS2PR04MB3719apcp_--


--===============6613043327203169160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6613043327203169160==--

