Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIvROQgo3WlpaQkAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 13 Apr 2026 19:29:44 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F313F17A0
	for <lists+apparmor@lfdr.de>; Mon, 13 Apr 2026 19:29:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wCL6P-00022i-Dp; Mon, 13 Apr 2026 17:29:37 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <stephen.smalley.work@gmail.com>)
 id 1wCKvR-00074G-NG
 for apparmor@lists.ubuntu.com; Mon, 13 Apr 2026 17:18:17 +0000
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-82f07e5ad92so2240258b3a.0
 for <apparmor@lists.ubuntu.com>; Mon, 13 Apr 2026 10:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776100696; cv=none;
 d=google.com; s=arc-20240605;
 b=cG5MabX8Q5hezoRS9CrAkh0lu0Y5MgztVi/GLUWKIvUEVVUudNeZZUkrZc+ZL31ioN
 uW3GbtS249D8rxfqAHa+hjYLJtZIMJU2utqX2Qns/87wSKbCnox4/R8ecrLuPPV+IEZr
 xaG1oOvi3/uQDn7+tPXkH1P0lCethx1b99rEcw/ghMKskpCJPGC3LWwIhCRQR09MJOMi
 9MZcYM7YxaBTtM6Ov67KzEIYc9uSszp0GRhOZdhw4A/rCUmuJquvxpCZNO5mMV8MVTwS
 tbDPBtRwOiDmgOI36PUmsxYHo4ENs43kF1rBiYjDYfSpFbwLNhH2wbwnkJS76mqJkNsw
 pSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=F15VRocv2P4WxR2dcWf1P3WLCWVPf+xJP5ArIPyWN8M=;
 fh=ELQgk5NZJuyioopXk1Ukr4FgQZY5CePuqNK8j7+FUBM=;
 b=NMPcuzRMa1Hra31E3P5YD7LAhsIy9qH5tX4ALG6PIXFjGVKJEXYYevkA4E7B5eWLf1
 ZGCjmEm0G6DKWCEPEFsorix89vT/aqHXeMCfgkfw0mybCnALBlmi+kkU7SxW+5rtbzvh
 3tMLy4y6L3j+QvuzfjvukWfQC0Lkxx5rEquxSIsSvZYNyalKuTbT5c7BnurfHvnNPmGf
 0DGhHmPfZY55AsTARC1QfkSM7hqidT4YgJ+pwzTls+uPmzjV6W9ISfjSU19+WmgFxqjV
 kgoQexvyyKALYeEcIkvMo8cPWrj9XwUFk0jdMkis/B/FLPLIfXSa04cYdLoFQ/lC+BRy
 CHpA==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776100696; x=1776705496; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F15VRocv2P4WxR2dcWf1P3WLCWVPf+xJP5ArIPyWN8M=;
 b=OAr9iKrRf5lqwKAxFEnUjnwYvI5vPmizciCdUc7gVGxNjqFL3PPMx2HDpSy1xEqnL/
 kEByFZDGwoVadzJUPwV7pOwdDx5/vAce1sW8J4Zf1A+eiwIHA7Ftlp0azqQnMzWJDEfk
 HUexESLVvkLmCd8WLm59MWJX3dgr1JvfYwOacL7ujWH01rb9AgrMhmpwXiMKLZyq8lpE
 R2uIMV5WSVjjawh7xXeEyMxOi5L9LEhApURnZO3nI6FIDZcKs6erN4Nzs/7713ldOdEA
 isefgg+sCooe2zWWrMsgwWfg7IOkaLUAc4ER4352KW1sWCZYF7I1xGsoHRj8mLxQ95fD
 w/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776100696; x=1776705496;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F15VRocv2P4WxR2dcWf1P3WLCWVPf+xJP5ArIPyWN8M=;
 b=S1WrsBVGrMIe+hvBHyn5+V+9L++AjxolENgPdgbdLWCoDB3/WbGEgHonnmGz9mxVZp
 rZay15SK+ch3CLPvBHglXaCIsgWjxMhCGBAkOEvD2wngYah+RhIByTvDVDvPpNYlUq6D
 gcfzK/h7A3Vx0iYJyaxeRlX5iMtDA7+me8141bceZbgk2VKwz6tXnIg2FVhv2gswnHYW
 P3Iv1rv0RBua9e2oLvlLEqzqHMct7gtMxzYym+TtM1/qt6NOaROJ9wEjTrmWHFMFRIEd
 WS/LGpR48h1ssF5VmgcbqL02hQSXjZgQAQAx4dBJW1TsivWp/SAep6MhICui+1DX3ESk
 Jn2Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+NqmQaRfS/ThpVZHOd7iKOQshvv8HGnibhJo5BIyo8IDVdMEsZTfdCxElY3TgfR43BN8bz8gQ75g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yzkkomy1dJq43Ki61OgVERiLj128cfl2CM8OQzz0zcO5qTHgOki
 frUlvOy7VAcBZxCWKuhI52OypF9dNyNi/58TWeoiZ0qXlka6q9hbWy0r2qT4JDKbcJJ+rcVh1p9
 LPb9tATKgdGsHnnF0crppp1PipQdexBg=
X-Gm-Gg: AeBDievAST5HG52aqydruHPbUv4kfC7H+oQFMj8640loArX9V8oq2zZ5rQSXKjqYBtt
 ZVrqxj0Emfc3pf6k0AUWWYEtRYAa+vKyjQBxa6sx/pTVXF+RA9M+/rzsAJTmL7WKFRpM7VAfY0G
 qzX1ZWbbwalzcyBpoemHG/AiK78q4Pc2NSBkVGy+k4mGLHd7vvAqBaBD+ECroxaCQNniDEkGw4v
 wJc50KU7KrSkYDO6L5YiOcAkKD52RjV9xIKfqi0Jgut3PoqFB/OvNQJ57SVqrXPcuDUBpvaZjFb
 Tp4V7X4=
X-Received: by 2002:a05:6a00:f99:b0:823:9c6:1985 with SMTP id
 d2e1a72fcca58-82f0c288c79mr14697645b3a.16.1776100695927; Mon, 13 Apr 2026
 10:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-8-song@kernel.org>
In-Reply-To: <20260318184400.3502908-8-song@kernel.org>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 13 Apr 2026 13:18:04 -0400
X-Gm-Features: AQROBzDMToOoMkTBxw1JVrqkX7aPgT7CuehV5_REXeUNyYzsXUc_KGEXz4KU6kY
Message-ID: <CAEjxPJ69Fqah25_q1V=VrO5cyXNOv0HYjzky=FQ62QycPb_QFQ@mail.gmail.com>
To: Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.180;
 envelope-from=stephen.smalley.work@gmail.com; helo=mail-pf1-f180.google.com
X-Mailman-Approved-At: Mon, 13 Apr 2026 17:29:34 +0000
Subject: Re: [apparmor] [PATCH 7/7] lsm: Remove security_sb_mount and
	security_move_mount
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
Cc: brauner@kernel.org, jack@suse.cz, paul@paul-moore.com,
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:penguin-kernel@i-love.sakura.ne.jp,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.126];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: C6F313F17A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 2:44=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> Now that all LSMs have been converted to granular mount hooks,
> remove the old hooks:
>
> - security_sb_mount(): removed from lsm_hook_defs.h, security.h,
>   security.c, and its call in path_mount().
> - security_move_mount(): removed and replaced by security_mount_move()
>   in do_move_mount(). All LSMs now use mount_move exclusively.
>
> Code generated with the assistance of Claude, reviewed by human.
>
> Signed-off-by: Song Liu <song@kernel.org>

Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com # for selinux on=
ly

> ---
>  fs/namespace.c                |  6 +-----
>  include/linux/lsm_hook_defs.h |  4 ----
>  include/linux/security.h      | 16 ---------------
>  kernel/bpf/bpf_lsm.c          |  2 --
>  security/apparmor/lsm.c       |  1 -
>  security/landlock/fs.c        |  1 -
>  security/security.c           | 38 -----------------------------------
>  security/selinux/hooks.c      |  2 --
>  8 files changed, 1 insertion(+), 69 deletions(-)
>
> diff --git a/fs/namespace.c b/fs/namespace.c
> index de33070e514a..ba5baccdde67 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -4108,7 +4108,6 @@ int path_mount(const char *dev_name, const struct p=
ath *path,
>                 const char *type_page, unsigned long flags, void *data_pa=
ge)
>  {
>         unsigned int mnt_flags =3D 0, sb_flags;
> -       int ret;
>
>         /* Discard magic */
>         if ((flags & MS_MGC_MSK) =3D=3D MS_MGC_VAL)
> @@ -4121,9 +4120,6 @@ int path_mount(const char *dev_name, const struct p=
ath *path,
>         if (flags & MS_NOUSER)
>                 return -EINVAL;
>
> -       ret =3D security_sb_mount(dev_name, path, type_page, flags, data_=
page);
> -       if (ret)
> -               return ret;
>         if (!may_mount())
>                 return -EPERM;
>         if (flags & SB_MANDLOCK)
> @@ -4538,7 +4534,7 @@ static inline int vfs_move_mount(const struct path =
*from_path,
>  {
>         int ret;
>
> -       ret =3D security_move_mount(from_path, to_path);
> +       ret =3D security_mount_move(from_path, to_path);
>         if (ret)
>                 return ret;
>
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.=
h
> index 6bb67059fb43..95537574c40b 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -69,8 +69,6 @@ LSM_HOOK(int, 0, sb_remount, struct super_block *sb, vo=
id *mnt_opts)
>  LSM_HOOK(int, 0, sb_kern_mount, const struct super_block *sb)
>  LSM_HOOK(int, 0, sb_show_options, struct seq_file *m, struct super_block=
 *sb)
>  LSM_HOOK(int, 0, sb_statfs, struct dentry *dentry)
> -LSM_HOOK(int, 0, sb_mount, const char *dev_name, const struct path *path=
,
> -        const char *type, unsigned long flags, void *data)
>  LSM_HOOK(int, 0, sb_umount, struct vfsmount *mnt, int flags)
>  LSM_HOOK(int, 0, sb_pivotroot, const struct path *old_path,
>          const struct path *new_path)
> @@ -79,8 +77,6 @@ LSM_HOOK(int, 0, sb_set_mnt_opts, struct super_block *s=
b, void *mnt_opts,
>  LSM_HOOK(int, 0, sb_clone_mnt_opts, const struct super_block *oldsb,
>          struct super_block *newsb, unsigned long kern_flags,
>          unsigned long *set_kern_flags)
> -LSM_HOOK(int, 0, move_mount, const struct path *from_path,
> -        const struct path *to_path)
>  LSM_HOOK(int, 0, mount_bind, const struct path *from, const struct path =
*to,
>          bool recurse)
>  LSM_HOOK(int, 0, mount_new, struct fs_context *fc, const struct path *mp=
,
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 6e31de9b3d68..3610a49304c6 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -372,8 +372,6 @@ int security_sb_remount(struct super_block *sb, void =
*mnt_opts);
>  int security_sb_kern_mount(const struct super_block *sb);
>  int security_sb_show_options(struct seq_file *m, struct super_block *sb)=
;
>  int security_sb_statfs(struct dentry *dentry);
> -int security_sb_mount(const char *dev_name, const struct path *path,
> -                     const char *type, unsigned long flags, void *data);
>  int security_sb_umount(struct vfsmount *mnt, int flags);
>  int security_sb_pivotroot(const struct path *old_path, const struct path=
 *new_path);
>  int security_sb_set_mnt_opts(struct super_block *sb,
> @@ -384,7 +382,6 @@ int security_sb_clone_mnt_opts(const struct super_blo=
ck *oldsb,
>                                 struct super_block *newsb,
>                                 unsigned long kern_flags,
>                                 unsigned long *set_kern_flags);
> -int security_move_mount(const struct path *from_path, const struct path =
*to_path);
>  int security_mount_bind(const struct path *from, const struct path *to,
>                         bool recurse);
>  int security_mount_new(struct fs_context *fc, const struct path *mp,
> @@ -818,13 +815,6 @@ static inline int security_sb_statfs(struct dentry *=
dentry)
>         return 0;
>  }
>
> -static inline int security_sb_mount(const char *dev_name, const struct p=
ath *path,
> -                                   const char *type, unsigned long flags=
,
> -                                   void *data)
> -{
> -       return 0;
> -}
> -
>  static inline int security_sb_umount(struct vfsmount *mnt, int flags)
>  {
>         return 0;
> @@ -852,12 +842,6 @@ static inline int security_sb_clone_mnt_opts(const s=
truct super_block *oldsb,
>         return 0;
>  }
>
> -static inline int security_move_mount(const struct path *from_path,
> -                                     const struct path *to_path)
> -{
> -       return 0;
> -}
> -
>  static inline int security_mount_bind(const struct path *from,
>                                       const struct path *to, bool recurse=
)
>  {
> diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
> index 65235d70ee23..3e61c54f9b48 100644
> --- a/kernel/bpf/bpf_lsm.c
> +++ b/kernel/bpf/bpf_lsm.c
> @@ -350,7 +350,6 @@ BTF_ID(func, bpf_lsm_release_secctx)
>  BTF_ID(func, bpf_lsm_sb_alloc_security)
>  BTF_ID(func, bpf_lsm_sb_eat_lsm_opts)
>  BTF_ID(func, bpf_lsm_sb_kern_mount)
> -BTF_ID(func, bpf_lsm_sb_mount)
>  BTF_ID(func, bpf_lsm_sb_remount)
>  BTF_ID(func, bpf_lsm_sb_set_mnt_opts)
>  BTF_ID(func, bpf_lsm_sb_show_options)
> @@ -383,7 +382,6 @@ BTF_ID(func, bpf_lsm_task_prctl)
>  BTF_ID(func, bpf_lsm_task_setscheduler)
>  BTF_ID(func, bpf_lsm_task_to_inode)
>  BTF_ID(func, bpf_lsm_userns_create)
> -BTF_ID(func, bpf_lsm_move_mount)
>  BTF_ID(func, bpf_lsm_mount_bind)
>  BTF_ID(func, bpf_lsm_mount_new)
>  BTF_ID(func, bpf_lsm_mount_remount)
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 7fe774535992..13a8049b1b59 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1713,7 +1713,6 @@ static struct security_hook_list apparmor_hooks[] _=
_ro_after_init =3D {
>         LSM_HOOK_INIT(capget, apparmor_capget),
>         LSM_HOOK_INIT(capable, apparmor_capable),
>
> -       LSM_HOOK_INIT(move_mount, apparmor_move_mount),
>         LSM_HOOK_INIT(mount_bind, apparmor_mount_bind),
>         LSM_HOOK_INIT(mount_new, apparmor_mount_new),
>         LSM_HOOK_INIT(mount_remount, apparmor_mount_remount),
> diff --git a/security/landlock/fs.c b/security/landlock/fs.c
> index 6e810550efcb..5f723a70baa4 100644
> --- a/security/landlock/fs.c
> +++ b/security/landlock/fs.c
> @@ -1857,7 +1857,6 @@ static struct security_hook_list landlock_hooks[] _=
_ro_after_init =3D {
>         LSM_HOOK_INIT(mount_reconfigure, hook_mount_reconfigure),
>         LSM_HOOK_INIT(mount_change_type, hook_mount_change_type),
>         LSM_HOOK_INIT(mount_move, hook_move_mount),
> -       LSM_HOOK_INIT(move_mount, hook_move_mount),
>         LSM_HOOK_INIT(sb_umount, hook_sb_umount),
>         LSM_HOOK_INIT(sb_remount, hook_sb_remount),
>         LSM_HOOK_INIT(sb_pivotroot, hook_sb_pivotroot),
> diff --git a/security/security.c b/security/security.c
> index 356ef228d5de..af95868af34d 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1039,29 +1039,6 @@ int security_sb_statfs(struct dentry *dentry)
>         return call_int_hook(sb_statfs, dentry);
>  }
>
> -/**
> - * security_sb_mount() - Check permission for mounting a filesystem
> - * @dev_name: filesystem backing device
> - * @path: mount point
> - * @type: filesystem type
> - * @flags: mount flags
> - * @data: filesystem specific data
> - *
> - * Check permission before an object specified by @dev_name is mounted o=
n the
> - * mount point named by @nd.  For an ordinary mount, @dev_name identifie=
s a
> - * device if the file system type requires a device.  For a remount
> - * (@flags & MS_REMOUNT), @dev_name is irrelevant.  For a loopback/bind =
mount
> - * (@flags & MS_BIND), @dev_name identifies the        pathname of the o=
bject being
> - * mounted.
> - *
> - * Return: Returns 0 if permission is granted.
> - */
> -int security_sb_mount(const char *dev_name, const struct path *path,
> -                     const char *type, unsigned long flags, void *data)
> -{
> -       return call_int_hook(sb_mount, dev_name, path, type, flags, data)=
;
> -}
> -
>  /**
>   * security_sb_umount() - Check permission for unmounting a filesystem
>   * @mnt: mounted filesystem
> @@ -1141,21 +1118,6 @@ int security_sb_clone_mnt_opts(const struct super_=
block *oldsb,
>  }
>  EXPORT_SYMBOL(security_sb_clone_mnt_opts);
>
> -/**
> - * security_move_mount() - Check permissions for moving a mount
> - * @from_path: source mount point
> - * @to_path: destination mount point
> - *
> - * Check permission before a mount is moved.
> - *
> - * Return: Returns 0 if permission is granted.
> - */
> -int security_move_mount(const struct path *from_path,
> -                       const struct path *to_path)
> -{
> -       return call_int_hook(move_mount, from_path, to_path);
> -}
> -
>  /**
>   * security_mount_bind() - Check permissions for a bind mount
>   * @from: source path
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 415b5541ab9e..446e9e242134 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -7477,8 +7477,6 @@ static struct security_hook_list selinux_hooks[] __=
ro_after_init =3D {
>         LSM_HOOK_INIT(sb_set_mnt_opts, selinux_set_mnt_opts),
>         LSM_HOOK_INIT(sb_clone_mnt_opts, selinux_sb_clone_mnt_opts),
>
> -       LSM_HOOK_INIT(move_mount, selinux_move_mount),
> -
>         LSM_HOOK_INIT(dentry_init_security, selinux_dentry_init_security)=
,
>         LSM_HOOK_INIT(dentry_create_files_as, selinux_dentry_create_files=
_as),
>
> --
> 2.52.0
>

