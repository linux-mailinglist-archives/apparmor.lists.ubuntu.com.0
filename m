Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B82C4A6070A
	for <lists+apparmor@lfdr.de>; Fri, 14 Mar 2025 02:29:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tstrH-0001PR-3n; Fri, 14 Mar 2025 01:29:07 +0000
Received: from mail-yb1-f178.google.com ([209.85.219.178])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1tstrF-0001P9-GE
 for apparmor@lists.ubuntu.com; Fri, 14 Mar 2025 01:29:05 +0000
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e5dcc411189so1444623276.0
 for <apparmor@lists.ubuntu.com>; Thu, 13 Mar 2025 18:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741915744; x=1742520544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ES0wXessMMgqNwSiif0rlYAGpc7YP1QvwA1ts5IWAs=;
 b=aN3Qn+norqWocPMQLy9RgrxnU1srNfa3/XNDIFazRqGf0UwIMHWhrQ5WmKEh/ZS499
 vBcoPJYpFqSE5OWGBuYGAy0O5nTdblAIyChimSENrUfrWZ03kyRQVC7llwLuN+o1ugmF
 rg80dhZYFhFopdEZn+6FZBXeXyYUSgkXT5EiYDu8g9SSMj6mea6W8jk7tLH4FGw/6Hxs
 vwdLFPApS6aAhMDuKHQYi0/k6iPUF9sq25a1cXcbtJzCRwpsZQVUr63CVWoEkXwHaC1v
 JylF3NdLZ+brhEiQsvNwAIw6SGGWRNDlX0rPjcugE/S1zfkQo3mkx9f3KPHjWIqfFv8P
 0eVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS2WUS7EX79JQef8tzyek+AOFdcUAeDURMiKIHIcR4Sto2P0J20WnErDqIHRcO5alb+WJNwvfIsA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxgCCA0tP4M0MFHktzgu7POUvH6R4kNirnj8aeSmT8ooD0yUq6T
 OGYlP28EmF9nUzbHske8aH9AtjuP5V4j9WsZlmBCcOdX6Dorsi9FQlHvSxYECne6AHzKk8BOdht
 DSykWMdJIRNcrumn1FCH66sQx17dHfZRXGIUX
X-Gm-Gg: ASbGnctkKHDS431E+l42FrZzNKS/jbwRM5Q/DpcekpGY+nKk2WbLCHjlSNaITEI2QmX
 N/mhtWrBLriwX2TUKkxTZEeXi+jPAwivl3RcNcHgOuTrWyWCFZixCXpbjnHnqqsb/7mMI9bA03h
 WJr6y60hnDQbHBBy3ltxUp3lhckA==
X-Google-Smtp-Source: AGHT+IHD2TiU6XQ9tRFKuzzp3FmVek4PiqtcVodzoMshBpH8NjFlYdg8BZn1Vv4kyVm787txJ/ZZdGY4pPNsB4MucI4=
X-Received: by 2002:a05:6902:15c7:b0:e5b:3b7a:fca7 with SMTP id
 3f1490d57ef6-e63f65b4672mr1039551276.39.1741915744021; Thu, 13 Mar 2025
 18:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250312212148.274205-1-ryan.lee@canonical.com>
 <20250312212148.274205-2-ryan.lee@canonical.com>
 <20250312213714.GT2023217@ZenIV>
 <20250313-dompteur-dachten-bb695fcbebf1@brauner>
In-Reply-To: <20250313-dompteur-dachten-bb695fcbebf1@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 13 Mar 2025 21:28:53 -0400
X-Gm-Features: AQ5f1Jo3Xy-0BZ6a7vddrckfIRl2pXF8wj3ycyI4FjDAH-FopUDoNWqpGjlm6MY
Message-ID: <CAHC9VhScqcF12XYdqMSsLg55=nux6mjEGfxCpZHEzv-bGyP7Ew@mail.gmail.com>
To: Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.178; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f178.google.com
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
Cc: Jan Kara <jack@suse.cz>, selinux@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
 linux-security-module@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 linux-fsdevel@vger.kernel.org, Kentaro Takeda <takedakn@nttdata.co.jp>,
 Ondrej Mosnacek <omosnace@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 13, 2025 at 4:50=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
> On Wed, Mar 12, 2025 at 09:37:14PM +0000, Al Viro wrote:
> > On Wed, Mar 12, 2025 at 02:21:41PM -0700, Ryan Lee wrote:
> > > Currently, opening O_PATH file descriptors completely bypasses the LS=
M
> > > infrastructure. Invoking the LSM file_open hook for O_PATH fds will
> > > be necessary for e.g. mediating the fsmount() syscall.
>
> LSM mediation for the mount api should be done by adding appropriate
> hooks to the new mount api.
>
> > >
> > > Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
> > > ---
> > >  fs/open.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/fs/open.c b/fs/open.c
> > > index 30bfcddd505d..0f8542bf6cd4 100644
> > > --- a/fs/open.c
> > > +++ b/fs/open.c
> > > @@ -921,8 +921,13 @@ static int do_dentry_open(struct file *f,
> > >     if (unlikely(f->f_flags & O_PATH)) {
> > >             f->f_mode =3D FMODE_PATH | FMODE_OPENED;
> > >             file_set_fsnotify_mode(f, FMODE_NONOTIFY);
> > >             f->f_op =3D &empty_fops;
> > > -           return 0;
> > > +           /*
> > > +            * do_o_path in fs/namei.c unconditionally invokes path_p=
ut
> > > +            * after this function returns, so don't path_put the pat=
h
> > > +            * upon LSM rejection of O_PATH opening
> > > +            */
> > > +           return security_file_open(f);
> >
> > Unconditional path_put() in do_o_path() has nothing to do with that -
> > what gets dropped there is the reference acquired there; the reference
> > acquired (and not dropped) here is the one that went into ->f_path.
> > Since you are leaving FMODE_OPENED set, you will have __fput() drop
> > that reference.
> >
> > Basically, you are simulating behaviour on the O_DIRECT open of
> > something that does not support O_DIRECT - return an error, with
> > ->f_path and FMODE_OPENED left in place.
> >
> > Said that, what I do not understand is the point of that exercise -
> > why does LSM need to veto anything for those and why is security_file_o=
pen()
>
> I really think this is misguided. This should be done via proper hooks
> into apis that use O_PATH file descriptors for specific purposes but not
> for the generic open() path.

I agree that this patchset is at best incomplete, we don't add LSM
hooks without at least one in-tree LSM demonstrating a need for it,
and we don't see any of the LSMs actually making use of this new hook
placement in this patchset.  In the future Ryan, please ensure that
the patchset actually does "something" visible, e.g. new
functionality, bug fixes, etc.  I understand part of your intent was
to spark some discussion around O_PATH files, but without some initial
code to do something meaningful, it's hard to have any real discussion
that doesn't get lost in some rathole or tangent.

Beyond that, I can only speculate on Ryan's intent here, but based on
some off-list discussions, it's possible Ryan is (re)using the
security_file_open() hook in the O_PATH case not necessarily to gate
the creation of an O_PATH file, but rather to capture some of the
context when the O_PATH file is created.  However, if that was the
case I would think Ryan should be able to do that using the
security_file_alloc() hook, although we would need to pass the file
flags to that hook if Ryan wanted to do any special handling around
O_PATH.  Regardless, it's just guessing at this point and I've got
enough things asking for attention that I can't spend any more time on
this patchset simply guessing ...

--=20
paul-moore.com

