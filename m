Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1178F78A
	for <lists+apparmor@lfdr.de>; Fri,  1 Sep 2023 05:51:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qbvBN-0005jQ-84; Fri, 01 Sep 2023 03:50:53 +0000
Received: from mgamail.intel.com ([192.55.52.115])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <vinicius.gomes@intel.com>)
 id 1qbvBJ-0005hw-Qa
 for apparmor@lists.ubuntu.com; Fri, 01 Sep 2023 03:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693540249; x=1725076249;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iaakvufsPSI4fOyOCZcSGBpreY75QiHRPYKuy7gdF98=;
 b=PSAIKdZyZPi12+c4wkvBNNH6tlcqmOLVok+m1j6Yl13s8mvnL0ogtkdd
 eVTJNJ9IlRqiLQNi5WdezwlDEnHSykq7Q6ciX53mYZIeBhSN35WX8Q+Uc
 bqRMVf2rVMB/01vCo0e78WYGoCgveO3VjsF/xseEVDPtvxjdjLbdMUEnc
 LWVReP8ErTe7UBVFj2tiesorRBvlYl92v5tgOZIlSUFz47fa8+m+7e6hy
 4IXlc8lNq1/6K42o3Rl3fVqWtCpvl+c7kjEnEOgUjOh2H5e9Q3Zx7geNK
 JNmw5TXvwJaYpIJV17BDiiGKx7vABwIw7o9q0lY4TNW8XX97f09okRRCo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="376062515"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="376062515"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 20:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="829974687"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="829974687"
Received: from vraghuna-mobl.amr.corp.intel.com (HELO vcostago-mobl3)
 ([10.213.167.133])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 20:50:46 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
In-Reply-To: <7fe7fcb4-888b-086a-1a29-ee796859168c@canonical.com>
References: <20230831232224.460363-1-vinicius.gomes@intel.com>
 <0def2030-78f7-2213-dab6-408622cc25b2@canonical.com>
 <87zg26mx0u.fsf@intel.com>
 <7fe7fcb4-888b-086a-1a29-ee796859168c@canonical.com>
Date: Thu, 31 Aug 2023 20:50:46 -0700
Message-ID: <87ttsemu09.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

John Johansen <john.johansen@canonical.com> writes:

> On 8/31/23 19:45, Vinicius Costa Gomes wrote:
>> John Johansen <john.johansen@canonical.com> writes:
>> 
>>> On 8/31/23 16:22, Vinicius Costa Gomes wrote:
>>>> When running will-it-scale[1] open2_process testcase, in a system with a
>>>> large number of cores, a bottleneck in retrieving the current task
>>>> secid was detected:
>>>>
>>>> 27.73% ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)
>>>>       27.72%     0.01%  [kernel.vmlinux]      [k] security_current_getsecid_subj             -      -
>>>> 27.71% security_current_getsecid_subj;ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)
>>>>       27.71%    27.68%  [kernel.vmlinux]      [k] apparmor_current_getsecid_subj             -      -
>>>> 19.94% __refcount_add (inlined);__refcount_inc (inlined);refcount_inc (inlined);kref_get (inlined);aa_get_label (inlined);aa_get_label (inlined);aa_get_current_label (inlined);apparmor_current_getsecid_subj;security_current_getsecid_subj;ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)
>>>> 7.72% __refcount_sub_and_test (inlined);__refcount_dec_and_test (inlined);refcount_dec_and_test (inlined);kref_put (inlined);aa_put_label (inlined);aa_put_label (inlined);apparmor_current_getsecid_subj;security_current_getsecid_subj;ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)
>>>>
>>>> A large amount of time was spent in the refcount.
>>>>
>>>> The most common case is that the current task label is available, and
>>>> no need to take references for that one. That is exactly what the
>>>> critical section helpers do, make use of them.
>>>>
>>>> New perf output:
>>>>
>>>> 39.12% vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)
>>>>       39.07%     0.13%  [kernel.vmlinux]          [k] do_dentry_open                                                               -      -
>>>> 39.05% do_dentry_open;vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)
>>>>       38.71%     0.01%  [kernel.vmlinux]          [k] security_file_open                                                           -      -
>>>> 38.70% security_file_open;do_dentry_open;vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)
>>>>       38.65%    38.60%  [kernel.vmlinux]          [k] apparmor_file_open                                                           -      -
>>>> 38.65% apparmor_file_open;security_file_open;do_dentry_open;vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)
>>>>
>>>> The result is a throughput improvement of around 20% across the board
>>>> on the open2 testcase. On more realistic workloads the impact should
>>>> be much less.
>>>> hrmmm, interesting. its a nice improvement
>>>
>>>> [1] https://github.com/antonblanchard/will-it-scale
>>>>
>>>> Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>>>
>>> Acked-by: John Johansen <john.johansen@canonical.com>
>>>
>>> do you want me to pull this into apparmor-next or do you have another
>>> tree in mind
>>>
>> 
>> -next is fine.
>> 
>>>> ---
>>>> Sending as RFC because I am not sure there's anything I am missing. My
>>>> read of the code tells me it should be fine.
>>>
>>> it is
>>>
>> 
>> Great. Do you want me to send a non-RFC version?
>>
> you can if you want but there is no need, I can do that small edit
>

I'll leave that to you, then. Thank you.

>>>>
>>>>    security/apparmor/lsm.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
>>>> index 108eccc5ada5..98e65c44ddd5 100644
>>>> --- a/security/apparmor/lsm.c
>>>> +++ b/security/apparmor/lsm.c
>>>> @@ -766,9 +766,9 @@ static void apparmor_bprm_committed_creds(struct linux_binprm *bprm)
>>>>    
>>>>    static void apparmor_current_getsecid_subj(u32 *secid)
>>>>    {
>>>> -	struct aa_label *label = aa_get_current_label();
>>>> +	struct aa_label *label = __begin_current_label_crit_section();
>>>>    	*secid = label->secid;
>>>> -	aa_put_label(label);
>>>> +	__end_current_label_crit_section(label);
>>>>    }
>>>>    
>>>>    static void apparmor_task_getsecid_obj(struct task_struct *p, u32 *secid)
>>>
>> 
>> Cheers,
>

Cheers,
-- 
Vinicius

