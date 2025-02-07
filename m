Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CD83BA2CB3F
	for <lists+apparmor@lfdr.de>; Fri,  7 Feb 2025 19:28:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tgT5I-0007BH-4A; Fri, 07 Feb 2025 18:28:12 +0000
Received: from mx07-0015a003.pphosted.com ([185.132.183.227])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <Ian.Merin@entrust.com>)
 id 1tgT5F-0007B5-P1
 for apparmor@lists.ubuntu.com; Fri, 07 Feb 2025 18:28:09 +0000
Received: from pps.filterd (m0242864.ppops.net [127.0.0.1])
 by mx08-0015a003.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517GYk7X010003;
 Fri, 7 Feb 2025 12:28:08 -0600
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
 by mx08-0015a003.pphosted.com (PPS) with ESMTPS id 44nj811qj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Feb 2025 12:28:07 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kr88mCc+S/UxyQf1eyf2gG0CxNp6+XChbEAZ/XHIh3EN8muFDuwdIz3mIBQzu4WIE0lOAL+3KOGTiLPAbdzMjjnsGKL9RotjbuBi/yCmWNHFe4cDUIEAKLg/JkNf1Y+aJmTo1qTKqOuWPzFupN4/u/2CihzZ7b+ufmTw+3OtIFeSfLwfhXpm2CsisJWcNNy4Ont5+BniPlEPIPJMG+eYYqPkBkHsdFkZQP+0Hz1NBZoMr8ByE1+FWfSd1Q6rCuQ+jFT2wOo0dyTHrRqu1uUGC8YNhqR1T8rzTrTE9GmK7Isox9M0EJ7i2NiaoL4eJ4+DmeoxQPsrTBRz6SDXqXgmKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5BeMiUie9tbHs3dLtgnJd7QVxYIBIJb9v2EXMIetlI=;
 b=ZFqE66sqv0PqkrhCrgh54ZpXdJR4prUYoZ4m/0TrFNrzsZ/pYf6V7jlwrvA4GQ8OeGD8v61dxdSxDYzgrgWlu/CGoun03fKYEGiTu3KGCUx0q6w7NqUePtWMMH2x+4YFBg3sUw4dT92/eHWRDQtjmiwTQdVaWPq7+i3Jy7jBbarOO6NBlDhs3Rm+5h0kZJ/lVlQ7OVB0WgC/0AJQnvg+4bwo8rZegy2kknbAXvkiChC3X3zqmMUha0Vn/7SxIMBNAqJu7FwCaB/q2Y8c9lFVqKPeS/5sMVZfrAp/CzsKYRebARE0nIRU/B3jUtkdJtXIbp2Yj6x1Y5zgJG5w7pqP7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=entrust.com; dmarc=pass action=none header.from=entrust.com;
 dkim=pass header.d=entrust.com; arc=none
Received: from BN7PR11MB2788.namprd11.prod.outlook.com (2603:10b6:406:b2::30)
 by BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 18:28:01 +0000
Received: from BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834]) by BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834%6]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 18:28:01 +0000
From: Ian Merin <Ian.Merin@entrust.com>
To: Ryan Lee <ryan.lee@canonical.com>
Thread-Topic: [EXTERNAL] Re: [apparmor] policy variables not working as
 intended
Thread-Index: Adt5h9YWidhbKKmaRoWnB+eNXVVbKgAAwvQAAACn0TA=
Date: Fri, 7 Feb 2025 18:28:01 +0000
Message-ID: <BN7PR11MB2788EFFC07BEC96E0FBF414CFFF12@BN7PR11MB2788.namprd11.prod.outlook.com>
References: <BN7PR11MB278887F249FC486A72D9D665FFF12@BN7PR11MB2788.namprd11.prod.outlook.com>
 <CAKCV-6sTBaJiCG4xb63+oActonpJXCF1Lk7LJ3uZc=f8bN2VBw@mail.gmail.com>
In-Reply-To: <CAKCV-6sTBaJiCG4xb63+oActonpJXCF1Lk7LJ3uZc=f8bN2VBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2788:EE_|BY1PR11MB8005:EE_
x-ms-office365-filtering-correlation-id: a9ce6168-4084-4a8d-94f0-08dd47a527b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eEpRenY5c0tDVEoxaEJlR0FIUmhhc0QxWXNqaFNIeUZFeWhJSndqZlVVcmsv?=
 =?utf-8?B?WnZLTTZPakk2cVZoQy93dFhUclR0aUx3UjF3a3JYNTh6Uk1QRWwvd3p0VDVE?=
 =?utf-8?B?SUhyOE10SXROUlNhc01qbFJESHBlZkcrdWVrQUFXYUNGM2JJOGxYUVRGa1Ew?=
 =?utf-8?B?TUxBS2ZnR3ZYVkxMZnFBOUU4T1VTQ2VPY3RzMmVGQ3NtT3FzNVhZLzBIN0NK?=
 =?utf-8?B?UVd1SmlOTWlnUUcxTVZTeVZzOVR4YTJ3U3psRk5GbXBqeEhwblg3bDlYWGh0?=
 =?utf-8?B?N0JLZXZGMzdQZzJyc2NlY3pYS2c5U0pBVHpwblU3akJOelA0cEloV052N3FP?=
 =?utf-8?B?MlFNUEtjczB6bFVjbUd2UndEN29rQktGQnh6STFLbzNiQ1NFM2hDRTRiMDU2?=
 =?utf-8?B?ODMzWnl0SGVrODdEY2hGNVkwQU44N1FSdzRWUlZ1cENibGJpM2xtY2xPRDNT?=
 =?utf-8?B?ZDg2TnhWcDlUZHZQb2g4SjEzTWkveENNUWdtck44UkFnY3BiUEFvN0dDdzN4?=
 =?utf-8?B?TmhJUGs3UGdzeDVXQlBsR2VDU3VkTlNVK1kyMVIrUzV5eXlPQlROK1haazhR?=
 =?utf-8?B?NkNzWDBXZjJVKzRsZk13SGlmMGxTWFV2S2o1TmZzT0h5cnNSVEJieitib1dn?=
 =?utf-8?B?UzVZMkVqZW5uSkhpaHRyZys3ZW12OWtqNXVBVVlPSHR6eksramFEOFFmZTl3?=
 =?utf-8?B?WFV1YVFKN005K0pPa2ZvSVNvUU82RnR6blZYWVFSRDUrMW9OUWc1VmtqZnRX?=
 =?utf-8?B?Rm04c3Zic0xyQ2lCaSs3QWpOUlhkT0NocEtkRitWZ2hCUTEzVy9zaU40U0I1?=
 =?utf-8?B?dmdwc2kvU3NnbHhvN25sSVFRWitQaXY3SklLWFQ2SXZhdUVJWXllTUtla1hE?=
 =?utf-8?B?MWNIdWxwdDRyamk4K2Z6cHloUHFwVUgzZ2pRS0pjQ3Z3ZFliOW54L2g0OTNF?=
 =?utf-8?B?Mk5PeXhIemdHNDVzeW8rZTNmNTJJbGc5MWdGLy96MW5YZjVjblJIY3dmU1Q3?=
 =?utf-8?B?bGRBSjJrU0xuUzJ6OG5ydThMVmx3Q2p4VU53N0hsZkE0T0NKYUZjZENobnFn?=
 =?utf-8?B?OGhOd04yQzZYL2tSVVl2N0ZaMG44Y2lTUE93YmlLdC92SmFGRGZkSFNZQVRH?=
 =?utf-8?B?N2tHZDJiRDdRVUR4Y2VacGs0SmVMLzV5R0Z1bFpDUHVJeFJKdEtIMmE5NWlh?=
 =?utf-8?B?aVFLQktQTlVzWTlSYjRwS0FXenl5RHUxQ0s2R0lKM0d1cHBOUXZNNjRWRjAv?=
 =?utf-8?B?dUxVTW9JWVN1cGdQVmlNdVlCdnJMbFYxTkxaaFhGb200dkRqTGFKQ051cGxq?=
 =?utf-8?B?YTBPTkFDR2hRTmlIMno5VjRGTGN0K0pSclg4MTNZbU1sUE1VVGxzUDFwYVA3?=
 =?utf-8?B?OXFsYmxRTkFhOEU0TzNHeDJVQkhiTkhja0pOdzlUQ3pIV3QxSFoyWElNb2tq?=
 =?utf-8?B?UUw0d1MzbHRuWXV2VVFGUGxsMDVJa3FUVkFyOW5qOE93RHRLSis3c0cxR2hv?=
 =?utf-8?B?aUVocnF6NjEyOHZQR3JwVGJodHdjMTRTQldobHgwS3Z0dlJHc2MwTzVXRG8y?=
 =?utf-8?B?RlNFdzhhUUhVZS85WUpqVGhqaHRCYWNFYWFaNGl4S1pSSGl2elBrRG1Sdy8w?=
 =?utf-8?B?RzcrK21MeVN6aWlzQTl3NUtkYkIrWDU4eC90anNEb1RGckZaWTdERS9yTFI0?=
 =?utf-8?B?b1N0K0pkWlVJdkUwcE9jUm50ZEdYVGZHejJsMWJLQ0FFdzBVM1FNd1FMdW00?=
 =?utf-8?B?dEFhSjJQVWswQ2ZEOG1ZbHhmZ0FaZ1ZobnJ6NmxZeUVuNXlEeGdxWklTTmFQ?=
 =?utf-8?B?dDAzci85b29vSnhwUUFEcG9WYzFzVGZyS1R5cUlRQVpyUFgwWFk1R0hSM1lI?=
 =?utf-8?B?RjNoTnBqWG9lZGJaYm5oYThUSitaRnZBaDE5Q1oybkExa3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2788.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(7053199007)(13003099007)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?USs0a1YrUURLWnBFMmtOR2VEMk9VTnlqeDIzaURHZW94K2c3TlpSbGpZUmE0?=
 =?utf-8?B?ZHJEcGgwanVCazdGamZmanJzQms2TUpoMGUwVVFKTE9LTk50bnhaUHhpOW5H?=
 =?utf-8?B?aDRtSHBzQ1liZ3dzemNBeVVLanlaZ05zdmZhT1NBSzd2U1BocjdrZldYSjRN?=
 =?utf-8?B?bm04MnoyQWVuaWRmZEdza0FkZkR3bXJZRGVPS1V3NngvanRUTitObTdzby91?=
 =?utf-8?B?UW0rQzRneUFQSURGWjdBS1M5L2pGQnltWmNsRHVjMFdFUFYvOUo1ejlGeGF3?=
 =?utf-8?B?Um1DZ1Q3QlFpc24zQXB3bCtIQUZ6a2RRdFhuRlZheENqejlpODZWN29zQXdn?=
 =?utf-8?B?a1NDc1VRdStyWGNGK2FjemFkVlprYzhaQjZWUnVZck9BNVRSaGxsbzVmTjdM?=
 =?utf-8?B?dGluOUhhOXNlL0dId0xuWmFIS3NybjNaeGNvNW94dENmcHdSL1JrS3BIMTlT?=
 =?utf-8?B?N2tCVXI3SlRnRE1vQkRvNmpoRFZEd0lwSDNsMXhiNUhDaE8za2hGU3RRK296?=
 =?utf-8?B?eHFmRUtkTE1Xb21wVXBUYktGdENqSklESkd6NFdjNjBTMUMrTHNtcTdvc2tu?=
 =?utf-8?B?Y2FkV1VIWDU5YnRmRXI0VG0wcmcxSmVpSEJ5MDNSWGdPRmkrVmNBWlRYc1pN?=
 =?utf-8?B?NmtuSzZKcUFkT2tKNFpLaEcram5tbEJQUVp0THJidXYwSHgyQ1luNkJqWHQz?=
 =?utf-8?B?UmdWQjc5UDMvOHA2TnM1YTIvL0Y3Y0VPdjVMbWF2ME5qOW5nV2YxRkdDeThG?=
 =?utf-8?B?aUMzVFBtN0ZrNjVDTjcvd0I3clJaNzhGMlFUeHpXSFRRRllocXhlb1p1Rmp0?=
 =?utf-8?B?VGw0YUZ4dGF2WW55cDJoa3NpT2tkbE1NM1JKaWJxTEdMOWhOWS9uOS9iWTJz?=
 =?utf-8?B?K0MySkxQZnJMaTJwVGY4aHJXUm80K2g5UjhXN25iNDZ5U3A0K3MrcC9Bcm1n?=
 =?utf-8?B?M2laM2RrTjJBdkhjNEpJdGZ3TFRHSnFDTzVQYTdrN1N3UjhvRGlmMGpLdW15?=
 =?utf-8?B?UHUwS0tVMFBOVzk2Wk9jN2o5eUtOUHpyNFh3dGtxSXRuYk1mRzZHZHpQMVBL?=
 =?utf-8?B?eEgyeE9rbWduREE0aFJONU9vbmZSQWR3VHBaNDR4UXFCUDZ1c0tHVUpOMnFL?=
 =?utf-8?B?cGloR1c0YkRKZDFpbEJRdWgrblZ6UXl1b2VhTnZqWkFuSW8wcGtrK1RLaTdj?=
 =?utf-8?B?K0JIL2tyNU1yS05pN284cHBmMWtCVjV0eXlMcFJxQ0tXVUxSVVh2Ym1ka25i?=
 =?utf-8?B?dUZhMXp2YXUrbEhBaHRVU2VnV0hOdXBZdzlySVNWMEp5QzF3dlhXM08wVmU1?=
 =?utf-8?B?WDVsbkdBbzR6eTJOM01JeUJsbVJxdGRuY3g5UFhOMDhqTlRMY3NGVlhvR0pt?=
 =?utf-8?B?cnZIWGo2Tmp4aG1vbzZOWTFsUmsvUHlIeFZPazF2Q3l5SEVRRXEwNVdoOXBY?=
 =?utf-8?B?U2J3ajV2ZEtjQzliakRCekVrZ1kvRHlDZXg5ZW9OMUdoYVRtMThQamdXczZp?=
 =?utf-8?B?MkhmaWZ1SGUzQ1ZLeGdGY1Npc3ZaT0E3dlVnOWJBdlUzdENwTlNBZlZxajBm?=
 =?utf-8?B?ZHdEZ0JMWkRPNUgySnpYdU1RclY5L1U0M0JqR3J2Ty83cVozZ0ZzNzlsd0s2?=
 =?utf-8?B?a09LSjVSRTNxUlhiYlBRdTBGM3YwdGdXaVVJWVNWMWhCby9XcGFWSEVWUUdu?=
 =?utf-8?B?ejRYOVFVaTFXaC9QamN0ekY2L1pWOUsxQ2g2MmNBbGlzWitPQlY1L1RpSW5p?=
 =?utf-8?B?dkdUYUdTdWlJdEJGRWNtYmQxZG81V050d0pXTVg3dm5YQk51QllLZ0laYkRa?=
 =?utf-8?B?V1c0R1l2Vk5IU2tkQUhSQ1U3WTB6M05mQU5FTWdJeWl4M0lrMTUyckRrSElm?=
 =?utf-8?B?aDlmTWlzeXlkdmtUendEQjZCTzRhb3FURU16b2c4c2ZIa2JoWjlpV3d0bGtp?=
 =?utf-8?B?WjBFZEdtTzA0QlBiNkVYRGF1WnNUWDZ4TU9iOGhJbVFBQ05nYWN1T0tWTFNp?=
 =?utf-8?B?ZU9wQUI4cml4djV2U2hzYUNEMHhlbGJPQnIvSk8wbkpQS2Y5MmVJWUsvUkR1?=
 =?utf-8?B?QnhpaVdac1FvbXh4Yjhac0t0TlI2R1lyaGZTMHhRSnh2OWpDMFphRlRscTNh?=
 =?utf-8?Q?/2IQhqWQNsPznNzzRWDkyEWTE?=
Content-Type: multipart/alternative;
 boundary="_000_BN7PR11MB2788EFFC07BEC96E0FBF414CFFF12BN7PR11MB2788namp_"
MIME-Version: 1.0
X-OriginatorOrg: entrust.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2788.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ce6168-4084-4a8d-94f0-08dd47a527b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 18:28:01.7054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f46cf439-27ef-4acf-a800-15072bb7ddc1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UYgsik/7FUqw+7vUyB3F77zGe6rP5gTb6TrGGg4cIbUsEbHJSqxUk4euv0ux5dT4RvPO5BBsKPi0x+yqUFuKRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8005
X-Proofpoint-GUID: mjLyW2HAZmnVJuV3upHeWLKzlKye2O_Q
X-Proofpoint-ORIG-GUID: mjLyW2HAZmnVJuV3upHeWLKzlKye2O_Q
X-Authority-Analysis: v=2.4 cv=E7g3pbdl c=1 sm=1 tr=0 ts=67a650b7 cx=c_pps
 a=SXeWyiAXBtEG6vW+ku2Kqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=HUO4g1kYArUaO8lO:21 a=xqWC_Br6kY4A:10
 a=T2h4t0Lz3GQA:10 a=dVDJzTMCqzgA:10
 a=FEbzDYiKvWYA:10 a=fxJcL_dCAAAA:8 a=p0WdMEafAAAA:8 a=DfNHnWVPAAAA:8
 a=XUe_gMu_AAAA:8 a=MdizWucVEXyJ-dkVVvEA:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=H_MpUsldtl4A:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=aqUCCrY2kP-LiRFd0VsA:9
 a=eVPeSJY18DIJBz3N:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10 a=rjTVMONInIDnV1a_A2c_:22 a=Hyxxk7IO8alR8e2HbrPC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502070137
Received-SPF: pass client-ip=185.132.183.227;
 envelope-from=Ian.Merin@entrust.com; helo=mx07-0015a003.pphosted.com
Subject: Re: [apparmor] [EXTERNAL] Re: policy variables not working as
 intended
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
Cc: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--_000_BN7PR11MB2788EFFC07BEC96E0FBF414CFFF12BN7PR11MB2788namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

That worked!  I swear I tried every possible combination of leading slashes=
 yesterday with no luck, but this format does appear to work for me.

The reason I did it this way is because the example on https://manpages.ubu=
ntu.com/manpages/focal/man5/apparmor.d.5.html defines

@{HOME} =3D /home/<file://home/>*/ /root/<file://root/>
[=E2=80=A6]
/@{HOME}/.foo_file  rw,


Is the example incorrect?

Thanks,

Ian



From: Ryan Lee <ryan.lee@canonical.com>
Sent: Friday, February 7, 2025 1:06 PM
To: Ian Merin <Ian.Merin@entrust.com>
Cc: apparmor@lists.ubuntu.com
Subject: [EXTERNAL] Re: [apparmor] policy variables not working as intended

Hi Ian, Can you check if the rule @{lib}/**.=E2=80=8Aso* mr, works for you?=
 If so, the issue is that your use of the variable creates a rule that star=
ts with two slashes, which currently isn't collapsed down into a single sla=
sh. You can check https:=E2=80=8A//gitlab.=E2=80=8Acom/apparmor/apparmor/-/=
issues/450

Hi Ian,

Can you check if the rule

@{lib}/**.so* mr,

works for you?
If so, the issue is that your use of the variable creates a rule that start=
s with two slashes, which currently isn't collapsed down into a single slas=
h. You can check https://gitlab.com/apparmor/apparmor/-/issues/450<https://=
urldefense.com/v3/__https:/gitlab.com/apparmor/apparmor/-/issues/450__;!!FJ=
-Y8qCqXTj2!f9oWyuGcS34NJiZS203lli6FcfWdViVkOl3Xavc2LT8mzO9fpEOFbKj284WaKyRW=
Ip0UW1p2TpDGnhH1qrQ$> for more information.

Ryan

On Fri, Feb 7, 2025 at 9:50=E2=80=AFAM Ian Merin <Ian.Merin@entrust.com<mai=
lto:Ian.Merin@entrust.com>> wrote:
I=E2=80=99ve looked for documentation on variables to determine if I am usi=
ng them incorrectly but I cannot find very much information about variables.

I have created a variable @{lib}=3D/{,usr/}lib{,64}/

And created a rule as such

/@{lib}/**.so*<mailto:/@%7blib%7d/**.so*> mr,

This rule appears to do nothing.  If I substitute the value of @{lib} into =
the rule:

/{,usr/}lib{,64}/**.so* mr,

It works exactly as I expect it to.  I have tried every possible combinatio=
n of slashes for the variable with no luck.  As far as I can tell, on  appa=
rmor and libapparmor v 3.1.2

Thanks,

Ian
Any email and files/attachments transmitted with it are intended solely for=
 the use of the individual or entity to whom they are addressed. If this me=
ssage has been sent to you in error, you must not copy, distribute or discl=
ose of the information it contains. Please notify Entrust immediately and d=
elete the message from your system.

--_000_BN7PR11MB2788EFFC07BEC96E0FBF414CFFF12BN7PR11MB2788namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">That worked!&nbsp; =
I swear I tried every possible combination of leading slashes yesterday wit=
h no luck, but this format does appear to work for me.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The reason I did it=
 this way is because the example on
<a href=3D"https://manpages.ubuntu.com/manpages/focal/man5/apparmor.d.5.htm=
l">https://manpages.ubuntu.com/manpages/focal/man5/apparmor.d.5.html</a> de=
fines<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">@{HOME} =3D <a href=
=3D"file://home/">
/home/</a>*/ <a href=3D"file://root/">/root/</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">[=E2=80=A6]<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">/@{HOME}/.foo_file&=
nbsp; rw,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Is the example inco=
rrect?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Ian<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Ryan Lee &lt;ryan.lee@canonica=
l.com&gt;
<br>
<b>Sent:</b> Friday, February 7, 2025 1:06 PM<br>
<b>To:</b> Ian Merin &lt;Ian.Merin@entrust.com&gt;<br>
<b>Cc:</b> apparmor@lists.ubuntu.com<br>
<b>Subject:</b> [EXTERNAL] Re: [apparmor] policy variables not working as i=
ntended<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:.75pt"><span style=3D"f=
ont-size:1.0pt;color:white">Hi Ian, Can you check if the rule @{lib}/**.</s=
pan><span style=3D"font-size:1.0pt;font-family:&quot;Arial&quot;,sans-serif=
;color:white">=E2=80=8A</span><span style=3D"font-size:1.0pt;color:white">s=
o*
 mr, works for you? If so, the issue is that your use of the variable creat=
es a rule that starts with two slashes, which currently isn't collapsed dow=
n into a single slash. You can check https:</span><span style=3D"font-size:=
1.0pt;font-family:&quot;Arial&quot;,sans-serif;color:white">=E2=80=8A</span=
><span style=3D"font-size:1.0pt;color:white">//gitlab.</span><span style=3D=
"font-size:1.0pt;font-family:&quot;Arial&quot;,sans-serif;color:white">=E2=
=80=8A</span><span style=3D"font-size:1.0pt;color:white">com/apparmor/appar=
mor/-/issues/450<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-line-height-alt:.75pt"><span style=3D"f=
ont-size:1.0pt;color:white"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Hi Ian,<br>
<br>
Can you check if the rule<br>
<br>
@{lib}/**.so* mr,<br>
<br>
works for you?<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">If so, the issue is that your use of the variable cr=
eates a rule that starts with two slashes, which currently isn't collapsed =
down into a single slash. You can check
<a href=3D"https://urldefense.com/v3/__https:/gitlab.com/apparmor/apparmor/=
-/issues/450__;!!FJ-Y8qCqXTj2!f9oWyuGcS34NJiZS203lli6FcfWdViVkOl3Xavc2LT8mz=
O9fpEOFbKj284WaKyRWIp0UW1p2TpDGnhH1qrQ$" target=3D"_blank">
https://gitlab.com/apparmor/apparmor/-/issues/450</a> for more information.=
<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Ryan<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, Feb 7, 2025 at 9:50<span style=3D"font-famil=
y:&quot;Arial&quot;,sans-serif">=E2=80=AF</span>AM Ian Merin &lt;<a href=3D=
"mailto:Ian.Merin@entrust.com" target=3D"_blank">Ian.Merin@entrust.com</a>&=
gt; wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">I=E2=80=99ve looked for documentation on variables to determine if=
 I am using them incorrectly but I cannot find very much information about =
variables.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">I have created a variable @{lib}=3D/{,usr/}lib{,64}/<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">And created a rule as such<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><a href=3D"mailto:/@%7blib%7d/**.so*" target=3D"_blank">/@{lib}/**=
.so*</a> mr,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">This rule appears to do nothing.&nbsp; If I substitute the value o=
f @{lib} into the rule:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">/{,usr/}lib{,64}/**.so* mr,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">It works exactly as I expect it to.&nbsp; I have tried every possi=
ble combination of slashes for the variable with no luck.&nbsp; As far as I=
 can tell, on &nbsp;apparmor and libapparmor v 3.1.2<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Ian
<o:p></o:p></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><i>Any email and file=
s/attachments transmitted with it are intended solely for the use of the in=
dividual or entity to whom they are addressed. If this message has been sen=
t to you in error, you must not copy,
 distribute or disclose of the information it contains. <u>Please notify En=
trust immediately and delete the message from your system.</u></i><o:p></o:=
p></p>
</div>
</div>
</blockquote>
</div>
</div>
</body>
</html>

--_000_BN7PR11MB2788EFFC07BEC96E0FBF414CFFF12BN7PR11MB2788namp_--

