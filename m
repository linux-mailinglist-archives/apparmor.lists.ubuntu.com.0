Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C8578F616
	for <lists+apparmor@lfdr.de>; Fri,  1 Sep 2023 01:23:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qbr0X-0003uB-E3; Thu, 31 Aug 2023 23:23:25 +0000
Received: from mgamail.intel.com ([192.55.52.120])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <vinicius.gomes@intel.com>)
 id 1qbr0U-0003tJ-O3
 for apparmor@lists.ubuntu.com; Thu, 31 Aug 2023 23:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693524202; x=1725060202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=llMVoxC/0F4o2+5z6HZ8dbB2nI4QlSJouTgsKwK5Eyk=;
 b=GBw9VGxBnko/xdGaLfMPUVYXBn1gDuKQWAouGtJC/to0Xa9VeB72T2+G
 WSO9NywF5nCflsh5SxcQBQBNGqx5O4m8H6vyx83FmDS4J8Z5+ndqd0bBr
 AsjbepO5hcFbxk9V6ohc8waZ68GkfMUNrulR7vue1Tyjd3nb32lwom7op
 2z3O/3aP1dpz2gLVSDlwG7TBhP3nfqpe7+fygjrKiC6KdOd3qMpxP7Bpq
 r4e09AxPdFIlgHQ8/T++so2LK1OT89Sxa7yukq8dtP+8q7QyQCkdhmq+R
 JErkYKihgtla6fNyEvuYvx/0wDbwhL0WLBGrrYTqcJiXgnaSoUVKxG94Z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="374994484"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="374994484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 16:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070506805"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="1070506805"
Received: from vraghuna-mobl.amr.corp.intel.com (HELO
 vcostago-mobl3.intel.com) ([10.213.167.133])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 16:23:19 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: apparmor@lists.ubuntu.com
Date: Thu, 31 Aug 2023 16:22:24 -0700
Message-ID: <20230831232224.460363-1-vinicius.gomes@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH -next] RFC: apparmor: Optimize retrieving current
	task secid
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
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

When running will-it-scale[1] open2_process testcase, in a system with a
large number of cores, a bottleneck in retrieving the current task
secid was detected:

27.73% ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)
    27.72%     0.01%  [kernel.vmlinux]      [k] security_current_getsecid_subj             -      -
27.71% security_current_getsecid_subj;ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)
    27.71%    27.68%  [kernel.vmlinux]      [k] apparmor_current_getsecid_subj             -      -
19.94% __refcount_add (inlined);__refcount_inc (inlined);refcount_inc (inlined);kref_get (inlined);aa_get_label (inlined);aa_get_label (inlined);aa_get_current_label (inlined);apparmor_current_getsecid_subj;security_current_getsecid_subj;ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)
7.72% __refcount_sub_and_test (inlined);__refcount_dec_and_test (inlined);refcount_dec_and_test (inlined);kref_put (inlined);aa_put_label (inlined);aa_put_label (inlined);apparmor_current_getsecid_subj;security_current_getsecid_subj;ima_file_check;do_open (inlined);path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_x64 (inlined);do_syscall_64;entry_SYSCALL_64_after_hwframe (inlined);__libc_open64 (inlined)

A large amount of time was spent in the refcount.

The most common case is that the current task label is available, and
no need to take references for that one. That is exactly what the
critical section helpers do, make use of them.

New perf output:

39.12% vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)
    39.07%     0.13%  [kernel.vmlinux]          [k] do_dentry_open                                                               -      -
39.05% do_dentry_open;vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)
    38.71%     0.01%  [kernel.vmlinux]          [k] security_file_open                                                           -      -
38.70% security_file_open;do_dentry_open;vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)
    38.65%    38.60%  [kernel.vmlinux]          [k] apparmor_file_open                                                           -      -
38.65% apparmor_file_open;security_file_open;do_dentry_open;vfs_open;path_openat;do_filp_open;do_sys_openat2;__x64_sys_openat;do_syscall_64;entry_SYSCALL_64_after_hwframe;__libc_open64 (inlined)

The result is a throughput improvement of around 20% across the board
on the open2 testcase. On more realistic workloads the impact should
be much less.

[1] https://github.com/antonblanchard/will-it-scale

Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
Sending as RFC because I am not sure there's anything I am missing. My
read of the code tells me it should be fine.

 security/apparmor/lsm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 108eccc5ada5..98e65c44ddd5 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -766,9 +766,9 @@ static void apparmor_bprm_committed_creds(struct linux_binprm *bprm)
 
 static void apparmor_current_getsecid_subj(u32 *secid)
 {
-	struct aa_label *label = aa_get_current_label();
+	struct aa_label *label = __begin_current_label_crit_section();
 	*secid = label->secid;
-	aa_put_label(label);
+	__end_current_label_crit_section(label);
 }
 
 static void apparmor_task_getsecid_obj(struct task_struct *p, u32 *secid)
-- 
2.41.0


