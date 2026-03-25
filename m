Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N5YJEk9w2nqpQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 25 Mar 2026 02:41:29 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A7B31E5B6
	for <lists+apparmor@lfdr.de>; Wed, 25 Mar 2026 02:41:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w5DFF-00011P-Jh; Wed, 25 Mar 2026 01:41:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1w5DFE-00011H-89
 for apparmor@lists.ubuntu.com; Wed, 25 Mar 2026 01:41:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4729B60130
 for <apparmor@lists.ubuntu.com>; Wed, 25 Mar 2026 01:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFACBC2BCC9
 for <apparmor@lists.ubuntu.com>; Wed, 25 Mar 2026 01:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774402534;
 bh=4xDuZMlV9e8lExmR4AbKxuLD7XwJlcqYoE+mf8VIJIc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OPT6VNEgSp49B7SzieME+r0RdMr6DcX3TBWBxOMq4nctzJS1QhSaWpvD81GchzZpH
 VO8xodud0fb50cOsaSgghn4TsiGpX6cDRGo6dlXtVFQSOQr1TmaQEmJ52VTeDyG+lB
 tryrRhj1Ma3YjpdJFcsVRphMcTYVx1Tgh71yGkL4CIbjsfpf9TLCsBWP3sd2Qbwfhy
 s0KM6NYQlENSCHdHKpy+rO62f5mDqNvl8gDpFFkzqfGC+WuLI+jXS8nwX3/zrZt8DA
 SWZ+ZZKWADTYMMZQ/3AF+cCtwRmin9qZhfwj/jm/t0o1ON+49TOhdIvbi+rQAfoyBd
 7l3zkLCWWoCjA==
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-89a1347051aso74352686d6.2
 for <apparmor@lists.ubuntu.com>; Tue, 24 Mar 2026 18:35:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtq1WRewDpZTQtdpLq5laH7YcylZwa0f5BK1AQRfTng+Pyq833Q9sFfulqnALBruoj5joFEj7qMw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzDhc5vtRloxlLu3JWYBPtKFMkWqHIv9bBnTuvlf4YTm5RbCISd
 rzOZ24w9+OB9ipj4Z74Q1oZl054hUiBXElSwWd+RrQ98C7FeneoLvmYpQ/VXm0ThyJfL0+Z5WKR
 L9ov9vTaefVdJ3OYjsj2Z6SrTSbdDjjE=
X-Received: by 2002:a05:6214:1245:b0:89a:b7:9a9b with SMTP id
 6a1803df08f44-89cc4b5569cmr31645146d6.58.1774402533738; Tue, 24 Mar 2026
 18:35:33 -0700 (PDT)
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
 <CAPhsuW4E_BrF0ap5yg_6TbRAna=2Ajk2nuoT6WGwkS5cyyYB3w@mail.gmail.com>
 <4f5d1b1f-ecb2-421a-8a46-36c7a12d48de@I-love.SAKURA.ne.jp>
In-Reply-To: <4f5d1b1f-ecb2-421a-8a46-36c7a12d48de@I-love.SAKURA.ne.jp>
From: Song Liu <song@kernel.org>
Date: Tue, 24 Mar 2026 18:35:22 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7+EMzgCHAVm3XiVy1A7+EVQPxqi0hBqbq5ZsKeAWaXJw@mail.gmail.com>
X-Gm-Features: AaiRm530ufNvd5819opx61Zyxwl96gRjG09W7nRQkfMrynp8a4TROET-huwTlyg
Message-ID: <CAPhsuW7+EMzgCHAVm3XiVy1A7+EVQPxqi0hBqbq5ZsKeAWaXJw@mail.gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:penguin-kernel@i-love.sakura.ne.jp,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:songliubraving@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:linux-fsdevel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:kernel-team@meta.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.072];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,man7.org:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,i-love.sakura.ne.jp:email]
X-Rspamd-Queue-Id: 40A7B31E5B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 6:02=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
[...]
> >>>> I guess something like untested diff shown below would work.
> >>>
> >>> I think this doesn't work with erofs on file (requires
> >>> CONFIG_EROFS_FS_BACKED_BY_FILE). erofs may not be the
> >>> only one that has this problem.
> >>
> >> This is incomplete but I think this is better than now because current=
ly
> >> mount() operation likely fails with -ENOENT if the requested filesyste=
m
> >> does not interpret fc->source as a pathname despite tomoyo_mount_acl()
> >> always interprets fc->source as a pathname when FS_REQUIRES_DEV is set=
.
> >
> > If I understand Christian correctly, the main challenge here is that
> > FS_REQUIRES_DEV doesn't imply fc->source is the path of a device.
>
> Correct. FS_REQUIRES_DEV no longer implies that fc->source is a pathname.
>
> > Changing this assumption is a major change between VFS and many
> > filesystems.
>
> Wrong. I'm not trying to change this assumption. I'm trying to move LSM h=
ook
> to a location after fc->source was interpreted by individual filesystem.

OK, I can understand your point now. And I don't see a big red flag with it=
.

> >
> > I was thinking about something like:
> >
> > diff --git i/fs/super.c w/fs/super.c
> > index 378e81efe643..91ce3003bc23 100644
> > --- i/fs/super.c
> > +++ w/fs/super.c
> > @@ -1676,6 +1676,9 @@ int get_tree_bdev_flags(struct fs_context *fc,
> >                         errorf(fc, "%s: Can't lookup blockdev", fc->sou=
rce);
> >                 return error;
> >         }
> > +       error =3D security_mount_dev(fc, dev);
> > +       if (error)
> > +               return error;
> >         fc->sb_flags |=3D SB_NOSEC;
> >         s =3D sget_dev(fc, dev);
> >         if (IS_ERR(s))
> >
> > This allows the LSMs to monitor the dev being mounted in a new mount.
>
> Splitting into multiple LSM hooks does not work, for TOMOYO wants to chec=
k
> all parameters (parameters currently passed to security_mount_new() + the
> "struct path" which was resolved by individual filesystem from fc->source
> parameter) in one location.
>
> I'm not sure how security_mount_new() is called for fsconfig() case.
> Does https://man7.org/linux/man-pages/man2/fsconfig.2.html#EXAMPLES mean
> TOMOYO cannot check all parameters until move_mount() is called?

We need to add hooks for fsopen(), fsconfig(), etc. I have some basic code
for these. But I would rather we address this set first. After this, the ot=
her
hooks should be more straightforward.

Thanks,
Song

