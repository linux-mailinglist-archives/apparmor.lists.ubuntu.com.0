Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D05B878F6DF
	for <lists+apparmor@lfdr.de>; Fri,  1 Sep 2023 03:51:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qbtJm-0008Us-Cu; Fri, 01 Sep 2023 01:51:26 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1qbtJk-0008UX-6T
 for apparmor@lists.ubuntu.com; Fri, 01 Sep 2023 01:51:24 +0000
Received: from [192.168.192.83] (unknown [50.39.103.33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 4C6093F6B8; 
 Fri,  1 Sep 2023 01:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1693533083;
 bh=rplkTKhvtPisTVAsQEjgHF7Fo1OdEcCi6oyRjCs/dOI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=BpAGfGwYjjogUTRS4JY5IvvAmVyy0cS9We5tQ9PfLBqeqMsE+n3wKUVJbbJLjCWtj
 YvuFYR5SeQeuxJidN0ZtAb2F0JeBXZmacuuhnu4m5giB9/zdzRd5llFdRKFQwy/ouJ
 gC0cPtkrEoTjVP0VYXoqw3/jmd7iehAPFLg41sQrmTaFDoeS/vOqiwu/XyGIF8sirM
 bCZ6FjD2a7fOJRNeSkR8IWmPV/SabBR6y18nrVVrh8Y1UQqcYrGrTiTQZwt1z3+U2Y
 iFEfKFvLIRfXR16pKcjWxb02e0HvRM6RVc4ckG9P5JfbVGT97akJ5VIrRomT8UjPpI
 mEgLfRtGqhOpQ==
Message-ID: <0def2030-78f7-2213-dab6-408622cc25b2@canonical.com>
Date: Thu, 31 Aug 2023 18:51:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>, apparmor@lists.ubuntu.com
References: <20230831232224.460363-1-vinicius.gomes@intel.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230831232224.460363-1-vinicius.gomes@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH -next] RFC: apparmor: Optimize retrieving
 current task secid
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
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 8/31/23 16:22, Vinicius Costa Gomes wrote:
> When running will-it-scale[1] open2_process testcase, in a system with a
> large number of cores, a bottleneck in retrieving the current task
> secid was detected:
> 
> 27.73% ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)
>      27.72%     0.01%  [kernel.vmlinux]      [k] security_current_getsecid_subj             -      -
> 27.71% security_current_getsecid_subj;ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)
>      27.71%    27.68%  [kernel.vmlinux]      [k] apparmor_current_getsecid_subj             -      -
> 19.94% __refcount_add (inlined);__refcount_inc (inlined);refcount_inc (inlined);kref_get (inlined);aa_get_label (inlined);aa_get_label (inlined);aa_get_current_label (inlined);apparmor_current_getsecid_subj;security_current_getsecid_subj;ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)
> 7.72% __refcount_sub_and_test (inlined);__refcount_dec_and_test (inlined);refcount_dec_and_test (inlined);kref_put (inlined);aa_put_label (inlined);aa_put_label (inlined);apparmor_current_getsecid_subj;security_current_getsecid_subj;ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)
> 
> A large amount of time was spent in the refcount.
> 
> The most common case is that the current task label is available, and
> no need to take references for that one. That is exactly what the
> critical section helpers do, make use of them.
> 
> New perf output:
> 
> 39.12% vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)
>      39.07%     0.13%  [kernel.vmlinux]          [k] do_dentry_open                                                               -      -
> 39.05% do_dentry_open;vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)
>      38.71%     0.01%  [kernel.vmlinux]          [k] security_file_open                                                           -      -
> 38.70% security_file_open;do_dentry_open;vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)
>      38.65%    38.60%  [kernel.vmlinux]          [k] apparmor_file_open                                                           -      -
> 38.65% apparmor_file_open;security_file_open;do_dentry_open;vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)
> 
> The result is a throughput improvement of around 20% across the board
> on the open2 testcase. On more realistic workloads the impact should
> be much less.
> hrmmm, interesting. its a nice improvement

> [1] https://github.com/antonblanchard/will-it-scale
> 
> Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>

Acked-by: John Johansen <john.johansen@canonical.com>

do you want me to pull this into apparmor-next or do you have another
tree in mind

> ---
> Sending as RFC because I am not sure there's anything I am missing. My
> read of the code tells me it should be fine.

it is

> 
>   security/apparmor/lsm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 108eccc5ada5..98e65c44ddd5 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -766,9 +766,9 @@ static void apparmor_bprm_committed_creds(struct linux_binprm *bprm)
>   
>   static void apparmor_current_getsecid_subj(u32 *secid)
>   {
> -	struct aa_label *label = aa_get_current_label();
> +	struct aa_label *label = __begin_current_label_crit_section();
>   	*secid = label->secid;
> -	aa_put_label(label);
> +	__end_current_label_crit_section(label);
>   }
>   
>   static void apparmor_task_getsecid_obj(struct task_struct *p, u32 *secid)


