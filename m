Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A9647464
	for <lists+apparmor@lfdr.de>; Thu,  8 Dec 2022 17:34:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p3Jqt-0002Yz-Dd; Thu, 08 Dec 2022 16:34:27 +0000
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from
 <34aSRYwkbAJQGMN8y992FyDD61.4CC492IG2F0CBH2BH.0CA@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1p3Ca3-0004KJ-1U
 for apparmor@lists.ubuntu.com; Thu, 08 Dec 2022 08:48:35 +0000
Received: by mail-io1-f71.google.com with SMTP id
 a14-20020a6b660e000000b006bd37975cdfso369080ioc.10
 for <apparmor@lists.ubuntu.com>; Thu, 08 Dec 2022 00:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/VqWjUYvuQWzVVThhoLexOpyvD8JYD0kumxHxmjGt2g=;
 b=c8cwOG4XfE7IJ3YlXTVoevfd9yinU0ys+WtPCdXGNdtRKuSwBIxPZVpx2N9bpD88qM
 rHKfzuiPEqys33PBtZSdfnc5yE+gfFCZUaNseGColoUOWpsaC00GrVSgIj1u9TgHgagd
 PRhJRwRWG0E9I7DVZZtfhe4O0ZVRPgxdoaaXcj51aN8UZxq6gwKwPYRRqvJW06ya5hnd
 azYvUKgqm39kV5y8HWFW7pccgDnKUIX5zWvD/xYZJacoPorazrx2RRyea7X+w5Ibdu2C
 uzlRLo5X+VPodwRMWSo0RZs0gCkmclYHwIYm+kmmKIVn+khnt9Rh+hHQB80cg/F35ybn
 DpZQ==
X-Gm-Message-State: ANoB5plq8C62JYeGmFP44H9+JpAjOaJhJi4C+HQYU9D6dooE9XBGbg1D
 sXA/pjhJm7lneFs3/3teStHO5MvYdTK+qSzvQnPAshlXuEm6
X-Google-Smtp-Source: AA0mqf7J8Po0jhjVcm8aCQTLmycs2e4R5vkgSAXCxFOqvvhtjFItvSs7WEGS0OdjpuIhvRw2gEFOIhjlmh/2oOAzyftS2OKgKISi
MIME-Version: 1.0
X-Received: by 2002:a92:c887:0:b0:302:fd5c:e0a3 with SMTP id
 w7-20020a92c887000000b00302fd5ce0a3mr28917754ilo.116.1670489313757; Thu, 08
 Dec 2022 00:48:33 -0800 (PST)
Date: Thu, 08 Dec 2022 00:48:33 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000025d41005ef4d1a72@google.com>
From: syzbot <syzbot+5301015e05ed3b325b0d@syzkaller.appspotmail.com>
To: apparmor@lists.ubuntu.com, jmorris@namei.org, john.johansen@canonical.com, 
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
 linux-security-module@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
 sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com, terrelln@fb.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 08 Dec 2022 16:34:25 +0000
Subject: [apparmor] [syzbot] linux-next build error (14)
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

HEAD commit:    f925116b24c0 Add linux-next specific files for 20221208
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15dfabd3880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b2d3e63e054c24f
dashboard link: https://syzkaller.appspot.com/bug?extid=5301015e05ed3b325b0d
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5301015e05ed3b325b0d@syzkaller.appspotmail.com

security/apparmor/policy_unpack.c:316:18: error: unknown type name 'tri'
security/apparmor/policy_unpack.c:325:10: error: 'TRI_TRUE' undeclared (first use in this function)
security/apparmor/policy_unpack.c:328:9: error: 'TRI_NONE' undeclared (first use in this function); did you mean 'IRQ_NONE'?
security/apparmor/policy_unpack.c:331:9: error: 'TRI_FALSE' undeclared (first use in this function)
security/apparmor/policy_unpack.c:455:42: error: 'TRI_TRUE' undeclared (first use in this function)
security/apparmor/policy_unpack.c:529:42: error: 'TRI_TRUE' undeclared (first use in this function)
security/apparmor/policy_unpack.c:559:42: error: 'TRI_TRUE' undeclared (first use in this function)
security/apparmor/policy_unpack.c:611:42: error: 'TRI_TRUE' undeclared (first use in this function)
security/apparmor/policy_unpack.c:674:42: error: 'TRI_TRUE' undeclared (first use in this function)

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

