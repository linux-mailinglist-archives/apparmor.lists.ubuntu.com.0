Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB476F677
	for <lists+apparmor@lfdr.de>; Fri,  4 Aug 2023 02:18:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qRiW3-00014M-Bh; Fri, 04 Aug 2023 00:18:03 +0000
Received: from out-97.mta0.migadu.com ([91.218.175.97])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <yonghong.song@linux.dev>) id 1qRhvz-0007tZ-06
 for apparmor@lists.ubuntu.com; Thu, 03 Aug 2023 23:40:47 +0000
Message-ID: <878f7f70-4158-8200-f6ba-852d18b948e0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691106046; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70OOEnQNymTwDBG+D/tQnUGjNUZmioQ7nC9Qtp7Y8Ns=;
 b=LYJCbLPQw1uc/Dyz1Jb/q2qVDZHI6COnSC+37k/5h6YPulFyJAipEP1dGow4qdyA5j98iJ
 7KALLYoQ9BPg8XQJbQpFEmZTT6/g6cqzcYsPZZj+tVfVz0NLKPFcWgK2R0S9KLNrV4BkHA
 1Pn2Gs3ta0WvKEKlG5MIBZe4L4mN4mg=
Date: Thu, 3 Aug 2023 16:40:33 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Geliang Tang <geliang.tang@suse.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Florent Revest <revest@chromium.org>, Brendan Jackman
 <jackmanb@chromium.org>, Matthieu Baerts <matthieu.baerts@tessares.net>,
 Mat Martineau <martineau@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>, Mykola Lysenko <mykolal@fb.com>,
 Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>
References: <cover.1691069778.git.geliang.tang@suse.com>
 <92ee6be5a465601ff3a2df29b6a517086e87ca3c.1691069778.git.geliang.tang@suse.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <92ee6be5a465601ff3a2df29b6a517086e87ca3c.1691069778.git.geliang.tang@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 04 Aug 2023 00:18:02 +0000
Subject: Re: [apparmor] [PATCH bpf-next v9 4/4] selftests/bpf: Add mptcpify
	test
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
Reply-To: yonghong.song@linux.dev
Cc: selinux@vger.kernel.org, netdev@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, mptcp@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On 8/3/23 6:41 AM, Geliang Tang wrote:
> Implement a new test program mptcpify: if the family is AF_INET or
> AF_INET6, the type is SOCK_STREAM, and the protocol ID is 0 or
> IPPROTO_TCP, set it to IPPROTO_MPTCP. It will be hooked in
> update_socket_protocol().
> 
> Extend the MPTCP test base, add a selftest test_mptcpify() for the
> mptcpify case. Open and load the mptcpify test prog to mptcpify the
> TCP sockets dynamically, then use start_server() and connect_to_fd()
> to create a TCP socket, but actually what's created is an MPTCP
> socket, which can be verified through the outputs of 'ss' and 'nstat'
> commands.
> 
> Reviewed-by: Matthieu Baerts <matthieu.baerts@tessares.net>
> Signed-off-by: Geliang Tang <geliang.tang@suse.com>
> ---
>   .../testing/selftests/bpf/prog_tests/mptcp.c  | 94 +++++++++++++++++++
>   tools/testing/selftests/bpf/progs/mptcpify.c  | 25 +++++
>   2 files changed, 119 insertions(+)
>   create mode 100644 tools/testing/selftests/bpf/progs/mptcpify.c
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/mptcp.c b/tools/testing/selftests/bpf/prog_tests/mptcp.c
> index 4407bd5c9e9a..caab3aa6a162 100644
> --- a/tools/testing/selftests/bpf/prog_tests/mptcp.c
> +++ b/tools/testing/selftests/bpf/prog_tests/mptcp.c
> @@ -6,6 +6,7 @@
>   #include "cgroup_helpers.h"
>   #include "network_helpers.h"
>   #include "mptcp_sock.skel.h"
> +#include "mptcpify.skel.h"
>   
>   char NS_TEST[32];
>   
> @@ -195,8 +196,101 @@ static void test_base(void)
>   	close(cgroup_fd);
>   }
>   
> +static void send_byte(int fd)
> +{
> +	char b = 0x55;
> +
> +	ASSERT_EQ(write(fd, &b, sizeof(b)), 1, "send single byte");
> +}
> +
> +static int verify_mptcpify(void)
> +{
> +	char cmd[256];
> +	int err = 0;
> +
> +	snprintf(cmd, sizeof(cmd),
> +		 "ip netns exec %s ss -tOni | grep -q '%s'",
> +		 NS_TEST, "tcp-ulp-mptcp");
> +	if (!ASSERT_OK(system(cmd), "No tcp-ulp-mptcp found!"))
> +		err++;
> +
> +	snprintf(cmd, sizeof(cmd),
> +		 "ip netns exec %s nstat -asz %s | awk '%s' | grep -q '%s'",
> +		 NS_TEST, "MPTcpExtMPCapableSYNACKRX",
> +		 "NR==1 {next} {print $2}", "1");
> +	if (!ASSERT_OK(system(cmd), "No MPTcpExtMPCapableSYNACKRX found!"))
> +		err++;
> +
> +	return err;
> +}
> +
> +static int run_mptcpify(int cgroup_fd)
> +{
> +	int server_fd, client_fd, prog_fd, err = 0;
> +	struct mptcpify *mptcpify_skel;
> +
> +	mptcpify_skel = mptcpify__open_and_load();
> +	if (!ASSERT_OK_PTR(mptcpify_skel, "skel_open_load"))
> +		return -EIO;
> +
> +	err = mptcpify__attach(mptcpify_skel);
> +	if (!ASSERT_OK(err, "skel_attach"))
> +		goto out;
> +
> +	prog_fd = bpf_program__fd(mptcpify_skel->progs.mptcpify);
> +	if (!ASSERT_GE(prog_fd, 0, "bpf_program__fd")) {
> +		err = -EIO;
> +		goto out;
> +	}

load success means prog_fd is always valid. So above
ASSERT_GE not needed.

> +
> +	/* without MPTCP */
> +	server_fd = start_server(AF_INET, SOCK_STREAM, NULL, 0, 0);
> +	if (!ASSERT_GE(server_fd, 0, "start_server")) {
> +		err = -EIO;
> +		goto out;
> +	}
> +
> +	client_fd = connect_to_fd(server_fd, 0);
> +	if (!ASSERT_GE(client_fd, 0, "connect to fd")) {
> +		err = -EIO;
> +		goto close_server;
> +	}
> +
> +	send_byte(client_fd);
> +	err += verify_mptcpify();
> +
> +	close(client_fd);
> +close_server:
> +	close(server_fd);
> +out:
> +	mptcpify__destroy(mptcpify_skel);
> +	return err;
> +}
> +
> +static void test_mptcpify(void)
> +{
> +	struct nstoken *nstoken = NULL;
> +	int cgroup_fd;
> +
> +	cgroup_fd = test__join_cgroup("/mptcpify");
> +	if (!ASSERT_GE(cgroup_fd, 0, "test__join_cgroup"))
> +		return;
> +
> +	nstoken = create_netns();
> +	if (!ASSERT_OK_PTR(nstoken, "create_netns"))
> +		goto fail;
> +
> +	ASSERT_OK(run_mptcpify(cgroup_fd), "run_mptcpify");
> +
> +fail:
> +	cleanup_netns(nstoken);
> +	close(cgroup_fd);
> +}
> +
>   void test_mptcp(void)
>   {
>   	if (test__start_subtest("base"))
>   		test_base();
> +	if (test__start_subtest("mptcpify"))
> +		test_mptcpify();
>   }
> diff --git a/tools/testing/selftests/bpf/progs/mptcpify.c b/tools/testing/selftests/bpf/progs/mptcpify.c
> new file mode 100644
> index 000000000000..9cf1febe982d
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/mptcpify.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2023, SUSE. */
> +
> +#include <linux/bpf.h>
> +#include <bpf/bpf_tracing.h>
> +
> +char _license[] SEC("license") = "GPL";
> +
> +#define	AF_INET		2
> +#define	AF_INET6	10
> +#define	SOCK_STREAM	1
> +#define	IPPROTO_TCP	6
> +#define	IPPROTO_MPTCP	262

To avoid the above macros, you can use
vmlinux.h and bpf_tracing_net.h.

> +
> +SEC("fmod_ret/update_socket_protocol")
> +int BPF_PROG(mptcpify, int family, int type, int protocol)
> +{
> +	if ((family == AF_INET || family == AF_INET6) &&
> +	    type == SOCK_STREAM &&
> +	    (!protocol || protocol == IPPROTO_TCP)) {
> +		return IPPROTO_MPTCP;
> +	}
> +
> +	return protocol;
> +}

