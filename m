Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IUT1J1LQM2rxGgYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 18 Jun 2026 13:02:42 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99969F98A
	for <lists+apparmor@lfdr.de>; Thu, 18 Jun 2026 13:02:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1waAVw-0001pX-RD; Thu, 18 Jun 2026 11:02:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1waAVw-0001pE-2K
 for apparmor@lists.ubuntu.com; Thu, 18 Jun 2026 11:02:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 64FAB601F8
 for <apparmor@lists.ubuntu.com>; Thu, 18 Jun 2026 10:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EDC1F00A3D
 for <apparmor@lists.ubuntu.com>; Thu, 18 Jun 2026 10:56:56 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-9157b94a07aso93248485a.0
 for <apparmor@lists.ubuntu.com>; Thu, 18 Jun 2026 03:56:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ8vRKXJ035gBUf0UKxCFbAFPIqGkaZuu8OQ+usuCNoS8BhlChbAwVPIIMjgFX/cFc8GL0FFd6PwJA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwluXQSY2rKBG3btQmKXpsKCFAmez1AzDn73SHhhibg1lePWB3D
 SEgGUToBLapGTUG1Q6c7fY+UX4lC95s/NG75dwaNlowyzuAYJyr3n/5UWwCfxeS2EF3aPgR+OKj
 ftDWPsjEygM7r1/J7CYcZfDTBRWu4bnk=
X-Received: by 2002:a05:620a:1a12:b0:914:cf92:46fb with SMTP id
 af79cd13be357-91dbc52c23cmr1206914385a.32.1781780215358; Thu, 18 Jun 2026
 03:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260528182607.3150386-1-song@kernel.org>
 <20260528182607.3150386-8-song@kernel.org>
 <20260617-laufbahn-eifrig-charmant-a48f357a0c52@brauner>
In-Reply-To: <20260617-laufbahn-eifrig-charmant-a48f357a0c52@brauner>
Date: Thu, 18 Jun 2026 18:56:42 +0800
X-Gmail-Original-Message-ID: <CAPhsuW7Wn8GYrsrRhEFXQH5buaP+pdTKc0UV8Mn0B3OnNN-44g@mail.gmail.com>
X-Gm-Features: AVVi8CdMwwBeVWKbgimKMTZIhDQrcn_xHhSmY9XN-Dvu7Mu1bTcCjMCtFLlmpHo
Message-ID: <CAPhsuW7Wn8GYrsrRhEFXQH5buaP+pdTKc0UV8Mn0B3OnNN-44g@mail.gmail.com>
To: Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
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
From: Song Liu via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Song Liu <song@kernel.org>
Cc: herton@canonical.com, kernel-team@meta.com, jack@suse.cz,
 paul@paul-moore.com, selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, viro@zeniv.linux.org.uk,
 gnoack@google.com, linux-fsdevel@vger.kernel.org, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,meta.com,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,i-love.sakura.ne.jp,lists.ubuntu.com,namei.org,redhat.com,digikod.net,zeniv.linux.org.uk,google.com,nttdata.co.jp,hallyn.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:herton@canonical.com,m:kernel-team@meta.com,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:penguin-kernel@i-love.sakura.ne.jp,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[song@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F99969F98A

On Wed, Jun 17, 2026 at 9:53=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Thu, May 28, 2026 at 11:26:06AM -0700, Song Liu wrote:
[...]
> >
> > +     err =3D security_mount_bind(&old_path, path, recurse);
> > +     if (err)
> > +             return err;
>
> This again is racy as it is called outside of the namespace semaphore:
>
>         err =3D security_mount_bind(&old_path, path, recurse);
>         if (err)
>                 return err;
>
>         if (mnt_ns_loop(old_path.dentry))
>                 return -EINVAL;
>
>         LOCK_MOUNT(mp, path);
>         if (IS_ERR(mp.parent))
>                 return PTR_ERR(mp.parent);
>
> After LOCK_MOUNT @path might point to a completely different mount then
> the one you performed your security checks on.

I thought we agreed at LSF/MM/BPF 2026 to add the LSM hooks
before taking namespace semaphore, so that it is possible for LSMs
to defend against DoS attacks on namespace semaphore? Did I
miss/misunderstand something?

> > +
> >       if (mnt_ns_loop(old_path.dentry))
> >               return -EINVAL;
> >
[...]
> >
> >       err =3D parse_monolithic_mount_data(fc, data);
> > +     if (!err)
> > +             err =3D security_mount_remount(fc, path, mnt_flags, flags=
,
> > +                                         data);
> >       if (!err) {
> >               down_write(&sb->s_umount);
> >               err =3D -EPERM;
> > @@ -3708,6 +3724,10 @@ static int do_move_mount_old(const struct path *=
path, const char *old_name)
> >       if (err)
> >               return err;
> >
> > +     err =3D security_mount_move(&old_path, path);
> > +     if (err)
> > +             return err;
>
> Placement of this hook suffers from the same issue as the bind mount
> hook. Here it's worse because the security layer isn't even informed
> about MOVE_MOUNT_BENEATH which completely alters the mount relationship.

Current hook security_move_mount doesn't handle
MOVE_MOUNT_BENEATH. But we can add mflags to security_mount_move().
Do we need anything other than mflags?

Thanks,
Song

