Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD9930094
	for <lists+apparmor@lfdr.de>; Fri, 12 Jul 2024 20:49:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sSLKU-0005Bx-TF; Fri, 12 Jul 2024 18:49:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <horms@kernel.org>) id 1sSGNM-0007PW-4l
 for apparmor@lists.ubuntu.com; Fri, 12 Jul 2024 13:31:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A1A9461EFB;
 Fri, 12 Jul 2024 13:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D23C32786;
 Fri, 12 Jul 2024 13:31:42 +0000 (UTC)
Date: Fri, 12 Jul 2024 14:31:41 +0100
From: Simon Horman <horms@kernel.org>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Message-ID: <20240712133141.GB120802@kernel.org>
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
 <20240711111908.3817636-4-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711111908.3817636-4-xukuohai@huaweicloud.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=horms@kernel.org;
 helo=dfw.source.kernel.org
X-Mailman-Approved-At: Fri, 12 Jul 2024 18:49:13 +0000
Subject: Re: [apparmor] [PATCH bpf-next v4 03/20] lsm: Refactor return value
 of LSM hook inode_getsecurity
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
Cc: Matt Bobrowski <mattbobrowski@google.com>, linux-kselftest@vger.kernel.org,
 Shung-Hsi Yu <shung-hsi.yu@suse.com>, Alexei Starovoitov <ast@kernel.org>,
 James Morris <jmorris@namei.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Anna Schumaker <anna@kernel.org>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Edward Cree <ecree.xilinx@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E . Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 KP Singh <kpsingh@kernel.org>, Brendan Jackman <jackmanb@chromium.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 linux-integrity@vger.kernel.org, Hao Luo <haoluo@google.com>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Eduard Zingerman <eddyz87@gmail.com>,
 linux-security-module@vger.kernel.org,
 Khadija Kamran <kamrankhadijadj@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Jul 11, 2024 at 07:18:51PM +0800, Xu Kuohai wrote:
> From: Xu Kuohai <xukuohai@huawei.com>
> 
> To be consistent with most LSM hooks, convert the return value of
> hook inode_getsecurity to 0 or a negative error code.
> 
> Before:
> - Hook inode_getsecurity returns size of buffer on success or a
>   negative error code on failure.
> 
> After:
> - Hook inode_getsecurity returns 0 on success or a negative error
>   code on failure. An output parameter @len is introduced to hold
>   the buffer size on success.
> 
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  fs/xattr.c                    | 19 ++++++++++---------
>  include/linux/lsm_hook_defs.h |  3 ++-
>  include/linux/security.h      | 12 ++++++------
>  security/commoncap.c          |  9 ++++++---
>  security/security.c           | 11 ++++++-----
>  security/selinux/hooks.c      | 16 ++++++----------
>  security/smack/smack_lsm.c    | 14 +++++++-------
>  7 files changed, 43 insertions(+), 41 deletions(-)
> 
> diff --git a/fs/xattr.c b/fs/xattr.c
> index f8b643f91a98..f4e3bedf7272 100644
> --- a/fs/xattr.c
> +++ b/fs/xattr.c
> @@ -339,27 +339,28 @@ xattr_getsecurity(struct mnt_idmap *idmap, struct inode *inode,
>  		  const char *name, void *value, size_t size)
>  {
>  	void *buffer = NULL;
> -	ssize_t len;
> +	int error;
> +	u32 len;
>  
>  	if (!value || !size) {
> -		len = security_inode_getsecurity(idmap, inode, name,
> -						 &buffer, false);
> +		error = security_inode_getsecurity(idmap, inode, name,
> +						   false, &buffer, &len);
>  		goto out_noalloc;
>  	}
>  
> -	len = security_inode_getsecurity(idmap, inode, name, &buffer,
> -					 true);
> -	if (len < 0)
> -		return len;
> +	error = security_inode_getsecurity(idmap, inode, name, true,
> +					   &buffer, &len);
> +	if (error)
> +		return error;
>  	if (size < len) {
> -		len = -ERANGE;
> +		error = -ERANGE;
>  		goto out;
>  	}
>  	memcpy(value, buffer, len);
>  out:
>  	kfree(buffer);
>  out_noalloc:
> -	return len;
> +	return error < 0 ? error : len;

Hi Xu Kuohai,

len is an unsigned 32-bit entity, but the return type of this function
is an unsigned value (ssize_t). So in theory, if len is very large,
a negative error value error will be returned.

>  }

Similarly for the handling of nattr in lsm_get_self_attr in
lsm_syscalls.c in a subsequent patch.

Flagged by Smatch.

...

