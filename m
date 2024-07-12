Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C324893008F
	for <lists+apparmor@lfdr.de>; Fri, 12 Jul 2024 20:49:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sSLKN-00056F-IP; Fri, 12 Jul 2024 18:49:07 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <alexei.starovoitov@gmail.com>)
 id 1sSKVk-0000vz-QI
 for apparmor@lists.ubuntu.com; Fri, 12 Jul 2024 17:56:48 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-70af3d9169bso2011147b3a.1
 for <apparmor@lists.ubuntu.com>; Fri, 12 Jul 2024 10:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720807007; x=1721411807;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hvJqMz2g+QWTR/26uvM7LO7+R0enQZRj5mYnnkzzRMo=;
 b=R5SNC8PcwKqoKjU16i4dFdLd7tRml5UiZASDklzocEJp8NVw2CHt+ZOK3anzIogtUA
 Q6mOalSDtD0GXOZC9zWhP+fSuHJA41/mKF3VOQxrqOSdbaW0bh2qVEboiLVfvqZEdzlD
 h8XalV2RwxlUmQY+ImIYJWulB4LN4GaPor5Zi6wkNn5cxbPwBQXKtXJT9Bw8PF+PXsSC
 S8XIB6/mm7WQrurSiQEUnNhLDTWNe5W+LW4HCvGeVYYFQVMyhZvRErnb3mtqiYNSyYhf
 VyLPxlGj44aFQEMkZYM6kAq9V49TuIv50u7mVHjJlZhuOCoTtsVQdbIo7sod1NFF8G7E
 lxtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4KSblo8dg9JISa+hJUgb60gI26R2uicKXa5zeKR7fDkjqhTIu9kWzYuji6tgF6hytXFmTQBLJCXSgCqGJCChLahSUqvv/E18Y
X-Gm-Message-State: AOJu0YzAnWLeE8hyWWrGCYYBfI/M/EYQfgV4w8AOviqpXmK3DMIyI5Hl
 IE5rM3lnX5ErcFfZRCDms4Lrp53juLoGU0UVIysQ6a6pPGw6jU5s
X-Google-Smtp-Source: AGHT+IEQhOEcyJo9nymze7EJcWUmb0pa0RPK5Sh5riMCUcRm7lnBoF6POikeGeyiWKlGRHtmtiu3qw==
X-Received: by 2002:a05:6a21:6704:b0:1c0:f080:ed5b with SMTP id
 adf61e73a8af0-1c2984ce612mr12926893637.54.1720807006607; 
 Fri, 12 Jul 2024 10:56:46 -0700 (PDT)
Received: from MacBook-Pro-49.local ([2620:10d:c090:500::7:44ce])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ab8041sm69662725ad.135.2024.07.12.10.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 10:56:46 -0700 (PDT)
Date: Fri, 12 Jul 2024 10:56:41 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Message-ID: <qjrf5c6f24b6ef5tpvpz75uxp6ro6mhos34ovssinv4yxjwyz3@nvs75o5sywgx>
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
 <20240711111908.3817636-12-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711111908.3817636-12-xukuohai@huaweicloud.com>
Received-SPF: pass client-ip=209.85.210.175;
 envelope-from=alexei.starovoitov@gmail.com; helo=mail-pf1-f175.google.com
X-Mailman-Approved-At: Fri, 12 Jul 2024 18:49:05 +0000
Subject: Re: [apparmor] [PATCH bpf-next v4 11/20] bpf,
 lsm: Add disabled BPF LSM hook list
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
Cc: Matt Bobrowski <mattbobrowski@google.com>, linux-kselftest@vger.kernel.org,
 Shung-Hsi Yu <shung-hsi.yu@suse.com>, Alexei Starovoitov <ast@kernel.org>,
 James Morris <jmorris@namei.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Anna Schumaker <anna@kernel.org>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Edward Cree <ecree.xilinx@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E . Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 KP Singh <kpsingh@kernel.org>, Brendan Jackman <jackmanb@chromium.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 linux-integrity@vger.kernel.org, Hao Luo <haoluo@google.com>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Eduard Zingerman <eddyz87@gmail.com>,
 linux-security-module@vger.kernel.org,
 Khadija Kamran <kamrankhadijadj@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Jul 11, 2024 at 07:18:59PM +0800, Xu Kuohai wrote:
> From: Xu Kuohai <xukuohai@huawei.com>
> 
> Add a disabled hooks list for BPF LSM. progs being attached to the
> listed hooks will be rejected by the verifier.
> 
> Suggested-by: KP Singh <kpsingh@kernel.org>
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>

Xu,

The patches 11 and higher are mostly independent from lsm refactoring.
Please send them as a separate patchset for bpf-next.
While lsm cleanups are being reviewed this lsm_disabled list can be
a bit larger temporarily.

