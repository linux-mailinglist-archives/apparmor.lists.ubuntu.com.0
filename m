Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9643A76F918
	for <lists+apparmor@lfdr.de>; Fri,  4 Aug 2023 06:45:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qRmgb-0007U7-KY; Fri, 04 Aug 2023 04:45:13 +0000
Received: from mail-am6eur05on2071.outbound.protection.outlook.com
 ([40.107.22.71] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <geliang.tang@suse.com>) id 1qRk2y-0005iP-Uu
 for apparmor@lists.ubuntu.com; Fri, 04 Aug 2023 01:56:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLhqxM0FzbI6Y2DwUaXAyXh5F6SpxIvm9MYqEzaWwJDBDK5wO3dPoDtfea0m5aRTRih8dli1aLL7i+ihVOTAqHYKK6eqEBRk+TLsrbiL4ZrYRdkGTU7iE4yIhrYjKWSGCQ0TXL26H48gzbJaqhJp9sXrMVRrGN8xulmfeq9u+Nb2C5Wq4jNOAAI0sn0Z1kUJY82dErJdYXFEFioYl4O9nEbpszv78JPWWn8+Y8JRDg3Fe0JGd+N6KGkjiQpIx82Pl2EXIxt/Zm3wYlXVK29akJnWLverwDalfY81gtyegkZMfmCmmsF3mGP1T7w+BLK7SAvwTtYIEF73pWEDr6Cjbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67IJNZXR8xHZysLARhWEOYDwJ5zgZ1zmECZ/EfEhyXk=;
 b=mv9lMNUug2L09HQzGZEkBL57thMLpZ2uJqN7UrJKGSRZ58eeGfolgKBDXR/M3EXJsqlzf8KoIYLjsojpdmfBdodbX8IaO0K4jnTTaiJfjPnJY7UFSFvme4z5at1XrKiiaRxHaJ1nvkzZXzZJAnV3xz2azQm6wO67Oueja/omLnJYxNVOP5j2I5HFz3Nekyw7h1FkUmrKosWRge33935XRzsR8uZwZambej8zSlno+rSx5YZupaVQI6qMIb9ErKZcuSuCJOufhjYNTVRWk710d5YjiN4PDcdzlKWi1NQNNHlcaF+2yI4ze0dOheUVt4mLGhhotO38OmMcoTTucKu/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67IJNZXR8xHZysLARhWEOYDwJ5zgZ1zmECZ/EfEhyXk=;
 b=S40B4iz9iUqXGTsy9ku6U/JIdZnmeqygB84XvHQwHI0Z+HwO457To6yYLGxdQK8AAt+tj5WbgpWK/fDct6uClE9tIL1nZIitI+JYXvdV1zOlyGVKkVDzGhRxWigGNtZ4cMDAT1i39IZqLykm9b8bGAbWy4OhPMP6Xlyz9xU2isdgkrpUCneHy0MtxsFyjRlcXVTMj6NKbNnDlItp1FMdIxbNEPaCUvQco08Gi5ExxMnOZPSLOa7mNSomeXUzlTZymzuB9zAVILH6h8lDs/2LOBVAzIOLtFrGDIhUVxbbDlU+4aM2ZPcUxHbAgyokY2oaCGTPpgJ6B4VVMU+qzu7JJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from HE1PR0402MB3497.eurprd04.prod.outlook.com (2603:10a6:7:83::14)
 by GV1PR04MB9085.eurprd04.prod.outlook.com (2603:10a6:150:20::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 01:56:08 +0000
Received: from HE1PR0402MB3497.eurprd04.prod.outlook.com
 ([fe80::2867:7a72:20ac:5f71]) by HE1PR0402MB3497.eurprd04.prod.outlook.com
 ([fe80::2867:7a72:20ac:5f71%3]) with mapi id 15.20.6652.020; Fri, 4 Aug 2023
 01:56:08 +0000
From: Geliang Tang <geliang.tang@suse.com>
To: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Florent Revest <revest@chromium.org>,
 Brendan Jackman <jackmanb@chromium.org>,
 Matthieu Baerts <matthieu.baerts@tessares.net>,
 Mat Martineau <martineau@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>, Mykola Lysenko <mykolal@fb.com>,
 Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>
Date: Fri,  4 Aug 2023 09:55:45 +0800
Message-Id: <0cfa88a21dd907c2ab910d2c595d4ebc59bb93cd.1691113640.git.geliang.tang@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1691113640.git.geliang.tang@suse.com>
References: <cover.1691113640.git.geliang.tang@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To HE1PR0402MB3497.eurprd04.prod.outlook.com
 (2603:10a6:7:83::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3497:EE_|GV1PR04MB9085:EE_
X-MS-Office365-Filtering-Correlation-Id: 51bdfda3-b6b0-4a56-2007-08db948df80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FWOm8Do1OrbDPUc/QqRbcp3+AcSnujK3hGDEKEe8rrpvzvHm9uNzBdVhYORQosPU/MFKZPtOJ/PZFU2r7Qn8LvLJWFDMlZQMN+rfXuZfgk77iw5QWRVgVQwqGmjbWIaF9Yp1AQjG6SNgsMesBk5zmdHWUnKolyA9NsWYJ8CaxI6+8IpeLQlWtPFkN+W2alYaj5jqTwJneHkgiZcJ0ikeUj69U7aSaROhZlIHc8HUzBrIucD9+OWx5rKvQOA0N5zORsZENIM/aCAIKT4cOe6Yx9h7bVN0IYckMkK9SexhCnMM1jlFzp2KTmMZtzruiAVtnn0TUCQWG2tPNEdBbXNTPHZ1VA3Ep7BpXG8+7H3Lac9RkCRoytMPpX7doDybWzuk44uZ8RpN1RyC1vD5neqiJzooZ01zm2ic61/n2OQqWy9NzHvspGICENm+AoIFmQhC+ZcejnRNql8JGYgysEFXLs1mR9YRv2ml1Xqn+pPdfjeTjrpyd/y/Xp626eZ2xJuhRQwT+nCx/l7WL72LBM3bL4nTE5SqYBNxIPvPH23KktNTqtyFSW/rZYT+GodO8HWc/75/xv+OU0egbGv/hP9kDI5OtOmJHIlD/64HdQ5bLP+JcI8/+us92sCMYkQdLPKw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB3497.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(136003)(346002)(39860400002)(186006)(451199021)(1800799003)(6506007)(38100700002)(921005)(26005)(478600001)(8676002)(8936002)(5660300002)(7416002)(110136005)(44832011)(7406005)(41300700001)(66556008)(54906003)(4326008)(66946007)(66476007)(6512007)(6666004)(86362001)(316002)(6486002)(2616005)(36756003)(2906002)(83380400001)(13296009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UGiqfv337i3yDWBeoAf3UemlX3cNd7L/TDG1RHUxw/hH4fQytPOBTiWOZ9GZ?=
 =?us-ascii?Q?i7RY38ELZsRZzyTjxLvdiFTpWtW288jQ4Whr0DcpPNZVtnlOEAI6/imStOFa?=
 =?us-ascii?Q?3/wb1/5sSKOjYQAa2a4Ek29oYLJkrQ9nm5/w18mr0Qb2ydc0MvN+THw38jMN?=
 =?us-ascii?Q?QL+vtck3MlLW7KWDE/Pr3LzNtyL4EMdTyPqT/MPnuXxeSE+CLxgxLAKPKDIr?=
 =?us-ascii?Q?lxfAkaQd5QwPgCS+tg8pMCFuED5cRle5AHNI0x7XItAqomiWh/dC3PZD8qGb?=
 =?us-ascii?Q?Y3YETZuB5gut1EQcSKpjywYCUdFijQu9e1fKW0YZT02Z2u+M8l+PllLVVItA?=
 =?us-ascii?Q?anNc5aoafailoOfHHw1nsBrCN4kYRz0W88Rql+Y0Xs94I0Oyx5MpE26DEb0q?=
 =?us-ascii?Q?GF20zUCh+PUtUc0eumYo3eZHb6qeyNc96sxqLg7Siqf1A29SUcxoPWXYwF4I?=
 =?us-ascii?Q?WL3gK43b2X3bQ/tLDb614q3vAuXXmYbZa0NfEJlQy2sfXLqpkK52maFTi0ns?=
 =?us-ascii?Q?FC90cJk2Zhf0RFc2IspV0wbsu35EO5tUssTNc4Ro9RCz3zGWXhVvfoUT37En?=
 =?us-ascii?Q?OEcBbOzoH0f55NSG8raix5o1pYfRlqDO3qYZ4IgG+JTl0/8Lmd+U8j5qnZ4+?=
 =?us-ascii?Q?6RFZo0NVe5pJX7/vNKTXilfOmjRP+6q4CpB1PTKvuSzd0AleNIVE59CuKBuH?=
 =?us-ascii?Q?xhe0vMbS6daChsvsxouEH/KrK4VwBCt6B4QUA8LkkHXGYCGqfoJ8zC3qG22h?=
 =?us-ascii?Q?iTpWHw9WqCyYORmDQVxGz95KWEFrf6SR8cpsUF/uptv65vOTH2QpsfCDuAe0?=
 =?us-ascii?Q?s/4ocLxauxfiYYIA+ly2/WOddaICVyfR6HXmpx6Kdoec+8r1brALsh1RbCYo?=
 =?us-ascii?Q?JOaiA888q6wADRRgOnvdfmHWOlgCt90tGQ5GYVJrk/G1t3/0Ka463cQfYTja?=
 =?us-ascii?Q?MshvCAubZFfy26uxz44A/NsflhqgCE6FeSvI2Ulr9kEWqYICGOMe7Le6Dlq/?=
 =?us-ascii?Q?NpeajSgi2abQ4zbZk+p8JDfZiYEZMaBEJy7VDT5M11kiQsJ7GqFUR05m5TjW?=
 =?us-ascii?Q?wFgfGjo7A4adoI6GBbAJgANxc4TQA5hpcOPhEHYfHLaManMAcS56SZqtM3Oz?=
 =?us-ascii?Q?beaoXeqDR+reiJLwxzMT1D85EzaF5RwDHI/S1v/96un5vYkIMfKoFmdslbDn?=
 =?us-ascii?Q?ZglFdSYDaiqJf4IulXd24T7f1qjOEyvtCoCPUuZvoUhBTFMyvGD0M02D/cwd?=
 =?us-ascii?Q?CFCjDJi5/GIz8RZLv9vve2vhnuJ9F5pRixMMgrlVLBB8PqkPM8ljNMX+UcCX?=
 =?us-ascii?Q?qAg7uo1yO93Aw07nq6BjihsWiU+pYLICqgLOt8SmjqGaaWi8xI5hu0b2hxBa?=
 =?us-ascii?Q?SGSgbN3O3UvI9eoDo4nvmA/+DrMyPecvFRVn6rvZAXqHYyRpxg39NhyCyFXp?=
 =?us-ascii?Q?9r51qoC18evfzPi02DHc6weHa5J04ICXVAMI658TM50djDDy6teAZiV11ctV?=
 =?us-ascii?Q?/l9c1q0LhrLp+8SoTueXZpy+qR4kGMLBBWEIHUncgZh3G8SA21OneBWRjCP8?=
 =?us-ascii?Q?h7FtDjers12jGlLgmnA/QnEM4xxfDi9TRsfwvY20?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bdfda3-b6b0-4a56-2007-08db948df80a
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3497.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 01:56:07.9049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XP3WBoToEGQU4vsSRbUyVuEoYDEfJ25jQ8/bQKDPJx6w0YQlO+rfWpwuIkXcHuWELNC5XJvxACp+Vy7Duh5JUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9085
X-Mailman-Approved-At: Fri, 04 Aug 2023 04:45:09 +0000
Subject: [apparmor] [PATCH bpf-next v10 3/5] selftests/bpf: Add two mptcp
	netns helpers
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
Cc: Yonghong Song <yonghong.song@linux.dev>, selinux@vger.kernel.org,
 netdev@vger.kernel.org, apparmor@lists.ubuntu.com,
 Geliang Tang <geliang.tang@suse.com>, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, mptcp@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Add two netns helpers for mptcp tests: create_netns() and
cleanup_netns(). Use them in test_base().

These new helpers will be re-used in the following commits introducing
new tests.

Acked-by: Yonghong Song <yonghong.song@linux.dev>
Reviewed-by: Matthieu Baerts <matthieu.baerts@tessares.net>
Signed-off-by: Geliang Tang <geliang.tang@suse.com>
---
 .../testing/selftests/bpf/prog_tests/mptcp.c  | 35 ++++++++++++-------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/mptcp.c b/tools/testing/selftests/bpf/prog_tests/mptcp.c
index 4ccca3d39a8f..4407bd5c9e9a 100644
--- a/tools/testing/selftests/bpf/prog_tests/mptcp.c
+++ b/tools/testing/selftests/bpf/prog_tests/mptcp.c
@@ -22,6 +22,26 @@ struct mptcp_storage {
 	char ca_name[TCP_CA_NAME_MAX];
 };
 
+static struct nstoken *create_netns(void)
+{
+	srand(time(NULL));
+	snprintf(NS_TEST, sizeof(NS_TEST), "mptcp_ns_%d", rand());
+	SYS(fail, "ip netns add %s", NS_TEST);
+	SYS(fail, "ip -net %s link set dev lo up", NS_TEST);
+
+	return open_netns(NS_TEST);
+fail:
+	return NULL;
+}
+
+static void cleanup_netns(struct nstoken *nstoken)
+{
+	if (nstoken)
+		close_netns(nstoken);
+
+	SYS_NOFAIL("ip netns del %s &> /dev/null", NS_TEST);
+}
+
 static int verify_tsk(int map_fd, int client_fd)
 {
 	int err, cfd = client_fd;
@@ -147,13 +167,8 @@ static void test_base(void)
 	if (!ASSERT_GE(cgroup_fd, 0, "test__join_cgroup"))
 		return;
 
-	srand(time(NULL));
-	snprintf(NS_TEST, sizeof(NS_TEST), "mptcp_ns_%d", rand());
-	SYS(fail, "ip netns add %s", NS_TEST);
-	SYS(fail, "ip -net %s link set dev lo up", NS_TEST);
-
-	nstoken = open_netns(NS_TEST);
-	if (!ASSERT_OK_PTR(nstoken, "open_netns"))
+	nstoken = create_netns();
+	if (!ASSERT_OK_PTR(nstoken, "create_netns"))
 		goto fail;
 
 	/* without MPTCP */
@@ -176,11 +191,7 @@ static void test_base(void)
 	close(server_fd);
 
 fail:
-	if (nstoken)
-		close_netns(nstoken);
-
-	SYS_NOFAIL("ip netns del " NS_TEST " &> /dev/null");
-
+	cleanup_netns(nstoken);
 	close(cgroup_fd);
 }
 
-- 
2.35.3


