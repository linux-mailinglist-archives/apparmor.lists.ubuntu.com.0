Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9BE9CFBE9
	for <lists+apparmor@lfdr.de>; Sat, 16 Nov 2024 01:59:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tC7A4-0002EV-WE; Sat, 16 Nov 2024 00:59:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <nathan@kernel.org>) id 1tC7A3-0002EN-Ez
 for apparmor@lists.ubuntu.com; Sat, 16 Nov 2024 00:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 72600A4293E;
 Sat, 16 Nov 2024 00:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63932C4CECF;
 Sat, 16 Nov 2024 00:59:37 +0000 (UTC)
Date: Fri, 15 Nov 2024 17:59:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: syzbot <syzbot+a521f132f5a83d10ab40@syzkaller.appspotmail.com>
Message-ID: <20241116005935.GA1180844@thelio-3990X>
References: <67371529.050a0220.1324f8.00a4.GAE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67371529.050a0220.1324f8.00a4.GAE@google.com>
Received-SPF: pass client-ip=147.75.193.91; envelope-from=nathan@kernel.org;
 helo=nyc.source.kernel.org
Subject: Re: [apparmor] [syzbot] linux-next build error (18)
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
Cc: sfr@canb.auug.org.au, paul@paul-moore.com, syzkaller-bugs@googlegroups.com,
 apparmor@lists.ubuntu.com, jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-next@vger.kernel.org,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Nov 15, 2024 at 01:32:25AM -0800, syzbot wrote:
> syzbot found the following issue on:
> 
> HEAD commit:    744cf71b8bdf Add linux-next specific files for 20241115
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=10525cc0580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ada879778ea11d6f
> dashboard link: https://syzkaller.appspot.com/bug?extid=a521f132f5a83d10ab40
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+a521f132f5a83d10ab40@syzkaller.appspotmail.com
> 
> security/apparmor/domain.c:695:3: error: expected expression
> security/apparmor/domain.c:697:3: error: use of undeclared identifier 'new_profile'
> security/apparmor/domain.c:699:8: error: use of undeclared identifier 'new_profile'
> security/apparmor/domain.c:704:11: error: use of undeclared identifier 'new_profile'

I sent a patch for this earlier this week but it does not look like it
has been picked up yet:

https://lore.kernel.org/20241111-apparmor-fix-label-declaration-warning-v1-1-adb64ab6482b@kernel.org/

Cheers,
Nathan

