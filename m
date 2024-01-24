Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D22AC83B34F
	for <lists+apparmor@lfdr.de>; Wed, 24 Jan 2024 21:52:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rSkDz-0002zl-6J; Wed, 24 Jan 2024 20:51:55 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1rSkDv-0002zY-CG
 for apparmor@lists.ubuntu.com; Wed, 24 Jan 2024 20:51:51 +0000
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-55818b7053eso4402a12.0
 for <apparmor@lists.ubuntu.com>; Wed, 24 Jan 2024 12:51:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706129511; x=1706734311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8AHF91uvt8/XRr8nVpdx7OTkc9kUJK+Zdwkb7E1C+tM=;
 b=Fhcvanr6vaRi/9HkvL95c+h4vAE1uTj91pwZGXTxvUa+HAD6uoJctizmOM6Rv7DT3Q
 SHC9JTephHd7wJi6rnmyBIlVY4VRZS7GQX4mJedbha+AK40Kswyh+LGblgQtKLrmJ01l
 dPL+DoOlCPxrwK7UUmolzj0+DbFsOvNVa9XUsjWIYhdbP9MjLGkQdssOGJQVt3GNWTt9
 XUiN33dSwlIO3qP7X9gvegMiDA/W8j4zG5GYaSy745HsawBFYSnkQGCVnRriwgmYqVzx
 qL3bP7O6V0s0gxMfp+GazOcMnurf6xLJCBfUimw/MOMs1OCiQXFwvtFHpcYfvBwfv+NN
 vnJw==
X-Gm-Message-State: AOJu0YxczTFaVa+mHbYtDIqQ8li0qzt5lYs6YvfICSgW0INVW25rSSQm
 KENpMFnFQ7igoFERlsGkz+s/vN5RKUzQoxCrNZbIKauvtgrjRR/ZS161JBzJaKRjxzHKLW3tmoj
 +LsKPeC05BvVnKGDkI4oR2Fo1vKQVroy34XmR
X-Google-Smtp-Source: AGHT+IFSJu3YtHxJ1C9xsiD6VboT0OpL149sYEOn3JiasNKwbqmVCWDsj+0AThh+onMYWiLSwFji1svlzJHw50Lzx7w=
X-Received: by 2002:a05:6402:b77:b0:55a:7f4e:1d62 with SMTP id
 cb23-20020a0564020b7700b0055a7f4e1d62mr47583edb.4.1706129510820; Wed, 24 Jan
 2024 12:51:50 -0800 (PST)
MIME-Version: 1.0
References: <20240124192228.work.788-kees@kernel.org>
 <CAG48ez017tTwxXbxdZ4joVDv5i8FLWEjk=K_z1Vf=pf0v1=cTg@mail.gmail.com>
 <202401241206.031E2C75B@keescook>
 <CAHk-=wiUwRG7LuR=z5sbkFVGQh+7qVB6_1NM0Ny9SVNL1Un4Sw@mail.gmail.com>
In-Reply-To: <CAHk-=wiUwRG7LuR=z5sbkFVGQh+7qVB6_1NM0Ny9SVNL1Un4Sw@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 24 Jan 2024 21:51:13 +0100
Message-ID: <CAG48ez3v=dWVNaLwQi_f0j5X2+g5e9ubuaZoEkivsCTVK5u24Q@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH] exec: Check __FMODE_EXEC instead of
	in_execve for LSMs
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
Cc: Eric Biederman <ebiederm@xmission.com>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, apparmor@lists.ubuntu.com,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, James Morris <jmorris@namei.org>,
 Josh Triplett <josh@joshtriplett.org>, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-hardening@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Kevin Locke <kevin@kevinlocke.name>,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jan 24, 2024 at 9:47=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 24 Jan 2024 at 12:15, Kees Cook <keescook@chromium.org> wrote:
> >
> > Hmpf, and frustratingly Ubuntu (and Debian) still builds with
> > CONFIG_USELIB, even though it was reported[2] to them almost 4 years ag=
o.
>
> Well, we could just remove the __FMODE_EXEC from uselib.
>
> It's kind of wrong anyway.
>
> Unlike a real execve(), where the target executable actually takes
> control and you can't actually control it (except with ptrace, of
> course), 'uselib()' really is just a wrapper around a special mmap.
>
> And you can see it in the "acc_mode" flags: uselib already requires
> MAY_READ for that reason. So you cannot uselib() a non-readable file,
> unlike execve().
>
> So I think just removing __FMODE_EXEC would just do the
> RightThing(tm), and changes nothing for any sane situation.

Sounds like a good idea. That makes this codepath behave more as if
userspace had done the same steps manually...

