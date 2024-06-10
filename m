Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC1A901993
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 05:47:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGW0C-0005Sm-I6; Mon, 10 Jun 2024 03:47:24 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sGSkX-000848-Nn
 for apparmor@lists.ubuntu.com; Mon, 10 Jun 2024 00:19:01 +0000
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dfab4375f94so4109521276.1
 for <apparmor@lists.ubuntu.com>; Sun, 09 Jun 2024 17:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717978740; x=1718583540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DaBC4lccKq90V2Qdlha3eJDRzM1Bcauqmp5mASHkKAs=;
 b=QIQwDpbhUqYFXM6C4im3j/oTmnLpzvdFbQuoUzZ7eqtA4/XPpEUWbcD/TEySQQ/W2N
 KY9K4/xRRDQErJ3t7nKcdp/Re1YppO1owaanc31uiwFurZi6XSZeCWpG4N+IBZ23NBDz
 IxNPf5OOhhBfdw01xXqU2k2aVgr1i8/fL5QVyR7cXNFWSuNU8kUnXK0Bo4fovA9rkZ/W
 LC/rXCCs8Pi/n0JaXmNcFq+aBGUdjaa63oSFXF6NRB4Bg+A+aLodkmk6vMk40yGv2F1C
 AAl95ptiPAVv3E9qbHSZlfpNSCTM8NV3sc0VK4FnoHdCc6J6+yLgE0uZORk2mDoObryD
 YVvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo4PGsz4O6QjERss82OiqgWvIn3125EgyKKCQSlCmzQxbNhSbi+kA73CLr9y8O1nF8A3hMia0i7+BkpuV5VOPEHeaj9U3xQJiQ
X-Gm-Message-State: AOJu0YxSWB3JOJ1e0u9soZUv+8lBqbCpQKq3mrw+Kiaf0pqlaNsnfrK4
 wLCiO4WUM2KHycquU5VCncnjI6a42xlLvdQVMx02gYG9yCzZ3vl3EGE/DJ6gARKgcpEcetGCphe
 8E1TZETUqJhooRT5j2sorh8xzHKncoTpqkK3i
X-Google-Smtp-Source: AGHT+IGUSJ9gCJQ/d525KZWGwnLKi0KTucuS2fT52NdM142pz4Cm/kHolpWE6kV3MsEu37U2P/YkyNLgVNYRzBxA+78=
X-Received: by 2002:a5b:2ce:0:b0:dfb:308f:911 with SMTP id
 3f1490d57ef6-dfb308f0b87mr1143735276.60.1717978740109; 
 Sun, 09 Jun 2024 17:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240609104355.442002-5-jcalmels@3xx0.net>
In-Reply-To: <20240609104355.442002-5-jcalmels@3xx0.net>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 9 Jun 2024 20:18:48 -0400
Message-ID: <CAHC9VhT5XWbhoY2Nw5jQz4GxpDriUdHw=1YsQ4xLVUtSnFxciA@mail.gmail.com>
To: Jonathan Calmels <jcalmels@3xx0.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.182; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f182.google.com
X-Mailman-Approved-At: Mon, 10 Jun 2024 03:47:22 +0000
Subject: Re: [apparmor] [PATCH v2 4/4] bpf,
	lsm: Allow editing capabilities in BPF-LSM hooks
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
 Joel Granados <j.granados@samsung.com>, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 David Howells <dhowells@redhat.com>, Song Liu <song@kernel.org>,
 keyrings@vger.kernel.org, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-security-module@vger.kernel.org, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 John Fastabend <john.fastabend@gmail.com>, James Morris <jmorris@namei.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 KP Singh <kpsingh@kernel.org>, containers@lists.linux.dev,
 Hao Luo <haoluo@google.com>, brauner@kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 ebiederm@xmission.com, Jiri Olsa <jolsa@kernel.org>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, Jun 9, 2024 at 6:40=E2=80=AFAM Jonathan Calmels <jcalmels@3xx0.net>=
 wrote:
>
> This patch allows modifying the various capabilities of the struct cred
> in BPF-LSM hooks. More specifically, the userns_create hook called
> prior to creating a new user namespace.
>
> With the introduction of userns capabilities, this effectively provides
> a simple way for LSMs to control the capabilities granted to a user
> namespace and all its descendants.
>
> Update the selftests accordingly by dropping CAP_SYS_ADMIN in
> namespaces and checking the resulting task's bounding set.
>
> Signed-off-by: Jonathan Calmels <jcalmels@3xx0.net>
> ---
>  include/linux/lsm_hook_defs.h                 |  2 +-
>  include/linux/security.h                      |  4 +-
>  kernel/bpf/bpf_lsm.c                          | 55 +++++++++++++++++++
>  security/apparmor/lsm.c                       |  2 +-
>  security/security.c                           |  6 +-
>  security/selinux/hooks.c                      |  2 +-
>  .../selftests/bpf/prog_tests/deny_namespace.c | 12 ++--
>  .../selftests/bpf/progs/test_deny_namespace.c |  7 ++-
>  8 files changed, 76 insertions(+), 14 deletions(-)

I'm not sure we want to go down the path of a LSM modifying the POSIX
capabilities of a task, other than the capabilities/commoncap LSM.  It
sets a bad precedent and could further complicate issues around LSM
ordering.

--
paul-moore.com

