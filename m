Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE5RGsHhwmmPnAQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Mar 2026 20:10:57 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0136831B410
	for <lists+apparmor@lfdr.de>; Tue, 24 Mar 2026 20:10:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w579K-00065p-93; Tue, 24 Mar 2026 19:10:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1w579I-00065B-La
 for apparmor@lists.ubuntu.com; Tue, 24 Mar 2026 19:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 82FC644467
 for <apparmor@lists.ubuntu.com>; Tue, 24 Mar 2026 19:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B55C2BCB4
 for <apparmor@lists.ubuntu.com>; Tue, 24 Mar 2026 19:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774378995;
 bh=8ERkArUkKAJMAJlGeP18u5PgNVycSZvsdsG8KYtB5t8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=trXb3kjAHLI67smIXDwwAf48RXbt+0nCdIkpi3H788qXY723neQjh0YgPKFYvJIm1
 8m+Qi0x7+ZYZ+j8uHWv4Pwuj41UI1OoGGOlXzac/EtNVqCbwDBg2TenOBSN0CjUzUW
 uRfCFut55vMk8wAEa2+r10jCxNCx/Ph/T3GpC26ah0s7U6N8q3g6elCfMTC/GqVFGE
 Hx5LEbi55a865esBlPBGVQDuhVy6wBi+4U9S3OkvLpCjRc2CpYLkPEqcnbUFWklkze
 CYKsXLgE5pkjR09Y1ziWls4GwsBm0SI6nANr2jkkwCHe8fArJRHbqhEgXzpqA8V7Lk
 zQfjKx2T2QbkQ==
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8cfc1aced74so651844785a.2
 for <apparmor@lists.ubuntu.com>; Tue, 24 Mar 2026 12:03:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5NOSJ87v8eZC3GnjClUXa6cCVE5KPMm7WqMDj3J5+rI26zH6u4p0iuq6SZH7RBnQUwOI+SDde0g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzC2HAKtHaqKOtDrc+YCXKv1PEP48Y6cE2GXZDqlbmk85e98EOM
 7vGK1CraN/DVozLClWvD3GlwWHMzRK9ADPjdGE4XlKmJXfkvzPYjFMRZNWg4mB59NlGRTAx/fVf
 Be0TUb0G7tYQSwneMuWP0L5hcI3Sj2Q4=
X-Received: by 2002:a05:6214:1316:b0:89c:5b90:3d7e with SMTP id
 6a1803df08f44-89cc4ad7e94mr14077846d6.36.1774378994278; Tue, 24 Mar 2026
 12:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-7-song@kernel.org>
 <b720f521-e930-4f35-9505-1bfdf9e2818c@I-love.SAKURA.ne.jp>
 <4DF5C4A8-7C92-4F76-9B34-2262089E7289@meta.com>
 <33abcf34-13e2-4a37-83f3-78bb27ecbc11@I-love.SAKURA.ne.jp>
 <F0A0D13E-8208-49A4-9AC6-89AC4BF3F4FB@meta.com>
 <20260323-klappen-atemschutz-7a0af8c6b087@brauner>
 <714a614b-cfb4-4b20-af8c-df3cc56dfb92@I-love.SAKURA.ne.jp>
 <CAAeYb7k+TWArOKyOomkLZ8fwqUPjha9iORpJaj4nMyN=o4ZRQg@mail.gmail.com>
 <6609e11e-90aa-4021-974e-e9937688dd49@I-love.SAKURA.ne.jp>
 <CAPhsuW4G7vo-JZqenZ-sFHw9z02wZUJa1-+9U81U--vQhnfG_Q@mail.gmail.com>
 <6c298238-8d87-4c41-84a7-e0373d466a15@I-love.SAKURA.ne.jp>
In-Reply-To: <6c298238-8d87-4c41-84a7-e0373d466a15@I-love.SAKURA.ne.jp>
From: Song Liu <song@kernel.org>
Date: Tue, 24 Mar 2026 12:03:02 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4E_BrF0ap5yg_6TbRAna=2Ajk2nuoT6WGwkS5cyyYB3w@mail.gmail.com>
X-Gm-Features: AaiRm53BtyNmgu2U1A-lRqlHK3FKxeh66Hvb786qvSu1X2siuc6pnMMByLeZto4
Message-ID: <CAPhsuW4E_BrF0ap5yg_6TbRAna=2Ajk2nuoT6WGwkS5cyyYB3w@mail.gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.234.252.31; envelope-from=song@kernel.org;
 helo=sea.source.kernel.org
Subject: Re: [apparmor] [PATCH 6/7] tomoyo: Convert from sb_mount to
	granular mount hooks
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
Cc: "herton@canonical.com" <herton@canonical.com>,
 Christian Brauner <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>,
 "paul@paul-moore.com" <paul@paul-moore.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "stephen.smalley.work@gmail.com" <stephen.smalley.work@gmail.com>,
 Song Liu <songliubraving@meta.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "jmorris@namei.org" <jmorris@namei.org>,
 "omosnace@redhat.com" <omosnace@redhat.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "gnoack@google.com" <gnoack@google.com>, "mic@digikod.net" <mic@digikod.net>,
 "takedakn@nttdata.co.jp" <takedakn@nttdata.co.jp>,
 Kernel Team <kernel-team@meta.com>, "serge@hallyn.com" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:penguin-kernel@i-love.sakura.ne.jp,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:songliubraving@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:linux-fsdevel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:kernel-team@meta.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.625];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,i-love.sakura.ne.jp:email]
X-Rspamd-Queue-Id: 0136831B410
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 2:59=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2026/03/24 16:46, Song Liu wrote:
> > On Mon, Mar 23, 2026 at 11:12=E2=80=AFPM Tetsuo Handa
> > <penguin-kernel@i-love.sakura.ne.jp> wrote:
> >>
> >> On 2026/03/24 4:31, Song Liu wrote:
> >>>> Then, how can LSM modules know that how the requested filesystem res=
olves
> >>>> the dev_name argument, without embedding filesystem specific resolut=
ion
> >>>> logic into individual LSM module?
> >>>
> >>> IIUC, if an LSM cares about the dev_name of a new mount, it will have=
 to look
> >>> into each individual filesystem. We can add a LSM hook for the filesy=
stems to
> >>> call. But this will require changes to individual filesystem code. OT=
OH,
> >>> dev_name can probably bridge the gap as we change filesystems.
> >>>
> >>> Would this work?
> >>
> >> I guess something like untested diff shown below would work.
> >
> > I think this doesn't work with erofs on file (requires
> > CONFIG_EROFS_FS_BACKED_BY_FILE). erofs may not be the
> > only one that has this problem.
>
> This is incomplete but I think this is better than now because currently
> mount() operation likely fails with -ENOENT if the requested filesystem
> does not interpret fc->source as a pathname despite tomoyo_mount_acl()
> always interprets fc->source as a pathname when FS_REQUIRES_DEV is set.

If I understand Christian correctly, the main challenge here is that
FS_REQUIRES_DEV doesn't imply fc->source is the path of a device.
Changing this assumption is a major change between VFS and many
filesystems.

I was thinking about something like:

diff --git i/fs/super.c w/fs/super.c
index 378e81efe643..91ce3003bc23 100644
--- i/fs/super.c
+++ w/fs/super.c
@@ -1676,6 +1676,9 @@ int get_tree_bdev_flags(struct fs_context *fc,
                        errorf(fc, "%s: Can't lookup blockdev", fc->source)=
;
                return error;
        }
+       error =3D security_mount_dev(fc, dev);
+       if (error)
+               return error;
        fc->sb_flags |=3D SB_NOSEC;
        s =3D sget_dev(fc, dev);
        if (IS_ERR(s))

This allows the LSMs to monitor the dev being mounted in a new mount.
If a filesystem doesn't use get_tree_bdev*(), we will need something else
to cover this specific filesystem. I am not sure whether this is acceptable
for VFS and LSM, specifically tomoyo and apparmor.

Also, before we go too deep into the hook for new mounts, can we focus
on this set, which will fix some existing TOCTOU issues?

Thanks,
Song

