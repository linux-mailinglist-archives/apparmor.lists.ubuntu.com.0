Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 29523A2CA86
	for <lists+apparmor@lfdr.de>; Fri,  7 Feb 2025 18:50:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tgSUk-0003cu-Kx; Fri, 07 Feb 2025 17:50:26 +0000
Received: from mx08-0015a003.pphosted.com ([185.183.30.227])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <Ian.Merin@entrust.com>)
 id 1tgSUi-0003c6-K7
 for apparmor@lists.ubuntu.com; Fri, 07 Feb 2025 17:50:24 +0000
Received: from pps.filterd (m0242863.ppops.net [127.0.0.1])
 by mx08-0015a003.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5179VTG5009311
 for <apparmor@lists.ubuntu.com>; Fri, 7 Feb 2025 11:50:23 -0600
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
 by mx08-0015a003.pphosted.com (PPS) with ESMTPS id 44nfmb1j5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <apparmor@lists.ubuntu.com>; Fri, 07 Feb 2025 11:50:23 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULovBEC4x8Eh+LPtx5juyMxtK82s7CXTOlbZ1Tz8HOzTHNZNsdwgVXHfiNPaiPbdsPNTY9ZKJdo/h/ORxfr9gCAO0pqm5NKbhyPZBO1nZxUi/7yMjViyYpMvRMMsr9KYlYLBWPkf2Gsnjji1v/xqwAUmx91i5O9YsegYhFEnPOuUX062UkPG5/aHNeq5NlX5FpJv7OCeEjVv6Zk7fEteCV52mx3Mbv8QhoqxAAgYZRLnTFv/0mu6hk12fmRzZbeBnSrNoUi1ERxRPP8jcJLE5g+nauODzpWJkeqNW5h7cbOzs7kbt3zwFMoenokBVyCZsUi8eAZTw2C9liR1zHyqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXdh7vz23iJyELCoLYXt48/wmc9XXWXbFgVEUiX+OmY=;
 b=yIuC5aWFfOWh2GHjnXTzmCkt+vacVBM1VMLMeeCEAXfqciO835By7DGOI6Hg+Hx+XYGewTibN3Bj1FZYW9VrduSa/wqjUx4J21mjQ3+pui/PnOJt242TPJ4e3B82KZGoHivb0zOQdq9ByU/3tzN0Ynd3QbATY70iejCM1vtGA1hzqNp7emWx9yA9IuZD+bzJrGufSck6wop/NyC9kALHgxrJ8pB66CNopQIRNqqPezhCVwi/IHn27OCWJi4NCY2OieakduZb3LUbOVslpLSS6QnnsGtpXJxpF1c142W3FpGdHQjvajOT/VRYNtqkHdyMlVijBE8FB9nWnQGMIigOEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=entrust.com; dmarc=pass action=none header.from=entrust.com;
 dkim=pass header.d=entrust.com; arc=none
Received: from BN7PR11MB2788.namprd11.prod.outlook.com (2603:10b6:406:b2::30)
 by CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 17:50:19 +0000
Received: from BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834]) by BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834%6]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 17:50:18 +0000
From: Ian Merin <Ian.Merin@entrust.com>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: policy variables not working as intended
Thread-Index: Adt5h9YWidhbKKmaRoWnB+eNXVVbKg==
Date: Fri, 7 Feb 2025 17:50:18 +0000
Message-ID: <BN7PR11MB278887F249FC486A72D9D665FFF12@BN7PR11MB2788.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2788:EE_|CH3PR11MB8342:EE_
x-ms-office365-filtering-correlation-id: 57511ebd-e204-4858-a9f2-08dd479fe2d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?sFmpuPdbG8MgoOd8ChP7JJ7BOafS96sBwv0XGhc1w44KJ0vf+XNLTXF4YRHi?=
 =?us-ascii?Q?QwYHsnwJ32yXX6MZjYfSCXFNu8+I0LlD/8PjoUVK6DZJdd4jXrgx9Gdw26PY?=
 =?us-ascii?Q?9/oliZ+EgzF7a30DCDsy4bd9Ily4mZ3Crh39Cy+BaXDQPBpmpr6sbZqcC94C?=
 =?us-ascii?Q?yskn+wM8IZXb6EiF1q90PBCqdVl1Gxq90KNvVS9JD30LPaL2p2wxXBjQCa2g?=
 =?us-ascii?Q?10eoh9FdWCl2Bjv5rytyi6lfi5/c/Acvi3ZqyzuwjvYWweSH/SRQxO/2ofa6?=
 =?us-ascii?Q?dnbeywl4Vv5V/lwRAh+lOkttNyJmrTqvxx5jtheR54f49fEq5kW9znSEWRK7?=
 =?us-ascii?Q?9quxFpA1zmjnc7pTJKEaUr64O68Ulcwa5C3zcgxRdsowHZJdjftp4UVMM6iT?=
 =?us-ascii?Q?D7giD4z1eL6RPvCAszgHvhRcC7NZ1ng5Vp0D9cQHn0Ob3sxhAUAB9gQmDP/N?=
 =?us-ascii?Q?kbuSSqaADEnBnlH8ZdkkzRsM7LDzZLxIZmzSRAkFPQXP4gB3dYTHp5wg52cy?=
 =?us-ascii?Q?LbBifr0bTKotqvguCsuf5TFg/8bOf2TLjHpUFO1E13Ny7M/IkXvsfqn07+ql?=
 =?us-ascii?Q?ysIidHwAKmF8QtILdMbntqhkibaWPcVDrPDLuLuG+DN13NoBMg4OyoRoOG3g?=
 =?us-ascii?Q?ZkIgNoMsnMjOKGyGRUQ8hJWBKyi4HLgfWJGJmVthdpB1IpS697sKdRb5AoHc?=
 =?us-ascii?Q?1ATW3obIvL7Bz4781gGYlUI2HJLDJObzWRHSG4pIP1rD10nIGwMBW6wEAJ03?=
 =?us-ascii?Q?IO2UvvRiU35eLSZhG78MV5gfNgjKaHSZp+7+xx4N7xFVhG0filZuP6hzncax?=
 =?us-ascii?Q?fWLjpDL3hgpv7+ruMSBbD+/lv+9O3LhXXvDhIuNDJ8PmRcM9nQkM8D0YpRL8?=
 =?us-ascii?Q?H5bEtzPNqaDxfz/YijpWyYEF0M76HpBCTXzQs4Ak6zxx/qiT2XaGAuevEQjD?=
 =?us-ascii?Q?qHslvON49y0y5VjmbSGS/MEoj8p67nF9J3MJVTXHbxTZ4QHchNOPrS6wA+Qf?=
 =?us-ascii?Q?Hv1E77lAeLzQslPaz6o8r/8lN6nVgQ461UJGFCYCnlZkanrXUeeG6iVHIJdu?=
 =?us-ascii?Q?8e2GQ66HnTkO7L37/sREhCQNIHAVf2pvgRdYchaT1/SAyqz9y+ka4Ggl214n?=
 =?us-ascii?Q?KAQpXwdt/LsZS7vEJ6WGJzoYYO0gtQ5SXoXRU/wQkfwp8bdmzYRWVNIsIuay?=
 =?us-ascii?Q?CBHGoIaeYkbMHJpuhQymMCHk62lU/9VWymYxAZBspfwVDT7MOOJTMh9GLK4y?=
 =?us-ascii?Q?eKRiqtzDZOXnz4xopAHU64eCminyRVG44Ws2wQDST8PSMecpnHX1hau+lzud?=
 =?us-ascii?Q?tWIVQR/Sz3sXh315aPnGPXlFN+A9/z1nEvlHYPTybq3Y1qEtiTz4sJBHJI3+?=
 =?us-ascii?Q?xeqQ/6vB0DuoFVrV5uAQ+wbpPyVcz9jM05Lpl9Edd9s8ckwqzk/uOL1d1O1J?=
 =?us-ascii?Q?Bwwwti15vCSqe4ICgF2uwQoHyHaZGlYe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2788.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7AG7epjIPprJlZ29QesAcRG+tBjMW48ieVP6J0Xhguzwrzg6nCxSxCLV0y8Z?=
 =?us-ascii?Q?oBO56d6XH+Dchfs967qMqb+OErlBHTwTxNzbiK8awMVeitzACECDwk2Nqp8E?=
 =?us-ascii?Q?DkFnC++jXjTefG1QUzn8t4qu83BkYrtFMWCLE0I6dgVIvppXvoYbxWdSK05Y?=
 =?us-ascii?Q?rhXSl0t1+s+fsw4ByFzK4HOKltTaba5jln6e6YlqDzpoqbJ5FJYh99xZOqFc?=
 =?us-ascii?Q?6X+iIRaextl5WxV8NYARZLSHwjlO1t/6W8qeCcv7c8/rK8+af6Eyus2O8lTd?=
 =?us-ascii?Q?sgtR9KxQgon5+h6GtRP1vdILHE88BwHEkEQFYtj1pHZFoWeZd+BvJcKHnLoU?=
 =?us-ascii?Q?nlRJpARlrdufVXYIfRHCIdFE1bVjCIuDdshtLe3bZhkUQ6/hxVsPhsvRZgTP?=
 =?us-ascii?Q?yCrgBe7ohdGaY2/uYNTPKCNPheXWQIS62gGPJqu1IPq13ErHFq+A/cw1oTHq?=
 =?us-ascii?Q?LpTmMmcwvrUGufYD1eifuJ7BJQsh4rrDgICb8n+5Q41eRxiVv7Ka1npA5Jk/?=
 =?us-ascii?Q?Vz0OczxLrZ1jGbuU8DYYJmVg1FDW4n6HHJ5bqIWKGP3MkeOOm0HydgocTsNn?=
 =?us-ascii?Q?D9wBC4BKu0fUwbOYFA1XpS7s9rAO2rcx4v+/2AY7AdGessnJ3gafAyIb2SUJ?=
 =?us-ascii?Q?IX3BhTAeESFcnOOYIzrEEBWyfUDe5z5t5zXJT6Zt+ppVdnnMbG8STin0D4HX?=
 =?us-ascii?Q?Sav667TeSiIWEdykEoE3PsBF6tkbcICPZ+xWyN0QIuiSSxJLj+clC5NbihDe?=
 =?us-ascii?Q?AnwciFMuCW41OZrWgdDLLBna4NWLzlSOFWaI/mwx6W56kKOyjGj5rPVAglhg?=
 =?us-ascii?Q?bPb2/pge4cYPxEl0mhlL3jdB2Hj3MehBjcy5in7an4BKkp3p8Tsb0RYr13de?=
 =?us-ascii?Q?hocDhtto9MnxOrLkFHt6NIVIdY5BugrfphStS09e6cKIjpJkIw4RF+GET/2D?=
 =?us-ascii?Q?PDU1S9cKc3rBkf9yX1ZYe33JFbb2OrQ+pmP3W0n9Nf758GlFq3xHZb2LwPdl?=
 =?us-ascii?Q?3TtIQFHQ8QdJV33858HfgmXDAqoamT7rLrm0lsGvveHUAFZdHQ1ZkAxGjVwz?=
 =?us-ascii?Q?oQ1YQer7e5MTfnF6lOmCJGXiKEls6jXgYsnCReIgmRQV2dN30SgdnT5UBdGl?=
 =?us-ascii?Q?CaFVD+V1RfiooKiCbNlx5p3RJcQgSfJddShAVMxxsAgu1LM/r8ddO0zySHK/?=
 =?us-ascii?Q?qpr0U8oGCpPPpj/HC6EeaNPmstkkS/gpyTA45eto/THPgmdvPJccvomkGsed?=
 =?us-ascii?Q?RdYwsf8874X6OM4tNY0TXebTWwcddFAP4UMeIyYZTu7C03h4J7mnmGsOoFO6?=
 =?us-ascii?Q?bJ69fqJorkjx9gXKvuiWMs7H/IrhUAKv6fuOrNWKrQuX78CJtB/TzDqLC4A3?=
 =?us-ascii?Q?zsZtqCrTA/763biK6tVz8wdVhYC5PvDRRcL7vkQ2Lp7Y4r4WfzJQ3AaIQcBa?=
 =?us-ascii?Q?N3iH+z5omZ4DHL0SQXGhMS6xA3FE0UJ6M7EuDhPZj5Bjl1xrmrFbp+ZJZgzx?=
 =?us-ascii?Q?an+U0kE8TrPDjLW9Y8lx4ipcIZyKYEOzIU12OTxlttQhbW9jlI52R4ESeEV1?=
 =?us-ascii?Q?oBqBKLrK3HlXreMyZQrXdXJZauwHQjFQS5R+lWh6?=
Content-Type: multipart/alternative;
 boundary="_000_BN7PR11MB278887F249FC486A72D9D665FFF12BN7PR11MB2788namp_"
MIME-Version: 1.0
X-OriginatorOrg: entrust.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2788.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57511ebd-e204-4858-a9f2-08dd479fe2d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 17:50:18.7406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f46cf439-27ef-4acf-a800-15072bb7ddc1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLD8kI3xo2AnY2OnKPXYiVCeQ1P2J1PW4dLRC1JJujJfa1OCkaElZDtuS0q0Y5wt69WJjc1Bl38GlCUoQt1rvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
X-Proofpoint-ORIG-GUID: hkVAlJ_2Bw39wvuptdz9ItzVBk7P5fAL
X-Authority-Analysis: v=2.4 cv=PsBpbxM3 c=1 sm=1 tr=0 ts=67a647df cx=c_pps
 a=R19XVbJ/69TrMGWtO/A4Aw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10
 a=dVDJzTMCqzgA:10 a=FEbzDYiKvWYA:10
 a=CjJGcdtFEBA27-vICikA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=hVpezKoHOvm9QPeeN6IA:9 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10
 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10 a=lqcHg5cX4UMA:10
X-Proofpoint-GUID: hkVAlJ_2Bw39wvuptdz9ItzVBk7P5fAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=707 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502070133
Received-SPF: pass client-ip=185.183.30.227;
 envelope-from=Ian.Merin@entrust.com; helo=mx08-0015a003.pphosted.com
Subject: [apparmor] policy variables not working as intended
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

--_000_BN7PR11MB278887F249FC486A72D9D665FFF12BN7PR11MB2788namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've looked for documentation on variables to determine if I am using them =
incorrectly but I cannot find very much information about variables.

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


--_000_BN7PR11MB278887F249FC486A72D9D665FFF12BN7PR11MB2788namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
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
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I&#8217;ve looked for documentation on variables to =
determine if I am using them incorrectly but I cannot find very much inform=
ation about variables.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have created a variable @{lib}=3D/{,usr/}lib{,64}/=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And created a rule as such<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:/@%7blib%7d/**.so*">/@{lib}/**.so*=
</a> mr,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This rule appears to do nothing.&nbsp; If I substitu=
te the value of @{lib} into the rule:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">/{,usr/}lib{,64}/**.so* mr,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It works exactly as I expect it to.&nbsp; I have tri=
ed every possible combination of slashes for the variable with no luck.&nbs=
p; As far as I can tell, on &nbsp;apparmor and libapparmor v 3.1.2<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Ian <o:p></o:p></p>
</div>
<i>Any email and files/attachments transmitted with it are intended solely =
for the use of the individual or entity to whom they are addressed. If this=
 message has been sent to you in error, you must not copy, distribute or di=
sclose of the information it contains.
<u>Please notify Entrust immediately and delete the message from your syste=
m.</u></i><br>
<br>
</body>
</html>

--_000_BN7PR11MB278887F249FC486A72D9D665FFF12BN7PR11MB2788namp_--

