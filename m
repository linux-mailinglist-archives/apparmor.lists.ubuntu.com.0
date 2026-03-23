Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCH1OHW0wGkQKQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 04:33:09 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6BF2EC3B4
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 04:33:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w4W2D-0002Pp-Aj; Mon, 23 Mar 2026 03:32:57 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <prvs=154207a538=songliubraving@meta.com>)
 id 1w4W2C-0002Ph-Cg
 for apparmor@lists.ubuntu.com; Mon, 23 Mar 2026 03:32:56 +0000
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62MHN90c926993; Sun, 22 Mar 2026 20:32:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 s2048-2025-q2; bh=d86+ES6YcOkPgcaQjmqVSEG1qxIA3eRrJDxcd+hoJ+E=; b=
 rTNCIomaheTCh4Zs+Zg5tX1oFtrj+Aiqjlpwkfu6LE1qDiblhjwWzXn4He1ZApDA
 dd8ogKd1R72YvKBn51RpFvJ/RSeDlHhqjrvWhJ8zVlPqt99nxClS7Jp6TJ99Zt+x
 ubliroABJUXYdZ2HUKq8XCiI98juzmieKpSBL/mSASAyTZ2giqPx1DnEorwDkiqV
 wyRua9RWRAiSoPup0yvf3Cz70L+K4xv8/XgJ/P4FVY1P8mZrnyCGE9JhWl3lFLB+
 PvzjKiPTkxYxS+TS4+tncTV4Kf4YqISuPj79OlXN72co8HLj2OdGsgY8Ngx7kJKO
 Gm0ATcFx1hxTnptH4UAfAQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013057.outbound.protection.outlook.com
 [40.93.201.57])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4d2fbtccvh-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 22 Mar 2026 20:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OifGgoWxGkJ9f/dhLwJM1AdM9l/B+b9zdOnpCwo2KV5Tt58Dyf4GvqT15bsoMM8h4fhUFQCUZ6o/0Ma36hWS+GNGNLqwJOauuvrRmnZjM/kC95U0L7wfx01CdsN1No8OPxCYQdV1oqmbpmnzqcMhF+r6f+3jCM/1ze5cYDnHR2EhxgSXx+6wcVJ1HHdEVdMS0XVjcCYwxgNdKDdh+s1nPcZYu1Mbqfr3zRaqC2G1STYV1E3vlEbiI0ev95GaPxXV++4/htrp4uDcKdyQxhxQD/57SuAG0PQxqCqMWrJ6VvObuRinTO1F2vjBEXy7/6cv5CVhbTJTmFmTuy/30urY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d86+ES6YcOkPgcaQjmqVSEG1qxIA3eRrJDxcd+hoJ+E=;
 b=E3pboFpGSVqvplu5fZKneBIxeCX6bmwIy8HVpOoR0qrKQVdDywOqefqSnVpZnGaXMqWhGqCQxdZUZPTGRvVJygJk1zVs/LVgG+03N11NL2ugvHt739e/b9l+JD3z3RBTQ3lAHALu8/m7YXGR9O7AP1rfWdSQbuJcUJ8fr1tRR8KfTjqzBZjSny2wlZ5WGmS49mEf12yIIgH/IxtEgStl6tua7QnkYsfHwXTqTgjyAoaicFPEHNfAkdkwEYD9pDvWVCO4jn5cBRvXMo/ska5HhaJfiak+B5EkF11pYWjtylQpaLSjGpTfkSpxNkWOrdlsK3QXawag4NOlj06YK6A6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SA1PR15MB5109.namprd15.prod.outlook.com (2603:10b6:806:1dc::10)
 by DM3PPF708AC0143.namprd15.prod.outlook.com (2603:10b6:f:fc00::41f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 03:32:14 +0000
Received: from SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::87b6:de64:203e:7434]) by SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::87b6:de64:203e:7434%3]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 03:32:14 +0000
From: Song Liu <songliubraving@meta.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Thread-Topic: [PATCH 6/7] tomoyo: Convert from sb_mount to granular mount hooks
Thread-Index: AQHctwdNdQSRi0Q1xkmL3qjyFdgbKLW49bKAgADMdICAAKH7AIABGQuA
Date: Mon, 23 Mar 2026 03:32:14 +0000
Message-ID: <F0A0D13E-8208-49A4-9AC6-89AC4BF3F4FB@meta.com>
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-7-song@kernel.org>
 <b720f521-e930-4f35-9505-1bfdf9e2818c@I-love.SAKURA.ne.jp>
 <4DF5C4A8-7C92-4F76-9B34-2262089E7289@meta.com>
 <33abcf34-13e2-4a37-83f3-78bb27ecbc11@I-love.SAKURA.ne.jp>
In-Reply-To: <33abcf34-13e2-4a37-83f3-78bb27ecbc11@I-love.SAKURA.ne.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.400.21)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5109:EE_|DM3PPF708AC0143:EE_
x-ms-office365-filtering-correlation-id: 87bce743-f9d0-42aa-84f2-08de888cc691
x-ld-processed: 8ae927fe-1255-47a7-a2af-5f3a069daaa2,ExtFwd
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: j19POJJWW4zgXsNL6aRhPhquFeT85SFOd9ZQe1Lubg9OTAvTexhC4j5nz7r4M/KV0pXRLm5kun0FC9cPcJxXNAfTp/VJ4IWyFufSd5r+WDZijafr4LHijR1fH0in9lsPmd21v+Wzs8vEo9aBWax6pPQNUsKWutl72LVTCvkob3ArgdXKYq4CMu0fv/oCIr+9FWaVZcGP7NuRlrPI/bzVVrhHMuZap4T4JbZi0PKy4Z7prXZJg2FVd9pNQehHVBih95Msp3JSVBJK0m4ryhebgzakmp3T1xMP3t2Jx2aHFWdxRrpWOR9wfOEAv1gSM/MsLenaG+NEk3wHTeQu1BQGrfwtHKyYsnGl3pe9l11B3Vtxw7DVfTl52tRp6GnUjJYlP3Z1trX58m90omyuSUbxHNAhjrCJjf9ogRz0DtLhPRPkk83ecGEiigQtZfDab3Ree2/vcFMVdeAJHd8d2CK2/lWWKs0k8zfIre3MlZKpFYvS0GhAwJEUR/i+CIFlB23eTfrSaEEQfQGdmRaNvjfTPUhIvCDKtvz5Jqn5LJt4vUEqgSmDfufNUFYF17oTZUr602lgkIy4kIsr/UXSIzMWPRfr+Vn8vD0OqSD+gCKb9YxgLu3vKE2RF6De969rsbAvYKkWZj5v8pmrbn60OSDpeEWbyO7ek8U6SCQ9PgJXcpgpQO5qGhS7NTDhSHO5ciOxkq003932Ueye/mESq66TnaQVd0xAgq/EgqvceW9ciJk+cGNUbWABUpb6rdHAexZlhu3dC65QSJOP8sQvMEvXwr/xZP10S1HuTgvg2sJBwy8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5109.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WU5CWDJEY3JwU3RIS01OMEFFMFFsRnArdTJUS1psc2tIV3lrdGZyZzV2M25y?=
 =?utf-8?B?ZXFkTVVIZFg4ZmYzM0F0ZUZtSkd3TlVYb3ZhWGkwTVJlSHBNOEUxVG01MlIw?=
 =?utf-8?B?V1pSMWtlVCtDd0Jvb2M1ZGNCWW50Z3R2MFdXZGx2MkwzaUpaTEQybVZrN0h1?=
 =?utf-8?B?VVArWEVaZUh4NDIrSWZKbnN3T1NHcExyL1NQWDIwaVpsYUt1cHk4Ump3WmFP?=
 =?utf-8?B?c05EQk9ocDkvTFhHL2JwVzZtZkVucCsrZjB3WjBtZE4vMzMxR2pvdmlwR1dl?=
 =?utf-8?B?R2l3enBjZTQ0OGF6a1E2bzNpZ0Q4N0xJL3orRlB1UGxvR2ZkMHM4bm9mUjhX?=
 =?utf-8?B?MjdyS08vWUpzeC9ZV0pnWTI0ckd5T0dnWlVxTEFqUlAyYUFXNGtGMkR5OFVy?=
 =?utf-8?B?emtJMWtPMS9udTVsWmxPTEtmSWZ0bDJrUVZMbHpab3RZbWlHUVJic3owOGxk?=
 =?utf-8?B?U25obSszd0NMakptbWZKSjdRNlFrMnNoUWlwYTMvODNSUWx4TDIraDM1Rk5l?=
 =?utf-8?B?THRuODlWWEljV292S2orbUgzUGZqQU5mbmlpMVNJdjI1czNXOGJlYk94WjJI?=
 =?utf-8?B?Tkk1eW13anJRWVN1dUVnSExFOElFOUtHNklRVHhzbnZOeEpFbDNqRkUwc2Nn?=
 =?utf-8?B?ald1dzFzWjBtcm8vTi9OWlJBS3dVRkowRGI4TncxU3V0Tk16UTRHSDd6MG4v?=
 =?utf-8?B?dmsyRVFWRnVnVnR6RTBFbHM5VTBYdWxLVE9tUVF5bDduQVFMZjBvU3RmOGxH?=
 =?utf-8?B?V2VHMGpoV2xhcEFRRXdGemdGRlV0NEt5c0NGS3ZHQTFMUG10a0YzQWR3NjY0?=
 =?utf-8?B?S2lGSC9LOUNhV3VBTlZpSzN4N3BRSjJtbDdBdDVPUWdUZnpZcVVZQ25JNVFQ?=
 =?utf-8?B?NURWZytFN0k2QXVjcHRyTDZicFphVmNLazhKNy9UZ1J6VkMvbWZhTk5Ldk9z?=
 =?utf-8?B?NTNXcWJ5aWpZaEtudzZGcEtPNktqQUlGK3RLNTdzTENMYzJScVVROVphUHpp?=
 =?utf-8?B?V2hsQ1RzMDRHTlljUFFaY0RqOHdXWE5JZ1dRWnhxam4rMjJGZVlVT2dNc1lw?=
 =?utf-8?B?bFhoMWdMSk52QVVrSk1Ydzh5TENkR0ZEZlYyZVU4MVpjaktnbWppZFhLa0x3?=
 =?utf-8?B?UlFJNzR6TnlIQmFRNU5LYmFvYjB6MW5DY2VWTmtVVWJFakhKMFBqL2tIekJC?=
 =?utf-8?B?NXFncEZnMS9yQXRQejJabi9DRjliREFXditZSEFvTFM1eGlaeUR1QTBMYUJ1?=
 =?utf-8?B?SDY3Z1luNzJMamh6VUl6QVgrblN3MjlvRGtzTXRtUzBPKzhqTWIya2FWbWl2?=
 =?utf-8?B?VkxFcWk2SWxpdzR1U3U0V3doSmQraGdJZXg0WlZmV1AyQW1tdzV0WlkxN1l2?=
 =?utf-8?B?cFRWdXNSL0ZXNGExNktDYkR5cXpMTFhNbGdlVkpTUkRud0FGRzRoclREaVpJ?=
 =?utf-8?B?cTJDQTdvZXlLZzNPMUt3SmN2NW9FK2YxL1hGMWNudmNlekJ3YWt6VWkwM2JL?=
 =?utf-8?B?STJDRXliS0x5VjFPRUtxbHIxY09Ma29neEFzNThyaFlwei81T0xVYzM0elVD?=
 =?utf-8?B?ejJvWmZlYUlMT29lY2FqZGtOWWpQNGY0Uko1ZHI1bkdhZDZrVFRzK2tOeTZx?=
 =?utf-8?B?WFY4eUVlUkVXb1V3V1lIY3o5SEowL2h0bEpNWDNWUTBnTy9wcElVeGhuSXJ5?=
 =?utf-8?B?ei91REJJV1hySmZQUFRkZlcycGxML0IwV1RBRzh1YUZGaUJiOTBNZVFZRUR5?=
 =?utf-8?B?MkxwaEkvSGt0Ui95dmxWRjBaM3AxL1EydEUvOC9jbHdaL1ZZMEx3WGNmcThD?=
 =?utf-8?B?K29oL3N2clFRaVFmMjlHSUxnSlptWWJ4b1NqbmpOOGg0dmg1WGxoc3Y2Z082?=
 =?utf-8?B?QzhoZ3YyU2hDYWFEUHpKY0NCUyszU0NYVHRUQUZLektrMFRBWlBYekFDWE0v?=
 =?utf-8?B?K0gvVlNkaVBPbUR1bjdwbGtHcC9pL3FHQ09SWXI4cU9LQStsZGk3dmlsUzVt?=
 =?utf-8?B?SG5mSVhpL0xIcmZjWlBPdXR1N3Z6SXRoeFpOd0lmWlk5Y09RazVCYXBGTndW?=
 =?utf-8?B?bSt3b20vSTN4eGc2cnBjelkrZFRGOEJMUVZiYnFVWXl2cE12VEg5SE95ZEww?=
 =?utf-8?B?NFNNTFNnK0p5VVZCYktuSVZUcFlETEtmVytRc1hTRnlFL1hHVDlkbmhnVjJJ?=
 =?utf-8?B?a05aRzBsK01Za0lIWHFnWGZ3azBHK3BBZklIUTFLS0VXTjRUMk5wTDlxaHBT?=
 =?utf-8?B?TmpBcFFIbGd3UGJzbkpNUGxZMGRSeWJIZWZvMVQzUGgyN01tWms2MTB0alp3?=
 =?utf-8?B?c0lUWmZxNjFZSnlpTDkwS1pTTEtuY1V2ay81MEl3eWxCNWZqYTlKTStzYVVh?=
 =?utf-8?Q?kG1FiCcedGV0BdRY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD77605DC84510449A6A013026EDF7E2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HTquzBupQ+NgKFMDSA/dSgNPXRzRWb+o5xxiK32S57ynbDjsTgg2VfyCLGIUonDW66c6hrMfVh2wUoXPQ8potOtXSKH0eqqZ9jTtFha0vIXZ2clJ+fZavrdvP/9Is0b+xuGeyCRvSov061p4tXQBSGpG170dFRH89pHj8IAHQ3G3Wd2JX1cJujkJH+PwmY9n/P4Ucnrb+io13FG+MzjoGwbcdQWcihTjZ2wYeJlbm+pVG6snYseqFdcPsxYOvyaNx+eXztQaXIIk92ZcZ1c0Go8/OKX6e9mBzwiqjj+G/VE73OAyV2LQZkvuz+uHxsAbozANwHHWono2qBJp6dvcQQ==
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5109.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bce743-f9d0-42aa-84f2-08de888cc691
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 03:32:14.1119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3eoNvxLXiLX+qmgp0Svl3HjTTIlXgZvjVU0S7HWqkhowp2DleuO/Ll4kiu725aNfKlYa5yC2Zz8NZUOzIK65vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF708AC0143
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyNCBTYWx0ZWRfX3Y0MKf/IRPJh
 2J7XOxsE1Zf7Cpup1I5v9PA2ftanZ9Kzejuqi+vwSTNc2rzy5dp14oZFakHneu5JHq4v6yJelHB
 /N8SQxgq+nAOP6abTgsGyXdZq1hdC68WJCfFCcRN+4dNrc+tg9cNsOnHNQa07pk7jeBF7iJHmZh
 H+oL3K4IhnYjxcJB50vMBg7xK+BLC9MEwHSYpj9I5KCIMIb5olQrKUBjhiyZcv5FFbu9NMf1xP4
 0rgON5YcU7OIThgWT+BEORDxLII8/vhod4dWH2pgyUc5el1zuLAgw4yEoE+3zfY53rH1bCi6q2F
 +CM2YA5hdMOpAhG1hjOBpToJPUaGdJAHiYh/CHV1ogC8f9Qf6j2H9J4VSRFvRmeKjGInAl3OdsH
 No5QMb1NQVh3Bs/jwPymIqnmWPzCvaV3oLkgxzHYvuV/++I4snk40hwZ+nMbVWzaYlwfRLlukDp
 6zKWO8N/czWl6oZ7Qfg==
X-Authority-Analysis: v=2.4 cv=XZWEDY55 c=1 sm=1 tr=0 ts=69c0b452 cx=c_pps
 a=+XPUo/5NTXuj4we3MZHZ5A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=4h92JMTCafKA-fb_NiOh:22 a=KGFalZ1OaXhFVAX04_oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: -uF2zrvM_r7WW3BmTU0nI3T-oClM0cS2
X-Proofpoint-GUID: -uF2zrvM_r7WW3BmTU0nI3T-oClM0cS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=154207a538=songliubraving@meta.com;
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
	GREYLIST(0.00)[pass,meta];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[i-love.sakura.ne.jp:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	NEURAL_HAM(-0.00)[-0.998];
	APPLE_MAILER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:-];
	TAGGED_RCPT(0.00)[apparmor];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8A6BF2EC3B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gT24gTWFyIDIyLCAyMDI2LCBhdCAzOjQ24oCvQU0sIFRldHN1byBIYW5kYSA8cGVuZ3Vp
bi1rZXJuZWxASS1sb3ZlLlNBS1VSQS5uZS5qcD4gd3JvdGU6DQo+IA0KPiBPbiAyMDI2LzAzLzIy
IDEwOjA2LCBTb25nIExpdSB3cm90ZToNCj4+Pj4gQEAgLTcwLDYgKzcwLDcgQEAgc3RhdGljIGJv
b2wgdG9tb3lvX2NoZWNrX21vdW50X2FjbChzdHJ1Y3QgdG9tb3lvX3JlcXVlc3RfaW5mbyAqciwN
Cj4+Pj4gKiBAZGlyOiAgICAgIFBvaW50ZXIgdG8gInN0cnVjdCBwYXRoIi4NCj4+Pj4gKiBAdHlw
ZTogICAgIE5hbWUgb2YgZmlsZXN5c3RlbSB0eXBlLg0KPj4+PiAqIEBmbGFnczogICAgTW91bnQg
b3B0aW9ucy4NCj4+Pj4gKyAqIEBkZXZfcGF0aDogUHJlLXJlc29sdmVkIGRldmljZS9zb3VyY2Ug
cGF0aC4gTWF5YmUgTlVMTC4NCj4+PiANCj4+PiBJIGd1ZXNzIHRoYXQgd2UgY2FuIGF2b2lkIHBh
c3NpbmcgbWF5YmUtTlVMTCBkZXZfbmFtZSBpZiBBbCBWaXJvIGNhbiBhY2NlcHQNCj4+PiByZXNv
bHZpbmcgbWF5YmUtTlVMTCBkZXZfcGF0aCBhcmd1bWVudCBiZWZvcmUgY2FsbGluZyBMU00gaG9v
a3MuDQo+PiANCj4+IElmIEkgdW5kZXJzdGFuZCB0aGUgY29kZSBjb3JyZWN0bHksIHRvbW95byBy
ZWNvcmRzIHJlcXVlc3RlZF9kZXZfbmFtZSBmb3INCj4+IG5ldyBtb3VudC4gbmFtZXNwYWNlLmMs
IE9UT0gsIGRvZXMgTk9UIGRvIGtlcm5fcGF0aCgpIGZvciBuZXcgbW91bnQuIFRoaXMgDQo+PiBp
cyB3aHkgd2Uga2VlcCB0aGUgbWF5YmUtTlVMTCBkZXZfbmFtZSBoZXJlLiBJIHBlcnNvbmFsbHkg
dGhpbmsgdGhpcyBpcyANCj4+IHRoZSBiZXN0IGFwcHJvYWNoIHdpdGhvdXQgY2hhbmdpbmcgdG9t
b3lvIGJlaGF2aW9yLg0KPiANCj4gV2VsbCwgbmFtZXNwYWNlLmMgZG9lcyBrZXJuX3BhdGgoKSBm
b3IgbmV3IG1vdW50LCBidXQgaXQgaGFwcGVucyBhIGJpdCBsYXRlciBhZnRlcg0KPiBzZWN1cml0
eV9tb3VudF9uZXcoKSB3YXMgY2FsbGVkLg0KPiANCj4gIGRvX25ld19tb3VudF9mYygpID0+IGZj
X21vdW50KCkgPT4gdmZzX2dldF90cmVlKCkgPT4gZmMtPm9wcy0+Z2V0X3RyZWUoKSA9PSBlLmcu
IGV4dDRfZ2V0X3RyZWUoKQ0KPiAgPT4gZ2V0X3RyZWVfYmRldigpID0+IGdldF90cmVlX2JkZXZf
ZmxhZ3MoKSA9PiBsb29rdXBfYmRldigpID0+IGtlcm5fcGF0aCgpDQo+IA0KPiBAQCAtMzgzNSw2
ICszODU1LDkgQEAgc3RhdGljIGludCBkb19uZXdfbW91bnQoY29uc3Qgc3RydWN0IHBhdGggKnBh
dGgsIGNvbnN0IGNoYXIgKmZzdHlwZSwNCj4gZXJyID0gcGFyc2VfbW9ub2xpdGhpY19tb3VudF9k
YXRhKGZjLCBkYXRhKTsNCj4gaWYgKCFlcnIgJiYgIW1vdW50X2NhcGFibGUoZmMpKQ0KPiBlcnIg
PSAtRVBFUk07DQo+ICsNCj4gKyBpZiAoIWVycikNCj4gKyBlcnIgPSBzZWN1cml0eV9tb3VudF9u
ZXcoZmMsIHBhdGgsIG1udF9mbGFncywgZmxhZ3MsIGRhdGEpOw0KPiBpZiAoIWVycikNCj4gZXJy
ID0gZG9fbmV3X21vdW50X2ZjKGZjLCBwYXRoLCBtbnRfZmxhZ3MpOw0KPiANCj4gDQo+IFNpbmNl
IG5vdCBhbGwgZmlsZXN5c3RlbXMgbmVlZCB0byByZXNvbHZlIGRldl9uYW1lIGFyZ3VtZW50LCBj
b252ZXJzaW9uIGZyb20gZGV2X25hbWUNCj4gdG8gInN0cnVjdCBwYXRoIiBpcyB1cCB0byBpbmRp
dmlkdWFsIGZpbGVzeXN0ZW0uIElmIHdlIGNhbiB1c2UgYSBmbGFnIGxpa2UgRlNfUkVRVUlSRVNf
REVWDQo+IHRoYXQgdGVsbHMgd2hldGhlciB0aGF0IGZpbGVzeXN0ZW0gd2lsbCByZXNvbHZlIGRl
dl9uYW1lIGFyZ3VtZW50LCBJIHRoaW5rIHdlIGNhbiByZXNvbHZlDQo+IHRoZSBkZXZfbmFtZSBh
cmd1bWVudCBiZWZvcmUgc2VjdXJpdHlfbW91bnRfbmV3KCkgaXMgY2FsbGVkIChhbmQgY2FuIGF2
b2lkIFRPQ1RPVSkuDQoNCkkgZ3Vlc3Mgd2UgY2FuIGFkZCBkZXZfcGF0aCB0byBmc19jb250ZXh0
Pw0KDQpUaGFua3MsDQpTb25nDQoNCg0K

