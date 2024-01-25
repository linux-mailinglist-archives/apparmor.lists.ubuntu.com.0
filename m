Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A82383C5E3
	for <lists+apparmor@lfdr.de>; Thu, 25 Jan 2024 16:00:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rT1Cx-0008R8-9S; Thu, 25 Jan 2024 14:59:59 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1rT1Ct-0008R1-OU
 for apparmor@lists.ubuntu.com; Thu, 25 Jan 2024 14:59:55 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-55c24a32bf4so15315a12.0
 for <apparmor@lists.ubuntu.com>; Thu, 25 Jan 2024 06:59:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706194795; x=1706799595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVvEtQm6kIc5iJVLjWQ7WGuCykEqscCeR/8JE5EYsvU=;
 b=Yv6JyKAuO+qq1ah+XXV7xFrkGBZin3sEVzULaZYHy7xSyxTqmB9bwF+KsM64REoi3o
 nIQ5ikJFDJFpwB4qmnXU4onkhOrHaHRunT+jjTluuEyi6QdYc07dStro9ZKomoSMGtws
 GKnl0KDuzOsU5ebIV+lWuw9KOmPpvWNNFKhYwekTztGPYlXpPHuPXILK2GWZCmYL3QL1
 BlBJeoXbMlaAL7nBomIE3SK4SDvb77aLxY62468TylXMkPU7+Q9ExENaTrthlNr3Ok/Q
 MFZgrZWzb77Q+T3jjbqSMmU0MQsXIQOcLCBwu8+fh9hwuf+t4RHJfHzd01YpI3SWfqWX
 vKlA==
X-Gm-Message-State: AOJu0Yy6JVYIubUuM8jZkXZYNcSZY/tKiXPySVg0gary/GQx99mQz/1l
 Ui4XkA6nVzQ55lQQt1BgR+G/VV6THMt6mO9m90jchw5A6wA4A5Znsi6LjZi0ZsbaGceEC2Yleo0
 PAbvRdfMF44Ljw5sJGYI2p1dBE9SSjSOCoMnK
X-Google-Smtp-Source: AGHT+IGIh91e+GUrEWI2VlgkJRJgEwPq3pQit/1u6pod8dk+ZSjuV2o1xzEEvMsVGi6ZGj+bb5Hul2/ERa0C1CI5xvw=
X-Received: by 2002:a05:6402:c08:b0:55c:e50c:c66 with SMTP id
 co8-20020a0564020c0800b0055ce50c0c66mr233529edb.0.1706194795113; Thu, 25 Jan
 2024 06:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20240124192228.work.788-kees@kernel.org>
 <CAG48ez017tTwxXbxdZ4joVDv5i8FLWEjk=K_z1Vf=pf0v1=cTg@mail.gmail.com>
 <202401241206.031E2C75B@keescook>
 <CAHk-=wiUwRG7LuR=z5sbkFVGQh+7qVB6_1NM0Ny9SVNL1Un4Sw@mail.gmail.com>
 <202401241310.0A158998@keescook>
 <CAG48ez1tcxtEwWgxSUqLDcYbrkY=UM3hz22A0BTvTYq4BGpM8A@mail.gmail.com>
 <202401241348.1A2860EB58@keescook>
 <62d1c43c-18e5-4ddf-ad85-c47e5c58d79a@I-love.SAKURA.ne.jp>
In-Reply-To: <62d1c43c-18e5-4ddf-ad85-c47e5c58d79a@I-love.SAKURA.ne.jp>
From: Jann Horn <jannh@google.com>
Date: Thu, 25 Jan 2024 15:59:18 +0100
Message-ID: <CAG48ez1BwRBy67=c7bgsNCoGHaw82tyU0O_QJjbFvQYVd9Aukg@mail.gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Josh Triplett <josh@joshtriplett.org>,
 James Morris <jmorris@namei.org>, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-hardening@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Kevin Locke <kevin@kevinlocke.name>,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Jan 25, 2024 at 3:35=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2024/01/25 6:50, Kees Cook wrote:
> > Yeah, I was just noticing this. I was over thinking. :) It does look
> > like all that is needed is to remove __FMODE_EXEC.
>
> I worry that some out-of-tree kernel code continues using __FMODE_EXEC fo=
r
> opening for non-execve() purpose. If that happened, TOMOYO will be fooled=
...

I just scrolled through the Github code search results for the query
"__FMODE_EXEC -path:fs/exec.c -path:fs/fcntl.c -path:fs/nfs/
-path:security/tomoyo/ -path:security/apparmor/
-path:include/linux/fsnotify.h -path:nfs/dir.c
-path:include/linux/fs.h -path:security/landlock/", and the only place
I saw in there that sets __FMODE_EXEC, other than copies of core
kernel code in weirdly named files, was this one hit in a patch for
the 2.6.39 kernel to add plan9 syscalls:

https://github.com/longlene/clx/blob/fdf996e0c2a7835d61ee827a82146723de76a3=
64/sys-kernel/glendix-sources/files/glendix_2.6.39.patch#L2833

Debian codesearch also doesn't show anything relevant.

So I don't think we have to be particularly worried about that.

