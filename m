Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KXlJAVW/mmupQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 08 May 2026 23:30:45 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 519914FBED0
	for <lists+apparmor@lfdr.de>; Fri, 08 May 2026 23:30:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wLSmH-0003ds-33; Fri, 08 May 2026 21:30:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wLSmF-0003dd-4k
 for apparmor@lists.ubuntu.com; Fri, 08 May 2026 21:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BA4956024D
 for <apparmor@lists.ubuntu.com>; Fri,  8 May 2026 21:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71351C2BCB0
 for <apparmor@lists.ubuntu.com>; Fri,  8 May 2026 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778275524;
 bh=XZHtksjzdIujB0L10yoqbxFHajKJMkMvwCda755Z7KU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=glpfoZLpKvLxR/v407FkPkWIO/zQF9Rhqnp2aYdAM2BqZu1prVJ6A/m8Pv7PQM3sj
 XmV5RrJoHXMKVAX6fwnP/uOTkC2e/BIZHJY2QBqFwNUc5PwhLiWwiZZocHasilGAII
 SoeWOR9Kbus1IycxVNiwAh+w4+Hso2wxgod8M3xJiBB1SLFEoeYc+FADf44nsmojpT
 nTTLE7ulSBfDI3ZA4o4G5mj86NSWdewcY8WojmspmAAgCAjeKDpljVE1fa1fG1wDKv
 qMLGkeLTUQ0xNd6AU0qzu207IDXQl9vFTW5NhMdNfJ8lrgSHksStHzFGbf8eVWjou1
 3xzG/ijA3n0ww==
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-8b3fe2f19a4so22797576d6.2
 for <apparmor@lists.ubuntu.com>; Fri, 08 May 2026 14:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+6rS0A8r10iDfiekwDsgPkpHfevWbkcUVfXp+9Axm14vCNW5SdduV4mENlgUkZnTZblBbONGhFgg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yx8P9J3F8lB4WHPxtNQUCRXj7/RtBxydGnF+vu+H3Ph8KUTadsm
 kxSHc0a2j3NlcQk+/nU5W2koyVu9WjsR9HUEr4/LJhzo45sb8QP1euX9+h69s9/D3ReGp7hlHNl
 tJrdlVPNQmmnf2utqxMZB4Hr9wI5KXxk=
X-Received: by 2002:a05:6214:4f15:b0:8be:1620:a98e with SMTP id
 6a1803df08f44-8bf41ea12a2mr59686806d6.20.1778275523639; Fri, 08 May 2026
 14:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260430000315.918964-1-song@kernel.org>
 <20260430000315.918964-2-song@kernel.org>
 <CAHC9VhT6YxJQqSkBbSeACFL6+AoL0031u2VT4fuRqPxDkGzSfw@mail.gmail.com>
 <CAPhsuW6VqfPGnMqwSu-3EC9suWScOBZDHh16d5Bsg6dcjcB4ww@mail.gmail.com>
 <CAHC9VhQ237o27ej-_0tgv08KF-FaX9nrRyUF_9pE4uaVMGqU-Q@mail.gmail.com>
In-Reply-To: <CAHC9VhQ237o27ej-_0tgv08KF-FaX9nrRyUF_9pE4uaVMGqU-Q@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Fri, 8 May 2026 23:25:12 +0200
X-Gmail-Original-Message-ID: <CAPhsuW4giJDVfutF0xkEQ5ZkKPc8r9apxP+pt_4x33VJ0+xi_g@mail.gmail.com>
X-Gm-Features: AVHnY4K98LQDDmTIZV509hGsUgrIi5GYj_lVWOCK6WffrNrfKGbMnPq1K5m60Zg
Message-ID: <CAPhsuW4giJDVfutF0xkEQ5ZkKPc8r9apxP+pt_4x33VJ0+xi_g@mail.gmail.com>
To: Paul Moore <paul@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: Re: [apparmor] [PATCH v2 1/7] lsm: Add granular mount hooks to
	replace security_sb_mount
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
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz,
 selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, viro@zeniv.linux.org.uk,
 gnoack@google.com, linux-fsdevel@vger.kernel.org, takedakn@nttdata.co.jp,
 kernel-team@meta.com, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 519914FBED0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,vger.kernel.org,gmail.com,i-love.sakura.ne.jp,lists.ubuntu.com,namei.org,redhat.com,digikod.net,zeniv.linux.org.uk,google.com,nttdata.co.jp,meta.com,hallyn.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:paul@paul-moore.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:penguin-kernel@i-love.sakura.ne.jp,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:kernel-team@meta.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.425];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paul-moore.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 1:53=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, May 8, 2026 at 4:29=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> > On Fri, May 8, 2026 at 1:10=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > > On Wed, Apr 29, 2026 at 8:03=E2=80=AFPM Song Liu <song@kernel.org> wr=
ote:
> > > >
> > > > Add six new LSM hooks for mount operations:
> > > >
> > > > - mount_bind(from, to, recurse): bind mount with pre-resolved
> > > >   struct path for source and destination.
> > > > - mount_new(fc, mp, mnt_flags, flags, data): new mount, called afte=
r
> > > >   mount options are parsed. The flags and data parameters carry the
> > > >   original mount(2) flags and data for LSMs that need them (AppArmo=
r,
> > > >   Tomoyo).
> > > > - mount_remount(fc, mp, mnt_flags, flags, data): filesystem remount=
,
> > > >   called after mount options are parsed into the fs_context.
> > > > - mount_reconfigure(mp, mnt_flags, flags): mount flag reconfigurati=
on
> > > >   (MS_REMOUNT|MS_BIND path).
> > > > - mount_move(from, to): move mount with pre-resolved paths.
> > > > - mount_change_type(mp, ms_flags): propagation type changes.
> > > >
> > > > These replace the monolithic security_sb_mount() which conflates
> > > > multiple distinct operations into a single hook, and suffers from
> > > > TOCTOU issues where LSMs re-resolve string-based dev_name via
> > > > kern_path().
> > > >
> > > > The mount_move hook is added alongside the existing move_mount hook=
.
> > > > During the transition, LSMs register for both hooks. The move_mount
> > > > hook will be removed once all LSMs have been converted.
> > > >
> > > > Some LSMs, such as apparmor and tomoyo, audit the original input pa=
ssed
> > > > in the mount syscall. To keep the same behavior, argument data and =
flags
> > > > are passed in do_* functions. These can be removed if these LSMs no
> > > > longer need these information.
> > > >
> > > > All new hooks are registered as sleepable BPF LSM hooks.
> > > >
> > > > Code generated with the assistance of Claude, reviewed by human.
> > > >
> > > > Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> > > > Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com> # for s=
elinux only
> > > > Signed-off-by: Song Liu <song@kernel.org>
> > > > ---
> > > >  fs/namespace.c                |  35 ++++++++++--
> > > >  include/linux/lsm_hook_defs.h |  12 ++++
> > > >  include/linux/security.h      |  50 +++++++++++++++++
> > > >  kernel/bpf/bpf_lsm.c          |   7 +++
> > > >  security/security.c           | 101 ++++++++++++++++++++++++++++++=
++++
> > > >  5 files changed, 199 insertions(+), 6 deletions(-)
> > >
> > > ...
> > >
> > > > @@ -3708,6 +3724,10 @@ static int do_move_mount_old(const struct pa=
th *path, const char *old_name)
> > > >         if (err)
> > > >                 return err;
> > > >
> > > > +       err =3D security_mount_move(&old_path, path);
> > > > +       if (err)
> > > > +               return err;
> > > > +
> > > >         return do_move_mount(&old_path, path, 0);
> > > >  }
> > >
> > > While the security_sb_mount() hook calls into do_move_mount_old(), th=
e
> > > security_move_mount() hook calls into do_mount_mount().  As you remov=
e
> > > both of these LSM hooks in patch 7/7, should we consider moving the
> > > new security_mount_move() into do_move_mount()?  If not, how do we
> > > ensure that we don't lose coverage when removing the
> > > security_move_mount() hook, or can you explain why it is not needed?
>
> Ooof, I just read my comment above - that was all mixed up, my
> apologies.  Evidently it's been a long week ...
>
> > Patch 7/7 _replaces_ security_move_mount() with security_mount_move()
> > in vfs_move_mount().
>
> Okay, at the very least you should probably change the subject line to
> patch 7/7, or ideally move that hook addition/modification to patch
> 1/7 so patch 7/7 is purely an unused-hook-removal patch.
>
> > IOW, security_mount_move() is called from both
> > vfs_move_mount() and do_move_mount_old(), so we are not losing any
> > coverage. Did I miss something?
>
> No, I assumed patch 7/7 was doing something different based solely on
> the subject line.
>
> Let's also put the vfs_move_mount()/security_mount_move() change in
> patch 1/7 so that patch 7/7 is simply a hook/dead-code removal patch.
> This should make the patchset much cleaner.

Sounds good. I will make the change in v3.

Thanks,
Song

