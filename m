Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPN7KaQzAmrSowEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 21:53:08 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A53B515496
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 21:53:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wMWgZ-0003LA-5l; Mon, 11 May 2026 19:53:03 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1wMWgX-0003H0-OJ
 for apparmor@lists.ubuntu.com; Mon, 11 May 2026 19:53:01 +0000
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-8ef2118b478so484136585a.0
 for <apparmor@lists.ubuntu.com>; Mon, 11 May 2026 12:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1778529180; x=1779133980; darn=lists.ubuntu.com; 
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=ZOo8mqYuky3aS2A2U/I/xcFROUzPmcuioh4GJDlL7KI=;
 b=OS/E4JjWwo3+OrhAHWZGvWWGIsh7IQdobKpOAgnzhoJtzTmXeXYiFAzUlzFqXTGk4o
 yXXdy3wuS7iIT9uCC1hsy2cTrT3INGCJyhJrVXQc1gmBqAt5F3+p+hUeyUCb+266Ylf4
 be2TmFb+eceF9ktgGVpqC5YvikiceYD2BIaIAIK63pyLDbwSm/EzmK1TMKWNpsBQ7Uoq
 U3ddZCuKq7gzMxJyfrrtlfSgDy4cG8Blonct6QbkzaH/KwRamt4lZPakas9aIDEqoQpw
 xk5oB0rIXrTlS6Xq/9PtzwiQqxYXP+QUExWgKDDRYqS14CoSgdsng94qK90xxhkqgxr8
 2vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778529180; x=1779133980;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOo8mqYuky3aS2A2U/I/xcFROUzPmcuioh4GJDlL7KI=;
 b=iBjp728Nh0z8dTCRTiisYDQf7VkpshjXSZWkHajHO/HPeLjMAHZUyNnBBhWhGanx2D
 2ty4e4rjLb6rf6c46FETMxf05RtyorKWMLHNsp/WDn7UyZlFdKSmbq11QbmCv1+QeMn0
 99+zEjIwog3PJkAfJMBIoTrSZSh0v6f4z5y6f+TnyRNP6fVdR5kYMnaRo16KGvqFdxtp
 kW/z3xeKVBuKrVDvrlPrXGtfR7dlD34DdPn7/YlJ3w2lsYhjLVup8BHHsBRHcEhV8fsm
 2dywktcWHQooAK8XzHJJP0Va0jqXqASjy3KDWZtoqDL44nDKNh2jDkrDK6ta9kTRJEDO
 jI3w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+RNdyEgnPs6XGd+KHiFqtnJEF024Aal3y8Sd+1k1UVp7y7WAtjE0qrpzjLfGfCdl0qv8a+w8zY8Q==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yy4kptkfGmPF93za5hnLtBL+/YRjhZX6NMpy+raGl0W1H5dOAW1
 gCRjONw/boY9xn7UQPjMbyVWV9PTLCpb3lGuGSygDUZ/reYKt/4POg5chjzcwVIfOw==
X-Gm-Gg: Acq92OEDSyk4oZfgYv0N0vyIxRHnvl2TYwpWfT/Ttn610+BhNj2Ezv9aKB0DHgii7j/
 BXFYr3Cg2F2+Kl/WQeEzTvYjBVJiqHhwE9RP1XVc+vNoOaFErPANx4GhXfsPeI/t9d0lSyaNUcd
 l5Q9PcBkx4LBTI2hB5ZeHjdFhTIkSMo8K3cz9kUY2AODsRRQy9dxXvM8D1SoGnq3cPVGGrcu/eD
 JZImvAt2sAEPt2XqvCq+Avo63Ppjg1KTvumb96ZLXoqHUb4iz0YdQkMa0wq/m7su7/TtBzJIDSr
 mZDmwYwd46X/6qKmcURo8FGprpx84803I/sdIQuL80URKqAXsO4Y4N8ryfIvylG7ooHSZnzyTiX
 +ji8EE2EnRaenGNZKWviO69blu/o//G/jSSFxfzA1rip++PWVbTtafKg9Zs9zd7iRtq+QXkVYAR
 pez5p+sTqDwzOm7CwXWuD0d5GjLisZVWz5CKLLbCHbVbi6oybR14NLKUl9x15S0UqZT/F7
X-Received: by 2002:a05:620a:698c:b0:8d9:3cb9:9905 with SMTP id
 af79cd13be357-904d6fcb765mr3693957985a.54.1778529180332; 
 Mon, 11 May 2026 12:53:00 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net.
 [71.126.255.178]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-907b918cffesm1179663385a.14.2026.05.11.12.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 12:52:56 -0700 (PDT)
Date: Mon, 11 May 2026 15:52:56 -0400
Message-ID: <37ceb04c4c37370a2359f73a24b9c07b@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260511_1539/pstg-lib:20260511_1103/pstg-pwork:20260511_1539
From: Paul Moore <paul@paul-moore.com>
To: Song Liu <song@kernel.org>, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com
References: <20260509015208.3853132-8-song@kernel.org>
In-Reply-To: <20260509015208.3853132-8-song@kernel.org>
Received-SPF: pass client-ip=209.85.222.177; envelope-from=paul@paul-moore.com;
 helo=mail-qk1-f177.google.com
Subject: Re: [apparmor] [PATCH v3 7/7] lsm: Remove security_sb_mount and
	security_move_mount
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
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz,
 penguin-kernel@I-love.SAKURA.ne.jp, stephen.smalley.work@gmail.com,
 kernel-team@meta.com, jmorris@namei.org, omosnace@redhat.com,
 Song Liu <song@kernel.org>, viro@zeniv.linux.org.uk, gnoack@google.com,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 9A53B515496
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[paul-moore.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:penguin-kernel@I-love.SAKURA.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,I-love.SAKURA.ne.jp,gmail.com,meta.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	NEURAL_HAM(-0.00)[-0.865];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,paul-moore.com:url,paul-moore.com:mid]
X-Rspamd-Action: no action

On May  8, 2026 Song Liu <song@kernel.org> wrote:
> 
> Now that all LSMs have been converted to granular mount hooks,
> remove the old hooks:
> 
> - security_sb_mount(): removed from lsm_hook_defs.h, security.h,
>   security.c, and its call in path_mount().
> - security_move_mount(): removed and replaced by security_mount_move()
>   in do_move_mount(). All LSMs now use mount_move exclusively.
> 
> Code generated with the assistance of Claude, reviewed by human.
> 
> Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com> # for selinux only
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  fs/namespace.c                |  8 --------
>  include/linux/lsm_hook_defs.h |  4 ----
>  include/linux/security.h      | 16 ---------------
>  kernel/bpf/bpf_lsm.c          |  2 --
>  security/apparmor/lsm.c       |  1 -
>  security/landlock/fs.c        |  1 -
>  security/security.c           | 38 -----------------------------------
>  security/selinux/hooks.c      |  2 --
>  8 files changed, 72 deletions(-)

...

> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index e0a8a44c95aa..b0de7f316f51 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1705,7 +1705,6 @@ static struct security_hook_list apparmor_hooks[] __ro_after_init = {
>  	LSM_HOOK_INIT(capget, apparmor_capget),
>  	LSM_HOOK_INIT(capable, apparmor_capable),
>  
> -	LSM_HOOK_INIT(move_mount, apparmor_move_mount),

This should be in patch 3/7 when you convert AppArmor over to the new
hooks.

>  	LSM_HOOK_INIT(mount_bind, apparmor_mount_bind),
>  	LSM_HOOK_INIT(mount_new, apparmor_mount_new),
>  	LSM_HOOK_INIT(mount_remount, apparmor_mount_remount),
> diff --git a/security/landlock/fs.c b/security/landlock/fs.c
> index 4547e736e496..7377f22a165e 100644
> --- a/security/landlock/fs.c
> +++ b/security/landlock/fs.c
> @@ -1983,7 +1983,6 @@ static struct security_hook_list landlock_hooks[] __ro_after_init = {
>  	LSM_HOOK_INIT(mount_reconfigure, hook_mount_reconfigure),
>  	LSM_HOOK_INIT(mount_change_type, hook_mount_change_type),
>  	LSM_HOOK_INIT(mount_move, hook_move_mount),
> -	LSM_HOOK_INIT(move_mount, hook_move_mount),

This should be in patch 5/7 when you convert Landlock.

> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 864a3ca772c9..c8de175bde04 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -7586,8 +7586,6 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
>  	LSM_HOOK_INIT(sb_set_mnt_opts, selinux_set_mnt_opts),
>  	LSM_HOOK_INIT(sb_clone_mnt_opts, selinux_sb_clone_mnt_opts),
>  
> -	LSM_HOOK_INIT(move_mount, selinux_move_mount),

This should be in patch 4/7 when you convert SELinux.

>  	LSM_HOOK_INIT(dentry_init_security, selinux_dentry_init_security),
>  	LSM_HOOK_INIT(dentry_create_files_as, selinux_dentry_create_files_as),
>  
> -- 
> 2.53.0-Meta

--
paul-moore.com

