Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C86C8B02809
	for <lists+apparmor@lfdr.de>; Sat, 12 Jul 2025 01:59:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uaNe4-0003Cu-Eb; Fri, 11 Jul 2025 23:59:12 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <prvs=3287997975=songliubraving@meta.com>)
 id 1uaMtE-0007pP-AZ
 for apparmor@lists.ubuntu.com; Fri, 11 Jul 2025 23:10:48 +0000
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BN7f9S025943;
 Fri, 11 Jul 2025 16:10:06 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47uc0h80dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 16:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2ec1nf9wtXHBufjaFbND5F1pns/uF88sFeWNK4xDEcc4n+EdM6V59Jp5ieL6eFZbBDYNSZP2TP0C+Z1NQPH12163P1hQaJDdp5y4SULm3SY9bc9nDe2w8O7DhU80iMl1SfBKO5LvV73X9Gt/c+zwtN+k8vcgIUQ62TSeEPY2tBXDjoZUNR07zaiE8UgX4H97pmvXUQG/oko3XocvcNl4rfXUv0xL5djSLKZRmJ6ybKvvBFtUnTqxlA4UHNlpTiD67aq6I5xlX0ZlHoNh4z9VC1iILJR+/C98CMvM3/geDxoqtezgucoaei3ZjCAF16C8uGcJ25Y84mTWtWLa29Y2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpoNQssxvjhhURZk50uc12TS5oR1bH3lF+dqgiFD5aE=;
 b=Pjdzkrat7TnJvYcZbtZOz7EZwY/8Ba6krqdXBlSblB+kj5X0Kf4+uwcPSsJmfMGNzz737HpwbACuoQ6KAXNk6FlXmc/cuBUH/gyBIKndLqsgc+CUXmqRmE3h7mE2uzhxJewhqxR8b/ESjukjXJS2a5t3RLACdzeExPhP7Pc+y9i7DPIRvBP3i3h0fQnNoZ2DjR2n228MuiyncanTY3J0DoI6tQZCPVSAEPHtCorsLkcv76yAi3urN6gRt6TCj/WvY9KW3tdmGud62P1c7JG2CnuzZLCgAJjLuAcZx2bR34KOYSF8FGcLSVs8emnTbGCxFhmW7rDcU/cL2+zzOdw6/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from PH0PR15MB5117.namprd15.prod.outlook.com (2603:10b6:510:c4::8)
 by DS4PPF258AF7986.namprd15.prod.outlook.com (2603:10b6:f:fc00::98c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 11 Jul
 2025 23:09:54 +0000
Received: from PH0PR15MB5117.namprd15.prod.outlook.com
 ([fe80::90bf:29eb:b07e:94d9]) by PH0PR15MB5117.namprd15.prod.outlook.com
 ([fe80::90bf:29eb:b07e:94d9%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 23:09:54 +0000
From: Song Liu <songliubraving@meta.com>
To: Christian Brauner <brauner@kernel.org>
Thread-Topic: [RFC] vfs: security: Parse dev_name before calling
 security_sb_mount
Thread-Index: AQHb8FzEhXwik4wHVUiG4oVmXX3W0LQpln0AgABShACAAB3hAIABOQAAgABXkYCAARZZAIAA40EA
Date: Fri, 11 Jul 2025 23:09:54 +0000
Message-ID: <56339D6E-6435-4BC4-95AC-BC2404DFF2F4@meta.com>
References: <20250708230504.3994335-1-song@kernel.org>
 <20250709102410.GU1880847@ZenIV>
 <CAHC9VhSS1O+Cp7UJoJnWNbv-Towia72DitOPH0zmKCa4PBttkw@mail.gmail.com>
 <1959367A-15AB-4332-B1BC-7BBCCA646636@meta.com>
 <20250710-roden-hosen-ba7f215706bb@brauner>
 <5EB3EFBC-69BA-49CC-B416-D4A7398A2B47@meta.com>
 <20250711-pfirsich-worum-c408f9a14b13@brauner>
In-Reply-To: <20250711-pfirsich-worum-c408f9a14b13@brauner>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR15MB5117:EE_|DS4PPF258AF7986:EE_
x-ms-office365-filtering-correlation-id: fcd121d8-1cc4-4f95-8710-08ddc0d00c31
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ek9icVZCZTRhbXNiTUxqUXZ6UWZRanQwYnEveVFrbEdmNW9GSzJ4a0ZVekZW?=
 =?utf-8?B?NXRrbVJMbi9ORUZsM0ZtemZtVGo3L2ZhUjNWVStBQzhrSVJqZlhTUVhyQTZZ?=
 =?utf-8?B?M2xQdXE2TURyZmNaUnFLc0xLL2s4QVcvcVdTWEZkcWc0WldwRUpuVTRDN20v?=
 =?utf-8?B?Q1lwY2pQY0p4Rjk5a0ZFMXU2cmxDU2tWMEdmdmV2bTUwNVNqY2FNeWQ1ZDl1?=
 =?utf-8?B?dklCWVFyb2FqRDhmMzd2a3J1OWw4WXBndW5HUExTUytzL21VWUVKNWEzLzdN?=
 =?utf-8?B?MEN0V1hUS0hvTVVRalhmdmZZNi94SXVhdlFiR3hDTzQ4RmtOYW1zaTI0dTBX?=
 =?utf-8?B?YWdyZFc2cUhoUzhMeVJmWkZXb0U5Z1dsS3VBYjZyMDRXMDg4TlorSlpzTEQ2?=
 =?utf-8?B?ZERLbjVaZExKZjZsWlRLTXByWFdPdk9DZEU1ZU1GM1BjQS82Z0JIR2NEU0NK?=
 =?utf-8?B?OW1ucHFCV2tFdDFXc3F1cTRHWDFONExWZFJYQWQveXIvOXBqVGNwR1pnS0Y3?=
 =?utf-8?B?NEthNGRET1YwcjBDUWNnS01pUUVsc2RETDh6c2xnMFJzWmRKZDYza1Q3SkFj?=
 =?utf-8?B?eGtPRVBIWUJkcHdNQ2JaOTc1a2tJd2d2a3dOOHBkY3kreWVQZElaK3h6M2Ey?=
 =?utf-8?B?ZzJZcXZmL1JUUmpBQWcvcURzZE5VM3hweFdZcTI1WVV3UWhVMTRFdll0emU2?=
 =?utf-8?B?c1lqbFQydXVpaDJLTzJ0ZHFvRGtrT0ZxdzB3RGd2bHpOUDE0Ly9aSjNDZUdQ?=
 =?utf-8?B?SVBpT0lMVUVwK0RZandDNjNBR0pWa2k3d2F5WE1LZ1lxR3NqeTBBYzdjaExw?=
 =?utf-8?B?VDMreXExbythWkNXc2pnUXR6eHBkenV0RE50QVRpMzdnRjhQaHJFd3l5M3R0?=
 =?utf-8?B?NW9aNEdSeWVrcTlnMEpLRVJRbVF6cnFEMTVmUWFVQXlqaDFKdThmUGFxRC9u?=
 =?utf-8?B?NEJtRmowd0F5d2hQaTIveVJUK0tpR0ZqOFBmK1dsZHhiYnNJc2dsODU3UWMr?=
 =?utf-8?B?R2FlblJ5a3E5L0ZwZ0lOZi9HOHNiTHdOYjZHblk4bUlCNk9zdHYyMDJPNm9a?=
 =?utf-8?B?SVZBbFJZT2tCQVBDL2ZlVGloMHRtRTM5c1pQS3FYSGFVK0ptQ3BQWWZZWUdB?=
 =?utf-8?B?cTFydDk3TC9HQmFqOWwyTThPVkxrMHozeVV2cHdFYjl1M0hSSFJRSnFUSmZj?=
 =?utf-8?B?a29UaTFOTGI3NGpiM3dNdDBwcWo4MmgzTjRjdVFyRkZkT1BQMW1RMjhEMmUv?=
 =?utf-8?B?Ym95amp1V3N1a3hpd0lROGJtbmtsa0R6ZFZBbUx5QkxQclBhc1Qwb2x0UW9B?=
 =?utf-8?B?bWhvdXAvRjcwek92bXNuV215SGV1bUx2eWhHaXpjZURnKzhVZXlLKzBvcXo2?=
 =?utf-8?B?MExndGtUOVNXSXMwUXg1VVFzVktaek5wTzgxWkxzREZMK0NuMkwwNzBic0VF?=
 =?utf-8?B?Q0w3VWcxN0VVamRzaitYdkcxM25aSjk3MW12WGxYU20waC8ydlVoWUw0QU03?=
 =?utf-8?B?ZFJoYWxPaWs2M2Z0WFBJdm1pWWlYNG9XZU40eFNZajgwTHBabE9QNVUvSE4w?=
 =?utf-8?B?MXRwUWFrNTFmTTZLbXBUNUxqZ0w3QW9MajNYcDE5Y1k2MHQ2STJwSklnT2dG?=
 =?utf-8?B?Qjd4emp6WTVyQWNEdDlDNlRKQXNhbDl5Z1VkQXhUMHhFQm9obG84VWg1emtM?=
 =?utf-8?B?VjIwTDdhak1lNFlBNTlEblRLbzRDMEZ4bkJ4UkZFM0ZVcktGVlBQZS9jUjFh?=
 =?utf-8?B?K3JXTkRCK2R5NzRYRlJSS3BRUUZOS2ExMTlMdWpsNzRwdVNaUzI3d21sZFBM?=
 =?utf-8?B?NmhEblVvN3diMWFGZnRFQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR15MB5117.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUtJdngwUFcrQmRBaWdITFdrMEZNYXQra0hQQW1FN1VLSUVkR0c5eit3Y2RJ?=
 =?utf-8?B?aWhGZ3pUZnR4ZG9UenE5bHR5YkpzNmV1enZEVS81VTV3d3NUSUZLcTFPR29s?=
 =?utf-8?B?Y1lLM0cyOW1xRHNyZ3lvcXd3VFJNYmhNTlhvVURrNnlKSDNrMWlLRVRrT0dj?=
 =?utf-8?B?cVhmQXc1WEdpUFAyNElKT0YxaTRwdk9ZSGh0dzByMHJoVkFHaWdJaDR3OWtG?=
 =?utf-8?B?UU8zVUpWckJYajI0QXFTM250UFVKOXBrM2krSGtaZThDT0pMcnNuL2Z1eElq?=
 =?utf-8?B?dUZoRDkzc2s4eGhNVlJKRnZWc3I1a0RxUjlhekhSMC9zWFVNbUxSa2FBZkx2?=
 =?utf-8?B?MDNOSlRoNGtkYXFRRGRXaTBBaGY2ZXdpVWthMlVrVm5mS3FlQ0Y5Ry9PZWlt?=
 =?utf-8?B?RHdzdEZ0dzJnT2RkTTFqcnBhQjlLSzUvT2hKVjRYa3VHWS9haWRpU29RbUI1?=
 =?utf-8?B?MzBPSjlLaEN3cFlOZGFFbHMvY1BCTTl6WWJxOTlSTG53Z2wxd2xpZkdBbXdl?=
 =?utf-8?B?UVlqc3lhVWtnTkFiNHBGSUxXL0RTVkZzdlRhYWxVS0ZsTTA4UmRJR1QrZnd1?=
 =?utf-8?B?ZndSemZSV3QwN25Zc2JpTXhuM1BlVUEwckgzOGhpQkRDakZDRUFpOXRoa1c5?=
 =?utf-8?B?M2p6MlZqb1FyZlZZWDdsaFBJT0NUby9YeC9YNU1GQ1k0eUl1UUY0MGo3bHVi?=
 =?utf-8?B?SmpOZWRRcXhhK3BnNGZXd0pMbDcyckd1T0U3QmZlNWlkNzkwRGN5NTFyc1hC?=
 =?utf-8?B?VTFPZHBJSXpvVW1EVE5SMndVQncyR05HTlByR1V4OC9KOFJKYVR6MkNvYm9Q?=
 =?utf-8?B?YWRPSFRMUjFLZzF6bjZXYXJETTRobGRheSt6RGd3eWF2bGNObk5nekJhSUdE?=
 =?utf-8?B?WUN1aC9zYjRjRHRlWlgxNHRQL01JSi9WZ0xXem9GWDE3THFjSDUxMERkdzB6?=
 =?utf-8?B?VmJVTXROWmN1eGo0NUtOT2VnaHRFM2k3T0tDbkxRZ2pNckJvbVFyZ1ZiOUFj?=
 =?utf-8?B?WmloTEFEak1KYzhyaHJITXZrT1dyNlh4cE1lT3N4SHkrZ0gvSU02a2c2MlAx?=
 =?utf-8?B?Q2t0UExBM0QxR1h2MUI1VGdsWStNU3RvZ205TEw3dElJZ2oyQXluR3lLdm1h?=
 =?utf-8?B?K2ljSTM0TUFEUjB1MzdEVUtNM3JFdWljVDZYNlRXRDlwblN2VW1vUmtYMEhy?=
 =?utf-8?B?b3BPWndaUkNHK1hDcWhJakFhTVI0N2huVldxVE9STk5UdFUwRTgxRFI0cmJh?=
 =?utf-8?B?U21TZXlVcE1uSloweEVDWVZPWjBjZU03R2Uwb1FtckJCWTN1Unhic3BBc1J3?=
 =?utf-8?B?NU5iT0Zpd0o4d0dyQmZKclBmcTVIbW45VDRqNUdJQ3lFZTlFZzFtOWptb2lI?=
 =?utf-8?B?MGthcGk3ZDJEaStrek5odlo5MUpOL2ZCNjhaM2dVWlVOb0x1VWpwVHRnd1Ru?=
 =?utf-8?B?VEptUStPcStRZ29QaFJOdWgvbXhoYm8zSG5BVS9TNlFLTDA5NEdYc3h1bm92?=
 =?utf-8?B?QmFDZ0tpS2NWYS95MzRQVUdWYlZnUGZmamFReWk3Wi9GOVQ5L0dVT3pFTmxY?=
 =?utf-8?B?QVljbjdvZG94R3k3SWpxd3lvSEJJRVYwY3JnSjh3NVJwUlFqMkNjTGJyck9m?=
 =?utf-8?B?YmQ1RDRudnJrK205VU54Y1lXblF6Yi9mWmZDUE5tdXB4WEJTc3RKNHlTVWlK?=
 =?utf-8?B?WTByYVNBMjF5MFRTa0V4NDRYT3RSclRNWHFQMm10d25TcmtrN2FYZjdCRFI0?=
 =?utf-8?B?eFRpdHZ6dTRVTkY1cVVWZEk2S0lOL0hoUlpqVlliOHUxbklyWmdtcE43a25C?=
 =?utf-8?B?eFVnVXNjMU8zMDlJcW9oeGhzcWhDYkNRTllONmFJdTNPN3c1bEpvWEtTQS90?=
 =?utf-8?B?OHBTcDBrMDh0R1M1bU1tYm1KdlhpdVVnb1ZGaG1Mcm1GQTRRcVUzRUlTQ2NY?=
 =?utf-8?B?MGtUREMrVnRDbGpvUHR2bjZ5RHRWU0ZsR0cxQnZuMVlwRlF3L1VGTnNDL3Zi?=
 =?utf-8?B?OGFoOGtjVWRCZEpCZjRtZHpWeDE0ckJEQTFGUFhSRUY2R3hrMHdCbk9pRU5Y?=
 =?utf-8?B?NDN2OWl2bjdOaW5RNStWbGRVWVB0V0pmOWdPbDVxZ2kyRWxadFJ5bHY4OGhq?=
 =?utf-8?B?TzVwb2tuUEpPMUMzczZaRGFNa1IvM3NLMDBlU0xOdStOV0NUbEVQcE0xUzV1?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C863999C97D847419BE6E44D735D669A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR15MB5117.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd121d8-1cc4-4f95-8710-08ddc0d00c31
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 23:09:54.6275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RG5KtARaaaSYEWtWCZvfFmWn8arl68rspBKxFOYIjA91taWR0DMGwED/bPq9DX2MvMCgbbxA3JTa1fZTp/xf+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF258AF7986
X-Authority-Analysis: v=2.4 cv=Ut1jN/wB c=1 sm=1 tr=0 ts=687199ce cx=c_pps
 a=syx2/ttNfA1aKFKOgUl8fw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=BT7Q_h_XvOWWLYdnmqkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: mfgokKR3HNOfMtL0wqrqY5T0-B4KTBEO
X-Proofpoint-ORIG-GUID: mfgokKR3HNOfMtL0wqrqY5T0-B4KTBEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDE3NSBTYWx0ZWRfX3kasGX5q7B9X
 4R7t5rPF90sM4aXAZyJSf1IQ17w7vaaGDycQfZQF9Uq1FHlgW17uv+bbDw3yqmxFPWL2vI+hSol
 7BsPa+w7C2CArljQy7c9HBri6rNJTPEsRnoOMqymzetCZOL5gVvHr5y5HxW0XkZKicP8zmheSxy
 XcuxVfX0FMEGEq0hUdvQIyd2BR4WtIxnwZHrovUHR1bdAFqN6EIG+AQKop46uBLlPPCTGGsVDeZ
 ZXm9b2pB9eqV9QZX8/ewxdw0oJvygfjwVTr+ChbAqxfUX5f4Ps2ZlRql+JSYMTY1m8ggwL7MqIu
 aOz66pPBCnlNd0sd4CA5xxRMhuX67rJ+DBCj2cEejP7bcaReLsumg1Icmyy7oCLxuOXYcWQg0QZ
 eOkcEQuq6qM0CsZwIApqqE/7Lct3tYp1MnThfbNyOSLhFVe3ns2MYR/XWYF2Syo84dnoNe2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=3287997975=songliubraving@meta.com;
 helo=mx0b-00082601.pphosted.com
X-Mailman-Approved-At: Fri, 11 Jul 2025 23:59:10 +0000
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
 Paul Moore <paul@paul-moore.com>,
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

DQoNCj4gT24gSnVsIDExLCAyMDI1LCBhdCAyOjM24oCvQU0sIENocmlzdGlhbiBCcmF1bmVyIDxi
cmF1bmVyQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBKdWwgMTAsIDIwMjUgYXQg
MDU6MDA6MThQTSArMDAwMCwgU29uZyBMaXUgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIEp1bCAx
MCwgMjAyNSwgYXQgNDo0NuKAr0FNLCBDaHJpc3RpYW4gQnJhdW5lciA8YnJhdW5lckBrZXJuZWwu
b3JnPiB3cm90ZToNCj4+IA0KPj4gWy4uLl0NCj4+IA0KPj4+PiBSaWdodCBub3csIHdlIGhhdmUg
c2VjdXJpdHlfc2JfbW91bnQgYW5kIHNlY3VyaXR5X21vdmVfbW91bnQsIGZvciANCj4+Pj4gc3lz
Y2FsbCDigJxtb3VudOKAnSBhbmQg4oCcbW92ZV9tb3VudOKAnSByZXNwZWN0aXZlbHkuIFRoaXMg
aXMgY29uZnVzaW5nIA0KPj4+PiBiZWNhdXNlIHdlIGNhbiBhbHNvIGRvIG1vdmUgbW91bnQgd2l0
aCBzeXNjYWxsIOKAnG1vdW504oCdLiBIb3cgYWJvdXQgDQo+Pj4+IHdlIGNyZWF0ZSA1IGRpZmZl
cmVudCBzZWN1cml0eSBob29rczoNCj4+Pj4gDQo+Pj4+IHNlY3VyaXR5X2JpbmRfbW91bnQNCj4+
Pj4gc2VjdXJpdHlfbmV3X21vdW50DQo+Pj4+IHNlY3VyaXR5X3JlY29uZmlndXJlX21vdW50DQo+
Pj4+IHNlY3VyaXR5X3JlbW91bnQNCj4+Pj4gc2VjdXJpdHlfY2hhbmdlX3R5cGVfbW91bnQNCj4+
Pj4gDQo+Pj4+IGFuZCByZW1vdmUgc2VjdXJpdHlfc2JfbW91bnQuIEFmdGVyIHRoaXMsIHdlIHdp
bGwgaGF2ZSA2IGhvb2tzIGZvcg0KPj4+PiBlYWNoIHR5cGUgb2YgbW91bnQgKHRoZSA1IGFib3Zl
IHBsdXMgc2VjdXJpdHlfbW92ZV9tb3VudCkuDQo+Pj4gDQo+Pj4gSSd2ZSBtdWx0aXBsZSB0aW1l
cyBwb2ludGVkIG91dCB0aGF0IHRoZSBjdXJyZW50IG1vdW50IHNlY3VyaXR5IGhvb2tzDQo+Pj4g
YXJlbid0IHdvcmtpbmcgYW5kIGJhc2ljYWxseSBldmVyeXRoaW5nIGluIHRoZSBuZXcgbW91bnQg
YXBpIGlzDQo+Pj4gdW5zdXBlcnZpc2VkIGZyb20gYW4gTFNNIHBlcnNwZWN0aXZlLg0KPj4gDQo+
PiBUbyBtYWtlIHN1cmUgSSB1bmRlcnN0YW5kIHRoZSBjb21tZW50LiBCeSDigJxuZXcgbW91bnQg
YXBp4oCdLCBkbyB5b3UgbWVhbiANCj4+IHRoZSBjb2RlIHBhdGggdW5kZXIgZG9fbmV3X21vdW50
KCk/DQo+IA0KPiBmc29wZW4oKQ0KPiBmc2NvbmZpZygpDQo+IGZzbW91bnQoKQ0KPiBvcGVuX3Ry
ZWUoKQ0KPiBvcGVuX3RyZWVfYXR0cigpDQo+IG1vdmVfbW91bnQoKQ0KPiBzdGF0bW91bnQoKQ0K
PiBsaXN0bW91bnQoKQ0KPiANCj4gSSB0aGluayB0aGF0J3MgYWxsLg0KDQpSZWFkaW5nIHRoZSBj
b2RlLCBJIHRoaW5rIHdlIGFsc28gbmVlZCB0byBjb3ZlciBmc3BpY2suIA0KDQpUaGFua3MsDQpT
b25nDQoNCg0KDQo=

