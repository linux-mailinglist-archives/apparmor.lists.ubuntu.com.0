Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF40B339C3
	for <lists+apparmor@lfdr.de>; Mon, 25 Aug 2025 10:44:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uqSoA-00081v-Mc; Mon, 25 Aug 2025 08:44:06 +0000
Received: from smtp-bc0b.mail.infomaniak.ch ([45.157.188.11])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mic@digikod.net>) id 1uojh5-0004Lv-Kd
 for apparmor@lists.ubuntu.com; Wed, 20 Aug 2025 14:21:39 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c6TCk5jswzdGp;
 Wed, 20 Aug 2025 16:21:38 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4c6TCk1JbMzwvP; Wed, 20 Aug 2025 16:21:38 +0200 (CEST)
Date: Wed, 20 Aug 2025 16:21:37 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Maxime =?utf-8?Q?B=C3=A9lair?= <maxime.belair@canonical.com>
Message-ID: <20250820.Ohei2aj4ie0a@digikod.net>
References: <20250709080220.110947-1-maxime.belair@canonical.com>
 <20250709080220.110947-4-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709080220.110947-4-maxime.belair@canonical.com>
X-Infomaniak-Routing: alpha
Received-SPF: pass client-ip=45.157.188.11; envelope-from=mic@digikod.net;
 helo=smtp-bc0b.mail.infomaniak.ch
X-Mailman-Approved-At: Mon, 25 Aug 2025 08:44:05 +0000
Subject: Re: [apparmor] [PATCH v5 3/3] AppArmor: add support for
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
 rdunlap@infradead.org, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 linux-security-module@vger.kernel.org, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jul 09, 2025 at 10:00:56AM +0200, Maxime Bélair wrote:
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
>  security/apparmor/apparmorfs.c         | 31 ++++++++++
>  security/apparmor/include/apparmor.h   |  4 ++
>  security/apparmor/include/apparmorfs.h |  3 +
>  security/apparmor/lsm.c                | 84 ++++++++++++++++++++++++++
>  4 files changed, 122 insertions(+)
> 

> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 9b6c2f157f83..0ce40290f44e 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1275,6 +1275,86 @@ static int apparmor_socket_shutdown(struct socket *sock, int how)
>  	return aa_sock_perm(OP_SHUTDOWN, AA_MAY_SHUTDOWN, sock);
>  }
>  
> +/**
> + * apparmor_lsm_config_self_policy - Stack a profile
> + * @lsm_id: AppArmor ID (LSM_ID_APPARMOR). Unused here
> + * @op: operation to perform. Currently, only LSM_POLICY_LOAD is supported
> + * @buf: buffer containing the user-provided name of the profile to stack
> + * @size: size of @buf
> + * @flags: reserved for future use; must be zero
> + *
> + * Returns: 0 on success, negative value on error
> + */
> +static int apparmor_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
> +				      size_t size, u32 flags)
> +{
> +	char *name;
> +	long name_size;
> +	int ret;
> +


> +	if (op != LSM_POLICY_LOAD || flags)
> +		return -EOPNOTSUPP;
> +	if (size == 0)
> +		return -EINVAL;
> +	if (size > AA_PROFILE_NAME_MAX_SIZE)
> +		return -E2BIG;
> +
> +	name = kmalloc(size, GFP_KERNEL);
> +	if (!name)
> +		return -ENOMEM;

This hunk should be part of the syscall code and shared amongst LSMs.

> +
> +
> +	name_size = strncpy_from_user(name, buf, size);
> +	if (name_size < 0) {
> +		kfree(name);
> +		return name_size;
> +	}
> +
> +	ret = aa_change_profile(name, AA_CHANGE_STACK);
> +
> +	kfree(name);
> +
> +	return ret;
> +}

