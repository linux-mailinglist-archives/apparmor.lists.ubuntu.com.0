Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4990175A4F6
	for <lists+apparmor@lfdr.de>; Thu, 20 Jul 2023 06:05:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qMKuR-0006uo-Cs; Thu, 20 Jul 2023 04:04:59 +0000
Received: from mail-oo1-f77.google.com ([209.85.161.77])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from
 <33Ym4ZAkbAP4y45qgrrkxgvvoj.muumrk0ykxiutzktz.ius@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qMID1-0006Zq-3N
 for apparmor@lists.ubuntu.com; Thu, 20 Jul 2023 01:11:59 +0000
Received: by mail-oo1-f77.google.com with SMTP id
 006d021491bc7-5676ac40f63so530785eaf.0
 for <apparmor@lists.ubuntu.com>; Wed, 19 Jul 2023 18:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689815518; x=1690420318;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z33L3e+3x0ehmV8Vpa6tMdcfIWJ6iGZmABJfuVjRPmk=;
 b=eNfzIyzKUqoip9jJ5iCY2R0oV/abjnDf+Z7Zdx/KwLfrgsMgs7beg22HLtdJlKF00y
 Pyjj4HYpAQhqT9XZj+WeOV+jt+5i3Z1q7CTbxLdRBGN5tDkmxE7N95zGEEOLHD9wunLx
 BJov9LNAS1awM9svVxUjHFbLxQI3O7Oa3QzxWmZ4rVq3C0gBguUSLv/LYGA9nWytl0ye
 +0YuXIv/d4jP71wFxlFHOtUjt/K+7mnxqwDpMElilIBpnfB/UeQTO9/ASCVXyyCQRF4k
 NxoxQ0TVXHmQ0pc0YaQBpBFQV7FdEgsD3e/NhO4pvYPJ60hmPQ6kqDVFIm9sRKxlaJn5
 Soqw==
X-Gm-Message-State: ABy/qLaEfDeruML5apQBc61mCzX4ZpTRAG3ji2l0vgLoiyWGqRxTvRQJ
 IoR+xg2Rz3bPqstVyCtuRWQf0Asso3I4vcsMure3/KIGRAdL
X-Google-Smtp-Source: APBJJlF38UYBUnYvSOb8Vr16ImbTzB3wIQ6d26xyk3RJ/X/7fJjPmISaqBR/pOnHgINS5S0DIExou2lg67ZHMOd0p6468kOmC3I2
MIME-Version: 1.0
X-Received: by 2002:a4a:c018:0:b0:567:83f9:86f8 with SMTP id
 v24-20020a4ac018000000b0056783f986f8mr1676660oop.0.1689815517889; Wed, 19 Jul
 2023 18:11:57 -0700 (PDT)
Date: Wed, 19 Jul 2023 18:11:57 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ae0abc0600e0d534@google.com>
From: syzbot <syzbot+7d5fa8eb99155f439221@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, apparmor@lists.ubuntu.com, jmorris@namei.org, 
 john.johansen@canonical.com, john@apparmor.net, linux-ext4@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
 syzkaller-bugs@googlegroups.com, terrelln@fb.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 20 Jul 2023 04:04:58 +0000
Subject: [apparmor] [syzbot] [apparmor?] [ext4?] general protection fault in
	common_perm_cond
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

HEAD commit:    b6e6cc1f78c7 Merge tag 'x86_urgent_for_6.5_rc2' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1323c43aa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6769a69bd0e144b4
dashboard link: https://syzkaller.appspot.com/bug?extid=7d5fa8eb99155f439221
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137b16dca80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14153b7ca80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2e2f11c29840/disk-b6e6cc1f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/977c5d1c1a6d/vmlinux-b6e6cc1f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a9a9097f9fb2/bzImage-b6e6cc1f.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/e66241f633bd/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7d5fa8eb99155f439221@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000e71: 0000 [#1] PREEMPT SMP KASAN
KASAN: probably user-memory-access in range [0x0000000000007388-0x000000000000738f]
CPU: 0 PID: 4475 Comm: udevd Not tainted 6.5.0-rc1-syzkaller-00248-gb6e6cc1f78c7 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/03/2023
RIP: 0010:i_user_ns include/linux/fs.h:1289 [inline]
RIP: 0010:i_uid_into_vfsuid include/linux/fs.h:1328 [inline]
RIP: 0010:common_perm_cond+0x102/0x850 security/apparmor/lsm.c:230
Code: 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 48 06 00 00 49 8b 4f 18 49 8d 7c 24 28 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 61 06 00 00 48 b8 00 00 00 00 00 fc ff df 4d 8b
RSP: 0018:ffffc900031bfc18 EFLAGS: 00010217

RAX: dffffc0000000000 RBX: ffffc900031bfd38 RCX: ffffffff8cb831e0
RDX: 0000000000000e71 RSI: ffffffff83e1f79c RDI: 000000000000738d
RBP: 1ffff92000637f85 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000094000 R12: 0000000000007365
R13: ffffffff8ac134a0 R14: 0000000000000200 R15: ffff888016246920
FS:  00007f1f780b3c80(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000209e3000 CR3: 000000001735c000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 security_inode_getattr+0xf1/0x150 security/security.c:2114
 vfs_getattr fs/stat.c:167 [inline]
 vfs_statx+0x180/0x430 fs/stat.c:242
 vfs_fstatat+0x90/0xb0 fs/stat.c:276
 __do_sys_newfstatat+0x98/0x110 fs/stat.c:446
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f1f77d165f4
Code: 64 c7 00 09 00 00 00 83 c8 ff c3 48 89 f2 b9 00 01 00 00 48 89 fe bf 9c ff ff ff e9 00 00 00 00 41 89 ca b8 06 01 00 00 0f 05 <45> 31 c0 3d 00 f0 ff ff 76 10 48 8b 15 03 a8 0d 00 f7 d8 41 83 c8
RSP: 002b:00007ffd1a0d0c38 EFLAGS: 00000202
 ORIG_RAX: 0000000000000106
RAX: ffffffffffffffda RBX: 0000556e5d077650 RCX: 00007f1f77d165f4
RDX: 00007ffd1a0d0c50 RSI: 00007f1f77db3130 RDI: 000000000000000d
RBP: 0000556e5d080bf0 R08: 0000000000090800 R09: 0000556e5d05f360
R10: 0000000000001000 R11: 0000000000000202 R12: 00007ffd1a0d0c50
R13: 00000000000000ff R14: 0000556e5c4f71c4 R15: 0000000000000000
 </TASK>
Modules linked in:
----------------
Code disassembly (best guess):
   0:	89 fa                	mov    %edi,%edx
   2:	48 c1 ea 03          	shr    $0x3,%rdx
   6:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   a:	0f 85 48 06 00 00    	jne    0x658
  10:	49 8b 4f 18          	mov    0x18(%r15),%rcx
  14:	49 8d 7c 24 28       	lea    0x28(%r12),%rdi
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 61 06 00 00    	jne    0x695
  34:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  3b:	fc ff df
  3e:	4d                   	rex.WRB
  3f:	8b                   	.byte 0x8b


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

