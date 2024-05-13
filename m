Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C55EC8C3ACA
	for <lists+apparmor@lfdr.de>; Mon, 13 May 2024 06:45:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1s6NYa-0002vB-Bv; Mon, 13 May 2024 04:45:00 +0000
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <keescook@chromium.org>)
 id 1s6Lt6-0002gh-Mn
 for apparmor@lists.ubuntu.com; Mon, 13 May 2024 02:58:04 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6f457853950so3241481b3a.0
 for <apparmor@lists.ubuntu.com>; Sun, 12 May 2024 19:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715569083; x=1716173883;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/lu5TaLovMBUI69zhtefvoAbFIExvkJe/gVrMPa9Rs=;
 b=eQnEAyso7vx6BtBHuwnkWmca3RsyjuG/urpx1FEmjAZQ7GYbQ6RGarKW0cY0fFxWen
 ekkxuMM8rCO0JHMzEj1tsTdsmVD4rmLKngvempmllOM0qtnywCwlQTPrZh1xqGTWLUmy
 dUYOss6TiuPbrLhJjBbmFO27ADTRnrhTamZe4oKNXMUurar+9b9JNNezGnKhb2LUtUFc
 PWugi4hF2AEY3BwJSaTkdBIP3gpbtK2P00z/T7dV9cASdUExxCriAOavb+JNDU0pRnJr
 z/UgyHRx7wwPJxfarGrAW7Ib/LGwrX6+fWwxHLVYLGwHmPsAuWxGorrX3d0ETmj6auOe
 f1RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhz+CdVttI0VotlQU7Jljvv5m+zW3NC8s4z85hQWrXk4MB0BooKznX/lsgfWeWbdFh/4lBjruF2BGcn8xhKnX2BT9w5872/774
X-Gm-Message-State: AOJu0Yw/rzVlzQb5i8BDTDkFh5xgbN9Nc6XdTO/CE5UItH39H8ExBFkq
 ae20ep1k23gPAssNc1O/z4wecFZZKXaEHMZtZNtv84bKESdVqzOJLpuQAP0+Xw==
X-Google-Smtp-Source: AGHT+IEKZ/LshmwPejdGxanAmq+x/Okf3LXGs+1GNXJLM4QWlBn90rXQR1Oeyq1KkYKRq0CgAkrYow==
X-Received: by 2002:a05:6a21:1505:b0:1ad:7e68:570c with SMTP id
 adf61e73a8af0-1afde07d801mr12977761637.4.1715569082704; 
 Sun, 12 May 2024 19:58:02 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2b2fa86sm6335827b3a.213.2024.05.12.19.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 19:58:00 -0700 (PDT)
Date: Sun, 12 May 2024 19:57:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Joel Granados <j.granados@samsung.com>
Message-ID: <202405121955.BC922680BA@keescook>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <20240424201234.3cc2b509@kernel.org>
 <202405080959.104A73A914@keescook>
 <CGME20240511095125eucas1p1e6cd077a31c94dcdda88967d4ffc9262@eucas1p1.samsung.com>
 <8d1daa64-3746-46a3-b696-127a70cdf7e7@t-8ch.de>
 <20240512193240.kholmilosdqjb52p@joelS2.panther.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240512193240.kholmilosdqjb52p@joelS2.panther.com>
Received-SPF: pass client-ip=209.85.210.169;
 envelope-from=keescook@chromium.org; helo=mail-pf1-f169.google.com
X-Mailman-Approved-At: Mon, 13 May 2024 04:44:59 +0000
Subject: Re: [apparmor] [PATCH v3 00/11] sysctl: treewide: constify
 ctl_table argument of sysctl handlers
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
Cc: Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-sctp@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org,
 bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, May 12, 2024 at 09:32:40PM +0200, Joel Granados wrote:
> On Sat, May 11, 2024 at 11:51:18AM +0200, Thomas Weißschuh wrote:
> > Hi Kees,
> > 
> > On 2024-05-08 10:11:35+0000, Kees Cook wrote:
> > > On Wed, Apr 24, 2024 at 08:12:34PM -0700, Jakub Kicinski wrote:
> > > > On Tue, 23 Apr 2024 09:54:35 +0200 Thomas Weißschuh wrote:
> > > > > The series was split from my larger series sysctl-const series [0].
> > > > > It only focusses on the proc_handlers but is an important step to be
> > > > > able to move all static definitions of ctl_table into .rodata.
> > > > 
> > > > Split this per subsystem, please.
> > > 
> > > I've done a few painful API transitions before, and I don't think the
> > > complexity of these changes needs a per-subsystem constification pass. I
> > > think this series is the right approach, but that patch 11 will need
> > > coordination with Linus. We regularly do system-wide prototype changes
> > > like this right at the end of the merge window before -rc1 comes out.
> > 
> > That sounds good.
> > 
> > > The requirements are pretty simple: it needs to be a obvious changes
> > > (this certainly is) and as close to 100% mechanical as possible. I think
> > > patch 11 easily qualifies. Linus should be able to run the same Coccinelle
> > > script and get nearly the same results, etc. And all the other changes
> > > need to have landed. This change also has no "silent failure" conditions:
> > > anything mismatched will immediately stand out.
> > 
> > Unfortunately coccinelle alone is not sufficient, as some helpers with
> > different prototypes are called by handlers and themselves are calling
> > handler and therefore need to change in the same commit.
> > But if I add a diff for those on top of the coccinelle script to the
> > changelog it should be obvious.
> Judging by Kees' comment on "100% mechanical", it might be better just
> having the diff and have Linus apply than rather than two step process?
> Have not these types of PRs, so am interested in what folks think.

I tried to soften it a little with my "*close* to 100%" modifier, and
I think that patch basically matched that requirement, and where it had
manual changes it was detailed in the commit log. I only split out the
seccomp part because it could actually stand alone.

So yeah, let's get the last of the subsystem specific stuff landed after
-rc1, and it should be possible to finish it all up for 6.11. Yay! :)

-Kees

-- 
Kees Cook

