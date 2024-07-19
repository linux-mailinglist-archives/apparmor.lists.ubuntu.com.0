Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBE89372F1
	for <lists+apparmor@lfdr.de>; Fri, 19 Jul 2024 06:08:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sUeuY-0008EQ-C5; Fri, 19 Jul 2024 04:08:02 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sUd2X-0005k9-W0
 for apparmor@lists.ubuntu.com; Fri, 19 Jul 2024 02:08:10 +0000
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-4f2e1093abeso508359e0c.1
 for <apparmor@lists.ubuntu.com>; Thu, 18 Jul 2024 19:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721354888; x=1721959688;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :content-disposition:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7WJIAU9I1siplxW26ihrUPrlbSZPb9UDEgIONz1gVMM=;
 b=RMjVpP1nS10NnUkN17Avx75dHHjWbjZS8oBqCA7suGbfaQ54/eg2f6xlGKjpxd6X0Q
 hcbsj//3ogrr+EjKtXYZMF3YBhmP9sOINaX/v3/unLJc5D/Z1PGriTgHbDcq32dgJtcS
 GgX8NpKhqYlIw6bitqOFRRrujIFv9I/iIMJJNO+NIPToAz1kw8NG2KoTfUvgjODNmLnp
 cnaawlfw4V6Pyk33/bq72AWpVP6OvL81HC+kwtYiNJBQdlp5E4bIJL3RI3QCiJBgl5S5
 cuoou4V2fCZUnhn5lJqEthJha+6Ak72ax/6KW7hIu4Y3QBjxfxYba+953Ka5qkSVUUI4
 OweQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuOwAWSk98I3IIrC7CJMe8OSHM5rUx0X1mbZfrc4lpqGmkC1rMFK9IHTJzqN549yEapzkqL9aiPcmkmcYtxyy+/1t3V/+fN99U
X-Gm-Message-State: AOJu0YwlIOhI3evJ0dob4Bf1HPzyAgXoXiGCJK9s2wUup25L59USsKB6
 ekI0llUnDDmuzrSt0CrizvmgM8cXev5dVLtQxnOZqvl9fwjSrn9t/zT3klT+Aw==
X-Google-Smtp-Source: AGHT+IEfFmWT5d1hhUBnOOZYB8cD3VARfyIizd2JvZZpXpXUEgCBoIWvB9rnP0zsX/VlF1HVVridVA==
X-Received: by 2002:a05:6102:5687:b0:48f:c031:3fa9 with SMTP id
 ada2fe7eead31-4915987763amr8039245137.12.1721354888569; 
 Thu, 18 Jul 2024 19:08:08 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7acb0a15bsm1723896d6.138.2024.07.18.19.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 19:08:08 -0700 (PDT)
Date: Thu, 18 Jul 2024 22:08:07 -0400
Message-ID: <94a3b82a1e3e1fec77d676fa382105d4@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-integrity@vger.kernel.org,
 apparmor@lists.ubuntu.com, selinux@vger.kernel.org
References: <20240711111908.3817636-10-xukuohai@huaweicloud.com>
In-Reply-To: <20240711111908.3817636-10-xukuohai@huaweicloud.com>
Received-SPF: pass client-ip=209.85.221.174; envelope-from=paul@paul-moore.com;
 helo=mail-vk1-f174.google.com
X-Mailman-Approved-At: Fri, 19 Jul 2024 04:07:59 +0000
Subject: Re: [apparmor] [PATCH v4 9/20] lsm: Refactor return value of LSM
	hook key_getsecurity
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
> hook key_getsecurity to 0 or a negative error code.
> 
> Before:
> - Hook key_getsecurity returns length of value on success or a
>   negative error code on failure.
> 
> After:
> - Hook key_getsecurity returns 0 on success or a negative error
>   code on failure. An output parameter @len is introduced to hold
>   the length of value on success.
> 
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  include/linux/lsm_hook_defs.h |  3 ++-
>  include/linux/security.h      |  6 ++++--
>  security/keys/keyctl.c        | 11 ++++++++---
>  security/security.c           | 26 +++++++++++++++++++++-----
>  security/selinux/hooks.c      | 11 +++++------
>  security/smack/smack_lsm.c    | 21 +++++++++++----------
>  6 files changed, 51 insertions(+), 27 deletions(-)

...

> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index 4bc3e9398ee3..e9f857620f28 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -1565,6 +1565,7 @@ long keyctl_get_security(key_serial_t keyid,
>  	struct key *key, *instkey;
>  	key_ref_t key_ref;
>  	char *context;
> +	size_t len;
>  	long ret;
>  
>  	key_ref = lookup_user_key(keyid, KEY_LOOKUP_PARTIAL, KEY_NEED_VIEW);
> @@ -1586,15 +1587,18 @@ long keyctl_get_security(key_serial_t keyid,
>  	}
>  
>  	key = key_ref_to_ptr(key_ref);
> -	ret = security_key_getsecurity(key, &context);
> -	if (ret == 0) {
> +	ret = security_key_getsecurity(key, &context, &len);
> +	if (ret < 0)
> +		goto error;

Since there is already an if-else pattern here you might as well stick
with that, for example:

  if (ret == 0) {
    ...
  } else if (ret > 0) {
    ...
  }

... you should probably add a comment that @ret is -ERRNO on failure,
but it doesn't look like you need an explicit test here since the error
case will normally fall through to the 'error' label (which you shouldn't
need anymore either).

> +	if (len == 0) {
>  		/* if no information was returned, give userspace an empty
>  		 * string */
>  		ret = 1;
>  		if (buffer && buflen > 0 &&
>  		    copy_to_user(buffer, "", 1) != 0)
>  			ret = -EFAULT;
> -	} else if (ret > 0) {
> +	} else {
> +		ret = len;
>  		/* return as much data as there's room for */
>  		if (buffer && buflen > 0) {
>  			if (buflen > ret)
> @@ -1607,6 +1611,7 @@ long keyctl_get_security(key_serial_t keyid,
>  		kfree(context);
>  	}
>  
> +error:
>  	key_ref_put(key_ref);
>  	return ret;
>  }
> diff --git a/security/security.c b/security/security.c
> index 9dd2ae6cf763..2c161101074d 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -5338,19 +5338,35 @@ int security_key_permission(key_ref_t key_ref, const struct cred *cred,
>   * security_key_getsecurity() - Get the key's security label
>   * @key: key
>   * @buffer: security label buffer
> + * @len: the length of @buffer (including terminating NULL) on success
>   *
>   * Get a textual representation of the security context attached to a key for
>   * the purposes of honouring KEYCTL_GETSECURITY.  This function allocates the
>   * storage for the NUL-terminated string and the caller should free it.
>   *
> - * Return: Returns the length of @buffer (including terminating NUL) or -ve if
> - *         an error occurs.  May also return 0 (and a NULL buffer pointer) if
> - *         there is no security label assigned to the key.
> + * Return: Returns 0 on success or -ve if an error occurs. May also return 0
> + *         (and a NULL buffer pointer) if there is no security label assigned
> + *         to the key.
>   */
> -int security_key_getsecurity(struct key *key, char **buffer)
> +int security_key_getsecurity(struct key *key, char **buffer, size_t *len)
>  {
> +	int rc;
> +	size_t n = 0;
> +	struct security_hook_list *hp;
> +
>  	*buffer = NULL;
> -	return call_int_hook(key_getsecurity, key, buffer);
> +
> +	hlist_for_each_entry(hp, &security_hook_heads.key_getsecurity, list) {
> +		rc = hp->hook.key_getsecurity(key, buffer, &n);
> +		if (rc < 0)
> +			return rc;
> +		if (n)
> +			break;
> +	}
> +
> +	*len = n;
> +
> +	return 0;
>  }

Help me understand why we can't continue to use the call_int_hook()
macro here?

> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 16cd336aab3d..747ec602dec0 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -6737,18 +6737,17 @@ static int selinux_key_permission(key_ref_t key_ref,
>  	return avc_has_perm(sid, ksec->sid, SECCLASS_KEY, perm, NULL);
>  }
>  
> -static int selinux_key_getsecurity(struct key *key, char **_buffer)
> +static int selinux_key_getsecurity(struct key *key, char **_buffer,
> +				   size_t *_len)
>  {
>  	struct key_security_struct *ksec = key->security;
>  	char *context = NULL;
> -	unsigned len;
> +	u32 context_len;

Since @len doesn't collide with the parameter, you might as well just
stick with @len as the local variable name.

>  	int rc;
>  
> -	rc = security_sid_to_context(ksec->sid,
> -				     &context, &len);
> -	if (!rc)
> -		rc = len;
> +	rc = security_sid_to_context(ksec->sid, &context, &context_len);
>  	*_buffer = context;
> +	*_len = context_len;
>  	return rc;
>  }

--
paul-moore.com

