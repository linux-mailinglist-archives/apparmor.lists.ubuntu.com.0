Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E208B5F747F
	for <lists+apparmor@lfdr.de>; Fri,  7 Oct 2022 09:02:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oghMq-000754-Uo; Fri, 07 Oct 2022 07:01:56 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <tytso@mit.edu>) id 1ogcMm-00081h-V7
 for apparmor@lists.ubuntu.com; Fri, 07 Oct 2022 01:41:33 +0000
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net
 [173.48.120.46]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2971ecnl032685
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Oct 2022 21:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1665106847; bh=qaGXQZPJ+DMM6m33/wU4mECLmQpjFLtDJn6CdcOWtKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=KSalaJnH4Pyw9am3lmnE824Wr2kBhNth9uCO4mXO5AzKtequoJLzjonneUAC8ZhxR
 4Hz1eaUw7xthlsGZIvbrKDmeqfMsaZL0mX9jE1bwkYelTLIujVkzCQre3la+eHpRvk
 jehUy8nGH756ojGWF+Lya0ILI+OcQWLFjLYpTrHqGQ5P8VsLDrkkyMAy5y7ZgOktww
 VOQvAZIroJGMqt4qSIuhel3Tn9O/0JEpicFLNkngkAJ7T5kP6qkzL5z4U+3ELVIhC1
 z6ZBz5xcg7Vu7b4LWp9pQf8jyIsi6uPKcXUiiBI32krkxUNWm4c1/xFR2R+71IKcQi
 mHXaABEZ7m0DA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id C2CF515C35F2; Thu,  6 Oct 2022 21:40:38 -0400 (EDT)
Date: Thu, 6 Oct 2022 21:40:38 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Kees Cook <keescook@chromium.org>
Message-ID: <Yz+Dln7AAMU+Oj9X@mit.edu>
References: <202209131456.76A13BC5E4@keescook>
 <202210061301.207A20C8E5@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202210061301.207A20C8E5@keescook>
X-Mailman-Approved-At: Fri, 07 Oct 2022 07:01:55 +0000
Subject: Re: [apparmor] [PATCH] Fix race condition when exec'ing setuid files
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
Cc: Micah Morton <mortonm@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrei Vagin <avagin@gmail.com>, linux-hardening@vger.kernel.org,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Jann Horn <jannh@google.com>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Eric Paris <eparis@parisplace.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Oct 06, 2022 at 01:20:35PM -0700, Kees Cook wrote:
> 
> So the question, then, is "why are they trying to exec while actively
> spawning new threads?" That appears to be the core problem here, and as
> far as I can tell, the kernel has behaved this way for a very long time.
> I don't think the kernel should fix this, either, because it leads to a
> very weird state for userspace, where the thread spawner may suddenly
> die due to the exec happening in another thread. This really looks like
> something userspace needs to handle correctly (i.e. don't try to exec
> while actively spawning threads).

One of the classic failure modes is when a threaded program calls a
library, and that library might try to do a fork/exec (or call
system(3) to run some command.  e.g., such as running "lvm create ..."
or to spawn some kind of helper daemon.

There are a number of stack overflow questions about this, and there
are some solutions to _some_ of the problems, such as using
pthread_atfork(), and knowing that you are about to call fork/exec,
and use some out of band mechanism to to make sure no threads get
spawned until the fork/exec is completed --- but if you don't know
that a library is going to do a fork/exec, well, life is tough. 

One technique even advocated by a stack overflow article is "avoid
using threads whenver possible".  :-/

	       	       	  	   - Ted

