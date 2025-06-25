Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E9751AE7417
	for <lists+apparmor@lfdr.de>; Wed, 25 Jun 2025 03:09:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uUEe6-0000H9-GC; Wed, 25 Jun 2025 01:09:50 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1uUEe4-0000H1-9b
 for apparmor@lists.ubuntu.com; Wed, 25 Jun 2025 01:09:48 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55P18vOg012417;
 Wed, 25 Jun 2025 10:08:57 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55P18uSx012413
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 25 Jun 2025 10:08:56 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <945bf443-32b4-4432-8702-41ff7b15e420@I-love.SAKURA.ne.jp>
Date: Wed, 25 Jun 2025 10:08:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
References: <20250624143211.436045-1-maxime.belair@canonical.com>
 <20250624143211.436045-3-maxime.belair@canonical.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20250624143211.436045-3-maxime.belair@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav304.rs.sakura.ne.jp
Received-SPF: pass client-ip=202.181.97.72;
 envelope-from=penguin-kernel@I-love.SAKURA.ne.jp; helo=www262.sakura.ne.jp
Subject: Re: [apparmor] [PATCH v3 2/3] lsm: introduce
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
 apparmor@lists.ubuntu.com, jmorris@namei.org, rdunlap@infraread.org,
 mic@digikod.net, takedakn@nttdata.co.jp, linux-kernel@vger.kernel.org,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2025/06/24 23:30, Maxime Bélair wrote:
> +config LSM_CONFIG_SELF_POLICY_MAX_BUFFER_SIZE
> +	int "Maximum buffer size for lsm_config_self_policy"
> +	range 16384 1073741824
> +	depends on SECURITY
> +	default 4194304
> +	help
> +	  The maximum size of the buffer argument of lsm_config_self_policy.
> +
> +	  The default value of 4194304 (4MiB) is reasonable and should be large
> +	  enough to fit policies in for most cases.
> +

Do we want to define LSM_CONFIG_{SELF,SYSTEM}_POLICY_MAX_BUFFER_SIZE as Kconfig?

If security_lsm_config_{self,system}_policy() are meant to be used by multiple
LSM modules, the upper limit each LSM module wants to impose would vary. Also,
1073741824 is larger than KMALLOC_MAX_SIZE; kmalloc()-based memory copying
functions will hit WARN_ON_ONCE_GFP() at __alloc_frozen_pages_noprof().

Since some of LSM modules might use vmalloc()-based memory copying functions from
security_lsm_config_{self,system}_policy(), the upper limit should be imposed by
individual LSM module which provides security_lsm_config_{self,system}_policy().


