Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C89A6D3E7
	for <lists+apparmor@lfdr.de>; Mon, 24 Mar 2025 06:52:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1twaje-0001wW-3c; Mon, 24 Mar 2025 05:52:30 +0000
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from
 <3z6_fZwkbAPImsteUffYlUjjcX.aiiafYomYlWihnYhn.Wig@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1twFCi-000876-Oe
 for apparmor@lists.ubuntu.com; Sun, 23 Mar 2025 06:53:04 +0000
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-85e310ba2f9so156029439f.0
 for <apparmor@lists.ubuntu.com>; Sat, 22 Mar 2025 23:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742712783; x=1743317583;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uuTtDdQllfqVQdTnY1GFjo08/XepPL02PHTKNSl5Nyk=;
 b=NPLQMFMcE77VmvKddfgpj6l7MiMeJWPrIPxBP/dbwBiXpvwMz+T7RhZIB6cLegbK/6
 nX3ldbNT9mtuHmvSqSdZjN6UgHVN1KJNSs3MtnH6IfzAVAbxBnphbnD+8kYhMf+mFQwj
 3RPgeYI+uXza/uvpLOoaoD3QpzZxuNxEcj4zpEoghuWTWCtORMP3ulWZGwHZUUea64JV
 RzZEhRqD8cMxD1K7tfLQfmU8a22YaTPGvV6YMtlsDAqYRL9fSq14nwseaZCKsqu/J1cB
 S30C74ef4qNbTUuExHfnXGQWzprUY81JbpIb/ecIQBp76jXU2vtmPWclrFehaTxoTMxG
 sTeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgSCf5cKAdWAX8RpKkqeKVcDV8HnWHRukDPQX2gjLctdg9Xc0zFHIDOxqttpX5tbeoG1/8Kx+f7g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxPQEfhM4SSzEYnd4uL+HIzKOQvM0i1zlLjEqfQwp9bxaKsVhBh
 sg0+bfI5wVskh382t1pc0iLx7OG01gcjsVS9xq2O7yAbFQIPX/8biuKR0R7bbXeT7SmLmSmnVL6
 w048/WaTqc6FmMa4E+MUlywCbqFXUgFqfcUK71xxqcF3RI/EPcHNYCGc=
X-Google-Smtp-Source: AGHT+IFomXej1RrN6WELV4Qii9/yxfjxlWnmlmMb+ysYA1j31F3Z04e+3d3vMyCUXzjVvvz9y1wv7XB/R6rxL+wT2R6HvXmksUMF
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:378c:b0:3d3:cdb0:a227 with SMTP id
 e9e14a558f8ab-3d5960f4d68mr77368565ab.9.1742712783188; Sat, 22 Mar 2025
 23:53:03 -0700 (PDT)
Date: Sat, 22 Mar 2025 23:53:03 -0700
In-Reply-To: <6707499c.050a0220.1139e6.0017.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67dfafcf.050a0220.31a16b.0058.GAE@google.com>
From: syzbot <syzbot+17bc8c5157022e18da8b@syzkaller.appspotmail.com>
To: apparmor-owner@lists.ubuntu.com, apparmor@lists.ubuntu.com, 
 edumazet@google.com, jmorris@namei.org, john.johansen@canonical.com, 
 john@apparmor.net, kuba@kernel.org, kuniyu@amazon.com, 
 linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
 paul@paul-moore.com, penguin-kernel@i-love.sakura.ne.jp, razor@blackwall.org, 
 serge@hallyn.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.70;
 envelope-from=3z6_fZwkbAPImsteUffYlUjjcX.aiiafYomYlWihnYhn.Wig@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
 helo=mail-io1-f70.google.com
X-Mailman-Approved-At: Mon, 24 Mar 2025 05:52:28 +0000
Subject: Re: [apparmor] [syzbot] [net] INFO: rcu detected stall in
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

syzbot suspects this issue was fixed by commit:

commit e759e1e4a4bd2926d082afe56046a90224433a31
Author: Eric Dumazet <edumazet@google.com>
Date:   Wed Jan 29 14:27:26 2025 +0000

    net: revert RTNL changes in unregister_netdevice_many_notify()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1084f004580000
start commit:   fc20a3e57247 Merge tag 'for-linus-6.12a-rc2-tag' of git://..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba92623fdea824c9
dashboard link: https://syzkaller.appspot.com/bug?extid=17bc8c5157022e18da8b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=135f7d27980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1483b380580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: net: revert RTNL changes in unregister_netdevice_many_notify()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

