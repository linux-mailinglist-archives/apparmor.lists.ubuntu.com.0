Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED0B979FAE
	for <lists+apparmor@lfdr.de>; Mon, 16 Sep 2024 12:46:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sq9FR-0006Y4-Lv; Mon, 16 Sep 2024 10:46:25 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sq9FO-0006X9-UN
 for apparmor@lists.ubuntu.com; Mon, 16 Sep 2024 10:46:23 +0000
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e026a2238d8so2637968276.0
 for <apparmor@lists.ubuntu.com>; Mon, 16 Sep 2024 03:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726483582; x=1727088382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hOot1WAmO0n8LqJvNiku2kLrm8KQvY7N+dDNwBSEg74=;
 b=KAQd4DpyGg2lwLeIuTB7MopmG1VhSCqJlPYjGmF9zWDhr0FxyrTHRLph2RG85Fspy4
 KJ6koVC0eC2H0DQevnTdL0PE3STTLraWmp9C3Srrkq7z5xGvK0Gnt8g9HnbM1CZyDLiH
 9vLSfzqgs8vjNMmeUiC0lUluhrcrsWFCbTnovOkeYk5MXfzr+E/v7bU/EDJDH1wCLqY8
 nfBQkLCi8kAU4brV3QcxxHCVsdAy9Q5aitGfXePTp6GVII4HE9qkP+3QflB59bEgGKvX
 /FkCNs0xxJ5mrCOb3pE1qK6LlDhxJ7I4Y2B8U8PRK2V9KIM3xGHYRiYY6wMin/y+eJhb
 z/QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc088EvCIv909diih4JxTa9uS1aAHb6rKHJUMLwlIfLztGy7AfWI7GQcsOboA98o/VfccSmjDLzQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Ywo1vucJwMXMAwV6yb0jYRK7osxY9iKRna2eR2CTbNbAmuPJ4vC
 zvtYqo/WMaTzN14vw67NG8vB8v9nppj7wPe9hEBSguj30hKh6kT2Zf+FfaZlVML4SdKSLWgNNAp
 xW03YdFEvC8wtYt0s+09ge6PzvtaqQPxy3Llb
X-Google-Smtp-Source: AGHT+IFPT7p70pyzFPnGYf9oumwIpGAwqpVNEQ2qCQe0d4QnaPMyQB86xSQEpMCg12204Y4OQ+FOje+z2iOX3Dd9gQg=
X-Received: by 2002:a05:6902:1883:b0:e1a:8e31:e451 with SMTP id
 3f1490d57ef6-e1daff6229bmr8957471276.10.1726483581486; Mon, 16 Sep 2024
 03:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
 <2494949.1723751188@warthog.procyon.org.uk>
 <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
 <CAHC9VhSPcy-xZ=X_CF8PRsAFMSeP8-VppxKr3Sz3EqMWTEs-Cw@mail.gmail.com>
In-Reply-To: <CAHC9VhSPcy-xZ=X_CF8PRsAFMSeP8-VppxKr3Sz3EqMWTEs-Cw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Sep 2024 06:46:10 -0400
Message-ID: <CAHC9VhS5ar0aU8Q6Ky133o=zYMHYRf=wxzTpxP+dtA=qunhcmw@mail.gmail.com>
To: Jann Horn <jannh@google.com>, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.175; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f175.google.com
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
 Ondrej Mosnacek <omosnace@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 keyrings@vger.kernel.org, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
 openafs-devel@openafs.org, linux-afs@lists.infradead.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Sep 10, 2024 at 4:49=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Thu, Aug 15, 2024 at 4:00=E2=80=AFPM Jann Horn <jannh@google.com> wrot=
e:
> > On Thu, Aug 15, 2024 at 9:46=E2=80=AFPM David Howells <dhowells@redhat.=
com> wrote:
> > > Jann Horn <jannh@google.com> wrote:
> > >
> > > > Rewrite keyctl_session_to_parent() to run task work on the parent
> > > > synchronously, so that any errors that happen in the task work can =
be
> > > > plumbed back into the syscall return value in the child.
> > >
> > > The main thing I worry about is if there's a way to deadlock the chil=
d and the
> > > parent against each other.  vfork() for example.
> >
> > Yes - I think it would work fine for scenarios like using
> > KEYCTL_SESSION_TO_PARENT from a helper binary against the shell that
> > launched the helper (which I think is the intended usecase?), but
> > there could theoretically be constellations where it would cause an
> > (interruptible) hang if the parent is stuck in
> > uninterruptible/killable sleep.
> >
> > I think vfork() is rather special in that it does a killable wait for
> > the child to exit or execute; and based on my understanding of the
> > intended usecase of KEYCTL_SESSION_TO_PARENT, I think normally
> > KEYCTL_SESSION_TO_PARENT would only be used by a child that has gone
> > through execve?
>
> Where did we land on all of this?  Unless I missed a thread somewhere,
> it looks like the discussion trailed off without any resolution on if
> we are okay with a potentially (interruptible) deadlock?

As a potential tweak to this, what if we gave up on the idea of
returning the error code so we could avoid the signal deadlock issue?
I suppose there could be an issue if the parent was
expecting/depending on keyring change from the child, but honestly, if
the parent is relying on the kernel keyring and spawning a child
process without restring the KEYCTL_SESSION_TO_PARENT then the parent
really should be doing some sanity checks on the keyring after the
child returns anyway.

I'm conflicted on the best way to solve this problem, but I think we
need to fix this somehow as I believe the current behavior is broken
...

--=20
paul-moore.com

