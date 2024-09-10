Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E62DA974450
	for <lists+apparmor@lfdr.de>; Tue, 10 Sep 2024 22:49:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1so7na-0002o5-DR; Tue, 10 Sep 2024 20:49:18 +0000
Received: from mail-yb1-f172.google.com ([209.85.219.172])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1so7nX-0002nw-O9
 for apparmor@lists.ubuntu.com; Tue, 10 Sep 2024 20:49:15 +0000
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e1a9f84699cso1164335276.3
 for <apparmor@lists.ubuntu.com>; Tue, 10 Sep 2024 13:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726001354; x=1726606154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WYjARXF5iHHpTlh5hyqO8bTT4ZmLx2A0R6UF7JUY+9c=;
 b=hDyee4n9iKRmP9eebLgDpgi+ONTB081EQGio4F5LcwjmsKqYChkrxNEQIqYFiDQWFU
 jGHduzrzJPqhI9j+1MckbN1dCEABEkMPKYEuMrU/xF47MB9j63kE+Z0JUSBJoNZdLSpT
 +qztLMFicJzD69bm6k2CBPx8HGkCi0MKpZCmWsNOWWWz8M+eTlWftNKCkw+8kzfT9bFo
 +nZjvOJ9UGNzk9coXlwbTjGlr6ymuUvJNfcmlE6X8NW+rtXZvOdu8W9YbywFCNovw1Os
 5LHT+Gokpwu6oEtvp9ChGN7GUzHP5rjjkqZbBdJyv5HjcxFyqpiJvbjF6vyliVbTnkIX
 Ew5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgvoqW7jJgQEZnMXoAHe3i5n6O37TNj4WJ/qmWg+l3OhNJt9aIF3jIMtujhu5fDrDSjQST9Uc3lQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxvSJmgpvU+KTRhnsYh95v1RuGRv1VwScVNEz0V7KG528Y5uWb+
 M1e4zZX3e6GGqGjCJdWXw8ch8dHk/uE7XO/Cl7EpbJAQaEFVAqJF0/I0B83mNqQNId3hvPHibLn
 uTbGXmBcwIgt0r/CrPnHOlKVsdxqjR1f4sxiZ
X-Google-Smtp-Source: AGHT+IFgMK6PeTDRSiV3IUUm82K2jugYC/SvYQbL/2kIQWJ6vCR0av/sG1KukB6SNfhmqpD5QEYFAa0dGswS6AalsdQ=
X-Received: by 2002:a05:690c:6812:b0:6c9:9341:1c45 with SMTP id
 00721157ae682-6dba6d98f5fmr12360207b3.14.1726001354371; Tue, 10 Sep 2024
 13:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
 <2494949.1723751188@warthog.procyon.org.uk>
 <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
In-Reply-To: <CAG48ez2LBmS91fQVLYRYEaBHssj22NyUjB0HVtkDHUXDvDZ6EA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Sep 2024 16:49:03 -0400
Message-ID: <CAHC9VhSPcy-xZ=X_CF8PRsAFMSeP8-VppxKr3Sz3EqMWTEs-Cw@mail.gmail.com>
To: Jann Horn <jannh@google.com>, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.172; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f172.google.com
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

On Thu, Aug 15, 2024 at 4:00=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
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

Where did we land on all of this?  Unless I missed a thread somewhere,
it looks like the discussion trailed off without any resolution on if
we are okay with a potentially (interruptible) deadlock?

--=20
paul-moore.com

