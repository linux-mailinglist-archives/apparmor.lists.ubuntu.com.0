Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D079372ED
	for <lists+apparmor@lfdr.de>; Fri, 19 Jul 2024 06:08:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sUeuW-0008DM-49; Fri, 19 Jul 2024 04:08:00 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sUd2Y-0005kU-TX
 for apparmor@lists.ubuntu.com; Fri, 19 Jul 2024 02:08:11 +0000
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-447e2d719afso7231431cf.0
 for <apparmor@lists.ubuntu.com>; Thu, 18 Jul 2024 19:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721354890; x=1721959690;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :content-disposition:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rMOlvLeBY7ppQNW0gAgKhdZZMuR5DbNUZUz+dYFqAno=;
 b=VKrx78blbIgoz+mkFMTmjXe9iDNfJFocsYRm3VzkQ5b0qIX5Zjh7OXhTSEfktYloe3
 0+eIg9uNQTqmWQnVlI+pBv2YrZMXl5Ds5hY+WxbFMRwsiXKxAsZD2FQuKoFCe+dVfESR
 s/y6CMbH7VeQ4yg1ekVM551G16RCZ3DEBTd3tEsXPvVME+dqFIM3KsJVi55sh0XIDAfi
 Sm9QhcbN863LXHgS0BugR+dFFl7sVkmR78RY9rGc5sg7A86CA3jNVm9A/jYgJwLZe3sC
 x2XdJi2kYWVNQOuZLVfJ0jzq0/jU1NVhRzJX/RciaeZZvS7x1qoRjyjwHxJIdunkCHvC
 lOqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb1jvLjKB5YPvK6bvpP7/syZ2cvX+T9mj6uNISEtteDcIDHBfQCHJNLUMC1cKx5CFGWCUhHiE0zcRO9od9PlpoYMBgaEljKDtr
X-Gm-Message-State: AOJu0YxTxj+sX11MO900VcRmdZbJvEzueV3XlRhiyHz01Ysu0ex+NLoa
 lqnJ7uYYCWewHY9gUOwlmPOkbxWOWuxc7Q96IzeI5CrF1cS+U9PfrkTnjndXGQ==
X-Google-Smtp-Source: AGHT+IEBnfC7Z+DraNQAASQJMOLlLlWDrffQUInj80cQBOtE30aHUMisjm3m1RV5kIOe1OrL1A7ytA==
X-Received: by 2002:a05:622a:4c8:b0:442:198e:cb9 with SMTP id
 d75a77b69052e-44f96b7c8bdmr46243691cf.27.1721354889692; 
 Thu, 18 Jul 2024 19:08:09 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f9cda2ee1sm1843791cf.73.2024.07.18.19.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 19:08:09 -0700 (PDT)
Date: Thu, 18 Jul 2024 22:08:08 -0400
Message-ID: <36836e7b94465fd11d3425166ade3f54@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-integrity@vger.kernel.org,
 apparmor@lists.ubuntu.com, selinux@vger.kernel.org
References: <20240711111908.3817636-11-xukuohai@huaweicloud.com>
In-Reply-To: <20240711111908.3817636-11-xukuohai@huaweicloud.com>
Received-SPF: pass client-ip=209.85.160.180; envelope-from=paul@paul-moore.com;
 helo=mail-qt1-f180.google.com
X-Mailman-Approved-At: Fri, 19 Jul 2024 04:07:59 +0000
Subject: Re: [apparmor] [PATCH v4 10/20] lsm: Refactor return value of LSM
	hook audit_rule_match
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
> hook audit_rule_match to 0 or a negative error code.
> 
> Before:
> - Hook audit_rule_match returns 1 if the rule matches, 0 if it not,
>   and negative error code otherwise.
> 
> After:
> - Hook audit_rule_match returns 0 on success or a negative error
>   code on failure. An output parameter @match is introduced to hold
>   the match result on success.
> 
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  include/linux/lsm_hook_defs.h     |  3 +-
>  security/apparmor/audit.c         | 22 ++++++-------
>  security/apparmor/include/audit.h |  2 +-
>  security/security.c               | 15 ++++++++-
>  security/selinux/include/audit.h  |  8 +++--
>  security/selinux/ss/services.c    | 54 +++++++++++++++++--------------
>  security/smack/smack_lsm.c        | 19 +++++++----
>  7 files changed, 75 insertions(+), 48 deletions(-)

This is another odd hook, and similar to some of the others in this
patchset, I'm not sure how applicable this would be to a BPF-based
LSM.  I suspect you could safely block this from a BPF LSM and no one
would notice or be upset.

However, if we did want to keep this hook for a BPF LSM, I think it
might be better to encode the "match" results in the return value, just
sticking with a more conventional 0/errno approach.  What do you think
about 0:found/ok, -ENOENT:missing/ok, -ERRNO:other/error?  Yes, some
of the existing LSM audit_match code uses -ENOENT but looking quickly
at those error conditions it seems that we could consider them
equivalent to a "missing" or "failed match" result and use -ENOENT for
both.  If you're really not happy with that overloading, we could use
something like -ENOMSG:missing/ok instead.

Thoughts?

--
paul-moore.com

