Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 285E6B339C2
	for <lists+apparmor@lfdr.de>; Mon, 25 Aug 2025 10:44:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uqSoA-00081o-IN; Mon, 25 Aug 2025 08:44:06 +0000
Received: from smtp-8fab.mail.infomaniak.ch ([83.166.143.171])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mic@digikod.net>) id 1uojgq-0004IP-As
 for apparmor@lists.ubuntu.com; Wed, 20 Aug 2025 14:21:24 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6b])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c6TCR139CzfNT;
 Wed, 20 Aug 2025 16:21:23 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4c6TCM1TCqzPC8; Wed, 20 Aug 2025 16:21:19 +0200 (CEST)
Date: Wed, 20 Aug 2025 16:21:18 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Maxime =?utf-8?Q?B=C3=A9lair?= <maxime.belair@canonical.com>
Message-ID: <20250820.Ao3iquoshaiB@digikod.net>
References: <20250709080220.110947-1-maxime.belair@canonical.com>
 <20250709080220.110947-3-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709080220.110947-3-maxime.belair@canonical.com>
X-Infomaniak-Routing: alpha
Received-SPF: pass client-ip=83.166.143.171; envelope-from=mic@digikod.net;
 helo=smtp-8fab.mail.infomaniak.ch
X-Mailman-Approved-At: Mon, 25 Aug 2025 08:44:05 +0000
Subject: Re: [apparmor] [PATCH v5 2/3] lsm: introduce
	security_lsm_config_*_policy hooks
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
 rdunlap@infradead.org, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 linux-security-module@vger.kernel.org, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jul 09, 2025 at 10:00:55AM +0200, Maxime Bélair wrote:
> Define two new LSM hooks: security_lsm_config_self_policy and
> security_lsm_config_system_policy and wire them into the corresponding
> lsm_config_*_policy() syscalls so that LSMs can register a unified
> interface for policy management. This initial, minimal implementation
> only supports the LSM_POLICY_LOAD operation to limit changes.
> 
> Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
> ---
>  include/linux/lsm_hook_defs.h |  4 +++
>  include/linux/security.h      | 20 ++++++++++++
>  include/uapi/linux/lsm.h      |  8 +++++
>  security/lsm_syscalls.c       | 17 ++++++++--
>  security/security.c           | 60 +++++++++++++++++++++++++++++++++++
>  5 files changed, 107 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
> index bf3bbac4e02a..fca490444643 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -464,3 +464,7 @@ LSM_HOOK(int, 0, bdev_alloc_security, struct block_device *bdev)
>  LSM_HOOK(void, LSM_RET_VOID, bdev_free_security, struct block_device *bdev)
>  LSM_HOOK(int, 0, bdev_setintegrity, struct block_device *bdev,
>  	 enum lsm_integrity_type type, const void *value, size_t size)
> +LSM_HOOK(int, -EINVAL, lsm_config_self_policy, u32 lsm_id, u32 op,
> +	 void __user *buf, size_t size, u32 flags)
> +LSM_HOOK(int, -EINVAL, lsm_config_system_policy, u32 lsm_id, u32 op,
> +	 void __user *buf, size_t size, u32 flags)
> diff --git a/include/linux/security.h b/include/linux/security.h
> index cc9b54d95d22..54acaee4a994 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -581,6 +581,11 @@ void security_bdev_free(struct block_device *bdev);
>  int security_bdev_setintegrity(struct block_device *bdev,
>  			       enum lsm_integrity_type type, const void *value,
>  			       size_t size);
> +int security_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
> +				    size_t size, u32 flags);
> +int security_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
> +				      size_t size, u32 flags);
> +
>  #else /* CONFIG_SECURITY */
>  
>  /**
> @@ -1603,6 +1608,21 @@ static inline int security_bdev_setintegrity(struct block_device *bdev,
>  	return 0;
>  }
>  
> +static inline int security_lsm_config_self_policy(u32 lsm_id, u32 op,
> +						  void __user *buf,
> +						  size_t size, u32 flags)
> +{
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int security_lsm_config_system_policy(u32 lsm_id, u32 op,
> +						    void __user *buf,
> +						    size_t size, u32 flags)
> +{
> +
> +	return -EOPNOTSUPP;
> +}
>  #endif	/* CONFIG_SECURITY */
>  
>  #if defined(CONFIG_SECURITY) && defined(CONFIG_WATCH_QUEUE)
> diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
> index 938593dfd5da..2b9432a30cdc 100644
> --- a/include/uapi/linux/lsm.h
> +++ b/include/uapi/linux/lsm.h
> @@ -90,4 +90,12 @@ struct lsm_ctx {
>   */
>  #define LSM_FLAG_SINGLE	0x0001
>  
> +/*
> + * LSM_POLICY_XXX definitions identify the different operations
> + * to configure LSM policies
> + */
> +
> +#define LSM_POLICY_UNDEF	0
> +#define LSM_POLICY_LOAD		100

Why the gap between 0 and 100?

> +
>  #endif /* _UAPI_LINUX_LSM_H */
> diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
> index a3cb6dab8102..dd016ba6976c 100644
> --- a/security/lsm_syscalls.c
> +++ b/security/lsm_syscalls.c
> @@ -122,11 +122,24 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
>  SYSCALL_DEFINE5(lsm_config_self_policy, u32, lsm_id, u32, op, void __user *,
>  		buf, u32 __user *, size, u32, flags)

Given these are a multiplexor syscalls, I'm wondering if they should not
have common flags and LSM-specific flags.  Alternatively, the op
argument could also contains some optional flags.  In either case, the
documentation should guide LSM developers for flags that may be shared
amongst LSMs.

Examples of such flags could be to restrict the whole process instead of
the calling thread.

>  {
> -	return 0;
> +	size_t usize;
> +
> +	if (get_user(usize, size))

Size should just be u32, not a pointer.

> +		return -EFAULT;
> +
> +	return security_lsm_config_self_policy(lsm_id, op, buf, usize, flags);
>  }
>  
>  SYSCALL_DEFINE5(lsm_config_system_policy, u32, lsm_id, u32, op, void __user *,
>  		buf, u32 __user *, size, u32, flags)
>  {
> -	return 0;
> +	size_t usize;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;

I like this mandatory capability check for this specific syscall.  This
makes the semantic clearer.  However, to avoid the superpower of
CAP_SYS_ADMIN, I'm wondering how we could use the CAP_MAC_ADMIN instead.
This syscall could require CAP_MAC_ADMIN, and current LSMs (relying on a
filesystem interface for policy configuration) could also enforce
CAP_SYS_ADMIN for compatibility reasons.

In fact, this "system" syscall could be a "namespace" syscall, which
would take a security/LSM namespace file descriptor as argument.  If the
namespace is not the initial namespace, any CAP_SYS_ADMIN implemented by
current LSMs could be avoided.  See
https://lore.kernel.org/r/CAHC9VhRGMmhxbajwQNfGFy+ZFF1uN=UEBjqQZQ4UBy7yds3eVQ@mail.gmail.com

> +
> +	if (get_user(usize, size))

ditto

> +		return -EFAULT;
> +
> +	return security_lsm_config_system_policy(lsm_id, op, buf, usize, flags);
>  }
> diff --git a/security/security.c b/security/security.c
> index fb57e8fddd91..166d7d9936d0 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -5883,6 +5883,66 @@ int security_bdev_setintegrity(struct block_device *bdev,
>  }
>  EXPORT_SYMBOL(security_bdev_setintegrity);
>  
> +/**
> + * security_lsm_config_self_policy() - Configure caller's LSM policies
> + * @lsm_id: id of the LSM to target
> + * @op: Operation to perform (one of the LSM_POLICY_XXX values)
> + * @buf: userspace pointer to policy data
> + * @size: size of @buf
> + * @flags: lsm policy configuration flags
> + *
> + * Configure the policies of a LSM for the current domain/user. This notably
> + * allows to update them even when the lsmfs is unavailable or restricted.
> + * Currently, only LSM_POLICY_LOAD is supported.
> + *
> + * Return: Returns 0 on success, error on failure.
> + */
> +int security_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
> +				 size_t size, u32 flags)
> +{
> +	int rc = LSM_RET_DEFAULT(lsm_config_self_policy);
> +	struct lsm_static_call *scall;
> +
> +	lsm_for_each_hook(scall, lsm_config_self_policy) {
> +		if ((scall->hl->lsmid->id) == lsm_id) {
> +			rc = scall->hl->hook.lsm_config_self_policy(lsm_id, op, buf, size, flags);

The lsm_id should not be passed to the hook.

The LSM syscall should manage the argument copy and buffer allocation
instead of duplicating this code in each LSM hook implementation (see
other LSM syscalls).

> +			break;
> +		}
> +	}
> +
> +	return rc;
> +}
> +
> +/**
> + * security_lsm_config_system_policy() - Configure system LSM policies
> + * @lsm_id: id of the lsm to target
> + * @op: Operation to perform (one of the LSM_POLICY_XXX values)
> + * @buf: userspace pointer to policy data
> + * @size: size of @buf
> + * @flags: lsm policy configuration flags
> + *
> + * Configure the policies of a LSM for the whole system. This notably allows
> + * to update them even when the lsmfs is unavailable or restricted. Currently,
> + * only LSM_POLICY_LOAD is supported.
> + *
> + * Return: Returns 0 on success, error on failure.
> + */
> +int security_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
> +				   size_t size, u32 flags)
> +{
> +	int rc = LSM_RET_DEFAULT(lsm_config_system_policy);
> +	struct lsm_static_call *scall;
> +
> +	lsm_for_each_hook(scall, lsm_config_system_policy) {
> +		if ((scall->hl->lsmid->id) == lsm_id) {
> +			rc = scall->hl->hook.lsm_config_system_policy(lsm_id, op, buf, size, flags);

ditto

> +			break;
> +		}
> +	}
> +
> +	return rc;
> +}
> +
>  #ifdef CONFIG_PERF_EVENTS
>  /**
>   * security_perf_event_open() - Check if a perf event open is allowed
> -- 
> 2.48.1
> 
> 

