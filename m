Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAM0AWxN/mllowAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 08 May 2026 22:54:04 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2BD4FBAB9
	for <lists+apparmor@lfdr.de>; Fri, 08 May 2026 22:54:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wLSCl-0004Qv-Bq; Fri, 08 May 2026 20:53:51 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1wLSCj-0004Ql-Cm
 for apparmor@lists.ubuntu.com; Fri, 08 May 2026 20:53:49 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2b9fcf7c91bso23786375ad.0
 for <apparmor@lists.ubuntu.com>; Fri, 08 May 2026 13:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778273627; cv=none;
 d=google.com; s=arc-20240605;
 b=aO0LrwR1WVUFkW/Z3+IZ6jrYyP9n10nZrgwLKn43ooLJKKgTsYd2H9hZoFdEeGL/Kj
 SXRDEQ05cq8tcqsHAIoTViHs2Yo3rz/54thDZzM5ZJWr7WSgo+xZJJRgoD659v6nhKSP
 lqkUwPLRzfcsGBQVqhZh5w+0QRyX8t5dtsnmJmguOO52aeTZ8EEhrEDrbLJaNuSajT/R
 1x/ReyJQ4DY7tVzUtMLpXMsaF/Qg1/qTnoFVbEZTC24rkiG3FqGp5t5n1vWKMmzo+lSr
 fn8OLmM1kkbR+mMp1ITwRGYWdk8mlIg/3TrPLEif6mGzBIe1E+BCU1Ift9JteQuuEELu
 Cr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zWh1iviHf4ogJ10OkMdUK6imNF3ForFBNVwSW2PZTR0=;
 fh=axc/grB4e8QlXQyUgDLPSJHzjgJsO1S/OcoEx6PpDzw=;
 b=KkbIG0J5INQYSvqeGD1C9qvaM1l2MojF1hsIZlJM3CAEJ505o8oEoZ3WWbMJjoizKw
 vMoow1XjsEYRYsZ/TTUAtrtJL267cma+o1XfrAZVN4japQ59SbiIdm7f9I+00PWf5Tnn
 ghu+3mKWVaLZW0/YU6Ot9LOsOKr25CB9alY6eOKkah92Goc/ggY91DkMH9SaIuovfoZF
 WkRmWkPrBE4OMBf8jfKqXVrniDZrbb4nog4GU1gR6J5JrT414tTEq1115Ojat7T5lG+H
 kXwdDxcMlgAqhJ6L8/rW9P6ELi5PP70A8yMnDvpO+KXkZ70N4KiKcfGcIbg+kUKJXUgF
 FLjw==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1778273627; x=1778878427; darn=lists.ubuntu.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zWh1iviHf4ogJ10OkMdUK6imNF3ForFBNVwSW2PZTR0=;
 b=ZqntRRjFIAqiiEJRApHs6dXvGCcxclx4GnuEb6qI0F1YpBQ6rxiBsPDHMFSd7RUs2l
 VbB1UVQ23swZIDPRcyFrdu7x7l4TLT/VSvQE2rNwtoT7SgP8A2j1F4SC5KX3U2ruloMi
 CdrYSjsTKp3zEIdKpRdsSsthugL5DejjH7+wbRgWJOkx9GMdLIrYZM/wkTF4lRnQro0D
 SAWOv9pVlzbU9tsgJ53WVqHFfvDWdcEYB7mHFF0xy6qYWS8X3sCU9zouuyYOLaDF1UDf
 iY4gvVujbAqlk+s+DRHVF0sETlCr2L0rTnifRsJ2P9HetnWiaJoPcrA+rlqPF7W3q4ug
 Zu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778273627; x=1778878427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zWh1iviHf4ogJ10OkMdUK6imNF3ForFBNVwSW2PZTR0=;
 b=pHkVIbTm9E/NssIXX/Zo6+BwWtlVTTGCjRZm/b4up7WHWoNU81d6l7un6seXnJfmW3
 kF/lpSpFgRwT9CoIo71FDbnPynd4vLqOxM8qB3opEIkMRdlSC3oOYZuDsGQxUcZ8Vbzt
 uSBzjBPsr9SVLdL6259e1NF4zlK+lz4M0IUlKWiCPwmtF/VRbwIT/v8hvGsM+v1bxOy2
 LBJDnoAG7hVMjGOGugTXpdmps6dA44G8TgPpQ9FWLZZlnNxevHCE/dVucK3QxYTmHCIF
 V5uySak7yx2WzEPrrLr7yqvjyndS0FegK5l4GndnUClWGuo9IdeM7DKLRkEC/9dzSGO/
 nAkg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/pYso2sfNWtHlF6yvjJ9DNUQGnF3u1npVn2wQGp05/WD7UcMb9FqBgjgHMBgYqKIzRvARFZe05Fg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxtwVUR/XCGXWnPKAhgmuj/yKuw+6oSSL8sresLl5ICvt2XAWSm
 AHEQgCFx6FcMr2IlsmeZ5FVohqygEltR74Ip6LcPhd2X1xZ1mr/bSCpo+jFyG5jFaSYbe2YWIaQ
 WUPJ1A/bOb73p0c05mgNXZrWIaD2k4ZMJKj1fOQAU
X-Gm-Gg: Acq92OGzEctlpTrRZBHIWZaFvDfOxlZkjYA+CS01KeuW63g3/QXZb2hR9v21TwTdfUG
 eQFFYT0o9LQt0BX4LnlNtx5AFSxTxNV3+5gp1HPFQCXKDaULyxaD98TW/xxiRPF/flpzPULSssi
 3wQqA/8/cLOSPjFSN0XPD5kBuKiOMsAFSv4bMRXyISrWwz+Xr6BZ1UAixL1QXQ0iCPlFRPGyzUY
 eSldp+RUJkPJtQ/a4ALaPcZgMjV1ylpz5JfZ4S32zC+9zBQsGOn4YH+sCjB9II221XmH2qppld2
 b/FhF7AGf7GSdA2soIUwv2yL8V+d
X-Received: by 2002:a17:903:1b07:b0:2b9:eb6a:68b5 with SMTP id
 d9443c01a7336-2ba7a36022amr136938945ad.38.1778273627590; Fri, 08 May 2026
 13:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260430000315.918964-1-song@kernel.org>
 <20260430000315.918964-2-song@kernel.org>
 <CAHC9VhT6YxJQqSkBbSeACFL6+AoL0031u2VT4fuRqPxDkGzSfw@mail.gmail.com>
 <CAPhsuW6VqfPGnMqwSu-3EC9suWScOBZDHh16d5Bsg6dcjcB4ww@mail.gmail.com>
In-Reply-To: <CAPhsuW6VqfPGnMqwSu-3EC9suWScOBZDHh16d5Bsg6dcjcB4ww@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 8 May 2026 16:53:35 -0400
X-Gm-Features: AVHnY4JRDMNUmX4JH5JunmLlULux3slQY9_dADVN9V7Jbwgw1Y6mP1Hb0ty2Ukk
Message-ID: <CAHC9VhQ237o27ej-_0tgv08KF-FaX9nrRyUF_9pE4uaVMGqU-Q@mail.gmail.com>
To: Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.214.177; envelope-from=paul@paul-moore.com;
 helo=mail-pl1-f177.google.com
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
X-Rspamd-Queue-Id: AD2BD4FBAB9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[paul-moore.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:penguin-kernel@i-love.sakura.ne.jp,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:kernel-team@meta.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,vger.kernel.org,gmail.com,i-love.sakura.ne.jp,lists.ubuntu.com,namei.org,redhat.com,digikod.net,zeniv.linux.org.uk,google.com,nttdata.co.jp,meta.com,hallyn.com];
	NEURAL_HAM(-0.00)[-0.904];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 4:29=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> On Fri, May 8, 2026 at 1:10=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Wed, Apr 29, 2026 at 8:03=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> > >
> > > Add six new LSM hooks for mount operations:
> > >
> > > - mount_bind(from, to, recurse): bind mount with pre-resolved
> > >   struct path for source and destination.
> > > - mount_new(fc, mp, mnt_flags, flags, data): new mount, called after
> > >   mount options are parsed. The flags and data parameters carry the
> > >   original mount(2) flags and data for LSMs that need them (AppArmor,
> > >   Tomoyo).
> > > - mount_remount(fc, mp, mnt_flags, flags, data): filesystem remount,
> > >   called after mount options are parsed into the fs_context.
> > > - mount_reconfigure(mp, mnt_flags, flags): mount flag reconfiguration
> > >   (MS_REMOUNT|MS_BIND path).
> > > - mount_move(from, to): move mount with pre-resolved paths.
> > > - mount_change_type(mp, ms_flags): propagation type changes.
> > >
> > > These replace the monolithic security_sb_mount() which conflates
> > > multiple distinct operations into a single hook, and suffers from
> > > TOCTOU issues where LSMs re-resolve string-based dev_name via
> > > kern_path().
> > >
> > > The mount_move hook is added alongside the existing move_mount hook.
> > > During the transition, LSMs register for both hooks. The move_mount
> > > hook will be removed once all LSMs have been converted.
> > >
> > > Some LSMs, such as apparmor and tomoyo, audit the original input pass=
ed
> > > in the mount syscall. To keep the same behavior, argument data and fl=
ags
> > > are passed in do_* functions. These can be removed if these LSMs no
> > > longer need these information.
> > >
> > > All new hooks are registered as sleepable BPF LSM hooks.
> > >
> > > Code generated with the assistance of Claude, reviewed by human.
> > >
> > > Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> > > Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com> # for sel=
inux only
> > > Signed-off-by: Song Liu <song@kernel.org>
> > > ---
> > >  fs/namespace.c                |  35 ++++++++++--
> > >  include/linux/lsm_hook_defs.h |  12 ++++
> > >  include/linux/security.h      |  50 +++++++++++++++++
> > >  kernel/bpf/bpf_lsm.c          |   7 +++
> > >  security/security.c           | 101 ++++++++++++++++++++++++++++++++=
++
> > >  5 files changed, 199 insertions(+), 6 deletions(-)
> >
> > ...
> >
> > > @@ -3708,6 +3724,10 @@ static int do_move_mount_old(const struct path=
 *path, const char *old_name)
> > >         if (err)
> > >                 return err;
> > >
> > > +       err =3D security_mount_move(&old_path, path);
> > > +       if (err)
> > > +               return err;
> > > +
> > >         return do_move_mount(&old_path, path, 0);
> > >  }
> >
> > While the security_sb_mount() hook calls into do_move_mount_old(), the
> > security_move_mount() hook calls into do_mount_mount().  As you remove
> > both of these LSM hooks in patch 7/7, should we consider moving the
> > new security_mount_move() into do_move_mount()?  If not, how do we
> > ensure that we don't lose coverage when removing the
> > security_move_mount() hook, or can you explain why it is not needed?

Ooof, I just read my comment above - that was all mixed up, my
apologies.  Evidently it's been a long week ...

> Patch 7/7 _replaces_ security_move_mount() with security_mount_move()
> in vfs_move_mount().

Okay, at the very least you should probably change the subject line to
patch 7/7, or ideally move that hook addition/modification to patch
1/7 so patch 7/7 is purely an unused-hook-removal patch.

> IOW, security_mount_move() is called from both
> vfs_move_mount() and do_move_mount_old(), so we are not losing any
> coverage. Did I miss something?

No, I assumed patch 7/7 was doing something different based solely on
the subject line.

Let's also put the vfs_move_mount()/security_mount_move() change in
patch 1/7 so that patch 7/7 is simply a hook/dead-code removal patch.
This should make the patchset much cleaner.

--=20
paul-moore.com

