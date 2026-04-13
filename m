Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPtvAQso3WmVaQkAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 13 Apr 2026 19:29:47 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C153F17AA
	for <lists+apparmor@lfdr.de>; Mon, 13 Apr 2026 19:29:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wCL6P-00022b-7P; Mon, 13 Apr 2026 17:29:37 +0000
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <stephen.smalley.work@gmail.com>)
 id 1wCKrm-0005el-FR
 for apparmor@lists.ubuntu.com; Mon, 13 Apr 2026 17:14:30 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-8296dabef74so4724509b3a.1
 for <apparmor@lists.ubuntu.com>; Mon, 13 Apr 2026 10:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776100468; cv=none;
 d=google.com; s=arc-20240605;
 b=cJI6mtnOAGxEoSTvbiL/BfLQGUdUwMCcXS8z5sw7nHVNB7skVx+pa/eOQ/f2C5rcYP
 /cOf3XnuaLFlucyxeN/dCDp93XhjJrjhvs86x3Y4Yp2FKX0dorT39gt90V8NuhzIe7JI
 AeaV2yjIXOxXmdWDGZGXjPRFZqOfwSpLLX1ZGpaOuyZncFlsCafFKor284c3tzcdZtz7
 iCwZGejLdAzkw5XGlITeqt4HcXbGbJYGkSbTQxmnLkr2lPssoNhXEfW+VEL2XkI4wY+K
 ZNk0Md8zlSBPSpOxqeOdCUY3cP1hNT21CNvJcvIW/uXxqohNBAFvOxthGbo3kBrw87FN
 t9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QygrDBL2RtJkB6vENTKE5mRPBFDruU3+BPQuEukfRvo=;
 fh=ywtCGhLU1pKUJ8V06KAbLU7WE2N2Z93/LgpwhCrJ9ag=;
 b=JZruZtVLha0Blm/C3jgkbLJztki3Mx/Ub27u4foDRyDnDp2YeQkmcPn3V9WtwUTj2j
 IjPzUDisFc5yPNBNkAlr+b505GPwfl8IzP/1PLLsWB+H4xK30YVvF51LpxYvbbzUMvHG
 wZkU2+4Teqb4X5h7umK1GoggMcxYqVDrG3AX6fxh9AW2mhHDBez01P/4XYizVghjMdps
 O77TWsE14C1ozk5j0jPCFo2QtiAQ8saXaJof3raVgcaqQPzo9P7Az5b2BcT4nxJ5iX1Y
 dbFVX46ngwHnA90Nz+dFPfNTQyIE/LJDkAGmEcinxBnyUFhQ8CIAGFSPFkJNxW5tEs/Y
 FIxA==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776100468; x=1776705268; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QygrDBL2RtJkB6vENTKE5mRPBFDruU3+BPQuEukfRvo=;
 b=G+zbzRJ6E67ayyq9s19bviPY2d+BVhTuqbm+zb5YdI/uVm7YkRuV8/QnQD5GBBmkrt
 lAmvGUt1Kgp7Cl8mfIjQH+tmNrgtxX9wcbihmamGUZhFfS5gG8Gn6HRtd/i3ExzrrRvL
 sNHT6/XMTXXb05mzklj3bhz2iiCdTxH4WJc2ThzqDjsObChhTS9w1uTO4UBiy1xhg9WU
 cDK66eyligO/wbupYABRt0GnVUh2CWchwnaLcFQpFPtJcpc2H6Dj5dmEJNuTeiMENWcY
 GLecpAQlxRh//BIFlEJ98zRJ4FtRU9RlX015NqcJl8oblhZF6NZ6aBeHsbGHziy4rC70
 Uzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776100468; x=1776705268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QygrDBL2RtJkB6vENTKE5mRPBFDruU3+BPQuEukfRvo=;
 b=dE+6gQG+x4iSwozIIjmyrg/N93aEDQ4erZHY6RGeyQd+xx4lWD5icJ/s274eJXFScr
 MDBbNWNFe2uuDmGawKea3GEzEB5d17xTQYgEGdQckeUdd/tgtry1rOl6PX8+zlCGKOlI
 Jt5pfktkT5+A8aZieZs0I9/4X+H0iJbsoZ14TmC9q+3zrF0zANzOSM3/HzdzsJQ5yhmd
 5nQ5NqxKIywFEWVQkhsw8er0XCRo/LaHCs4UfMgwjjdVc12J+sm7nYM0LjbwP3L58FBj
 ECwA8MmsmmnE4Kka+EKZzgp8CkYqrKQZw33lQj1y3GB7KOkvvR3ApaSjGlKE2NJVm4bu
 Z5Kw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/lVm+MS+5ZoLucmALddRq6SIfKbP7UsTmENcS360avpg3Gyno0tOequm6F9Su/aLVDsHJjTgI7HA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwTlB+BeLnj5GSd2GFXgOQEX47dcdN8vhEsGMe5UkndMELxG6Z3
 J+8BdOPcYdcYnXo6vYBIum4vp3LqaT5d5AjQMC3Cyuf93kHpGhtY5kBS+3N7+bI5u1fMBbEGmn1
 jgtn3A4ZEtMLx1BHb0MNTUEWZ+7uwz30=
X-Gm-Gg: AeBDiethFi3qx+AunjDHHO9CZvxeYlJ4n5mk9pQN2zUAIwtOoeNqLGcZqlepYdRO4mr
 uqQM76XLPBzbvFbsC7NWc+x09Ja7nTT85CE+8VyA54JzEnBVqxU2OGIlv5ZB04C7R85H4BukZLh
 8eA3RK6NrVXpLtEPb47XKwhTfM812LjWHfoS8c85JPxwOaIgtAurSfKWyrZKLGRkYxwHaqHsD9A
 RzxBH1yCNOuALhoF3lK6lju8YiXGZlxfKxfincFE91m1oCF6GYgCuet1HTixnSPqc4tmVCFjLb/
 xNUNR+g=
X-Received: by 2002:a05:6a00:1ad1:b0:823:d58:c4ab with SMTP id
 d2e1a72fcca58-82f0c1d9e56mr14680702b3a.2.1776100468322; Mon, 13 Apr 2026
 10:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-2-song@kernel.org>
In-Reply-To: <20260318184400.3502908-2-song@kernel.org>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 13 Apr 2026 13:14:17 -0400
X-Gm-Features: AQROBzBriwFuNxM2IXwsxZCb4zVhy8FAovjmyaSwr6r7rMOyTsP9GenvDd6CfXg
Message-ID: <CAEjxPJ5UU9riMZt57bODXHpxPLn2RKGJ02r7HWvdD979a-2ycA@mail.gmail.com>
To: Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.178;
 envelope-from=stephen.smalley.work@gmail.com; helo=mail-pf1-f178.google.com
X-Mailman-Approved-At: Mon, 13 Apr 2026 17:29:34 +0000
Subject: Re: [apparmor] [PATCH 1/7] lsm: Add granular mount hooks to replace
	security_sb_mount
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
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz, paul@paul-moore.com,
 selinux@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 kernel-team@meta.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 omosnace@redhat.com, mic@digikod.net, linux-security-module@vger.kernel.org,
 viro@zeniv.linux.org.uk, gnoack@google.com, linux-fsdevel@vger.kernel.org,
 takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.19 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:penguin-kernel@i-love.sakura.ne.jp,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[stephensmalleywork@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[stephensmalleywork@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.302];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: E1C153F17AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 2:44=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> Add six new LSM hooks for mount operations:
>
> - mount_bind(from, to, recurse): bind mount with pre-resolved
>   struct path for source and destination.
> - mount_new(fc, mp, mnt_flags, flags, data): new mount, called after
>   mount options are parsed. The flags and data parameters carry the
>   original mount(2) flags and data for LSMs that need them (AppArmor,
>   Tomoyo).
> - mount_remount(fc, mp, mnt_flags, flags, data): filesystem remount,
>   called after mount options are parsed into the fs_context.
> - mount_reconfigure(mp, mnt_flags, flags): mount flag reconfiguration
>   (MS_REMOUNT|MS_BIND path).
> - mount_move(from, to): move mount with pre-resolved paths.
> - mount_change_type(mp, ms_flags): propagation type changes.
>
> These replace the monolithic security_sb_mount() which conflates
> multiple distinct operations into a single hook, and suffers from
> TOCTOU issues where LSMs re-resolve string-based dev_name via
> kern_path().
>
> The mount_move hook is added alongside the existing move_mount hook.
> During the transition, LSMs register for both hooks. The move_mount
> hook will be removed once all LSMs have been converted.
>
> Some LSMs, such as apparmor and tomoyo, audit the original input passed
> in the mount syscall. To keep the same behavior, argument data and flags
> are passed in do_* functions. These can be removed if these LSMs no
> longer need these information.
>
> All new hooks are registered as sleepable BPF LSM hooks.
>
> Code generated with the assistance of Claude, reviewed by human.
>
> Signed-off-by: Song Liu <song@kernel.org>

Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com # for selinux on=
ly

> ---
>  fs/namespace.c                |  35 ++++++++++--
>  include/linux/lsm_hook_defs.h |  12 ++++
>  include/linux/security.h      |  50 +++++++++++++++++
>  kernel/bpf/bpf_lsm.c          |   7 +++
>  security/security.c           | 101 ++++++++++++++++++++++++++++++++++
>  5 files changed, 199 insertions(+), 6 deletions(-)
>
> diff --git a/fs/namespace.c b/fs/namespace.c
> index 854f4fc66469..de33070e514a 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -2875,6 +2875,10 @@ static int do_change_type(const struct path *path,=
 int ms_flags)
>         if (!type)
>                 return -EINVAL;
>
> +       err =3D security_mount_change_type(path, ms_flags);
> +       if (err)
> +               return err;
> +
>         guard(namespace_excl)();
>
>         err =3D may_change_propagation(mnt);
> @@ -3007,6 +3011,10 @@ static int do_loopback(const struct path *path, co=
nst char *old_name,
>         if (err)
>                 return err;
>
> +       err =3D security_mount_bind(&old_path, path, recurse);
> +       if (err)
> +               return err;
> +
>         if (mnt_ns_loop(old_path.dentry))
>                 return -EINVAL;
>
> @@ -3319,7 +3327,8 @@ static void mnt_warn_timestamp_expiry(const struct =
path *mountpoint,
>   * superblock it refers to.  This is triggered by specifying MS_REMOUNT|=
MS_BIND
>   * to mount(2).
>   */
> -static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_=
flags)
> +static int do_reconfigure_mnt(const struct path *path, unsigned int mnt_=
flags,
> +                             unsigned long flags)
>  {
>         struct super_block *sb =3D path->mnt->mnt_sb;
>         struct mount *mnt =3D real_mount(path->mnt);
> @@ -3334,6 +3343,10 @@ static int do_reconfigure_mnt(const struct path *p=
ath, unsigned int mnt_flags)
>         if (!can_change_locked_flags(mnt, mnt_flags))
>                 return -EPERM;
>
> +       ret =3D security_mount_reconfigure(path, mnt_flags, flags);
> +       if (ret)
> +               return ret;
> +
>         /*
>          * We're only checking whether the superblock is read-only not
>          * changing it, so only take down_read(&sb->s_umount).
> @@ -3357,7 +3370,7 @@ static int do_reconfigure_mnt(const struct path *pa=
th, unsigned int mnt_flags)
>   * on it - tough luck.
>   */
>  static int do_remount(const struct path *path, int sb_flags,
> -                     int mnt_flags, void *data)
> +                     int mnt_flags, void *data, unsigned long flags)
>  {
>         int err;
>         struct super_block *sb =3D path->mnt->mnt_sb;
> @@ -3384,6 +3397,9 @@ static int do_remount(const struct path *path, int =
sb_flags,
>         fc->oldapi =3D true;
>
>         err =3D parse_monolithic_mount_data(fc, data);
> +       if (!err)
> +               err =3D security_mount_remount(fc, path, mnt_flags, flags=
,
> +                                           data);
>         if (!err) {
>                 down_write(&sb->s_umount);
>                 err =3D -EPERM;
> @@ -3713,6 +3729,10 @@ static int do_move_mount_old(const struct path *pa=
th, const char *old_name)
>         if (err)
>                 return err;
>
> +       err =3D security_mount_move(&old_path, path);
> +       if (err)
> +               return err;
> +
>         return do_move_mount(&old_path, path, 0);
>  }
>
> @@ -3791,7 +3811,7 @@ static int do_new_mount_fc(struct fs_context *fc, c=
onst struct path *mountpoint,
>   */
>  static int do_new_mount(const struct path *path, const char *fstype,
>                         int sb_flags, int mnt_flags,
> -                       const char *name, void *data)
> +                       const char *name, void *data, unsigned long flags=
)
>  {
>         struct file_system_type *type;
>         struct fs_context *fc;
> @@ -3835,6 +3855,9 @@ static int do_new_mount(const struct path *path, co=
nst char *fstype,
>                 err =3D parse_monolithic_mount_data(fc, data);
>         if (!err && !mount_capable(fc))
>                 err =3D -EPERM;
> +
> +       if (!err)
> +               err =3D security_mount_new(fc, path, mnt_flags, flags, da=
ta);
>         if (!err)
>                 err =3D do_new_mount_fc(fc, path, mnt_flags);
>
> @@ -4146,9 +4169,9 @@ int path_mount(const char *dev_name, const struct p=
ath *path,
>                             SB_I_VERSION);
>
>         if ((flags & (MS_REMOUNT | MS_BIND)) =3D=3D (MS_REMOUNT | MS_BIND=
))
> -               return do_reconfigure_mnt(path, mnt_flags);
> +               return do_reconfigure_mnt(path, mnt_flags, flags);
>         if (flags & MS_REMOUNT)
> -               return do_remount(path, sb_flags, mnt_flags, data_page);
> +               return do_remount(path, sb_flags, mnt_flags, data_page, f=
lags);
>         if (flags & MS_BIND)
>                 return do_loopback(path, dev_name, flags & MS_REC);
>         if (flags & (MS_SHARED | MS_PRIVATE | MS_SLAVE | MS_UNBINDABLE))
> @@ -4157,7 +4180,7 @@ int path_mount(const char *dev_name, const struct p=
ath *path,
>                 return do_move_mount_old(path, dev_name);
>
>         return do_new_mount(path, type_page, sb_flags, mnt_flags, dev_nam=
e,
> -                           data_page);
> +                           data_page, flags);
>  }
>
>  int do_mount(const char *dev_name, const char __user *dir_name,
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.=
h
> index 8c42b4bde09c..6bb67059fb43 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -81,6 +81,18 @@ LSM_HOOK(int, 0, sb_clone_mnt_opts, const struct super=
_block *oldsb,
>          unsigned long *set_kern_flags)
>  LSM_HOOK(int, 0, move_mount, const struct path *from_path,
>          const struct path *to_path)
> +LSM_HOOK(int, 0, mount_bind, const struct path *from, const struct path =
*to,
> +        bool recurse)
> +LSM_HOOK(int, 0, mount_new, struct fs_context *fc, const struct path *mp=
,
> +        int mnt_flags, unsigned long flags, void *data)
> +LSM_HOOK(int, 0, mount_remount, struct fs_context *fc,
> +        const struct path *mp, int mnt_flags, unsigned long flags,
> +        void *data)
> +LSM_HOOK(int, 0, mount_reconfigure, const struct path *mp,
> +        unsigned int mnt_flags, unsigned long flags)
> +LSM_HOOK(int, 0, mount_move, const struct path *from_path,
> +        const struct path *to_path)
> +LSM_HOOK(int, 0, mount_change_type, const struct path *mp, int ms_flags)
>  LSM_HOOK(int, -EOPNOTSUPP, dentry_init_security, struct dentry *dentry,
>          int mode, const struct qstr *name, const char **xattr_name,
>          struct lsm_context *cp)
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 83a646d72f6f..6e31de9b3d68 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -385,6 +385,17 @@ int security_sb_clone_mnt_opts(const struct super_bl=
ock *oldsb,
>                                 unsigned long kern_flags,
>                                 unsigned long *set_kern_flags);
>  int security_move_mount(const struct path *from_path, const struct path =
*to_path);
> +int security_mount_bind(const struct path *from, const struct path *to,
> +                       bool recurse);
> +int security_mount_new(struct fs_context *fc, const struct path *mp,
> +                      int mnt_flags, unsigned long flags, void *data);
> +int security_mount_remount(struct fs_context *fc, const struct path *mp,
> +                          int mnt_flags, unsigned long flags, void *data=
);
> +int security_mount_reconfigure(const struct path *mp, unsigned int mnt_f=
lags,
> +                              unsigned long flags);
> +int security_mount_move(const struct path *from_path,
> +                       const struct path *to_path);
> +int security_mount_change_type(const struct path *mp, int ms_flags);
>  int security_dentry_init_security(struct dentry *dentry, int mode,
>                                   const struct qstr *name,
>                                   const char **xattr_name,
> @@ -847,6 +858,45 @@ static inline int security_move_mount(const struct p=
ath *from_path,
>         return 0;
>  }
>
> +static inline int security_mount_bind(const struct path *from,
> +                                     const struct path *to, bool recurse=
)
> +{
> +       return 0;
> +}
> +
> +static inline int security_mount_new(struct fs_context *fc,
> +                                    const struct path *mp, int mnt_flags=
,
> +                                    unsigned long flags, void *data)
> +{
> +       return 0;
> +}
> +
> +static inline int security_mount_remount(struct fs_context *fc,
> +                                        const struct path *mp, int mnt_f=
lags,
> +                                        unsigned long flags, void *data)
> +{
> +       return 0;
> +}
> +
> +static inline int security_mount_reconfigure(const struct path *mp,
> +                                            unsigned int mnt_flags,
> +                                            unsigned long flags)
> +{
> +       return 0;
> +}
> +
> +static inline int security_mount_move(const struct path *from_path,
> +                                     const struct path *to_path)
> +{
> +       return 0;
> +}
> +
> +static inline int security_mount_change_type(const struct path *mp,
> +                                            int ms_flags)
> +{
> +       return 0;
> +}
> +
>  static inline int security_path_notify(const struct path *path, u64 mask=
,
>                                 unsigned int obj_type)
>  {
> diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
> index 0c4a0c8e6f70..65235d70ee23 100644
> --- a/kernel/bpf/bpf_lsm.c
> +++ b/kernel/bpf/bpf_lsm.c
> @@ -383,6 +383,13 @@ BTF_ID(func, bpf_lsm_task_prctl)
>  BTF_ID(func, bpf_lsm_task_setscheduler)
>  BTF_ID(func, bpf_lsm_task_to_inode)
>  BTF_ID(func, bpf_lsm_userns_create)
> +BTF_ID(func, bpf_lsm_move_mount)
> +BTF_ID(func, bpf_lsm_mount_bind)
> +BTF_ID(func, bpf_lsm_mount_new)
> +BTF_ID(func, bpf_lsm_mount_remount)
> +BTF_ID(func, bpf_lsm_mount_reconfigure)
> +BTF_ID(func, bpf_lsm_mount_move)
> +BTF_ID(func, bpf_lsm_mount_change_type)
>  BTF_SET_END(sleepable_lsm_hooks)
>
>  BTF_SET_START(untrusted_lsm_hooks)
> diff --git a/security/security.c b/security/security.c
> index 67af9228c4e9..356ef228d5de 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1156,6 +1156,107 @@ int security_move_mount(const struct path *from_p=
ath,
>         return call_int_hook(move_mount, from_path, to_path);
>  }
>
> +/**
> + * security_mount_bind() - Check permissions for a bind mount
> + * @from: source path
> + * @to: destination mount point
> + * @recurse: whether this is a recursive bind mount
> + *
> + * Check permission before a bind mount is performed. Called with the
> + * source path already resolved, eliminating TOCTOU issues with
> + * string-based dev_name in security_sb_mount().
> + *
> + * Return: Returns 0 if permission is granted.
> + */
> +int security_mount_bind(const struct path *from, const struct path *to,
> +                       bool recurse)
> +{
> +       return call_int_hook(mount_bind, from, to, recurse);
> +}
> +
> +/**
> + * security_mount_new() - Check permissions for a new mount
> + * @fc: filesystem context with parsed options
> + * @mp: mount point path
> + * @mnt_flags: mount flags (MNT_*)
> + * @flags: original mount flags (MS_*, used by AppArmor/Tomoyo)
> + * @data: filesystem specific data (used by AppArmor)
> + *
> + * Check permission before a new filesystem is mounted. Called after
> + * mount options are parsed, providing access to the fs_context.
> + *
> + * Return: Returns 0 if permission is granted.
> + */
> +int security_mount_new(struct fs_context *fc, const struct path *mp,
> +                      int mnt_flags, unsigned long flags, void *data)
> +{
> +       return call_int_hook(mount_new, fc, mp, mnt_flags, flags, data);
> +}
> +
> +/**
> + * security_mount_remount() - Check permissions for a remount
> + * @fc: filesystem context with parsed options
> + * @mp: mount point path
> + * @mnt_flags: mount flags (MNT_*)
> + * @flags: original mount flags (MS_*, used by AppArmor/Tomoyo)
> + * @data: filesystem specific data (used by AppArmor)
> + *
> + * Check permission before a filesystem is remounted. Called after
> + * mount options are parsed, providing access to the fs_context.
> + *
> + * Return: Returns 0 if permission is granted.
> + */
> +int security_mount_remount(struct fs_context *fc, const struct path *mp,
> +                          int mnt_flags, unsigned long flags, void *data=
)
> +{
> +       return call_int_hook(mount_remount, fc, mp, mnt_flags, flags, dat=
a);
> +}
> +
> +/**
> + * security_mount_reconfigure() - Check permissions for mount reconfigur=
ation
> + * @mp: mount point path
> + * @mnt_flags: new mount flags (MNT_*)
> + * @flags: original mount flags (MS_*, used by AppArmor/Tomoyo)
> + *
> + * Check permission before mount flags are reconfigured (MS_REMOUNT|MS_B=
IND).
> + *
> + * Return: Returns 0 if permission is granted.
> + */
> +int security_mount_reconfigure(const struct path *mp, unsigned int mnt_f=
lags,
> +                              unsigned long flags)
> +{
> +       return call_int_hook(mount_reconfigure, mp, mnt_flags, flags);
> +}
> +
> +/**
> + * security_mount_move() - Check permissions for moving a mount
> + * @from_path: source mount path
> + * @to_path: destination mount point path
> + *
> + * Check permission before a mount is moved.
> + *
> + * Return: Returns 0 if permission is granted.
> + */
> +int security_mount_move(const struct path *from_path,
> +                       const struct path *to_path)
> +{
> +       return call_int_hook(mount_move, from_path, to_path);
> +}
> +
> +/**
> + * security_mount_change_type() - Check permissions for propagation chan=
ges
> + * @mp: mount point path
> + * @ms_flags: propagation flags (MS_SHARED, MS_PRIVATE, etc.)
> + *
> + * Check permission before mount propagation type is changed.
> + *
> + * Return: Returns 0 if permission is granted.
> + */
> +int security_mount_change_type(const struct path *mp, int ms_flags)
> +{
> +       return call_int_hook(mount_change_type, mp, ms_flags);
> +}
> +
>  /**
>   * security_path_notify() - Check if setting a watch is allowed
>   * @path: file path
> --
> 2.52.0
>

