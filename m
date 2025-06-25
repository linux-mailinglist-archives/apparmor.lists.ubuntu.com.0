Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2217AAE7440
	for <lists+apparmor@lfdr.de>; Wed, 25 Jun 2025 03:21:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uUEpU-0001TX-IR; Wed, 25 Jun 2025 01:21:36 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1uUEpS-0001T9-9u
 for apparmor@lists.ubuntu.com; Wed, 25 Jun 2025 01:21:34 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55P1L8Kq015816;
 Wed, 25 Jun 2025 10:21:08 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55P1L7LF015812
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 25 Jun 2025 10:21:08 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <5313b937-304a-4f2a-8563-3ad1ea194cb9@I-love.SAKURA.ne.jp>
Date: Wed, 25 Jun 2025 10:21:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
References: <20250624143211.436045-1-maxime.belair@canonical.com>
 <20250624143211.436045-4-maxime.belair@canonical.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20250624143211.436045-4-maxime.belair@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Anti-Virus-Server: fsav403.rs.sakura.ne.jp
X-Virus-Status: clean
Received-SPF: pass client-ip=202.181.97.72;
 envelope-from=penguin-kernel@I-love.SAKURA.ne.jp; helo=www262.sakura.ne.jp
Subject: Re: [apparmor] [PATCH v3 3/3] AppArmor: add support for
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
 apparmor@lists.ubuntu.com, jmorris@namei.org, rdunlap@infraread.org,
 mic@digikod.net, takedakn@nttdata.co.jp, linux-kernel@vger.kernel.org,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2025/06/24 23:30, Maxime Bélair wrote:
> +static int apparmor_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
> +				      size_t size, u32 flags)
> +{
> +	char *name = kvmalloc(size, GFP_KERNEL);
> +	long name_size;
> +	int ret;
> +
> +	if (!name)
> +		return -ENOMEM;
> +
> +	if (op != LSM_POLICY_LOAD || flags)

Huge memory leak.

> +		return -EOPNOTSUPP;
> +
> +	name_size = strncpy_from_user(name, buf, size);
> +	if (name_size < 0)

Here too. :-)

> +		return name_size;
> +
> +	ret = aa_change_profile(name, AA_CHANGE_STACK);
> +
> +	kvfree(name);
> +
> +	return ret;
> +}


