Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F21476EF13
	for <lists+apparmor@lfdr.de>; Thu,  3 Aug 2023 18:09:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qRast-0007Pd-0q; Thu, 03 Aug 2023 16:09:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <horms@kernel.org>) id 1qRXps-0004Rh-QW
 for apparmor@lists.ubuntu.com; Thu, 03 Aug 2023 12:53:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E0B361D69;
 Thu,  3 Aug 2023 12:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BBEC433C8;
 Thu,  3 Aug 2023 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691067227;
 bh=r4FB9C3DbyML50THOYSEoMjiyY77SgxV2l1qtwpxE3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nN0wvvfqkt0Oh2vmUhgUKxgefq2fjGdBl3Xc1C0D1Hv1tbt26iNf+M/ps2GN9QKkh
 Zzp8aOGK4IJdtlp78ZHErfGc3btpdICVz9a69a8tzFGauOoN8QRlkjiHUSFeerQaeC
 MdNTQg6Pa+W0RXdTbE4nmWBys5er8hvo3aWE9i+uJVTn1EuIMDRakpkWVWdIvGwVBR
 u39lif0pHj6/7hYmNeWAWnbvQigCf8NtUwdzAMM1pCGbXbsHLQuRd/S3zTD7E8ZVlf
 34m/8LH+0HMVIBO9P+jMC2OqUTOdeAPbVnnepr2zeM4fkSbPChud+iiZ1nHCngAz2C
 OoZ/H55FwCmhw==
Date: Thu, 3 Aug 2023 14:53:38 +0200
From: Simon Horman <horms@kernel.org>
To: Geliang Tang <geliang.tang@suse.com>
Message-ID: <ZMujUofDnb8wMb36@kernel.org>
References: <cover.1691047403.git.geliang.tang@suse.com>
 <120b307aacd1791fac016d33e112069ffb7db21a.1691047403.git.geliang.tang@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <120b307aacd1791fac016d33e112069ffb7db21a.1691047403.git.geliang.tang@suse.com>
X-Mailman-Approved-At: Thu, 03 Aug 2023 16:09:04 +0000
Subject: Re: [apparmor] [PATCH bpf-next v8 1/4] bpf: Add
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

On Thu, Aug 03, 2023 at 03:30:39PM +0800, Geliang Tang wrote:
> Add a hook named update_socket_protocol in __sys_socket(), for bpf
> progs to attach to and update socket protocol. One user case is to
> force legacy TCP apps to create and use MPTCP sockets instead of
> TCP ones.
> 
> Define a mod_ret set named bpf_mptcp_fmodret_ids, add the hook
> update_socket_protocol into this set, and register it in
> bpf_mptcp_kfunc_init().
> 
> Signed-off-by: Geliang Tang <geliang.tang@suse.com>

...

> diff --git a/net/socket.c b/net/socket.c
> index 2b0e54b2405c..586a437d7a5e 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -1644,11 +1644,36 @@ struct file *__sys_socket_file(int family, int type, int protocol)
>  	return sock_alloc_file(sock, flags, NULL);
>  }
>  
> +/**

Hi Geliang Tang,

nit: The format of the text below is not in kernel doc format,
     so it is probably better if the comment begins with '/*'
     rather than '/**'.

> + *	A hook for bpf progs to attach to and update socket protocol.
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

...

