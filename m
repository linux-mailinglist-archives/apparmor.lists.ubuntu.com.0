Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D44B44C93
	for <lists+apparmor@lfdr.de>; Fri,  5 Sep 2025 06:05:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uuNgx-0006ME-GM; Fri, 05 Sep 2025 04:04:51 +0000
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from
 <3GKu5aAkbAKETZaLBMMFSBQQJE.HPPHMFVTFSDPOUFOU.DPN@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uuBYI-0002Lv-7O
 for apparmor@lists.ubuntu.com; Thu, 04 Sep 2025 15:07:06 +0000
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-8870219dce3so105028039f.0
 for <apparmor@lists.ubuntu.com>; Thu, 04 Sep 2025 08:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756998425; x=1757603225;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tLO91xyldPwJGtv4KAJ9Dss03Zr2mNg6Ty96jb715OM=;
 b=RPMMCxSjojbkk4Oq7SMPYN/1kTdIDB5lY072jVtA9CEINEuoUEouRExwRXhuYGH3eJ
 cp0al6mFQuXINjhokCtrvCe8uEkU8pEntjEdbZ0UY6w82iVxVd2fP3sulLqQm9HqBn3K
 XzzbDEyixiei/AuXfp0aHfoqPPfUGCWqjXHtOzXTOLHKGfRkFjKOgJwgf9XupH2jBKR3
 TQl5qnxt/ZcFYcgmOYPyjbZYQyo0GKr4STw5Va1jKvySQzeKX0EEqrb6p8Zy4/19/fGE
 pxxbWzS4Ukm8wu4K0zA4/vZvH0uyrDcrAARuvly/KkA2Nzz4vAxaTBOhlDA8VMcNcgrW
 WwNQ==
X-Gm-Message-State: AOJu0Yxj+Od2Lq2d2uurOhVjIfUx2GX5qwHQUV3MaVXYMwm2kZuflN7F
 5DFySd6D7C8vRN5CXooC9Rh7/JnNkKBJpfcy1DFwHNIatEPNPHRYLz6ri03jr0LbdJDTEADbEP/
 MMyI4jIGVgtMA7vG9nCElPOqGm9HSm1aTESZFlLvSTaEURT6c6BpuHF4sdqs=
X-Google-Smtp-Source: AGHT+IGPt5XXPZQ71LRSq35os/98bkbkleFEzJZRK9KO1wphEAorWaJE0sjRcGoS9N8q2GtO62tIzPc9fUr+UXPnANVDnXDcNjgk
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:144c:b0:3ef:969c:c91 with SMTP id
 e9e14a558f8ab-3f400097800mr372808605ab.6.1756998424765; Thu, 04 Sep 2025
 08:07:04 -0700 (PDT)
Date: Thu, 04 Sep 2025 08:07:04 -0700
In-Reply-To: <68b93e3c.a00a0220.eb3d.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68b9ab18.050a0220.192772.0008.GAE@google.com>
From: syzbot <syzbot+bb185b018a51f8d91fd2@syzkaller.appspotmail.com>
To: apparmor@lists.ubuntu.com, audit@vger.kernel.org, casey@schaufler-ca.com, 
 davem@davemloft.net, edumazet@google.com, eparis@redhat.com, 
 eric.dumazet@gmail.com, horms@kernel.org, jmorris@namei.org, 
 john.johansen@canonical.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, luto@kernel.org, 
 netdev@vger.kernel.org, omosnace@redhat.com, pabeni@redhat.com, 
 paul@paul-moore.com, peterz@infradead.org, selinux@vger.kernel.org, 
 serge@hallyn.com, stephen.smalley.work@gmail.com, 
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.69;
 envelope-from=3GKu5aAkbAKETZaLBMMFSBQQJE.HPPHMFVTFSDPOUFOU.DPN@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
 helo=mail-io1-f69.google.com
X-Mailman-Approved-At: Fri, 05 Sep 2025 04:04:50 +0000
Subject: Re: [apparmor] [syzbot] [kernel?] INFO: trying to register
 non-static key in skb_dequeue (4)
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

syzbot has bisected this issue to:

commit eb59d494eebd4c5414728a35cdea6a0ba78ff26e
Author: Casey Schaufler <casey@schaufler-ca.com>
Date:   Sat Aug 16 17:28:58 2025 +0000

    audit: add record for multiple task security contexts

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1199fe62580000
start commit:   5d50cf9f7cf2 Add linux-next specific files for 20250903
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1399fe62580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1599fe62580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d2429dff5531d80
dashboard link: https://syzkaller.appspot.com/bug?extid=bb185b018a51f8d91fd2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15b9a312580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16819e62580000

Reported-by: syzbot+bb185b018a51f8d91fd2@syzkaller.appspotmail.com
Fixes: eb59d494eebd ("audit: add record for multiple task security contexts")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

