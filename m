Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2CAAD600
	for <lists+apparmor@lfdr.de>; Wed,  7 May 2025 08:26:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCYEd-0002jc-T4; Wed, 07 May 2025 06:26:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1uCYEc-0002ia-Fa
 for apparmor@lists.ubuntu.com; Wed, 07 May 2025 06:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8AFEF629E8
 for <apparmor@lists.ubuntu.com>; Wed,  7 May 2025 06:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C0AC4CEE9
 for <apparmor@lists.ubuntu.com>; Wed,  7 May 2025 06:19:27 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7caea4bc9e9so541866485a.1
 for <apparmor@lists.ubuntu.com>; Tue, 06 May 2025 23:19:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVVOYcNxGbQFFLQmlpbi2LALypHPu1RcV4WOK9s5M2Ue3+7LcahOsU/8AWaa5NsiDW7q5+POjLo9A==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxhYp41IQqxgxm2SCXDRn6OfbpImYQMT6ArrL842v5APJKTAjxy
 tmCykM3gUJTnJnFY36nCmij5VhhPCfVjgSXyu/VVxaZ2s0Q7HrO3zPLt7HbtPYRWUkmmrgSzZrQ
 gK84oQ1s6szafnaF1cwxFzRlpMVM=
X-Google-Smtp-Source: AGHT+IFOAexx6Cca2tgkZKWixKEUI1hkSCnfEfKpmLyEPObC5f61sKXL9VUmnwJAOUKoDUXRr+P53NwPuDNndo7P+II=
X-Received: by 2002:a05:620a:f0e:b0:7c7:a524:9fe9 with SMTP id
 af79cd13be357-7caf73b65e3mr302925385a.27.1746598764695; Tue, 06 May 2025
 23:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-3-maxime.belair@canonical.com>
In-Reply-To: <20250506143254.718647-3-maxime.belair@canonical.com>
From: Song Liu <song@kernel.org>
Date: Tue, 6 May 2025 23:19:12 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7q1hvOG7-uG2C8d_wWnOhEmvTmwnBcXZYVX-oJ8=5FJQ@mail.gmail.com>
X-Gm-Features: ATxdqUF43GzC1HJ94jSl3NM4Jlp-iA57c5ukAWNMojChQYmfJZV8PJSG5aYaZj4
Message-ID: <CAPhsuW7q1hvOG7-uG2C8d_wWnOhEmvTmwnBcXZYVX-oJ8=5FJQ@mail.gmail.com>
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: Re: [apparmor] [PATCH 2/3] lsm: introduce
	security_lsm_manage_policy hook
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

On Tue, May 6, 2025 at 7:40=E2=80=AFAM Maxime B=C3=A9lair
<maxime.belair@canonical.com> wrote:
>
> Define a new LSM hook security_lsm_manage_policy and wire it into the
> lsm_manage_policy() syscall so that LSMs can register a unified interface
> for policy management. This initial, minimal implementation only supports
> the LSM_POLICY_LOAD operation to limit changes.
>
> Signed-off-by: Maxime B=C3=A9lair <maxime.belair@canonical.com>
[...]
> diff --git a/security/security.c b/security/security.c
> index fb57e8fddd91..256104e338b1 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -5883,6 +5883,27 @@ int security_bdev_setintegrity(struct block_device=
 *bdev,
>  }
>  EXPORT_SYMBOL(security_bdev_setintegrity);
>
> +/**
> + * security_lsm_manage_policy() - Manage the policies of LSMs
> + * @lsm_id: id of the lsm to target
> + * @op: Operation to perform (one of the LSM_POLICY_XXX values)
> + * @buf:  userspace pointer to policy data
> + * @size: size of @buf
> + * @flags: lsm policy management flags
> + *
> + * Manage the policies of a LSM. This notably allows to update them even=
 when
> + * the lsmfs is unavailable is restricted. Currently, only LSM_POLICY_LO=
AD is
> + * supported.
> + *
> + * Return: Returns 0 on success, error on failure.
> + */
> +int security_lsm_manage_policy(u32 lsm_id, u32 op, void __user *buf,
> +                              size_t size, u32 flags)
> +{
> +       return call_int_hook(lsm_manage_policy, lsm_id, op, buf, size, fl=
ags);

If the LSM doesn't implement this hook, sys_lsm_manage_policy will return 0
for any inputs, right? This is gonna be so confusing for users.

Thanks,
Song

