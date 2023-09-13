Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35F79F4CB
	for <lists+apparmor@lfdr.de>; Thu, 14 Sep 2023 00:13:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qgY6f-00066M-Jr; Wed, 13 Sep 2023 22:13:09 +0000
Received: from mail-qk1-f182.google.com ([209.85.222.182])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1qgY6c-00066F-31
 for apparmor@lists.ubuntu.com; Wed, 13 Sep 2023 22:13:06 +0000
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-76dc77fd01fso22755885a.3
 for <apparmor@lists.ubuntu.com>; Wed, 13 Sep 2023 15:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694643185; x=1695247985;
 h=in-reply-to:references:subject:to:from:message-id:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2p17mow8jOToGHzl/reGSy5sg/JPF1WcbOesSQaNA64=;
 b=Gwk6xmUnGlJsjEtOEzIT2BO6RJF6K/OXE4cv3XdEmAS5wwGiaAnLLpBRHHuYB5Usbj
 3//qL3YPOeOV0x5cjJmutJsxOCgvkJdyWIZggpd/o/Lkg4IdQH28npEnE8f7jFegKVJJ
 fBNNP5KZ1fPA18bQXo4UhYSsbEqFZytON6L7WeYaaSp1SBYYQMGs53Q33Owwr03rVwqW
 PyOl61eKdTKGVYD4joatYEC3CM9GdJ2sOTrGKYRzqbCw4DwzYCknlQw88oRU3/Penpoi
 cmF8szLYsSwmGim9QjIOjpG0F2e5nW6GlZ0eA8tbjMdBBLjOgGxM7nbjsAVd1Zw5PO0w
 +keg==
X-Gm-Message-State: AOJu0YxuXlzSbQutuyNYQmxApJTJCtffX4naJKm0oLNb7Qr5rulbhoZN
 nbXituMF/tg6ulFNakNRxhaJ
X-Google-Smtp-Source: AGHT+IF2ufzmX0mgSW8tYUOIhjgdVWAPVJoSNbm23WjMTFdbfD9qge9HiUsqmQYmCws2E0YhK7FVzg==
X-Received: by 2002:ac8:5e49:0:b0:415:15bd:94d2 with SMTP id
 i9-20020ac85e49000000b0041515bd94d2mr4259821qtx.43.1694643184892; 
 Wed, 13 Sep 2023 15:13:04 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 m4-20020ac807c4000000b00410ab3c78efsm73610qth.11.2023.09.13.15.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 15:13:04 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:13:03 -0400
Message-ID: <82e3a9c95fdc838943802d9a22d83aa8.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>,
 John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>, selinux@vger.kernel.org,
 ztarkhani@microsoft.com, alison.schofield@intel.com
References: <ZOW5rC1MngXvPQLz@gmail.com>
In-Reply-To: <ZOW5rC1MngXvPQLz@gmail.com>
Subject: Re: [apparmor] [PATCH] lsm: constify 'bprm' parameter in
	security_bprm_committing_creds()
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
> The 'bprm_committing_creds' hook has implementations registered in
> SELinux and Apparmor. Looking at the function implementations we observe
> that the 'bprm' parameter is not changing.
> 
> Mark the 'bprm' parameter of LSM hook security_bprm_committing_creds()
> as 'const' since it will not be changing in the LSM hook.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  include/linux/lsm_hook_defs.h | 2 +-
>  include/linux/security.h      | 4 ++--
>  security/apparmor/lsm.c       | 2 +-
>  security/security.c           | 2 +-
>  security/selinux/hooks.c      | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)

Merged into lsm/next, thanks!

--
paul-moore.com

