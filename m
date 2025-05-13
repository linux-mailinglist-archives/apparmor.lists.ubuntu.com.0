Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF63AB66BA
	for <lists+apparmor@lfdr.de>; Wed, 14 May 2025 11:02:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uF7zt-0004x5-JB; Wed, 14 May 2025 09:01:53 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1uEwtO-00044i-28
 for apparmor@lists.ubuntu.com; Tue, 13 May 2025 21:10:26 +0000
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5fce6c7598bso3386a12.0
 for <apparmor@lists.ubuntu.com>; Tue, 13 May 2025 14:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747170625; x=1747775425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82zEtRLhUQDpsLvYBWZVZquqMGMoaEvNl8BtBzmS4FE=;
 b=QPW1Pzfyn0e4afyeFvjlSlR88JXt+4qdPzVnPeoSkTR6UnVDiBBCayb9Ro12PO1ijP
 AqoemCDYZzVsTYQKhj8WGEYY01qQk+S08m86RxIEEeGXdaxmlAal+FsT9GanCS5gAdYD
 V2/ukSx6XoyqO/JlINc5uqapRYJItwrF8a5peLovy0Edt2W4U7mTvEorjSOvoTK8/qBO
 GcqNfww5O8VVs5FGTE2yMraZB+j9isaMoblQYr0Z/5M4GR9aKt9xg4HFvPzWVO0KeXak
 zPHvApJPHr2h3MCG1W8Bow6yqBTgb/C8C8Xv0pPyM6ltJdUZ4nv4Tv1/b8xdVo0yjBDP
 ns0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKDlvICuP1AJcG0IneKBfm9BGLolQOu2mfaCAu8lSLbqrSsxMH+yi1ticL2lgfcHnR3yKgNeDlRw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzkMeu1Vt1vu3t02Ao/UZBuC8f9gKWnc/No3AytnBsWT6A1Bav/
 LPfcyksEODWYgJk8SKcKEIOHAJlKXbXkDSFZmxEA5zWTQVshY4h/VbPupqYmYEw7oCm/o6+Y6Ol
 g/nCV4ZOEyVdcQWYwXd3T5mlLP8NG1mYIczKQ0o0g
X-Gm-Gg: ASbGnctjEZPvOPIeuahjnzOlYj9NkZ4U7drOR78ymAVAriS8IigWZOkJrp89sU9EWDj
 yYwodjeEcmk7A1EeLZWfrq0+gfaj29w0M44rnh2qe0dpGTs+lyzklhW+4be15ozZa48alXo28Kv
 qirwYGuCAb6YY0cXbT5nFo5wPQlGP1ntinok3V0PvmGz6CNlODyzsmgRsxobWc
X-Google-Smtp-Source: AGHT+IFFvoW0vaiQwXwOuLU8KHoNjqrz7yUskjzEQxJboJ77uRfEnj6qF+F1/xO6hcdFFQqM32ILfLKZ8071TJJxbuw=
X-Received: by 2002:a50:ed16:0:b0:5fd:6065:7bbc with SMTP id
 4fb4d7f45d1cf-5ff97e27b24mr28177a12.0.1747170624943; Tue, 13 May 2025
 14:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
 <86CE201B-5632-4BB7-BCF6-7CB2C2895409@chromium.org>
 <h65sagivix3zbrppthcobnysgnlrnql5shiu65xyg7ust6mc54@cliutza66zve>
 <D03AE210-6874-43B6-B917-80CD259AE2AC@kernel.org>
In-Reply-To: <D03AE210-6874-43B6-B917-80CD259AE2AC@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 13 May 2025 23:09:48 +0200
X-Gm-Features: AX0GCFvSGCrl8jRaWXokLgXy6n507r0H59ZuhYg2-C-s2mYQog1RTVhArK8PEPE
Message-ID: <CAG48ez0aP8LaGppy6Yon7xcFbQa1=CM-HXSZChvXYV2VJZ8y7g@mail.gmail.com>
To: Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.54; envelope-from=jannh@google.com;
 helo=mail-ed1-f54.google.com
X-Mailman-Approved-At: Wed, 14 May 2025 09:01:51 +0000
Subject: Re: [apparmor] [PATCH 1/2] fs/exec: Explicitly unshare fs_struct on
	exec
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
Cc: Micah Morton <mortonm@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrei Vagin <avagin@gmail.com>, linux-hardening@vger.kernel.org,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, oleg@redhat.com,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Christian Brauner <brauner@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, May 13, 2025 at 10:57=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On May 13, 2025 6:05:45 AM PDT, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >Here is my proposal: *deny* exec of suid/sgid binaries if fs_struct is
> >shared. This will have to be checked for after the execing proc becomes
> >single-threaded ofc.
>
> Unfortunately the above Chrome helper is setuid and uses CLONE_FS.

Chrome first launches a setuid helper, and then the setuid helper does
CLONE_FS. Mateusz's proposal would not impact this usecase.

Mateusz is proposing to block the case where a process first does
CLONE_FS, and *then* one of the processes sharing the fs_struct does a
setuid execve(). Linux already downgrades such an execve() to be
non-setuid, which probably means anyone trying to do this will get
hard-to-understand problems. Mateusz' proposal would just turn this
hard-to-debug edgecase, which already doesn't really work, into a
clean error; I think that is a nice improvement even just from the
UAPI standpoint.

If this change makes it possible to clean up the kernel code a bit, even be=
tter.

