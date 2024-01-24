Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1742D83B42A
	for <lists+apparmor@lfdr.de>; Wed, 24 Jan 2024 22:41:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rSkzw-0007op-VZ; Wed, 24 Jan 2024 21:41:29 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1rSkzu-0007oi-SC
 for apparmor@lists.ubuntu.com; Wed, 24 Jan 2024 21:41:26 +0000
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-55818b7053eso5318a12.0
 for <apparmor@lists.ubuntu.com>; Wed, 24 Jan 2024 13:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706132486; x=1706737286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NToZqtE5w7bxKN+3pRr0bsg8tIkz9lpNWRvoqa9C32U=;
 b=FShVXsY2syv/qugZ6VPih4JCOjGKPwwn9ynEAZg5NdPhhiQm/HsMIAUv5fMDtaaIux
 FTFo9UwpY1Z1CvHYa9I2BJG4WWYge6dJxyOkrJHGmZc0ry/ZuA/IQpZBaCVUEIOqJUVZ
 bH88On/oYODUnvUo2V4qSbcxziEoVTVkkQ4hgEBfBoscy45IAJgJ5ZiG0cKWxxvnZ4O1
 VKdZB4q0ArSnySO46DxJ4JYoSyfWkfuQTMOzk2taZMVsjbHZqFtcifC1oNZw3H9mdH6q
 u8NcP4jQOvNqa915/86Buq8bSXpB1321kS1OAsKFaLfmTBLBhi10YgdLQMM2+uPG2Lb3
 Yj8A==
X-Gm-Message-State: AOJu0YzR3iwIXxkY4oP4IoFAjjDo2VvPuXQO7a8lKeFUO5G2K14xiThc
 gBDPulG7oxC0G2w6mX+O6HslvVOK/JffjqwtfjYULHjGBQn/huwd+8MVpa7i4PHNZinkn6WG4yX
 8xUV6yO9faDY4yfkmOknLm6xu7IYWpvHpNdYI
X-Google-Smtp-Source: AGHT+IHauIX2Vpg/PHzzW0JTV4fDFuqXAIYuBOadb1Lhdqvm+7hcjrHyfDr8nUiI/Qt4r1fFyqSNf90c4QBY22tL2Fo=
X-Received: by 2002:a05:6402:290b:b0:55c:2493:2b31 with SMTP id
 ee11-20020a056402290b00b0055c24932b31mr11642edb.3.1706132486242; Wed, 24 Jan
 2024 13:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20240124192228.work.788-kees@kernel.org>
 <CAG48ez017tTwxXbxdZ4joVDv5i8FLWEjk=K_z1Vf=pf0v1=cTg@mail.gmail.com>
 <202401241206.031E2C75B@keescook>
 <CAHk-=wiUwRG7LuR=z5sbkFVGQh+7qVB6_1NM0Ny9SVNL1Un4Sw@mail.gmail.com>
 <202401241310.0A158998@keescook>
In-Reply-To: <202401241310.0A158998@keescook>
From: Jann Horn <jannh@google.com>
Date: Wed, 24 Jan 2024 22:40:49 +0100
Message-ID: <CAG48ez1tcxtEwWgxSUqLDcYbrkY=UM3hz22A0BTvTYq4BGpM8A@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
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
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Josh Triplett <josh@joshtriplett.org>,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Kevin Locke <kevin@kevinlocke.name>,
 linux-kernel@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jan 24, 2024 at 10:32=E2=80=AFPM Kees Cook <keescook@chromium.org> =
wrote:
>
> On Wed, Jan 24, 2024 at 12:47:34PM -0800, Linus Torvalds wrote:
> > On Wed, 24 Jan 2024 at 12:15, Kees Cook <keescook@chromium.org> wrote:
> > >
> > > Hmpf, and frustratingly Ubuntu (and Debian) still builds with
> > > CONFIG_USELIB, even though it was reported[2] to them almost 4 years =
ago.
>
> For completeness, Fedora hasn't had CONFIG_USELIB for a while now.
>
> > Well, we could just remove the __FMODE_EXEC from uselib.
> >
> > It's kind of wrong anyway.
>
> Yeah.
>
> > So I think just removing __FMODE_EXEC would just do the
> > RightThing(tm), and changes nothing for any sane situation.
>
> Agreed about these:
>
> - fs/fcntl.c is just doing a bitfield sanity check.
>
> - nfs_open_permission_mask(), as you say, is only checking for
>   unreadable case.
>
> - fsnotify would also see uselib() as a read, but afaict,
>   that's what it would see for an mmap(), so this should
>   be functionally safe.
>
> This one, though, I need some more time to examine:
>
> - AppArmor, TOMOYO, and LandLock will see uselib() as an
>   open-for-read, so that might still be a problem? As you
>   say, it's more of a mmap() call, but that would mean
>   adding something a call like security_mmap_file() into
>   uselib()...
>
> The issue isn't an insane "support uselib() under AppArmor" case, but
> rather "Can uselib() be used to bypass exec/mmap checks?"
>
> This totally untested patch might give appropriate coverage:
>
> diff --git a/fs/exec.c b/fs/exec.c
> index d179abb78a1c..0c9265312c8d 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -143,6 +143,10 @@ SYSCALL_DEFINE1(uselib, const char __user *, library=
)
>         if (IS_ERR(file))
>                 goto out;
>
> +       error =3D security_mmap_file(file, PROT_READ | PROT_EXEC, MAP_FIX=
ED | MAP_SHARED);
> +       if (error)
> +               goto exit;

Call path from here is:

sys_uselib -> load_elf_library -> elf_load -> elf_map -> vm_mmap ->
vm_mmap_pgoff

Call path for normal mmap is:

sys_mmap_pgoff -> ksys_mmap_pgoff -> vm_mmap_pgoff

So I think the call paths converge before any real security checks
happen, and the check you're suggesting should be superfluous. (There
is some weird audit call in ksys_mmap_pgoff() but that's just to
record the FD number, so I guess that doesn't matter.)

