Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A801D83B2A2
	for <lists+apparmor@lfdr.de>; Wed, 24 Jan 2024 20:59:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rSjOc-00068f-LE; Wed, 24 Jan 2024 19:58:50 +0000
Received: from vulcan.kevinlocke.name ([107.191.43.88])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <kevin@kevinlocke.name>)
 id 1rSj69-0004c0-P6
 for apparmor@lists.ubuntu.com; Wed, 24 Jan 2024 19:39:45 +0000
Received: from kevinolos.kevinlocke.name
 (2600-6c67-5000-0a52-00e4-35b0-b82a-0c08.res6.spectrum.com
 [IPv6:2600:6c67:5000:a52:e4:35b0:b82a:c08])
 (Authenticated sender: kevin@kevinlocke.name)
 by vulcan.kevinlocke.name (Postfix) with ESMTPSA id 86E254143C5F;
 Wed, 24 Jan 2024 19:39:41 +0000 (UTC)
Received: by kevinolos.kevinlocke.name (Postfix, from userid 1000)
 id D511C1300145; Wed, 24 Jan 2024 12:39:38 -0700 (MST)
Date: Wed, 24 Jan 2024 12:39:38 -0700
From: Kevin Locke <kevin@kevinlocke.name>
To: Kees Cook <keescook@chromium.org>
Message-ID: <ZbFneq3URF5lLAT7@kevinlocke.name>
Mail-Followup-To: Kevin Locke <kevin@kevinlocke.name>,
 Kees Cook <keescook@chromium.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240124192228.work.788-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124192228.work.788-kees@kernel.org>
X-Mailman-Approved-At: Wed, 24 Jan 2024 19:58:49 +0000
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
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Josh Triplett <josh@joshtriplett.org>,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, 2024-01-24 at 11:22 -0800, Kees Cook wrote:
> After commit 978ffcbf00d8 ("execve: open the executable file before
> doing anything else"), current->in_execve was no longer in sync with the
> open(). This broke AppArmor and TOMOYO which depend on this flag to
> distinguish "open" operations from being "exec" operations.
> 
> Instead of moving around in_execve, switch to using __FMODE_EXEC, which
> is where the "is this an exec?" intent is stored. Note that TOMOYO still
> uses in_execve around cred handling.

It solves the AppArmor issue I was experiencing and I don't notice any
other issues.

Tested-by: Kevin Locke <kevin@kevinlocke.name>

Thanks!
Kevin

