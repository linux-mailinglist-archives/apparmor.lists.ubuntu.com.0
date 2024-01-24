Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990C83B28E
	for <lists+apparmor@lfdr.de>; Wed, 24 Jan 2024 20:52:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rSjHw-0005bV-Aa; Wed, 24 Jan 2024 19:51:56 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <keescook@chromium.org>)
 id 1rSjHs-0005bB-9C
 for apparmor@lists.ubuntu.com; Wed, 24 Jan 2024 19:51:52 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1d71207524dso25863405ad.1
 for <apparmor@lists.ubuntu.com>; Wed, 24 Jan 2024 11:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706125911; x=1706730711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kA0mFxG1k0QSiOKDeUD/WDcdNFn8yF9DrGJFsA48PEc=;
 b=NcUq4Z+LUOT0PEJzRuc5Z1syE99/q+blS/2kwiFvwJpC0Zgs6Ep03BUjXJxKnJvrgL
 39EQivqJRrc19s3k7S2cLhttpZNj1xwuDSvHuam4Pp68PiwGR9AXfH1IRP4FjPiRs3cD
 lqyVcvdC/3KXzwS8GaBwN1a11Et5p4pty1wkfHWz1UM0swEfe88DWFin2IDi24hPS6mk
 UuQvhKDPtDemdgIg/HCH1I/UvhILalkuuK7wRD9z/muCqjxolt5QXBQFgfGNfX5ahvkU
 qr1mwiMkvOekUk687/WGq/VGgoGy3NthqjHZCxkeF/Hp2samMgQvaL9HOYg4oIRx/FkO
 Xr7Q==
X-Gm-Message-State: AOJu0Yxu3B/btG74mveRSFIPP9bIb02QwK7xmFmoqhMQEabMDWe+10iB
 VQT2Y1C/ItzFtk//xdE/MMSmqlPeGwVALGPq8A6IVVUP9HZ/MTrBU+5joTUPmw==
X-Google-Smtp-Source: AGHT+IHOo2S4XZPrJkJAVWNIUu5O2sihiMmNygdfJCCs51/i38ljraqICbhZ/brbhlRxs5RoeWJoDA==
X-Received: by 2002:a17:902:8685:b0:1d7:70d7:c05a with SMTP id
 g5-20020a170902868500b001d770d7c05amr1210754plo.98.1706125910737; 
 Wed, 24 Jan 2024 11:51:50 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b001d707163122sm10456896pld.7.2024.01.24.11.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 11:51:50 -0800 (PST)
Date: Wed, 24 Jan 2024 11:51:49 -0800
From: Kees Cook <keescook@chromium.org>
To: Kevin Locke <kevin@kevinlocke.name>, Josh Triplett <josh@joshtriplett.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Message-ID: <202401241151.25D468FE@keescook>
References: <20240124192228.work.788-kees@kernel.org>
 <ZbFneq3URF5lLAT7@kevinlocke.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbFneq3URF5lLAT7@kevinlocke.name>
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jan 24, 2024 at 12:39:38PM -0700, Kevin Locke wrote:
> On Wed, 2024-01-24 at 11:22 -0800, Kees Cook wrote:
> > After commit 978ffcbf00d8 ("execve: open the executable file before
> > doing anything else"), current->in_execve was no longer in sync with the
> > open(). This broke AppArmor and TOMOYO which depend on this flag to
> > distinguish "open" operations from being "exec" operations.
> > 
> > Instead of moving around in_execve, switch to using __FMODE_EXEC, which
> > is where the "is this an exec?" intent is stored. Note that TOMOYO still
> > uses in_execve around cred handling.
> 
> It solves the AppArmor issue I was experiencing and I don't notice any
> other issues.
> 
> Tested-by: Kevin Locke <kevin@kevinlocke.name>

Thanks!

Sounds like Linus has taken the patch directly, and I'll send a follow-up
PR with other clean-ups.

-Kees

-- 
Kees Cook

