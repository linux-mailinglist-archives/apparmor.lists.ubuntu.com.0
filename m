Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9374B83B32E
	for <lists+apparmor@lfdr.de>; Wed, 24 Jan 2024 21:48:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rSkA8-0002YB-4V; Wed, 24 Jan 2024 20:47:56 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <torvalds@linuxfoundation.org>)
 id 1rSkA5-0002Xx-1s
 for apparmor@lists.ubuntu.com; Wed, 24 Jan 2024 20:47:53 +0000
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-55a8fb31fc2so5543692a12.0
 for <apparmor@lists.ubuntu.com>; Wed, 24 Jan 2024 12:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706129272; x=1706734072;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rk3ry+wMmO/dN2zz3UHRD0lGEi4syprX1/TUT7irM/o=;
 b=DyL9QAmSqF1YfYg15EzC1aAlCYS6sClM+4f878xcgypJLSRgvUJsZaOklOchobN0lQ
 /3kNS2VtQoivxb2N9ENakmshcr+utXXqpPnP1ozE2CIhb4KnICOfd3R+oIK1AfqjOUtl
 IO8omfUK7cDz+bgtuj8bU14hSo1BTI6035jPe5jLJWB9BGW8/mYLDWhWeOXy0Qqpb9Qm
 6FhWuGhIhCsZrxaOqmLwSWJ/eEnp20kLgQTuBw9chgYN6d6I8/IFV7LYg59u+etDXY63
 S1iEpEkL8Otomy1t9t+uN/lFtgm3f6wZg3fxEfixig5nQIFY2kOuaQRgkEoxpEX1Pp80
 8TQg==
X-Gm-Message-State: AOJu0Yxz9Iar5yVcghNo2Jb4tZevJ3dhiGqbNKiX6muhaM8aC7OXMXYa
 x2iHw2ATdO1ZIGfUo5lgxLqDlAsaVHti5HFXZ+t/j5ikDhL8VRA6sZeCq6MFlb6Z/z5/Ntt9YSy
 XN16N5w==
X-Google-Smtp-Source: AGHT+IG9ejaAEXY9wmtAEHbO8a8/UQmH6fDNDO8QAPkqOuFbwbN7dRy1KuRlrwE2ICS38yZLZBxcIg==
X-Received: by 2002:aa7:c593:0:b0:55c:68ca:b782 with SMTP id
 g19-20020aa7c593000000b0055c68cab782mr11396edq.43.1706129272485; 
 Wed, 24 Jan 2024 12:47:52 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 dm24-20020a05640222d800b0055c1433be60sm4669604edb.50.2024.01.24.12.47.51
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 12:47:51 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40e9101b5f9so65455875e9.3
 for <apparmor@lists.ubuntu.com>; Wed, 24 Jan 2024 12:47:51 -0800 (PST)
X-Received: by 2002:a05:600c:4ec9:b0:40e:a3aa:a463 with SMTP id
 g9-20020a05600c4ec900b0040ea3aaa463mr1545745wmq.20.1706129271244; Wed, 24 Jan
 2024 12:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20240124192228.work.788-kees@kernel.org>
 <CAG48ez017tTwxXbxdZ4joVDv5i8FLWEjk=K_z1Vf=pf0v1=cTg@mail.gmail.com>
 <202401241206.031E2C75B@keescook>
In-Reply-To: <202401241206.031E2C75B@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 24 Jan 2024 12:47:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiUwRG7LuR=z5sbkFVGQh+7qVB6_1NM0Ny9SVNL1Un4Sw@mail.gmail.com>
Message-ID: <CAHk-=wiUwRG7LuR=z5sbkFVGQh+7qVB6_1NM0Ny9SVNL1Un4Sw@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
 Paul Moore <paul@paul-moore.com>, Jann Horn <jannh@google.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Josh Triplett <josh@joshtriplett.org>,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Kevin Locke <kevin@kevinlocke.name>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, 24 Jan 2024 at 12:15, Kees Cook <keescook@chromium.org> wrote:
>
> Hmpf, and frustratingly Ubuntu (and Debian) still builds with
> CONFIG_USELIB, even though it was reported[2] to them almost 4 years ago.

Well, we could just remove the __FMODE_EXEC from uselib.

It's kind of wrong anyway.

Unlike a real execve(), where the target executable actually takes
control and you can't actually control it (except with ptrace, of
course), 'uselib()' really is just a wrapper around a special mmap.

And you can see it in the "acc_mode" flags: uselib already requires
MAY_READ for that reason. So you cannot uselib() a non-readable file,
unlike execve().

So I think just removing __FMODE_EXEC would just do the
RightThing(tm), and changes nothing for any sane situation.

In fact, I don't think __FMODE_EXEC really ever did anything for the
uselib() case, so removing it *really* shouldn't matter, and only fix
the new AppArmor / Tomoyo use.

Of course, as you say, not having CONFIG_USELIB enabled at all is the
_truly_ sane thing, but the only thing that used the FMODE_EXEC bit
were landlock and some special-case nfs stuff.

And at least the nfs stuff was about "don't require read permissions
for exec", which was already wrong for the uselib() case as per above.

So I think the simple oneliner is literally just

  --- a/fs/exec.c
  +++ b/fs/exec.c
  @@ -128,7 +128,7 @@ SYSCALL_DEFINE1(uselib, const char __user *, library)
        struct filename *tmp = getname(library);
        int error = PTR_ERR(tmp);
        static const struct open_flags uselib_flags = {
  -             .open_flag = O_LARGEFILE | O_RDONLY | __FMODE_EXEC,
  +             .open_flag = O_LARGEFILE | O_RDONLY,
                .acc_mode = MAY_READ | MAY_EXEC,
                .intent = LOOKUP_OPEN,
                .lookup_flags = LOOKUP_FOLLOW,

but I obviously have nothing that uses uselib(). I don't see how it
really *could* break anything, though, exactly because of that

                .acc_mode = MAY_READ | MAY_EXEC,

that means that the *regular* permission checks already require the
file to be readable. Never mind any LSM checks that might be confused.

           Linus

