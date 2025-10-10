Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA7DBD1F07
	for <lists+apparmor@lfdr.de>; Mon, 13 Oct 2025 10:09:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v8DcZ-0001Rc-67; Mon, 13 Oct 2025 08:09:31 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <stephen.smalley.work@gmail.com>)
 id 1v7DeH-0006WU-Pj
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 13:59:10 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-3322e63602eso2932554a91.0
 for <apparmor@lists.ubuntu.com>; Fri, 10 Oct 2025 06:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760104748; x=1760709548;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqDMxseq0YeepIl3kfgQklE6zaT80p7XvhxaOx8CEjY=;
 b=UVtmCKWsZbVUar11mx16NZczqA/6F8Ua4Qs1BCMzEYm4bYFtvSM5mvNsmovWDUhlxZ
 15m+4nbGFGhyKbIajweo86zTbyQK7E1HcAd+U9YaRcnIKlTkuZ9LlMszTfc9qagpGp6G
 AxFRauvoawvWk79l4L1N4b0YzgYGoF4Vn7F4Fdpts62RsQdMqYmqFBnjvaKBj+WEc6F2
 BqP3YKvj5ZqPkx6GUHDWWjJA1xxoX1Sv5rRzLVN5LO1ZeiYnDKfrVNe0qCRUdyx4E3ky
 ZYx9ICDqdcRu++91U8aWEnG7XdB8Qe7xmNJY0gEXYD1vd0BSNyImnrl24/FmX/GWkw1a
 0tCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTs7U/iTUreHiDriOY2U15jPD+jJqjTjpiRNZodNJpRAiShjsECW//YRlKkDNB6nzX6w3B+HoymQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Ywdbgt/WVZzw2g3N80ESkhJakJcs82W16yz8KAwrR0jZk/8L6jb
 FvoTI2z05R3Zy38uR9y2KVbTnohB8BPEVAz1wYgqe5Re9/g7lmh9HByuBcqcYbVRD2HI6PH6reZ
 jtxpi+lzlUvshM1qDwJM4PILxh3ZZnWE=
X-Gm-Gg: ASbGncsV3tw++I2XNEhajfU7ts6SKpAI4mFW/sTIDvK7HU3Ng1A1QbEMYRhR/PpJUR7
 sENVqLfqlH/rtF7FRtp8RqmOmrPEiUzfAR8LdnTEykUR3atQDv80dUyE/9+XAgwPrn86cMLtgvp
 SV1HVsowhjP590zH983ivqM59cA9rT5Y6jNI6yRwYQoktcUTPvyUwY64lGkHjXac4jQWlH+oZp2
 S3lAeexeuk2Bl0GE+a6WbVzaQ==
X-Google-Smtp-Source: AGHT+IEEO7CawPriEW0/0WOW4dpjQYsEyKshJGHn1pdmy3tv9STs6VYtKvGdq7Z2wdqMp1dddByK47girDVwZrKFyAQ=
X-Received: by 2002:a17:90b:1651:b0:339:dcc3:82ca with SMTP id
 98e67ed59e1d1-33b51148aabmr17168825a91.6.1760104747815; Fri, 10 Oct 2025
 06:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251010132610.12001-1-maxime.belair@canonical.com>
 <20251010132610.12001-5-maxime.belair@canonical.com>
In-Reply-To: <20251010132610.12001-5-maxime.belair@canonical.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Fri, 10 Oct 2025 09:58:56 -0400
X-Gm-Features: AS18NWACUq7J7s5W9SgZze2UmbQ2ViWNBvTFHTIJBUHBTUfzcbIhMnsX-w7kg_0
Message-ID: <CAEjxPJ6Xcwsic_zyLTPdHHaY9r7-ZTySzyELQ76aVZCFbh8FMQ@mail.gmail.com>
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.216.52;
 envelope-from=stephen.smalley.work@gmail.com; helo=mail-pj1-f52.google.com
X-Mailman-Approved-At: Mon, 13 Oct 2025 08:09:30 +0000
Subject: Re: [apparmor] [PATCH v6 4/5] SELinux: add support for
	lsm_config_system_policy
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
Cc: Ondrej Mosnacek <omosnace@redhat.com>, paul@paul-moore.com, song@kernel.org,
 kees@kernel.org, linux-api@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 rdunlap@infradead.org, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 mic@digikod.net, takedakn@nttdata.co.jp,
 SElinux list <selinux@vger.kernel.org>, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Oct 10, 2025 at 9:27=E2=80=AFAM Maxime B=C3=A9lair
<maxime.belair@canonical.com> wrote:
>
> Enable users to manage SELinux policies through the new hook
> lsm_config_system_policy. This feature is restricted to CAP_MAC_ADMIN.

(added selinux mailing list and Fedora/Red Hat SELinux kernel maintainer to=
 cc)

A couple of observations:
1. We do not currently require CAP_MAC_ADMIN for loading SELinux
policy, since it was only added later for Smack and SELinux implements
its own permission checks. When loading policy via selinuxfs, one
requires uid-0 or CAP_DAC_OVERRIDE to write to /sys/fs/selinux/load
plus the corresponding SELinux permissions, but this is just an
artifact of the filesystem-based interface. I'm not opposed to using
CAP_MAC_ADMIN for loading policy via the new system call but wanted to
note it as a difference.

2. The SELinux namespaces support [1], [2] is based on instantiating a
separate selinuxfs instance for each namespace; you load a policy for
a namespace by mounting a new selinuxfs instance after unsharing your
SELinux namespace and then write to its /sys/fs/selinux/load
interface, only affecting policy for the new namespace. Your interface
doesn't appear to support such an approach and IIUC will currently
always load the init SELinux namespace's policy rather than the
current process' SELinux namespace.

[1] https://github.com/stephensmalley/selinuxns
[2] https://lore.kernel.org/selinux/20250814132637.1659-1-stephen.smalley.w=
ork@gmail.com/

>
> Signed-off-by: Maxime B=C3=A9lair <maxime.belair@canonical.com>
> ---
>  security/selinux/hooks.c            | 27 +++++++++++++++++++++++++++
>  security/selinux/include/security.h |  7 +++++++
>  security/selinux/selinuxfs.c        | 16 ++++++++++++----
>  3 files changed, 46 insertions(+), 4 deletions(-)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index e7a7dcab81db..3d14d4e47937 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -7196,6 +7196,31 @@ static int selinux_uring_allowed(void)
>  }
>  #endif /* CONFIG_IO_URING */
>
> +/**
> + * selinux_lsm_config_system_policy - Manage a LSM policy
> + * @op: operation to perform. Currently, only LSM_POLICY_LOAD is support=
ed
> + * @buf: User-supplied buffer
> + * @size: size of @buf
> + * @flags: reserved for future use; must be zero
> + *
> + * Returns: number of written rules on success, negative value on error
> + */
> +static int selinux_lsm_config_system_policy(u32 op, void __user *buf,
> +                                           size_t size, u32 flags)
> +{
> +       loff_t pos =3D 0;
> +
> +       if (op !=3D LSM_POLICY_LOAD || flags)
> +               return -EOPNOTSUPP;
> +
> +       if (!selinux_null.dentry || !selinux_null.dentry->d_sb ||
> +           !selinux_null.dentry->d_sb->s_fs_info)
> +               return -ENODEV;
> +
> +       return __sel_write_load(selinux_null.dentry->d_sb->s_fs_info, buf=
, size,
> +                               &pos);
> +}
> +
>  static const struct lsm_id selinux_lsmid =3D {
>         .name =3D "selinux",
>         .id =3D LSM_ID_SELINUX,
> @@ -7499,6 +7524,8 @@ static struct security_hook_list selinux_hooks[] __=
ro_after_init =3D {
>  #ifdef CONFIG_PERF_EVENTS
>         LSM_HOOK_INIT(perf_event_alloc, selinux_perf_event_alloc),
>  #endif
> +       LSM_HOOK_INIT(lsm_config_system_policy, selinux_lsm_config_system=
_policy),
> +
>  };
>
>  static __init int selinux_init(void)
> diff --git a/security/selinux/include/security.h b/security/selinux/inclu=
de/security.h
> index e7827ed7be5f..7b779ea43cc3 100644
> --- a/security/selinux/include/security.h
> +++ b/security/selinux/include/security.h
> @@ -389,7 +389,14 @@ struct selinux_kernel_status {
>  extern void selinux_status_update_setenforce(bool enforcing);
>  extern void selinux_status_update_policyload(u32 seqno);
>  extern void selinux_complete_init(void);
> +
> +struct selinux_fs_info;
> +
>  extern struct path selinux_null;
> +extern ssize_t __sel_write_load(struct selinux_fs_info *fsi,
> +                               const char __user *buf, size_t count,
> +                               loff_t *ppos);
> +
>  extern void selnl_notify_setenforce(int val);
>  extern void selnl_notify_policyload(u32 seqno);
>  extern int selinux_nlmsg_lookup(u16 sclass, u16 nlmsg_type, u32 *perm);
> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index 47480eb2189b..1f7e611d8300 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -567,11 +567,11 @@ static int sel_make_policy_nodes(struct selinux_fs_=
info *fsi,
>         return ret;
>  }
>
> -static ssize_t sel_write_load(struct file *file, const char __user *buf,
> -                             size_t count, loff_t *ppos)
> +ssize_t __sel_write_load(struct selinux_fs_info *fsi,
> +                        const char __user *buf, size_t count,
> +                        loff_t *ppos)
>
>  {
> -       struct selinux_fs_info *fsi;
>         struct selinux_load_state load_state;
>         ssize_t length;
>         void *data =3D NULL;
> @@ -605,7 +605,6 @@ static ssize_t sel_write_load(struct file *file, cons=
t char __user *buf,
>                 pr_warn_ratelimited("SELinux: failed to load policy\n");
>                 goto out;
>         }
> -       fsi =3D file_inode(file)->i_sb->s_fs_info;
>         length =3D sel_make_policy_nodes(fsi, load_state.policy);
>         if (length) {
>                 pr_warn_ratelimited("SELinux: failed to initialize selinu=
xfs\n");
> @@ -626,6 +625,15 @@ static ssize_t sel_write_load(struct file *file, con=
st char __user *buf,
>         return length;
>  }
>
> +static ssize_t sel_write_load(struct file *file, const char __user *buf,
> +                             size_t count, loff_t *ppos)
> +{
> +       struct selinux_fs_info *fsi =3D file_inode(file)->i_sb->s_fs_info=
;
> +
> +       return __sel_write_load(fsi, buf, count, ppos);
> +}
> +
> +
>  static const struct file_operations sel_load_ops =3D {
>         .write          =3D sel_write_load,
>         .llseek         =3D generic_file_llseek,
> --
> 2.48.1
>

