Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8009372F5
	for <lists+apparmor@lfdr.de>; Fri, 19 Jul 2024 06:08:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sUeuW-0008DF-0l; Fri, 19 Jul 2024 04:08:00 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sUd2U-0005gw-T8
 for apparmor@lists.ubuntu.com; Fri, 19 Jul 2024 02:08:07 +0000
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-447d6edc6b1so5031811cf.0
 for <apparmor@lists.ubuntu.com>; Thu, 18 Jul 2024 19:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721354885; x=1721959685;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :content-disposition:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RdOweloEpaz6RcCvISa0YGQIo20b47lcaEayePDedxM=;
 b=mxlhRV8w4G49mrfxM3TsOn0KJDwqaJJPXBN+Uo8yp5z6QzFJnmInvPiDtX0zICbL0A
 fr/ox6qyXmmv8GlEMJsryj9rhGO6b5qbxqkOqTLxNBx29eO9LjJlQE5BGEzatgwww3Qf
 9JJz9O2WdvkV4SNM582427EW91PPPjIG91eUVADJfM0Mg1/NzmpR5OMaJQ2AWf5Us7hO
 Tq6aP8inznEdP3I7K+lh6yE/x/u30+r3HeT9UPg3QjPnYkgwrfFw9qgQzakOvWkg4XNV
 Q6AUx5AUgQ2PL7igJsuYpAOR7gdBPfx8jkANUZG2Xx61ow/f4lcKGJIkY1+4LwU9r9X+
 E6pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSUdLmTiSuU4a1yGFdP3sPVrJ5cwI65EJYDJHVkcrq1n9MGDuKsPqimr8gXZDv2eLcjQov7X5d3Fw4ijI3BOWSPebhVV890uql
X-Gm-Message-State: AOJu0Yxu2LtgaIgUVdjNSdHQVqKQDwCc2FRR5JV5LyGvO7OxpqUlEKkG
 hvPwH4v82SsrmBVDWYZa0jmI+Xvnfy5XOqAOP1Vi9DAcmXjX+d4Q+KkX6ww5EQ==
X-Google-Smtp-Source: AGHT+IF74+EqudtKUL7i1ZCCvXjz+qd3zopM19m0jWGVbddz7RHlAWv2UgDf87dhf8FKY+88djubgQ==
X-Received: by 2002:a05:6214:2301:b0:6b5:3c06:a58b with SMTP id
 6a1803df08f44-6b78e364c4fmr77396666d6.59.1721354885611; 
 Thu, 18 Jul 2024 19:08:05 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7ac7dfc97sm1785356d6.46.2024.07.18.19.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 19:08:04 -0700 (PDT)
Date: Thu, 18 Jul 2024 22:08:04 -0400
Message-ID: <6e79c031aa6c223df552726ac6537d44@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-integrity@vger.kernel.org,
 apparmor@lists.ubuntu.com, selinux@vger.kernel.org
References: <20240711111908.3817636-7-xukuohai@huaweicloud.com>
In-Reply-To: <20240711111908.3817636-7-xukuohai@huaweicloud.com>
Received-SPF: pass client-ip=209.85.160.178; envelope-from=paul@paul-moore.com;
 helo=mail-qt1-f178.google.com
X-Mailman-Approved-At: Fri, 19 Jul 2024 04:07:59 +0000
Subject: Re: [apparmor] [PATCH v4 6/20] lsm: Refactor return value of LSM
	hook getselfattr
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
> hook getselfattr to 0 or a negative error code.
> 
> Before:
> - Hook getselfattr returns number of attributes found on success
>   or a negative error code on failure.
> 
> After:
> - Hook getselfattr returns 0 on success or a negative error code
>   on failure. An output parameter @nattr is introduced to hold
>   the number of attributes found on success.
> 
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  include/linux/lsm_hook_defs.h |  2 +-
>  include/linux/security.h      |  5 +++--
>  security/apparmor/lsm.c       |  5 +++--
>  security/lsm_syscalls.c       |  6 +++++-
>  security/security.c           | 18 +++++++++++-------
>  security/selinux/hooks.c      | 13 +++++++++----
>  security/smack/smack_lsm.c    | 13 +++++++++----
>  7 files changed, 41 insertions(+), 21 deletions(-)

The getselfattr hook is different from the majority of the other LSM
hooks as getselfattr is used as part of lsm_get_self_attr(2) syscall and
not by other subsystems within the kernel.  Let's leave it as-is for now
as it is sufficiently special case that a deviation is okay.

--
paul-moore.com

