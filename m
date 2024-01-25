Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434683C4CB
	for <lists+apparmor@lfdr.de>; Thu, 25 Jan 2024 15:35:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rT0pB-0006JX-KF; Thu, 25 Jan 2024 14:35:25 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1rT0p6-0006JF-GF
 for apparmor@lists.ubuntu.com; Thu, 25 Jan 2024 14:35:21 +0000
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 40PEXx1b067900;
 Thu, 25 Jan 2024 23:34:00 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Thu, 25 Jan 2024 23:33:59 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 40PEXxDV067897
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 25 Jan 2024 23:33:59 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <62d1c43c-18e5-4ddf-ad85-c47e5c58d79a@I-love.SAKURA.ne.jp>
Date: Thu, 25 Jan 2024 23:34:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>
References: <20240124192228.work.788-kees@kernel.org>
 <CAG48ez017tTwxXbxdZ4joVDv5i8FLWEjk=K_z1Vf=pf0v1=cTg@mail.gmail.com>
 <202401241206.031E2C75B@keescook>
 <CAHk-=wiUwRG7LuR=z5sbkFVGQh+7qVB6_1NM0Ny9SVNL1Un4Sw@mail.gmail.com>
 <202401241310.0A158998@keescook>
 <CAG48ez1tcxtEwWgxSUqLDcYbrkY=UM3hz22A0BTvTYq4BGpM8A@mail.gmail.com>
 <202401241348.1A2860EB58@keescook>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <202401241348.1A2860EB58@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] exec: Check __FMODE_EXEC instead of
	in_execve for LSMs
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
Cc: Eric Biederman <ebiederm@xmission.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Josh Triplett <josh@joshtriplett.org>,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Kevin Locke <kevin@kevinlocke.name>,
 linux-kernel@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2024/01/25 6:50, Kees Cook wrote:
> Yeah, I was just noticing this. I was over thinking. :) It does look
> like all that is needed is to remove __FMODE_EXEC.

I worry that some out-of-tree kernel code continues using __FMODE_EXEC for
opening for non-execve() purpose. If that happened, TOMOYO will be fooled...
Can't we remove __FMODE_EXEC and FMODE_EXEC flag from f_flags instead of
replacing current->in_execve with file->f_flags & __FMODE_EXEC ?


