Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7919372EE
	for <lists+apparmor@lfdr.de>; Fri, 19 Jul 2024 06:08:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sUeuY-0008EJ-5s; Fri, 19 Jul 2024 04:08:02 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sUd2V-0005hu-Ri
 for apparmor@lists.ubuntu.com; Fri, 19 Jul 2024 02:08:07 +0000
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-79f06c9c929so83909185a.0
 for <apparmor@lists.ubuntu.com>; Thu, 18 Jul 2024 19:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721354886; x=1721959686;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :content-disposition:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7T3A18YPB97LPR6SF4j8Sn/pZVY1F/IR3nCX5MC7xN8=;
 b=vHfbTDVHPE2fXDSlb3Y4XFKfWcdUnV7UgroFcr9Qwb1UQjqh/6UUS/rUREUYpbk+IF
 Mvs42cWz8bLjBCOP/kzJY9ISK+MSxC2op42qFRAcRWNKp3CRvk4O43taZLkMa2ig73+T
 9//nXo6Tb1t6B/rDW/I5CwbWeBWfeQ+DCKpjjmfi+Ya+sz93h8Y6MWDYlp1oDYC6eOGs
 mGJWYxm8/+TyASk5RGBhfNGNlVg63ZpXAsxKdAGPm2Ic/B2c8ayRPkWdBJiDyxIqrg+9
 JDXVeiFfOyHUlec7ZaVi1D7CxtmD4jbYrAKM4A62goq6FUjrd2c3ZW2NXCMDlJ60Dah3
 s4IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSQDjD8iyOrSyNz4ScS6StnPpaOvyiP+FTJyjpO0ak4XOZhwAojjjjaWvrrTKgoL9XJPGplCUVOwQuAt/FCLNakDVxk4jqloJx
X-Gm-Message-State: AOJu0Yy9pRnk7kEMr90D69qSBrPVUSLDCYVAKpybhDeZ//YhSiWbQUBP
 hZEHA5iAEgjYLcRGoAgJOQdJ+xrWdNyF78ZRrJV5M5hm3f71jCt3m2LMebp84A==
X-Google-Smtp-Source: AGHT+IHgEdIdqfk63w+VB4pfUkz4rCmNInwk3vmByH2HiGhUy6RD2ny0XAt6GVYxWU0i2NMuExmVBA==
X-Received: by 2002:a05:620a:2591:b0:79e:fd1e:6fc4 with SMTP id
 af79cd13be357-7a193b54b5amr412753385a.34.1721354886527; 
 Thu, 18 Jul 2024 19:08:06 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a19909434bsm20720885a.126.2024.07.18.19.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 19:08:06 -0700 (PDT)
Date: Thu, 18 Jul 2024 22:08:05 -0400
Message-ID: <9f26368cc7aeccba460c9bce0a13f301@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-integrity@vger.kernel.org,
 apparmor@lists.ubuntu.com, selinux@vger.kernel.org
References: <20240711111908.3817636-8-xukuohai@huaweicloud.com>
In-Reply-To: <20240711111908.3817636-8-xukuohai@huaweicloud.com>
Received-SPF: pass client-ip=209.85.222.177; envelope-from=paul@paul-moore.com;
 helo=mail-qk1-f177.google.com
X-Mailman-Approved-At: Fri, 19 Jul 2024 04:07:59 +0000
Subject: Re: [apparmor] [PATCH v4 7/20] lsm: Refactor return value of LSM
	hook setprocattr
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
> hook setprocattr to 0 or a negative error code.
> 
> Before:
> - Hook setprocattr returns the number of bytes written on success
>   or a negative error code on failure.
> 
> After:
> - Hook setprocattr returns 0 on success or a negative error code
>   on failure. An output parameter @wbytes is introduced to hold
>   the number of bytes written on success.
> 
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  fs/proc/base.c                |  5 +++--
>  include/linux/lsm_hook_defs.h |  3 ++-
>  include/linux/security.h      |  5 +++--
>  security/apparmor/lsm.c       | 10 +++++++---
>  security/security.c           |  8 +++++---
>  security/selinux/hooks.c      | 11 ++++++++---
>  security/smack/smack_lsm.c    | 14 ++++++++++----
>  7 files changed, 38 insertions(+), 18 deletions(-)

The security_setprocattr() hook is another odd case that we probably
just want to leave alone for two reasons:

1. With the move to LSM syscalls for getting/setting a task's LSM
attributes we are "freezing" the procfs API and not adding any new
entries to it.

2. The BPF LSM doesn't currently register any procfs entries.

I'd suggest leaving security_setprocattr() as-is and blocking it in
the BPF verifier, I can't see any reason why a BPF LSM would need
this hook.

> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index 72a1acd03675..9e1cf6cc674d 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -2740,6 +2740,7 @@ static ssize_t proc_pid_attr_write(struct file * file, const char __user * buf,
>  {
>  	struct inode * inode = file_inode(file);
>  	struct task_struct *task;
> +	size_t wbytes;
>  	void *page;
>  	int rv;
>  
> @@ -2785,12 +2786,12 @@ static ssize_t proc_pid_attr_write(struct file * file, const char __user * buf,
>  
>  	rv = security_setprocattr(PROC_I(inode)->op.lsmid,
>  				  file->f_path.dentry->d_name.name, page,
> -				  count);
> +				  count, &wbytes);
>  	mutex_unlock(&current->signal->cred_guard_mutex);
>  out_free:
>  	kfree(page);
>  out:
> -	return rv;
> +	return rv < 0 ? rv : wbytes;
>  }
>  
>  static const struct file_operations proc_pid_attr_operations = {
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
> index dbc16f14f42f..2628514bb19c 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -287,7 +287,8 @@ LSM_HOOK(int, -EOPNOTSUPP, setselfattr, unsigned int attr,
>  	 struct lsm_ctx *ctx, u32 size, u32 flags)
>  LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, const char *name,
>  	 char **value)
> -LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size)
> +LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size,
> +	 size_t *wbytes)
>  LSM_HOOK(int, 0, ismaclabel, const char *name)
>  LSM_HOOK(int, -EOPNOTSUPP, secid_to_secctx, u32 secid, char **secdata,
>  	 u32 *seclen)
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 96a63e132abf..1f1a9696e65d 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -496,7 +496,8 @@ int security_setselfattr(unsigned int attr, struct lsm_ctx __user *ctx,
>  			 u32 size, u32 flags);
>  int security_getprocattr(struct task_struct *p, int lsmid, const char *name,
>  			 char **value);
> -int security_setprocattr(int lsmid, const char *name, void *value, size_t size);
> +int security_setprocattr(int lsmid, const char *name, void *value, size_t size,
> +			 size_t *wbytes);
>  int security_netlink_send(struct sock *sk, struct sk_buff *skb);
>  int security_ismaclabel(const char *name);
>  int security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen);
> @@ -1440,7 +1441,7 @@ static inline int security_getprocattr(struct task_struct *p, int lsmid,
>  }
>  
>  static inline int security_setprocattr(int lsmid, char *name, void *value,
> -				       size_t size)
> +				       size_t size, size_t *wbytes)
>  {
>  	return -EINVAL;
>  }
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 72dd09993f28..6c8b1f8c5781 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -939,13 +939,17 @@ static int apparmor_setselfattr(unsigned int attr, struct lsm_ctx *ctx,
>  }
>  
>  static int apparmor_setprocattr(const char *name, void *value,
> -				size_t size)
> +				size_t size, size_t *wbytes)
>  {
> +	int rc = -EINVAL;
>  	int attr = lsm_name_to_attr(name);
>  
>  	if (attr)
> -		return do_setattr(attr, value, size);
> -	return -EINVAL;
> +		rc = do_setattr(attr, value, size);
> +	if (rc < 0)
> +		return rc;
> +	*wbytes = rc;
> +	return 0;
>  }
>  
>  /**
> diff --git a/security/security.c b/security/security.c
> index 095e78efcb32..9685096dbf16 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -4141,20 +4141,22 @@ int security_getprocattr(struct task_struct *p, int lsmid, const char *name,
>   * @name: attribute name
>   * @value: attribute value
>   * @size: attribute value size
> + * @wbytes: bytes written on success
>   *
>   * Write (set) the current task's attribute @name to @value, size @size if
>   * allowed.
>   *
> - * Return: Returns bytes written on success, a negative value otherwise.
> + * Return: Returns 0 on success, a negative error code otherwise.
>   */
> -int security_setprocattr(int lsmid, const char *name, void *value, size_t size)
> +int security_setprocattr(int lsmid, const char *name, void *value, size_t size,
> +			 size_t *wbytes)
>  {
>  	struct security_hook_list *hp;
>  
>  	hlist_for_each_entry(hp, &security_hook_heads.setprocattr, list) {
>  		if (lsmid != 0 && lsmid != hp->lsmid->id)
>  			continue;
> -		return hp->hook.setprocattr(name, value, size);
> +		return hp->hook.setprocattr(name, value, size, wbytes);
>  	}
>  	return LSM_RET_DEFAULT(setprocattr);
>  }
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 0d35bb93baca..7a73f3710025 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -6589,13 +6589,18 @@ static int selinux_getprocattr(struct task_struct *p,
>  	return -EINVAL;
>  }
>  
> -static int selinux_setprocattr(const char *name, void *value, size_t size)
> +static int selinux_setprocattr(const char *name, void *value, size_t size,
> +			       size_t *wbytes)
>  {
> +	int rc = -EINVAL;
>  	int attr = lsm_name_to_attr(name);
>  
>  	if (attr)
> -		return selinux_lsm_setattr(attr, value, size);
> -	return -EINVAL;
> +		rc = selinux_lsm_setattr(attr, value, size);
> +	if (rc < 0)
> +		return rc;
> +	*wbytes = rc;
> +	return 0;
>  }
>  
>  static int selinux_ismaclabel(const char *name)
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 63d9c5f456c1..4265f2639106 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -3797,19 +3797,25 @@ static int smack_setselfattr(unsigned int attr, struct lsm_ctx *ctx,
>   * @name: the name of the attribute in /proc/.../attr
>   * @value: the value to set
>   * @size: the size of the value
> + * @wbytes: the length of the smack label written
>   *
>   * Sets the Smack value of the task. Only setting self
>   * is permitted and only with privilege
>   *
> - * Returns the length of the smack label or an error code
> + * Returns 0 on success or a negative error code
>   */
> -static int smack_setprocattr(const char *name, void *value, size_t size)
> +static int smack_setprocattr(const char *name, void *value, size_t size,
> +			     size_t *wbytes)
>  {
> +	int rc = -EINVAL;
>  	int attr = lsm_name_to_attr(name);
>  
>  	if (attr != LSM_ATTR_UNDEF)
> -		return do_setattr(attr, value, size);
> -	return -EINVAL;
> +		rc = do_setattr(attr, value, size);
> +	if (rc < 0)
> +		return rc;
> +	*wbytes = rc;
> +	return 0;
>  }
>  
>  /**
> -- 
> 2.30.2

--
paul-moore.com

