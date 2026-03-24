Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id agb/FIxDwmnvbAQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Mar 2026 08:55:56 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D223F3043C2
	for <lists+apparmor@lfdr.de>; Tue, 24 Mar 2026 08:55:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w4wc5-00042P-5f; Tue, 24 Mar 2026 07:55:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1w4wc3-00042C-JG
 for apparmor@lists.ubuntu.com; Tue, 24 Mar 2026 07:55:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3CCEF4374B
 for <apparmor@lists.ubuntu.com>; Tue, 24 Mar 2026 07:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198B9C2BCB3
 for <apparmor@lists.ubuntu.com>; Tue, 24 Mar 2026 07:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774338389;
 bh=iUlva4BooMrpubtin+0WCDkkfD2Hd/2XLRbG6sh91Hg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qXoM6wJ5SDtfpCKAvrg9IZpbtOqD3HNlC9cqFQS6LEvBNqLd4z5OoT4VW6Oso3pGj
 xIs/YdvIflXOhTd/TEB+BzFK8o9NvwAbrSWYoqPGtVdutPM3+M4gLPyJ/8C89pyoXj
 3UMuYsFdBq3ldk2b3zBECxIDnO04UYOQ4grFh1/SbUWyxvDmJbGlpnbn7sFDhVDJPv
 D2kbnK2AZwlrwO01ZyABF7sFRdgFATI9Ekn+lkAuySzso+vv7j3/m6lzTAFE1NUxi/
 YCSX8Cg4gZx9DsWPXi6dJZ7dtvW8/FHacDamwaI3fvzefVEVYn5Y1FJ+YTBCR1ZGJL
 gbEzAIRttKLTg==
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-89c4468686dso52082326d6.3
 for <apparmor@lists.ubuntu.com>; Tue, 24 Mar 2026 00:46:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJX0Fs70taFSfJz/24kRvfDhSeckY6Je+jMgrDOipOrclqr84Z15ESbxUztPtWObmdoWxaoKmEMw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yx/pjIlqtvq/RZrpIXKHhbCubEFmYI2HLo0/QvZlD2v9Ll3qgDd
 4P/CRkoNJ8cA2U/mFhIeXvqpYaRveGNVjLj2mzUvs4M04Ag36nX3ewTYi4axj6cfzd0YksUhBe9
 7eDq9uWU5s/XxxWIiaL2qBvHloib6oz4=
X-Received: by 2002:a05:6214:5906:b0:89c:505e:a96d with SMTP id
 6a1803df08f44-89c859cbdeemr239575626d6.3.1774338388149; Tue, 24 Mar 2026
 00:46:28 -0700 (PDT)
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
In-Reply-To: <6609e11e-90aa-4021-974e-e9937688dd49@I-love.SAKURA.ne.jp>
From: Song Liu <song@kernel.org>
Date: Tue, 24 Mar 2026 00:46:16 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4G7vo-JZqenZ-sFHw9z02wZUJa1-+9U81U--vQhnfG_Q@mail.gmail.com>
X-Gm-Features: AaiRm506A2zyXhnXAmb2ykNyYlK8IVmugvF-QlKi507zb4QISjJyjO9IU61QDFw
Message-ID: <CAPhsuW4G7vo-JZqenZ-sFHw9z02wZUJa1-+9U81U--vQhnfG_Q@mail.gmail.com>
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,i-love.sakura.ne.jp:email]
X-Rspamd-Queue-Id: D223F3043C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:12=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2026/03/24 4:31, Song Liu wrote:
> >> Then, how can LSM modules know that how the requested filesystem resol=
ves
> >> the dev_name argument, without embedding filesystem specific resolutio=
n
> >> logic into individual LSM module?
> >
> > IIUC, if an LSM cares about the dev_name of a new mount, it will have t=
o look
> > into each individual filesystem. We can add a LSM hook for the filesyst=
ems to
> > call. But this will require changes to individual filesystem code. OTOH=
,
> > dev_name can probably bridge the gap as we change filesystems.
> >
> > Would this work?
>
> I guess something like untested diff shown below would work.

I think this doesn't work with erofs on file (requires
CONFIG_EROFS_FS_BACKED_BY_FILE). erofs may not be the
only one that has this problem.

Thanks,
Song

>
>  block/bdev.c               |   26 ++++++++++++++------------
>  fs/fs_context.c            |    4 ++++
>  fs/namespace.c             |   10 ++++++----
>  fs/super.c                 |    2 +-
>  include/linux/blkdev.h     |   12 +++++++++++-
>  include/linux/fs_context.h |    1 +
>  security/tomoyo/mount.c    |   26 ++------------------------
>  security/tomoyo/tomoyo.c   |    2 +-
>  8 files changed, 40 insertions(+), 43 deletions(-)

