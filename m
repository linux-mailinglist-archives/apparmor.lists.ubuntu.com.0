Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E366D7A0E53
	for <lists+apparmor@lfdr.de>; Thu, 14 Sep 2023 21:27:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qgs05-00075E-2V; Thu, 14 Sep 2023 19:27:41 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1qgrzu-00074P-FU
 for apparmor@lists.ubuntu.com; Thu, 14 Sep 2023 19:27:31 +0000
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-770ef903e80so88067185a.3
 for <apparmor@lists.ubuntu.com>; Thu, 14 Sep 2023 12:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694719649; x=1695324449;
 h=in-reply-to:references:subject:to:from:message-id:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LgN4WCvEJ8wWXRweLBdinmd4ZI7NWvgRKKEqbKZQ8K4=;
 b=AtxGB9JQU2sPkmR4ZYxPHS2BLHkRE61WgBRyBFd14LfIDgnH5vBgpCFEBE569aWb7E
 mz2l2i0gTyAAGlRV4r6guEz7aEPQZUYiLvblUbH7JuQhp47mhVo8VoG+B3l5CjTkFVqx
 b6QuYNTA9J8DavOjmvbIxP33tKm+N6M4HlZchHo1+2hXQvlNb33kYMk2bwSQOnvRUMvs
 KAflEeGCrlvQA1iBv00P/vuDDbWftqLuwKaqv66VAGBugox2hptbfBk9qE5YnHsKpL/k
 tU0TRS3rsxt7Ib/bgASUPZHIkJugUXeGfbcgzxBlGUD47byhfrjXGUUZ2Weee1gEQAPC
 Bgkw==
X-Gm-Message-State: AOJu0Yyww4pDXaxnu/AZGIUAQdpE4QusqHyEQrDd5YCDUKpv9uBq8ZFU
 l8kLDRFRAMAXidUS3kpLPp+r
X-Google-Smtp-Source: AGHT+IH/m5H1VoxPInjdFLJZV1oHAFDb0GkezDRGraHnDv5FGgIiQcSe7t9i8flET4V69d2gupot8Q==
X-Received: by 2002:a05:620a:d82:b0:76f:1eac:e720 with SMTP id
 q2-20020a05620a0d8200b0076f1eace720mr6189920qkl.25.1694719649320; 
 Thu, 14 Sep 2023 12:27:29 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 m10-20020ae9e00a000000b0076f35d17d06sm684548qkk.69.2023.09.14.12.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 12:27:28 -0700 (PDT)
Date: Thu, 14 Sep 2023 15:27:28 -0400
Message-ID: <c1b149b8a7d35ed3b5da3b17f38547eb.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>,
 John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>, selinux@vger.kernel.org,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, ztarkhani@microsoft.com,
 alison.schofield@intel.com
References: <ZOXAaHDqesqQXaNi@gmail.com>
In-Reply-To: <ZOXAaHDqesqQXaNi@gmail.com>
Subject: Re: [apparmor] [PATCH] lsm: constify 'bprm' parameter in
	security_bprm_committed_creds()
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

On Aug 23, 2023 Khadija Kamran <kamrankhadijadj@gmail.com> wrote:
> 
> Three LSMs register the implementations for the 'bprm_committed_creds()'
> hook: AppArmor, SELinux and tomoyo. Looking at the function
> implementations we may observe that the 'bprm' parameter is not changing.
> 
> Mark the 'bprm' parameter of LSM hook security_bprm_committed_creds() as
> 'const' since it will not be changing in the LSM hook.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  include/linux/lsm_hook_defs.h | 2 +-
>  include/linux/security.h      | 4 ++--
>  security/apparmor/lsm.c       | 2 +-
>  security/security.c           | 2 +-
>  security/selinux/hooks.c      | 2 +-
>  security/tomoyo/tomoyo.c      | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)

Merged into lsm/next, thanks!

--
paul-moore.com

