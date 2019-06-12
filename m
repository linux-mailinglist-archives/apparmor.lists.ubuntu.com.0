Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D191425D8
	for <lists+apparmor@lfdr.de>; Wed, 12 Jun 2019 14:33:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hb2R3-0006KX-RA; Wed, 12 Jun 2019 12:33:01 +0000
Received: from mail-eopbgr1390074.outbound.protection.outlook.com
 ([40.107.139.74] helo=IND01-BO1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1hb2Qz-0006K1-OC
 for apparmor@lists.ubuntu.com; Wed, 12 Jun 2019 12:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tujwbtA96Lzwgw9b998SDtsj+sutnR5HUQXnB3HKUkk=;
 b=VbH3W6NILHLDkv6NCBoITmCuvMMMtSx4HijRSFQxsVaH41sI76VczVUvCc8TLbQh+Ty4MuTtMHOw3Ta/zpdSg+2oWmkRmqcCaldOYLhYSyzb/Iz2YG0uvWSZtAO7/CqChl6wU1cZMohEjp8FBqR95tesHK2xDC0td12X/28W7RM=
Received: from BM1PR01MB2786.INDPRD01.PROD.OUTLOOK.COM (20.178.173.150) by
 BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM (20.178.172.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Wed, 12 Jun 2019 12:32:54 +0000
Received: from BM1PR01MB2786.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::19fa:7fb0:7dff:c634]) by BM1PR01MB2786.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::19fa:7fb0:7dff:c634%6]) with mapi id 15.20.1987.010; Wed, 12 Jun 2019
 12:32:53 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: Questions about AppArmor's Code
Thread-Index: AQHVIRr0zZ14OI+2jUW6rMuZr0G7Cw==
Date: Wed, 12 Jun 2019 12:32:53 +0000
Message-ID: <9A7F1FD4-2A3E-4F39-B6F2-7E351F787CA8@getmailspring.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0358.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::34) To BM1PR01MB2786.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:4a::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Mailspring
x-originating-ip: [14.139.128.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff44ffaa-911a-4e1d-8e6e-08d6ef32172f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BM1PR01MB3089; 
x-ms-traffictypediagnostic: BM1PR01MB3089:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BM1PR01MB30899565CDAA5025A545EABCFBEC0@BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(366004)(376002)(136003)(189003)(199004)(66556008)(64756008)(66476007)(6486002)(36756003)(733005)(54896002)(9686003)(6512007)(2906002)(236005)(18926415008)(316002)(476003)(786003)(68736007)(5660300002)(25786009)(73956011)(6916009)(186003)(486006)(5640700003)(53936002)(861006)(66066001)(2351001)(3480700005)(107886003)(8676002)(66946007)(86362001)(74482002)(33656002)(7736002)(50226002)(305945005)(81166006)(3846002)(966005)(8936002)(71200400001)(71190400001)(6306002)(81156014)(66446008)(2501003)(478600001)(6506007)(26005)(14444005)(256004)(52116002)(102836004)(3736002)(99286004)(606006)(386003)(1730700003)(6436002)(14454004)(4326008)(6116002)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BM1PR01MB3089;
 H:BM1PR01MB2786.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xOOpLLxUf1UtzQKi35jauI44R71vXUVsPxbSgg+tuYcvcQ4vMV777eKZPlKGJXFrBiyUEYCZQenxW4A454NhLGnKw49D+tewGabHShb5YjVKwGeZBSZNIeCfh/GNSf6PTqSEG+XSzDERz4WIm161QECdwEgyDAKS0ewwzk8WBDFh7iJuXjTYaPx/TXwi3sxQ0rOMJtWSObxfgEvKg5EdlYsU9poIkq6AlneEdLkKo9bKWGM1+rrMGTB+NUbpt1h6YzAvzEuZf/AoSdIn25svsSS+EJG6XV4yvsFYdLe6WPQi8e5lPQddv9DFB6ecQ9EWcF4yMlvckMswHLViJfJqf2kjwp5m6zG14XhOydu0m59fsLTRlXLBSgOZwXuu4aKQzwMIp1MPkKh8iCU8+/84vU29Ypaq0gWxb/V3vgcVl0Q=
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: ff44ffaa-911a-4e1d-8e6e-08d6ef32172f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 12:32:53.7858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abhishekvijeev@IISc.ac.in
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3089
Subject: [apparmor] Questions about AppArmor's Code
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
Content-Type: multipart/mixed; boundary="===============2468942100579455579=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============2468942100579455579==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9A7F1FD42A3E4F39B6F27E351F787CA8getmailspringcom_"

--_000_9A7F1FD42A3E4F39B6F27E351F787CA8getmailspringcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkkgaGF2ZSBhIGZldyBxdWVzdGlvbnMgYWJvdXQgQXBwQXJtb3IncyBjb2RlIGFuZCB3
b3VsZCBiZSBncmF0ZWZ1bCBpZiB5b3UgY291bGQga2luZGx5IGFuc3dlciB0aGVtLg0KDQoxKSBU
aGUgZG9jdW1lbnRhdGlvbiBhdCB0aGlzIGxpbmsgaHR0cHM6Ly9naXRsYWIuY29tL2FwcGFybW9y
L2FwcGFybW9yL3dpa2lzL0FwcEFybW9yX0NvcmVfUG9saWN5X1JlZmVyZW5jZSNhZGRyZXNzLWV4
cHI8aHR0cHM6Ly9saW5rLmdldG1haWxzcHJpbmcuY29tL2xpbmsvOUE3RjFGRDQtMkEzRS00RjM5
LUI2RjItN0UzNTFGNzg3Q0E4QGdldG1haWxzcHJpbmcuY29tLzA/cmVkaXJlY3Q9aHR0cHMlM0El
MkYlMkZnaXRsYWIuY29tJTJGYXBwYXJtb3IlMkZhcHBhcm1vciUyRndpa2lzJTJGQXBwQXJtb3Jf
Q29yZV9Qb2xpY3lfUmVmZXJlbmNlJTIzYWRkcmVzcy1leHByJnJlY2lwaWVudD1ZWEJ3WVhKdGIz
SkFiR2x6ZEhNdWRXSjFiblIxTG1OdmJRJTNEJTNEPiBtZW50aW9ucyB0aGUgcG9zc2liaWxpdHkg
b2Ygc3BlY2lmeWluZyBhIG5ldHdvcmsgcnVsZSBhcyAibmV0d29yayB0Y3Agc3JjIDE5Mi4xNjgu
MS4xOjgwIGRzdCAxNzAuMS4xLjA6ODAiLiBIb3dldmVyIHRoaXMgZG9lc24ndCB3b3JrLCBhbmQg
YWZ0ZXIgYSBsaXR0bGUgZGlnZ2luZywgSSBmb3VuZCBvdXQgdGhhdCB0aGUgcHJvZHVjdGlvbnMg
cnVsZXMgZm9yIHRoaXMgcG9saWN5IHdlcmUgYXZhaWxhYmxlIG9ubHkgaW4gdGhlIGdyYW1tYXIg
c3BlY2lmaWNhdGlvbiBvZiBBcHBBcm1vciAyLjEgKGxpbmUgbnVtYmVyIDY3MCBvZiBodHRwczov
L2dpdGxhYi5jb20vYXBwYXJtb3IvYXBwYXJtb3IvYmxvYi9hcHBhcm1vci0yLjEvcGFyc2VyL3Bh
cnNlcl95YWNjLnk8aHR0cHM6Ly9saW5rLmdldG1haWxzcHJpbmcuY29tL2xpbmsvOUE3RjFGRDQt
MkEzRS00RjM5LUI2RjItN0UzNTFGNzg3Q0E4QGdldG1haWxzcHJpbmcuY29tLzE/cmVkaXJlY3Q9
aHR0cHMlM0ElMkYlMkZnaXRsYWIuY29tJTJGYXBwYXJtb3IlMkZhcHBhcm1vciUyRmJsb2IlMkZh
cHBhcm1vci0yLjElMkZwYXJzZXIlMkZwYXJzZXJfeWFjYy55JnJlY2lwaWVudD1ZWEJ3WVhKdGIz
SkFiR2x6ZEhNdWRXSjFiblIxTG1OdmJRJTNEJTNEPiApLiBJIGZpbmQgdGhpcyBleHRyZW1lbHkg
dXNlZnVsLCBhbmQgYW0gY29uc2lkZXJpbmcgdHJ5aW5nIHRvIGFkZCB0aGlzIHRvIEFwcEFybW9y
IGFzIHBhcnQgb2YgYSBsYXJnZXIgcHJvamVjdC4gQ291bGQgeW91IGtpbmRseSBjbGFyaWZ5IHRo
ZSByZWFzb24gZm9yIGl0cyByZW1vdmFsPyBXZXJlIHRoZXJlIGFueSBodXJkbGVzIHRoYXQgbWFk
ZSBpdCBkaWZmaWN1bHQgdG8gYWNjb21wbGlzaCB0aGlzPw0KDQoyKSBBdCB3aGF0IHN0YWdlIGR1
cmluZyB0aGUga2VybmVsIGJvb3QgcHJvY2VzcyBkb2VzIEFwcEFybW9yIGxvYWQgdGhlIHByb2Zp
bGVzPyBBbmQgZnJvbSB3aGVyZSBkb2VzIGl0IG9idGFpbiB0aGVtPyAoYW0gSSBjb3JyZWN0IGlu
IHVuZGVyc3RhbmRpbmcgdGhhdCB0aGUgcHJvZmlsZXMgYXJlIHN0b3JlZCBpbiAvc3lzL2tlcm5l
bC9zZWN1cml0eS9hcHBhcm1vci9wb2xpY3kgPykNCg0KMykgV2h5IGRvZXMgZnVuY3Rpb24gJ2Fh
X2FsbG9jX3Byb2ZpbGUoICknIGFsbG9jYXRlIGV4dHJhIG1lbW9yeSA/IEl0IHNlZW1zIHRvIGJl
IGFsbG9jYXRpbmcgbWVtb3J5IGZvciAzIG9iamVjdHMgb2YgdHlwZSAnc3RydWN0IGFhX3Byb2Zp
bGUnLiAobGluZSBudW1iZXIgMjYyIG9mIGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51
eC9ibG9iL21hc3Rlci9zZWN1cml0eS9hcHBhcm1vci9wb2xpY3kuYzxodHRwczovL2xpbmsuZ2V0
bWFpbHNwcmluZy5jb20vbGluay85QTdGMUZENC0yQTNFLTRGMzktQjZGMi03RTM1MUY3ODdDQThA
Z2V0bWFpbHNwcmluZy5jb20vMj9yZWRpcmVjdD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZ0
b3J2YWxkcyUyRmxpbnV4JTJGYmxvYiUyRm1hc3RlciUyRnNlY3VyaXR5JTJGYXBwYXJtb3IlMkZw
b2xpY3kuYyZyZWNpcGllbnQ9WVhCd1lYSnRiM0pBYkdsemRITXVkV0oxYm5SMUxtTnZiUSUzRCUz
RD4gKQ0KDQpUaGFuayB5b3UsDQpBYmhpc2hlay4NCg0K

--_000_9A7F1FD42A3E4F39B6F27E351F787CA8getmailspringcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <B6D276BDF0DA9A49AEFF93B8648D0CEB@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5IaSw8L2Rp
dj4NCjxicj4NCjxkaXY+SSBoYXZlIGEgZmV3IHF1ZXN0aW9ucyBhYm91dCBBcHBBcm1vcidzIGNv
ZGUgYW5kIHdvdWxkIGJlIGdyYXRlZnVsIGlmIHlvdSBjb3VsZCBraW5kbHkgYW5zd2VyIHRoZW0u
PC9kaXY+DQo8YnI+DQo8ZGl2PjEpIFRoZSBkb2N1bWVudGF0aW9uIGF0IHRoaXMgbGluayA8YSBo
cmVmPSJodHRwczovL2xpbmsuZ2V0bWFpbHNwcmluZy5jb20vbGluay85QTdGMUZENC0yQTNFLTRG
MzktQjZGMi03RTM1MUY3ODdDQThAZ2V0bWFpbHNwcmluZy5jb20vMD9yZWRpcmVjdD1odHRwcyUz
QSUyRiUyRmdpdGxhYi5jb20lMkZhcHBhcm1vciUyRmFwcGFybW9yJTJGd2lraXMlMkZBcHBBcm1v
cl9Db3JlX1BvbGljeV9SZWZlcmVuY2UlMjNhZGRyZXNzLWV4cHImYW1wO3JlY2lwaWVudD1ZWEJ3
WVhKdGIzSkFiR2x6ZEhNdWRXSjFiblIxTG1OdmJRJTNEJTNEIiB0aXRsZT0iaHR0cHM6Ly9naXRs
YWIuY29tL2FwcGFybW9yL2FwcGFybW9yL3dpa2lzL0FwcEFybW9yX0NvcmVfUG9saWN5X1JlZmVy
ZW5jZSNhZGRyZXNzLWV4cHIiPg0KaHR0cHM6Ly9naXRsYWIuY29tL2FwcGFybW9yL2FwcGFybW9y
L3dpa2lzL0FwcEFybW9yX0NvcmVfUG9saWN5X1JlZmVyZW5jZSNhZGRyZXNzLWV4cHI8L2E+IG1l
bnRpb25zIHRoZSBwb3NzaWJpbGl0eSBvZiBzcGVjaWZ5aW5nIGEgbmV0d29yayBydWxlIGFzICZx
dW90Ozxjb2RlPm5ldHdvcmsgdGNwIHNyYyAxOTIuMTY4LjEuMTo4MCBkc3QgMTcwLjEuMS4wOjgw
JnF1b3Q7LjwvY29kZT4gSG93ZXZlciB0aGlzIGRvZXNuJ3Qgd29yaywgYW5kIGFmdGVyIGEgbGl0
dGxlDQogZGlnZ2luZywgSSBmb3VuZCBvdXQgdGhhdCB0aGUgcHJvZHVjdGlvbnMgcnVsZXMgZm9y
IHRoaXMgcG9saWN5IHdlcmUgYXZhaWxhYmxlIG9ubHkgaW4gdGhlIGdyYW1tYXIgc3BlY2lmaWNh
dGlvbiBvZiBBcHBBcm1vciAyLjEgKGxpbmUgbnVtYmVyIDY3MCBvZg0KPGEgaHJlZj0iaHR0cHM6
Ly9saW5rLmdldG1haWxzcHJpbmcuY29tL2xpbmsvOUE3RjFGRDQtMkEzRS00RjM5LUI2RjItN0Uz
NTFGNzg3Q0E4QGdldG1haWxzcHJpbmcuY29tLzE/cmVkaXJlY3Q9aHR0cHMlM0ElMkYlMkZnaXRs
YWIuY29tJTJGYXBwYXJtb3IlMkZhcHBhcm1vciUyRmJsb2IlMkZhcHBhcm1vci0yLjElMkZwYXJz
ZXIlMkZwYXJzZXJfeWFjYy55JmFtcDtyZWNpcGllbnQ9WVhCd1lYSnRiM0pBYkdsemRITXVkV0ox
Ym5SMUxtTnZiUSUzRCUzRCIgdGl0bGU9Imh0dHBzOi8vZ2l0bGFiLmNvbS9hcHBhcm1vci9hcHBh
cm1vci9ibG9iL2FwcGFybW9yLTIuMS9wYXJzZXIvcGFyc2VyX3lhY2MueSI+DQpodHRwczovL2dp
dGxhYi5jb20vYXBwYXJtb3IvYXBwYXJtb3IvYmxvYi9hcHBhcm1vci0yLjEvcGFyc2VyL3BhcnNl
cl95YWNjLnk8L2E+ICkuIEkgZmluZCB0aGlzIGV4dHJlbWVseSB1c2VmdWwsIGFuZCBhbSBjb25z
aWRlcmluZyB0cnlpbmcgdG8gYWRkIHRoaXMgdG8gQXBwQXJtb3IgYXMgcGFydCBvZiBhIGxhcmdl
ciBwcm9qZWN0LiBDb3VsZCB5b3Uga2luZGx5IGNsYXJpZnkgdGhlIHJlYXNvbiBmb3IgaXRzIHJl
bW92YWw/IFdlcmUgdGhlcmUgYW55DQogaHVyZGxlcyB0aGF0IG1hZGUgaXQgZGlmZmljdWx0IHRv
IGFjY29tcGxpc2ggdGhpcz88L2Rpdj4NCjxicj4NCjxkaXY+MikgQXQgd2hhdCBzdGFnZSBkdXJp
bmcgdGhlIGtlcm5lbCBib290IHByb2Nlc3MgZG9lcyBBcHBBcm1vciBsb2FkIHRoZSBwcm9maWxl
cz8gQW5kIGZyb20gd2hlcmUgZG9lcyBpdCBvYnRhaW4gdGhlbT8gKGFtIEkgY29ycmVjdCBpbiB1
bmRlcnN0YW5kaW5nIHRoYXQgdGhlIHByb2ZpbGVzIGFyZSBzdG9yZWQgaW4gL3N5cy9rZXJuZWwv
c2VjdXJpdHkvYXBwYXJtb3IvcG9saWN5ID8pPC9kaXY+DQo8YnI+DQo8ZGl2PjMpIFdoeSBkb2Vz
IGZ1bmN0aW9uICdhYV9hbGxvY19wcm9maWxlKCApJyBhbGxvY2F0ZSBleHRyYSBtZW1vcnkgPyBJ
dCBzZWVtcyB0byBiZSBhbGxvY2F0aW5nIG1lbW9yeSBmb3IgMyBvYmplY3RzIG9mIHR5cGUgJ3N0
cnVjdCBhYV9wcm9maWxlJy4gKGxpbmUgbnVtYmVyIDI2MiBvZg0KPGEgaHJlZj0iaHR0cHM6Ly9s
aW5rLmdldG1haWxzcHJpbmcuY29tL2xpbmsvOUE3RjFGRDQtMkEzRS00RjM5LUI2RjItN0UzNTFG
Nzg3Q0E4QGdldG1haWxzcHJpbmcuY29tLzI/cmVkaXJlY3Q9aHR0cHMlM0ElMkYlMkZnaXRodWIu
Y29tJTJGdG9ydmFsZHMlMkZsaW51eCUyRmJsb2IlMkZtYXN0ZXIlMkZzZWN1cml0eSUyRmFwcGFy
bW9yJTJGcG9saWN5LmMmYW1wO3JlY2lwaWVudD1ZWEJ3WVhKdGIzSkFiR2x6ZEhNdWRXSjFiblIx
TG1OdmJRJTNEJTNEIiB0aXRsZT0iaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Js
b2IvbWFzdGVyL3NlY3VyaXR5L2FwcGFybW9yL3BvbGljeS5jIj4NCmh0dHBzOi8vZ2l0aHViLmNv
bS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9zZWN1cml0eS9hcHBhcm1vci9wb2xpY3kuYzwv
YT4gKTwvZGl2Pg0KPGJyPg0KPGRpdj5UaGFuayB5b3UsPC9kaXY+DQo8ZGl2PkFiaGlzaGVrLjwv
ZGl2Pg0KPGltZyBjbGFzcz0ibWFpbHNwcmluZy1vcGVuIiBhbHQ9IlNlbnQgZnJvbSBNYWlsc3By
aW5nIiB3aWR0aD0iMCIgaGVpZ2h0PSIwIiBzdHlsZT0iYm9yZGVyOjA7IHdpZHRoOjA7IGhlaWdo
dDowOyIgc3JjPSJodHRwczovL2xpbmsuZ2V0bWFpbHNwcmluZy5jb20vb3Blbi85QTdGMUZENC0y
QTNFLTRGMzktQjZGMi03RTM1MUY3ODdDQThAZ2V0bWFpbHNwcmluZy5jb20/cmVjaXBpZW50PVlY
QndZWEp0YjNKQWJHbHpkSE11ZFdKMWJuUjFMbU52YlElM0QlM0QiPg0KPC9ib2R5Pg0KPC9odG1s
Pg0K

--_000_9A7F1FD42A3E4F39B6F27E351F787CA8getmailspringcom_--


--===============2468942100579455579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2468942100579455579==--

