Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D371999F0C
	for <lists+apparmor@lfdr.de>; Fri, 11 Oct 2024 10:31:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1szB3J-0007K5-Gn; Fri, 11 Oct 2024 08:31:13 +0000
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from
 <3nEkHZwkbAIs7DEzp00t6p44xs.v33v0t97t6r328t28.r31@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1syjpm-0005n0-4Y
 for apparmor@lists.ubuntu.com; Thu, 10 Oct 2024 03:27:26 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3a3a3a35f5bso6823335ab.2
 for <apparmor@lists.ubuntu.com>; Wed, 09 Oct 2024 20:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728530845; x=1729135645;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jEx9yKuMGxDRrUtWwPljPyF1GgQ0nu0DmQ9JAD07cSo=;
 b=uKMQyWhnBJUEadn6ekkaqUW8nl5EaBDspfAqLMxOuKqHGZ0ExudlFQSu10z8mcZzBX
 zRS77sZbTCTrVBp/UU4Rv+j8b/DQPlVdf3XrJMRI1pOa0v6VHu4heOpkXBfnkAy1iggU
 ynSMkKcLVa8bsnMAappTaqGYyPmznbKBZEfHVdGMtZTxLcd3DGBfWaC/I7crGiz4Mp6C
 FHgqjkinulupaQGXgIAyKTe/c04ZxQLXTeU07gHeyL+aDdSMkYMpVAwypUo+4QW4VEv5
 RYJpIChI7aP9l391EUUUyUYlC/uJmNn7gDjq3P634Sy5KT36iD9eVD1s0aiSk3pdVYdj
 4FpQ==
X-Gm-Message-State: AOJu0YzMM/o1gOrgE7o+TEfL6LXuF47//ReoTiTxk0C7VlJCO7g26zYL
 d4s3dZiFX6QWyQGA14Zutdh/PiWjcb3vWzJ0wBGyD4DHavI+K9l2+4BhhK5aRed0k/SeHrYdTjm
 tauKchtbVFKL53xlyzjxAdchHAWQS3gkbqAUTICEVCBK6nwUnzOGJ5FQ=
X-Google-Smtp-Source: AGHT+IHDU82AOk2ZEpKb4SnDnZQy26i42yEs9sTRQ7eK3b6pH4bNbiHHLXseYYnp2CbhKX5Kbmc8+aaB9Elbmi5KDJAk94TM5CQE
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a83:b0:3a3:4122:b56e with SMTP id
 e9e14a558f8ab-3a397d1da78mr42417435ab.26.1728530844764; Wed, 09 Oct 2024
 20:27:24 -0700 (PDT)
Date: Wed, 09 Oct 2024 20:27:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6707499c.050a0220.1139e6.0017.GAE@google.com>
From: syzbot <syzbot+17bc8c5157022e18da8b@syzkaller.appspotmail.com>
To: apparmor@lists.ubuntu.com, jmorris@namei.org, john.johansen@canonical.com, 
 john@apparmor.net, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.198;
 envelope-from=3nEkHZwkbAIs7DEzp00t6p44xs.v33v0t97t6r328t28.r31@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
 helo=mail-il1-f198.google.com
X-Mailman-Approved-At: Fri, 11 Oct 2024 08:31:12 +0000
Subject: [apparmor] [syzbot] [apparmor?] [ext4?] INFO: rcu detected stall in
	sys_getdents64
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

Hello,

syzbot found the following issue on:

HEAD commit:    fc20a3e57247 Merge tag 'for-linus-6.12a-rc2-tag' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1083b380580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba92623fdea824c9
dashboard link: https://syzkaller.appspot.com/bug?extid=17bc8c5157022e18da8b
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=135f7d27980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1483b380580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2ad9af7b84b4/disk-fc20a3e5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1afa462ca485/vmlinux-fc20a3e5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/75c0900b4786/bzImage-fc20a3e5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+17bc8c5157022e18da8b@syzkaller.appspotmail.com

bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P5244/1:b..l
rcu: 	(detected by 1, t=10503 jiffies, g=5253, q=1466 ncpus=2)
task:syz-executor116 state:R  running task     stack:18800 pid:5244  tgid:5244  ppid:5243   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x1895/0x4b30 kernel/sched/core.c:6675
 preempt_schedule_irq+0xfb/0x1c0 kernel/sched/core.c:6997
 irqentry_exit+0x5e/0x90 kernel/entry/common.c:354
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_release+0x658/0xa30 kernel/locking/lockdep.c:5850
Code: 3c 3b 00 74 08 4c 89 f7 e8 b5 15 8e 00 f6 84 24 91 00 00 00 02 75 77 41 f7 c5 00 02 00 00 74 01 fb 48 c7 44 24 60 0e 36 e0 45 <4b> c7 04 27 00 00 00 00 4b c7 44 27 08 00 00 00 00 65 48 8b 04 25
RSP: 0018:ffffc90003da79e0 EFLAGS: 00000206
RAX: 0000000000000001 RBX: 1ffff920007b4f4e RCX: ffffc90003da7a03
RDX: 0000000000000001 RSI: ffffffff8c0adc40 RDI: ffffffff8c60f920
RBP: ffffc90003da7b10 R08: ffffffff901ceaaf R09: 1ffffffff2039d55
R10: dffffc0000000000 R11: fffffbfff2039d56 R12: 1ffff920007b4f48
R13: 0000000000000246 R14: ffffc90003da7a70 R15: dffffc0000000000
 rcu_lock_release include/linux/rcupdate.h:347 [inline]
 rcu_read_unlock include/linux/rcupdate.h:880 [inline]
 aa_file_perm+0x3ea/0xf50 security/apparmor/file.c:599
 common_file_perm+0x19c/0x210 security/apparmor/lsm.c:533
 security_file_permission+0x90/0x280 security/security.c:2839
 iterate_dir+0xa9/0x800 fs/readdir.c:93
 __do_sys_getdents64 fs/readdir.c:407 [inline]
 __se_sys_getdents64+0x1d3/0x4a0 fs/readdir.c:392
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe260ad3293
RSP: 002b:00007fe260c3eb68 EFLAGS: 00000293 ORIG_RAX: 00000000000000d9
RAX: ffffffffffffffda RBX: 000055557789b810 RCX: 00007fe260ad3293
RDX: 0000000000008000 RSI: 000055557789b810 RDI: 0000000000000003
RBP: 000055557789b7e4 R08: 0000000029585289 R09: 7fffffffffffffff
R10: 0000000000001000 R11: 0000000000000293 R12: ffffffffffffffb8
R13: 0000000000000016 R14: 000055557789b7e0 R15: 000000000000000e
 </TASK>
rcu: rcu_preempt kthread starved for 6018 jiffies! g5253 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=1
rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:R  running task     stack:25816 pid:17    tgid:17    ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x1895/0x4b30 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6767
 schedule_timeout+0x1be/0x310 kernel/time/timer.c:2615
 rcu_gp_fqs_loop+0x2df/0x1330 kernel/rcu/tree.c:2045
 rcu_gp_kthread+0xa7/0x3b0 kernel/rcu/tree.c:2247
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
rcu: Stack dump where RCU GP kthread last ran:
CPU: 1 UID: 0 PID: 24 Comm: ksoftirqd/1 Not tainted 6.12.0-rc1-syzkaller-00330-gfc20a3e57247 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:preempt_count arch/x86/include/asm/preempt.h:26 [inline]
RIP: 0010:check_kcov_mode kernel/kcov.c:183 [inline]
RIP: 0010:__sanitizer_cov_trace_pc+0x11/0x70 kernel/kcov.c:217
Code: 5b e9 f3 c8 5d 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 8b 04 24 65 48 8b 0c 25 c0 d7 03 00 <65> 8b 15 40 01 6f 7e 81 e2 00 01 ff 00 74 11 81 fa 00 01 00 00 75
RSP: 0018:ffffc900001e7260 EFLAGS: 00000246
RAX: ffffffff8a985383 RBX: 0000000000000001 RCX: ffff88801d2f0000
RDX: 0000000000000100 RSI: 000000000000004a RDI: ffff88802d3a0000
RBP: ffff88802d3a0000 R08: ffffffff8a984050 R09: 0000000000000000
R10: ffffc900001e73b0 R11: ffffffff8a983ef0 R12: ffff8880904dc640
R13: ffff8880904dc640 R14: 000000000000004a R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005555778a3818 CR3: 000000002436c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 </IRQ>
 <TASK>
 net_generic+0x13/0x240 include/net/netns/generic.h:41
 br_nf_pre_routing+0x1ca/0x1470 net/bridge/br_netfilter_hooks.c:520
 nf_hook_entry_hookfn include/linux/netfilter.h:154 [inline]
 nf_hook_bridge_pre net/bridge/br_input.c:277 [inline]
 br_handle_frame+0x9fd/0x1530 net/bridge/br_input.c:424
 __netif_receive_skb_core+0x13e8/0x4570 net/core/dev.c:5560
 __netif_receive_skb_one_core net/core/dev.c:5664 [inline]
 __netif_receive_skb+0x12f/0x650 net/core/dev.c:5779
 process_backlog+0x662/0x15b0 net/core/dev.c:6111
 __napi_poll+0xcb/0x490 net/core/dev.c:6775
 napi_poll net/core/dev.c:6844 [inline]
 net_rx_action+0x89b/0x1240 net/core/dev.c:6966
 handle_softirqs+0x2c5/0x980 kernel/softirq.c:554
 run_ksoftirqd+0xca/0x130 kernel/softirq.c:927
 smpboot_thread_fn+0x544/0xa30 kernel/smpboot.c:164
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
net_ratelimit: 33488 callbacks suppressed
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

