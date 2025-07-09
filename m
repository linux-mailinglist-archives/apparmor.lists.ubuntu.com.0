Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A7EAFF613
	for <lists+apparmor@lfdr.de>; Thu, 10 Jul 2025 02:43:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uZfNv-0007pP-9H; Thu, 10 Jul 2025 00:43:35 +0000
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <viro@ftp.linux.org.uk>)
 id 1uZRyL-000637-Nr
 for apparmor@lists.ubuntu.com; Wed, 09 Jul 2025 10:24:17 +0000
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat
 Linux)) id 1uZRyE-0000000H4uh-3XNx; Wed, 09 Jul 2025 10:24:10 +0000
Date: Wed, 9 Jul 2025 11:24:10 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Song Liu <song@kernel.org>
Message-ID: <20250709102410.GU1880847@ZenIV>
References: <20250708230504.3994335-1-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708230504.3994335-1-song@kernel.org>
Received-SPF: none client-ip=62.89.141.173; envelope-from=viro@ftp.linux.org.uk;
 helo=zeniv.linux.org.uk
X-Mailman-Approved-At: Thu, 10 Jul 2025 00:43:34 +0000
Subject: Re: [apparmor] [RFC] vfs: security: Parse dev_name before calling
 security_sb_mount
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
Cc: mattbobrowski@google.com, jack@suse.cz, penguin-kernel@i-love.sakura.ne.jp,
 tomoyo-users_en@lists.sourceforge.net, amir73il@gmail.com, ast@kernel.org,
 omosnace@redhat.com, takedakn@nttdata.co.jp, daniel@iogearbox.net,
 andrii@kernel.org, repnop@google.com, john@apparmor.net,
 enlightened@chromium.org, selinux@vger.kernel.org, kernel-team@meta.com,
 apparmor@lists.ubuntu.com, josef@toxicpanda.com, kpsingh@kernel.org,
 mic@digikod.net, m@maowtm.org, brauner@kernel.org,
 stephen.smalley.work@gmail.com, tomoyo-users_ja@lists.sourceforge.net,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, eddyz87@gmail.com,
 linux-security-module@vger.kernel.org, gnoack@google.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Jul 08, 2025 at 04:05:04PM -0700, Song Liu wrote:
> security_sb_mount handles multiple types of mounts: new mount, bind
> mount, etc. When parameter dev_name is a path, it need to be parsed
> with kern_path.
> 
> Move the parsing of dev_name to path_mount, and pass the result to
> security_sb_mount, so that:
> 1. The LSMs do not need to call kern_path again;
> 2. For BPF LSM, we can use struct path dev_path, which is much easier to
>    use than a string.
> 3. We can now remove do_move_mount_old.
> 
> Also, move may_mount check to before security_sb_mount and potential
> kern_path, so that requests without proper capability will be rejected
> sooner.
> 
> Signed-off-by: Song Liu <song@kernel.org>
> 
> ---
> The primary motivation of this change is to monitor bind mount and move
> mount in BPF LSM. There are a few options for this to work:
> 1. Introduce bpf_kern_path kfunc.
> 2. Add new hook(s), such as [1].
> 3. Something like this patch.
> 
> At this moment, I think this patch is the best solution.
> 
> New mount for filesystems with FS_REQUIRES_DEV also need kern_path for
> dev_name. apparmor and tomoyo still call kern_path in such cases.
> However, it is a bit tricky to move this kern_path call to path_mount,
> so new mount path is not changed in this version.

security_sb_mount() is and had always been a mind-boggling trash of an API.

It makes no sense in terms of operations being requested.  And any questions
regarding its semantics had been consistently met with blanket "piss off,
LSM gets to do whatever it wants to do, you are not to question the sanity
and you are not to request any kind of rules - give us the fucking syscall
arguments and let us at it".

Come up with a saner API.  We are done accomodating that idiocy.  The only
changes you get to make in fs/namespace.c are "here's our better-defined
hooks, please call <this hook> when you do <that>".

NAKed-by: Al Viro <viro@zeniv.linux.org.uk>

