Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A44E2905E70
	for <lists+apparmor@lfdr.de>; Thu, 13 Jun 2024 00:25:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sHWPD-0000sT-2Z; Wed, 12 Jun 2024 22:25:23 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sHVkr-0006pr-L4
 for apparmor@lists.ubuntu.com; Wed, 12 Jun 2024 21:43:41 +0000
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-62f518bbab1so4091717b3.2
 for <apparmor@lists.ubuntu.com>; Wed, 12 Jun 2024 14:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718228620; x=1718833420;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :content-disposition:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H5P+IbdHtppUszGApidFOa9Hm6YpZkzCVF9qJbTn8jo=;
 b=SGoxf+iOZziATrEXQGHOpMDuMbprkZevB8IyuFYDQfbA3aQ0TRLpXBj7GC/y68Hvpt
 4xl8HnJ8rKYVc4gdydnsSSzYHUFqe5kHutP1m1YovUkoxL0pELwr04/xd1BYGQNgshxJ
 WJUjXRg1o3yz0DTB4coqy9YPLXItw+4TT6fRC1iba/mJD4Co8BI8JxNpiAk2Jt3khg/C
 7QGzaa8cArQkyke7v+Dz4Ou5Lq4525PC9ZGrCCR1gWIkmqCaFWsnGvzxarEX6aEmHznY
 v0MROZ5ULBd8S2V1+sb3y2AK1F3RehVldcUgk1KcOv6p4irle8oZZUo8grR1Ee7HYTbB
 IBIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5hFaUmiZphuqaKgtqE0CcUlZZ4K3IfY+qWAXLXE1VqPZLZiCR2ZNB9HSiSBJ3bscb5eqbQvV01+TJBbe+mQmyfEu9sIge575u
X-Gm-Message-State: AOJu0YyNMmW3b8zEWP3a2AGUBU1nviYiWE2naAUqvWAAm0+he8VKNX5/
 I5nljSTB+9pVTb6/yrVd3n4yqpba6wxc3aBE75t8/LL1ixSmGa9mugQdC422dg==
X-Google-Smtp-Source: AGHT+IEzCkGmcURuwumylkliwQQS7tKCwphHhO+nQwNDPDQUW3WVTWS6GxOh4TbgC9Y2HEAECiLJvA==
X-Received: by 2002:a81:c546:0:b0:61a:cd65:3010 with SMTP id
 00721157ae682-62fb91269a1mr30015217b3.30.1718228620242; 
 Wed, 12 Jun 2024 14:43:40 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441f2d6e933sm190801cf.44.2024.06.12.14.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 14:43:39 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:43:39 -0400
Message-ID: <00d88046025c611f2bf94708ffc65ecc@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: GUO Zihua <guozihua@huawei.com>, <john.johansen@canonical.com>,
 <jmorris@namei.org>, <serge@hallyn.com>, <zohar@linux.ibm.com>,
 <roberto.sassu@huawei.com>, <dmitry.kasatkin@gmail.com>,
 <stephen.smalley.work@gmail.com>, <casey@schaufler-ca.com>,
 <eparis@redhat.com>
References: <20240507012541.796421-1-guozihua@huawei.com>
In-Reply-To: <20240507012541.796421-1-guozihua@huawei.com>
Received-SPF: pass client-ip=209.85.128.169; envelope-from=paul@paul-moore.com;
 helo=mail-yw1-f169.google.com
Subject: Re: [apparmor] [PATCH v3] ima: Avoid blocking in RCU read-side
	critical section
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
Cc: eric.snowberg@oracle.com, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, omosnace@redhat.com, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On May  6, 2024 GUO Zihua <guozihua@huawei.com> wrote:
> 
> A panic happens in ima_match_policy:
> 
> BUG: unable to handle kernel NULL pointer dereference at 0000000000000010
> PGD 42f873067 P4D 0
> Oops: 0000 [#1] SMP NOPTI
> CPU: 5 PID: 1286325 Comm: kubeletmonit.sh Kdump: loaded Tainted: P
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.0.0 02/06/2015
> RIP: 0010:ima_match_policy+0x84/0x450
> Code: 49 89 fc 41 89 cf 31 ed 89 44 24 14 eb 1c 44 39 7b 18 74 26 41 83 ff 05 74 20 48 8b 1b 48 3b 1d f2 b9 f4 00 0f 84 9c 01 00 00 <44> 85 73 10 74 ea 44 8b 6b 14 41 f6 c5 01 75 d4 41 f6 c5 02 74 0f
> RSP: 0018:ff71570009e07a80 EFLAGS: 00010207
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000200
> RDX: ffffffffad8dc7c0 RSI: 0000000024924925 RDI: ff3e27850dea2000
> RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffffabfce739
> R10: ff3e27810cc42400 R11: 0000000000000000 R12: ff3e2781825ef970
> R13: 00000000ff3e2785 R14: 000000000000000c R15: 0000000000000001
> FS:  00007f5195b51740(0000) GS:ff3e278b12d40000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000010 CR3: 0000000626d24002 CR4: 0000000000361ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  ima_get_action+0x22/0x30
>  process_measurement+0xb0/0x830
>  ? page_add_file_rmap+0x15/0x170
>  ? alloc_set_pte+0x269/0x4c0
>  ? prep_new_page+0x81/0x140
>  ? simple_xattr_get+0x75/0xa0
>  ? selinux_file_open+0x9d/0xf0
>  ima_file_check+0x64/0x90
>  path_openat+0x571/0x1720
>  do_filp_open+0x9b/0x110
>  ? page_counter_try_charge+0x57/0xc0
>  ? files_cgroup_alloc_fd+0x38/0x60
>  ? __alloc_fd+0xd4/0x250
>  ? do_sys_open+0x1bd/0x250
>  do_sys_open+0x1bd/0x250
>  do_syscall_64+0x5d/0x1d0
>  entry_SYSCALL_64_after_hwframe+0x65/0xca
> 
> Commit c7423dbdbc9e ("ima: Handle -ESTALE returned by
> ima_filter_rule_match()") introduced call to ima_lsm_copy_rule within a
> RCU read-side critical section which contains kmalloc with GFP_KERNEL.
> This implies a possible sleep and violates limitations of RCU read-side
> critical sections on non-PREEMPT systems.
> 
> Sleeping within RCU read-side critical section might cause
> synchronize_rcu() returning early and break RCU protection, allowing a
> UAF to happen.
> 
> The root cause of this issue could be described as follows:
> |	Thread A	|	Thread B	|
> |			|ima_match_policy	|
> |			|  rcu_read_lock	|
> |ima_lsm_update_rule	|			|
> |  synchronize_rcu	|			|
> |			|    kmalloc(GFP_KERNEL)|
> |			|      sleep		|
> ==> synchronize_rcu returns early
> |  kfree(entry)		|			|
> |			|    entry = entry->next|
> ==> UAF happens and entry now becomes NULL (or could be anything).
> |			|    entry->action	|
> ==> Accessing entry might cause panic.
>
> To fix this issue, we are converting all kmalloc that is called within
> RCU read-side critical section to use GFP_ATOMIC.
> 
> Fixes: c7423dbdbc9e ("ima: Handle -ESTALE returned by ima_filter_rule_match()")
> Cc: stable@vger.kernel.org
> Signed-off-by: GUO Zihua <guozihua@huawei.com>
> Acked-by: John Johansen <john.johansen@canonical.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
> v3:
>   ima_lsm_copy_rule takes a GFP flag as input as well.
> v2:
>   Changed the audit_rule_init security hook to accept a new GFP flag, as
> per Stephen's suggestion.
> 
> ---
>  include/linux/lsm_hook_defs.h       |  2 +-
>  include/linux/security.h            |  5 +++--
>  kernel/auditfilter.c                |  5 +++--
>  security/apparmor/audit.c           |  6 +++---
>  security/apparmor/include/audit.h   |  2 +-
>  security/integrity/ima/ima_policy.c | 15 +++++++++------
>  security/security.c                 |  6 ++++--
>  security/selinux/include/audit.h    |  4 +++-
>  security/selinux/ss/services.c      |  5 +++--
>  security/smack/smack_lsm.c          |  3 ++-
>  10 files changed, 32 insertions(+), 21 deletions(-)

With the exception of one small gotcha (see below), this looks okay to
me.  At Mimi's request I'm going to merge this into the LSM tree, via
lsm/stable-6.10, where I'll give it a few days in linux-next before
sending it up to Linus.

Thanks everyone :)

> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 146667937811..a4943628d75a 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -4696,7 +4696,8 @@ static int smack_post_notification(const struct cred *w_cred,
>   * Prepare to audit cases where (@field @op @rulestr) is true.
>   * The label to be audited is created if necessay.
>   */
> -static int smack_audit_rule_init(u32 field, u32 op, char *rulestr, void **vrule)
> +static int smack_audit_rule_init(u32 field, u32 op, char *rulestr, void **vrule,
> +				 gfp_t gfp)

You forgot to add the new @gfp parameter to the function's header
comment block.  I'm going to add the following as the text is used in
other Smack functions, if anyone has any objections please let me know.

  " * @gfp: type of the memory for the allocation"

>  {
>  	struct smack_known *skp;
>  	char **rule = (char **)vrule;

--
paul-moore.com

