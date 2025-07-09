Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDC5AFE6A2
	for <lists+apparmor@lfdr.de>; Wed,  9 Jul 2025 13:00:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uZSX9-0000lF-2e; Wed, 09 Jul 2025 11:00:15 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1uZSX6-0000kx-82
 for apparmor@lists.ubuntu.com; Wed, 09 Jul 2025 11:00:12 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 569AxOQL003680;
 Wed, 9 Jul 2025 19:59:24 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 569AxO7L003674
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 9 Jul 2025 19:59:24 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <be405f31-d6d9-4ecd-b941-503b6a5d2011@I-love.SAKURA.ne.jp>
Date: Wed, 9 Jul 2025 19:59:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
References: <20250709080220.110947-1-maxime.belair@canonical.com>
 <20250709080220.110947-4-maxime.belair@canonical.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20250709080220.110947-4-maxime.belair@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Anti-Virus-Server: fsav201.rs.sakura.ne.jp
X-Virus-Status: clean
Received-SPF: pass client-ip=202.181.97.72;
 envelope-from=penguin-kernel@I-love.SAKURA.ne.jp; helo=www262.sakura.ne.jp
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
 linux-kernel@vger.kernel.org, mic@digikod.net, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2025/07/09 17:00, Maxime Bélair wrote:
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
> +
> +
> +	name_size = strncpy_from_user(name, buf, size);
> +	if (name_size < 0) {
> +		kfree(name);
> +		return name_size;
> +	}

name is not '\0'-terminated when name_size == size && 0 < size && size <= AA_PROFILE_NAME_MAX_SIZE.
Please check boundary conditions by writing userspace programs for testing.

> +
> +	ret = aa_change_profile(name, AA_CHANGE_STACK);
> +
> +	kfree(name);
> +
> +	return ret;
> +}


