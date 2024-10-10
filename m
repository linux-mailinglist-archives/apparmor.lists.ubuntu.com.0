Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E5452999F0D
	for <lists+apparmor@lfdr.de>; Fri, 11 Oct 2024 10:31:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1szB3J-0007KC-OA; Fri, 11 Oct 2024 08:31:13 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1sypmq-0005rP-7w
 for apparmor@lists.ubuntu.com; Thu, 10 Oct 2024 09:48:48 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 49A9mCMT030328;
 Thu, 10 Oct 2024 18:48:12 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 49A9mCwE030323
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 10 Oct 2024 18:48:12 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <7fbdb7db-57c3-47b8-89ed-da974d03f17f@I-love.SAKURA.ne.jp>
Date: Thu, 10 Oct 2024 18:48:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+17bc8c5157022e18da8b@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Network Development <netdev@vger.kernel.org>
References: <6707499c.050a0220.1139e6.0017.GAE@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <6707499c.050a0220.1139e6.0017.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav404.rs.sakura.ne.jp
X-Virus-Status: clean
Received-SPF: pass client-ip=202.181.97.72;
 envelope-from=penguin-kernel@I-love.SAKURA.ne.jp; helo=www262.sakura.ne.jp
X-Mailman-Approved-At: Fri, 11 Oct 2024 08:31:12 +0000
Subject: Re: [apparmor] [syzbot] [apparmor?] [ext4?] INFO: rcu detected
 stall in sys_getdents64
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

This is a printk() flooding problem in bridge driver. Should consider using ratelimit.

#syz set subsystems: net

On 2024/10/10 12:27, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    fc20a3e57247 Merge tag 'for-linus-6.12a-rc2-tag' of git://..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1083b380580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ba92623fdea824c9
> dashboard link: https://syzkaller.appspot.com/bug?extid=17bc8c5157022e18da8b
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=135f7d27980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1483b380580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/2ad9af7b84b4/disk-fc20a3e5.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/1afa462ca485/vmlinux-fc20a3e5.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/75c0900b4786/bzImage-fc20a3e5.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+17bc8c5157022e18da8b@syzkaller.appspotmail.com
> 
> bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
> rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P5244/1:b..l
> rcu: 	(detected by 1, t=10503 jiffies, g=5253, q=1466 ncpus=2)
> task:syz-executor116 state:R  running task     stack:18800 pid:5244  tgid:5244  ppid:5243   flags:0x00000002
(...snipped...)
> net_ratelimit: 33488 callbacks suppressed
> bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
> bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
> bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
> bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
> bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
> bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
> bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
> bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
> bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
> bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)


