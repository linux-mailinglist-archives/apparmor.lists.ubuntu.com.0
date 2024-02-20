Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D8A85C1DD
	for <lists+apparmor@lfdr.de>; Tue, 20 Feb 2024 17:58:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rcTRq-0000Yc-6M; Tue, 20 Feb 2024 16:58:26 +0000
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from
 <39jrUZQkbAPElrsdTeeXkTiibW.ZhhZeXnlXkVhgmXgm.Vhf@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rcIqN-0001Ze-IB
 for apparmor@lists.ubuntu.com; Tue, 20 Feb 2024 05:39:03 +0000
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-7c7490332deso163285339f.1
 for <apparmor@lists.ubuntu.com>; Mon, 19 Feb 2024 21:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708407542; x=1709012342;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UzEimjTxUiPK8QlGUDIMCLBh+dSodnszw3pR8qbBUsU=;
 b=YUvD0u8L0PzNU4h5D0moQkI5eg8l8z5dY9ULPtwd11v4j3XcKDFjMfCnSEJ9AzVE3E
 N5JRQPBwSvosiMfHhR4rJOfLPgE0SIMeE7jo6zX2XEo/z6u5isYRa0Dl7MD34SMsey9c
 QKjjUYq2VPcTzrCI+bWfbe9Iw/rn1tllv8i4KdUlIPzZkCHAWSKFokmajf0vxIJw/Brc
 ew1LAeVP2CZIpm7xIVoMZdJ1o2WU+lRSlxjyeec4a6TOR5W+wvo+PGsT5uVcelg/jvGu
 ZAeX0mxDGjga6gLAEm+z0X0A2rWNxfPBePJ9pbgES1YNBPA7fIZXwouo5z984PlJh49P
 jPGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs7egc2Z6UjXuWb5/BIwMyDDz1aF2HZAkZMlHFHK12bPVmq3TMCphlJtmAltTZ7mbadWTPQ9ehbJr1bp+Mqgs0xBIUNY+71YTB
X-Gm-Message-State: AOJu0YzvrvcGy2YBg0pNSGCghKKFAEG+uv3nRuPzqJXskcIQFTDNnOkr
 vjl7PqaS4oauDWNac/dwZRvF2S9xYqwJp+A+rL628JVxk95B79/XqDr9ahPm580jpfWK4c0Rs1Q
 XVZ0Hn6vVDDO9kepd5/luIilZBwkWwBvQQSuMj10gEWd5+uPvMtlq4Ec=
X-Google-Smtp-Source: AGHT+IEOpIm03ZiZ2lJ/lHSHFI+Mm8U5WA8Q/IrAgn3qmmy4iCtGItZ/O8nuHuz2UprhExvnzs9gW9Vv5lJb7mKBrqgvWKGHB8LF
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4905:b0:473:edc2:9589 with SMTP id
 cx5-20020a056638490500b00473edc29589mr271909jab.3.1708407542209; Mon, 19 Feb
 2024 21:39:02 -0800 (PST)
Date: Mon, 19 Feb 2024 21:39:02 -0800
In-Reply-To: <000000000000ae0abc0600e0d534@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000af682a0611c9a06f@google.com>
From: syzbot <syzbot+7d5fa8eb99155f439221@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, apparmor-owner@lists.ubuntu.com, 
 apparmor@lists.ubuntu.com, axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
 jmorris@namei.org, john.johansen@canonical.com, john@apparmor.net, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 paul@paul-moore.com, serge@hallyn.com, syzkaller-bugs@googlegroups.com, 
 terrelln@fb.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 20 Feb 2024 16:58:23 +0000
Subject: Re: [apparmor] [syzbot] [apparmor?] [ext4?] general protection
	fault in common_perm_cond
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

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1644f22c180000
start commit:   b6e6cc1f78c7 Merge tag 'x86_urgent_for_6.5_rc2' of git://g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=6769a69bd0e144b4
dashboard link: https://syzkaller.appspot.com/bug?extid=7d5fa8eb99155f439221
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137b16dca80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14153b7ca80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

