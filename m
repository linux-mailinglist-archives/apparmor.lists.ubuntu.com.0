Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 56475B00982
	for <lists+apparmor@lfdr.de>; Thu, 10 Jul 2025 19:04:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uZugu-0002Jr-Gq; Thu, 10 Jul 2025 17:04:12 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <prvs=3286c55476=songliubraving@meta.com>)
 id 1uZue7-0001k9-10
 for apparmor@lists.ubuntu.com; Thu, 10 Jul 2025 17:01:19 +0000
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AGAgPG013648;
 Thu, 10 Jul 2025 10:00:21 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47t81cuxew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jul 2025 10:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATjkTqDhYzd5TMLTDlKytWRuUBnEvToccMempm92sJbMGm+K2Ldnax+kD4M2fZXkWskNYIwtsK7dSrvuKe0Svr9AB8AyK8tQpgitCx8oh1CT2t5NyyfkC/oEtPZP4weB499ydqafk/2fDMBRc+DPUQj4PFnhYO6sxoFgegKO5FwpZqtung2VwSG/ZxFnIt954QN+B7GsOWnCO4IZZzGCQcVDMEs0JKWhnqO8iwWkEu6sSI0W8pkiFZomqjwAmdX/KGtqdgzTZ72StraxQZP3egUfpjPpnnfCYSwkR8G2V7AAJdfOCrqegSeynAer9KtDXJkt7CO7iqO611NVxupR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyPxvJzwWmZs5uI9IUxS7byGo3gA/BU8Ozt692x0/74=;
 b=WPeMulxrLAK9OK6GFTSYE14js8An+KzE1QXIuGRl+fpjYJd8pvBfS/3wvABWRuRsf9O5AjLYWDUtdEjlSWS3XvWfaXUvm3eNYFQ/wvy1UKe6yZTTay4wOKg7e7Uq+U9xxlA0UTpXYwmA8Ubi6uPRi6+H1womdgNyc46I9HrcJ4fLOsRVJa8aCnVODNuk5BT9wC2vK3gOhdGwI224w3Xc/V4i18FIZmpH9RnWPJNqt58oOAYzBfXLafvEymRh4H3pql25e7Yx+8biEfBxyDXRvBgILYbDX42EASDK6y/eAlt1P3q6QGXBV112AwQlbyDHgFnpanl5yGNtlP8tWt5zDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SA1PR15MB5109.namprd15.prod.outlook.com (2603:10b6:806:1dc::10)
 by SJ4PPF27E1F3999.namprd15.prod.outlook.com
 (2603:10b6:a0f:fc02::88d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 10 Jul
 2025 17:00:18 +0000
Received: from SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::662b:d7bd:ab1b:2610]) by SA1PR15MB5109.namprd15.prod.outlook.com
 ([fe80::662b:d7bd:ab1b:2610%7]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 17:00:18 +0000
From: Song Liu <songliubraving@meta.com>
To: Christian Brauner <brauner@kernel.org>
Thread-Topic: [RFC] vfs: security: Parse dev_name before calling
 security_sb_mount
Thread-Index: AQHb8FzEhXwik4wHVUiG4oVmXX3W0LQpln0AgABShACAAB3hAIABOQAAgABXkYA=
Date: Thu, 10 Jul 2025 17:00:18 +0000
Message-ID: <5EB3EFBC-69BA-49CC-B416-D4A7398A2B47@meta.com>
References: <20250708230504.3994335-1-song@kernel.org>
 <20250709102410.GU1880847@ZenIV>
 <CAHC9VhSS1O+Cp7UJoJnWNbv-Towia72DitOPH0zmKCa4PBttkw@mail.gmail.com>
 <1959367A-15AB-4332-B1BC-7BBCCA646636@meta.com>
 <20250710-roden-hosen-ba7f215706bb@brauner>
In-Reply-To: <20250710-roden-hosen-ba7f215706bb@brauner>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5109:EE_|SJ4PPF27E1F3999:EE_
x-ms-office365-filtering-correlation-id: 42e85c9a-7b06-4874-7166-08ddbfd33f9d
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dVJ5OEs2UXRudXFycWxXR0NRSVlFL0ZDTkxTdHFRMlZoSEVBK2dNRDRUbDhV?=
 =?utf-8?B?d3dlQXR0LzhTdHcrcmtMa0E4ZWdwaHM1VjJJbjB2TEUvS0lOT0NQanIyeWp0?=
 =?utf-8?B?eUNNY1pxLzJrMTVOUnNhKzk5Z2MxUXorSTFkMTlGdEtKVlR0SFZvYVk3aEJw?=
 =?utf-8?B?bWo3bFNBYkNNKzBxUERIWVVaQ09NalFybG9yNjl4NVgzbXk0TWp2ZDA5d2U1?=
 =?utf-8?B?a09NaDFSN1YwTEI1dm9STUVUWGZyVFFCc1QrSXBRNVlaZm12a2l5dVRIZ3dY?=
 =?utf-8?B?RllDV1F3UWRUZkd3aXJVbG9RVTV4MFNoUFUvZ2RjMkpVb3o5N3oyNExzMHpF?=
 =?utf-8?B?VzNqcTlrVlJJNTNMdUpHNXB4OXdoR1laK2tYTkNURUNOemV3NWo0REZJdER0?=
 =?utf-8?B?KzBOdVlYNkhNbmxiNldEVkJ4eFh0TVExRTZtdzFjaHI2ak9xbTc2ZlBhZGk5?=
 =?utf-8?B?V1VxeE1ORW5oWnBXZXV4NGdDdktxaG9QS29nNTdiM1p3WmJLcVZVTXZ5dWFo?=
 =?utf-8?B?d1Y4M3ZSODdXeFppYjhBY1NMb3Vka0NRS3JjbTZmWURtcDhzeDZXSVRtaUpT?=
 =?utf-8?B?TG43MU8rWmZMR05XZGsvbTdjd1YxaEtwMkVRa3J0OEQyMVAxcElwRy9QZ1FQ?=
 =?utf-8?B?S29SU0R2WU0rUC9tNHIxUHNPSEZkREtkL0VKS3ZYdFQ2NzkvWkpzVGZ6YlE5?=
 =?utf-8?B?cnNKaW5EVFRLYy9EazBYcTFVLzJDQXVmTlJ4V0EzQmxDM3VhNG83OWVoTEI4?=
 =?utf-8?B?S25TZDlaSXk4aHYzdjBiVHcvOVRxa0tuNXBKc2FXa095UXJiMytUYXRkQkUr?=
 =?utf-8?B?amRxQldGdFR5NEdKamxyTDdyREtSWGx5MzVLZEUrSkxrazNSOUM3cW9ybm1T?=
 =?utf-8?B?eU5HZnR5Nk5JeWRESTRMV0cyVnhRcFN5ZWdVS1gxUitOUHd2VjVLS0o1OEZT?=
 =?utf-8?B?UFhHMFBjbmRwWEU2SkJXQ2p6UngveERoWGFDSm5PaUFNWVUxWXZ5dUFNTWo1?=
 =?utf-8?B?UFYycWd2MVVhZ2xlZkl0dy9vcGk5elBXYmpzMUxmSm13QTZUK0FIU0V1cWlB?=
 =?utf-8?B?ZklaMS9uNnJqSzBqUjlEL2dWSEN5NHI2RmI0WGtlaHVNTU9xUUQ2V0tPV0Qz?=
 =?utf-8?B?QXFreGlxSm9WampvbUNhRjBFM3djdnE3Z01YTmMvdE9IZ2M5RWdzNlI5TmVx?=
 =?utf-8?B?SUhpa2dFU0wrQ24rNCtlOHFRcEd2cTNnRER0N0xWbm41VzIwK3VnTXJQRDM1?=
 =?utf-8?B?SXNqeFpDVUxIaWtldGRBQVE5UXcrZFhTalM0Yk1YbEozOUcwWjhTVnFZRUxP?=
 =?utf-8?B?eTVDZ1grbE5zN1ZqeWdieTBTREZucVgzQWlTa1E3cVVJYnJwa2I3bFkwUWp6?=
 =?utf-8?B?d24rcGVjSzRnWUNJU0M2MmZEallKaEtWd2YvWEpDaFZVa3lSZlRqNU15aWtk?=
 =?utf-8?B?TVhCbmJ2ZE5jblBKK2tGbGtnMU9PV3dLZUhjUWRMZkV5ZXZZOXpieWRROEF1?=
 =?utf-8?B?NW5oSE5PQjFIdnNFTkVnemJxclhJdko5Nndrc2E4cldtWjExNjlUWXRJR1c1?=
 =?utf-8?B?cXlFWG1YckU3L0RRajNOdlFjRFpSWkFESzRyd2FxREI3NnBXM2VjZ2tQNGdI?=
 =?utf-8?B?cjdaVWNMOTh1R1VNcHY4UmE1WVduMHQ4UDNRTURmOVRQcTQ2U0tDVU9FV3Jh?=
 =?utf-8?B?M3ZxTDdkNWQ5WEZiVlpIOVQwVTVWZHJxQTI1SUpXNUZhQXB5R2RaWVpIRDA5?=
 =?utf-8?B?dkozTHRXdzgrcERPLzFSWDhZRDArS3BicURoSzlEYWZyVGdlVFhLdGxlYWE1?=
 =?utf-8?B?SU9MMWM0QUZRQy9qcGVoeHd1Zmh5WjI5NXZINmhIcEloZjdJai9qeXAvdVB3?=
 =?utf-8?B?N1ZQemhreGxsd25FWDBjbmlGZXlsYXpIYkx6UkJJSFFDK1h1YjgycXd3TjFQ?=
 =?utf-8?B?aURZcWtqd0FOQ3dmSUpXVXExRVQxU0YyNysrMFA0c2UrcGlhMS9mSjFUckxE?=
 =?utf-8?Q?r7KsedXCxufJamK2CDgwFnLL3uHtfc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5109.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3NBWEZjU245MEw0TURwQ1dLcmE0SkR1cUdka1NlWDVyMDRSUzc5RWhtSWdj?=
 =?utf-8?B?RUNmM3FMNW5OeHlVTWV6Vm82dTlnS2RyTGRubVZ3U2VPbitUdkVpSDdGMDBo?=
 =?utf-8?B?WnpKZzk3MVYvNW5XOVBqbzdvRzBLc2cyTEZRU1dzbENjTTBBaGN2bFZvd0lZ?=
 =?utf-8?B?WWF2bDhCNSt2RU1PelBHTTJYSi9ud25yamZ2STZqcFcyQWVKNFJma2I5TTM1?=
 =?utf-8?B?aDJDeFc5MzZHc2F6N0ZmVHcySjMxUVdseGZvQS9GeXZCT3A3NUFvQUlZQ2RW?=
 =?utf-8?B?RHcvU2tla2ZFdEV3dG9yOEpQb2VYQi83aFJzRy9QbkhWSWZNQ3psTFgrd2Yz?=
 =?utf-8?B?Zmt0ZzJKMHZzd0RzVzZmQVA0dEo1OXVpNHF3THZ6bDFaRTZ6SGdnZVBKTjd0?=
 =?utf-8?B?QmJIdkdETVF4b0hOVWpVMTB6T3pSUWs0aWNtZ2VITXNaTWl4ZGY2U2pOekh5?=
 =?utf-8?B?TGpYUUd3WG9raFV2cVNYaWtyeTBXaTVPQUtVSzViUGQxT25FUGR3MnNyY0Rs?=
 =?utf-8?B?SDRteUhjcHFiTUF5c3NKVU1jWlc0OU1FS3I1ejhuNDByMzdWT3Z4dWp6U2Uw?=
 =?utf-8?B?T2pvaHpFQkxBZGt4V1ppaFg2ZHJaYmY4VmUrVXI0bHdOdlpnUFpKODBPVWcr?=
 =?utf-8?B?YXYxM3A3bFRocXFpeWhIRUV2SDV5M0NKVkhDYVd2VitrTFJMOUhGQTRWS2dD?=
 =?utf-8?B?KzExOStCZlVTTmExMlRpbjNHck1Mb2ZsMzJmSWFMU0g4SVAvUzIrdWdpZHBZ?=
 =?utf-8?B?OWk5dUhYS040cGw0VENXaDdyVE9VdDBIR2I0WDAyZjVxcEZoL1hoM2JEcEMx?=
 =?utf-8?B?Nmo4N0hFa2NNaS9wK0RpWXovclNUNVY3YVpOR0FhTmYrSWgvOEZtaEdxZitp?=
 =?utf-8?B?V1RROGo1bzZZSmR1SU5XZUhqQUxCSUNEWVF1RXVlRVQ2alpDRHI3RExwM3BV?=
 =?utf-8?B?RkwvcTl2dzJqWVFRY0VXMEgrVlB5ZUxkOGxOMkppSUJpSWN5Y1JObFV1UjAv?=
 =?utf-8?B?Szhsa3FrY2Yya2pYUnU2MUg3c2crTkJFeHF1ZmVlVkdmY0dHSGFXcmY1RHRW?=
 =?utf-8?B?SmsvRFBTc1BuVVVlbExKTEVVVFZ1akdBUlAydWhlUnRxbVV0bEVsOUw0WUtl?=
 =?utf-8?B?NWxBNjd4Z0dzYkRiQ2M1ajRmem8rV2grQTRBR0FPMmxFSG9ablJuZys3VjNN?=
 =?utf-8?B?RU5GTnE2ampNTm51UzlWaFU0MVAvTmdqQmF6a1l6NE1WaVlIcHhOK3IwRFEr?=
 =?utf-8?B?RXd3SjZwSlB3TFhSVVIvRGhMZU1JQTE2TW5obmR3Y0NIVDZkamZLMnRoMStE?=
 =?utf-8?B?eEFzdlRxcmlKaE1YQXloNm1OVnVTTFJ6anVSNk43Tk96QXYwTHk4YUhLa0dP?=
 =?utf-8?B?THZHYnN4K1ZhV2o2V0RxVFN1TW93MnVlYnNoU2h2Q1U2ZXBvOFRRbk9teUJE?=
 =?utf-8?B?OXJwalFwdFduSFZBSklZNHhTbWJFejJzVk52UWI1eStaajJkOU5yK0UwcVF3?=
 =?utf-8?B?K3VxNGJnSVpYdW1IU2JIU3hVZGlKWXpHekI4OFAwSnphV2JwSW1lTWVzWEky?=
 =?utf-8?B?QUNPSE9lcXM1OHcwQ2pDMExFbnIzWkIrQWdxYkkzcE9nTWYzZkhQaTNtNDBT?=
 =?utf-8?B?WStqcWNlbUptL1dHSFlHTHpwdlFGMVNvRmprek9sUllIekptN3FuL2xOeWd6?=
 =?utf-8?B?azg0b1ppMFRzNS9CcEFSQ0xyVVBGU2t1VExFRklwNlk1Z3JrVFhFTWhEQzNx?=
 =?utf-8?B?U3FoNy9iWnVDdkRtUVR2ekFzcTRQakdyTG5JTWtsSjUwbVd3cllKZ05OVnl4?=
 =?utf-8?B?K1B1aXdMd2JvODJnbWljUzRmOVpUMktFRUtGb2VsRjFaQ1NBR0Z2Qmd6WHdZ?=
 =?utf-8?B?SFhhVHV2QmROelJEaXkzTytheGZsWTNDWWZEd2NrdjJsL2JZSjl2a2JVNFJr?=
 =?utf-8?B?Z2szSG5XTWxFd09JeXNta1U2ckVnKzNNdWk5U01vWlovbEV1QlRJc1FTOVkz?=
 =?utf-8?B?Ym9TSGVwd0dOZFJXcXJuMkJzMnFFM2ZHRWNnWE5yNG93OFRrcUM2d1gwM2dR?=
 =?utf-8?B?RVRmUnlYcUF6TDVZandhNG9sWmlwLzNqUHMybnMvUmVOUjE0dEVIVEtNdWcr?=
 =?utf-8?B?WTZTdUVGQzh1d2wyZklla2luK3NkWFZRNkhINmhiOEVzUmd2Rm9pdEFBclJn?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AEBC7FD55BE9F438217199BFEA4861B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5109.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e85c9a-7b06-4874-7166-08ddbfd33f9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 17:00:18.2204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNFB5eH0UR4x1AbJMXSOGFROsLgmYCQkAiSRPD44nuwhRqI0j26VnodtEIunoLI2vSH6JJgbWHibGLa2OyNu8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF27E1F3999
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0NCBTYWx0ZWRfXxjz0k1lN9zG4
 22ficO4Pe4oOIWPa2bORvPdAJ1G+78QMBHfUCMPQlXF1zLwLRZYtpdeF+X4OwTHd65ugdJSP3JT
 Y7iQYEDzN4UtBP4G1on0iPZC7JNKCPj5s+g37/wFaaYVheLD7/stPgxpKxwH04hiBVmU+8p31xc
 B7+ouUtovQnZDapt/GL26KfI1CyzKr7JpX2XosV6+9fEEoxoQMfqkyZX8qVJUSxH5L5+tYPNLM4
 yqmcgEcGpjNDKy2mHupLdvKYeMEJs4C3TTwiRCKeBjTzCQKaDiergDhDyML/fHS7b75YLK01NSz
 Gvom3N1ATVNDuVjfyo1jh3eRkzwXo7rP8pzDqf2pxZWa+cIvMdCZ7YGccnfBmOwSC73HyyZ+oe1
 xK6DmROJOAXNMNEUX5pg1nrnpB548Cc5JJdkdU8cvplhDhENmVmEfcRvE9JoA0Mc7LrtNA7h
X-Authority-Analysis: v=2.4 cv=ecA9f6EH c=1 sm=1 tr=0 ts=686ff1a5 cx=c_pps
 a=00uhA2iMQE1K7v6Psv3cpQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=qvA4R9KsLmd9GzwOU8UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: wGsFgHp5eHm-cFUPAHATtaNC9CKMSBhr
X-Proofpoint-ORIG-GUID: wGsFgHp5eHm-cFUPAHATtaNC9CKMSBhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=3286c55476=songliubraving@meta.com;
 helo=mx0a-00082601.pphosted.com
X-Mailman-Approved-At: Thu, 10 Jul 2025 17:04:11 +0000
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

DQoNCj4gT24gSnVsIDEwLCAyMDI1LCBhdCA0OjQ24oCvQU0sIENocmlzdGlhbiBCcmF1bmVyIDxi
cmF1bmVyQGtlcm5lbC5vcmc+IHdyb3RlOg0KDQpbLi4uXQ0KDQo+PiBSaWdodCBub3csIHdlIGhh
dmUgc2VjdXJpdHlfc2JfbW91bnQgYW5kIHNlY3VyaXR5X21vdmVfbW91bnQsIGZvciANCj4+IHN5
c2NhbGwg4oCcbW91bnTigJ0gYW5kIOKAnG1vdmVfbW91bnTigJ0gcmVzcGVjdGl2ZWx5LiBUaGlz
IGlzIGNvbmZ1c2luZyANCj4+IGJlY2F1c2Ugd2UgY2FuIGFsc28gZG8gbW92ZSBtb3VudCB3aXRo
IHN5c2NhbGwg4oCcbW91bnTigJ0uIEhvdyBhYm91dCANCj4+IHdlIGNyZWF0ZSA1IGRpZmZlcmVu
dCBzZWN1cml0eSBob29rczoNCj4+IA0KPj4gc2VjdXJpdHlfYmluZF9tb3VudA0KPj4gc2VjdXJp
dHlfbmV3X21vdW50DQo+PiBzZWN1cml0eV9yZWNvbmZpZ3VyZV9tb3VudA0KPj4gc2VjdXJpdHlf
cmVtb3VudA0KPj4gc2VjdXJpdHlfY2hhbmdlX3R5cGVfbW91bnQNCj4+IA0KPj4gYW5kIHJlbW92
ZSBzZWN1cml0eV9zYl9tb3VudC4gQWZ0ZXIgdGhpcywgd2Ugd2lsbCBoYXZlIDYgaG9va3MgZm9y
DQo+PiBlYWNoIHR5cGUgb2YgbW91bnQgKHRoZSA1IGFib3ZlIHBsdXMgc2VjdXJpdHlfbW92ZV9t
b3VudCkuDQo+IA0KPiBJJ3ZlIG11bHRpcGxlIHRpbWVzIHBvaW50ZWQgb3V0IHRoYXQgdGhlIGN1
cnJlbnQgbW91bnQgc2VjdXJpdHkgaG9va3MNCj4gYXJlbid0IHdvcmtpbmcgYW5kIGJhc2ljYWxs
eSBldmVyeXRoaW5nIGluIHRoZSBuZXcgbW91bnQgYXBpIGlzDQo+IHVuc3VwZXJ2aXNlZCBmcm9t
IGFuIExTTSBwZXJzcGVjdGl2ZS4NCg0KVG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCB0aGUgY29t
bWVudC4gQnkg4oCcbmV3IG1vdW50IGFwaeKAnSwgZG8geW91IG1lYW4gDQp0aGUgY29kZSBwYXRo
IHVuZGVyIGRvX25ld19tb3VudCgpPyANCg0KPiBNeSByZWNvbW1lbmRhdGlvbiBpcyBtYWtlIGEg
bGlzdCBvZiBhbGwgdGhlIGN1cnJlbnRseSBzdXBwb3J0ZWQNCj4gc2VjdXJpdHlfKigpIGhvb2tz
IGluIHRoZSBtb3VudCBjb2RlIChJIGNlcnRhaW5seSBkb24ndCBoYXZlIHRoZW0gaW4gbXkNCj4g
aGVhZCkuIEZpZ3VyZSBvdXQgd2hhdCBlYWNoIG9mIHRoZW0gYWxsb3cgdG8gbWVkaWF0ZSBlZmZl
Y3RpdmVseSBhbmQgaG93DQo+IHRoZSBjYWxsY2hhaW5zIGFyZSByZWxhdGVkLg0KPiANCj4gVGhl
biBtYWtlIGEgcHJvcG9zYWwgaG93IHRvIHJlcGxhY2UgdGhlbSB3aXRoIHNvbWV0aGluZyB0aGF0
IGEpIGRvZXNuJ3QNCj4gY2F1c2UgcmVncmVzc2lvbnMgd2hpY2ggaXMgcHJvYmFibHkgc29tZXRo
aW5nIHRoYXQgdGhlIExTTXMgY2FyZSBhYm91dA0KPiBhbmQgYikgdGhhdCBjb3ZlcnMgdGhlIG5l
dyBtb3VudCBBUEkgc3VmZmljaWVudGx5IHRvIGJlIHByb3Blcmx5DQo+IG1lZGlhdGVkLg0KPiAN
Cj4gSSdsbCBoYXBwaWx5IHJldmlldyBwcm9wb3NhbHMuIEZ3aXcsIEknbSBwcmV0dHkgc3VyZSB0
aGF0IHRoaXMgaXMNCj4gc29tZXRoaW5nIHRoYXQgTWlja2FlbCBpcyBpbnRlcmVzdGVkIGluIGFz
IHdlbGwuDQoNClNvIHdlIHdpbGwgY29uc2lkZXIgYSBwcm9wZXIgcmVkZXNpZ24gb2YgTFNNIGhv
b2tzIGZvciBtb3VudCBzeXNjYWxscywgDQpidXQgd2UgZG8gbm90IHdhbnQgaW5jcmVtZW50YWwg
aW1wcm92ZW1lbnRzIGxpa2UgdGhpcyBvbmUuIERvIEkgZ2V0IA0KdGhlIGRpcmVjdGlvbiByaWdo
dD8NCg0KVGhhbmtzLA0KU29uZw0KDQo=

