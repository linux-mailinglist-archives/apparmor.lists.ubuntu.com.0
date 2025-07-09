Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EF6AFF614
	for <lists+apparmor@lfdr.de>; Thu, 10 Jul 2025 02:43:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uZfNx-0007pf-OU; Thu, 10 Jul 2025 00:43:37 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <prvs=3285b19836=songliubraving@meta.com>)
 id 1uZYGp-00089S-DW
 for apparmor@lists.ubuntu.com; Wed, 09 Jul 2025 17:07:47 +0000
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569EUZDl032532;
 Wed, 9 Jul 2025 10:07:05 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47snbu3cb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Jul 2025 10:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmUIBp3PYRkUEhnhUs3KD4xXI7wdNypc7K433/bBl5oub8YLJJnSsKEfrA7ICLuXg0qBlDMyJETORAFuYQ+KG9H/wtWZp4RYf8jPJLlqlgsmdQubZjU2Fx+6CBWP2kMnJlkZbNdmkFtoxjmYLevw5PO97Nhiro+13Hf7+83tRSn7zp0I/bmpsl1sVasL6fme4UiBqLypAGX184nTu8gLcAkIvoHGQZDz3G2XH0dfZqEu+MiYFvm2098oge3YL1pt+Zk01us7b+HIUCw2f5AHl8JX3IRz772L+k91btcafR5rhMYSeuvLbOfC97U7PppmVBMj3G3aR1p9oFt6HBPHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qXLiEC0jei3qqslLKWDFTTGzQXfWrtVlvvOKSpuXXA=;
 b=e8aqfocLJoieeTC5PPX7al90XEJIr8uZvSozPaf/4RK9qUscjG53GDvquF55qgqDflt2fdI/TAxRukC85Cg2hQ+gq8gp9nmiLazrCYhcCweKDOhgs/OjjQHYqnoqHQ81+T7RBNPL+Y1GsClaV2qVeD29UbV5HFTAw/Sx3cqSGYL/mzE+c6T027SjFB1xXUX7YxWSyis7HCEl9LcMGf8wTyoxKfLj4fTD8MPFzygAMK64howsUkwgvxXgkT6Aajyv0ui/BUgfdvuv/9l+GmgFxjsqgw6mxwR9WH9yt6JrkwtKYHkQiRj67EtVs2026hBhy+mFevGuf018vTTs4ij0og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SA1PR15MB5109.namprd15.prod.outlook.com (2603:10b6:806:1dc::10)
 by IA1PR15MB6247.namprd15.prod.outlook.com (2603:10b6:208:450::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 17:06:36 +0000
Received: from SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::662b:d7bd:ab1b:2610]) by SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::662b:d7bd:ab1b:2610%7]) with mapi id 15.20.8901.028; Wed, 9 Jul 2025
 17:06:36 +0000
From: Song Liu <songliubraving@meta.com>
To: Paul Moore <paul@paul-moore.com>
Thread-Topic: [RFC] vfs: security: Parse dev_name before calling
 security_sb_mount
Thread-Index: AQHb8FzEhXwik4wHVUiG4oVmXX3W0LQpln0AgABShACAAB3hAA==
Date: Wed, 9 Jul 2025 17:06:36 +0000
Message-ID: <1959367A-15AB-4332-B1BC-7BBCCA646636@meta.com>
References: <20250708230504.3994335-1-song@kernel.org>
 <20250709102410.GU1880847@ZenIV>
 <CAHC9VhSS1O+Cp7UJoJnWNbv-Towia72DitOPH0zmKCa4PBttkw@mail.gmail.com>
In-Reply-To: <CAHC9VhSS1O+Cp7UJoJnWNbv-Towia72DitOPH0zmKCa4PBttkw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5109:EE_|IA1PR15MB6247:EE_
x-ms-office365-filtering-correlation-id: 517f486c-343c-4e4c-3874-08ddbf0af6d1
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RWM5a1VxYTd1Wk9HRVM5VHZBYUhxelJLSzhoUisvaGZ5RU41Z1drSHNodEc0?=
 =?utf-8?B?QjBNQnBKS1piaGliZGxmbkVFR29YZzdmMGt3aFZFbVBFTklpa1J4MHBQL1Yz?=
 =?utf-8?B?YmdPUjU0RnBjZjBFOGJ4R3piRDNrUXpnUkhtTHhPMzRtWjlCcm1uSXZpRDV3?=
 =?utf-8?B?emhWZG9ZSC91MmM4VGEySzcxanA3ZFNySURqMU8vaE1KNHVCTVM2RjdYbFBz?=
 =?utf-8?B?YUlRSVhveit0cXQyTklqSFA1RTdpTytZckpxaUtkZ3NQMklMNHd6WG1ZNitD?=
 =?utf-8?B?ZDNLSW04ZHpIYzc4V1R1ZDNnUk5OSEtZdVgyN0JpSkN3TmtPdVF5aFNtQXZu?=
 =?utf-8?B?NlBJS1ZETThuNzFPNm4zL2wvcHJiUTBNWUJ6YTdxem1YR3BnQmorUXVHalRy?=
 =?utf-8?B?U05yQ25UamVJSi9scWwwd0d3UklEZ1VoSElJMFNRZmg1cU8wK2QxWVdtd3Yy?=
 =?utf-8?B?bTM5RHdCOE1ZZFQrSGh6WkVQUTNFSTZtQWVNUkI4aHB1Q1RUTzdTTThEaytL?=
 =?utf-8?B?TGpBNlBwY3VLeTNtejgyNFFVVXdWSDhySUR6dkpPZE1Fa2x6SGdpejNmUlRJ?=
 =?utf-8?B?M0NPd1I2RThrT3dvY2tyWklqV0p0eHZreXY3SFBrdlFnQVF4VTYwM1N6cHl4?=
 =?utf-8?B?bTRSY1BhWlpNMHlncU04OG82VkQxdlFzQ1pFUlRGdysvRzR6eGVNRTFuSzNT?=
 =?utf-8?B?b3hZUXNRVDFKdHpka24wZkhNaFRZQXR3SzlGUDhBd1RjdWFTR0NZUWJxSTdw?=
 =?utf-8?B?ajhWcFZRQ1hWS0hwM0Frb0lpTFpaWFk2dVJtc2NibE9SN0RxL1BEWGZTRmh5?=
 =?utf-8?B?am9idFVaZHVNRS9adXpsMkFoZUpuUzhObVNlMDlxeE9xNGh1OERFSzg1eXFZ?=
 =?utf-8?B?UUJJbURRNHE3VWo3d01Sb0hNQ0xJcE4rcVAxcjcwNnVwUm1jTWkyZDl3M05F?=
 =?utf-8?B?UWt6L01XSnVEcDAyTitNWHZpRlBaOE1YTElvd2tkT3UvNnduajhLa3FwaVBx?=
 =?utf-8?B?d2RXMlhHNjFlKzVKT2E1V2lRY2dwcGg2NEErbnFpWU5vbUUyeHFaVGpnRWZQ?=
 =?utf-8?B?NnoyTlBkajEwemZaOVJxZkhVYTgrbiszZWRCckNVYXhDKzBpK3RsY2g4Y3p5?=
 =?utf-8?B?cGV6R0tKSmpZVFRsYkUreklOZjBUTUxWbXM2ZXRnM2xzekhDeG1QK2IwYnpv?=
 =?utf-8?B?ZWkwclJRdTBvSE9QYktDVG41NjlHNFgxTTJ6RW1DMGpYaUw3N01QSXZZQjFZ?=
 =?utf-8?B?Zy9JaHBjUFlaVko5V1hTOTZHRGw3dURBQ0xrNkZ0TWY2b3NVdTNzMlVrM3Z2?=
 =?utf-8?B?a1dmTG1WZXd4TmxWVmM1dENXdWdZVWlkQ3dBNU9hWTVieitxaWIxQ1QzeXdK?=
 =?utf-8?B?eHVvZ242QjZEY2s0Mk5nUmtzRU1zdVlFWTJYZ3VBcEtPMngxTGFTU1pQR0RN?=
 =?utf-8?B?aURGV0NnbldDT2VXdTZELzBsUFRnWUtya2JDMGFhL1FYOWJlUjFwMytTajB0?=
 =?utf-8?B?Wk1IdDg3OG4xcmJSYTltc3V1L3hzN25xdTJ6ZEdQREVWYmErb3J2UHU4T1ho?=
 =?utf-8?B?dDdwc0VLdUJDOTEyRmtYVjUremNOdklJWnJBVnFUT0djeWtNR0VjU2RnV1lD?=
 =?utf-8?B?NXl3V011NnNoTWR0WjlCY1haVnRNNi94eW51aWpCL25FcnVNVWNUKzFOUXlk?=
 =?utf-8?B?K01xVVhpMTl2SXdwUnpxTXFZY1FucnM1QzBreWMxL29JQTI2MDlQcGdseUJl?=
 =?utf-8?B?VDJHdGtFdlgyYmdyYW5HRHhoNGtEd2lUYWFnQk5xL291a0ZDa0c3QndXQXZh?=
 =?utf-8?B?eG9Yc1ZrbC9pUDJtTW5CSnIySHc0Y0kyNUdETWlnaFlYWHhpR1F5QUorby9v?=
 =?utf-8?B?ZVA3QzF2Z0dCZ0djcFVZYUZMSU5WQ2pqTytiYk1HUm9jeHNxaXhoZmVXS2xr?=
 =?utf-8?B?NldSeEJmNVRUN2xUK1paYlRwRTBiTDNUeUhLQm9KUDhTVUNzZkxOaEZ6UThr?=
 =?utf-8?B?ZGlLdGFKZVlBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5109.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkpyYWwxZ1ZWUXV3R2t1blh2NVFOM1duTHRxK0RTOGVseUZUWXJJdlBJQUsr?=
 =?utf-8?B?UW5UdWp1dFVyWFJ0MjVPUGIyTUxDaXM3WU9NeDdiKytuUHlOREluT1VHMm5X?=
 =?utf-8?B?U2Z2TVgzSEUyQzMySjZid3hreE5oRU1LRzF5UmFybDJRVHBPV0FkU1MvYVJL?=
 =?utf-8?B?UzVXbU9kY1hPWUNxNzQ0dlRTc2dIcXJKT21HSmVFcm9uV1pqa3FhQjY4M0sv?=
 =?utf-8?B?aUNSdjJHanYzMEZ1MVlUNlZ1VjRDaWd0SHkxa2FGUDl4TGlRT2drTVhJU3VD?=
 =?utf-8?B?TUp6L1ZvcWEvU3JMbW1iK2FWT2ZicUUzMEhMbTIvTXZYNk0zSWErSVNRV0ly?=
 =?utf-8?B?bFJZVmUwT2hHUGN6RUlkeHF3bmZ3S3l3T2hvZDdOKzk1TjJDL0tJeU5BZFlB?=
 =?utf-8?B?Q3ROQWZIZ2VlN01SM0E5dUVub1BIUytvU2R1TloraVhWUjRXQ2tpK3hia1pK?=
 =?utf-8?B?TkZBaWkxUGdBMTZSb3B3L0ZVMkhRMHFNSW1EWEtkNUtSUURta3JCMDNRU3dv?=
 =?utf-8?B?d3k3OTliS281RURlL2VnYUk1ZEljMHdKeWJQVEhNR21NL2M4K3Z3Vk1QcGRT?=
 =?utf-8?B?TW1pa2JUWXB1eFpZZnFBWDdPSG5ET0FhdFdOR1J1Y1cwaWhaMHNGb2t0eVAr?=
 =?utf-8?B?WnNIZFdTcTJlOGRuK0lhOTRlVjNPME84UHlNZzZCSFNSTmZGVzNPV0lxa2F4?=
 =?utf-8?B?S0JlZEk4bk9naktzWWxqeDIrOWRnK1g1SkJIUFNYZzhvMXRrYzVVWG5LMDdT?=
 =?utf-8?B?MnRVTkdURW5PNXVlbktZbWlDWTJ0T1ROblRXZ3lKbWFIQitSSWhXcUU3dlN1?=
 =?utf-8?B?SG9ld1BEWUFNVnhyZEJpYWlaamR3QVl4bkFuRjJJU1ZVcThOSU9vS1NnMTBz?=
 =?utf-8?B?R1RhbG9ydmFNdWhBMkVqaFZEaTBqUnlvT2oxc3lUNm1PNzdQeFZXMkdSbW9I?=
 =?utf-8?B?bEtzWlFMMU5YdUlWTHA3UmppVlpvZ3hYdm5aM0s1MXdtcnZ4MVc2T0xkV3Vp?=
 =?utf-8?B?RFAzTnZvdHdWM25aNEk1amJoWjBvSjhxWlVhYTU4NUMvUGNwTk5tSzg3bzRj?=
 =?utf-8?B?N1E2bW9uTFRuRWQ1WkNzM1JEM3lQdTZzL2EzSzZ1cmFJSXNlUFdWbmJxcjZD?=
 =?utf-8?B?QkJmRFRsVVhnMnFBUUt4eC9LUnNPUUJzTkJ5VW9qekx2bXNYc0taQkpVZTho?=
 =?utf-8?B?S3QvOUxzaERhRG0xaWxxU2twc1ovMkhwTDBtVkREWksrVDBRR3RKTEVBamt4?=
 =?utf-8?B?U3k5SnI2dm10MnU5T29xaCtwVXBiQnM0VjlDNmpJSEJjdjEwWGo1Y3F2clp1?=
 =?utf-8?B?blE3SEFaVGJ6dTFsOWFSeU9EbTFyU1NYTjdIRGZiRHZrcFk1SE5Zc2ZsbXhJ?=
 =?utf-8?B?NHlKamZLb3YrSnZyNzJ1djNFamNPYklHeWdneVA4d1BTa2cwdGdjSEl0dmxw?=
 =?utf-8?B?dzNmL3FyelV3R3RrWTkyb3haaTVLRXNNN25ZN08yS2FYVVFtWkxlRmtVZUhm?=
 =?utf-8?B?T0g4OFJyUTRiVHY5TGNOaS9HRXV4SHAwSURDdmNEUFNCbWM2bEFWRkdlTFVI?=
 =?utf-8?B?Ymd5bjMzeDVIVEVPcWIxbXdnaGVMNjNoMjRoK2RWMjhhWWh4RWJXRjJHYng3?=
 =?utf-8?B?K1BIZW9tb0ZMa1J4N3oxQlVJWEtDYkdyTVc3NjljUktLZCtsVmxBeU0wRkJT?=
 =?utf-8?B?MC8vWDBzMlk0WjA4MzZZSWhlb3Y0M2gwMk5XWnBnRE1VUVFKaFhmT3R1MG9l?=
 =?utf-8?B?dGRMVzZiVnQ4MVhxZEdBNmZxRjJ6bXArZkhmYlJyRVVLSVdGOWNmKzRUdUJy?=
 =?utf-8?B?QW1BUWFpb1Avcmg4NWRqUCt5aXN4emRITlgvSFczRFZQRHBDbkRvc1ZQcWw1?=
 =?utf-8?B?c2NaNVZZTldkWXpTWVVuZlZHdFJkNUZnQU1DYkVpbDNueVpFcDFBSDVGUkpG?=
 =?utf-8?B?YXZBNHZNQXZzUktGejN3TTdjcEwyVlJOMzkycG9DRkdhT01wc0p1VGdlbWJP?=
 =?utf-8?B?ZHBTQmdMV2lyL2dyVmJPUUJtQ254dnAwa1c4MFAzbHBjVlBXbXhSRlB2Zll3?=
 =?utf-8?B?ZklqVG5xWk9hOUdwL0c5WXBjTExrRlRBMkJXb1U4aDlrQ2ZmOGh2TlFDaFNp?=
 =?utf-8?B?QktxcXlha05rMUZYaDBIUDNzWmpzMExVK1YybTNQN01nRkg5RGhPUzFxL2lX?=
 =?utf-8?Q?GPtNtxR9OkDEv0J8eZ7/9x4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB1F9A11A2114E4184ADE863FCDF338E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5109.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517f486c-343c-4e4c-3874-08ddbf0af6d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 17:06:36.7572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UoDCOV/6OdvnBaSJHIQD7+OpzGQntF5beO8zsczKgYKNqbTRixGu0nHf/scoH2p3k2/7w4Hp+k4xrdXNyzNWkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR15MB6247
X-Proofpoint-GUID: YHJmlFPG35Usbyklw5z7qw1mli4gTmcd
X-Proofpoint-ORIG-GUID: YHJmlFPG35Usbyklw5z7qw1mli4gTmcd
X-Authority-Analysis: v=2.4 cv=NO7V+16g c=1 sm=1 tr=0 ts=686ea1b9 cx=c_pps
 a=Dff2arrQVR4xu3ccdyRu6Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=xVhDTqbCAAAA:8 a=drOt6m5kAAAA:8 a=xR4r-JqttigpS9gvqDAA:9
 a=QEXdDO2ut3YA:10 a=GrmWmAYt4dzCMttCBZOh:22 a=RMMjzBEyIzXRtoq5n5K6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE1NSBTYWx0ZWRfX3dhM3zRfNgbv
 Yxyl+9vnjMSjN9iIslZPbnoJfJ6woI5AXT1WGJMPvB6AS6cBTIPLim7sXwZmT8yo9LxFwAq70t2
 wqzxh6xIOd+djtl/oGGnTfrIvFs4MuA24RtCG9Sw0L7nBUNwBTsRSUN3vslnNRID9ynUkW+gX+u
 r27AQxBEkdnuCFr+h4tL/WVkOSkd/gqtvx1GwPIL8P9vKefxkFEhpdwxzAiVG6eP+HYScExjM0Z
 l/c3Te6P4U6IysBESo/mwSVeovd/bY040gjA7XpYcpBqlB9UAgt+j02SEAWtDKi79GZabhXEycZ
 w9803fvoKWIFWGtKXEWk4kNj4+BXV3i/JjH6i3F4b6g7LjcYQ9wRUnjtgND0Vq0w/VgyWtjHBgS
 kW35jOqjPBNJ33Vq8oIvwfdhT2z4S+uDcTfigQOGr4jQ2r6bPn4drxbJElG5gg0VJ2HXOjqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=3285b19836=songliubraving@meta.com;
 helo=mx0a-00082601.pphosted.com
X-Mailman-Approved-At: Thu, 10 Jul 2025 00:43:34 +0000
Subject: Re: [apparmor] [RFC] vfs: security: Parse dev_name before calling
 security_sb_mount
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
Cc: "mattbobrowski@google.com" <mattbobrowski@google.com>,
 "jack@suse.cz" <jack@suse.cz>,
 "penguin-kernel@i-love.sakura.ne.jp" <penguin-kernel@i-love.sakura.ne.jp>,
 "tomoyo-users_en@lists.sourceforge.net"
 <tomoyo-users_en@lists.sourceforge.net>,
 "amir73il@gmail.com" <amir73il@gmail.com>, "ast@kernel.org" <ast@kernel.org>,
 "omosnace@redhat.com" <omosnace@redhat.com>, Song Liu <song@kernel.org>,
 "takedakn@nttdata.co.jp" <takedakn@nttdata.co.jp>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "andrii@kernel.org" <andrii@kernel.org>,
 "repnop@google.com" <repnop@google.com>,
 "john@apparmor.net" <john@apparmor.net>,
 "enlightened@chromium.org" <enlightened@chromium.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 Kernel Team <kernel-team@meta.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "kpsingh@kernel.org" <kpsingh@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 "mic@digikod.net" <mic@digikod.net>, "m@maowtm.org" <m@maowtm.org>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "stephen.smalley.work@gmail.com" <stephen.smalley.work@gmail.com>,
 "tomoyo-users_ja@lists.sourceforge.net"
 <tomoyo-users_ja@lists.sourceforge.net>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "eddyz87@gmail.com" <eddyz87@gmail.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "gnoack@google.com" <gnoack@google.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "martin.lau@linux.dev" <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

SGkgQWwgYW5kIFBhdWwsIA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMhDQoNCj4gT24gSnVs
IDksIDIwMjUsIGF0IDg6MTnigK9BTSwgUGF1bCBNb29yZSA8cGF1bEBwYXVsLW1vb3JlLmNvbT4g
d3JvdGU6DQo+IA0KPiBPbiBXZWQsIEp1bCA5LCAyMDI1IGF0IDY6MjTigK9BTSBBbCBWaXJvIDx2
aXJvQHplbml2LmxpbnV4Lm9yZy51az4gd3JvdGU6DQo+PiBPbiBUdWUsIEp1bCAwOCwgMjAyNSBh
dCAwNDowNTowNFBNIC0wNzAwLCBTb25nIExpdSB3cm90ZToNCj4+PiBzZWN1cml0eV9zYl9tb3Vu
dCBoYW5kbGVzIG11bHRpcGxlIHR5cGVzIG9mIG1vdW50czogbmV3IG1vdW50LCBiaW5kDQo+Pj4g
bW91bnQsIGV0Yy4gV2hlbiBwYXJhbWV0ZXIgZGV2X25hbWUgaXMgYSBwYXRoLCBpdCBuZWVkIHRv
IGJlIHBhcnNlZA0KPj4+IHdpdGgga2Vybl9wYXRoLg0KPiANCj4gLi4uDQo+IA0KPj4gc2VjdXJp
dHlfc2JfbW91bnQoKSBpcyBhbmQgaGFkIGFsd2F5cyBiZWVuIGEgbWluZC1ib2dnbGluZyB0cmFz
aCBvZiBhbiBBUEkuDQo+PiANCj4+IEl0IG1ha2VzIG5vIHNlbnNlIGluIHRlcm1zIG9mIG9wZXJh
dGlvbnMgYmVpbmcgcmVxdWVzdGVkLiAgQW5kIGFueSBxdWVzdGlvbnMNCj4+IHJlZ2FyZGluZyBp
dHMgc2VtYW50aWNzIGhhZCBiZWVuIGNvbnNpc3RlbnRseSBtZXQgd2l0aCBibGFua2V0ICJwaXNz
IG9mZiwNCj4+IExTTSBnZXRzIHRvIGRvIHdoYXRldmVyIGl0IHdhbnRzIHRvIGRvLCB5b3UgYXJl
IG5vdCB0byBxdWVzdGlvbiB0aGUgc2FuaXR5DQo+PiBhbmQgeW91IGFyZSBub3QgdG8gcmVxdWVz
dCBhbnkga2luZCBvZiBydWxlcyAtIGdpdmUgdXMgdGhlIGZ1Y2tpbmcgc3lzY2FsbA0KPj4gYXJn
dW1lbnRzIGFuZCBsZXQgdXMgYXQgaXQiLg0KPiANCj4gSSdtIG5vdCBnb2luZyB0byBjb21tZW50
IG9uIHBhc3QgcmVtYXJrcyBtYWRlIGJ5IG90aGVyIGRldnMsIGJ1dCBJIGRvDQo+IHdhbnQgdG8g
bWFrZSBpdCBjbGVhciB0aGF0IEkgYW0gaW50ZXJlc3RlZCBpbiBtYWtpbmcgc3VyZSB3ZSBoYXZl
IExTTQ0KPiBob29rcyB3aGljaCBzYXRpc2Z5IGJvdGggdGhlIG5lZWRzIG9mIHRoZSBleGlzdGlu
ZyBpbi10cmVlIExTTXMgd2hpbGUNCj4gYWxzbyBwcmVzZW50aW5nIGEgc2FuZSBBUEkgdG8gdGhl
IGtlcm5lbCBzdWJzeXN0ZW1zIGluIHdoaWNoIHRoZXkgYXJlDQo+IHBsYWNlZC4gIEknbSBoYXBw
eSB0byByZXZpc2l0IGFueSBvZiBvdXIgZXhpc3RpbmcgTFNNIGhvb2tzIHRvDQo+IHJlc3RydWN0
dXJlIHRoZW0gdG8gYmV0dGVyIGZpdCB0aGVzZSBnb2Fsczsgc2ltcGx5IHNlbmQgc29tZSBwYXRj
aGVzDQo+IGFuZCBsZXQncyBkaXNjdXNzIHRoZW0uDQo+IA0KPj4gQ29tZSB1cCB3aXRoIGEgc2Fu
ZXIgQVBJLiAgV2UgYXJlIGRvbmUgYWNjb21vZGF0aW5nIHRoYXQgaWRpb2N5LiAgVGhlIG9ubHkN
Cj4+IGNoYW5nZXMgeW91IGdldCB0byBtYWtlIGluIGZzL25hbWVzcGFjZS5jIGFyZSAiaGVyZSdz
IG91ciBiZXR0ZXItZGVmaW5lZA0KPj4gaG9va3MsIHBsZWFzZSBjYWxsIDx0aGlzIGhvb2s+IHdo
ZW4geW91IGRvIDx0aGF0PiIuDQoNClJpZ2h0IG5vdywgd2UgaGF2ZSBzZWN1cml0eV9zYl9tb3Vu
dCBhbmQgc2VjdXJpdHlfbW92ZV9tb3VudCwgZm9yIA0Kc3lzY2FsbCDigJxtb3VudOKAnSBhbmQg
4oCcbW92ZV9tb3VudOKAnSByZXNwZWN0aXZlbHkuIFRoaXMgaXMgY29uZnVzaW5nIA0KYmVjYXVz
ZSB3ZSBjYW4gYWxzbyBkbyBtb3ZlIG1vdW50IHdpdGggc3lzY2FsbCDigJxtb3VudOKAnS4gSG93
IGFib3V0IA0Kd2UgY3JlYXRlIDUgZGlmZmVyZW50IHNlY3VyaXR5IGhvb2tzOg0KDQpzZWN1cml0
eV9iaW5kX21vdW50DQpzZWN1cml0eV9uZXdfbW91bnQNCnNlY3VyaXR5X3JlY29uZmlndXJlX21v
dW50DQpzZWN1cml0eV9yZW1vdW50DQpzZWN1cml0eV9jaGFuZ2VfdHlwZV9tb3VudA0KDQphbmQg
cmVtb3ZlIHNlY3VyaXR5X3NiX21vdW50LiBBZnRlciB0aGlzLCB3ZSB3aWxsIGhhdmUgNiBob29r
cyBmb3INCmVhY2ggdHlwZSBvZiBtb3VudCAodGhlIDUgYWJvdmUgcGx1cyBzZWN1cml0eV9tb3Zl
X21vdW50KS4gDQoNCj4gDQo+IEkgZG9uJ3QgaGF2ZSB0aGUgY3ljbGVzIHRvIHJldmlzaXQgdGhl
IHNlY3VyaXR5X3NiX21vdW50KCkgaG9vaw0KPiBteXNlbGYsIGJ1dCBwZXJoYXBzIFNvbmcgTGl1
IGRvZXMgd2l0aCBzb21lIHN1Z2dlc3Rpb25zL2d1aWRhbmNlIGZyb20NCj4geW91IG9yIENocmlz
dGlhbiBvbiB3aGF0IGFuIGltcHJvdmVkIExTTSBob29rIHdvdWxkIGxvb2sgbGlrZSBmcm9tIGEN
Cj4gVkZTIHBlcnNwZWN0aXZlLg0KDQpUaGFua3MsDQpTb25nDQoNCg0K

