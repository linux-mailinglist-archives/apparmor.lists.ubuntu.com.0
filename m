Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC29372F2
	for <lists+apparmor@lfdr.de>; Fri, 19 Jul 2024 06:08:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sUeub-0008G0-4r; Fri, 19 Jul 2024 04:08:05 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sUd2W-0005iU-QR
 for apparmor@lists.ubuntu.com; Fri, 19 Jul 2024 02:08:08 +0000
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-79ef72bb8c8so47581785a.2
 for <apparmor@lists.ubuntu.com>; Thu, 18 Jul 2024 19:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721354887; x=1721959687;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :content-disposition:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YDBm3QRwilAu+OHaz6Ln5e9Jy4Z5QvQg9nfn3ZsegWg=;
 b=t0ZkB84ctNqEZjZGwWavVpNMCkH5fZuv3lgSJYAnJX06pzzmjbpiQD0UxwABlrGrjM
 fLtCy45FZcFL1p8rpivhGgUXTX/psIgF4Y/9R60vhAePuwtxhVVZhmWkwrvF58Zp+baR
 elfyOfC78N1ytpvGOxjkoJ3Oak9D19h+FG4LNY+hJ0Hu4bRQqd8Wx5pkA/WIrPtaXL9p
 IuGCXrv4GY/85hgyHBxQGavlHPfIVgJ70Emaf8608mjDCwHvUXH1ggpouYfN1/YXdqdU
 wXxfrqElteTOpi8j6fGc92UhwysraelO/Z6qX26/O9ijoFb5qmRf5cCPCrpus8Tadv2C
 kxbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+bQZCjJruz3gkxVRa9Kb1yDdk1fDPao9EhYcMVKeGMUWGmiquSJV+yCss6arD3czL4iOtYvehS48NJ4NoOnnLwxhum2/K40p9
X-Gm-Message-State: AOJu0YwamrN5qHHZGqbPrFaN5Xyi/YXlv+wxfokqaX6W9PjAy3NaJiXV
 pGFsL1aLlrKKqlPw8A/oEbdWQ8/NEFTMxbTBowRC0mWNozJHhHXyUasxkWAUVQ==
X-Google-Smtp-Source: AGHT+IHJXqsEfMvaJ3I4voV7h0JmzEBLz/Y77YU9PWIwttNlLAz95UGh+qmMP8iEzkPgMVaZTYkx+Q==
X-Received: by 2002:a05:620a:4014:b0:79e:ff47:3307 with SMTP id
 af79cd13be357-7a1938c1fb6mr351466485a.8.1721354887484; 
 Thu, 18 Jul 2024 19:08:07 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a198e9f7ccsm22476985a.0.2024.07.18.19.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 19:08:07 -0700 (PDT)
Date: Thu, 18 Jul 2024 22:08:06 -0400
Message-ID: <35bc63dac544edc75c25b8dc6c8c99d0@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-integrity@vger.kernel.org,
 apparmor@lists.ubuntu.com, selinux@vger.kernel.org
References: <20240711111908.3817636-9-xukuohai@huaweicloud.com>
In-Reply-To: <20240711111908.3817636-9-xukuohai@huaweicloud.com>
Received-SPF: pass client-ip=209.85.222.174; envelope-from=paul@paul-moore.com;
 helo=mail-qk1-f174.google.com
X-Mailman-Approved-At: Fri, 19 Jul 2024 04:07:59 +0000
Subject: Re: [apparmor] [PATCH v4 8/20] lsm: Refactor return value of LSM
	hook getprocattr
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
Cc: Matt Bobrowski <mattbobrowski@google.com>,
 Shung-Hsi Yu <shung-hsi.yu@suse.com>, Alexei Starovoitov <ast@kernel.org>,
 James Morris <jmorris@namei.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Anna Schumaker <anna@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Edward Cree <ecree.xilinx@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E . Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 KP Singh <kpsingh@kernel.org>, Brendan Jackman <jackmanb@chromium.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, Hao Luo <haoluo@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Eduard Zingerman <eddyz87@gmail.com>,
 Khadija Kamran <kamrankhadijadj@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Jul 11, 2024 Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> 
> To be consistent with most LSM hooks, convert the return value of
> hook getprocattr to 0 or a negative error code.
> 
> Before:
> - Hook getprocattr returns length of value on success or a negative
>   error code on failure.
> 
> After:
> - Hook getprocattr returns 0 on success or a negative error code on
>   failure. An output parameter @len is introduced to hold the
>   length of value on success.
> 
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  fs/proc/base.c                |  5 ++++-
>  include/linux/lsm_hook_defs.h |  2 +-
>  include/linux/security.h      |  5 +++--
>  security/apparmor/lsm.c       |  7 +++++--
>  security/security.c           |  8 +++++---
>  security/selinux/hooks.c      | 16 +++++++++-------
>  security/smack/smack_lsm.c    | 11 ++++++-----
>  7 files changed, 33 insertions(+), 21 deletions(-)

The patch 07/20 comments also apply here.

--
paul-moore.com

