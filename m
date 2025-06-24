Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C46AE6DB3
	for <lists+apparmor@lfdr.de>; Tue, 24 Jun 2025 19:38:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uU7aw-0001cx-9o; Tue, 24 Jun 2025 17:38:06 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john@jjmx.net>) id 1uU7Ow-0000ab-5I
 for apparmor@lists.ubuntu.com; Tue, 24 Jun 2025 17:25:42 +0000
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-23649faf69fso58901145ad.0
 for <apparmor@lists.ubuntu.com>; Tue, 24 Jun 2025 10:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750785940; x=1751390740;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J57GGm0/SdIH6DZQhDnyNsTVoEW1iv54wd0A5EiJs7A=;
 b=tYR38bH/0J1PX/TfuaWVnGhyN83XZDpFTzD8bZ9QV889YmoclgmDisawxnFjMr9lll
 7uP6COYOFg3WR+iytzBii0rQq6m4RCjoh4TB5Hr0SGCEpyXMBWM05YeFlPoxcbCBY5Im
 DDL0k1uT8jXHfeGPwkzN8CBFmDk9dyScylnyoMVO3DK/GlqWxOZHzVpkTDRLH0JHB9XK
 dMW+b9jKnpaVIYXBPqko/cqyMR8NllT9z2EKWH/+j+2Aqna5aAEIP+wfF5yjboIogDqZ
 wcjZC9okRkQri0iPiNVGwH6axh1DDmSJ1phCg1g7BV+AydMHbVjbmXm3qLNMlrn6HacQ
 D/Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEL8rjQRq9uloBptEQuqc3TGx6kXSV5fCMFWl4Mq+KMY6TPoXR1sgq7Tz1V5wLx8IvWd6EZuZE+g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yx7cUnLgBzqmy91DbiteX9qKoJDjwGxLHMBSsLv8fG45/OXJIgc
 rDm39fUdpBHy9BNN48gr3488pXECFsMKL6eRt2OzZicK/ZOcqVYRfj3LHnU2FYxycw8=
X-Gm-Gg: ASbGnct196Md9l1dHlR9SbMzBAg0t1KDOvYL4PaiDw5uCGQG+fvrrpg2WB8XpvApgMb
 VWkX5tXLOCP8nxYQBW+Z9Mia0rl56heGGJlQ2uHLbdszUNPCBzcArbe6u5WlhbKkHoioTxM3jfp
 V0oq87wZA5RVBXWZqXqsmsY26OPIc7Ie1MjsAWWK8HWXDag7Y7GfJwKhJEyJPruGruGgndwP3rm
 svwgdycFv4y2HV1NmnnMNRASQC2eaBxKcxj8RfqUOY5eEH5/fAUBPg4uzSHgTY5i9ZnwC6pf5SE
 H7tDk/kTj6HLRv9TyYc4hdIdSMKJHlVg4BdhuglOMlQmb89rrhH7A4pzKY3BeJSci1I9
X-Google-Smtp-Source: AGHT+IHGqwjj1vPA0ipDjB8+H8wvpu8EvGUzLOveaJIc7cF/8aoNMfft2/Nhp6Nnc8qe6eUyUIbesg==
X-Received: by 2002:a17:903:187:b0:234:d679:72f7 with SMTP id
 d9443c01a7336-23823fead84mr2329285ad.23.1750785940315; 
 Tue, 24 Jun 2025 10:25:40 -0700 (PDT)
Received: from [192.168.192.84] ([50.47.147.87])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-237d8729de6sm111543865ad.238.2025.06.24.10.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 10:25:39 -0700 (PDT)
Message-ID: <d6d091fa-1e6f-40ea-983a-59ac2d8a38d2@jjmx.net>
Date: Tue, 24 Jun 2025 10:25:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Al Viro <viro@zeniv.linux.org.uk>, John Johansen <john@apparmor.net>
References: <20250623213747.GJ1880847@ZenIV> <20250623222316.GK1880847@ZenIV>
Content-Language: en-US
From: John Johansen <john@jjmx.net>
In-Reply-To: <20250623222316.GK1880847@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=209.85.214.178; envelope-from=john@jjmx.net;
 helo=mail-pl1-f178.google.com
X-Mailman-Approved-At: Tue, 24 Jun 2025 17:38:05 +0000
Subject: Re: [apparmor] [RFC][BUG] ns_mkdir_op() locking is FUBAR
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
Cc: linux-fsdevel@vger.kernel.org, apparmor <apparmor@lists.ubuntu.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 6/23/25 15:23, Al Viro wrote:
> On Mon, Jun 23, 2025 at 10:37:47PM +0100, Al Viro wrote:
>
>> Could you explain what exclusion are you trying to get there?
>> The mechanism is currently broken, but what is it trying to achieve?
> While we are at it:
>
> root@kvm1:~# cd /sys/kernel/security/apparmor/policy
> root@kvm1:/sys/kernel/security/apparmor/policy# (for i in `seq 270`; do mkdir namespaces/$i; cd namespaces/$i; done)
> root@kvm1:/sys/kernel/security/apparmor/policy# rmdir namespaces/1
> [   40.980453] Oops: stack guard page: 0000 [#1] PREEMPT SMP NOPTI
> [   40.980457] CPU: 3 UID: 0 PID: 2223 Comm: rmdir Not tainted 6.12.27-amd64 #11
> [   40.980459] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.164
> [   40.980460] RIP: 0010:inode_set_ctime_current+0x2c/0x100
> [   40.980490] Code: 1e fa 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 53 31 db 48 8f
> [   40.980491] RSP: 0018:ffffc1cbc2cfbff8 EFLAGS: 00010292
> [   40.980493] RAX: 0000000000400000 RBX: 0000000000000000 RCX: ffff9dbcc358ac70
> [   40.980494] RDX: 0000000000000001 RSI: ffff9dbcc48c0300 RDI: ffffc1cbc2cfbff8
> [   40.980495] RBP: ffffc1cbc2cfc028 R08: 0000000000000000 R09: ffffffffa484c6c0
> [   40.980495] R10: ffff9dbcc0729cc0 R11: 0000000000000002 R12: ffff9dbcc4a75b28
> [   40.980496] R13: ffff9dbcc4a75b28 R14: ffff9dbcc01fe600 R15: ffff9dbcc51a9e00
> [   40.980498] FS:  00007ffb70ea4740(0000) GS:ffff9dbfefd80000(0000) knlGS:00000
> [   40.980499] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   40.980499] CR2: ffffc1cbc2cfbfe8 CR3: 000000010619a000 CR4: 00000000000006f0
> [   40.980501] Call Trace:
> [   40.980510]  <TASK>
> [   40.980513]  simple_unlink+0x24/0x50
> [   40.980526]  aafs_remove+0x9a/0xb0
> [   40.980543]  __aafs_ns_rmdir+0x2ec/0x3b0
> [   40.980548]  destroy_ns.part.0+0x9f/0xc0
> [   40.980558]  __aa_remove_ns+0x44/0x90
> [   40.980560]  destroy_ns.part.0+0x40/0xc0
> [   40.980562]  __aa_remove_ns+0x44/0x90
> [   40.980563]  destroy_ns.part.0+0x40/0xc0
> .....
> [   40.981324]  ns_rmdir_op+0x189/0x300
> [   40.981327]  vfs_rmdir+0x9b/0x200
> [   40.981335]  do_rmdir+0x1ac/0x1c0
> [   40.981340]  __x64_sys_rmdir+0x3f/0x70
> [   40.981342]  do_syscall_64+0x82/0x190
> [   40.981360]  ? do_fault+0x31a/0x550
> [   40.981372]  ? __handle_mm_fault+0x7c2/0xf70
> [   40.981373]  ? syscall_exit_to_user_mode_prepare+0x149/0x170
> [   40.981388]  ? __count_memcg_events+0x53/0xf0
> [   40.981392]  ? count_memcg_events.constprop.0+0x1a/0x30
> [   40.981394]  ? handle_mm_fault+0x1bb/0x2c0
> [   40.981396]  ? do_user_addr_fault+0x36c/0x620
> [   40.981408]  ? exc_page_fault+0x7e/0x180
> [   40.981412]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> .....
> [   40.981486] Kernel panic - not syncing: Fatal exception in interrupt
>
> I realize that anyone who can play with apparmor config can screw the
> box into the ground in a lot of ways, but... when you have a recursion
> kernel-side, it would be nice to have its depth bounded.  Not even root
> should be able to panic the box with a single call of rmdir(2)...

Indeed, we can cap this something about ~3x what realistically we would see with

nesting of user namespaces. Some where between between 8-16 deep should be enough.

Something like

diff --git a/security/apparmor/include/policy_ns.h b/security/apparmor/include/policy_ns.h
index d646070fd966..081a0d5988d4 100644
--- a/security/apparmor/include/policy_ns.h
+++ b/security/apparmor/include/policy_ns.h
@@ -19,6 +19,9 @@
  #include "policy.h"


+/* maximum nesting of policy namespaces */
+#define MAX_NS_DEPTH 8
+
  /* struct aa_ns_acct - accounting of profiles in namespace
   * @max_size: maximum space allowed for all profiles in namespace
   * @max_count: maximum number of profiles that can be in this namespace
diff --git a/security/apparmor/policy_ns.c b/security/apparmor/policy_ns.c
index 64783ca3b0f2..89a6fecfd39a 100644
--- a/security/apparmor/policy_ns.c
+++ b/security/apparmor/policy_ns.c
@@ -223,6 +223,9 @@ static struct aa_ns *__aa_create_ns(struct aa_ns *parent, const char *name,
      AA_BUG(!name);
      AA_BUG(!mutex_is_locked(&parent->lock));

+    if (ns->level >= MAX_NS_LEVEL)
+        return ERR_PTR(-EPERM);
+
      ns = alloc_ns(parent->base.hname, name);
      if (!ns)
          return ERR_PTR(-ENOMEM);

would do for the creation side, which should be enough. But We could also

throw in a bug check and bail against the the ns->level on the rmdir as well.





