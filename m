Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC8AE1181
	for <lists+apparmor@lfdr.de>; Fri, 20 Jun 2025 05:04:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uSS2b-0004qC-Kt; Fri, 20 Jun 2025 03:03:45 +0000
Received: from desiato.infradead.org ([90.155.92.199])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <rdunlap@infradead.org>)
 id 1uSS2Z-0004px-F7
 for apparmor@lists.ubuntu.com; Fri, 20 Jun 2025 03:03:43 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uSS2L-00000004dla-2mTL; Fri, 20 Jun 2025 03:03:30 +0000
Message-ID: <848423f2-65d8-4ae2-a873-2e8cd474ab86@infradead.org>
Date: Thu, 19 Jun 2025 20:03:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
References: <20250619181600.478038-1-maxime.belair@canonical.com>
 <20250619181600.478038-3-maxime.belair@canonical.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250619181600.478038-3-maxime.belair@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=90.155.92.199; envelope-from=rdunlap@infradead.org;
 helo=desiato.infradead.org
Subject: Re: [apparmor] [PATCH v2 2/3] lsm: introduce
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
 penguin-kernel@I-love.SAKURA.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, linux-kernel@vger.kernel.org, mic@digikod.net,
 takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On 6/19/25 11:15 AM, Maxime Bélair wrote:
> Define two new LSM hooks: security_lsm_config_self_policy and
> security_lsm_config_system_policy and wire them into the corresponding
> lsm_config_*_policy() syscalls so that LSMs can register a unified
> interface for policy management. This initial, minimal implementation
> only supports the LSM_POLICY_LOAD operation to limit changes.
> 
> Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
> ---
>  include/linux/lsm_hook_defs.h |  4 ++
>  include/linux/security.h      | 16 ++++++++
>  include/uapi/linux/lsm.h      |  8 ++++
>  security/Kconfig              | 22 +++++++++++
>  security/lsm_syscalls.c       | 17 ++++++++-
>  security/security.c           | 69 +++++++++++++++++++++++++++++++++++
>  6 files changed, 134 insertions(+), 2 deletions(-)
> 

> diff --git a/security/Kconfig b/security/Kconfig
> index 4816fc74f81e..958be7b49a9e 100644
> --- a/security/Kconfig
> +++ b/security/Kconfig
> @@ -220,6 +220,28 @@ config STATIC_USERMODEHELPER_PATH
>  	  If you wish for all usermode helper programs to be disabled,
>  	  specify an empty string here (i.e. "").
>  
> +config LSM_CONFIG_SELF_POLICY_MAX_BUFFER_SIZE
> +	int "Maximum buffer size for lsm_manage_policy"

Update function name.

> +	range 16384 1073741824
> +	depends on SECURITY
> +	default 4194304
> +	help
> +	  The maximum size of the buffer argument of lsm_config_self_policy.
> +
> +	  The default value of 4194304 (4MiB) is reasonable and should be large
> +	  enough to fit policies in for most cases.
> +
> +config LSM_CONFIG_SYSTEM_POLICY_MAX_BUFFER_SIZE
> +	int "Maximum buffer size for lsm_manage_policy"

same here.

> +	range 16384 1073741824
> +	depends on SECURITY
> +	default 4194304
> +	help
> +	  The maximum size of the buffer argument of lsm_config_system_policy.
> +
> +	  The default value of 4194304 (4MiB) is reasonable and should be large
> +	  enough to fit policies in for most cases
> +
>  source "security/selinux/Kconfig"
>  source "security/smack/Kconfig"
>  source "security/tomoyo/Kconfig"


> diff --git a/security/security.c b/security/security.c
> index fb57e8fddd91..8efea2b6e967 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -5883,6 +5883,75 @@ int security_bdev_setintegrity(struct block_device *bdev,
>  }
>  EXPORT_SYMBOL(security_bdev_setintegrity);
>  
> +/**
> + * security_lsm_config_self_policy() - Manage caller's LSM policies
> + * @lsm_id: id of the LSM to target
> + * @op: Operation to perform (one of the LSM_POLICY_XXX values)
> + * @buf: userspace pointer to policy data
> + * @size: size of @buf
> + * @flags: lsm policy management flags
> + *
> + * Manage the policies of a LSM for the current domain/user. This notably allows
> + * to update them even when the lsmfs is unavailable is restricted. Currently,

                                                        or
?

> + * only LSM_POLICY_LOAD is supported.
> + *
> + * Return: Returns 0 on success, error on failure.
> + */
> +int security_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
> +				 size_t size, u32 flags)
> +{
> +	int rc = LSM_RET_DEFAULT(lsm_config_self_policy);
> +	struct lsm_static_call *scall;
> +
> +	if (size > (CONFIG_LSM_CONFIG_SELF_POLICY_MAX_BUFFER_SIZE))
> +		return -E2BIG;
> +
> +	lsm_for_each_hook(scall, lsm_config_self_policy) {
> +		if ((scall->hl->lsmid->id) == lsm_id) {
> +			rc = scall->hl->hook.lsm_config_self_policy(lsm_id, op, buf, size, flags);
> +			break;
> +		}
> +	}
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL(security_lsm_config_self_policy);
> +
> +/**
> + * security_lsm_config_system_policy() - Manage system LSM policies
> + * @lsm_id: id of the lsm to target
> + * @op: Operation to perform (one of the LSM_POLICY_XXX values)
> + * @buf: userspace pointer to policy data
> + * @size: size of @buf
> + * @flags: lsm policy management flags
> + *
> + * Manage the policies of a LSM for the whole system. This notably allows
> + * to update them even when the lsmfs is unavailable is restricted. Currently,

                                                        or
?

> + * only LSM_POLICY_LOAD is supported.
> + *
> + * Return: Returns 0 on success, error on failure.
> + */
> +int security_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
> +				   size_t size, u32 flags)
> +{

[snip]

-- 
~Randy


