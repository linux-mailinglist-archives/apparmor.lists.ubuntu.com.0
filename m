Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B839B0DF6F
	for <lists+apparmor@lfdr.de>; Tue, 22 Jul 2025 16:50:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ueEJw-0007rJ-2g; Tue, 22 Jul 2025 14:50:20 +0000
Received: from mail-io1-f78.google.com ([209.85.166.78])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from
 <34wl-aAkbADoouvgWhhanWlleZ.ckkchaqoanYkjpajp.Yki@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1udmvk-0007rC-Iy
 for apparmor@lists.ubuntu.com; Mon, 21 Jul 2025 09:35:32 +0000
Received: by mail-io1-f78.google.com with SMTP id
 ca18e2360f4ac-87c1d1356f3so182320739f.0
 for <apparmor@lists.ubuntu.com>; Mon, 21 Jul 2025 02:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753090531; x=1753695331;
 h=content-transfer-encoding:to:from:subject:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uYc/vDtNMTkmIow0Px2oZm6vbRSlAyud1JI5Tp027Wk=;
 b=VWA4jSk+NeUkkSuA406YWAt1PzphPiaQE9zjhWAj0O96DEU/SXwX8f7nvihoBIjfyO
 WyW7zaaBN0NnM7hZBwUXYXlbJs8BajP9fnwJEJDMr/I3jPhbW2JMGX8tXZYbaz2/B/eE
 Xf6iurnLQef8wszFTqVbl0jOxF62fOX5w5hIApW5j+PklJ2Mb9jL+XyyhAjUxJPg5/v/
 U7Sw8FY3xu++/ZihU1Vs95sWXdfUaQSnePX/wC4CP4jh6Xo/GsC8SsOBjrPh4LeN9tQp
 TDSdih4o51gF82TlbXeFm5rTbsRVTe3JVrXJ9YTFP4oiMcQ/ha+60BbzC5walxcTc8R/
 OWWw==
X-Gm-Message-State: AOJu0YxBq2KZ4PJ4lCKc542eQWdnZjmB3rwqfaX8M+NaVGrFPNOVJ7Md
 oTXvijEnd3BAn0IkA++YyDLQvgQVmdaGXEGu5j7rHjQsULI1x06sX49NOJygb0giuVe40BY1DVQ
 x4COwVfqnzzirFGQcBCYk7t/aqQXS9Cit+sbqKSZH7hFMufRFWXP0hbwz64k82g==
X-Google-Smtp-Source: AGHT+IE36MNzd0e64f6m1+Tts8MfnrEcPlLa/PxmLnThU6J0DiYR17Mzo8OX7AtvIC3BO5/vjSetMa49v6BW0mV1BOW9UYSiKaVX
MIME-Version: 1.0
X-Received: by 2002:a05:6602:400e:b0:87c:1542:8abc with SMTP id
 ca18e2360f4ac-87c15428e5cmr1298312539f.4.1753090531132; Mon, 21 Jul 2025
 02:35:31 -0700 (PDT)
Date: Mon, 21 Jul 2025 02:35:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <687e09e3.a70a0220.693ce.00eb.GAE@google.com>
From: syzbot <syzbot+cd38ee04bcb3866b0c6d@syzkaller.appspotmail.com>
To: apparmor@lists.ubuntu.com, jmorris@namei.org, john.johansen@canonical.com, 
 john@apparmor.net, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 linux-security-module@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
 sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.78;
 envelope-from=34wl-aAkbADoouvgWhhanWlleZ.ckkchaqoanYkjpajp.Yki@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
 helo=mail-io1-f78.google.com
X-Mailman-Approved-At: Tue, 22 Jul 2025 14:50:17 +0000
Subject: [apparmor] [syzbot] [apparmor?] linux-next test error: WARNING in
	apparmor_unix_stream_connect
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

HEAD commit:    979875200256 Add linux-next specific files for 20250721
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=3D13bf7f98580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9baac92c2ceb707
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dcd38ee04bcb3866b0=
c6d
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-=
1~exp1~20250616065826.132), Debian LLD 20.1.7

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9bf2232f3c8e/disk-=
97987520.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ae51e7da64a4/vmlinux-=
97987520.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e05ecb1741a9/bzI=
mage-97987520.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+cd38ee04bcb3866b0c6d@syzkaller.appspotmail.com

------------[ cut here ]------------
AppArmor WARN apparmor_unix_stream_connect: ((({ typeof(*(new_ctx->label)) =
*__UNIQUE_ID_rcu2213 =3D (typeof(*(new_ctx->label)) *)({ do { __attribute__=
((__noreturn__)) extern void __compiletime_assert_2214(void) __attribute__(=
(__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((si=
zeof((new_ctx->label)) =3D=3D sizeof(char) || sizeof((new_ctx->label)) =3D=
=3D sizeof(short) || sizeof((new_ctx->label)) =3D=3D sizeof(int) || sizeof(=
(new_ctx->label)) =3D=3D sizeof(long)) || sizeof((new_ctx->label)) =3D=3D s=
izeof(long long))) __compiletime_assert_2214(); } while (0); (*(const volat=
ile typeof( _Generic(((new_ctx->label)), char: (char)0, unsigned char: (uns=
igned char)0, signed char: (signed char)0, unsigned short: (unsigned short)=
0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int=
: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long=
)0, unsigned long long: (unsigned long long)0, signed long long: (signed lo=
ng long)0, default: ((new_ctx->label)))) *)&((new_ctx->label))); }); ;=20
WARNING: security/apparmor/lsm.c:1211 at apparmor_unix_stream_connect+0x5fa=
/0x650 security/apparmor/lsm.c:1211, CPU#0: udevadm/5318
Modules linked in:
CPU: 0 UID: 0 PID: 5318 Comm: udevadm Not tainted 6.16.0-rc7-next-20250721-=
syzkaller #0 PREEMPT(full)=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 05/07/2025
RIP: 0010:apparmor_unix_stream_connect+0x5fa/0x650 security/apparmor/lsm.c:=
1211
Code: 1c 3b fd 48 89 ef e8 35 4d 00 00 e9 09 fe ff ff e8 ab 1c 3b fd 90 48 =
c7 c7 40 31 fd 8b 48 c7 c6 2a 2e c7 8d e8 07 a4 fe fc 90 <0f> 0b 90 90 e9 2=
7 fe ff ff e8 88 1c 3b fd be 02 00 00 00 eb 0a e8
RSP: 0018:ffffc90003367c38 EFLAGS: 00010246
RAX: 5674fa5d0d24c800 RBX: 1ffff1100fad97d0 RCX: ffff888026cd5a00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000002
RBP: ffff88801ba8f8f8 R08: ffff8880b8624253 R09: 1ffff110170c484a
R10: dffffc0000000000 R11: ffffed10170c484b R12: ffff88807d6cbe80
R13: 1ffff1100fbc1bc8 R14: 0000000000000000 R15: 000000000000002f
FS:  00007f8de3bff880(0000) GS:ffff8881257a6000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8de347ae00 CR3: 000000007fc96000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 security_unix_stream_connect+0xcb/0x2c0 security/security.c:4540
 unix_stream_connect+0x8fc/0x1010 net/unix/af_unix.c:1753
 __sys_connect_file net/socket.c:2086 [inline]
 __sys_connect+0x313/0x440 net/socket.c:2105
 __do_sys_connect net/socket.c:2111 [inline]
 __se_sys_connect net/socket.c:2108 [inline]
 __x64_sys_connect+0x7a/0x90 net/socket.c:2108
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8de34a7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc =
74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 0=
0 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffc79327430 EFLAGS: 00000202 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 00007f8de3bff880 RCX: 00007f8de34a7407
RDX: 0000000000000013 RSI: 000055d4ba7cf948 RDI: 0000000000000003
RBP: 000000000000001e R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffc79327490
R13: 0000000000000000 R14: 0000000000000007 R15: 0000000000000000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

