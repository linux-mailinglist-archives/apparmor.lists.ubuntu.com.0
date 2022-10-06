Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6815F699D
	for <lists+apparmor@lfdr.de>; Thu,  6 Oct 2022 16:32:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ogRup-0006Ct-Vd; Thu, 06 Oct 2022 14:31:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1ogMof-0007cy-4u
 for apparmor@lists.ubuntu.com; Thu, 06 Oct 2022 09:05:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0830B81EA0;
 Thu,  6 Oct 2022 09:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB455C433D6;
 Thu,  6 Oct 2022 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665047115;
 bh=3jGXsNPSS4O1TEpS68FiH8Y48vDWXXQybQJHFsdIyaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CHAgPTyna9bAa5+1gY1y6nPN3rE3uxDZIDS9lvu9KCJX+0UHxssIa95r+hCe0rgsb
 uCg+oilhWGlEg0HRKfKcRYYzLuUnuRoklCSpB8zkg9W/7UlpdKLCkpo9dB5iNQSAHt
 q4zZUXAk4CMUMsIn5JKS8i1RMQw7xnCcemwF24WdQNAybg2yzc/SrmqjhygWlrdeA0
 gEPZqRhnne1FkqYY5PcU/5ah2xFo86ptFevX/EHKDgV8bAHgI3nJpZJW5DsbTo8fuy
 8EPEbJam5U0csRzGMkDqlDA/DadY0A1WEqA16RoGFhSfaMcdf/hMuC3asH4eoy7tTs
 5b0y4Sw0n/IGA==
Date: Thu, 6 Oct 2022 11:05:06 +0200
From: Christian Brauner <brauner@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20221006090506.paqjf537cox7lqrq@wittgenstein>
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221006082735.1321612-2-keescook@chromium.org>
X-Mailman-Approved-At: Thu, 06 Oct 2022 14:31:58 +0000
Subject: Re: [apparmor] [PATCH 1/2] fs/exec: Explicitly unshare fs_struct on
	exec
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
 Fenghua Yu <fenghua.yu@intel.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Oct 06, 2022 at 01:27:34AM -0700, Kees Cook wrote:
> The check_unsafe_exec() counting of n_fs would not add up under a heavily
> threaded process trying to perform a suid exec, causing the suid portion
> to fail. This counting error appears to be unneeded, but to catch any
> possible conditions, explicitly unshare fs_struct on exec, if it ends up

Isn't this a potential uapi break? Afaict, before this change a call to
clone{3}(CLONE_FS) followed by an exec in the child would have the
parent and child share fs information. So if the child e.g., changes the
working directory post exec it would also affect the parent. But after
this change here this would no longer be true. So a child changing a
workding directoro would not affect the parent anymore. IOW, an exec is
accompanied by an unshare(CLONE_FS). Might still be worth trying ofc but
it seems like a non-trivial uapi change but there might be few users
that do clone{3}(CLONE_FS) followed by an exec.

> +/*
> + * Unshare the filesystem structure if it is being shared
> + */
> +int unshare_fs(void)
> +{
> +	struct fs_struct *new_fs = NULL;
> +	int error;
> +
> +	error = unshare_fs_alloc(CLONE_FS, &new_fs);
> +	if (error || !new_fs)
> +		return error;

You should just check for error here, not new_fs.

