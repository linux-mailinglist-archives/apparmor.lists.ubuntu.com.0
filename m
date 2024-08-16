Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB52956008
	for <lists+apparmor@lfdr.de>; Mon, 19 Aug 2024 01:08:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sfp0n-0007E2-Oe; Sun, 18 Aug 2024 23:08:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jarkko@kernel.org>) id 1seuYx-0001vb-Be
 for apparmor@lists.ubuntu.com; Fri, 16 Aug 2024 10:52:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 211C0CE1E63;
 Fri, 16 Aug 2024 10:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4294C4AF09;
 Fri, 16 Aug 2024 10:52:03 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Aug 2024 13:52:00 +0300
Message-Id: <D3HA23RMEIJ8.2AHOMIYR3J6F3@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jann Horn" <jannh@google.com>, "David Howells" <dhowells@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
 <2494949.1723751188@warthog.procyon.org.uk>
 <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
In-Reply-To: <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
Received-SPF: pass client-ip=145.40.73.55; envelope-from=jarkko@kernel.org;
 helo=sin.source.kernel.org
X-Mailman-Approved-At: Sun, 18 Aug 2024 23:08:35 +0000
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
Cc: Jeffrey Altman <jaltman@auristor.com>, selinux@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 Paul Moore <paul@paul-moore.com>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 openafs-devel@openafs.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu Aug 15, 2024 at 10:59 PM EEST, Jann Horn wrote:
> On Thu, Aug 15, 2024 at 9:46=E2=80=AFPM David Howells <dhowells@redhat.co=
m> wrote:
> > Jann Horn <jannh@google.com> wrote:
> >
> > > Rewrite keyctl_session_to_parent() to run task work on the parent
> > > synchronously, so that any errors that happen in the task work can be
> > > plumbed back into the syscall return value in the child.
> >
> > The main thing I worry about is if there's a way to deadlock the child =
and the
> > parent against each other.  vfork() for example.
>
> Yes - I think it would work fine for scenarios like using
> KEYCTL_SESSION_TO_PARENT from a helper binary against the shell that
> launched the helper (which I think is the intended usecase?), but
> there could theoretically be constellations where it would cause an
> (interruptible) hang if the parent is stuck in
> uninterruptible/killable sleep.
>
> I think vfork() is rather special in that it does a killable wait for
> the child to exit or execute; and based on my understanding of the
> intended usecase of KEYCTL_SESSION_TO_PARENT, I think normally
> KEYCTL_SESSION_TO_PARENT would only be used by a child that has gone
> through execve?

Could this encapsulated to a kselftest? Like having host process
that forks the payload and send SIGINT. That could be deployed e.g
to tools/testing/selftests/keys. Would be nice to be able to try
this out with a low barrier.

Doing this type of testing is different axis than keyutils test suite
IMHO. That would be also great starting point for adding concurrency
tests in future.

Could be done either in C or Python.

BR, Jarkko

