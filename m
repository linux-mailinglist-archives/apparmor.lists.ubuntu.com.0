Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E99CF76C7F9
	for <lists+apparmor@lfdr.de>; Wed,  2 Aug 2023 10:07:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qR6tD-00064Y-KA; Wed, 02 Aug 2023 08:07:27 +0000
Received: from mail-am6eur05on2040.outbound.protection.outlook.com
 ([40.107.22.40] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <geliang.tang@suse.com>) id 1qR1S0-000528-PV
 for apparmor@lists.ubuntu.com; Wed, 02 Aug 2023 02:19:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jj9R6ldbdSqNnEdzvjVW/pPQbkDj9Uo6wr5yxUFeuXNlC0edc9hSv/8/fPplPBnkQlMuLS547nMn3Mf7lRaVoRkeyE+hsxq6mbRRGaflpPtodIfy4fRrKdtLMt/pAZtMZCwF+erQXQu2OI3bLwtU2MhXY9GlAletI3wwSYNGYpRJeh8hYoyI5sQ2FhIXI5l2hlWfk8TdxuFvCTbCbQT3UYZUaxwoVyvfk74iykuP/tF0XsrQ3ioKTOxoqrTQt+O0E3yvDGm4GnzaHwRCkaEqBMPHQexPpAc4oW/nXJb+GOdr/MC5StGbNGquaUUGpClo2hvAkV1tr96CeQn2BRWt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DGcjeUrNorHbWvij4vJzLryXSw/kY5C4fREMw64RXE=;
 b=MFYMlpR5poEvMYAHFQjDv6DSD2QZ5aYz+I7i1PbbFDkdxavuW8DKZSfDmjlJUTnyv4QLaewB6QXXdmPOsjEDIjT4gHzbxkMplEEeev6Vwvm7MiyawpqCHbFoMJM+8i98YsxaGc6dIfu/2cvwo+eQUjociYVzYRi1m2dK0da+VD7u17SRy8VAhouTXjSilN+z8noerhhANX5CKxCwN6paKfOCqRDfwvkOm657/zDHvyK6tEkIIjQH/kFzbobMNPmOud6VMXFLtbP4aNFRt/RExypnvg3Tb5QmCiU2rCByS0CvRNDRUcWjYOnUFLy1VfXvCnUH769ky1f9NH/95jKwjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DGcjeUrNorHbWvij4vJzLryXSw/kY5C4fREMw64RXE=;
 b=4Qpdz3dcsvAjmd7ZKXvvvITTcQYPSP9fyWkRtUDRSe0q4qniXoaAy43JgSvf0OQzF4PcKU+oG/WGPlyvBvUDbrr9QE6TNg0HMV/loz/r+e+sTjUTxmiWbsHyk6qwpz6ogqNOJOqcfg9K8xVDLlUqB82MtorwcIOWKjwlC1b9f1xBxDpyuJLSgNBsrTTb4eKBSQneN/M1U0xkZPkr1LJNRI6+Ivjzezia8b1ZlnLzjFwayEQJrAeDaRxFb29c+JdeU40p081ZEai02OZ/ajKdDgpMplKql8MAbx7wJ4gNb+xMmTr4xbBdm8GD6HQvgAnK2+AIrZ9n2/mlkuzLNPnEig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from HE1PR0402MB3497.eurprd04.prod.outlook.com (2603:10a6:7:83::14)
 by AM7PR04MB7079.eurprd04.prod.outlook.com (2603:10a6:20b:11d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 02:18:58 +0000
Received: from HE1PR0402MB3497.eurprd04.prod.outlook.com
 ([fe80::bf65:a49a:8861:4f92]) by HE1PR0402MB3497.eurprd04.prod.outlook.com
 ([fe80::bf65:a49a:8861:4f92%2]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 02:18:58 +0000
Date: Wed, 2 Aug 2023 10:19:03 +0800
From: Geliang Tang <geliang.tang@suse.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Message-ID: <20230802021903.GA3070@bogon>
References: <cover.1690624340.git.geliang.tang@suse.com>
 <20230801004323.l2npfegkq3srzff3@MacBook-Pro-8.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801004323.l2npfegkq3srzff3@MacBook-Pro-8.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:194::11) To HE1PR0402MB3497.eurprd04.prod.outlook.com
 (2603:10a6:7:83::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3497:EE_|AM7PR04MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab749c5-b54c-4ce4-aef0-08db92fed3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UJ38BUa0eohITOjkByT1TeBw7uB6yxJ0hbXIbcke9eIpgTdSKKH7m+Wnf6k9HYvU9E6gI6FCzme28m2/g9LkFwJHL9DSzNWel3LhyslPP0GxNinNlT3GdThudwPLfEY9hSM8L5KNdY3z/rBw0/2F8vornAeMuua1NVo286RhegNvqWxmC1qo2jTd0aLhVv1qLqSwMokk4Dh+MQLyVJa65kipjSfJVg34ywtfeNOIrT5hj8miYcSyRjOpKg1SiodVS3hzGmQ75ieZH/ylpyI6GRo/4qiKRY4LsoM9Kmevw0wb1C933ZQ+nymdSiCh9odwIWVlXiJsJrDreukTpOLuZZ4BqyNUeVw80PEt9hIFWkf/WH+v35rvPd2UIZfklYZwc9m+MZyYV7CQFxqwL9k+lwpam4A7dONxYsZh2J6ZxYl3vu6Bvm+bvWDhIGVLLRKy+bwPE2g8kQ69bu3/U1KWqktwJS+x8v6B6jqLFqKUV1iFEbW/05OdBVt9+/dk9ZPbrx8PrYYLAurY5WjPfDw3kQ+eZJW1qoKn9mDvJM+Flz83rYxJ7DOut/M3YRk9RtmHmxrhdUYoppxznmwCbZlNZ0211O4tExxhJ3o1gTmMsDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB3497.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(186003)(966005)(6512007)(9686003)(316002)(86362001)(478600001)(54906003)(38100700002)(66946007)(66556008)(66476007)(6666004)(33656002)(6486002)(33716001)(6916009)(4326008)(6506007)(41300700001)(26005)(8676002)(5660300002)(8936002)(1076003)(4744005)(2906002)(7416002)(7406005)(44832011)(13296009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b2ibr3Ye3EjlCaHa7OICxYKDCaiYX+oY35VLw8rFldkmwIxRdMgVkz2ykkQz?=
 =?us-ascii?Q?uKSxgFp5k4ZpD0ZPFWNrXQTUdV4weWzRe5NnRsV+wFcobBbFlmTRkmPkq17V?=
 =?us-ascii?Q?nJxX2t7kNGeO4WzuxAlPE0Y5GZ00zw0wCibVMdLozvfbrhbGD6V4ONi+uQ+r?=
 =?us-ascii?Q?0AoUxan8JYp/big3TmXobNHltmEwzO7Rq7i9OlouY5j22NNL7WpzQcANEq/a?=
 =?us-ascii?Q?QLYZnhVg9j0YqRmLiz0lsKLl/HeJ9+v25fpWC5rP3YKyCmoaM48V7x+Bj7+P?=
 =?us-ascii?Q?xuhq2wS372xWlniJslA7kbU/72igxYRu45XZX+4W9d6G/t5u00Os6yTZSVCV?=
 =?us-ascii?Q?X3kgF1LaNLNXiGI7URhSNmYYfWFVZI64ghYOwoK+cPx7DXGYDdqJ+BkPen4p?=
 =?us-ascii?Q?XpM046FNZOooivFtQIq6fH1Ws81jMB0kDq3BNoPg//R4tqwgWZBVs6QOHU84?=
 =?us-ascii?Q?FQ+/wDpyiajtlFccXi+Uc34SPm67HrPeA/NoB5CypZILFsVhx9DbryKp2Yyy?=
 =?us-ascii?Q?3+I5C+PKHHwJYqrfyniLmVHfBJ+6WwV9x8WKO/u8YXGi2o4Gf8qALqW3U/nr?=
 =?us-ascii?Q?4ul74fvfz719/EvJXH8VdLHOHq+XAl6B4EEGuACg1h4jC56bgLkMzLOJQHkG?=
 =?us-ascii?Q?QiHlQinPtGGttN2W4L1vVPf8mCwn9U2WAIWmxC2gNis3kCOfx/lcJvr5DTwB?=
 =?us-ascii?Q?SxEmOlzp7CFkZFqEekFWRnwDPQBPx0ew1Awl/S88nmHe/+cIUtw/znk5zhyf?=
 =?us-ascii?Q?UMj9kP7lNiKSAT2758bRI4ehwAyj/zfu6y5+fmzlTHHkG/ctW7Qvik1d7Iat?=
 =?us-ascii?Q?lcd1o87Vja5Thz3TLF5E38+5d6n3XpHJYJfAjm0MVGTgMF32L/phMh3JEra9?=
 =?us-ascii?Q?FYDcF5vtcdXxk/IGvd1c5Oym3ek6eTtoATPK6rY1mGWFgP4zqPGNgJx77rSw?=
 =?us-ascii?Q?r/BIpK4NlO/qb7KfXGlqpEjuw7lYlo+Nmn8EVdeisEafyDlo4EEaPq/Arwgr?=
 =?us-ascii?Q?neNMUB7+KUVj6MwvgDaqhJyyDwb91wi443aXxVTP4yreodkz8eAZmVxUbmsX?=
 =?us-ascii?Q?/f/ZX+zGbq3mKRAPM7FEi1CqW6Gp2ZfO08pFvRZ1BRPIuGCHAAf8BUTs7105?=
 =?us-ascii?Q?3LAao/1yWPZ4Z17sH8Awspu7+CSGAjZl8NVz72/7HSYfYNcm1X4DVJb0hlva?=
 =?us-ascii?Q?mS0srpYKvdxnB+XNQRC26VugDUTXHxiRMTO7IPQZXYTzFd92mR43S92aHvhU?=
 =?us-ascii?Q?NVLAhbolq+zAtFr8HPcsv8tpk4ViQodRGRlU1AoZRWyrbQy6CXwPlWIA7A4g?=
 =?us-ascii?Q?06KsmBP3DMX0oBu0kD85pvaeUTE+T+/fPgZWntWkhBcuosZ1faIoQvlvp92I?=
 =?us-ascii?Q?jf3ZqON5TBZRQHgpKLyMTxu78BQxdlT1J3mY0xvuW4EqLS33PWIu+oOf7reA?=
 =?us-ascii?Q?jKCYbk66fiM/UrA+KDX4ioquXZJ+cuarQlk07ej+D5YmbWNZC0s5WLVcHNM/?=
 =?us-ascii?Q?LLAnMCO/PkEfEnSo9QDtXlzoS5lN0txvoTjZPBB+uPmKr5av0apzW1rGByr5?=
 =?us-ascii?Q?oUKlxD9o+Xx7cV47doaQE2HWcF20LVgox7sJrNtx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab749c5-b54c-4ce4-aef0-08db92fed3d5
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3497.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 02:18:57.9338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQf/7G8I6zxrraDcWkf8TuPRzEFMQyOABmgzJevB3yqSqaOHHUTEIBMIkDtdfDnjqV8HiiVg/p27gBHpkujgqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7079
X-Mailman-Approved-At: Wed, 02 Aug 2023 08:07:26 +0000
Subject: Re: [apparmor] [RFC bpf-next v7 0/6] bpf: Force to MPTCP
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
Cc: Alexei Starovoitov <ast@kernel.org>, James Morris <jmorris@namei.org>,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Mat Martineau <martineau@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Florent Revest <revest@chromium.org>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, KP Singh <kpsingh@kernel.org>,
 Brendan Jackman <jackmanb@chromium.org>, Yonghong Song <yhs@fb.com>,
 Eric Paris <eparis@parisplace.org>, mptcp@lists.linux.dev,
 Hao Luo <haoluo@google.com>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 linux-security-module@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 Matthieu Baerts <matthieu.baerts@tessares.net>, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Jul 31, 2023 at 05:43:23PM -0700, Alexei Starovoitov wrote:
> On Sat, Jul 29, 2023 at 05:57:21PM +0800, Geliang Tang wrote:
> > 
> > The main idea is to add a hook in sys_socket() to change the protocol id
> > from IPPROTO_TCP (or 0) to IPPROTO_MPTCP.
> 
> I still think it's a hack, but its blast radius is nicely contained.
> And since I cannot propose any better I'm ok with it.
> 
> Patches 1-2 can be squashed into one.
> Just like patches 3-6 as a single patch for selftests.

Thanks Alexei. I'll squash patch 1 and patch 2 into one, and squash patch 3
and patch 6 into one for selftests. But I prefer to keep patch 4 and patch 5
as is, since they were implemented in different times for different purposes.
They were merged into MPTCP repo on May 17 for "run MPTCP sched tests in a
dedicated ns" [1].

[1]
https://patchwork.kernel.org/project/mptcp/cover/cover.1684362296.git.geliang.tang@suse.com/

-Geliang

> 
> But before proceeding I'd like an explicit ack from netdev maintainers.

