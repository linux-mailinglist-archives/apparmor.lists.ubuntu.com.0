Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 30191773547
	for <lists+apparmor@lfdr.de>; Tue,  8 Aug 2023 01:58:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qTA6w-0001GQ-Lk; Mon, 07 Aug 2023 23:58:06 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qTA6v-0001G8-70
 for apparmor@lists.ubuntu.com; Mon, 07 Aug 2023 23:58:05 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B3F773F2F7; 
 Mon,  7 Aug 2023 23:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1691452685;
 bh=ap01lbIjogyXwuc8ov5idm6Zxort8lSG9iIobzYlHJA=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=Tsd9+HrVyz6johHTkV1KJIJ9uWTfZoJLtE87GrpnQ40N/ppZ0u9uoOB1LR7ZBuleB
 H8bL+U0J+OyrFEqSsZ9Bzperq/bhCjGwlrzDmXjrw45NQy9LmSE0vh5IYPTUC9UiEY
 7D6PCmAYfCnApFEgT9LCexVYhAbPcsFTbjMklwyFFDy2mALlFTrpIqoWs5iiIFV/hh
 3Z3GcJ/TPjFZWbaDrojdozM5WuQOouO6cm/QAhaFfHrjKwicZZuaqu+sdRmWeYvisJ
 I1Y6IlqNkcYVDnAg8yFX9Sqc2byAAzJfKUxoXFJhvrSwW3k9dQPL0y2zIV28bHnrdK
 ti1L/b+OhzyEA==
Message-ID: <e195ae10-725d-d06c-a452-72744aa8ba89@canonical.com>
Date: Mon, 7 Aug 2023 16:58:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Khadija Kamran <kamrankhadijadj@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>, paul@paul-moore.com,
 stephen.smalley.work@gmail.com, eparis@parisplace.org,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org, jmorris@namei.org,
 serge@hallyn.com, linux-security-module@vger.kernel.org,
 apparmor@lists.ubuntu.com, ztarkhani@microsoft.com
References: <ZNCWUQXKrZnCeB/5@gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <ZNCWUQXKrZnCeB/5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH v2] lsm: constify the 'target' parameter in
 security_capget()
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 8/6/23 23:59, Khadija Kamran wrote:
> Three LSMs register the implementations for the "capget" hook: AppArmor,
> SELinux, and the normal capability code. Looking at the function
> implementations we may observe that the first parameter "target" is not
> changing.
> 
> Mark the first argument "target" of LSM hook security_capget() as
> "const" since it will not be changing in the LSM hook.
> 
> cap_capget() LSM hook declaration exceeds the 80 characters per line
> limit. Split the function declaration to multple lines to decrease the
> line length.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
> Changes in v2:
>   - Squash the patches 1/2 and 2/2 into a single patch
>   - Simplify the commit message
> 
>   include/linux/lsm_hook_defs.h | 2 +-
>   include/linux/security.h      | 7 ++++---
>   kernel/capability.c           | 2 +-
>   security/apparmor/lsm.c       | 2 +-
>   security/commoncap.c          | 2 +-
>   security/security.c           | 2 +-
>   security/selinux/hooks.c      | 2 +-
>   7 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
> index 6bb55e61e8e8..fd3844e11077 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -36,7 +36,7 @@ LSM_HOOK(int, 0, binder_transfer_file, const struct cred *from,
>   LSM_HOOK(int, 0, ptrace_access_check, struct task_struct *child,
>   	 unsigned int mode)
>   LSM_HOOK(int, 0, ptrace_traceme, struct task_struct *parent)
> -LSM_HOOK(int, 0, capget, struct task_struct *target, kernel_cap_t *effective,
> +LSM_HOOK(int, 0, capget, const struct task_struct *target, kernel_cap_t *effective,
>   	 kernel_cap_t *inheritable, kernel_cap_t *permitted)
>   LSM_HOOK(int, 0, capset, struct cred *new, const struct cred *old,
>   	 const kernel_cap_t *effective, const kernel_cap_t *inheritable,
> diff --git a/include/linux/security.h b/include/linux/security.h
> index e2734e9e44d5..fef65d0e522d 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -145,7 +145,8 @@ extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
>   extern int cap_settime(const struct timespec64 *ts, const struct timezone *tz);
>   extern int cap_ptrace_access_check(struct task_struct *child, unsigned int mode);
>   extern int cap_ptrace_traceme(struct task_struct *parent);
> -extern int cap_capget(struct task_struct *target, kernel_cap_t *effective, kernel_cap_t *inheritable, kernel_cap_t *permitted);
> +extern int cap_capget(const struct task_struct *target, kernel_cap_t *effective,
> +					  kernel_cap_t *inheritable, kernel_cap_t *permitted);
>   extern int cap_capset(struct cred *new, const struct cred *old,
>   		      const kernel_cap_t *effective,
>   		      const kernel_cap_t *inheritable,
> @@ -271,7 +272,7 @@ int security_binder_transfer_file(const struct cred *from,
>   				  const struct cred *to, struct file *file);
>   int security_ptrace_access_check(struct task_struct *child, unsigned int mode);
>   int security_ptrace_traceme(struct task_struct *parent);
> -int security_capget(struct task_struct *target,
> +int security_capget(const struct task_struct *target,
>   		    kernel_cap_t *effective,
>   		    kernel_cap_t *inheritable,
>   		    kernel_cap_t *permitted);
> @@ -553,7 +554,7 @@ static inline int security_ptrace_traceme(struct task_struct *parent)
>   	return cap_ptrace_traceme(parent);
>   }
>   
> -static inline int security_capget(struct task_struct *target,
> +static inline int security_capget(const struct task_struct *target,
>   				   kernel_cap_t *effective,
>   				   kernel_cap_t *inheritable,
>   				   kernel_cap_t *permitted)
> diff --git a/kernel/capability.c b/kernel/capability.c
> index 3e058f41df32..67bdee3414dd 100644
> --- a/kernel/capability.c
> +++ b/kernel/capability.c
> @@ -112,7 +112,7 @@ static inline int cap_get_target_pid(pid_t pid, kernel_cap_t *pEp,
>   	int ret;
>   
>   	if (pid && (pid != task_pid_vnr(current))) {
> -		struct task_struct *target;
> +		const struct task_struct *target;
>   
>   		rcu_read_lock();
>   
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index f431251ffb91..12dd96c3b2f0 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -144,7 +144,7 @@ static int apparmor_ptrace_traceme(struct task_struct *parent)
>   }
>   
>   /* Derived from security/commoncap.c:cap_capget */
> -static int apparmor_capget(struct task_struct *target, kernel_cap_t *effective,
> +static int apparmor_capget(const struct task_struct *target, kernel_cap_t *effective,
>   			   kernel_cap_t *inheritable, kernel_cap_t *permitted)
>   {
>   	struct aa_label *label;
> diff --git a/security/commoncap.c b/security/commoncap.c
> index 0b3fc2f3afe7..5fd64d3e5bfd 100644
> --- a/security/commoncap.c
> +++ b/security/commoncap.c
> @@ -197,7 +197,7 @@ int cap_ptrace_traceme(struct task_struct *parent)
>    * This function retrieves the capabilities of the nominated task and returns
>    * them to the caller.
>    */
> -int cap_capget(struct task_struct *target, kernel_cap_t *effective,
> +int cap_capget(const struct task_struct *target, kernel_cap_t *effective,
>   	       kernel_cap_t *inheritable, kernel_cap_t *permitted)
>   {
>   	const struct cred *cred;
> diff --git a/security/security.c b/security/security.c
> index d5ff7ff45b77..fb2d93b481f1 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -893,7 +893,7 @@ int security_ptrace_traceme(struct task_struct *parent)
>    *
>    * Return: Returns 0 if the capability sets were successfully obtained.
>    */
> -int security_capget(struct task_struct *target,
> +int security_capget(const struct task_struct *target,
>   		    kernel_cap_t *effective,
>   		    kernel_cap_t *inheritable,
>   		    kernel_cap_t *permitted)
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 79b4890e9936..ff42d49f1b41 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -2056,7 +2056,7 @@ static int selinux_ptrace_traceme(struct task_struct *parent)
>   			    SECCLASS_PROCESS, PROCESS__PTRACE, NULL);
>   }
>   
> -static int selinux_capget(struct task_struct *target, kernel_cap_t *effective,
> +static int selinux_capget(const struct task_struct *target, kernel_cap_t *effective,
>   			  kernel_cap_t *inheritable, kernel_cap_t *permitted)
>   {
>   	return avc_has_perm(current_sid(), task_sid_obj(target),


