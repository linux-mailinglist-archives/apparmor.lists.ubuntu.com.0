Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 085EE9372F0
	for <lists+apparmor@lfdr.de>; Fri, 19 Jul 2024 06:08:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sUeuX-0008E9-Sf; Fri, 19 Jul 2024 04:08:01 +0000
Received: from mail-qv1-f46.google.com ([209.85.219.46])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sUd2R-0005fE-JG
 for apparmor@lists.ubuntu.com; Fri, 19 Jul 2024 02:08:03 +0000
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6b797234b09so13054996d6.0
 for <apparmor@lists.ubuntu.com>; Thu, 18 Jul 2024 19:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721354882; x=1721959682;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :content-disposition:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qpUClzeR8WUAL/85YFkQrfnDMzFYM1Y27FAQCvWcN9Q=;
 b=pBjBKdo6DF68jFdgGe5ipkRpcL71+uRBQLwZLuubjoM6LGQuWB1weyGkq16F7TY6mT
 Jjb2+IGJpmGxsaQbfyyklbLsXJNKvCyp16JdzdpW6treId9CUCN860JAesdUWFJRzD8c
 a/uADHp8XDPU+u3EyFD1McYlTAg3/Wm53flRfCTZ4Q8elbpysCEc5iTaPxp/6QvG2dfH
 UZleDwy6eVGgo5mu0tZdn+MctXOa2jDzzto2qkOBhLO47sydzNNucmi03lKIcIsIHbyn
 6/USkfqtix1NxtqEPT83xiR+5zAJykrtN211olP+LgaBG5OTDEO62gJsfJjfwyuE7Ku8
 FH6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWNwsJ54yFkPSSybXfx4LQjo8LVdH+w8ic7HxTfo2CeLVi83Fp0gxaHqhLbPl2NqIc5Yst+JZ/Efn8QD0NFIqwG5eOAFrQ8bh/
X-Gm-Message-State: AOJu0YzZFsxqC2TF82l2ZKOU1J7o0yAg+j+xbm6Sjk+y+9RHp2ncVc14
 oSyOJPu/Il+MM1v7RFracUhqZlEfpjRoE+by4wKO+FlV3sXf4dDnwYtfgTnxQQ==
X-Google-Smtp-Source: AGHT+IHEUtiYsL4YugJiIyZ94uYFP7Pn9ZMTuclQ82/x8BDKHK0utglqJt/CxhW41ZG/NKpa0e+C4Q==
X-Received: by 2002:a0c:eb83:0:b0:6b2:a68e:6cf5 with SMTP id
 6a1803df08f44-6b79cbe7860mr83634476d6.5.1721354882351; 
 Thu, 18 Jul 2024 19:08:02 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7acaf3bc3sm1717036d6.125.2024.07.18.19.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 19:08:01 -0700 (PDT)
Date: Thu, 18 Jul 2024 22:08:01 -0400
Message-ID: <bae9304f6fd9ac9536f709a990085119@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-integrity@vger.kernel.org,
 apparmor@lists.ubuntu.com, selinux@vger.kernel.org
References: <20240711111908.3817636-4-xukuohai@huaweicloud.com>
In-Reply-To: <20240711111908.3817636-4-xukuohai@huaweicloud.com>
Received-SPF: pass client-ip=209.85.219.46; envelope-from=paul@paul-moore.com;
 helo=mail-qv1-f46.google.com
X-Mailman-Approved-At: Fri, 19 Jul 2024 04:07:59 +0000
Subject: Re: [apparmor] [PATCH v4 3/20] lsm: Refactor return value of LSM
	hook inode_getsecurity
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
Cc: Matt Bobrowski <mattbobrowski@google.com>,
 Shung-Hsi Yu <shung-hsi.yu@suse.com>, Alexei Starovoitov <ast@kernel.org>,
 James Morris <jmorris@namei.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Anna Schumaker <anna@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Edward Cree <ecree.xilinx@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E . Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 KP Singh <kpsingh@kernel.org>, Brendan Jackman <jackmanb@chromium.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, Hao Luo <haoluo@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Eduard Zingerman <eddyz87@gmail.com>,
 Khadija Kamran <kamrankhadijadj@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Jul 11, 2024 Xu Kuohai <xukuohai@huaweicloud.com> wrote:
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

Aside from Simon's concern over variable types, I saw a few other issues
when looking at this patch (below).

> diff --git a/security/commoncap.c b/security/commoncap.c
> index 17d6188d22cf..ff82e2ab6f8f 100644
> --- a/security/commoncap.c
> +++ b/security/commoncap.c
> @@ -485,7 +485,10 @@ int cap_inode_getsecurity(struct mnt_idmap *idmap,
>  	}
>  out_free:
>  	kfree(tmpbuf);
> -	return size;
> +	if (size < 0)
> +		return size;
> +	*len = size;
> +	return 0;
>  }

We should do a better job converting cap_inode_getsecurity(), create a
new local variable, e.g. 'int error', and use it to store and return the
error code instead of reusing @size.  I understand that what you've done
is easier, but I'd prefer to see it done properly.

> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 9cd5a8f1f6a3..70792bba24d9 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -3407,7 +3407,7 @@ static int selinux_path_notify(const struct path *path, u64 mask,
>   */
>  static int selinux_inode_getsecurity(struct mnt_idmap *idmap,
>  				     struct inode *inode, const char *name,
> -				     void **buffer, bool alloc)
> +				     bool alloc, void **buffer, u32 *len)
>  {
>  	u32 size;
>  	int error;
> @@ -3440,14 +3440,14 @@ static int selinux_inode_getsecurity(struct mnt_idmap *idmap,
>  						&context, &size);
>  	if (error)
>  		return error;
> -	error = size;
> +	*len = size;

Depending on how you choose to resolve the variable type issue, you may
be able to pass @len directly to security_sid_to_context().

>  	if (alloc) {
>  		*buffer = context;
>  		goto out_nofree;
>  	}
>  	kfree(context);
>  out_nofree:
> -	return error;
> +	return 0;
>  }


--
paul-moore.com

