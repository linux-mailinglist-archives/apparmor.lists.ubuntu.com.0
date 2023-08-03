Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F9176F61B
	for <lists+apparmor@lfdr.de>; Fri,  4 Aug 2023 01:24:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qRhfc-0006nk-77; Thu, 03 Aug 2023 23:23:52 +0000
Received: from out-88.mta1.migadu.com ([95.215.58.88])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <yonghong.song@linux.dev>) id 1qRhZp-0006aD-GZ
 for apparmor@lists.ubuntu.com; Thu, 03 Aug 2023 23:17:53 +0000
Message-ID: <b9c219e6-e42c-3772-fba8-e40afaad1465@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691104672; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5UcTW2ZerF3E/NIit4kPDouCVNTX9RBlsI5Ewa1ULsM=;
 b=Fsjc8Ltt0taLpi+MclSzQBt+8MTlUJ8c8vCqPf13fjSwgX7el+/jK+lMzp6L2Lw0CINOpz
 50OxThDABRzHVgXUkfNL3OZ+ItQ7RrAD0W0Vdm14Q38UTuGef0HnHmGb2an9ilV3nzU2gi
 RosNEGLXB9iKVo09A0d+mcpJ3il/vFg=
Date: Thu, 3 Aug 2023 16:17:37 -0700
MIME-Version: 1.0
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
 <fc284a49832630e4b908f11c7e07a8066b7bd789.1691069778.git.geliang.tang@suse.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <fc284a49832630e4b908f11c7e07a8066b7bd789.1691069778.git.geliang.tang@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Thu, 03 Aug 2023 23:23:51 +0000
Subject: Re: [apparmor] [PATCH bpf-next v9 1/4] bpf: Add
	update_socket_protocol hook
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
> Add a hook named update_socket_protocol in __sys_socket(), for bpf
> progs to attach to and update socket protocol. One user case is to
> force legacy TCP apps to create and use MPTCP sockets instead of
> TCP ones.
> 
> Define a mod_ret set named bpf_mptcp_fmodret_ids, add the hook
> update_socket_protocol into this set, and register it in
> bpf_mptcp_kfunc_init().
> 
> Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/79
> Acked-by: Matthieu Baerts <matthieu.baerts@tessares.net>
> Signed-off-by: Geliang Tang <geliang.tang@suse.com>
> ---
>   net/mptcp/bpf.c | 17 +++++++++++++++++
>   net/socket.c    | 24 ++++++++++++++++++++++++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/net/mptcp/bpf.c b/net/mptcp/bpf.c
> index 5a0a84ad94af..c43aee31014d 100644
> --- a/net/mptcp/bpf.c
> +++ b/net/mptcp/bpf.c
> @@ -12,6 +12,23 @@
>   #include <linux/bpf.h>
>   #include "protocol.h"
>   
> +#ifdef CONFIG_BPF_JIT

Is this necessary? Most other register_btf_* functions do not have
a config like this.

> +BTF_SET8_START(bpf_mptcp_fmodret_ids)
> +BTF_ID_FLAGS(func, update_socket_protocol)
> +BTF_SET8_END(bpf_mptcp_fmodret_ids)
> +
> +static const struct btf_kfunc_id_set bpf_mptcp_fmodret_set = {
> +	.owner = THIS_MODULE,
> +	.set   = &bpf_mptcp_fmodret_ids,
> +};
> +
> +static int __init bpf_mptcp_kfunc_init(void)
> +{
> +	return register_btf_fmodret_id_set(&bpf_mptcp_fmodret_set);
> +}
> +late_initcall(bpf_mptcp_kfunc_init);
> +#endif /* CONFIG_BPF_JIT */
> +
>   struct mptcp_sock *bpf_mptcp_sock_from_subflow(struct sock *sk)
>   {
>   	if (sk && sk_fullsock(sk) && sk->sk_protocol == IPPROTO_TCP && sk_is_mptcp(sk))
> diff --git a/net/socket.c b/net/socket.c
> index 2b0e54b2405c..9f98ced88ac5 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -1644,11 +1644,35 @@ struct file *__sys_socket_file(int family, int type, int protocol)
>   	return sock_alloc_file(sock, flags, NULL);
>   }
>   
> +/*	A hook for bpf progs to attach to and update socket protocol.
> + *
> + *	A static noinline declaration here could cause the compiler to
> + *	optimize away the function. A global noinline declaration will
> + *	keep the definition, but may optimize away the callsite.
> + *	Therefore, __weak is needed to ensure that the call is still
> + *	emitted, by telling the compiler that we don't know what the
> + *	function might eventually be.
> + *
> + *	__diag_* below are needed to dismiss the missing prototype warning.
> + */
> +
> +__diag_push();
> +__diag_ignore_all("-Wmissing-prototypes",
> +		  "kfuncs which will be used in BPF programs");
> +
> +__weak noinline int update_socket_protocol(int family, int type, int protocol)
> +{
> +	return protocol;
> +}
> +
> +__diag_pop();
> +
>   int __sys_socket(int family, int type, int protocol)
>   {
>   	struct socket *sock;
>   	int flags;
>   
> +	protocol = update_socket_protocol(family, type, protocol);
>   	sock = __sys_socket_create(family, type, protocol);
>   	if (IS_ERR(sock))
>   		return PTR_ERR(sock);

