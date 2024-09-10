Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18797448D
	for <lists+apparmor@lfdr.de>; Tue, 10 Sep 2024 23:08:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1so85h-0004dw-ER; Tue, 10 Sep 2024 21:08:01 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1so85f-0004dV-Nk
 for apparmor@lists.ubuntu.com; Tue, 10 Sep 2024 21:07:59 +0000
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7a99c99acf7so450519185a.1
 for <apparmor@lists.ubuntu.com>; Tue, 10 Sep 2024 14:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726002478; x=1726607278;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :content-disposition:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xsgweXIpmstBe5GJ597qL3m2SDBc+q8DcPeq2Npix+U=;
 b=l5RbjuXcXxm3vNVEnz4b5eIuWHV6XDDfCjRSlCDyao74J10GgHQBQ8fDMZHuHJFjGb
 gMEnFCzt8YPyTUJyA6jQ1RTNQ43M2suV1GzuRg9E3RLfnPIFilC0gVOnM/8wLyzqk6iH
 1H0Eb15rqC8SPZBmLutvFLm7onax0UAHedk9IOXqmBceLMGoMTBZTOL9HBftBLJiZuIg
 mB/MneS5PVZ+bTpEwz68N5WUwZwl1al1q3G2kqYERtZXgfzQmOHp24dbw6ty6UsvTvhz
 tyoRMBNlYLeI+yFOE07ieLgU1/IfFn+ixv8xwmLezyUoB9RYODV6V3bxtP6fdJQVkBXv
 +n0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVacOY3QsxJ+0gMavujBsFOZwXNldJq7E2Pa801CsQsqsr0MmbzaZo9hy7Ys2y0yTVDfXPJuJZk0A==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yxu1jm0RqHWrLe1HeVW6VfyOgvMFZlSq/CevGnmn/Xaxa15NXji
 sjjeHS5Wzso1IsfiXcgHKND7ZrmKzy9bOdbxLsayQV8cokD0DsayeM2TRjXdMw==
X-Google-Smtp-Source: AGHT+IGdN3Bip/QFL1/JxWNAkcL/JUmgw8uKd+/pDtMXUXN6GSGIZoTS92X+BzdXp0VO+irY5HiZ9w==
X-Received: by 2002:a05:620a:491:b0:7a9:9ed7:b49f with SMTP id
 af79cd13be357-7a99ed7bed2mr1837046285a.38.1726002478185; 
 Tue, 10 Sep 2024 14:07:58 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a9a79972e3sm343656385a.68.2024.09.10.14.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 14:07:57 -0700 (PDT)
Date: Tue, 10 Sep 2024 17:07:57 -0400
Message-ID: <47697d5f8d557113244b7c044251fe09@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Jann Horn <jannh@google.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 John Johansen <john.johansen@canonical.com>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Casey Schaufler <casey@schaufler-ca.com>
References: <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
In-Reply-To: <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
Received-SPF: pass client-ip=209.85.222.170; envelope-from=paul@paul-moore.com;
 helo=mail-qk1-f170.google.com
Subject: Re: [apparmor] [PATCH v2 1/2] KEYS: use synchronous task work for
	changing parent credentials
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
Cc: Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Aug  5, 2024 Jann Horn <jannh@google.com> wrote:
> 
> keyctl_session_to_parent() involves posting task work to the parent task,
> with work function key_change_session_keyring.
> Because the task work in the parent runs asynchronously, no errors can be
> returned back to the caller of keyctl_session_to_parent(), and therefore
> the work function key_change_session_keyring() can't be allowed to fail due
> to things like memory allocation failure or permission checks - all
> allocations and checks have to happen in the child.
> 
> This is annoying for two reasons:
> 
>  - It is the only reason why cred_alloc_blank() and
>    security_transfer_creds() are necessary.
>  - It means we can't do synchronous permission checks.
> 
> Rewrite keyctl_session_to_parent() to run task work on the parent
> synchronously, so that any errors that happen in the task work can be
> plumbed back into the syscall return value in the child.
> This allows us to get rid of cred_alloc_blank() and
> security_transfer_creds() in a later commit, and it will make it possible
> to write more reliable security checks for this operation.
> 
> Note that this requires using TWA_SIGNAL instead of TWA_RESUME, so the
> parent might observe some spurious -EAGAIN syscall returns or such; but the
> parent likely anyway has to be ready to deal with the side effects of
> receiving signals (since it'll probably get SIGCHLD when the child dies),
> so that probably isn't an issue.
> 
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  security/keys/internal.h     |   8 ++++
>  security/keys/keyctl.c       | 107 +++++++++++++------------------------------
>  security/keys/process_keys.c |  86 ++++++++++++++++++----------------
>  3 files changed, 87 insertions(+), 114 deletions(-)

...

> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index ab927a142f51..e4cfe5c4594a 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -1616,104 +1616,63 @@ long keyctl_get_security(key_serial_t keyid,
>   * parent process.
>   *
>   * The keyring must exist and must grant the caller LINK permission, and the
>   * parent process must be single-threaded and must have the same effective
>   * ownership as this process and mustn't be SUID/SGID.
>   *
> - * The keyring will be emplaced on the parent when it next resumes userspace.
> + * The keyring will be emplaced on the parent via a pseudo-signal.
>   *
>   * If successful, 0 will be returned.
>   */
>  long keyctl_session_to_parent(void)
>  {
> -	struct task_struct *me, *parent;
> -	const struct cred *mycred, *pcred;
> -	struct callback_head *newwork, *oldwork;
> +	struct keyctl_session_to_parent_context ctx;
> +	struct task_struct *parent;
>  	key_ref_t keyring_r;
> -	struct cred *cred;
>  	int ret;
>  
>  	keyring_r = lookup_user_key(KEY_SPEC_SESSION_KEYRING, 0, KEY_NEED_LINK);
>  	if (IS_ERR(keyring_r))
>  		return PTR_ERR(keyring_r);
>  
> -	ret = -ENOMEM;
> -
> -	/* our parent is going to need a new cred struct, a new tgcred struct
> -	 * and new security data, so we allocate them here to prevent ENOMEM in
> -	 * our parent */
> -	cred = cred_alloc_blank();
> -	if (!cred)
> -		goto error_keyring;
> -	newwork = &cred->rcu;
> +	write_lock_irq(&tasklist_lock);
> +	parent = get_task_struct(rcu_dereference_protected(current->real_parent,
> +					lockdep_is_held(&tasklist_lock)));
> +	write_unlock_irq(&tasklist_lock);
>  
> -	cred->session_keyring = key_ref_to_ptr(keyring_r);
> -	keyring_r = NULL;
> -	init_task_work(newwork, key_change_session_keyring);
> +	/* the parent mustn't be init and mustn't be a kernel thread */
> +	if (is_global_init(parent) || (READ_ONCE(parent->flags) & PF_KTHREAD) != 0)
> +		goto put_task;

I think we need to explicitly set @ret if we are failing here, yes?
  
> -	me = current;
> -	rcu_read_lock();
> -	write_lock_irq(&tasklist_lock);
> +	ctx.new_session_keyring = key_ref_to_ptr(keyring_r);
> +	ctx.child_cred = current_cred();
> +	init_completion(&ctx.done);
> +	init_task_work(&ctx.work, key_change_session_keyring);
> +	ret = task_work_add(parent, &ctx.work, TWA_SIGNAL);
> +	if (ret)
> +		goto put_task;
>  
> -	ret = -EPERM;
> -	oldwork = NULL;
> -	parent = rcu_dereference_protected(me->real_parent,
> -					   lockdep_is_held(&tasklist_lock));
> +	ret = wait_for_completion_interruptible(&ctx.done);
>  
> -	/* the parent mustn't be init and mustn't be a kernel thread */
> -	if (parent->pid <= 1 || !parent->mm)
> -		goto unlock;
> -
> -	/* the parent must be single threaded */
> -	if (!thread_group_empty(parent))
> -		goto unlock;
> -
> -	/* the parent and the child must have different session keyrings or
> -	 * there's no point */
> -	mycred = current_cred();
> -	pcred = __task_cred(parent);
> -	if (mycred == pcred ||
> -	    mycred->session_keyring == pcred->session_keyring) {
> -		ret = 0;
> -		goto unlock;
> +	if (task_work_cancel(parent, &ctx.work)) {
> +		/*
> +		 * We got interrupted and the task work was canceled before it
> +		 * could execute.
> +		 * Use -ERESTARTNOINTR instead of -ERESTARTSYS for
> +		 * compatibility - the manpage does not list -EINTR as a
> +		 * possible error for keyctl().
> +		 */
> +		ret = -ERESTARTNOINTR;
> +	} else {
> +		/* task work is running or has been executed */
> +		wait_for_completion(&ctx.done);
> +		ret = ctx.result;
>  	}
>  
> -	/* the parent must have the same effective ownership and mustn't be
> -	 * SUID/SGID */
> -	if (!uid_eq(pcred->uid,	 mycred->euid) ||
> -	    !uid_eq(pcred->euid, mycred->euid) ||
> -	    !uid_eq(pcred->suid, mycred->euid) ||
> -	    !gid_eq(pcred->gid,	 mycred->egid) ||
> -	    !gid_eq(pcred->egid, mycred->egid) ||
> -	    !gid_eq(pcred->sgid, mycred->egid))
> -		goto unlock;
> -
> -	/* the keyrings must have the same UID */
> -	if ((pcred->session_keyring &&
> -	     !uid_eq(pcred->session_keyring->uid, mycred->euid)) ||
> -	    !uid_eq(mycred->session_keyring->uid, mycred->euid))
> -		goto unlock;
> -
> -	/* cancel an already pending keyring replacement */
> -	oldwork = task_work_cancel_func(parent, key_change_session_keyring);
> -
> -	/* the replacement session keyring is applied just prior to userspace
> -	 * restarting */
> -	ret = task_work_add(parent, newwork, TWA_RESUME);
> -	if (!ret)
> -		newwork = NULL;
> -unlock:
> -	write_unlock_irq(&tasklist_lock);
> -	rcu_read_unlock();
> -	if (oldwork)
> -		put_cred(container_of(oldwork, struct cred, rcu));
> -	if (newwork)
> -		put_cred(cred);
> -	return ret;
> -
> -error_keyring:
> +put_task:
> +	put_task_struct(parent);
>  	key_ref_put(keyring_r);
>  	return ret;
>  }

--
paul-moore.com

