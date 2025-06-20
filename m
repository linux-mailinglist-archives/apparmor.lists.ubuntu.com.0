Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D388AE1193
	for <lists+apparmor@lfdr.de>; Fri, 20 Jun 2025 05:09:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uSS7z-0005GN-CC; Fri, 20 Jun 2025 03:09:19 +0000
Received: from desiato.infradead.org ([90.155.92.199])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <rdunlap@infradead.org>)
 id 1uSS7w-0005GB-UM
 for apparmor@lists.ubuntu.com; Fri, 20 Jun 2025 03:09:16 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uSS7r-00000004dnK-0wVr; Fri, 20 Jun 2025 03:09:11 +0000
Message-ID: <867c16fe-da0f-43d0-99ca-cba8f3c1f274@infradead.org>
Date: Thu, 19 Jun 2025 20:09:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
References: <20250619181600.478038-1-maxime.belair@canonical.com>
 <20250619181600.478038-4-maxime.belair@canonical.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250619181600.478038-4-maxime.belair@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=90.155.92.199; envelope-from=rdunlap@infradead.org;
 helo=desiato.infradead.org
Subject: Re: [apparmor] [PATCH v2 3/3] AppArmor: add support for
 lsm_config_self_policy and lsm_config_system_policy
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
Cc: paul@paul-moore.com, song@kernel.org, kees@kernel.org,
 linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@I-love.SAKURA.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, linux-kernel@vger.kernel.org, mic@digikod.net,
 takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On 6/19/25 11:15 AM, Maxime Bélair wrote:
> Enable users to manage AppArmor policies through the new hooks
> lsm_config_self_policy and lsm_config_system_policy.
> 
> lsm_config_self_policy allows stacking existing policies in the kernel.
> This ensures that it can only further restrict the caller and can never
> be used to gain new privileges.
> 
> lsm_config_system_policy allows loading or replacing AppArmor policies in
> any AppArmor namespace.
> 
> Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
> ---
>  security/apparmor/apparmorfs.c         | 31 +++++++++++++
>  security/apparmor/include/apparmorfs.h |  3 ++
>  security/apparmor/lsm.c                | 63 ++++++++++++++++++++++++++
>  3 files changed, 97 insertions(+)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 6039afae4bfc..827fe06b20ac 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -439,6 +439,37 @@ static ssize_t policy_update(u32 mask, const char __user *buf, size_t size,
>  	return error;
>  }
>  
> +/**
> + * aa_profile_load_ns_name - load a profile into the current namespace identified by name
> + * @name The name of the namesapce to load the policy in. "" for root_ns
> + * @name_size size of @name. 0 For root ns
> + * @buf buffer containing the user-provided policy
> + * @size size of @buf
> + * @ppos position pointer in the file

Please use proper kernel-doc syntax above. Each @var_name should be followed
by a ':'.

> + *
> + * Returns: 0 on success, negative value on error
> + */
> +ssize_t aa_profile_load_ns_name(char *name, size_t name_size, const void __user *buf,
> +				size_t size, loff_t *ppos)
> +{
> +	struct aa_ns *ns;
> +
> +	if (name_size == 0)
> +		ns = aa_get_ns(root_ns);
> +	else
> +		ns = aa_lookupn_ns(root_ns, name, name_size);
> +
> +	if (!ns)
> +		return -EINVAL;
> +
> +	int error = policy_update(AA_MAY_LOAD_POLICY | AA_MAY_REPLACE_POLICY,
> +				  buf, size, ppos, ns);
> +
> +	aa_put_ns(ns);
> +
> +	return error >= 0 ? 0 : error;
> +}
> +
>  /* .load file hook fn to load policy */
>  static ssize_t profile_load(struct file *f, const char __user *buf, size_t size,
>  			    loff_t *pos)

> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 9b6c2f157f83..b38c4926cdc2 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1275,6 +1275,65 @@ static int apparmor_socket_shutdown(struct socket *sock, int how)
>  	return aa_sock_perm(OP_SHUTDOWN, AA_MAY_SHUTDOWN, sock);
>  }
>  
> +/**
> + * apparmor_lsm_config_self_policy - Stack a profile
> + * @buf: buffer containing the user-provided name of the profile to stack
> + * @size: size of @buf

Describe all function parameters in kernel-doc above.

> + *
> + * Returns: 0 on success, negative value on error
> + */
> +static int apparmor_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
> +				      size_t size, u32 flags)
> +{
> +	char *name = kvmalloc(size, GFP_KERNEL);

Check return value (i.e., name) before use?

> +	long name_size;> +	int ret;
> +
> +	if (op != LSM_POLICY_LOAD || flags)
> +		return -EOPNOTSUPP;
> +
> +	name_size = strncpy_from_user(name, buf, size);
> +	if (name_size < 0)
> +		return name_size;
> +
> +	ret = aa_change_profile(name, AA_CHANGE_STACK);
> +
> +	kvfree(name);
> +
> +	return ret;
> +}
> +
> +/**
> + * apparmor_lsm_config_system_policy - Load or replace a system policy
> + * @buf: user-supplied buffer in the form "<ns>\0<policy>"
> + *        <ns> is the namespace to load the policy into (empty string for root)
> + *        <policy> is the policy to load
> + * then '\0' then the policy to load

Misplaced line?

> + * @size: size of @buf

Please describe all function parameters in kernel-doc notation.

> + *
> + * Returns: 0 on success, negative value on error
> + */
> +static int apparmor_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
> +				      size_t size, u32 flags)
> +{

[snip]

-- 
~Randy


