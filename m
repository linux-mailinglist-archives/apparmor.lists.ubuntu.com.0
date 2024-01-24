Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D1583B2A4
	for <lists+apparmor@lfdr.de>; Wed, 24 Jan 2024 20:59:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rSjPN-0006Ep-4v; Wed, 24 Jan 2024 19:59:37 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1rSjPI-0006EK-Eq
 for apparmor@lists.ubuntu.com; Wed, 24 Jan 2024 19:59:32 +0000
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-55818b7053eso3536a12.0
 for <apparmor@lists.ubuntu.com>; Wed, 24 Jan 2024 11:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706126372; x=1706731172;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IbNRc2tTI3uRJ4hOoUG/LLCmL8sxwzKLKOM6UpHlIBE=;
 b=vyv/KwScD6ddQOeE7gcfjbmmlki3HpDrYqXAbshvm/oCeSiuoBAcHcVWfxixIfaT3i
 uqPcqEuppXohSuuDe289GTRktwJEF5VdtoLZQY8fTjcYf4LafFMYZkTZ2kpkjfTISemG
 pJS0iAg/3gjnWS7p7eDn9labeK1ANZQwvZkWTZYuqIbu8ipwzoAOuUGy7VJfBMngWLwe
 1GbuNn5dvfWWJiZS4P5wdJjhWcYcTohps58m3N3vEJZ/1BTx9lhr8JcYyC8fj7oDJP0n
 Z+k7rkbLrvYKzsvbgzrBU0NTX0OkeGCqCs5ATOxpGIf7UTIl9UtrR45D9bQev8lU/QKu
 3Jkg==
X-Gm-Message-State: AOJu0YxUJo41y5atBaBIhYtz/E1XZiTX2/tRO29ne1TyhK8OCMxP3DoE
 RhbnXBfi4Ue0d/OkkAm4w7L2aYmcTiy6TntXpp77WHvyMP7eLuNkJwNYkIVE4Z4mS5m0ciGEoHM
 AoazIvWNQ0+J/U9qJ9JywWYYa4sEkH1lHjUmB
X-Google-Smtp-Source: AGHT+IHnF4f0O7cgArzhqXohHk8DKWdbCZVXNqyko/Yg6gnRAIJ7ffyT6vZhUBC9TtgW0kqc22Osp9E7+o4qEnIEp44=
X-Received: by 2002:a05:6402:1bc9:b0:55c:8eda:6e19 with SMTP id
 ch9-20020a0564021bc900b0055c8eda6e19mr34873edb.2.1706126371819; Wed, 24 Jan
 2024 11:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20240124192228.work.788-kees@kernel.org>
In-Reply-To: <20240124192228.work.788-kees@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Wed, 24 Jan 2024 20:58:55 +0100
Message-ID: <CAG48ez017tTwxXbxdZ4joVDv5i8FLWEjk=K_z1Vf=pf0v1=cTg@mail.gmail.com>
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
 Kevin Locke <kevin@kevinlocke.name>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Josh Triplett <josh@joshtriplett.org>,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jan 24, 2024 at 8:22=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
> After commit 978ffcbf00d8 ("execve: open the executable file before
> doing anything else"), current->in_execve was no longer in sync with the
> open(). This broke AppArmor and TOMOYO which depend on this flag to
> distinguish "open" operations from being "exec" operations.
>
> Instead of moving around in_execve, switch to using __FMODE_EXEC, which
> is where the "is this an exec?" intent is stored. Note that TOMOYO still
> uses in_execve around cred handling.

I think this is wrong. When CONFIG_USELIB is enabled, the uselib()
syscall will open a file with __FMODE_EXEC but without going through
execve(). From what I can tell, there are no bprm hooks on this path.

I don't know if it _matters_ much, given that it'll only let you
read/execute stuff from files with valid ELF headers, but still.

