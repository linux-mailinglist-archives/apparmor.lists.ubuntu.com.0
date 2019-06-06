Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2428437AC3
	for <lists+apparmor@lfdr.de>; Thu,  6 Jun 2019 19:17:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hYw0R-0002Kl-V7; Thu, 06 Jun 2019 17:16:51 +0000
Received: from mail-eopbgr1390049.outbound.protection.outlook.com
 ([40.107.139.49] helo=IND01-BO1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1hYndv-0008Ta-LA
 for apparmor@lists.ubuntu.com; Thu, 06 Jun 2019 08:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+K5A2YZsThf73qDomgPAitr8HWe2oNpL9Jj1P31CBsw=;
 b=HFFRe53OGxKLcT5r/BNox2ZgFDkAR6WuSD4ODZFb0C4EGbCow2bthEvuOQkH4HUCFFPSL7gavwm7AwJCSk7nNG0NAItjYr/HiTDAkI6IaLl9yLXSADRPIHFXsvRCvLBzw+mz2BjSPjodC4J46hGneLwKqcSLRBBJhfIL4sVmrt8=
Received: from BM1PR01MB2786.INDPRD01.PROD.OUTLOOK.COM (20.178.173.150) by
 BM1PR01MB0900.INDPRD01.PROD.OUTLOOK.COM (10.174.209.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Thu, 6 Jun 2019 08:21:00 +0000
Received: from BM1PR01MB2786.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::19fa:7fb0:7dff:c634]) by BM1PR01MB2786.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::19fa:7fb0:7dff:c634%6]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 08:21:00 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: Help with extending struct aa_profile
Thread-Index: AQHVHEDFVlxfLOg9lEOaooczcUx/mw==
Date: Thu, 6 Jun 2019 08:21:00 +0000
Message-ID: <21555BB6-A740-48A5-98A0-9F483DFA5689@getmailspring.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR01CA0098.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::14)
 To BM1PR01MB2786.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:4a::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Mailspring
x-originating-ip: [14.139.128.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceebff42-a374-4387-7327-08d6ea57e84f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BM1PR01MB0900; 
x-ms-traffictypediagnostic: BM1PR01MB0900:
x-microsoft-antispam-prvs: <BM1PR01MB0900222ACEDCAB0E7FA7FF37FB170@BM1PR01MB0900.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(366004)(396003)(376002)(199004)(189003)(86362001)(2351001)(52116002)(6486002)(99286004)(71200400001)(14454004)(66476007)(6506007)(386003)(82746002)(66556008)(64756008)(66446008)(6116002)(3846002)(53936002)(305945005)(7736002)(5660300002)(786003)(18926415008)(2906002)(2501003)(478600001)(71190400001)(83716004)(6436002)(73956011)(68736007)(66946007)(476003)(486006)(33656002)(25786009)(6512007)(733005)(5640700003)(74482002)(5024004)(14444005)(256004)(4326008)(9686003)(36756003)(26005)(316002)(6916009)(50226002)(6306002)(54896002)(8936002)(3736002)(186003)(107886003)(66066001)(81166006)(81156014)(1730700003)(8676002)(102836004)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BM1PR01MB0900;
 H:BM1PR01MB2786.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zr/4JCDaf4R+z+baDokpHUmX4rGpsr6wV3ug+9X0fLUYwqMPsoOqxUY1Hd2eBUMZnifTsXPjojN9YysOn0af8keQFi97sJeOAhr2jdrBtHTl59NfeOuAHv55YgVL6bMqC0YH8eX56JUvkMGZzYp/DGtp+qZ9Xald0TPOVhgIhgXCflIFSesT1YtjgCgygjLdq2+IufZxnhtpMqU7TE1+EudwKF40cmmUYVBn7DW2De1DzLaj2YT3GeIMfuEe5n3xd/E+zg7vLbtCZA+Qzk4czlz5L/T6G+DAxoWl0rJfeqt/BJeL1FdFb+nn2o11EiuFBuh75beoQndFF1SWn0w9AaA4bRH+yTZpWWYhJjwdFCN2SDlnySy16Xii/L2gPFTUkNkLPwCaTDvwfGg1D90LpRH3Npp2MnVC8dzVHI9/1Cw=
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: ceebff42-a374-4387-7327-08d6ea57e84f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 08:21:00.2287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abhishekvijeev@IISc.ac.in
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB0900
X-Mailman-Approved-At: Thu, 06 Jun 2019 17:16:49 +0000
Subject: [apparmor] Help with extending struct aa_profile
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
Content-Type: multipart/mixed; boundary="===============2556559852926185339=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============2556559852926185339==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_21555BB6A74048A598A09F483DFA5689getmailspringcom_"

--_000_21555BB6A74048A598A09F483DFA5689getmailspringcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkknbSBsb29raW5nIGZvciBzb21lIGhlbHAgd2l0aCBtb2RpZnlpbmcgQXBwQXJtb3In
cyBrZXJuZWwgY29kZS4gS2luZGx5IGxldCBtZSBrbm93IHdoZXRoZXIgdGhpcyBpcyB0aGUgcmln
aHQgZm9ydW0gZm9yIHN1Y2ggZGlzY3Vzc2lvbnMgKGFzIEkgZGlkbid0IHRoaW5rIGl0IHdvdWxk
IGJlIGFwcHJvcHJpYXRlIHRvIGFzayBmb3IgaGVscCB2aWEgdGhlICdJc3N1ZXMnIHRhYiBvbiBH
aXRMYWIpLg0KDQpPbnRvIG15IHByb2JsZW0uIEJhc2ljYWxseSwgSSdtIHRyeWluZyB0byBhZGQg
YSBjdXN0b20gZmllbGQgdG8gJ3N0cnVjdCBhYV9wcm9maWxlJyBmb3VuZCBpbiA8bGludXhfa2Vy
bmVsX3BhdGg+L3NlY3VyaXR5L2FwcGFybW9yL2luY2x1ZGUvcG9saWN5LmggYW5kIHNldCB0aGlz
IGZpZWxkIHRvICBhIHZhbHVlIG9mIG15IGNob2ljZS4gVG8gYWNjb21wbGlzaCB0aGlzLCBJIGhh
dmUgYWRkZWQgYSBzaW5nbGUgbGluZSBvZiBjb2RlIHRvIHRoZSAndW5wYWNrX3Byb2ZpbGUoICkn
IGZ1bmN0aW9uIGZvdW5kIGluIDxsaW51eF9rZXJuZWxfcGF0aD4vc2VjdXJpdHkvYXBwYXJtb3Iv
cG9saWN5X3VucGFjay5jLiAgSG93ZXZlciwgYSBrZXJuZWwgdGhhdCBoYXMgYmVlbiBjb21waWxl
ZCB3aXRoIHRoaXMgc2luZ2xlIGV4dHJhIGxpbmUgb2YgY29kZSBmYWlscyB0byBib290LiBUaGUg
Ym9vdCBwcm9jZXNzIGhhbHRzIGF0ICdBIHN0YXJ0IGpvYiBpcyBydW5uaW5nIGZvciBBcHBBcm1v
ciBpbml0aWFsaXphdGlvbicuDQoNCkZvciBncmVhdGVyIGNsYXJpdHksIGhlcmUgaXMgdGhlIHN0
cnVjdHVyZSBhZnRlciBhZGRpbmcgbXkgY3VzdG9tIGZpZWxkLA0KDQpzdHJ1Y3QgYWFfcHJvZmls
ZSB7DQpzdHJ1Y3QgYWFfcG9saWN5IGJhc2U7DQpzdHJ1Y3QgYWFfcHJvZmlsZSBfX3JjdSAqcGFy
ZW50Ow0KDQpzdHJ1Y3QgYWFfbnMgKm5zOw0KY29uc3QgY2hhciAqcmVuYW1lOw0KDQpjb25zdCBj
aGFyICphdHRhY2g7DQpzdHJ1Y3QgYWFfZGZhICp4bWF0Y2g7DQppbnQgeG1hdGNoX2xlbjsNCmVu
dW0gYXVkaXRfbW9kZSBhdWRpdDsNCmxvbmcgbW9kZTsNCnUzMiBwYXRoX2ZsYWdzOw0KY29uc3Qg
Y2hhciAqZGlzY29ubmVjdGVkOw0KaW50IHNpemU7DQoNCnN0cnVjdCBhYV9wb2xpY3lkYiBwb2xp
Y3k7DQpzdHJ1Y3QgYWFfZmlsZV9ydWxlcyBmaWxlOw0Kc3RydWN0IGFhX2NhcHMgY2FwczsNCg0K
aW50IHhhdHRyX2NvdW50Ow0KY2hhciAqKnhhdHRyczsNCg0Kc3RydWN0IGFhX3JsaW1pdCBybGlt
aXRzOw0KDQpzdHJ1Y3QgYWFfbG9hZGRhdGEgKnJhd2RhdGE7DQp1bnNpZ25lZCBjaGFyICpoYXNo
Ow0KY2hhciAqZGlybmFtZTsNCnN0cnVjdCBkZW50cnkgKmRlbnRzW0FBRlNfUFJPRl9TSVpFT0Zd
Ow0Kc3RydWN0IHJoYXNodGFibGUgKmRhdGE7DQpzdHJ1Y3QgYWFfbGFiZWwgbGFiZWw7DQovKg0K
KiBDdXN0b20gZmllbGQ6DQoqLw0KaW50IGN1c3RvbV9maWVsZDsNCn07DQoNCmFuZCBoZXJlIGlz
IHRoZSBsaW5lIG9mIGNvZGUgdG8gc2V0IHRoaXMgZmllbGQgKGFkZGVkIGF0IHRoZSBlbmQgb2Yg
J3VucGFja19wcm9maWxlKCApJyksDQoNCiAgICAgICAgICBwcm9maWxlIC0+IGN1c3RvbV9maWVs
ZCA9IDEwOw0KDQpJJ20gbm90IHN1cmUgaWYgSSdtIGRvaW5nIHNvbWV0aGluZyBmdW5kYW1lbnRh
bGx5IHdyb25nIHdpdGggdHJ5aW5nIHRvIG1vZGlmeSB0aGUgc3RydWN0dXJlLiBJIGRvIHVuZGVy
c3RhbmQgdGhhdCBBcHBBcm1vciB2ZXJpZmllcyBlYWNoIHBvbGljeSdzIGNyeXB0b2dyYXBoaWMg
aGFzaCwgYW5kIHN1c3BlY3QgdGhhdCBhIGhhc2ggbWlzbWF0Y2ggcmVuZGVycyB0aGUga2VybmVs
IHVuLWJvb3RhYmxlLiBIb3dldmVyLCBpZiB0aGUgY29kZSB0aGF0IGdlbmVyYXRlcyB0aGUgaGFz
aCBhbmQgdGhlIGNvZGUgdGhhdCBjYWxjdWxhdGVzIGFuZCB2ZXJpZmllcyB0aGUgaGFzaCBhdCBr
ZXJuZWwgYm9vdCBhcmUgb2JsaXZpb3VzIG9mIHRoZSBjdXN0b20gZmllbGQsIHdoeSB3b3VsZCBh
IG1pc21hdGNoIG9jY3VyPw0KDQpJJ2QgYmUgZ3JhdGVmdWwgaWYgeW91IGNvdWxkIGtpbmRseSBw
cm92aWRlIG1lIHdpdGggc29tZSBpbnNpZ2h0IGludG8gdGhlIHJvb3QgY2F1c2Ugb2YgdGhpcyBw
cm9ibGVtIGFzIHdlbGwgYXMgaG93IHRvIHJlc29sdmUgaXQuIERvIGxldCBtZSBrbm93IGlmIEkg
Y2FuIHByb3ZpZGUgYW55IGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gdG8gaGVscCBjbGFyaWZ5IHRo
ZSBwcm9ibGVtLg0KDQpUaGFuayB5b3UsDQpBYmhpc2hlay4NCg0K

--_000_21555BB6A74048A598A09F483DFA5689getmailspringcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <72D6477D3908A94F9F44A0DF65880F31@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5IaSw8L2Rp
dj4NCjxicj4NCjxkaXY+SSdtIGxvb2tpbmcgZm9yIHNvbWUgaGVscCB3aXRoIG1vZGlmeWluZyBB
cHBBcm1vcidzIGtlcm5lbCBjb2RlLiBLaW5kbHkgbGV0IG1lIGtub3cgd2hldGhlciB0aGlzIGlz
IHRoZSByaWdodCBmb3J1bSBmb3Igc3VjaCBkaXNjdXNzaW9ucyAoYXMgSSBkaWRuJ3QgdGhpbmsg
aXQgd291bGQgYmUgYXBwcm9wcmlhdGUgdG8gYXNrIGZvciBoZWxwIHZpYSB0aGUgJ0lzc3Vlcycg
dGFiIG9uIEdpdExhYikuPC9kaXY+DQo8YnI+DQo8ZGl2Pk9udG8gbXkgcHJvYmxlbS4gQmFzaWNh
bGx5LCBJJ20gdHJ5aW5nIHRvIGFkZCBhIGN1c3RvbSBmaWVsZCB0byAnc3RydWN0IGFhX3Byb2Zp
bGUnIGZvdW5kIGluICZsdDtsaW51eF9rZXJuZWxfcGF0aCZndDsvc2VjdXJpdHkvYXBwYXJtb3Iv
aW5jbHVkZS9wb2xpY3kuaCBhbmQgc2V0IHRoaXMgZmllbGQgdG8mbmJzcDsgYSB2YWx1ZSBvZiBt
eSBjaG9pY2UuIFRvIGFjY29tcGxpc2ggdGhpcywgSSBoYXZlIGFkZGVkIGEgc2luZ2xlIGxpbmUg
b2YgY29kZSB0byB0aGUNCiAndW5wYWNrX3Byb2ZpbGUoICknIGZ1bmN0aW9uIGZvdW5kIGluICZs
dDtsaW51eF9rZXJuZWxfcGF0aCZndDsvc2VjdXJpdHkvYXBwYXJtb3IvcG9saWN5X3VucGFjay5j
LiZuYnNwOyBIb3dldmVyLCBhIGtlcm5lbCB0aGF0IGhhcyBiZWVuIGNvbXBpbGVkIHdpdGggdGhp
cyBzaW5nbGUgZXh0cmEgbGluZSBvZiBjb2RlIGZhaWxzIHRvIGJvb3QuIFRoZSBib290IHByb2Nl
c3MgaGFsdHMgYXQgJ0Egc3RhcnQgam9iIGlzIHJ1bm5pbmcgZm9yIEFwcEFybW9yIGluaXRpYWxp
emF0aW9uJy48L2Rpdj4NCjxicj4NCjxkaXY+Rm9yIGdyZWF0ZXIgY2xhcml0eSwgaGVyZSBpcyB0
aGUgc3RydWN0dXJlIGFmdGVyIGFkZGluZyBteSBjdXN0b20gZmllbGQsPC9kaXY+DQo8YnI+DQo8
ZGl2PnN0cnVjdCBhYV9wcm9maWxlIHs8L2Rpdj4NCjxkaXY+c3RydWN0IGFhX3BvbGljeSBiYXNl
OzwvZGl2Pg0KPGRpdj5zdHJ1Y3QgYWFfcHJvZmlsZSBfX3JjdSAqcGFyZW50OzwvZGl2Pg0KPGJy
Pg0KPGRpdj5zdHJ1Y3QgYWFfbnMgKm5zOzwvZGl2Pg0KPGRpdj5jb25zdCBjaGFyICpyZW5hbWU7
PC9kaXY+DQo8YnI+DQo8ZGl2PmNvbnN0IGNoYXIgKmF0dGFjaDs8L2Rpdj4NCjxkaXY+c3RydWN0
IGFhX2RmYSAqeG1hdGNoOzwvZGl2Pg0KPGRpdj5pbnQgeG1hdGNoX2xlbjs8L2Rpdj4NCjxkaXY+
ZW51bSBhdWRpdF9tb2RlIGF1ZGl0OzwvZGl2Pg0KPGRpdj5sb25nIG1vZGU7PC9kaXY+DQo8ZGl2
PnUzMiBwYXRoX2ZsYWdzOzwvZGl2Pg0KPGRpdj5jb25zdCBjaGFyICpkaXNjb25uZWN0ZWQ7PC9k
aXY+DQo8ZGl2PmludCBzaXplOzwvZGl2Pg0KPGJyPg0KPGRpdj5zdHJ1Y3QgYWFfcG9saWN5ZGIg
cG9saWN5OzwvZGl2Pg0KPGRpdj5zdHJ1Y3QgYWFfZmlsZV9ydWxlcyBmaWxlOzwvZGl2Pg0KPGRp
dj5zdHJ1Y3QgYWFfY2FwcyBjYXBzOzwvZGl2Pg0KPGJyPg0KPGRpdj5pbnQgeGF0dHJfY291bnQ7
PC9kaXY+DQo8ZGl2PmNoYXIgKip4YXR0cnM7PC9kaXY+DQo8YnI+DQo8ZGl2PnN0cnVjdCBhYV9y
bGltaXQgcmxpbWl0czs8L2Rpdj4NCjxicj4NCjxkaXY+c3RydWN0IGFhX2xvYWRkYXRhICpyYXdk
YXRhOzwvZGl2Pg0KPGRpdj51bnNpZ25lZCBjaGFyICpoYXNoOzwvZGl2Pg0KPGRpdj5jaGFyICpk
aXJuYW1lOzwvZGl2Pg0KPGRpdj5zdHJ1Y3QgZGVudHJ5ICpkZW50c1tBQUZTX1BST0ZfU0laRU9G
XTs8L2Rpdj4NCjxkaXY+c3RydWN0IHJoYXNodGFibGUgKmRhdGE7PC9kaXY+DQo8ZGl2PnN0cnVj
dCBhYV9sYWJlbCBsYWJlbDs8L2Rpdj4NCjxkaXY+PC9kaXY+DQo8ZGl2Pi8qPC9kaXY+DQo8ZGl2
PiogQ3VzdG9tIGZpZWxkOjwvZGl2Pg0KPGRpdj4qLzwvZGl2Pg0KPGRpdj5pbnQgY3VzdG9tX2Zp
ZWxkOzwvZGl2Pg0KPGRpdj59OzwvZGl2Pg0KPGJyPg0KPGRpdj5hbmQgaGVyZSBpcyB0aGUgbGlu
ZSBvZiBjb2RlIHRvIHNldCB0aGlzIGZpZWxkIChhZGRlZCBhdCB0aGUgZW5kIG9mICd1bnBhY2tf
cHJvZmlsZSggKScpLDwvZGl2Pg0KPGJyPg0KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcHJvZmlsZSAtJmd0OyBjdXN0b21fZmllbGQg
PSAxMDs8L2Rpdj4NCjxicj4NCjxkaXY+SSdtIG5vdCBzdXJlIGlmIEknbSBkb2luZyBzb21ldGhp
bmcgZnVuZGFtZW50YWxseSB3cm9uZyB3aXRoIHRyeWluZyB0byBtb2RpZnkgdGhlIHN0cnVjdHVy
ZS4gSSBkbyB1bmRlcnN0YW5kIHRoYXQgQXBwQXJtb3IgdmVyaWZpZXMgZWFjaCBwb2xpY3kncyBj
cnlwdG9ncmFwaGljIGhhc2gsIGFuZCBzdXNwZWN0IHRoYXQgYSBoYXNoIG1pc21hdGNoIHJlbmRl
cnMgdGhlIGtlcm5lbCB1bi1ib290YWJsZS4gSG93ZXZlciwgaWYgdGhlIGNvZGUNCiB0aGF0IGdl
bmVyYXRlcyB0aGUgaGFzaCBhbmQgdGhlIGNvZGUgdGhhdCBjYWxjdWxhdGVzIGFuZCB2ZXJpZmll
cyB0aGUgaGFzaCBhdCBrZXJuZWwgYm9vdCBhcmUgb2JsaXZpb3VzIG9mIHRoZSBjdXN0b20gZmll
bGQsIHdoeSB3b3VsZCBhIG1pc21hdGNoIG9jY3VyPzwvZGl2Pg0KPGJyPg0KPGRpdj5JJ2QgYmUg
Z3JhdGVmdWwgaWYgeW91IGNvdWxkIGtpbmRseSBwcm92aWRlIG1lIHdpdGggc29tZSBpbnNpZ2h0
IGludG8gdGhlIHJvb3QgY2F1c2Ugb2YgdGhpcyBwcm9ibGVtIGFzIHdlbGwgYXMgaG93IHRvIHJl
c29sdmUgaXQuIERvIGxldCBtZSBrbm93IGlmIEkgY2FuIHByb3ZpZGUgYW55IGFkZGl0aW9uYWwg
aW5mb3JtYXRpb24gdG8gaGVscCBjbGFyaWZ5IHRoZSBwcm9ibGVtLjwvZGl2Pg0KPGJyPg0KPGRp
dj5UaGFuayB5b3UsPC9kaXY+DQo8ZGl2PkFiaGlzaGVrLjwvZGl2Pg0KPGltZyBjbGFzcz0ibWFp
bHNwcmluZy1vcGVuIiBhbHQ9IlNlbnQgZnJvbSBNYWlsc3ByaW5nIiB3aWR0aD0iMCIgaGVpZ2h0
PSIwIiBzdHlsZT0iYm9yZGVyOjA7IHdpZHRoOjA7IGhlaWdodDowOyIgc3JjPSJodHRwczovL2xp
bmsuZ2V0bWFpbHNwcmluZy5jb20vb3Blbi8yMTU1NUJCNi1BNzQwLTQ4QTUtOThBMC05RjQ4M0RG
QTU2ODlAZ2V0bWFpbHNwcmluZy5jb20/cmVjaXBpZW50PVlYQndZWEp0YjNKQWJHbHpkSE11ZFdK
MWJuUjFMbU52YlElM0QlM0QiPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_21555BB6A74048A598A09F483DFA5689getmailspringcom_--


--===============2556559852926185339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2556559852926185339==--

