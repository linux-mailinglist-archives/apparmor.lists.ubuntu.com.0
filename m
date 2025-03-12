Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E283A5E6AE
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 22:37:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsTlR-0004Cs-VU; Wed, 12 Mar 2025 21:37:21 +0000
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <viro@ftp.linux.org.uk>)
 id 1tsTlQ-0004BN-CG
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 21:37:20 +0000
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.1 #2 (Red Hat
 Linux)) id 1tsTlK-0000000859M-3E32; Wed, 12 Mar 2025 21:37:14 +0000
Date: Wed, 12 Mar 2025 21:37:14 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Ryan Lee <ryan.lee@canonical.com>
Message-ID: <20250312213714.GT2023217@ZenIV>
References: <20250312212148.274205-1-ryan.lee@canonical.com>
 <20250312212148.274205-2-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312212148.274205-2-ryan.lee@canonical.com>
Received-SPF: none client-ip=62.89.141.173; envelope-from=viro@ftp.linux.org.uk;
 helo=zeniv.linux.org.uk
Subject: Re: [apparmor] [RFC PATCH 1/6] fs: invoke LSM file_open hook in
 do_dentry_open for O_PATH fds as well
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
 linux-security-module@vger.kernel.org,
 =?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
 linux-fsdevel@vger.kernel.org, Kentaro Takeda <takedakn@nttdata.co.jp>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Mar 12, 2025 at 02:21:41PM -0700, Ryan Lee wrote:
> Currently, opening O_PATH file descriptors completely bypasses the LSM
> infrastructure. Invoking the LSM file_open hook for O_PATH fds will
> be necessary for e.g. mediating the fsmount() syscall.
> 
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
> ---
>  fs/open.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/open.c b/fs/open.c
> index 30bfcddd505d..0f8542bf6cd4 100644
> --- a/fs/open.c
> +++ b/fs/open.c
> @@ -921,8 +921,13 @@ static int do_dentry_open(struct file *f,
>  	if (unlikely(f->f_flags & O_PATH)) {
>  		f->f_mode = FMODE_PATH | FMODE_OPENED;
>  		file_set_fsnotify_mode(f, FMODE_NONOTIFY);
>  		f->f_op = &empty_fops;
> -		return 0;
> +		/*
> +		 * do_o_path in fs/namei.c unconditionally invokes path_put
> +		 * after this function returns, so don't path_put the path
> +		 * upon LSM rejection of O_PATH opening
> +		 */
> +		return security_file_open(f);

Unconditional path_put() in do_o_path() has nothing to do with that -
what gets dropped there is the reference acquired there; the reference
acquired (and not dropped) here is the one that went into ->f_path.
Since you are leaving FMODE_OPENED set, you will have __fput() drop
that reference.

Basically, you are simulating behaviour on the O_DIRECT open of
something that does not support O_DIRECT - return an error, with
->f_path and FMODE_OPENED left in place.

Said that, what I do not understand is the point of that exercise -
why does LSM need to veto anything for those and why is security_file_open()
the right place for such checks?

The second part is particularly interesting...

