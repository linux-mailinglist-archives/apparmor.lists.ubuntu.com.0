Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EF6AAF388
	for <lists+apparmor@lfdr.de>; Thu,  8 May 2025 08:16:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCuYX-0003Pr-7T; Thu, 08 May 2025 06:16:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1uCuYV-0003Pd-K7
 for apparmor@lists.ubuntu.com; Thu, 08 May 2025 06:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EDC9D629ED
 for <apparmor@lists.ubuntu.com>; Thu,  8 May 2025 06:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C33C4CEF1
 for <apparmor@lists.ubuntu.com>; Thu,  8 May 2025 06:07:07 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7c542ffec37so68706985a.2
 for <apparmor@lists.ubuntu.com>; Wed, 07 May 2025 23:07:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUqHfYxMMwuWKlduFZgD+Y3NQsDoZO45JGMGABIyvpKvDG2ZwKDxNt6azgaORdI6p5IyPDOdeI7Sw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzjKcywg2qbsMGAooV73cCW6rLJNne2O5tfOlLE9OJ+h4y+wJP3
 2lLK37UkX5GEiW3z32aXU5L74yzso/lMlP/LX56LmxO+DPYmjkFsMeGN2zqNcrPjWJMaB5gASIQ
 bUNxe7wUGyL+ZohCLuiCGDZ7oHHQ=
X-Google-Smtp-Source: AGHT+IH1F8h0h2SHfSdaI2nzHPlotKSsjVbT3JhBTuJALzuEgmgmOWxBeNcvV0wjfVxCVT4zGEENBcK78KOSn7zjlik=
X-Received: by 2002:ad4:5ca5:0:b0:6e8:9dfa:d932 with SMTP id
 6a1803df08f44-6f542a5994emr90456286d6.15.1746684426480; Wed, 07 May 2025
 23:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-2-maxime.belair@canonical.com>
 <CAPhsuW4qY9B3KdhqrUOZoNBWQmO_RDwbH46my314WxrFwxbwkQ@mail.gmail.com>
 <aa3c41f9-6b25-4871-a4be-e08430e59730@canonical.com>
In-Reply-To: <aa3c41f9-6b25-4871-a4be-e08430e59730@canonical.com>
From: Song Liu <song@kernel.org>
Date: Wed, 7 May 2025 23:06:55 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4FVMS7v8p_C-QzE8nBxCb6xDRhEecm_KHZ3KbKUjOXrQ@mail.gmail.com>
X-Gm-Features: ATxdqUFsvIM3m3XDmSjrxUKMHnRWZsOQlrBI5f05NCyl8yrg1_5EAXHKKaFLl_I
Message-ID: <CAPhsuW4FVMS7v8p_C-QzE8nBxCb6xDRhEecm_KHZ3KbKUjOXrQ@mail.gmail.com>
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: Re: [apparmor] [PATCH 1/3] Wire up the lsm_manage_policy syscall
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
Cc: paul@paul-moore.com, kees@kernel.org, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, penguin-kernel@i-love.sakura.ne.jp,
 apparmor@lists.ubuntu.com, jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, mic@digikod.net, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, May 7, 2025 at 8:37=E2=80=AFAM Maxime B=C3=A9lair
<maxime.belair@canonical.com> wrote:
[...]
> >
> > These two do not feel like real benefits:
> > - One syscall cannot fit all use cases well...
>
> This syscall is not intended to cover every case, nor to replace existing=
 kernel
> interfaces.
>
> Each LSM can decide which operations it wants to support (if any).=E2=80=
=AFFor example, when
> loading policies, an LSM may choose to allow only policies that further r=
estrict
> privileges.
>
> > - Not working in containers is often not an issue, but a feature.
>
> Indeed, using this syscall requires appropriate capabilities and will not=
 permit
> unprivileged containers to manage policies arbitrarily.
>
> With this syscall, capability checks remain the responsibility of each LS=
M.
>
> For instance, in the AppArmor patch, a profile can be loaded only if
> aa_policy_admin_capable()=E2=80=AFsucceeds (which requires=E2=80=AFCAP_MA=
C_ADMIN).=E2=80=AFMoreover, by design,
> policies can be loaded only in the current namespace.
>
> I see this syscall as a middle point between exposing the entire sysfs, c=
reating a large
> attack surface, and blocking everything.
>
> Landlock=E2=80=99s existing syscalls already improve security by allowing=
 processes to further
> restrict their ambient rights while adding only a modest attack surface.
>
> This syscall is a further step in that direction: it lets LSMs add restri=
ctive policies
> without requiring exposing every other interface.

I don't think a syscall makes the API more secure. If necessary, we can add
permission check to each pseudo file. The downside of the syscall, however,
is that all the permission checks are hard-coded in the kernel (except for
BPF LSM); while the sys admin can configure permissions of the pseudo
files in user space.

> Again, each module decides which operations to expose through this syscal=
l.=E2=80=AFIn many cases
> the operation will still require CAP_SYS_ADMIN or a similar capability, s=
o environments
> that choose this interface remain secure while gaining its advantages.
>
> >>   - Avoids overhead of other kernel interfaces for better efficiency
> >
> > .. and it is is probably less efficient, because everything need to
> > fit in the same API.
>
> As shown below, the syscall can significantly improve the performance of =
policy management.
> A more detailed benchmark is available in=E2=80=AF[1].
>
> The following table presents the time required to load an AppArmor profil=
e.
>
> For every cell, the first value is the total time taken by aa-load, and t=
he value in
> parentheses is the time spent to load the policy in the kernel only (tota=
l=E2=80=AF-=E2=80=AFdry=E2=80=91run).
>
> Results are in microseconds and are averaged over 10=E2=80=AF000 runs to =
reduce variance.
>
>
> | t (=C2=B5s)    | syscall     | pseudofs    | Speedup       |
> |-----------|-------------|-------------|---------------|
> | 1password | 4257 (1127) | 3333 (192)  | x1.28 (x5.86) |
> | Xorg      | 6099 (2961) | 5167 (2020) | x1.18 (x1.47) |
>

I am not sure the performance of loading security policies is on any
critical path.
The implementation calls the hook for each LSM, which is why I think the
syscall is not efficient.

Overall, I am still not convinced a syscall for all LSMs is needed. To
justify such
a syscall, I think we need to show that it is useful in multiple LSMs.
Also, if we
really want to have single set of APIs for all LSMs, we may also need
get_policy,
remove_policy, etc. This set as-is appears to be an incomplete design. The
implementation, with call_int_hook, is also problematic. It can easily
cause some
controversial behaviors.

Thanks,
Song

