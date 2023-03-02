Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4515E6A8D30
	for <lists+apparmor@lfdr.de>; Fri,  3 Mar 2023 00:44:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXsbI-0002xJ-M2; Thu, 02 Mar 2023 23:44:40 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jeffxu@google.com>) id 1pXs8A-0008W9-Id
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 23:14:34 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so1035998pjb.0
 for <apparmor@lists.ubuntu.com>; Thu, 02 Mar 2023 15:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677798873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dK5xBsNL80qIVhQ78+b+C534EV7ZA+MEtH4IecrU8fs=;
 b=dQa60YkNB2aHmO2eQcUKKkWMpQNb0V1GmMgzCtjajumKPoUa34DT1KW4VyAmnDllnW
 tBCca31eWsY8i/Th0ibNmqeeF5yKTzOum5xPC8aoXRqxuyQgj9C/JlnCifC4KCtAwKb8
 v4pqyQ4ZiU+89CoZ5Y65rTyJozDPpo4HdJgXVwtmjxF22wLTfQyCouIvPQxV5uYQuCrw
 P/jszesABAwdcZOuQmfKH1fSIxYPeLX27XyemZD3D40bp1QyeRTI9GkjDnwy80Yz6mZP
 Y/v9wqkSOnnwI/cKXAGsP8HdbUugB3KtD44ZKRukUPs4uhA9J+HxV/G+qQp6JCvY/BCl
 suAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677798873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dK5xBsNL80qIVhQ78+b+C534EV7ZA+MEtH4IecrU8fs=;
 b=44TKX2Z0In0YfPslvSiZZF+vDfcy3AjTh3L2IBzUTrDB0bC1CsyxXooguFgUznElpo
 9rOBzS159NRKuOD289jD6xzkNFv7ZI6W+c0NtcCsbl+T1j41xkbnZ8YWmy812CSacX6T
 lz36GjNnBvLf67+6Uom5h+CyDXdoSc8uH90B5hJwidY17ByH+6q4NsjG4Qc9XIXI+A+N
 6VHb3uI28xuthYVjqkzMX4Ln60qltsTf+IvJPnHxFLX4V59tNpXlfU6PvRwlfiuvA4UB
 qf65DZ5a1e9FSUDepJJLgMeTPTXfDaQzYLNe2NIjDNqIcp6EO6RN8XL+EEdC+NkzHl1Z
 4A8Q==
X-Gm-Message-State: AO0yUKXuvuPhyimVMCToJBgnRYib8QTpRyyg9WaH5BHjQgAKfyNwXbB+
 AjyCRuAQldkGKblF4cShCWQX80iKtomVxjCzPwxzLw==
X-Google-Smtp-Source: AK7set/wy4RYTpF9DE9+esAO3swTwx9AMlMSD7Y2MF1LhQ+HmQO3b//lY81QPmALZdw979D/M11S681c0YXmtKI/bVE=
X-Received: by 2002:a17:903:2591:b0:19a:8bc7:d814 with SMTP id
 jb17-20020a170903259100b0019a8bc7d814mr4441125plb.13.1677798872570; Thu, 02
 Mar 2023 15:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-9-mcgrof@kernel.org>
In-Reply-To: <20230302202826.776286-9-mcgrof@kernel.org>
From: Jeff Xu <jeffxu@google.com>
Date: Thu, 2 Mar 2023 15:13:54 -0800
Message-ID: <CALmYWFucv6-9yfS=gamwSsqjgxSKZS0nvVjj_QfBmsLmQD5XOQ@mail.gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 02 Mar 2023 23:44:40 +0000
Subject: Re: [apparmor] [PATCH 08/11] kernel: pid_namespace: simplify
	sysctls with register_sysctl()
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
Cc: j.granados@samsung.com, linux-kernel@vger.kernel.org, guoren@kernel.org,
 linux-csky@vger.kernel.org, dverkamp@chromium.org, baihaowen@meizu.com,
 paul@paul-moore.com, jmorris@namei.org, willy@infradead.org,
 ebiggers@kernel.org, zhangpeng362@huawei.com, yzaikin@google.com,
 serge@hallyn.com, keescook@chromium.org, paulmck@kernel.org,
 frederic@kernel.org, apparmor@lists.ubuntu.com, wad@chromium.org,
 nixiaoming@huawei.com, tytso@mit.edu, sujiaxun@uniontech.com,
 tangmeng@uniontech.com, patches@lists.linux.dev, luto@amacapital.net,
 linux-security-module@vger.kernel.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 2, 2023 at 12:28=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> register_sysctl_paths() is only required if your child (directories)
> have entries and pid_namespace does not. So use register_sysctl_init()
> instead where we don't care about the return value and use
> register_sysctl() where we do.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  kernel/pid_namespace.c | 3 +--
>  kernel/pid_sysctl.h    | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
> index 46e0d5a3f91f..b43eee07b00c 100644
> --- a/kernel/pid_namespace.c
> +++ b/kernel/pid_namespace.c
> @@ -314,7 +314,6 @@ static struct ctl_table pid_ns_ctl_table[] =3D {
>         },
>         { }
>  };
> -static struct ctl_path kern_path[] =3D { { .procname =3D "kernel", }, { =
} };
>  #endif /* CONFIG_CHECKPOINT_RESTORE */
>
>  int reboot_pid_ns(struct pid_namespace *pid_ns, int cmd)
> @@ -473,7 +472,7 @@ static __init int pid_namespaces_init(void)
>         pid_ns_cachep =3D KMEM_CACHE(pid_namespace, SLAB_PANIC | SLAB_ACC=
OUNT);
>
>  #ifdef CONFIG_CHECKPOINT_RESTORE
> -       register_sysctl_paths(kern_path, pid_ns_ctl_table);
> +       register_sysctl_init("kernel", pid_ns_ctl_table);
>  #endif
>
>         register_pid_ns_sysctl_table_vm();
> diff --git a/kernel/pid_sysctl.h b/kernel/pid_sysctl.h
> index e22d072e1e24..d67a4d45bb42 100644
> --- a/kernel/pid_sysctl.h
> +++ b/kernel/pid_sysctl.h
> @@ -46,10 +46,9 @@ static struct ctl_table pid_ns_ctl_table_vm[] =3D {
>         },
>         { }
>  };
> -static struct ctl_path vm_path[] =3D { { .procname =3D "vm", }, { } };
>  static inline void register_pid_ns_sysctl_table_vm(void)
>  {
> -       register_sysctl_paths(vm_path, pid_ns_ctl_table_vm);
> +       register_sysctl("vm", pid_ns_ctl_table_vm);
>  }
>  #else
>  static inline void initialize_memfd_noexec_scope(struct pid_namespace *n=
s) {}
> --
> 2.39.1
>
Acked-by: Jeff Xu <jeffxu@google.com>

