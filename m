Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 88730BCD46A
	for <lists+apparmor@lfdr.de>; Fri, 10 Oct 2025 15:32:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7DEe-0003P8-Uk; Fri, 10 Oct 2025 13:32:40 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1v7DEb-0003P0-7m
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 13:32:37 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B2CB83F7D1
 for <apparmor@lists.ubuntu.com>; Fri, 10 Oct 2025 13:32:36 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e36686ca1so20307865e9.2
 for <apparmor@lists.ubuntu.com>; Fri, 10 Oct 2025 06:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103156; x=1760707956;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uImHt0aC/VLvi7JaQjnqrtzU3awc4toIj7D3nFGd2Hg=;
 b=mb3zLk0eRg0Bgrt1EOAZb8eak8FootLwlGw3amj+pJKVVF1hoZcaVeksu84CKu/SyH
 cnoTAGwZX0ovdNL/rCHpHq5XX/AwzkB15W2QDyfIUEJ4DvdXJscBSsZ2MgC0kaJbiF9a
 /aFV/GqyldZ8kwsaQm8r5FRsJRiqPEB+bT+VU63zQmQRRMjWcR2Z9b641DEf9snaxtlw
 OE9Jp7QWTqcDaiTi+4fOhYtLJnNhyQzyCI85TXdZA+zxW8ctmNrGef8uznfxdHbBHojf
 u5sU9IlsZVzELMofR6Qp0tyLHJCE8j6XW1nvSEmSxACCfRagwnYdlEQJPJVpmt+YpNHF
 83Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6jQujSbpd0sK3F2HbI7gUSUN28vqzuXbpGe/QcJK1nHwLO/Gf6SIRD32IRSfQ5BgrFsQO2thqLQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YymiQ1Zbcb4vcUzF8gAP8XIfMHAlo9RHVE6MOBtfNCwKPr9gOuP
 Rf5cOBLW49Gxg7aFGbSf+xWmPq8Dtrryrx+lYDtyjggtbHt3i5nMAwaL4tr3FVOuASph1B5IhN9
 tAWdHhWrGR3o7qJbZTnCVI3h4O0sfmVLPbD88p6A/tHyxP8QmyWU9YvVpsibUQ3kxx4uP0hy1Qv
 +NdA==
X-Gm-Gg: ASbGncu5haaui6ons+fn8g/KdkB7WtOvbOLu6VULAfqDhi3K9iV3dB14IQASXUxDoJ+
 lCMziimp1g6tyAWRGdupYcLX8jX4o3C3ZSYXNKzCdizjb/A8fRkRcQZpdNBp6JEkEqBLAL0AKPA
 7+FxDQFkWvYqpju/MLtibOmi/r3fhf9QyZocjCPlwLxvXFS6X+9Ps7HD/3UkHZG8c3wRPvf2U3N
 0896zj2P+3DkJKpTuHew/he5ZPSLIs8UcmzOVONxSBGHkcIX/5eLXLQkMc+qmQ6lqREpg9QxgCX
 TInb5NKisHYIS8BEDrPuBvoXWs23wEqVJLl3CSaDFWqf/bI+eiT6W0KsJn6jPQBbjhbK6llMepc
 FA3mdZME3cS+jlFP05UfGQRjcf3OT
X-Received: by 2002:a05:600c:4fc9:b0:46e:652e:168f with SMTP id
 5b1f17b1804b1-46fa9a8f0a6mr82265955e9.6.1760103156204; 
 Fri, 10 Oct 2025 06:32:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9wQ1lNN3oOf2OsrpZlPoadyIW4hYvLN1ru9asIjfY67wACdWaMe7gEerawui6Cg9+UuwM3g==
X-Received: by 2002:a05:600c:4fc9:b0:46e:652e:168f with SMTP id
 5b1f17b1804b1-46fa9a8f0a6mr82265635e9.6.1760103155651; 
 Fri, 10 Oct 2025 06:32:35 -0700 (PDT)
Received: from [192.168.1.29] (lau06-h06-176-136-128-80.dsl.sta.abo.bbox.fr.
 [176.136.128.80]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426d0d9050bsm2674441f8f.13.2025.10.10.06.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 06:32:35 -0700 (PDT)
Message-ID: <93e284fe-1627-4c16-b713-b2afefcf3bf4@canonical.com>
Date: Fri, 10 Oct 2025 15:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
References: <20250709080220.110947-1-maxime.belair@canonical.com>
 <20250709080220.110947-3-maxime.belair@canonical.com>
 <20250820.Ao3iquoshaiB@digikod.net>
Content-Language: en-US
From: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Autocrypt: addr=maxime.belair@canonical.com; keydata=
 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
 yriCIKEAbLqHTyj+RhbroZmv5q3X7iVq
In-Reply-To: <20250820.Ao3iquoshaiB@digikod.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 8/20/25 16:21, Mickaël Salaün wrote:
> On Wed, Jul 09, 2025 at 10:00:55AM +0200, Maxime Bélair wrote:
>> Define two new LSM hooks: security_lsm_config_self_policy and
>> security_lsm_config_system_policy and wire them into the corresponding
>> lsm_config_*_policy() syscalls so that LSMs can register a unified
>> interface for policy management. This initial, minimal implementation
>> only supports the LSM_POLICY_LOAD operation to limit changes.
>>
>> Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
>> ---
>>  include/linux/lsm_hook_defs.h |  4 +++
>>  include/linux/security.h      | 20 ++++++++++++
>>  include/uapi/linux/lsm.h      |  8 +++++
>>  security/lsm_syscalls.c       | 17 ++++++++--
>>  security/security.c           | 60 +++++++++++++++++++++++++++++++++++
>>  5 files changed, 107 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
>> index bf3bbac4e02a..fca490444643 100644
>> --- a/include/linux/lsm_hook_defs.h
>> +++ b/include/linux/lsm_hook_defs.h
>> @@ -464,3 +464,7 @@ LSM_HOOK(int, 0, bdev_alloc_security, struct block_device *bdev)
>>  LSM_HOOK(void, LSM_RET_VOID, bdev_free_security, struct block_device *bdev)
>>  LSM_HOOK(int, 0, bdev_setintegrity, struct block_device *bdev,
>>  	 enum lsm_integrity_type type, const void *value, size_t size)
>> +LSM_HOOK(int, -EINVAL, lsm_config_self_policy, u32 lsm_id, u32 op,
>> +	 void __user *buf, size_t size, u32 flags)
>> +LSM_HOOK(int, -EINVAL, lsm_config_system_policy, u32 lsm_id, u32 op,
>> +	 void __user *buf, size_t size, u32 flags)
>> diff --git a/include/linux/security.h b/include/linux/security.h
>> index cc9b54d95d22..54acaee4a994 100644
>> --- a/include/linux/security.h
>> +++ b/include/linux/security.h
>> @@ -581,6 +581,11 @@ void security_bdev_free(struct block_device *bdev);
>>  int security_bdev_setintegrity(struct block_device *bdev,
>>  			       enum lsm_integrity_type type, const void *value,
>>  			       size_t size);
>> +int security_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
>> +				    size_t size, u32 flags);
>> +int security_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
>> +				      size_t size, u32 flags);
>> +
>>  #else /* CONFIG_SECURITY */
>>  
>>  /**
>> @@ -1603,6 +1608,21 @@ static inline int security_bdev_setintegrity(struct block_device *bdev,
>>  	return 0;
>>  }
>>  
>> +static inline int security_lsm_config_self_policy(u32 lsm_id, u32 op,
>> +						  void __user *buf,
>> +						  size_t size, u32 flags)
>> +{
>> +
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static inline int security_lsm_config_system_policy(u32 lsm_id, u32 op,
>> +						    void __user *buf,
>> +						    size_t size, u32 flags)
>> +{
>> +
>> +	return -EOPNOTSUPP;
>> +}
>>  #endif	/* CONFIG_SECURITY */
>>  
>>  #if defined(CONFIG_SECURITY) && defined(CONFIG_WATCH_QUEUE)
>> diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
>> index 938593dfd5da..2b9432a30cdc 100644
>> --- a/include/uapi/linux/lsm.h
>> +++ b/include/uapi/linux/lsm.h
>> @@ -90,4 +90,12 @@ struct lsm_ctx {
>>   */
>>  #define LSM_FLAG_SINGLE	0x0001
>>  
>> +/*
>> + * LSM_POLICY_XXX definitions identify the different operations
>> + * to configure LSM policies
>> + */
>> +
>> +#define LSM_POLICY_UNDEF	0
>> +#define LSM_POLICY_LOAD		100
> 
> Why the gap between 0 and 100?
> 
>> +
>>  #endif /* _UAPI_LINUX_LSM_H */
>> diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
>> index a3cb6dab8102..dd016ba6976c 100644
>> --- a/security/lsm_syscalls.c
>> +++ b/security/lsm_syscalls.c
>> @@ -122,11 +122,24 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
>>  SYSCALL_DEFINE5(lsm_config_self_policy, u32, lsm_id, u32, op, void __user *,
>>  		buf, u32 __user *, size, u32, flags)
> 
> Given these are a multiplexor syscalls, I'm wondering if they should not
> have common flags and LSM-specific flags.  Alternatively, the op
> argument could also contains some optional flags.  In either case, the
> documentation should guide LSM developers for flags that may be shared
> amongst LSMs.
>
> Examples of such flags could be to restrict the whole process instead of
> the calling thread.
>

Indeed, in v6 I used both common_flags and flags. For now I didn't
support any of them to keep this patchset simple but we could discuss
which flags we want to support. 
>>  {
>> -	return 0;
>> +	size_t usize;
>> +
>> +	if (get_user(usize, size))
> 
> Size should just be u32, not a pointer.

Indeed

> 
>> +		return -EFAULT;
>> +
>> +	return security_lsm_config_self_policy(lsm_id, op, buf, usize, flags);
>>  }
>>  
>>  SYSCALL_DEFINE5(lsm_config_system_policy, u32, lsm_id, u32, op, void __user *,
>>  		buf, u32 __user *, size, u32, flags)
>>  {
>> -	return 0;
>> +	size_t usize;
>> +
>> +	if (!capable(CAP_SYS_ADMIN))
>> +		return -EPERM;
> 
> I like this mandatory capability check for this specific syscall.  This
> makes the semantic clearer.  However, to avoid the superpower of
> CAP_SYS_ADMIN, I'm wondering how we could use the CAP_MAC_ADMIN instead.
> This syscall could require CAP_MAC_ADMIN, and current LSMs (relying on a
> filesystem interface for policy configuration) could also enforce
> CAP_SYS_ADMIN for compatibility reasons.

I agree and lsm_config_system_policy is now restricted to CAP_MAC_ADMIN
in v6.

> 
> In fact, this "system" syscall could be a "namespace" syscall, which
> would take a security/LSM namespace file descriptor as argument.  If the
> namespace is not the initial namespace, any CAP_SYS_ADMIN implemented by
> current LSMs could be avoided.  See
> https://lore.kernel.org/r/CAHC9VhRGMmhxbajwQNfGFy+ZFF1uN=UEBjqQZQ4UBy7yds3eVQ@mail.gmail.com

I would appreciate additional feedback on the best way to handle
namespaces for this syscall.

Possible approaches include:
 - Passing a value in buf (as I did patch v6 3/5 for AppArmor). This is
   simple and let individual LSM handle namespaces as see fit. However,
   it may slightly complicate the policy format.
 - Passing a file descriptor as a syscall argument. This offers a cleaner
   interface but couples the pseudofs to this syscall, reducing some of
   its advantages.
 - Providing no support for namespaces at this time.

I tend to prefer the first approach here but I'm open to suggestions

> 
>> +
>> +	if (get_user(usize, size))
> 
> ditto
> 
>> +		return -EFAULT;
>> +
>> +	return security_lsm_config_system_policy(lsm_id, op, buf, usize, flags);
>>  }
>> diff --git a/security/security.c b/security/security.c
>> index fb57e8fddd91..166d7d9936d0 100644
>> --- a/security/security.c
>> +++ b/security/security.c
>> @@ -5883,6 +5883,66 @@ int security_bdev_setintegrity(struct block_device *bdev,
>>  }
>>  EXPORT_SYMBOL(security_bdev_setintegrity);
>>  
>> +/**
>> + * security_lsm_config_self_policy() - Configure caller's LSM policies
>> + * @lsm_id: id of the LSM to target
>> + * @op: Operation to perform (one of the LSM_POLICY_XXX values)
>> + * @buf: userspace pointer to policy data
>> + * @size: size of @buf
>> + * @flags: lsm policy configuration flags
>> + *
>> + * Configure the policies of a LSM for the current domain/user. This notably
>> + * allows to update them even when the lsmfs is unavailable or restricted.
>> + * Currently, only LSM_POLICY_LOAD is supported.
>> + *
>> + * Return: Returns 0 on success, error on failure.
>> + */
>> +int security_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
>> +				 size_t size, u32 flags)
>> +{
>> +	int rc = LSM_RET_DEFAULT(lsm_config_self_policy);
>> +	struct lsm_static_call *scall;
>> +
>> +	lsm_for_each_hook(scall, lsm_config_self_policy) {
>> +		if ((scall->hl->lsmid->id) == lsm_id) {
>> +			rc = scall->hl->hook.lsm_config_self_policy(lsm_id, op, buf, size, flags);
> 
> The lsm_id should not be passed to the hook.

Indeed

> 
> The LSM syscall should manage the argument copy and buffer allocation
> instead of duplicating this code in each LSM hook implementation (see
> other LSM syscalls).

I get your point but methods used internally by LSMs already handle the
allocation themselves through a char __user * parameter.
 - smack: smk_write_rules_list
 - selinux: sel_write_load
 - apparmor: policy_update

Hence, I think that it's actually better to let LSMs handle allocations

> 
>> +			break;
>> +		}
>> +	}
>> +
>> +	return rc;
>> +}
>> +
>> +/**
>> + * security_lsm_config_system_policy() - Configure system LSM policies
>> + * @lsm_id: id of the lsm to target
>> + * @op: Operation to perform (one of the LSM_POLICY_XXX values)
>> + * @buf: userspace pointer to policy data
>> + * @size: size of @buf
>> + * @flags: lsm policy configuration flags
>> + *
>> + * Configure the policies of a LSM for the whole system. This notably allows
>> + * to update them even when the lsmfs is unavailable or restricted. Currently,
>> + * only LSM_POLICY_LOAD is supported.
>> + *
>> + * Return: Returns 0 on success, error on failure.
>> + */
>> +int security_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
>> +				   size_t size, u32 flags)
>> +{
>> +	int rc = LSM_RET_DEFAULT(lsm_config_system_policy);
>> +	struct lsm_static_call *scall;
>> +
>> +	lsm_for_each_hook(scall, lsm_config_system_policy) {
>> +		if ((scall->hl->lsmid->id) == lsm_id) {
>> +			rc = scall->hl->hook.lsm_config_system_policy(lsm_id, op, buf, size, flags);
> 
> ditto
> 
>> +			break;
>> +		}
>> +	}
>> +
>> +	return rc;
>> +}
>> +
>>  #ifdef CONFIG_PERF_EVENTS
>>  /**
>>   * security_perf_event_open() - Check if a perf event open is allowed
>> -- 
>> 2.48.1
>>
>>


