Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E66C76F921
	for <lists+apparmor@lfdr.de>; Fri,  4 Aug 2023 06:45:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qRmgY-0007Tl-Cn; Fri, 04 Aug 2023 04:45:10 +0000
Received: from out-109.mta1.migadu.com ([95.215.58.109])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <yonghong.song@linux.dev>) id 1qRmek-0007PA-88
 for apparmor@lists.ubuntu.com; Fri, 04 Aug 2023 04:43:18 +0000
Message-ID: <57615016-a7a5-3ba5-4124-084b7d01f2bd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691124197; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2oqYRixqJSQOjAdmBaMhIIt6Nwo1HIOOcWGBh2+E0m0=;
 b=EB7c50o6hLwly8prdcAMJ485EDqHTQFuZ76yko2ReEDV68av2IAD8gHSHMgJBzRCcTCW8V
 lldMP9f0RDgiQbh2KGICRvBI9BFQ19DHHFoSEjLkg4cAWydoD7BiHgCUuNQaulLSrLxVB2
 YBunvRucwB4mzS4UQwRIfak1oQYcPdo=
Date: Thu, 3 Aug 2023 21:43:07 -0700
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
References: <cover.1691113640.git.geliang.tang@suse.com>
 <db0d187dabf08d272a3f953cb2edfba8e8bf47e8.1691113640.git.geliang.tang@suse.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <db0d187dabf08d272a3f953cb2edfba8e8bf47e8.1691113640.git.geliang.tang@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 04 Aug 2023 04:45:09 +0000
Subject: Re: [apparmor] [PATCH bpf-next v10 5/5] selftests/bpf: Add mptcpify
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



On 8/3/23 6:55 PM, Geliang Tang wrote:
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

Ack with a minor nit below.

Acked-by: Yonghong Song <yonghong.song@linux.dev>

> ---
>   .../testing/selftests/bpf/prog_tests/mptcp.c  | 88 +++++++++++++++++++
>   tools/testing/selftests/bpf/progs/mptcpify.c  | 20 +++++
>   2 files changed, 108 insertions(+)
>   create mode 100644 tools/testing/selftests/bpf/progs/mptcpify.c
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/mptcp.c b/tools/testing/selftests/bpf/prog_tests/mptcp.c
> index 3dc0ba2e7590..e5ac2c3aab7d 100644
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
> @@ -185,8 +186,95 @@ static void test_base(void)
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
> +	int server_fd, client_fd, err = 0;
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

The above code essentially equals to
	err = verify_mptcpify()
since err must be 0 before the above code.
I think it is worthwhile to change the above to
	err = verify_mptcpify();

Otherwise, people may confuse that maybe err could be
non-zero before send_byte(client_fd)? If this is the
case, why we did not return earlier? The code
	err = verify_mptcpify()
will make it clear that all previous error
conditions have been handled properly.

> +
> +	close(client_fd);
> +close_server:
> +	close(server_fd);
> +out:
> +	mptcpify__destroy(mptcpify_skel);
> +	return err;
> +}
> +
[...]

