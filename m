Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB62CA460A
	for <lists+apparmor@lfdr.de>; Thu, 04 Dec 2025 16:59:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vRBjD-0001Ve-CR; Thu, 04 Dec 2025 15:58:47 +0000
Received: from mail-francecentralazolkn19013074.outbound.protection.outlook.com
 ([52.103.46.74] helo=PA4PR04CU001.outbound.protection.outlook.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <bernd.edlinger@hotmail.de>)
 id 1vR8zU-0000po-68
 for apparmor@lists.ubuntu.com; Thu, 04 Dec 2025 13:03:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQwcAejHuY8Xa85/4KvTDv5gneYhlzp6wxWXcIX8g1oy3YkL84ieHejIKjb5bjWicSfJBP7bIb4AiMzcKF7UfcrJbI2U+0jOUJxXiqAe7Us1qQvX6GKn4wNn7/6UQR1U+oI14+LWgBpsvXv36nXirhRLn4VMjsYXoL+ZgnrjnRyaRrSoaiYAAlDfEsDjXGjj+JID7k079oFxW6uTv1HhtdyC5lmvqFmrChk+UuJrSv4GjRvpZERbyCSi6okkyQourJGvLmcf/NZGyfJqhdMcQeLA6zroYZROVejCKmMNX5dh3PRpc1el9hIn9UZ7h9LeOdeHUphnnqfYcmbEpJz8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfLQ8ERO31JC65yQjD9THg9jlyeHDYx4InrsaHOtEfo=;
 b=fPIcRHMHLU/oakofHymYo7obkSQoL47dcukx5ZFABfTGgMZxooGOvJNuT4f/bTxWdIN51ZA/DCxPW70RBPUi77X7LcipQjffanhdrvMTdAofCIWJ1/GcP2jMEDSZGSydeQa9J4W+An6IrYdwKulp2vro7OkUOgNVS3zAXMsuBkKnfNmeGrkNOICWwikn9PQxQk4Z31X7hCTEQjIjEHCdzGaOJ4a9SstsHpnAY1+/psBLZu9hxBlRwo5InjmMXHB4N29N5cTTwo/dajnJUU5OV5e3InJhb1cqhANzlWsOZZDecovLR7niZcjNU2/IZa2GYKwbwgAnKUq1OY6eZj78rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HOTMAIL.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfLQ8ERO31JC65yQjD9THg9jlyeHDYx4InrsaHOtEfo=;
 b=AfTXpEdsSzodZQOGz2YnXmbLZljdb466MPXH6oa+ZI+x2RWbD/r0tFOqsm/TV+uuJRUFSF/dPOjzlqmIMY42vme9prsY6WnL4rsU3Yw2Muh9/5rgXg7T/xbuN8lj8h3qJP6onuBKVtU6/s1Ya94WN2miBZIdAxUrYrY9UlQpx8H3aiy2JaI/VANxi6QJn7bFp5ActHTR/r1yYuzSWTWWtQC9N2FFgo61w9/QZjBXOMdlbeHJsd+MPp6kgqucj3jJmMd7S03k/TfQkHVMTcLtSjnKmLbpPUE8PNshphm42RGc6PPfT0a8SYrfCbcz1aMIxnUXpLag9GD3DNsrCMr4Pw==
Received: from GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:158:401::8d4) by DB5P195MB2377.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:488::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 13:03:21 +0000
Received: from GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM
 ([fe80::dde:411d:b5f2:49]) by GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM
 ([fe80::dde:411d:b5f2:49%8]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 13:03:20 +0000
Message-ID: <GV2PPF74270EBEE0AAAE2EB22B668EE21A7E4A6A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
Date: Thu, 4 Dec 2025 14:03:27 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Al Viro <viro@zeniv.linux.org.uk>
References: <GV2PPF74270EBEE9EF78827D73D3D7212F7E432A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEEE807D016A79FE7A2F463E4D6A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <87tsyozqdu.fsf@email.froward.int.ebiederm.org>
 <87wm3ky5n9.fsf@email.froward.int.ebiederm.org>
 <87h5uoxw06.fsf_-_@email.froward.int.ebiederm.org>
 <6dc556a0a93c18fffec71322bf97441c74b3134e.camel@huaweicloud.com>
 <87v7iqtcev.fsf_-_@email.froward.int.ebiederm.org>
 <dca0f01500f9d6705dccf3b3ef616468b1f53f57.camel@huaweicloud.com>
 <87ms42rq3t.fsf@email.froward.int.ebiederm.org>
 <GV2PPF74270EBEE90CDCD964F69E806EF58E4D9A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <20251204054915.GI1712166@ZenIV>
From: Bernd Edlinger <bernd.edlinger@hotmail.de>
In-Reply-To: <20251204054915.GI1712166@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0422.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::16) To GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:158:401::8d4)
X-Microsoft-Original-Message-ID: <cfe4ef32-dd26-4777-88dc-4f2f1b2fa6e8@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPF74270EBEE:EE_|DB5P195MB2377:EE_
X-MS-Office365-Filtering-Correlation-Id: cb352ac1-afa8-42b2-f63c-08de33357fb0
X-MS-Exchange-SLBlob-MailProps: dx7TrgQSB6cF2LXCYaYySNJkazjXzT0W6dI2EvZNId9LCZCpVWYpywxz0+YXNOfUkrsFpc0ZuSwIV7Z5JRtJSHc+80d/GHB40BPWqGNMRZMLRvfsqcGZZVKhRvOXwlT+hU2ku9waROpqbAFl+ug1RyctFHWMPkTDadNb9tLLU9B6bGJKUygYmut6GvLsBHjIIthjgeCf3GTl1nQVZ/ybX9qAgDUz8IEy7UPTrUG/A/Uoy09vCW+LCOyhp3h5EYxavBswvGPfhxs3ikIp925Z1UVg/FewWXEoqEucjhFxhPdQacvPDP0b7qqenbw+L3qxWfOTAycrjO4cLdkUoYDKCUyzgR9i3QABrDjBc8DuxiMX1yZkr5Wdl75waQFi5KGsnEssPmnMQgKhmhHwJ1AZIUlNNMOv+ZvLD3/60BTzqU3w4whoqcYehT9iXiy+DhuZYdXcI+sxSAmo6hrKh+ye6cR5KpkzYKGQPuHhHql1iefEHBf1Q5Ppm8RK6uTamPXjE17tbnOXKRMconPd8lwDHdlBwJ85rbKHovqjqrODPYhfVUNYAUEhMAQjogdJ9sLH9gEbqIuwN+0WEMwt40IypgMp7ppqPF3pNrqSZcOyXbEPtQMa/qiI9FRTmVNgTaJwwZRwBbfncf7HMtuqcZ1kTyYk5GQK+ztS+hLxaPC+oVhoEor3z6V9jdoZChG+DYBAHZWhT6AvTkmEP0otDXMNaAfiY6By2AF19pCnKeCRUdHPBuUlyUwZTmRKCSifgFHlowuXMSo1HtU=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6090799003|51005399006|461199028|8060799015|19110799012|23021999003|12121999013|5072599009|21061999006|10092599007|15080799012|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmlvL1FYeGxxaTg4SjdqVkpzbGNaa09jUCs1MWNkUkgxc3BuUlpCSjdRbytl?=
 =?utf-8?B?VXdUUXNBQ1RpcG5LTG4yZHFOTVQwOVZ3cU00bTdkRmdRc2ZXWDFkM0FTTlhq?=
 =?utf-8?B?OWM5TExSVWZqanBTQncyYi9IQUZobEhGOS9TNW1ndHBlVHVPdHFZTEFxME9q?=
 =?utf-8?B?aHFlcXRWM1NhejI5YWJyb00wSnNPeld3bHpuelFVSUpXTGN1YVRWYUxKWDZ4?=
 =?utf-8?B?dll2SElNV1p0QVlBeEw3c0hVeTRFY0szQmdEYnpxcFB1NmFxMEltbm5QQVNa?=
 =?utf-8?B?SGNDVFZXenVyT1BsK2huQml5K1lPTG9ZNGkzUktPOG0zWHdwREJaOCtPSDZB?=
 =?utf-8?B?UUdkVVovZTlwSElyOUNJU0dCMnNYR0VrcmtqNlp4eStyRVJ6OGkwNEc3UG1Y?=
 =?utf-8?B?Z2hvMTJJN0hjcmRNb0hOaTEwbHlocitWbGFXbCt5L3EwMlRLZG5xOVA2VGZ2?=
 =?utf-8?B?RzlrZHEwTDVMMTlIZlZaT3VrNHUyeG1WS1dGNFJNRG8yblI2Q1R2MWdJenJ5?=
 =?utf-8?B?aGZscjdKVDR1cTY4akhNL243bXpHM1ZYenpJbTdVOXdVaVZ2STd3Um9iVkdB?=
 =?utf-8?B?cy9xL3NOWG5pOCtzekJwNXBEcGozcFpDRVFRNE9od0NDK0gzbGhmUGpNY2J3?=
 =?utf-8?B?VGlGM0VKbTRFbUdLaHFMR0JBQWtKREcySHBpekhsUmRqcDBTNDZ6TmQwKzZy?=
 =?utf-8?B?cVZTakw4czFRSEpHWUFhRTRZSWVnRjliZE5FdWRuRGpqeEZkUCtIZDE2V05s?=
 =?utf-8?B?WGV2RWt1K3ljN2FIdkZRck5BL29FS2VjWTRYbTZkZzR3RDl1Z1p4VVZiYnYv?=
 =?utf-8?B?WUpzaHB6Zm0xL0gybmZqb0p6RkhCeE16QVRobEdRbE16eGNZUG5pMFJ3d0ZW?=
 =?utf-8?B?TEJoTnpnYy9rWHlPU0RxRFlEMVJjMm12ci8rbGdOR3BubFI5dEJFazdtcWZ5?=
 =?utf-8?B?OG51dnpkTDFyWnJSYlZ6V0kyWGlxRERNRGRYNDdwcE1kL003MGJUdklrVE1I?=
 =?utf-8?B?eGdMMUhYelNxa3VHdFZYWFkzazF1c3VkbXF1U2RGajlpYVlCV1EyWEZXb1FB?=
 =?utf-8?B?V205NDFSWHczSXM2WWVKUk56cHFkVjhTdVBERy9oVWRHQ0F5YTlMdCsxb3VK?=
 =?utf-8?B?bG1rNE5IWXRRWGdHaUg5Z1VJWmJ4dmtMSEg1UFp0WmNVVWdNRVYydEVsMnRm?=
 =?utf-8?B?UGt6dDA4NGxzUGJVSUhxd0FNVzMwbC8yMTFnb09RbTJYb0VWZGpsaDFYTHlI?=
 =?utf-8?B?dWxick14eS90bEtvdXBqc0pDUCs2RFdRbUJLd1A4MUh5V0RQTWl5M2lVWHc4?=
 =?utf-8?B?NWdGSDJTYmtlSmdsMnBqK0pKNGw1eDg0WFJTR0ZVZ3hJYWdRc0F3Qy94dGpU?=
 =?utf-8?B?ODBuMUtDUW1yeHdMUkJBeDNRd3dYVDAwcUtJQm41M1FqRlZPNE96SjlXTmlL?=
 =?utf-8?B?RGlqUkgwL3I5SSt0Mm5mWE81NWdJbDB2NllRa3dqdnR5QWV0NzcrSmkrWmFu?=
 =?utf-8?B?YXQ3SXo4L2ZDSzJoMDUvVk5mdW1vTTB1allhSmdiQWdpWHhTclI3aStwazB2?=
 =?utf-8?B?ei9ZRnJCVlJrV20rWXZJWnM3VDZPRVFXblR6enZSd3g0QkgwQ0QxaGZYSVVM?=
 =?utf-8?B?ZlpKcDF3eEx4UDBnQ3JRWi9TNUQxYkt2MUZtdzBtWnQ1WTJseXpTTGdLZk1i?=
 =?utf-8?B?TTVmcS9JUEl6cXo4U0JDVy9ZeDc2aVJsUGZQK0tBUXAzdXhaYVpJbFpnOTk4?=
 =?utf-8?Q?kJ/loB1bc/BHbV8Phg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWp4SWxKUWFIaTMycWlvVlFJZHV0dFBYUERZbkFBWC8rM05CcFZZL2hxVEsx?=
 =?utf-8?B?SkkvSW5LTmthcS9veTVXS0YzMnlIbnkvNzJjNHQ2OGlkcTV4elFQRmN6UUhz?=
 =?utf-8?B?eisxS1pMQjdTV2RIZFFkUjc0MExBS1A5bGs0K0VFa29mcFlxbDd4ZTE2N3dR?=
 =?utf-8?B?MEs3d1JYQ3FjVVVaVkxoRVR0RGI1U2k4Z3ZpWktHOGxkVTN0eEx0Y1FONi81?=
 =?utf-8?B?bHVaVCtwNEFTQkZ6aEZIWXpoYVBDRm1CZFZpMXVlRy83V0oyNTZsODdkbGJh?=
 =?utf-8?B?clZPME4zN1o1NzhoVTVqekJQTFRUNFNXVEh4bUExRWRjeUlwRXZYMW9nUmMw?=
 =?utf-8?B?MDM5V0hpNWp0SEdIc3lDeldXZnd3YXlnZWJmMDdWelhGdHlQMXl0OHhsRmxl?=
 =?utf-8?B?QXZuZTVNTHo3alI1VWdhVXUveHh0ajRjQXovNkhUc2lVci9nV1lzelZtaWZr?=
 =?utf-8?B?TXlJMmM2cFZUVjVBNWx0U2NxNjUvVXRSYW1jSkloN1Y4a21Ud0xiYW8xYnVR?=
 =?utf-8?B?ZlVJQjlxRys2NllpSlpEOFhrbzJsS0dyZ0hGbWVUVmJRRW9IR01uZ0RVRVdN?=
 =?utf-8?B?b3V6ajlTcnZmd1Z0dVZXaEpwUFhZOVdmMjdxYkhDcDkvS3ZQWUJTTC9GYzUz?=
 =?utf-8?B?Qjl3YWR5OGpZVERyait6QndIK3JMOFBibllkUzlWdmtwaEpzUm56WHI3RGJo?=
 =?utf-8?B?Z3FaTVRJL2tyMnMxVThKUVNsR2tGcnJENDdqSS9yTEtTdStkMnBRKytMSTJ0?=
 =?utf-8?B?eXo1VFNQQ09NNk5aWGhTYnNOU0JiQkkzU2dRdnNhTEY5Zi8vek1tSm1aUmtp?=
 =?utf-8?B?b0Q4ZG4waFNreHFUcitROGlzTUlRU0p2enJKYmtDYm5qbGtjeVRnSFFFRWNs?=
 =?utf-8?B?WUE2K1FqQXlOZCtCeXpsUUNnTGtBVFNLWkxyemFyQTlnN2ViS3doS3ZRSFhv?=
 =?utf-8?B?WVdibTltZ0dtVzFaMWJMU1Fkb0l4cUdpalNQdGRGbUxUcjBZK0ZSTWRnaTZz?=
 =?utf-8?B?TkJTSjNpVSswU2hQZkRVK1c5dFhrQUo5Q0xzNlIzdXloTGNUbWJYM3BzZENh?=
 =?utf-8?B?RmV0dGJXc0lrZVF3SlRzTmlobjI0dkxxbWZnWFhsUG1TVEZzaGZPbDlwTVp2?=
 =?utf-8?B?SVRwbTlzRTFldGxjaHYwdnV3aWRqc0Mxa3d3Rm5EWDVNODBhaGhVYmszYmpx?=
 =?utf-8?B?SkJ1akQ4cERFVWpjYWprTEV1OVg4a3RKckJQNGVtbHlReFo3U1paMWRnZTlo?=
 =?utf-8?B?QXZZS3M4N0hNTmNuZmFXN0tibGhTYXpCamJobHpFMSs0U1BlUDNPODdFWW1B?=
 =?utf-8?B?b0RXa2NkMzM5UkZiSVJ0Tk9aMEJYR1ZkZGxOU083RkxXcWY0T2ZTaGlUTW5l?=
 =?utf-8?B?cFhsSVR3b1ZBbElvaVQ2blJhNFh4eGVISU5NOUxIbUhDbmtFNm9oYXExREJJ?=
 =?utf-8?B?bVZhbURvbUNwcW1JbVpGTVE4MUF5QkhQL3NtQ1Zwc0dEd1RLMExXQzRhcnQ3?=
 =?utf-8?B?bjZLNTZmZ2FOV2hBRVRUZzB3c3Jwb0hjOVVHMzFXSHpMb2kxbGxvNUlRNENP?=
 =?utf-8?B?Yys4VFkza0dOUEYvOTBVU25UdXN1OTBUNjhTSHRmSGg5UndYcmNMK050SFYy?=
 =?utf-8?B?ZmNJcDdSRjhEbVh5RTZUK0lUZSt6SkxLVlJ3dDdmQnlueFZXUENpRm9xelRj?=
 =?utf-8?B?Wjh6Zm41SlE3Yng0L0taeHZqMnhkcE9GVEZFUzUwUGZtb3MvK1JsZE1RNnkv?=
 =?utf-8?Q?uBwkX0DCE7SuSOzYfd1xadnRIr3Cdj5xZ+lLp+B?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-87dd8.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cb352ac1-afa8-42b2-f63c-08de33357fb0
X-MS-Exchange-CrossTenant-AuthSource: GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 13:03:20.5836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P195MB2377
Received-SPF: pass client-ip=52.103.46.74;
 envelope-from=bernd.edlinger@hotmail.de;
 helo=PA4PR04CU001.outbound.protection.outlook.com
X-Mailman-Approved-At: Thu, 04 Dec 2025 15:58:45 +0000
Subject: Re: [apparmor] Are setuid shell scripts safe? (Implied by
 security_bprm_creds_for_exec)
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, Kees Cook <kees@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Alexei Starovoitov <ast@kernel.org>, zohar@linux.ibm.com,
 Oleg Nesterov <oleg@redhat.com>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, Yafang Shao <laoar.shao@gmail.com>,
 xu xin <xu.xin16@zte.com.cn>, linux-kselftest@vger.kernel.org,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 tiozhang <tiozhang@didiglobal.com>, Shuah Khan <shuah@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Elena Reshetova <elena.reshetova@intel.com>,
 "Paulo Alcantara \(SUSE\)" <pc@manguebit.com>,
 Paul Moore <paul@paul-moore.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Helge Deller <deller@gmx.de>, YueHaibing <yuehaibing@huawei.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 James Morris <jamorris@linux.microsoft.com>, Ingo Molnar <mingo@kernel.org>,
 Penglei Jiang <superman.xpt@gmail.com>, Hans Liljestrand <ishkamiel@gmail.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Serge Hallyn <serge@hallyn.com>,
 Randy Dunlap <rdunlap@infradead.org>, Stefan Roesch <shr@devkernel.io>,
 Frederic Weisbecker <frederic@kernel.org>, Chao Yu <chao@kernel.org>,
 apparmor <apparmor@lists.ubuntu.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Aleksa Sarai <cyphar@cyphar.com>,
 Roberto Sassu <roberto.sassu@huaweicloud.com>,
 Dave Chinner <dchinner@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Suren Baghdasaryan <surenb@google.com>, linux-integrity@vger.kernel.org,
 David Windsor <dwindsor@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>,
 Will Drewry <wad@chromium.org>, Adrian Ratiu <adrian.ratiu@collabora.com>,
 Adrian Reber <areber@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, Cyrill Gorcunov <gorcunov@gmail.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 12/4/25 06:49, Al Viro wrote:
> On Wed, Dec 03, 2025 at 02:16:29PM +0100, Bernd Edlinger wrote:
> 
>> Hmm, yes, that looks like an issue.
>>
>> I would have expected the security engine to look at bprm->filenanme
>> especially in the case, when bprm->interp != bprm->filename,
>> and check that it is not a sym-link with write-access for the
>> current user and of course also that the bprm->file is not a regular file
>> which is writable by the current user, if that is the case I would have expected
>> the secuity engine to enforce non-new-privs on a SUID executable somehow.
> 
> Check that _what_ is not a symlink?  And while we are at it, what do write
> permissions to any symlinks have to do with anything whatsoever?

When we execve a normal executable, we do open the binary file with deny_write_access
so this might allow the security engine to inspaect the binary, before it is used.
However this behavior has changed recently, now it has some exceptions, where even
this behavior is no longer guaranteed for binary executables, due to
commit 0357ef03c94ef835bd44a0658b8edb672a9dbf51, but why?  I have no idea...

But with shell scripts an attack is possible, where a sym-link is executed,
and the SUID bit of the target file is used but a race condition might allow
the attacker to replace the script that is used by the shell:

Consider this:

ln -s /usr/bin/legitimate-suid-sctipt.sh
where legitimate-suid-sctipt.sh starts with "#! /bin/bash -"

and the attack works this way:
./legitmate-suid-script.sh &
ln -f -s do-what-i-want.sh legitimate-suid-script.sh


Bernd.


