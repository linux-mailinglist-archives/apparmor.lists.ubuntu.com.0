Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B28F9372F4
	for <lists+apparmor@lfdr.de>; Fri, 19 Jul 2024 06:08:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sUeuV-0008D8-Uf; Fri, 19 Jul 2024 04:07:59 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sUd2R-0005f1-0H
 for apparmor@lists.ubuntu.com; Fri, 19 Jul 2024 02:08:03 +0000
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e05ebd3d607so1472671276.3
 for <apparmor@lists.ubuntu.com>; Thu, 18 Jul 2024 19:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721354881; x=1721959681;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :content-disposition:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QKuyM+4kk8m0EihN3f+xyfQVB73TFF9bKWS4LxZBLS0=;
 b=sPUguhdfYP/QWsBlnJs5da86Bt6e93XV+mVN8q6bQWMKN15gLkiplYFcG4yHdfLyiF
 uyg/N/MgW8OcndwST36N+r7qZlJe+WIErL+NwVJSXZGmi0NPAuf8zUIucHMfgEfMUaK/
 R9WLWB6fc1oepxFFCOB6t8VxfPrAubqf56uMt/dJsHmS+E4s49EIsFJrZxUyKZVWNxbL
 5XFZv5rKFcRFGsW6XhejdyyRZE5SKLZaDyc4NEwkgNmjzmRxcnRlSF4lZoQIkEcNNafT
 rSCfszfbgqu1Za0LemxS0v6xbEWhawV1is1hRAqn/H7Uon+iDkGsuMhf/SCJD3LBFM0C
 czXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEepkGhEml3LV8CZGGlffU9LqDlzBBPC44+wtPLsTz8Rh25DtZzUXKXvkffHWyxsbXoBbH5faZ2zPnZQVtj3Pq+rKSb5DExg9z
X-Gm-Message-State: AOJu0Yxd22mL+6lOmpIyIYun/rgoW5Ivho9IGe3k9DMauo5HYpkGCp22
 RtRBD+8qWUMKm6nfP0Lt+Va5YXkzNJCvWZNcqqTe0he1TDZwK2JZ1seHUS4jhA==
X-Google-Smtp-Source: AGHT+IFhEnM0FFuvbGMDBqr4RfedhNiC4rUoTP3U8yQRjvYSpvaZNyWktchidi14cnppVOezDB7uag==
X-Received: by 2002:a05:6902:2082:b0:e03:a2d0:3387 with SMTP id
 3f1490d57ef6-e05feb0e4f2mr5413750276.23.1721354881403; 
 Thu, 18 Jul 2024 19:08:01 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a19905a8f3sm21057585a.80.2024.07.18.19.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 19:08:01 -0700 (PDT)
Date: Thu, 18 Jul 2024 22:08:00 -0400
Message-ID: <1cc57fedd0b012874a031dc3d3d4a0fd@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-integrity@vger.kernel.org,
 apparmor@lists.ubuntu.com, selinux@vger.kernel.org
References: <20240711111908.3817636-3-xukuohai@huaweicloud.com>
In-Reply-To: <20240711111908.3817636-3-xukuohai@huaweicloud.com>
Received-SPF: pass client-ip=209.85.219.176; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f176.google.com
X-Mailman-Approved-At: Fri, 19 Jul 2024 04:07:59 +0000
Subject: Re: [apparmor] [PATCH v4 2/20] lsm: Refactor return value of LSM
	hook inode_need_killpriv
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
> hook inode_need_killpriv to 0 or a negative error code.
> 
> Before:
> - Both hook inode_need_killpriv and func security_inode_need_killpriv
>   return > 0 if security_inode_killpriv is required, 0 if not, and < 0
>   to abort the operation.
> 
> After:
> - Both hook inode_need_killpriv and func security_inode_need_killpriv
>   return 0 on success and a negative error code on failure.
>   On success, hook inode_need_killpriv sets output param @need to true
>   if security_inode_killpriv is required, and false if not. When @need
>   is true, func security_inode_need_killpriv sets ATTR_KILL_PRIV flag
>   in @attr; when false, it clears the flag.
>   On failure, @need and @attr remains unchanged.
> 
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  fs/attr.c                     |  5 ++---
>  fs/inode.c                    |  4 +---
>  include/linux/lsm_hook_defs.h |  2 +-
>  include/linux/security.h      | 20 ++++++++++++++++----
>  security/commoncap.c          | 12 ++++++++----
>  security/security.c           | 29 ++++++++++++++++++++++++-----
>  6 files changed, 52 insertions(+), 20 deletions(-)

In general I think a lot of these changes are a good improvement, thank
you very much for the time and effort you've spent on this.  However,
I'm not in favor of passing the new hook parameter as a way of reducing
the number of states represented by the security_inode_killpriv() return
value.  This particular hook may need to remain as one of the odd special
cases.

> diff --git a/fs/attr.c b/fs/attr.c
> index 960a310581eb..aaadc721c982 100644
> --- a/fs/attr.c
> +++ b/fs/attr.c
> @@ -427,11 +427,10 @@ int notify_change(struct mnt_idmap *idmap, struct dentry *dentry,
>  		attr->ia_mtime = timestamp_truncate(attr->ia_mtime, inode);
>  
>  	if (ia_valid & ATTR_KILL_PRIV) {
> -		error = security_inode_need_killpriv(dentry);
> +		error = security_inode_need_killpriv(dentry, &ia_valid);
>  		if (error < 0)
>  			return error;
> -		if (error == 0)
> -			ia_valid = attr->ia_valid &= ~ATTR_KILL_PRIV;
> +		attr->ia_valid = ia_valid;
>  	}
>  
>  	/*
> diff --git a/fs/inode.c b/fs/inode.c
> index 3a41f83a4ba5..cd335dc3a3bc 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2012,11 +2012,9 @@ int dentry_needs_remove_privs(struct mnt_idmap *idmap,
>  		return 0;
>  
>  	mask = setattr_should_drop_suidgid(idmap, inode);
> -	ret = security_inode_need_killpriv(dentry);
> +	ret = security_inode_need_killpriv(dentry, &mask);
>  	if (ret < 0)
>  		return ret;
> -	if (ret)
> -		mask |= ATTR_KILL_PRIV;
>  	return mask;
>  }
>  
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
> index e6e6f8473955..964849de424b 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -165,7 +165,7 @@ LSM_HOOK(int, 0, inode_remove_acl, struct mnt_idmap *idmap,
>  	 struct dentry *dentry, const char *acl_name)
>  LSM_HOOK(void, LSM_RET_VOID, inode_post_remove_acl, struct mnt_idmap *idmap,
>  	 struct dentry *dentry, const char *acl_name)
> -LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
> +LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry, bool *need)
>  LSM_HOOK(int, 0, inode_killpriv, struct mnt_idmap *idmap,
>  	 struct dentry *dentry)
>  LSM_HOOK(int, -EOPNOTSUPP, inode_getsecurity, struct mnt_idmap *idmap,
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 454f96307cb9..1614ef5b2dd2 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -161,7 +161,7 @@ int cap_inode_setxattr(struct dentry *dentry, const char *name,
>  		       const void *value, size_t size, int flags);
>  int cap_inode_removexattr(struct mnt_idmap *idmap,
>  			  struct dentry *dentry, const char *name);
> -int cap_inode_need_killpriv(struct dentry *dentry);
> +int cap_inode_need_killpriv(struct dentry *dentry, bool *need);
>  int cap_inode_killpriv(struct mnt_idmap *idmap, struct dentry *dentry);
>  int cap_inode_getsecurity(struct mnt_idmap *idmap,
>  			  struct inode *inode, const char *name, void **buffer,
> @@ -389,7 +389,7 @@ int security_inode_listxattr(struct dentry *dentry);
>  int security_inode_removexattr(struct mnt_idmap *idmap,
>  			       struct dentry *dentry, const char *name);
>  void security_inode_post_removexattr(struct dentry *dentry, const char *name);
> -int security_inode_need_killpriv(struct dentry *dentry);
> +int security_inode_need_killpriv(struct dentry *dentry, int *attr);
>  int security_inode_killpriv(struct mnt_idmap *idmap, struct dentry *dentry);
>  int security_inode_getsecurity(struct mnt_idmap *idmap,
>  			       struct inode *inode, const char *name,
> @@ -971,9 +971,21 @@ static inline void security_inode_post_removexattr(struct dentry *dentry,
>  						   const char *name)
>  { }
>  
> -static inline int security_inode_need_killpriv(struct dentry *dentry)
> +static inline int security_inode_need_killpriv(struct dentry *dentry, int *attr)
>  {
> -	return cap_inode_need_killpriv(dentry);
> +	int rc;
> +	bool need = false;
> +
> +	rc = cap_inode_need_killpriv(dentry, &need);
> +	if (rc < 0)
> +		return rc;
> +
> +	if (need)
> +		*attr |= ATTR_KILL_PRIV;
> +	else
> +		*attr &= ~ATTR_KILL_PRIV;
> +
> +	return 0;
>  }
>  
>  static inline int security_inode_killpriv(struct mnt_idmap *idmap,
> diff --git a/security/commoncap.c b/security/commoncap.c
> index cefad323a0b1..17d6188d22cf 100644
> --- a/security/commoncap.c
> +++ b/security/commoncap.c
> @@ -286,21 +286,25 @@ int cap_capset(struct cred *new,
>  /**
>   * cap_inode_need_killpriv - Determine if inode change affects privileges
>   * @dentry: The inode/dentry in being changed with change marked ATTR_KILL_PRIV
> + * @need: If inode_killpriv() is needed
>   *
>   * Determine if an inode having a change applied that's marked ATTR_KILL_PRIV
>   * affects the security markings on that inode, and if it is, should
>   * inode_killpriv() be invoked or the change rejected.
>   *
> - * Return: 1 if security.capability has a value, meaning inode_killpriv()
> - * is required, 0 otherwise, meaning inode_killpriv() is not required.
> + * Return: Always returns 0. If security.capability has a value, meaning
> + * inode_killpriv() is required, @need is set to true.
>   */
> -int cap_inode_need_killpriv(struct dentry *dentry)
> +int cap_inode_need_killpriv(struct dentry *dentry, bool *need)
>  {
>  	struct inode *inode = d_backing_inode(dentry);
>  	int error;
>  
>  	error = __vfs_getxattr(dentry, inode, XATTR_NAME_CAPS, NULL, 0);
> -	return error > 0;
> +	if (error > 0)
> +		*need = true;
> +
> +	return 0;
>  }
>  
>  /**
> diff --git a/security/security.c b/security/security.c
> index 3475f0cab3da..a4abcd86eb36 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -2490,17 +2490,36 @@ void security_inode_post_removexattr(struct dentry *dentry, const char *name)
>  /**
>   * security_inode_need_killpriv() - Check if security_inode_killpriv() required
>   * @dentry: associated dentry
> + * @attr: attribute flags
>   *
>   * Called when an inode has been changed to determine if
>   * security_inode_killpriv() should be called.
>   *
> - * Return: Return <0 on error to abort the inode change operation, return 0 if
> - *         security_inode_killpriv() does not need to be called, return >0 if
> - *         security_inode_killpriv() does need to be called.
> + * Return: Return 0 on success, negative error code on failure.
> + *         On success, set ATTR_KILL_PRIV flag in @attr when @need is true,
> + *         clears it when false.
>   */
> -int security_inode_need_killpriv(struct dentry *dentry)
> +int security_inode_need_killpriv(struct dentry *dentry, int *attr)
>  {
> -	return call_int_hook(inode_need_killpriv, dentry);
> +	int rc;
> +	bool need = false;
> +	struct security_hook_list *hp;
> +
> +	hlist_for_each_entry(hp, &security_hook_heads.inode_need_killpriv,
> +			     list) {
> +		rc = hp->hook.inode_need_killpriv(dentry, &need);
> +		if (rc < 0)
> +			return rc;
> +		if (need)
> +			break;
> +	}
> +
> +	if (need)
> +		*attr |= ATTR_KILL_PRIV;
> +	else
> +		*attr &= ~ATTR_KILL_PRIV;
> +
> +	return 0;
>  }
>  
>  /**
> -- 
> 2.30.2

--
paul-moore.com

