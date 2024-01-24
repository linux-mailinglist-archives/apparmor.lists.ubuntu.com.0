Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B7783B2E8
	for <lists+apparmor@lfdr.de>; Wed, 24 Jan 2024 21:15:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rSjeS-0008JG-3Q; Wed, 24 Jan 2024 20:15:12 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <keescook@chromium.org>)
 id 1rSjeO-0008J8-NS
 for apparmor@lists.ubuntu.com; Wed, 24 Jan 2024 20:15:08 +0000
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6dd853c1f80so24053b3a.1
 for <apparmor@lists.ubuntu.com>; Wed, 24 Jan 2024 12:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706127307; x=1706732107;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Id1qRAoiWWWvqW/dbMxgihjX2oP7pYm4HN95FDf9D2k=;
 b=wLTbucHP6UtuBU3+XOmpLmO4J8LCsJTItDFAeOdBZxqxOlsp7153Htk0imYfvx9AMJ
 1x7WyCYAluIJSlxAWnupnMv1RBLTWYJ3y1HF6u7dadVj0kircvHHzq5BrNtPQfdX7oez
 +BowjgF1a0paUlRZc+8OOgTwngecxOHhDKefXyPsR3gCDW7QE3dRwDRFma1qvOsxJ9yo
 dgaUZHQV85mcj8T8ggp9h+v9J6WT6N4iOoAMOIp5mBO4YwkrvuwkSDDzG5LGcfdVFZjt
 usPZ0H8jeh/wC90QgzimSdyMvx6hrBtApRBTdknfOKdyaOernuU/nMuAI/LoDttPriFW
 tl3A==
X-Gm-Message-State: AOJu0YwaTe3VQwb9Bl3GiTvurMs9f46CuXgGuSRlD8DOVdJSgW+Fv35f
 +YQybMEOTLlZbCJCrXftBgIGKimZX77Ei+IjV8GfHsqf4cmlMaUEvm4NMwtyRQ==
X-Google-Smtp-Source: AGHT+IHQpUi+5B9WnuXhSmDXus8mitL4WXU/2ZY6llD9ZE0jvrWSufppkdsO/vLRfpghtMHGOwhO/A==
X-Received: by 2002:a05:6a00:9297:b0:6db:9c1:7164 with SMTP id
 jw23-20020a056a00929700b006db09c17164mr66699pfb.15.1706127306883; 
 Wed, 24 Jan 2024 12:15:06 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 fb18-20020a056a002d9200b006ddc2ac59cesm546649pfb.12.2024.01.24.12.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 12:15:06 -0800 (PST)
Date: Wed, 24 Jan 2024 12:15:05 -0800
From: Kees Cook <keescook@chromium.org>
To: Jann Horn <jannh@google.com>
Message-ID: <202401241206.031E2C75B@keescook>
References: <20240124192228.work.788-kees@kernel.org>
 <CAG48ez017tTwxXbxdZ4joVDv5i8FLWEjk=K_z1Vf=pf0v1=cTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez017tTwxXbxdZ4joVDv5i8FLWEjk=K_z1Vf=pf0v1=cTg@mail.gmail.com>
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

On Wed, Jan 24, 2024 at 08:58:55PM +0100, Jann Horn wrote:
> On Wed, Jan 24, 2024 at 8:22 PM Kees Cook <keescook@chromium.org> wrote:
> > After commit 978ffcbf00d8 ("execve: open the executable file before
> > doing anything else"), current->in_execve was no longer in sync with the
> > open(). This broke AppArmor and TOMOYO which depend on this flag to
> > distinguish "open" operations from being "exec" operations.
> >
> > Instead of moving around in_execve, switch to using __FMODE_EXEC, which
> > is where the "is this an exec?" intent is stored. Note that TOMOYO still
> > uses in_execve around cred handling.
> 
> I think this is wrong. When CONFIG_USELIB is enabled, the uselib()
> syscall will open a file with __FMODE_EXEC but without going through
> execve(). From what I can tell, there are no bprm hooks on this path.

Hrm, that's true.

We've been trying to remove uselib for at least 10 years[1]. :(

> I don't know if it _matters_ much, given that it'll only let you
> read/execute stuff from files with valid ELF headers, but still.

Hmpf, and frustratingly Ubuntu (and Debian) still builds with
CONFIG_USELIB, even though it was reported[2] to them almost 4 years ago.

-Kees

[1] https://lore.kernel.org/lkml/20140221181103.GA5773@jtriplet-mobl1/
[2] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1879454

-- 
Kees Cook

