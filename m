Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id ED12B7EC790
	for <lists+apparmor@lfdr.de>; Wed, 15 Nov 2023 16:43:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1r3I37-0006IV-1r; Wed, 15 Nov 2023 15:43:29 +0000
Received: from mail-co1nam11on2085.outbound.protection.outlook.com
 ([40.107.220.85] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <davidpil@nvidia.com>)
 id 1r3Goe-00065T-86
 for apparmor@lists.ubuntu.com; Wed, 15 Nov 2023 14:24:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aB1tSj4xYzDdiWnHhmX8d8FNUSj/jFQfId9emDoc8ZHBegtI4oWiRwPN/u1WLe7xL456EZzKJZaSa/Hf8MOFvDUKWYT/1gW6To7ze/QeVTLrZ9TU5YkxvaieWrlj/2IVXA2BkBDqWk5pLoga3h9olSheGYWfAVX+sLa7X7UpdbBzmZegUMPkhq7veJgo83UdhgoAOLaxhJmeKBb2ZXYvLl/yeYNjqsUU5OzLZI5MLemh/ZsKLtf+Li7WAGtu7V7fBDXEvRNogApKijxhihAOCUV6x+SZ7Sq03l+Pq3e39hKgOf78j02vFBKxGDiMpALPAzBRh4YFgf03+ua0luJvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVD7iILXjo/sZG5UzPWe3PJkEVZt6ureLqmIJnSZXck=;
 b=WPyy27Fy1zyZZmQlQuN8fsC6q8j3A+epd23o3wIrsChg6c7i3aEyB2U/lj8dFNH+N3/K+ruarqr1rZwpxUNmPbsHRDwHYrUhCBV47OEWoi5hTjLZV9U2rY40elox70Q/qOGJw9B7S7c4FSM86sf3Mg04zo7HXAlHvWyqfKQYsu9Tr21LMGvGfuvNT/7E2z02Hs0lc23oJCNONBbQoqZzcGya8VoItcdaL4UzboApykQmD05sZSIHD6gw/q5M5YM/0ZbuQPjSaMxSXbrr/OZ23nnsfZBsIkVUsXYz9JpJb0F6Ccf+7Kd8sE07xXVh50K+FAUgjgqD6Pq/AzXp/o4sOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM8PR12MB5429.namprd12.prod.outlook.com (2603:10b6:8:29::23) by
 LV2PR12MB5870.namprd12.prod.outlook.com (2603:10b6:408:175::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 14:24:24 +0000
Received: from DM8PR12MB5429.namprd12.prod.outlook.com
 ([fe80::36d4:91de:81e8:304]) by DM8PR12MB5429.namprd12.prod.outlook.com
 ([fe80::36d4:91de:81e8:304%3]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 14:24:24 +0000
From: David Pilnik <davidpil@nvidia.com>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: consult about profile complain 
Thread-Index: AdoXzVmSKUugV77cSiGPJOLmNozPEw==
Date: Wed, 15 Nov 2023 14:24:24 +0000
Message-ID: <DM8PR12MB54297951B6357695D9225CD9A3B1A@DM8PR12MB5429.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5429:EE_|LV2PR12MB5870:EE_
x-ms-office365-filtering-correlation-id: 472854e5-98fd-424b-7645-08dbe5e690f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SXiPytiwN2cl4mG4YjXU19LplzlU9Co7Ln6h5oyOBd4JL7navh1Z3g4kTpCouhjbwTdQAKTSLlhbCku7R/fYBz2wR7B1J3QUznAejF1/9DR9bt5N16eijdIALlNxFuRP7RfVmTl1yIj1732F/e2STvKQRw0nEgRqum1yEwPNfVWrNtgmdkYr1L9zUbehvOGNH71pHfG+9cW24ko39k7qExRj8ewD17k4RLdYBxM0rtG+JXsjNlmLCEWpxr5KkAez9TDgZxh3TroucARz/rqtcu244fEhWPNTR4/9o7NVeoa9GfzETGESzykSC7CiUJe2xosCvp5/Z/VG71/LOeG+lnvHAbj+AC8VxqIc+r7fx4mqfl6L+xUb10hiH9up1kH+64kwdcbvwwsalaFn4mACwQkZa9+uQ6zn7lJcy8TBMlrlRc8z89Saf8G7bgfIrAHMtDleFJuFxmLTIOk9KzFw0hkFEroxySf0vPPhyuymnQm1Gc2NfRLuvGZ6Z3yVNuepjxCscFdPx5WV220DW2q6cPi1E4OraIaikF5No8oao6IqZlmqCi+oTX3v0zH5mFAcixx657WGNZPT11Oob3ONMywWlOV0pIRautmqOfiSKRiMiUif3o4Iane1iZ5ltKLxghU/evPl6nvrNza7qyKmcA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5429.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(84040400005)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38100700002)(41300700001)(76116006)(3480700007)(86362001)(6916009)(478600001)(66446008)(64756008)(316002)(66946007)(66476007)(66556008)(33656002)(122000001)(5660300002)(4744005)(52536014)(2906002)(7696005)(9686003)(6506007)(71200400001)(4743002)(8676002)(8936002)(38070700009)(55016003)(158833001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1FsOFpJVXgvOTNLNGpzMGZSTGNRaDZqSURmako2VnFzWG9yWm9ubHAxbXN6?=
 =?utf-8?B?SDZIL2Y4TTQyR29Rc2JRejZsZFg3WStLMk0xM1hFKzRLaXhhQVJlajRkZGpm?=
 =?utf-8?B?ZU5tMjd4SzIrbWczcEpGREFVU0p2T2RRUGxzTWJJbkkrb3pvTVdVUUpoTzhj?=
 =?utf-8?B?dGYwMHVMbVprTk5aaFVJTnFyODJWR3BzTUxLd3htQXhIci95dHRUMWF4aE9o?=
 =?utf-8?B?NndJc0pQaUttcC9HWno4Ti93ZDlDR1JqSUp3ZWtZWVBwaDAyMTlObzZGdHVB?=
 =?utf-8?B?aWY2cFFqWWJXUUl1QVgxUVk5WWp4d1FpSkNRV2Y3VVRlQVlCMFJLSW01ZnFL?=
 =?utf-8?B?d2tidDJUc2JLTElzR2sveDUxaEtaMjNub1EreExKdllOS2JneGhSQ1ZHNFl6?=
 =?utf-8?B?Ukt1ZlVDSW9lYjNpd2VRYjFacmVGa3ZKYkQvNDQxNVRNTysyK0N6b2l4dWFw?=
 =?utf-8?B?azNFWkpOUGxiY3pNcTM2M2c2RjRjWnE0bGFBaTc0ZjRreG5UQ0JUTzNFV3lM?=
 =?utf-8?B?bzBYRzE1cjlueHgydkNoWk9SYmlnYS9lNDhHNnJESlZ1eEpxaXZ2UE94ekMy?=
 =?utf-8?B?aFEyOExkU1RkL2FJY0pJQkFHakZmWFp1ODJWeVBBZzVPd085bmlYTzY1eUtC?=
 =?utf-8?B?QlQrNmdRMHBqYUdRTGZqN3NuQlNpOXdWTUxhOXR1MVJLcWlhRUdad0l6ZGdE?=
 =?utf-8?B?R1Z1bjlGaTBZVmRWc3VoT3dUb294U0NNR1hCUWdxakZWZkM5RUk4cXVCTWlu?=
 =?utf-8?B?U3g5YzFqc29KVm5uWGxkUDRka1p4VkJ0ZXZzd015eUZQWENKTndtUEdxWW1h?=
 =?utf-8?B?VUJHWjBaR0RoalllcVd5ZEZVTFhBdWxtL2wzQ0x5VmdUNWNYS256M3NPK2JQ?=
 =?utf-8?B?NGlXS01KOEFYMmZNYXpTTmpLL3Nhd0RMa0VRY2JXbFRCSGlZVGhrajlGTVVt?=
 =?utf-8?B?dzNtOTNIdlRsMmY1aVVqMXM0TG1LcU5ZUHc5ZzFFMUNxMi9yWkVtRENIV3BR?=
 =?utf-8?B?Kzg2djl2UnpQemFIQjZpcmcwOVl6TEVqWDl4LzhKR1RjY0QxRTF3WjZzemRZ?=
 =?utf-8?B?QUhycC8vaG1DQmN5VWcvZWF5dnhvK3dWZlpReDMwMmpDOW90L2w2aEhGM29U?=
 =?utf-8?B?SE84N2lySUthUDAvM1pYRklNQjlwd29GWk4wWUFMV29JTXM4dUFOeWp5Y1NC?=
 =?utf-8?B?RytyU1FBRXZYVExsZ3VDZmhLUDdjRGRqd0xMNHNpcVJGSEh2K1JrSTJMNVJz?=
 =?utf-8?B?MmRMeXg4alphcnpKU2RlVTNJeVVPMHBlV2Y4K0Y0THJtRFdsTGlMRkp4WCtW?=
 =?utf-8?B?RnhJdk8yNW5NRWw2dDgzMnVhdG1DVFFRemJkMTRxWVFmNnFXNGl2ZVcxRHJU?=
 =?utf-8?B?TWplaGxZc0VVOWw4UlozeUYwWWZjeHpVR3VwekcraWhkMkp4NTFrbktTWHRi?=
 =?utf-8?B?b1RCdHZ3OWxEOGV3V0p0K3NlUHJIdm9YREtxK3ROb04rMHllQmJhamVSdG9v?=
 =?utf-8?B?ZlF1RURNQ2RIdDRDZW9NUGpFR0NpME1IZlErelY5SWpuSjgyOFVtVk1qYnZ3?=
 =?utf-8?B?VGs5cFREZG9xVmVzeExnT2xkMzEyV3cvVDFxWnhvbWZkdDhYUGZ2dmRsZFlN?=
 =?utf-8?B?S2JBeitxWFlqRmp4M1V4bzhCOGl6aWlqeEllUlpkYzBFZ2NRdWE1eHZNNTdM?=
 =?utf-8?B?VGU3Qlc0OEFJeU1qTW5DTGdKQzdWeUF1Sm1qSjQ0SU90bHpoNkIzSDIwWW9n?=
 =?utf-8?B?OVh5SHk4ZUFvSk9EcnNwZ0RqZVl4VTBTUVJLVWVHd3VjZ1E2MmpWQjlwTFdQ?=
 =?utf-8?B?VGRxeDUydTVhOXFCb2lDcnpCRzR5ZzBMcnFHYno0MFczcnJVRzVoZUlpUWd4?=
 =?utf-8?B?S1QwU2k2VWxyTGZSY3U4ZFhFejYvODRhcTNHYU1nNnNwYUtBc09mU0tZbThz?=
 =?utf-8?B?MGpTa0srYllCYUQvNWd4a2VwendSeUFyRURkT2F3NzZia3B3cDFLMmZHUDRk?=
 =?utf-8?B?UVdhK0htUWhVd2UvRzZONzR2YmNlSHczbDNNbHpHTFBLSG1lc3cwMUF1aFZv?=
 =?utf-8?B?VjVXUlBITnJ1SDdCTldBZDFtUnZ1SVdoS3hmbElpTzIrS1NXKzcvc0dRUnFu?=
 =?utf-8?B?WXBIb1lqdEt1L2RqS3U3MnJDS3ZlTk85UUhWb29tNURPanVPSzhnWktMbHor?=
 =?utf-8?Q?IHabaoPc+v6q9qZvWujjawUwbBuhpcKzwbHzxVD2G836?=
Content-Type: multipart/alternative;
 boundary="_000_DM8PR12MB54297951B6357695D9225CD9A3B1ADM8PR12MB5429namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472854e5-98fd-424b-7645-08dbe5e690f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 14:24:24.0358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FHDqh7CQDNoeBUTardgHK9sGSFDjdK8QidIWAaHREqLe9AIbc48iEt9gBkBAT6JwwRT1PJK1AifrT3XjnRs2rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5870
X-Mailman-Approved-At: Wed, 15 Nov 2023 15:43:27 +0000
Subject: [apparmor] consult about profile complain
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--_000_DM8PR12MB54297951B6357695D9225CD9A3B1ADM8PR12MB5429namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCknigJltIGRvaW5nIHNvbWUgcmVzZWFyY2ggdG8gc2VlIGlmIGFwcGFybW9yIG1hdGNo
IHNvbWUgdXNlIGNhc2VzIG9mIHNvbWUgcHJvY2Vzc2VzLg0KQW5kIGFmdGVyIHJ1bm5pbmcgd2l0
aCBjb21wbGFpbiBtb2RlLCBJIHNlZSBpbiBhYS1zdGF0dXMgdGhlIHByaW50cyBiZWxvdyB3aGlj
aCBjb250YWluIOKAnC9udWxsLS/igJ0sIGlzIHRoaXMgc29tZSBraW5kIG9mIGVycm9yPw0KSSBk
aWRu4oCZdCBtYW5hZ2UgdG8gZmluZCBzb21lIGRvY3VtZW50YXRpb24gYWJvdXQgaXQsIGNhbiB5
b3UgaGVscD8NCg0KYWEtc3RhdHVzIGV4YW1wbGU6DQoNCjIyIHByb2ZpbGVzIGFyZSBpbiBjb21w
bGFpbiBtb2RlLg0KDQogICAvdXNyL2Jpbi88bXkgcHJvY2Vzcz4gLy9udWxsLS91c3IvYmluL2Jh
c2VuYW1lDQoNCiAgIC91c3IvYmluLy88bXkgcHJvY2Vzcz4gLy9udWxsLS91c3IvYmluL2Rhc2gN
Cg0KICAgL3Vzci9iaW4vLzxteSBwcm9jZXNzPiAvL251bGwtL3Vzci9iaW4vZGFzaC8vbnVsbC0v
dXNyL2Jpbi9zZWQNCg0KICAgL3Vzci9iaW4vLzxteSBwcm9jZXNzPiAvL251bGwtL3Vzci9iaW4v
bXYNCg0KVGhhbmtzDQpEYXZpZA0K

--_000_DM8PR12MB54297951B6357695D9225CD9A3B1ADM8PR12MB5429namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6ZHQ9InV1aWQ6QzJGNDEwMTAtNjVC
My0xMWQxLUEyOUYtMDBBQTAwQzE0ODgyIiB4bWxuczptPSJodHRwOi8vc2NoZW1hcy5taWNyb3Nv
ZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy9UUi9S
RUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250
ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1ldGEgbmFtZT0iR2VuZXJhdG9yIiBj
b250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQgbWVkaXVtKSI+DQo8c3R5bGU+PCEt
LQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseToiQ2Ft
YnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0O30NCkBmb250LWZhY2UN
Cgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1IDUgMiAyIDIgNCAzIDIgNDt9
DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2
Lk1zb05vcm1hbA0KCXttYXJnaW46MGNtOw0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJbXNvLWxpZ2F0dXJlczpzdGFuZGFyZGNvbnRleHR1
YWw7DQoJbXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVM7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7
bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIs
c2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1z
dHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlm
Ow0KCW1zby1mYXJlYXN0LWxhbmd1YWdlOkVOLVVTO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtz
aXplOjYxMi4wcHQgNzkyLjBwdDsNCgltYXJnaW46NzIuMHB0IDcyLjBwdCA3Mi4wcHQgNzIuMHB0
O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48
IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNw
aWRtYXg9IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHht
bD4NCjxvOnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBk
YXRhPSIxIiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0K
PGJvZHkgbGFuZz0iZW4tSUwiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIiBzdHlsZT0i
d29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5IaSw8YnI+DQo8YnI+DQpJ4oCZbSBk
b2luZyBzb21lIHJlc2VhcmNoIHRvIHNlZSBpZiBhcHBhcm1vciBtYXRjaCBzb21lIHVzZSBjYXNl
cyBvZiBzb21lIHByb2Nlc3Nlcy48YnI+DQpBbmQgYWZ0ZXIgcnVubmluZyB3aXRoIGNvbXBsYWlu
IG1vZGUsIEkgc2VlIGluIGFhLXN0YXR1cyB0aGUgcHJpbnRzIGJlbG93IHdoaWNoIGNvbnRhaW4g
4oCcL251bGwtL+KAnSwgaXMgdGhpcyBzb21lIGtpbmQgb2YgZXJyb3I/PGJyPg0KSSBkaWRu4oCZ
dCBtYW5hZ2UgdG8gZmluZCBzb21lIGRvY3VtZW50YXRpb24gYWJvdXQgaXQsIGNhbiB5b3UgaGVs
cD88bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5n
PSJFTi1VUyI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gbGFuZz0iRU4tVVMiPmFhLXN0YXR1cyBleGFtcGxlOjxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIHN0eWxlPSJtYXJnaW46MGNtIj48c3BhbiBsYW5nPSJFTi1VUyI+MjIgcHJvZmls
ZXMgYXJlIGluIGNvbXBsYWluIG1vZGUuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgc3R5bGU9
Im1hcmdpbjowY20iPjxzcGFuIGxhbmc9IkVOLVVTIj4mbmJzcDsmbmJzcDsgL3Vzci9iaW4vJmx0
O215IHByb2Nlc3MmZ3Q7IC8vbnVsbC0vdXNyL2Jpbi9iYXNlbmFtZTxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIHN0eWxlPSJtYXJnaW46MGNtIj48c3BhbiBsYW5nPSJFTi1VUyI+Jm5ic3A7Jm5i
c3A7IC91c3IvYmluLy8mbHQ7bXkgcHJvY2VzcyZndDsgLy9udWxsLS91c3IvYmluL2Rhc2g8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBzdHlsZT0ibWFyZ2luOjBjbSI+PHNwYW4gbGFuZz0iRU4t
VVMiPiZuYnNwOyZuYnNwOyAvdXNyL2Jpbi8vJmx0O215IHByb2Nlc3MmZ3Q7IC8vbnVsbC0vdXNy
L2Jpbi9kYXNoLy9udWxsLS91c3IvYmluL3NlZDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIHN0
eWxlPSJtYXJnaW46MGNtIj48c3BhbiBsYW5nPSJFTi1VUyI+Jm5ic3A7Jm5ic3A7IC91c3IvYmlu
Ly8mbHQ7bXkgcHJvY2VzcyZndDsgLy9udWxsLS91c3IvYmluL212PG86cD48L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVT
Ij5UaGFua3M8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBsYW5nPSJFTi1VUyI+RGF2aWQ8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9k
eT4NCjwvaHRtbD4NCg==

--_000_DM8PR12MB54297951B6357695D9225CD9A3B1ADM8PR12MB5429namp_--

