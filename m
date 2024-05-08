Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7D98C0B38
	for <lists+apparmor@lfdr.de>; Thu,  9 May 2024 07:53:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1s4wip-0006W8-KX; Thu, 09 May 2024 05:53:39 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <keescook@chromium.org>)
 id 1s4kpO-0003vU-UD
 for apparmor@lists.ubuntu.com; Wed, 08 May 2024 17:11:39 +0000
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6f447260f9dso28637b3a.0
 for <apparmor@lists.ubuntu.com>; Wed, 08 May 2024 10:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715188297; x=1715793097;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tSmrj41Qt+Se2fdGi7WeozvVj6AfH//AS3pb2zkquGg=;
 b=xFP2cbY22EoD2olJYw4ZlQ6ougmvXgffgEu+esfPMtkrtRF60VekZ5jrZTWRaFaAGo
 2eqCPPMrv4vhN9liO1ybA1vh0eJ72Tl5j/tCeZ0HEr2mNTRD/4MLxRyU28eawrvAizCP
 R6r0HqR11ULmiYKChc4TmNLkbNKODIxLypXgbd+7iGyVBSPXmI0qIfymqBieMtaP+619
 T/5eAYgqfPuiNhT+j96JChfKY2pEX5GoHohOu1bJWUjWOqjfIAiSsM2gkMDygq4eJ9fA
 HxOcwLDI5k1GiUBi82T30yB4bRnYVRUiIG9G2xCXOu2zcVTUwynq9TVIsrLGy/uNr3hf
 qYUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu5+8Xxd8+vpVAIjzegtqMZs4KfjIgLiaJ/Ey5SP200BA+HSeUrdxOlNmjrZVMotSTyKXkg7Z8CKKeqK2PvV5pmzHd1npQf88E
X-Gm-Message-State: AOJu0YwbghmBI4/dMsCmUfhD3GwlHDRwRgbE/gjYNHb//79afozhGcmc
 72O308IKeQXixh7yLY65UR2iyclvyfGigt+OGxQHfoVBTFiJ9g6nzjk66UxsWA==
X-Google-Smtp-Source: AGHT+IHN8eeXE9OsgItxEKHR70nrrazwBAjav29jEzJB0wGGmdP+iVlP1VjtMYRBUjqpRzzzPBgYhQ==
X-Received: by 2002:a05:6a20:c88b:b0:1a5:6a85:8ce9 with SMTP id
 adf61e73a8af0-1afc8d1b02amr3543639637.12.1715188296881; 
 Wed, 08 May 2024 10:11:36 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 lp9-20020a056a003d4900b006f44ed124dfsm9245352pfb.160.2024.05.08.10.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 10:11:36 -0700 (PDT)
Date: Wed, 8 May 2024 10:11:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <202405080959.104A73A914@keescook>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <20240424201234.3cc2b509@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424201234.3cc2b509@kernel.org>
Received-SPF: pass client-ip=209.85.210.173;
 envelope-from=keescook@chromium.org; helo=mail-pf1-f173.google.com
X-Mailman-Approved-At: Thu, 09 May 2024 05:53:39 +0000
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
Cc: Joel Granados <j.granados@samsung.com>, Dave Chinner <david@fromorbit.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-sctp@vger.kernel.org,
 lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev,
 apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Apr 24, 2024 at 08:12:34PM -0700, Jakub Kicinski wrote:
> On Tue, 23 Apr 2024 09:54:35 +0200 Thomas Weißschuh wrote:
> > The series was split from my larger series sysctl-const series [0].
> > It only focusses on the proc_handlers but is an important step to be
> > able to move all static definitions of ctl_table into .rodata.
> 
> Split this per subsystem, please.

I've done a few painful API transitions before, and I don't think the
complexity of these changes needs a per-subsystem constification pass. I
think this series is the right approach, but that patch 11 will need
coordination with Linus. We regularly do system-wide prototype changes
like this right at the end of the merge window before -rc1 comes out.

The requirements are pretty simple: it needs to be a obvious changes
(this certainly is) and as close to 100% mechanical as possible. I think
patch 11 easily qualifies. Linus should be able to run the same Coccinelle
script and get nearly the same results, etc. And all the other changes
need to have landed. This change also has no "silent failure" conditions:
anything mismatched will immediately stand out.

So, have patches 1-10 go via their respective subsystems, and once all
of those are in Linus's tree, send patch 11 as a stand-alone PR.

(From patch 11, it looks like the seccomp read/write function changes
could be split out? I'll do that now...)

-Kees

-- 
Kees Cook

