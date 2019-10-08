Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE5BCF14B
	for <lists+apparmor@lfdr.de>; Tue,  8 Oct 2019 05:33:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iHgEx-0007ZE-Ky; Tue, 08 Oct 2019 03:32:47 +0000
Received: from mail-eopbgr1390049.outbound.protection.outlook.com
 ([40.107.139.49] helo=IND01-BO1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1iHgEs-0007Z8-5j
 for apparmor@lists.ubuntu.com; Tue, 08 Oct 2019 03:32:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dn78G2FK3Btg4fG+FtHTVqIQfST7l72FKTsY2CbW5XW2gVtf8Pz6IUA4TAYzuOuoTzHUXncNvCDtR7BxrBX9mTqhCJRZwPZiszr7u8vA0Ezpd4xxFLcCYBGsIRFxiIGnWby1DbLoZmlhGGZItMH6lG9PvPifXWQqhnJ/8g3o+WNQiZNAZ/3A37F8mRWqdf67rAFANRmfEc1QMOmrLL+NYuvBX3XW9Ze+VOCm9+4jvTQhhyPuyAQBuLfxxBoIcOQ9lXp60n2e5BnloaJzjiJ5ZcaoFOi94BJoyszzucPhU9VNdptf/v/RejMhzLzu9yTH2j3yLi2nmSq18Y3BM+BqYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wn+aRn0TAi9A++R4cTGK8+BzvdKAJ26MvFflyp2vyVk=;
 b=izoHe6t58yHVRAK3qWv1sir8D0S3L4dT174MBl2g1+HIWRSAks3MSdVUCP46pcwzFv2nTsQbmKr+Z04eBqfaGQIolEbABvhspcJuaLNFuLAgn8+/ouQuGNsuSsQCrwhxLxaT3cVMi5U+C39RSLs3ExDIWdoJvJM/oTTBvRvRggeEBOh7x0Ib+0imTVk/F7tlEVfC3uxcvH2PuHJMtLN0W6IzL0xp2Xh3fpmFZbK88rYfWnQq4TaFVJBhCDYf2My6AghlrgPBi0tNQEbLA1djTAaJKc7dcNaLJ3JT3vIpgQoSZrbyQ3Wd6QoivsH4X8RssNmz4SYnpE0AiwSx9bojBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iisc.ac.in; dmarc=pass action=none header.from=iisc.ac.in;
 dkim=pass header.d=iisc.ac.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wn+aRn0TAi9A++R4cTGK8+BzvdKAJ26MvFflyp2vyVk=;
 b=OLDxVFjojfPSF0Ch7v3ZXrlMf+GoPpr9S2ruh5IrcRk5bvcmxr0JF43MsCxBXiXNAMUVGNE/ex29heqtb83tk58TUh1MOmWjvcp1Shk25Rtx/9XzuQiJWGLPMLm282tFsfgejZsThysTxpqgAUp5VlSVypfGo0qaM15DqKZ9smc=
Received: from MA1PR01MB4011.INDPRD01.PROD.OUTLOOK.COM (20.179.238.87) by
 MA1PR01MB3260.INDPRD01.PROD.OUTLOOK.COM (20.179.236.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 03:32:38 +0000
Received: from MA1PR01MB4011.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e082:905b:2618:d9ba]) by MA1PR01MB4011.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e082:905b:2618:d9ba%4]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 03:32:38 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: [apparmor] Query about AppArmor's Profile Transitions
Thread-Index: AQHVfYkHhUrEpTnPM0WWlrEzQ/oW2g==
Date: Tue, 8 Oct 2019 03:32:37 +0000
Message-ID: <24870DFC-D4DD-43C4-AF4C-063060CC4477@getmailspring.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR17CA0030.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::43) To MA1PR01MB4011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:7b::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Mailspring
x-originating-ip: [14.139.128.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b836ac7d-f6e4-4671-cc74-08d74ba0296e
x-ms-traffictypediagnostic: MA1PR01MB3260:
x-microsoft-antispam-prvs: <MA1PR01MB3260F933B689A553471BBF31FB9A0@MA1PR01MB3260.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(346002)(396003)(39850400004)(199004)(189003)(25786009)(4744005)(66946007)(6486002)(64756008)(8936002)(305945005)(256004)(66446008)(478600001)(66476007)(486006)(36756003)(733005)(99286004)(66556008)(5640700003)(33656002)(86362001)(6436002)(9686003)(7736002)(6512007)(50226002)(66066001)(6916009)(6306002)(54896002)(18926415008)(2501003)(476003)(26005)(52116002)(186003)(316002)(386003)(71190400001)(4326008)(6506007)(1730700003)(81156014)(3846002)(2351001)(6116002)(786003)(71200400001)(102836004)(107886003)(229853002)(6246003)(81166006)(14454004)(2906002)(5660300002)(8676002)(3736002)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MA1PR01MB3260;
 H:MA1PR01MB4011.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xxGmEN0QfGnHSAJH5/Z0iAdPO7gUdbzuwQuPAXZynDl68OyQEW35MjSL+4w6DNnsuC9JnCyBY0x8PVvxbKbgGZvgbZoN3tEPyymQ38nm9sO3acs7GMK8wUtSY1CyyOXEX/dkRkIo6hcU/B3G1SdZVjQDyRdv80nc7TNCX2+mDq1LRkigZMXEwPiGzK59GUe8Rf43w3sliNienA8zIweauF1euV+T5z9/f3RmEr4ojr7Gvk+5aOoIJ6epn6U/pjl+/8RyZ8gfjxc4+U0tfrqjAGvWqNST4BBQ6CnC/Xa1fIew6bJRlS11ywTDpt72q46pFnH4roy32QOaqfb/mnX2a5KoX1B+ZkADseiNfNd2smhLaQSWq9hDmD78dZUrq1s3bQ43zLDxV1wqtvwIduiOJnn4U2+lmwiOWKNwks9Uihs=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: b836ac7d-f6e4-4671-cc74-08d74ba0296e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 03:32:37.5262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZ5V+7psR/R5XeBUt3pX06WCfT4OTbYGw7JssQfqp1mLh2qKQXruGjVaq4VodVjPLIHqQQKDH2rSX2xkBTkZJU43/D73HZIOPVTemmM5KJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB3260
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
Content-Type: multipart/mixed; boundary="===============6315080221725214075=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============6315080221725214075==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_24870DFCD4DD43C4AF4C063060CC4477getmailspringcom_"

--_000_24870DFCD4DD43C4AF4C063060CC4477getmailspringcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0aWFuLA0KDQpXZSBoYXZlIHN1Y2Nlc3NmdWxseSBzZXR1cCBGdWxsIFN5c3RlbSBQ
b2xpY3kuIFlvdSdyZSByaWdodCwgd2UncmUgbG9va2luZyBmb3IgZnVsbA0Kc3lzdGVtIGNvbmZp
bmVtZW50IHdpdGggcHJvZmlsZXMgZm9yIHNwZWNpZmljIHByb2dyYW1zLCBhbmQgYSBkZWZhdWx0
IHByb2ZpbGUgZm9yDQpldmVyeXRoaW5nIGVsc2UuIEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGRp
cmVjdGx5IHBvc3NpYmxlIHNpbmNlIHdlIGRvbid0IGhhdmUNCidwY3gnIHRyYW5zaXRpb25zIGF0
IHRoZSBtb21lbnQuDQoNClRoYW5rIHlvdSBmb3IgdGhlIGNvcnJlY3Rpb24uIFRoaXMgY29uZmly
bXMgdGhlIGZhY3QgdGhhdCBzdGFja2luZyBjYW5ub3QgYmUgdXNlZA0KdG8gYWNoaWV2ZSB3aGF0
IHdlIHJlcXVpcmUuDQoNCg==

--_000_24870DFCD4DD43C4AF4C063060CC4477getmailspringcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <4AB7F2D015D5E845B57076C9E772E46D@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5IaSBDaHJp
c3RpYW4sPC9kaXY+DQo8YnI+DQo8ZGl2PldlIGhhdmUgc3VjY2Vzc2Z1bGx5IHNldHVwIEZ1bGwg
U3lzdGVtIFBvbGljeS4gWW91J3JlIHJpZ2h0LCB3ZSdyZSBsb29raW5nIGZvciBmdWxsPC9kaXY+
DQo8ZGl2PnN5c3RlbSBjb25maW5lbWVudCB3aXRoIHByb2ZpbGVzIGZvciBzcGVjaWZpYyBwcm9n
cmFtcywgYW5kIGEgZGVmYXVsdCBwcm9maWxlIGZvcjwvZGl2Pg0KPGRpdj5ldmVyeXRoaW5nIGVs
c2UuIEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIGRpcmVjdGx5IHBvc3NpYmxlIHNpbmNlIHdlIGRv
bid0IGhhdmU8L2Rpdj4NCjxkaXY+J3BjeCcgdHJhbnNpdGlvbnMgYXQgdGhlIG1vbWVudC48L2Rp
dj4NCjxicj4NCjxkaXY+VGhhbmsgeW91IGZvciB0aGUgY29ycmVjdGlvbi4gVGhpcyBjb25maXJt
cyB0aGUgZmFjdCB0aGF0IHN0YWNraW5nIGNhbm5vdCBiZSB1c2VkPC9kaXY+DQo8ZGl2PnRvIGFj
aGlldmUgd2hhdCB3ZSByZXF1aXJlLjwvZGl2Pg0KPGltZyBjbGFzcz0ibWFpbHNwcmluZy1vcGVu
IiBhbHQ9IlNlbnQgZnJvbSBNYWlsc3ByaW5nIiB3aWR0aD0iMCIgaGVpZ2h0PSIwIiBzdHlsZT0i
Ym9yZGVyOjA7IHdpZHRoOjA7IGhlaWdodDowOyIgc3JjPSJodHRwczovL2xpbmsuZ2V0bWFpbHNw
cmluZy5jb20vb3Blbi8yNDg3MERGQy1ENERELTQzQzQtQUY0Qy0wNjMwNjBDQzQ0NzdAZ2V0bWFp
bHNwcmluZy5jb20/bWU9YTA3MzkyN2QmYW1wO3JlY2lwaWVudD1ZWEJ3WVhKdGIzSkFiR2x6ZEhN
dWRXSjFiblIxTG1OdmJRJTNEJTNEIj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_24870DFCD4DD43C4AF4C063060CC4477getmailspringcom_--


--===============6315080221725214075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6315080221725214075==--

