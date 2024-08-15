Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 31648953B3B
	for <lists+apparmor@lfdr.de>; Thu, 15 Aug 2024 22:00:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1segeD-0004ps-FT; Thu, 15 Aug 2024 20:00:37 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1segeA-0004pb-Jb
 for apparmor@lists.ubuntu.com; Thu, 15 Aug 2024 20:00:34 +0000
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5bec7c5af2aso158a12.1
 for <apparmor@lists.ubuntu.com>; Thu, 15 Aug 2024 13:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723752034; x=1724356834;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3ArqisW88zeUJ5548euro8ampk/ZNm/xfRfsdbWrSo=;
 b=UODx9SZOgjHk/ube+ZKdcrkSNb9XlbZdvzydLA4zw5l0gcGe3M/rXjgeuCWnTY3Kmo
 5yhlkl+4bfrFrsW7kDDvPnpHIOXvVmIaFlPHdHRbfP2XO+OVPNSBlTSl5cvy25tPgGam
 Sbfh9e4Sar8eXnAYKaqK+uarJ6T/8GBSUZ/4XLWDZu5hGlWY6vtdRGP+x3euVBXXR0HP
 hTvMAJwRHSLdCy/uIMrUxmthVEXuGtTK2gzqEAisCZSMokqVMpF5uiFQNE1Z3XeuG06j
 t4HNHrwGbFXoI38MRdJgVW1FHukTASMifuX+HAhwMbxuonaeCOVMrvNHiiLkNQT3VAJx
 nHhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQkZsF2mrwi+8l0EQY9OdIrFIbkhlGgVrhIiZWSwuFQ3dIkMr0Lvulc8+H7Wd5yMhLR4d8Y5WQyM11PxUGySdzyjdbxgtvpqlA
X-Gm-Message-State: AOJu0YzlPyQZbmBLhqFxyjjDtsjZAH8SblP7XprtUsb1U0j9nUcvUWmc
 xUgDyVgUhCFrFL7xX8tZmdIGwf1/ejw0ETPi1sJBQG6i95ZfixLJwmkH06mzkuAWQOFj99yeE9H
 34TRyFef9xWympONXPSdnDCsbFxJOJDbiJaOG
X-Google-Smtp-Source: AGHT+IFwS4EKwUlrFlYXcuSN5oh43sNNRYX1HBigJRCxXbMVgn7z8rfDqxIsTOr1QPI6vYSZFktXxOduALeTABTxFEw=
X-Received: by 2002:a05:6402:27ca:b0:57c:b712:47b5 with SMTP id
 4fb4d7f45d1cf-5becb50aa8cmr15762a12.4.1723752032713; Thu, 15 Aug 2024
 13:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
 <2494949.1723751188@warthog.procyon.org.uk>
In-Reply-To: <2494949.1723751188@warthog.procyon.org.uk>
From: Jann Horn <jannh@google.com>
Date: Thu, 15 Aug 2024 21:59:54 +0200
Message-ID: <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.50; envelope-from=jannh@google.com;
 helo=mail-ed1-f50.google.com
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
 Stephen Smalley <stephen.smalley.work@gmail.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 Paul Moore <paul@paul-moore.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 keyrings@vger.kernel.org, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
 openafs-devel@openafs.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Aug 15, 2024 at 9:46=E2=80=AFPM David Howells <dhowells@redhat.com>=
 wrote:
> Jann Horn <jannh@google.com> wrote:
>
> > Rewrite keyctl_session_to_parent() to run task work on the parent
> > synchronously, so that any errors that happen in the task work can be
> > plumbed back into the syscall return value in the child.
>
> The main thing I worry about is if there's a way to deadlock the child an=
d the
> parent against each other.  vfork() for example.

Yes - I think it would work fine for scenarios like using
KEYCTL_SESSION_TO_PARENT from a helper binary against the shell that
launched the helper (which I think is the intended usecase?), but
there could theoretically be constellations where it would cause an
(interruptible) hang if the parent is stuck in
uninterruptible/killable sleep.

I think vfork() is rather special in that it does a killable wait for
the child to exit or execute; and based on my understanding of the
intended usecase of KEYCTL_SESSION_TO_PARENT, I think normally
KEYCTL_SESSION_TO_PARENT would only be used by a child that has gone
through execve?


> > +     if (task_work_cancel(parent, &ctx.work)) {
> > +             /*
> > +              * We got interrupted and the task work was canceled befo=
re it
> > +              * could execute.
> > +              * Use -ERESTARTNOINTR instead of -ERESTARTSYS for
> > +              * compatibility - the manpage does not list -EINTR as a
> > +              * possible error for keyctl().
> > +              */
>
> I think returning EINTR is fine, provided that if we return EINTR, the ch=
ange
> didn't happen.  KEYCTL_SESSION_TO_PARENT is only used by the aklog, dlog =
and
> klog* OpenAFS programs AFAIK, and only if "-setpag" is set as a command l=
ine
> option.  It also won't be effective if you strace the program.

Ah, I didn't even know about those.

The users I knew of are the command-line tools "keyctl new_session"
and "e4crypt new_session" (see
https://codesearch.debian.net/search?q=3DKEYCTL_SESSION_TO_PARENT&literal=
=3D1,
which indexes code that's part of Debian).

> Maybe the AFS people can say whether it's even worth keeping the function=
ality
> rather than just dropping KEYCTL_SESSION_TO_PARENT?

I think this would break the tools "keyctl new_session" and "e4crypt
new_session" - though I don't know if anyone actually uses those
invocations.

