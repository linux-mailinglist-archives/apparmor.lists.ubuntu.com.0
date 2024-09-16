Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5258A97A8A6
	for <lists+apparmor@lfdr.de>; Mon, 16 Sep 2024 23:15:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sqJ3x-00046T-Km; Mon, 16 Sep 2024 21:15:13 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1sqJ3v-000465-10
 for apparmor@lists.ubuntu.com; Mon, 16 Sep 2024 21:15:11 +0000
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5c247dd0899so2868a12.1
 for <apparmor@lists.ubuntu.com>; Mon, 16 Sep 2024 14:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726521310; x=1727126110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9leef1lP79QdzQSlMu20RvsBQRhUgfHGz+v151OddCM=;
 b=aJgi7WF27428XrhcKxTmz2lTCvE8fZ0vPUNh+oHlGBrjjvHuLFzZQORqcDcITqa9sm
 +NOI88ocGTz0a4h0PaspuijEWe2u7O/fbWb/WQWf/vejpLnFXvMpiSxzJBk5ZbXi4Fep
 OiCq2AGTMRqsA6GccEnn5zR7uv7pOdMQfDrx7eYYFnKzRFw+l07MSAm33jcSe7Fpo+Cl
 wOvgTLCQYa0NyBa3mtgChaiSpuF8WLJBkIcwKmjfKCdOqX0vgaoMHtkgdWeSHWuZYF5l
 JKM+v/EO7KwYDHldGt4wp/XrcEI6y0XhzYio6j6lU3TK5ey2sabEDlXr30pOESNtFI/3
 +ptw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtzAAXMj05BO1z1lu8rLB3w4bISmLUp1+aBo97g8cF0ch2JH9jRJA01eroLYzTawwaiDqjXwgW4g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzVQ8H8GXV2X9F/u+Hb5dawDJ3f86kRu6OZh/IE2sOyIM4TCg4N
 0b7dhPVLTDMco7plMhDI99sN/bUUlQQuwHjR1RyVIBobkPhmADiT7W9Ws61TCiJWaEJefgkqT3n
 nZdECYVnuE1UQkEu3b84hEeJBX4U1bxu1ONh9
X-Google-Smtp-Source: AGHT+IF6dyyQJaSHZbZwngVDJVdsJApUMqXalKKi0actzWHOX8EqkqUTgpJ77CsgYsbI+x2vL0Ykn2Y5eGpt5/BHf5s=
X-Received: by 2002:a05:6402:348c:b0:5c4:2c6f:e265 with SMTP id
 4fb4d7f45d1cf-5c4478072b6mr15387a12.1.1726521309278; Mon, 16 Sep 2024
 14:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
 <2494949.1723751188@warthog.procyon.org.uk>
 <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
 <CAHC9VhSPcy-xZ=X_CF8PRsAFMSeP8-VppxKr3Sz3EqMWTEs-Cw@mail.gmail.com>
 <CAHC9VhS5ar0aU8Q6Ky133o=zYMHYRf=wxzTpxP+dtA=qunhcmw@mail.gmail.com>
In-Reply-To: <CAHC9VhS5ar0aU8Q6Ky133o=zYMHYRf=wxzTpxP+dtA=qunhcmw@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 16 Sep 2024 23:14:30 +0200
Message-ID: <CAG48ez2hhu8AXgBR=ze9RRLDpB0V1rzUX2Xr2e45giV6ebTxMA@mail.gmail.com>
To: Paul Moore <paul@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.41; envelope-from=jannh@google.com;
 helo=mail-ed1-f41.google.com
Subject: Re: [apparmor] Can KEYCTL_SESSION_TO_PARENT be dropped entirely? --
 was Re: [PATCH v2 1/2] KEYS: use synchronous task work for changing parent
 credentials
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
Cc: linux-security-module@vger.kernel.org,
 Jeffrey Altman <jaltman@auristor.com>, selinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 Ondrej Mosnacek <omosnace@redhat.com>, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
 openafs-devel@openafs.org, linux-afs@lists.infradead.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Sep 16, 2024 at 12:46=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> On Tue, Sep 10, 2024 at 4:49=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Thu, Aug 15, 2024 at 4:00=E2=80=AFPM Jann Horn <jannh@google.com> wr=
ote:
> > > On Thu, Aug 15, 2024 at 9:46=E2=80=AFPM David Howells <dhowells@redha=
t.com> wrote:
> > > > Jann Horn <jannh@google.com> wrote:
> > > >
> > > > > Rewrite keyctl_session_to_parent() to run task work on the parent
> > > > > synchronously, so that any errors that happen in the task work ca=
n be
> > > > > plumbed back into the syscall return value in the child.
> > > >
> > > > The main thing I worry about is if there's a way to deadlock the ch=
ild and the
> > > > parent against each other.  vfork() for example.
> > >
> > > Yes - I think it would work fine for scenarios like using
> > > KEYCTL_SESSION_TO_PARENT from a helper binary against the shell that
> > > launched the helper (which I think is the intended usecase?), but
> > > there could theoretically be constellations where it would cause an
> > > (interruptible) hang if the parent is stuck in
> > > uninterruptible/killable sleep.
> > >
> > > I think vfork() is rather special in that it does a killable wait for
> > > the child to exit or execute; and based on my understanding of the
> > > intended usecase of KEYCTL_SESSION_TO_PARENT, I think normally
> > > KEYCTL_SESSION_TO_PARENT would only be used by a child that has gone
> > > through execve?
> >
> > Where did we land on all of this?  Unless I missed a thread somewhere,
> > it looks like the discussion trailed off without any resolution on if
> > we are okay with a potentially (interruptible) deadlock?
>
> As a potential tweak to this, what if we gave up on the idea of
> returning the error code so we could avoid the signal deadlock issue?

I'm still not convinced that there is a real danger of deadlocking
here if the only way to deadlock involves the parent being in an
uninterruptible wait. There aren't many places in the kernel that
involve a parent uninterruptibly waiting for the child without locks
being involved, especially when the parent is a shell that spawns the
child with execve, as seems to be the intended use here.

I really dislike the idea of silently ignoring an error - I kinda feel
like if we give up on returning an error to the child that issued the
keyctl, the next-best option is to SIGKILL the parent, so that we can
say "hey, we technically ensured that all future syscalls in the
parent will use the new creds, because the parent will no longer do
_any_ syscalls".

> I suppose there could be an issue if the parent was
> expecting/depending on keyring change from the child, but honestly, if
> the parent is relying on the kernel keyring and spawning a child
> process without restring the KEYCTL_SESSION_TO_PARENT then the parent
> really should be doing some sanity checks on the keyring after the
> child returns anyway.



> I'm conflicted on the best way to solve this problem, but I think we
> need to fix this somehow as I believe the current behavior is broken
> ...

