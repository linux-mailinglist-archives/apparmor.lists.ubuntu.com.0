Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GmkfGPT7M2rDKAYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 18 Jun 2026 16:08:52 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 032836A0D01
	for <lists+apparmor@lfdr.de>; Thu, 18 Jun 2026 16:08:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1waDQ0-0001ac-6H; Thu, 18 Jun 2026 14:08:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1waDPy-0001Zp-26
 for apparmor@lists.ubuntu.com; Thu, 18 Jun 2026 14:08:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 164D84188A;
 Thu, 18 Jun 2026 14:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E061F000E9;
 Thu, 18 Jun 2026 14:02:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Song Liu <song@kernel.org>
In-Reply-To: <CAPhsuW7Wn8GYrsrRhEFXQH5buaP+pdTKc0UV8Mn0B3OnNN-44g@mail.gmail.com>
References: <20260528182607.3150386-1-song@kernel.org>
 <20260528182607.3150386-8-song@kernel.org>
 <20260617-laufbahn-eifrig-charmant-a48f357a0c52@brauner>
 <CAPhsuW7Wn8GYrsrRhEFXQH5buaP+pdTKc0UV8Mn0B3OnNN-44g@mail.gmail.com>
Date: Thu, 18 Jun 2026 16:02:22 +0200
Message-Id: <178179134209.111814.12159888808546010170.b4-reply@b4>
X-Mailer: b4 0.16-dev-0da26
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545; i=brauner@kernel.org;
 h=from:subject:message-id; bh=k916pKxaOf7B4P3yVTWLlngVhVyPkDIXI52B9aGPc2I=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQZ/yow6Ga3kMuWmrPTxLe7b9H59axHFWxW88/YuycrV
 e72CmX+jlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIk4tDD8rxds9eNp5fLjyxZ2
 u+ay/eXhTSq+lwVWr7ZRn8VufDhgKiPDvVWiUetmq3U9/cNY4S4sniIZ92axwwnxl8+Vdqzj2vO
 REwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Received-SPF: pass client-ip=172.234.252.31; envelope-from=brauner@kernel.org;
 helo=sea.source.kernel.org
Subject: Re: [apparmor] [PATCH v5 7/8] vfs: Replace
 security_sb_mount/security_move_mount with granular hooks
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
From: Christian Brauner via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: herton@canonical.com, Christian Brauner <brauner@kernel.org>, jack@suse.cz,
 paul@paul-moore.com, selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, viro@zeniv.linux.org.uk,
 gnoack@google.com, linux-fsdevel@vger.kernel.org, takedakn@nttdata.co.jp,
 kernel-team@meta.com, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.89 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:penguin-kernel@i-love.sakura.ne.jp,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:kernel-team@meta.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,i-love.sakura.ne.jp,lists.ubuntu.com,namei.org,redhat.com,digikod.net,zeniv.linux.org.uk,google.com,nttdata.co.jp,meta.com,hallyn.com];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	HAS_REPLYTO(0.00)[brauner@kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 032836A0D01

On 2026-06-18 18:56:42+08:00, Song Liu wrote:
> On Wed, Jun 17, 2026 at 9:53 PM Christian Brauner <brauner@kernel.org> wrote:
> 
> > On Thu, May 28, 2026 at 11:26:06AM -0700, Song Liu wrote:
> 
> [...]
> 
> > >
> >
> > This again is racy as it is called outside of the namespace semaphore:
> >
> >         err = security_mount_bind(&old_path, path, recurse);
> >         if (err)
> >                 return err;
> >
> >         if (mnt_ns_loop(old_path.dentry))
> >                 return -EINVAL;
> >
> >         LOCK_MOUNT(mp, path);
> >         if (IS_ERR(mp.parent))
> >                 return PTR_ERR(mp.parent);
> >
> > After LOCK_MOUNT @path might point to a completely different mount then
> > the one you performed your security checks on.
> 
> I thought we agreed at LSF/MM/BPF 2026 to add the LSM hooks
> before taking namespace semaphore, so that it is possible for LSMs
> to defend against DoS attacks on namespace semaphore? Did I
> miss/misunderstand something?

I think there was a misunderstanding. What I pointed out was that it's a
trade-off. If we do call security hooks under the namespace semaphore or
mount lock than anything that's called under there must take care to not
cause deadlocks - which is especially easy to do with mount lock and
even with the namespace semaphore it may get hairy (automounts etc). The
dos thing is another worry but if an LSM does stupid things we tell it
to not do stupid things and to go away.

But as the hooks are done right now they are meaningless from a security
perspective. You might have a policy that allows mounting on dentry_a
and deny mounting on dentry_b: before LOCK_MOUNT*() you may see dentry_a
and allow the mount but after LOCK_MOUNT*() someone raced you and shoved
a dentry_b mount onto dentry_b and now you allow overmounting dentry_b
which your policy didn't allow -> hosed.

> > Placement of this hook suffers from the same issue as the bind mount
> > hook. Here it's worse because the security layer isn't even informed
> > about MOVE_MOUNT_BENEATH which completely alters the mount relationship.
> 
> Current hook security_move_mount doesn't handle
> MOVE_MOUNT_BENEATH. But we can add mflags to security_mount_move().
> Do we need anything other than mflags?

I think you either need to pass three mounts (source, target, top_mnt)
where for non-mount beneath target == top_mnt or you need two separate
hooks. Because for MOVE_MOUNT_BENEATH you may want to have a tri-part
policy: source, target, top_mnt.


