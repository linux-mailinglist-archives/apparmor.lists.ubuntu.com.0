Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D28930090
	for <lists+apparmor@lfdr.de>; Fri, 12 Jul 2024 20:49:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sSLKM-00055u-1n; Fri, 12 Jul 2024 18:49:06 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sSIdR-0007Xr-Hj
 for apparmor@lists.ubuntu.com; Fri, 12 Jul 2024 15:56:37 +0000
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-64d408a5d01so21164597b3.1
 for <apparmor@lists.ubuntu.com>; Fri, 12 Jul 2024 08:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720799796; x=1721404596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w0+yKauGBfVgztiyzO4psOZ39jXUy61P0Z2otIutEDo=;
 b=kzcFzThExgw2PRei01oNlr1uBB9ZmjZ6K2ZPA16/6oaScnzcy2SrDDF6AHZ/CTeiVN
 ByGQwzrO8Ua/6abUvJgkfs9Ty6epZ+m5Fog/K4CBGzKpeyl+XRyljKrHyhqz5pE+iU5g
 cGHzVkvfmxCzf6TBwmFhWVbIStSG/EYpwiKsOR5A6ZvFLVWJx19bdh6WGbtQwlD3So/o
 eH4t5ASvSNxQu7Stgl1U5iPMQ6xQceMAvE6CX6aGCmlNQ5OZGnz6y8We3jj7xham0+Wy
 Xi1hYhNVGls98kZexBcxUlMQrSWB9uKQ7+mTs7Cx4W6NYxOsjoBiACYLX3YbBtjI0Wwx
 zp+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqdfpF8+Ewvx8YsEPxVMQ32B9JVZR/eGHFX0Zxiy70vxbDqDu/y9s0Yl+4N80uACiwMV23xSFUol5rE+yZgZRXMam8YoMzqW2N
X-Gm-Message-State: AOJu0YxKsQ/of1GnyRiJHUmeqaeRHIBwGEbvyzh1aOBEPK9NXhjtGESd
 1D1d0GU1Re7sHmTXKyeAqTC4EVlg/TLbyhfJCyBpOhcEVjEo2DpQbvbX0LDrtRvTg0kwa5DjeIK
 YF7Ho+CqVXqSG2i0fRxhWo5d8CRKZS0H1qpF5
X-Google-Smtp-Source: AGHT+IF+g3vVIQGlu+DNJrMzZR5GHCzdBLPdnG5032hms9DBcj/kbAYdQFAnbzbxP88gJHMhlwAUxx/RSDis8DM3exE=
X-Received: by 2002:a81:ae07:0:b0:62c:e6c0:e887 with SMTP id
 00721157ae682-658ee790cedmr131373017b3.9.1720799796245; Fri, 12 Jul 2024
 08:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
In-Reply-To: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 12 Jul 2024 11:56:25 -0400
Message-ID: <CAHC9VhSBg7qf81O+mC1EDSUhZ4xR57jfY4h0P6Vy1PO++JqMBw@mail.gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.176; envelope-from=paul@paul-moore.com;
 helo=mail-yw1-f176.google.com
X-Mailman-Approved-At: Fri, 12 Jul 2024 18:49:04 +0000
Subject: Re: [apparmor] [PATCH bpf-next v4 00/20] Add return value range
	check for BPF LSM
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
 Daniel Borkmann <daniel@iogearbox.net>, Edward Cree <ecree.xilinx@gmail.com>,
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

On Thu, Jul 11, 2024 at 7:13=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.com=
> wrote:
>
> From: Xu Kuohai <xukuohai@huawei.com>
>
> LSM BPF prog returning a positive number attached to the hook
> file_alloc_security makes kernel panic.

...

> Xu Kuohai (20):
>   lsm: Refactor return value of LSM hook vm_enough_memory
>   lsm: Refactor return value of LSM hook inode_need_killpriv
>   lsm: Refactor return value of LSM hook inode_getsecurity
>   lsm: Refactor return value of LSM hook inode_listsecurity
>   lsm: Refactor return value of LSM hook inode_copy_up_xattr
>   lsm: Refactor return value of LSM hook getselfattr
>   lsm: Refactor return value of LSM hook setprocattr
>   lsm: Refactor return value of LSM hook getprocattr
>   lsm: Refactor return value of LSM hook key_getsecurity
>   lsm: Refactor return value of LSM hook audit_rule_match
>   bpf, lsm: Add disabled BPF LSM hook list
>   bpf, lsm: Enable BPF LSM prog to read/write return value parameters
>   bpf, lsm: Add check for BPF LSM return value
>   bpf: Prevent tail call between progs attached to different hooks
>   bpf: Fix compare error in function retval_range_within
>   bpf: Add a special case for bitwise AND on range [-1, 0]
>   selftests/bpf: Avoid load failure for token_lsm.c
>   selftests/bpf: Add return value checks for failed tests
>   selftests/bpf: Add test for lsm tail call
>   selftests/bpf: Add verifier tests for bpf lsm

I'm not quite sure what happened, but it looks like patches 13/20
through 20/20 did not hit the mailing lists, see lore link below; did
you have any mail failures when sending the patchset?  Regardless, can
you sort this out and resend the patchset?

https://lore.kernel.org/all/20240711111908.3817636-1-xukuohai@huaweicloud.c=
om

--=20
paul-moore.com

