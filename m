Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FCDBCE337
	for <lists+apparmor@lfdr.de>; Fri, 10 Oct 2025 20:14:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7Hcw-0002e0-7g; Fri, 10 Oct 2025 18:14:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1v7Hcu-0002dl-TH
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 18:14:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1FB596270B
 for <apparmor@lists.ubuntu.com>; Fri, 10 Oct 2025 18:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE6EC116D0
 for <apparmor@lists.ubuntu.com>; Fri, 10 Oct 2025 18:06:49 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-79390b83c7dso20675236d6.1
 for <apparmor@lists.ubuntu.com>; Fri, 10 Oct 2025 11:06:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUY0GmiswPwMAOnb4+bU6ZZHg5Q23ijV4TJ5kTTY3guRvjSCflYYqP/kGN0Suvzmv/nbDgDCJeWPw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzxwKwmvXuuDEkQkeRURyZ0pnDQ2u4hOTbBJYPbAPClKTbwzhbO
 CkBBSLKU8xurXOPPgMjuhAFX1eMaA6MdX4guZdtsjphUZP80uRIZe8Ct/sXT69JdmXzizLvAzZU
 memeqLYOTrUopTX55HY+UJvXO8fllW0I=
X-Google-Smtp-Source: AGHT+IHRUJUAeJ5Je+YkDxQC/r6OXXbCSgJvVm1kGkEkaJIEhWHQvapqgQY+O5ZOx/oTWMHOfXFhHohJ7guwKL4YvOI=
X-Received: by 2002:a05:6214:19cc:b0:795:67ac:ca5d with SMTP id
 6a1803df08f44-87b2109283cmr190852096d6.30.1760119607787; Fri, 10 Oct 2025
 11:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251010132610.12001-1-maxime.belair@canonical.com>
 <20251010132610.12001-2-maxime.belair@canonical.com>
In-Reply-To: <20251010132610.12001-2-maxime.belair@canonical.com>
From: Song Liu <song@kernel.org>
Date: Fri, 10 Oct 2025 11:06:36 -0700
X-Gmail-Original-Message-ID: <CAHzjS_uBq8xGCSmHC_kBWi0j8DCdwsy4XtfkH2iH6NygCcChNw@mail.gmail.com>
X-Gm-Features: AS18NWD0sroF_9UF1VNMCiu_x8h4vyhFWvp2MLYPnP6wYTvtieiio2L0R61pPKg
Message-ID: <CAHzjS_uBq8xGCSmHC_kBWi0j8DCdwsy4XtfkH2iH6NygCcChNw@mail.gmail.com>
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: Re: [apparmor] [PATCH v6 1/5] Wire up lsm_config_self_policy and
 lsm_config_system_policy syscalls
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
Cc: paul@paul-moore.com, song@kernel.org, kees@kernel.org,
 linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, rdunlap@infradead.org, mic@digikod.net,
 takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Oct 10, 2025 at 6:27=E2=80=AFAM Maxime B=C3=A9lair
<maxime.belair@canonical.com> wrote:
[...]
> --- a/security/lsm_syscalls.c
> +++ b/security/lsm_syscalls.c
> @@ -118,3 +118,15 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids,=
 u32 __user *, size,
>
>         return lsm_active_cnt;
>  }
> +
> +SYSCALL_DEFINE6(lsm_config_self_policy, u32, lsm_id, u32, op, void __use=
r *,
> +               buf, u32 __user, size, u32, common_flags, u32, flags)
> +{
> +       return 0;
> +}
> +
> +SYSCALL_DEFINE6(lsm_config_system_policy, u32, lsm_id, u32, op, void __u=
ser *,
> +               buf, u32 __user, size, u32, common_flags, u32, flags)
> +{
> +       return 0;
> +}

These two APIs look the same. Why not just keep one API and use
one bit in the flag to differentiate "self" vs. "system"?

Thanks,
Song

