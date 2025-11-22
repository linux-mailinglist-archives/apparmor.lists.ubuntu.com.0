Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E49C7DE73
	for <lists+apparmor@lfdr.de>; Sun, 23 Nov 2025 09:48:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vN5lV-0004eF-IR; Sun, 23 Nov 2025 08:48:13 +0000
Received: from mail-westeuropeazolkn19013081.outbound.protection.outlook.com
 ([52.103.33.81] helo=AM0PR02CU008.outbound.protection.outlook.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <bernd.edlinger@hotmail.de>)
 id 1vMr7n-0002sD-MH
 for apparmor@lists.ubuntu.com; Sat, 22 Nov 2025 17:10:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1Q0QfGsxkbC5C7Na6dLYQ8+dKnycXKWlsoN3U5Hl9XlInMRX2WL91zy32ftyQ7ClaaK+4arR41Hkup7dBo3lTT/s+0qyyYpG1ddafFOcjVOlMzM10tdRHt6Sr1ty4r7ltRo29S0DexHFs4pA5aTzHKEfK9p6rL6wBC9wWgVdJd5FrOzAp/tUMWSpUER98ZmDs8+yQCAFjzSvXSWF6OmtAkorCRhc99xxNFBWl5r4gRn/Src5ri7ixGkLLTqfPXiunnCqehkmpaoSC0uIzhAKY4iU3gMROG4Xy2S47fzIIXh1Qm56SMRuN63+ZBwu46Wcrlz12lapp+KYmllc+WXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fh94mW012b4b4pM7k9F/n2kTOFskPj6U9WAq5+2R+pU=;
 b=L/FpZZ8BFnI3FOWJD9K2S6hPuMMbpSnJzsv71FRIGIDHwnY0fM6edk2++EPBfAgnKPj+ha0VqAuylEyM9rap/W5MxaQYEUjgDg6frBBn91tYUT5j173YO59PoFKs1c1t6EE8qEatmqvcOzUsx9lSGmW/vND8Ye6zdtiMw3JoUIRkUTIQZBJS8Zcq54bABsfBa6Lo4E2+uBv5k9FfUzXT2kk7GGyGjwgOc1oBaMQQusdyrTz0zeQ37jfA1VsmWBCVD9JGLKoCAGT4XnFi5dDgmjY8NmWdiz88SzlBYIa/VnwStvKcrlyDefGaSw/Pu355ARdcnKoSLS8rBpwaykvvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:158:401::8d4) by PRAP195MB1484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:292::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 17:10:13 +0000
Received: from GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM
 ([fe80::dde:411d:b5f2:49]) by GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM
 ([fe80::dde:411d:b5f2:49%8]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 17:10:13 +0000
Message-ID: <GV2PPF74270EBEE354926B365D9F3C60C22E4D2A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
Date: Sat, 22 Nov 2025 18:10:10 +0100
User-Agent: Mozilla Thunderbird
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <AM8PR10MB470801D01A0CF24BC32C25E7E40E9@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
 <AM8PR10MB470875B22B4C08BEAEC3F77FE4169@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
 <AS8P193MB1285DF698D7524EDE22ABFA1E4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB12851AC1F862B97FCE9B3F4FE4AAA@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285FF445694F149B70B21D0E46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285937F9831CECAF2A9EEE2E4752@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEEEDE0B9742310DE91E9A7E431A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEE9EF78827D73D3D7212F7E432A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEEE807D016A79FE7A2F463E4D6A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <87tsyozqdu.fsf@email.froward.int.ebiederm.org>
 <87wm3ky5n9.fsf@email.froward.int.ebiederm.org>
Content-Language: en-US
From: Bernd Edlinger <bernd.edlinger@hotmail.de>
In-Reply-To: <87wm3ky5n9.fsf@email.froward.int.ebiederm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0339.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::13) To GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:158:401::8d4)
X-Microsoft-Original-Message-ID: <d6f1ddb4-a044-4200-8710-198bb521e69a@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PPF74270EBEE:EE_|PRAP195MB1484:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0cab07-1e0e-4009-d723-08de29e9ffc3
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|51005399006|6090799003|5072599009|461199028|15080799012|23021999003|12121999013|8060799015|19110799012|440099028|3412199025|40105399003|12091999003|56899033;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVZvYk1tdzB6YXBjRFNZUTlMMHVtU1gxTGFCaEVKZlZvRC9RcVdzbDFRRTBa?=
 =?utf-8?B?U0J3QUo4V1B4ZTEzM3BIbjN0MS9HeTIwaEhnR3RnV1lBbWw2TzRKNkpLMmQ2?=
 =?utf-8?B?REZmSWppQkFhY1VCaVNsL1ZmN3UrNTRpemVNajJ2MFpROUVwYjJqVG9pcU5Q?=
 =?utf-8?B?dWJTSnZ5MzE3NldnMXlTb0QyRlRZbUsvK0lmZFZHcFpjbFZoRDV0a2d4b2Nj?=
 =?utf-8?B?cjVWbmF5SVdkc1pmbk9hdzF4eXR5dmdRSjVaQXE4c002OFRnWjRBaEQvMVgx?=
 =?utf-8?B?aEVKZGhGazFhNmZ4RktNcmhmdTJRNWZaNTQ4dU9qU0FaYjRKY1R0NDVrR2Fw?=
 =?utf-8?B?ZFVKdGpvdnlmR2xxR1FVNUtvWWVlcVJ1THdKRHZLSzFSV1kwSm5oVGs4a3dY?=
 =?utf-8?B?a1d0VUJZUWxMelBqeFUxbkIxaVhaWmJZb2J2ak9LMWRQdHdvUEd6bTF4eDZQ?=
 =?utf-8?B?Y2ZaUFZlNGRMaUxENG4vT3dvVWcycEZWdlpaeWltQSt2RGp1UkI0MmFaaGVt?=
 =?utf-8?B?cE1acTJYNjMxTGJSd0xaY0taWm1rQWlmNitMdzFjVk5NTThUbGxhUi9yUmdl?=
 =?utf-8?B?UW5wbzRKWXBCWFhqb2ZpRWJ5bmFNcHNoenI5d1B5NnhzRjNkcnpCbERWbkxL?=
 =?utf-8?B?WnpmM3Urd2FJM3dRd0dSU29OSFZZdk9VNVUxc2xtc0xDYmQ4ZzdNZXdrbk5E?=
 =?utf-8?B?czBnUlI5UG5mNGFMK0NiTHgzR2VmWW9lVjUwalMwSENseDVuSTNES2VaTEox?=
 =?utf-8?B?UURucHZEVFFPU0Zud3RXZG5LNGdNWVF1WkFWVkJlTWhmajhTNTdZSkxSQlJM?=
 =?utf-8?B?bUk5MmNRWlVVOXVzUnlqbjNKMG80MzJLQ3V0Ym9iRUg0YVRRRFF2enpHVUhR?=
 =?utf-8?B?b0VNbU8vYlM5WExyQzluTXlLRGQ0aGJTUjIzNmdZbnJVbVJDUjlLNllEeTRr?=
 =?utf-8?B?WnZQc09HREdTNFIrOGhEdWFSdHlETnJLWGR3VjlDNmttNFI3U01nQkhnejdM?=
 =?utf-8?B?dlBjYXV4OStpWVphMGJ4SW81N0xZaUk0OEZWR0ZiUjVDVWplcTBLVTNPL1Nm?=
 =?utf-8?B?ZTdHSUs2Z29RTjZPWWhaUVF5aDlPYXhhQk5oVzVWQmZvRjFpVE5hWGxhYlI0?=
 =?utf-8?B?NFl2Z1A0MjR6RmhsRUFHSzZ4bmNQNXhkRVVraTRYOWhLWStvNjlDdW02cHFB?=
 =?utf-8?B?V1NlTVE1VkttTGFaNG84MjVteUYweHU3cFB2ZEZMNU5yMmNobFZXc2h5aUMr?=
 =?utf-8?B?anRXRVZ4bmVwUlFhL0VQbmNVWlF5VXkxVFNiYWszVUlHRmp1Wmt3SHhoclpn?=
 =?utf-8?B?ejc0TDNVeGZpS2ZwNEtsTXNXVlZGSTlYdTBZVFIyZjhLYzNncjI4ZXNESnJv?=
 =?utf-8?B?a1FLaEErQlkzeU5zaGxpckU0dUdFTXczbnlITVUrNjhNOThXNDV3OWUxWU5U?=
 =?utf-8?B?OFpSVklHVGpyellGUkxqSEtWa1NZVVM5WEx5ZjJ2cGR1WDhqSnM5Zm1vWStF?=
 =?utf-8?B?OTNFcDl4bllVYUtRSGg1NEdMN0k4M2REclNQeG9RTHhVcWhZVTk0bFhpai9K?=
 =?utf-8?B?dkw2cnpQbUxWNHFQVktuZnJ6YXFVWUo2UnR4L0VyV2hGZzlMYmNrNi85RnJO?=
 =?utf-8?B?TlZiSUR0VkZhR3d3b3NuU3pnYkF2UmhXQWl5aTNyNlRCTWtsMU5DdEluMENU?=
 =?utf-8?B?dzE1TGNPYXhpYURvZXN2bGJSQU04RG5wMHRFR1pqYVJuR1JySVlzZnlRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anRiL1lsa2ZOdXB4WVowM3NkMklYNnJvbENhY1AxTzVVdk1wQ081S3FrK1gz?=
 =?utf-8?B?b2lXbnlJZzQwZ0VqZ291QnRLbmlmVW9zRExheEpEQXp5VVlhV1pJT2RlRmdH?=
 =?utf-8?B?UHVCdndmNTJUMFFZVmtLY2hyWnFPWTRsZFhJMHNRNHpYMnJHK1Q5d3JoT252?=
 =?utf-8?B?d1l6WUtKV1pUNStJRXNWNlVhRStBaVpsV1F2ZjNqUlA0WEY5a3pqUUswcVRS?=
 =?utf-8?B?SXM1RU9aTWgvMDBRQWs3TnB6QVlhRTRNNkFvYzJaWlFCOTVQTmozeEFXZ0pG?=
 =?utf-8?B?UzRzaEpKNlFRcEFzNTBqTWVNRWVSWXZkYzM0ZXdkbWFRTUNsMDROVE9mME00?=
 =?utf-8?B?bUNoWnlkWHIyckFYd2llSU9KZVNhSWRRQk1rNjBtTTFtMThQd0c2aWlCcnJS?=
 =?utf-8?B?WllFbGhuditkSVNETmh3RVpZZ05JNFpObUdDZFJ2Ni93OHRhT2lMSWU5KzdU?=
 =?utf-8?B?UEJ2eHlhYUk1K1RRdDV4L3BEbDBHRnVNWVliZ3RkL3ZNbzN4ZDlBYkhyY0RW?=
 =?utf-8?B?K1BZdVNkaFZ4bEFPZldNbGZxL1FCeGwvMmEwb3EzLzdKZ2JKWFo0YjBoOFFj?=
 =?utf-8?B?RG93RnJ1R3M2MzZqcHZsTXMxTXBUWjU3bFRYQW15ZzFDb3JRV0JWSUJ0SnJ0?=
 =?utf-8?B?ZllXMTlqQnFWQTNoa1FlWUxGMnNCTUpoR05mWlNMRzJwOFpyUDJ6K1NUd1cx?=
 =?utf-8?B?TmJWc083Vkt2M2wyUmZDK0lWVmo3dEpaMW1ZbURzK21SWTNYdFlRV08wMk1L?=
 =?utf-8?B?dXlSQUtwNU9yMzVtRE9zZ25UR0N1VmpoYU5ZZnRVUUxkclM1VG1aZ0RCMEgx?=
 =?utf-8?B?QzZVand4VmVLWVhmRll3MTNvYzViQndRNW1Gek5CQUpGdGorOEg5VFR0K1NL?=
 =?utf-8?B?VENHWW1RaFJEMmVqbDVMQUxGQzlHYzBPR29FT1lSYlNqbldIbmFFSFhNOUVX?=
 =?utf-8?B?ZUwvSFRka3R5T1JLZTJrTkpwcjZUdkRGL3dXUU5hdys1bkhkc05uZmJTUnhJ?=
 =?utf-8?B?K3AyeWhOQjY2UHVYRlExRm04QkZUaHpaNU12UFBUelE5ZjUrd2dLL2MrQ1RG?=
 =?utf-8?B?RTFaaC8rTnZMQitVYUlkUmRWSHBKNnJsWktFWjA5ZHBwOW01NGZ3SjR3WXhU?=
 =?utf-8?B?NnRSWUtsb3d3eUxVVXZSRDBDcXBaVmp3K3dvWHFHTXVKb0JDV21GSlpSb2tG?=
 =?utf-8?B?eDliSndRclQrMmU0dWRjY1o2OVhqa09SVnFXdG8xdGExY2ZnRCtLUmtaMTY3?=
 =?utf-8?B?U1B0aTIxQmRTN0xOeFFCTnNSYmhvWlN3Tng0eW1Wb2JqeEZndzBwY0cwWUw4?=
 =?utf-8?B?Zm5oUGVHZGc5WThQY2RGaHJZK0xpbm1lOFdQaGZXNVlieUNjVE9RMERIYTdp?=
 =?utf-8?B?N2VFcXF3YnJOa3VjRC9Pa0tzOCtmOFRQM0NNREpwamxqRnNkRTQ2MmZBeW5a?=
 =?utf-8?B?Y3BYOThobEtVYXhscG5Ja3plLzRSZzdtLzRUMnY4QUp4Mk4vZnNoUTN0Y3Qv?=
 =?utf-8?B?OE90TldmN1l2b0h1UFExeDU4bEs5Q1I0dXZOZFFBSnF6WUc5RTFUVHZVLzdY?=
 =?utf-8?B?c0tHNDZ3b0czT1pNMUViUDRob2hMVDZvd0NKUFZSVFYwaDI4OVI4R0h2ZkN6?=
 =?utf-8?B?Wk54WlR0bmdnVHdMd0lDL1ZzdmlrZlBtZjR2anJzQWczWjV1eWIySmRPV2NT?=
 =?utf-8?B?NlhoYTYzYzhHN3VNSGtjYzFaT0d2T0RnbUNkNWcrR3NjUWxSY0IxRlZqcE5X?=
 =?utf-8?Q?wCMBaYQO+gJGciPYFPG1rTFVHrFDvZQoT68y7EB?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-87dd8.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0cab07-1e0e-4009-d723-08de29e9ffc3
X-MS-Exchange-CrossTenant-AuthSource: GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 17:10:13.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP195MB1484
Received-SPF: pass client-ip=52.103.33.81;
 envelope-from=bernd.edlinger@hotmail.de;
 helo=AM0PR02CU008.outbound.protection.outlook.com
X-Mailman-Approved-At: Sun, 23 Nov 2025 08:48:11 +0000
Subject: Re: [apparmor] [PATCH v18] exec: Fix dead-lock in de_thread with
	ptrace_attach
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
 Alexei Starovoitov <ast@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 Yafang Shao <laoar.shao@gmail.com>, xu xin <xu.xin16@zte.com.cn>,
 linux-kselftest@vger.kernel.org,
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
 selinux@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>,
 Chao Yu <chao@kernel.org>, apparmor@lists.ubuntu.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Aleksa Sarai <cyphar@cyphar.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Dave Chinner <dchinner@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Suren Baghdasaryan <surenb@google.com>, David Windsor <dwindsor@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Mateusz Guzik <mjguzik@gmail.com>, Will Drewry <wad@chromium.org>,
 Adrian Ratiu <adrian.ratiu@collabora.com>, Adrian Reber <areber@redhat.com>,
 Jeff Layton <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, Cyrill Gorcunov <gorcunov@gmail.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-security-module@vger.kernel.org,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 11/20/25 18:29, Eric W. Biederman wrote:
> "Eric W. Biederman" <ebiederm@xmission.com> writes:
> 
>> Bernd Edlinger <bernd.edlinger@hotmail.de> writes:
>>
>>> This introduces signal->exec_bprm, which is used to
>>> fix the case when at least one of the sibling threads
>>> is traced, and therefore the trace process may dead-lock
>>> in ptrace_attach, but de_thread will need to wait for the
>>> tracer to continue execution.
>>
>> A small quibble it isn't a dead lock.  It isn't even really a live lock,
>> as it is possible to SIGKILL our way out.
>>

That is of course what I meant to say with that sentence.  In my language an
application process can "dead-lock" by waiting on a mutex forever.
Indeed the original problem with the dead-lock (I think in mm_access) was
worse, as both involved processes were only killable by "kill -9", but with the
remaining problem in ptrace_attach, the debugger can be killed by a simple CTRL-C.

So if I understand you right, you want me use a different term here like
"the trace process may be blocked in trace_attach" or so?
Or could you please give me a concrete suggestion how to rephrase the patch
description.

BTW, unless there are objections I would also want to rephrase the description
of cred_guard_mutex to replace the term "Deprecated" with "Not recommended",
like this:

--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -260,11 +260,11 @@ struct signal_struct {
        struct mutex cred_guard_mutex;  /* guard against foreign influences on
                                         * credential calculations
                                         * (notably. ptrace)
                                         * Held while execve runs, except when
                                         * a sibling thread is being traced.
-                                        * Deprecated do not use in new code.
+                                        * Not recommended to use in new code.
                                         * Use exec_update_lock instead.
                                         */


>> Thinking about this there is a really silly and simple way we can deal
>> with this situation for PTRACE_ATTACH.  We can send SIGSTOP and wait for
>> the thread to stop before doing anything with cred_guard_mutex.
>>
>> PTRACE_ATTACH already implies sending SIGSTOP so as long as we have
>> enough permissions to send SIGSTOP I don't see that being a problem.
>>
>> The worst case I can see is that we get a case where we stop the
>> process, the permission check fails under cred_guard_mutex and
>> and ptrace attach has fails and has to send SIGCONT to undo it's
>> premature SIGSTOP.  That might almost be visible, but it would still
>> be legitimate because we can still check that we have permission to
>> send SIGSTOP.
> 
> Bah no I am full of it.
> 
> The challenging behavior is in the semantics of the kernel operations.
> We need to describe it as such please.
> 
> It is the same class of problem as a single threaded process calls exec
> with a pipe attached to both stdin and stdout of the new process.
> 
> For the stdin and stdout we can say just use pull and nonblocking I/O.
> 
> The problem is that both PTRACE_ATTACH and PTRACE_SEIZE block over
> the duration of exec, and if exec is waiting for a thread to exit,
> and that thread is blocked in PTRACE_EVENT_EXIT waiting for that very
> same tracer those processes will hang. Not deadlock.
> 
> 
> I haven't seen anyone clearly describe the problem lately so I am
> repeating it.
> 
> 
> Just looking at the code I don't think there is any fundamental reason
> to call commit_creds after de_thread.  If we can change that we can sort
> this out without any change in userspace semantics.
> 
> If we can't move commit_creds we have to either give
> PTRACE_ATTACH/PTRACE_SEIZE a non-block mode, or break out of
> PTRACE_EVENT_EXIT in de_thread.
> 
> I will post a proof of concept of moving commit_creds in just a minute.
> 
> Eric

Note: I forgot to add apparmor and selinux mailing list to this patch, previous
versions of this did try to avoid to touch the security engine code, and did
instead temporarily install the new credentials, mostiy for the benefit of the
security engines.  But that is considered an unacceptable solution, therefore
I want to use instead a new option to ptrace_may_access.
All security engines have to handle this option, but the advantage is, that the
engines could detect and maybe also deny the unsafe execve.

This is an alternative to Eric's patch: "exec: Move cred computation under
exec_update_lock" that is supposed to solve the same problem, but tries instead
to avoid any user visible API change.


Thanks
Bernd.


