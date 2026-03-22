Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBZrIMx0v2lB5AMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 22 Mar 2026 05:49:16 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5F82E8386
	for <lists+apparmor@lfdr.de>; Sun, 22 Mar 2026 05:49:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w4AGN-0000wX-6j; Sun, 22 Mar 2026 04:18:07 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <prvs=1541709e57=songliubraving@meta.com>)
 id 1w4AGL-0000wG-7v
 for apparmor@lists.ubuntu.com; Sun, 22 Mar 2026 04:18:05 +0000
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62M4CaJp3065261; Sat, 21 Mar 2026 21:17:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 s2048-2025-q2; bh=1XupPCPaR3cuEdY8z0JaWskjHd4RMzyYwGVav96sw7I=; b=
 CHSVzNClvI+QctRYRL0VPsokSzbAKUS1KiI/Gp/PiSE8LCBK3gYab+u/d2dBAZvO
 IuHzNbRGcxIx7UxTZDZ3xFnGsHWwt5Dg2rtrVlU8zw19ufMHO10ikI9yYhXIxTVv
 qkfO88GAxw+E2C1vKxZk1/tSYhGKifmW/0iOqZfk9SE8Y15W03qm1UqKWrFT/tio
 Xvo4wMSoW5oa4ZolmusLRVvQLYdQS875EbqRnnrIOMrgOjGhOkHn86h4sd9u5TvY
 cA7dzpu+c3hNJz0Qa1US+5g7sGXEM+D74lP+QF8dp1dSYdJB+wKVU4A/Fjq/qb+w
 3TqvDw8NOLzGqp3CxvL+VQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4d1q1jv0r4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 21 Mar 2026 21:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wS1alxmYpbWGUbnEkEIlWNISzlCdhhn2hxJgUZ+ihPpu1ZLmPVYmkB5d+wlebgCKNEKlmofscENZN37m/LXh+KU3ZoVrQRw3voILYgVXGHaYKEtt+R4YhjfJuxolSM4RVfmsX6/B19Dr6rOetbp3Uq9qGJ2y6Pw/b0yZSOAJS1nLq3xn4LXc3I5JtWTD082+PT3NBHwG9UZ8ejyfmFS7kK39CwBh62p8TT+gB4Vj4OSPFNc95dLepebawKLLKk8k8LUUPm3ciONRPLx33nuZa85Atm0WHHuaPfQCvcYBEyjmf544IsSC2IZfbky8S/CHd/uayAXcymTgfPhVmZGnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XupPCPaR3cuEdY8z0JaWskjHd4RMzyYwGVav96sw7I=;
 b=qXohTA5YCsCUJjPtCZ1qjqBYJ5oVLlikey4aoUbqqzD5ihX//LYnhisM603zNyfnshNheQ/g/I2g88A1mkpjy4q4CgMAVgSq1cmYHN9CGLbWGu0/9MZ4kAdXOj8QXx06DrMrc2K09RdqwJYu+3gmFM0CbyDFljP/AFJTKIjl6ix0L9ksp9El/+tT3ANykaG7lqX/cetR2rAE36cO3XyapiheunxS+tfBC4x3J2+Ss0yk1IIojjcv3OObPLEkDRjLXAxgPgKWpArTsmXM6dxPlxSejQC+1UN75DfAZ1Ko9IkK/W0vaUJK7nF73dF6V10pdMuZfYY2tDzB4dp+a6mtcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SA1PR15MB5109.namprd15.prod.outlook.com (2603:10b6:806:1dc::10)
 by SA3PR15MB5751.namprd15.prod.outlook.com (2603:10b6:806:313::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sun, 22 Mar
 2026 01:06:36 +0000
Received: from SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::87b6:de64:203e:7434]) by SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::87b6:de64:203e:7434%3]) with mapi id 15.20.9745.012; Sun, 22 Mar 2026
 01:06:36 +0000
From: Song Liu <songliubraving@meta.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Thread-Topic: [PATCH 6/7] tomoyo: Convert from sb_mount to granular mount hooks
Thread-Index: AQHctwdNdQSRi0Q1xkmL3qjyFdgbKLW49bKAgADMdIA=
Date: Sun, 22 Mar 2026 01:06:36 +0000
Message-ID: <4DF5C4A8-7C92-4F76-9B34-2262089E7289@meta.com>
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-7-song@kernel.org>
 <b720f521-e930-4f35-9505-1bfdf9e2818c@I-love.SAKURA.ne.jp>
In-Reply-To: <b720f521-e930-4f35-9505-1bfdf9e2818c@I-love.SAKURA.ne.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.400.21)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5109:EE_|SA3PR15MB5751:EE_
x-ms-office365-filtering-correlation-id: b7a99d48-958b-452b-8aaa-08de87af43f9
x-ld-processed: 8ae927fe-1255-47a7-a2af-5f3a069daaa2,ExtFwd
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 2QsippZto0a8WRI+kP6AIeHhj1K8JQ1xWlcET9J6WZv2sFvQO6WztYEOVOlFpaQPYyo5r/cO49qVx1UU0IGxN7Iud3C9cSnj5c848AzELxY5jVYFoU1BHAdhyT8HLIpoGTb24huiTnTYzgWn6dHSFNJodah38By/ko5Ylw8UU7g0UBWdFrBKsusDBUXp+/YeMW7exp/lIkwmIZJbPwLfEBxWFHW7Vy3c5hFZ7E4OyAEuV7eUrE8vPzTiAzm0GIgecmci+rievvtcDt4vQ9GrWLQM4lShqHXOGY3sTE2YtQ75Cjv1oOOY3DcIFnbn26ljAJe2GRO+efjAu5lGfgsC2i/xU0ebX0PBRen4AHOQUK5sI4XU/YB3q1lwqNjjb4flXxJNIc4CgeQqlpVjT5lYgOIjUEx7Vp5ULRO3KtKn6NrqLoKBO9lMVjfS2ZJsd7GsqiDj/lkP6Q50iLZX6d3V8C1P3nZXP8TYw+dl1CA8OEqTW0XpehmjxhCS8nylEVrMWP9JBcVxJXT7A/z+VinUotOMcWJyJXBuX1cVjcB40qoN+p1o0Xg+ZsEgSXz2hXPTIlWKwzRG4H+Zbk0sz+EzkiO/zBrj1b/aHuJOWzimTmYTKwCtJEyoso0iZrJw94a+AC3Je1ilk8GCIwu74akpT6zSP5I7JZKmu61Q+HEPlq8Jel5AbnbfrKLEgJu8eEohroPmMV24vjH8OCL1Gl0CPwrtb7oRJnF8vXr8NYRqerVYz8GkAnb5BDQBD926pfWNsVVfyh6PI911Igl8DgVKVZNt7Elpl6FyhAzU6ULY6jw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5109.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXBNc0xwbG1YYlBuQjdkU0NIaUJUcjBGcGNGK1RrRW5DWGd1bFRrNjVzRmhy?=
 =?utf-8?B?RnE2RXducmw1UHAvdENWQUlDZFZxQ3RqUlJCYWdsdzhFam9ZM3F2VUhvb0tN?=
 =?utf-8?B?cUFtT2ZjTXdCcnplSGNlSUlIZDd6cDNvTFMxbEozd2cyaXFpUEsyZHcxZU80?=
 =?utf-8?B?Nm9rWGp5Z1FuaXVEbEY1OFM2V3pLRzlWZ3dtdHNOb1FiQm5wb2MvUTlya2lm?=
 =?utf-8?B?RzlVdkRmVVFLdkJIT20zUkhrK29OU1JwQmVuYVc3YUZmdnpQNXk1UkI4ZUkx?=
 =?utf-8?B?NGlPMXI2ZWpNTitEeUM2Z0I4a1dkcUxZOFZnVGhCL08wNk5HQ2NCaHJhN2N3?=
 =?utf-8?B?R256MnNzc056UHVQOTM3aEIwbTdnZjloR0txbFNMYXpyZlVkWVVFZ1pCTkNZ?=
 =?utf-8?B?L2doakNFN3pHM3BZTTdYa09TUlpyWk1GSmJwSklSZ0N4M1BjSGorQVlpNSsx?=
 =?utf-8?B?SENGN3duSFBLZnRUSnhKbDZFMDN5K3JvMnJPL1V1eE5GS1dRZUV6b1VGWWVT?=
 =?utf-8?B?SkU1dHdUSTZiY3ZOODZuemZvRHlJd0VjTGV0YlZyb2RaMDJJOUFNMVdsOXl4?=
 =?utf-8?B?THZVN2FQUFBwYThyOE5Fb1VrcTBJMCt3R0ZjaEswZ3NPSkNXT2pOWkpxTWlE?=
 =?utf-8?B?dE1LdE9YV3E5RGw2QVFSNE51UDY4MUlDaE1uK1MyVU1rLzJqaW83RkNvQlNC?=
 =?utf-8?B?YzBlNVg0T1R4T3dEQXNYT3VEbFlmQmVDNDRJRTUweFVjVldCaThVUllhQW85?=
 =?utf-8?B?bUlmKzRBVVgwcmY3cnp6SXRDZjR6azZGOXBaQWtwd25MSzZSNFBuQmloeXow?=
 =?utf-8?B?emY3SW9hYTQya1k4bTgrWDIwcDBsU2RQcHpGSkFhVkxyZFBlWDNHNjJ0SU9T?=
 =?utf-8?B?K1BsK0pxelhlUGY1TXNJTXdxb3B0UUVSR3Q0ckRzdnBOeW9NK1VGTWVJcXBD?=
 =?utf-8?B?dnREa3JNbDdGWTROZ1dST0lUdHhzdm5oRll0NDdXMmV6amp0M0VDZkdjZTNR?=
 =?utf-8?B?Q1A5V29Ubkl1cXIyVGV0MGg1VVhQY3FWc1VXbm1UbFJlSzVMNXRMcEkrc2Fk?=
 =?utf-8?B?bVBZRndyNGQ3T0NsZitWMnFCNUkyMnZRem1QYjg2V0pqanljQ0ZLb2xUcTJM?=
 =?utf-8?B?OHBOVmlZeUNCUDFKTzVBMkZZU0FMOVhiWWY1U1A5OVdteHpvb1hYOUhYMm13?=
 =?utf-8?B?WUUyRGdqUlhGS2srRjAyTUhtY2hnV0l1UkppUVdzOUQ1aVBUOXlSSm14Qktm?=
 =?utf-8?B?MFhDaWQ4MWxaTDduTEV2Sjlod1Y1UmV3OEp3MVBhVEpicHA4YVc3a2pxZnRq?=
 =?utf-8?B?Q0tLWU9IbFBtbW8yK252S2JYbWlLS3lnQTRGcVFyR1NuaDN2SXE0N1ZtKzBF?=
 =?utf-8?B?QnFOblVZRzFLV2xYalJ4bm5qLzFCMldhMUZ5RjFnVUwxR2cwZmNrRmNDekZm?=
 =?utf-8?B?TXRvQ01JRHBTTVZDZytuVTBnenVVdHEwZU9ZbWZKREtYOU5xMXZCVGpaTzZK?=
 =?utf-8?B?VXhQTE56RUhUU2Q0eUFScHlIMGZoSWpMTVBuS1NJcWtRQ0ZtRW0zSjZLeGNk?=
 =?utf-8?B?ODNjNlMrbTViaW1oTjhWaWdqMnBWaDNtRGVyMmRRWWFNN2JnR3N6TUFXejJv?=
 =?utf-8?B?NGc0dVBmOXlhSHkyMkVockZlTy95VW90QVk0MVR4M080d1pnRjZsTnBOZ01q?=
 =?utf-8?B?WjJEV0xaSHVrc2VQU1Q1dzFIV0V2eXE4R29hME1ReHhNa2s3eC8wUGJIZHpI?=
 =?utf-8?B?NUhVSWxvY3RDWkVjUGUxZVZxcElPZUYrMHNuMUtXZkp5RHBpZ1hrQnZRZ1p1?=
 =?utf-8?B?U2JPaFRwZURBcmxMU2RiODUwblZYRm1wdmQ1S0hGM2E5MGFXVWJwdG9IblpK?=
 =?utf-8?B?YU9KRUhHOW9FbUl5SHZ5eTRPalNBVysrNVUrSXNqRWpGNEtUcDhXcW5HNTBz?=
 =?utf-8?B?VEpVbDRuUEdONG9BaE55c0pydDM3U0ZEVFQvaXVLd1VUOW5ya2FSRW94aVpy?=
 =?utf-8?B?c2lDR0pML1BpSzBwcUR2L1JsTzd5VkgzSGsyNEQzK1hHK2g3RmV6ZFEvbVRY?=
 =?utf-8?B?TFdRTXE3NnVTTmhrcXFqZUg0T2pFaFgyMzNtZW95aVhJOXZJUGJ4c05PcVFx?=
 =?utf-8?B?bVhVOWZ1a3lMSlMzSTMvSmN4bHdER0hoN2I2N0l2eS9ka2QxanZiZEducm54?=
 =?utf-8?B?YkQxWUppQWNDM2ZTTzVTUTdFYTE3OE42bTdjMEdNNENaRHhmZmFrRmRQZCt6?=
 =?utf-8?B?eWY0NnAxNjBzZDlzK3lpdnp2R1BGUjlQYklXTm5UQzZVNmhyRE5aTEJsdHdN?=
 =?utf-8?B?VTJXWnY4K0pVaG5Ya1lJQlU1SzYwN1F3SXpHN2xRcE9JZ3lueGdRR1NOYTFh?=
 =?utf-8?Q?jiI8jo3bHkC0QFqE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82375B9888BDB64B9F80DC60859AD417@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hDpBqKMZLWkhdTNnT6+ympkF4HVVROgphZAf6jb4XVrGRbj30FDU6jpZAVIoZ5a0JAkzZneE/G5K4Iex0rni7K1M6H549/SqOBAlTCCPaTV6VFfATOvdhLPV3aBDd5NNAxJKVJlz4/zKXeXlgpAWSqpwvyB5qdDIQv6+1+1B8pbbpfnPwlCM1oxPld8X8tlHYOQTMVkxMOGVUbxFkLnjt3luQYdS9zqI1/rNkA+ZzMtijIg8TLDXbuCpYF8RKowjnRTgRoI5wDwLxWdWAjZMDrJKcYesLywDszM4BYbXqFJrx9LREtSSsFvEpJgH7JlMCyGGRQFd9oAWll/IzdcEaQ==
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5109.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a99d48-958b-452b-8aaa-08de87af43f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2026 01:06:36.2050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjIGvo8tyYL4w02gV2k9RKgGFkITFQk6pgFhlIAhuXBrTfp+Va+86GUriddO43QX045O3WsehTKMZoY+CBgp2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR15MB5751
X-Authority-Analysis: v=2.4 cv=YLqSCBGx c=1 sm=1 tr=0 ts=69bf6d5b cx=c_pps
 a=94FLU6K3oGZrB1XHaeOsDA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=4h92JMTCafKA-fb_NiOh:22 a=VwQbUJbxAAAA:8 a=JO67u45Hr6Uav_sJJ68A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: -hg47SZh8l1QqEudZ1VcxVZeJRqP_P1C
X-Proofpoint-GUID: -hg47SZh8l1QqEudZ1VcxVZeJRqP_P1C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDAzMiBTYWx0ZWRfX+mTv33BeTS1P
 tX856EQ0JmlqnfvIFABv63EArsJ8+s8sRgQSbIoM+jYHcaVudCI0Pn8MT9s/+uJzq7AHAN2K3HF
 EuX0u1fJRoD/3TKPMEQUhovXk2/1yN6yeMDrRMCgAmfWjIVORiYWumWtBWejRAQtfC7AIVX9b9c
 oBXtPYXO1m67h/ID4Ii7WurptlMEl2I6iaMgiEGK7J4LsTkoCATvpd61dfboPZSyQnLP2xc8I/u
 KDVBYe/nqUFfMswLcQt7ZVF6ccI7YdT4FZLPltfkFM6c2SNQPRqleOGoAk/0Iil++VBsCVw3QnP
 q5JHwjvMIjCyzHLzKMpzBskEaqalzLygWOmHLVXtE8HR99skH+iJMeYGItnmh0nL38iLRvvPu5g
 ce6VaQr5GxjOstADnn4gu5xO2EE4r5VEcDFZN17jeuaLrvmpXvTZX1eubTqEXMSUJQXnbEsFWfh
 E+qEbSKTtOHEeHb9usA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_01,2026-03-20_02,2025-10-01_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=1541709e57=songliubraving@meta.com;
 helo=mx0a-00082601.pphosted.com
Subject: Re: [apparmor] [PATCH 6/7] tomoyo: Convert from sb_mount to
	granular mount hooks
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
Cc: "herton@canonical.com" <herton@canonical.com>,
 "brauner@kernel.org" <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>,
 "paul@paul-moore.com" <paul@paul-moore.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "stephen.smalley.work@gmail.com" <stephen.smalley.work@gmail.com>,
 Kernel Team <kernel-team@meta.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "jmorris@namei.org" <jmorris@namei.org>,
 "omosnace@redhat.com" <omosnace@redhat.com>, Song Liu <song@kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "gnoack@google.com" <gnoack@google.com>, "mic@digikod.net" <mic@digikod.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "takedakn@nttdata.co.jp" <takedakn@nttdata.co.jp>,
 "serge@hallyn.com" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [4.69 / 15.00];
	DMARC_POLICY_REJECT(2.00)[meta.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[meta.com:s=s2048-2025-q2];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:penguin-kernel@I-love.SAKURA.ne.jp,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[songliubraving@meta.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[songliubraving@meta.com,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i-love.sakura.ne.jp:email,meta.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	APPLE_MAILER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:-];
	TAGGED_RCPT(0.00)[apparmor];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 1F5F82E8386
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gT24gTWFyIDIxLCAyMDI2LCBhdCA1OjU04oCvQU0sIFRldHN1byBIYW5kYSA8cGVuZ3Vp
bi1rZXJuZWxASS1sb3ZlLlNBS1VSQS5uZS5qcD4gd3JvdGU6DQo+IA0KPiBPbiAyMDI2LzAzLzE5
IDM6NDMsIFNvbmcgTGl1IHdyb3RlOg0KPj4gUmVwbGFjZSB0b21veW9fc2JfbW91bnQoKSB3aXRo
IGdyYW51bGFyIG1vdW50IGhvb2tzLiBFYWNoIGhvb2sNCj4+IHJlY29uc3RydWN0cyB0aGUgTVNf
KiBmbGFncyBleHBlY3RlZCBieSB0b21veW9fbW91bnRfcGVybWlzc2lvbigpDQo+PiB1c2luZyB0
aGUgb3JpZ2luYWwgZmxhZ3MgcGFyYW1ldGVyIHdoZXJlIGF2YWlsYWJsZS4NCj4+IA0KPj4gS2V5
IGNoYW5nZXM6DQo+PiAtIG1vdW50X2JpbmQ6IHBhc3NlcyB0aGUgcHJlLXJlc29sdmVkIHNvdXJj
ZSBwYXRoIHRvDQo+PiAgdG9tb3lvX21vdW50X2FjbCgpIHZpYSBhIG5ldyBkZXZfcGF0aCBwYXJh
bWV0ZXIsIGluc3RlYWQgb2YNCj4+ICByZS1yZXNvbHZpbmcgZGV2X25hbWUgdmlhIGtlcm5fcGF0
aCgpLiBUaGlzIGVsaW1pbmF0ZXMgYSBUT0NUT1UNCj4+ICB2dWxuZXJhYmlsaXR5Lg0KPj4gLSBt
b3VudF9uZXcsIG1vdW50X3JlbW91bnQsIG1vdW50X3JlY29uZmlndXJlOiB1c2UgdGhlIG9yaWdp
bmFsDQo+PiAgbW91bnQoMikgZmxhZ3MgZm9yIHBvbGljeSBtYXRjaGluZy4NCj4+IC0gbW91bnRf
bW92ZTogcGFzc2VzIHByZS1yZXNvbHZlZCBwYXRocyBmb3IgYm90aCBzb3VyY2UgYW5kDQo+PiAg
ZGVzdGluYXRpb24uDQo+PiAtIG1vdW50X2NoYW5nZV90eXBlOiBwYXNzZXMgcmF3IG1zX2ZsYWdz
IGRpcmVjdGx5Lg0KPj4gDQo+PiBBbHNvIHJlbW92ZXMgdGhlIHVudXNlZCBkYXRhX3BhZ2UgcGFy
YW1ldGVyIGZyb20NCj4+IHRvbW95b19tb3VudF9wZXJtaXNzaW9uKCkuDQo+PiANCj4+IENvZGUg
Z2VuZXJhdGVkIHdpdGggdGhlIGFzc2lzdGFuY2Ugb2YgQ2xhdWRlLCByZXZpZXdlZCBieSBodW1h
bi4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogU29uZyBMaXUgPHNvbmdAa2VybmVsLm9yZz4NCj4g
DQo+IEJhc2ljYWxseSBPSy4gT25lIHF1ZXN0aW9uIHRvIEFsIFZpcm8uDQo+IA0KPiBEbyB5b3Ug
c3RpbGwgcmVmdXNlIHRoZSBpZGVhIG9mIHJlc29sdmluZyBkZXZfcGF0aCBhcmd1bWVudCBiZWZv
cmUgY2FsbGluZyBMU00gaG9va3MNCj4gKHRoZSBwcm9wb3NhbCB5b3UgTkFLZWQgYXQgaHR0cHM6
Ly9sa21sLmtlcm5lbC5vcmcvci8yMDI1MDcwOTEwMjQxMC5HVTE4ODA4NDdAWmVuSVYgICkNCj4g
ZGVzcGl0ZSB0aGlzIHNlcmllcyByZW1vdmVzIHNlY3VyaXR5X3NiX21vdW50KCkgYW5kIHNlY3Vy
aXR5X21vdmVfbW91bnQoKSBob29rcz8NCj4gDQo+PiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvdG9t
b3lvL21vdW50LmMgYi9zZWN1cml0eS90b21veW8vbW91bnQuYw0KPj4gaW5kZXggMzIyZGZkMTg4
YWRhLi44MmZmZTdkMDI4MTQgMTAwNjQ0DQo+PiAtLS0gYS9zZWN1cml0eS90b21veW8vbW91bnQu
Yw0KPj4gKysrIGIvc2VjdXJpdHkvdG9tb3lvL21vdW50LmMNCj4+IEBAIC03MCw2ICs3MCw3IEBA
IHN0YXRpYyBib29sIHRvbW95b19jaGVja19tb3VudF9hY2woc3RydWN0IHRvbW95b19yZXF1ZXN0
X2luZm8gKnIsDQo+PiAgKiBAZGlyOiAgICAgIFBvaW50ZXIgdG8gInN0cnVjdCBwYXRoIi4NCj4+
ICAqIEB0eXBlOiAgICAgTmFtZSBvZiBmaWxlc3lzdGVtIHR5cGUuDQo+PiAgKiBAZmxhZ3M6ICAg
IE1vdW50IG9wdGlvbnMuDQo+PiArICogQGRldl9wYXRoOiBQcmUtcmVzb2x2ZWQgZGV2aWNlL3Nv
dXJjZSBwYXRoLiBNYXliZSBOVUxMLg0KPiANCj4gSSBndWVzcyB0aGF0IHdlIGNhbiBhdm9pZCBw
YXNzaW5nIG1heWJlLU5VTEwgZGV2X25hbWUgaWYgQWwgVmlybyBjYW4gYWNjZXB0DQo+IHJlc29s
dmluZyBtYXliZS1OVUxMIGRldl9wYXRoIGFyZ3VtZW50IGJlZm9yZSBjYWxsaW5nIExTTSBob29r
cy4NCg0KSWYgSSB1bmRlcnN0YW5kIHRoZSBjb2RlIGNvcnJlY3RseSwgdG9tb3lvIHJlY29yZHMg
cmVxdWVzdGVkX2Rldl9uYW1lIGZvcg0KbmV3IG1vdW50LiBuYW1lc3BhY2UuYywgT1RPSCwgZG9l
cyBOT1QgZG8ga2Vybl9wYXRoKCkgZm9yIG5ldyBtb3VudC4gVGhpcyANCmlzIHdoeSB3ZSBrZWVw
IHRoZSBtYXliZS1OVUxMIGRldl9uYW1lIGhlcmUuIEkgcGVyc29uYWxseSB0aGluayB0aGlzIGlz
IA0KdGhlIGJlc3QgYXBwcm9hY2ggd2l0aG91dCBjaGFuZ2luZyB0b21veW8gYmVoYXZpb3IuIA0K
DQpUaGFua3MsDQpTb25nDQoNCg0K

