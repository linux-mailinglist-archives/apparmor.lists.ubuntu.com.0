Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLnIOQgo3WmVaQkAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 13 Apr 2026 19:29:44 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B70D3F179F
	for <lists+apparmor@lfdr.de>; Mon, 13 Apr 2026 19:29:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wCL6M-00021e-RR; Mon, 13 Apr 2026 17:29:34 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <stephen.smalley.work@gmail.com>)
 id 1wCKuH-0006ZS-Iw
 for apparmor@lists.ubuntu.com; Mon, 13 Apr 2026 17:17:05 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-82ce2e2880cso3062577b3a.0
 for <apparmor@lists.ubuntu.com>; Mon, 13 Apr 2026 10:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776100624; cv=none;
 d=google.com; s=arc-20240605;
 b=Hq9RkQKNbJ93GNwlINmcqxsMCIpgTlmQZgxzEEmg813HtX7Gri6wH6Oe/nQMhDHDFH
 hXIYweWp7UwcU/YoAJlabQjN53mpT9YSaH6i3jzO0vjGWfGw4z0U+SbEMBtYPrmr8mCK
 LhQOuEnvbwp6X+cEt5yS6b2VCeJKmp3ewbbi5p2b0ig/I0uM9SP9Ow/QjaWJsu0pnWbL
 9fWObtxl0gMg2d3CD4Uqv2E1GWD+dMwv0Wu6cOSRkK21J0GNovoDNaHepCcOFN9C8JtT
 vhlHEWPNFCAEn89eUDyaQnvqy0UGR6JiAu0zmDCczdvlo96MYwMkkcU0VfouL3O17or8
 2mQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BRAbh5NTmH7fPoUJt2iXhkljH90jFoJ00lEuAgJuvXo=;
 fh=bZXQ0Y84RWNtjldavaBEFY5dWU36Bwu8i0YJVlNjVS0=;
 b=fXiCDtHCJ9EkDQM9UoIZ2jC98jK/o+6hEqJYytGJuTRHSnCuJOu/7mHK4Kg4/ZKPhN
 v3VuTDFzy7cLEqCvPs2FlorhoSFy5i9QNZ5M+8SHOYBbwdFwyTPtf5B6jkd0f506alzg
 zn1HEXzbZ/7dhPo19ivFhjPSuyQqRgyrIE4CFiPzbIQ4wg0jX91YN3eFtyWZ3T2wmG29
 2jRqKSbcrJ8ncIwllG/67CrHwKUS1BRa5REZZFd7Dxx5LYBI+b4XMMQMCN1mKIEQluI2
 wfEEey0QVUo2SHOvY9n4z7BrhiRqNM0E+L9jSQq6jThHUam2gA5aweVQZQFECpOrmneu
 FswQ==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776100624; x=1776705424; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BRAbh5NTmH7fPoUJt2iXhkljH90jFoJ00lEuAgJuvXo=;
 b=Jn5AMprR1V63tMw7TtBOCsLV61An9aVpshM8V08N9Abr8pp/SLb1ZQvLBc4RqTN27B
 7XBYlf/pn1lJwv8tzfF6S68IfVAH8Hohx/5nS09spULze/kRIXb/v/0R/4wQYOdRSc20
 Bm7qc+E3svfnpBZDxlxKhCvSZoFzmkW++jXkoRvlPlLv03THQmDGIgGoiK44Tg8sbzbt
 yNMC0ZFK9dLwxyJnjvLSbG8HIj5lxE4kZ6y+ETQNqUss/PxQgvFiql5ZfN6UMF55gG0E
 5mExAGbh3wFpXxoOdEhhM950ilFK3/nxeld+H2WAvWNjWOppDucvfQfUhCXRBKt5o0bL
 bDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776100624; x=1776705424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BRAbh5NTmH7fPoUJt2iXhkljH90jFoJ00lEuAgJuvXo=;
 b=CvBUbGCAi3w6bQfONuSlkc3dz8tRlerpKlJD5QP8xYQb7+RS2tliRofdFcyqpgya48
 zp0PeNrxMe/jHOGHjjpKvQ2Admq0NmECCfD+Njx3InvaQAAe85UTzJgWZXwS9eIm7bft
 24Ix1oE3o29KoFo1gwGwryWwI90mla8i4XAqrqobqchm75Vrlz8q1JJkg9FrYiaQQckO
 2EvkYmbL5Zw76Gii1XbzOqDAYsONE7cT1w2Xxtbh2PKTrqpIf41Ial5bDlDPszu4zCTP
 FoUSoydzsuogU6KQVr9MSwUWjdsbBchcQxcFLxCiSrTil9R08mslplHZhRQDnYxzXUEc
 Ke9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zX2Ri5cM9N4XzTH14nheUBF+mVekwci/FhSWxw0liYBSCy56VoT9U/anBnOReaeVB+nnrHh2TyQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yw1GBb2X1+uyu85eVzS52T0hBHJxaYbmP5k/X9rytKgQ/It4dyu
 aeJZvwiII83FurTmRfKnfI+JxdRRoESQaf2AV6ayeR84NMMKtX85LzC3LAsaZsLo6KcAOyxKIYR
 aFP1+0iXJ93N15tOT2OMtl1Mi3lGKu8g=
X-Gm-Gg: AeBDieuK3eRxtTLFBQkvgAEcaXqJoQ4SEvGsY6mKdMiLthILb3IYW38A5H8gnAgyCvi
 jX+Ds87dfJwKQytPjAMBB+TMb8+n/gDaUPv9sd3pjKGGRxSjX14qby3zKEHSyb4NGVOL0l8k8Xn
 ABnwhRPDPOoSNeEXCawAuMjmifnYNLPaOVdNLaSVSDIjukMZmye5ZT6ecw0OmZAcCxEiG7SiVw2
 J2jHR+KzBUHELq6Sqc5a94gq0qGJc3UlKbAsNkuEcxUASLfpUWsXw7S9RJHFJhdQUQymuxIPEWi
 kwqglyM=
X-Received: by 2002:a05:6a00:1f0e:b0:82f:5125:a327 with SMTP id
 d2e1a72fcca58-82f5125a71emr888914b3a.27.1776100623918; Mon, 13 Apr 2026
 10:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-5-song@kernel.org>
In-Reply-To: <20260318184400.3502908-5-song@kernel.org>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 13 Apr 2026 13:16:52 -0400
X-Gm-Features: AQROBzD6lyXWHoKW5RWqw1gdlCZn4rvcVErICJ7ENPulk3A0gDivj2NjCp7Gp1A
Message-ID: <CAEjxPJ5iDbnZj9gXb=GHORoXGwRP4EG0yUEH8MPmGqJWZEONWQ@mail.gmail.com>
To: Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.174;
 envelope-from=stephen.smalley.work@gmail.com; helo=mail-pf1-f174.google.com
X-Mailman-Approved-At: Mon, 13 Apr 2026 17:29:34 +0000
Subject: Re: [apparmor] [PATCH 4/7] selinux: Convert from sb_mount to
	granular mount hooks
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
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
	NEURAL_HAM(-0.00)[-0.391];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8B70D3F179F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 2:44=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> Replace selinux_mount() with granular mount hooks, preserving the
> same permission checks:
>
> - mount_bind, mount_new, mount_change_type: FILE__MOUNTON
> - mount_remount, mount_reconfigure: FILESYSTEM__REMOUNT
> - mount_move: FILE__MOUNTON (reuses selinux_move_mount)
>
> The flags and data parameters are unused by SELinux.
>
> Code generated with the assistance of Claude, reviewed by human.
>
> Signed-off-by: Song Liu <song@kernel.org>

Not expecting you to do this, but after this lands, I think it would
make sense to revisit the SELinux checks and further specialize them
while providing backward compatibility.

Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com

> ---
>  security/selinux/hooks.c | 47 ++++++++++++++++++++++++++++++----------
>  1 file changed, 35 insertions(+), 12 deletions(-)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index d8224ea113d1..415b5541ab9e 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -2778,19 +2778,37 @@ static int selinux_sb_statfs(struct dentry *dentr=
y)
>         return superblock_has_perm(cred, dentry->d_sb, FILESYSTEM__GETATT=
R, &ad);
>  }
>
> -static int selinux_mount(const char *dev_name,
> -                        const struct path *path,
> -                        const char *type,
> -                        unsigned long flags,
> -                        void *data)
> +static int selinux_mount_bind(const struct path *from, const struct path=
 *to,
> +                             bool recurse)
>  {
> -       const struct cred *cred =3D current_cred();
> +       return path_has_perm(current_cred(), to, FILE__MOUNTON);
> +}
>
> -       if (flags & MS_REMOUNT)
> -               return superblock_has_perm(cred, path->dentry->d_sb,
> -                                          FILESYSTEM__REMOUNT, NULL);
> -       else
> -               return path_has_perm(cred, path, FILE__MOUNTON);
> +static int selinux_mount_new(struct fs_context *fc, const struct path *m=
p,
> +                            int mnt_flags, unsigned long flags, void *da=
ta)
> +{
> +       return path_has_perm(current_cred(), mp, FILE__MOUNTON);
> +}
> +
> +static int selinux_mount_remount(struct fs_context *fc, const struct pat=
h *mp,
> +                                int mnt_flags, unsigned long flags,
> +                                void *data)
> +{
> +       return superblock_has_perm(current_cred(), fc->root->d_sb,
> +                                  FILESYSTEM__REMOUNT, NULL);
> +}
> +
> +static int selinux_mount_reconfigure(const struct path *mp,
> +                                    unsigned int mnt_flags,
> +                                    unsigned long flags)
> +{
> +       return superblock_has_perm(current_cred(), mp->dentry->d_sb,
> +                                  FILESYSTEM__REMOUNT, NULL);
> +}
> +
> +static int selinux_mount_change_type(const struct path *mp, int ms_flags=
)
> +{
> +       return path_has_perm(current_cred(), mp, FILE__MOUNTON);
>  }
>
>  static int selinux_move_mount(const struct path *from_path,
> @@ -7449,7 +7467,12 @@ static struct security_hook_list selinux_hooks[] _=
_ro_after_init =3D {
>         LSM_HOOK_INIT(sb_kern_mount, selinux_sb_kern_mount),
>         LSM_HOOK_INIT(sb_show_options, selinux_sb_show_options),
>         LSM_HOOK_INIT(sb_statfs, selinux_sb_statfs),
> -       LSM_HOOK_INIT(sb_mount, selinux_mount),
> +       LSM_HOOK_INIT(mount_bind, selinux_mount_bind),
> +       LSM_HOOK_INIT(mount_new, selinux_mount_new),
> +       LSM_HOOK_INIT(mount_remount, selinux_mount_remount),
> +       LSM_HOOK_INIT(mount_reconfigure, selinux_mount_reconfigure),
> +       LSM_HOOK_INIT(mount_change_type, selinux_mount_change_type),
> +       LSM_HOOK_INIT(mount_move, selinux_move_mount),
>         LSM_HOOK_INIT(sb_umount, selinux_umount),
>         LSM_HOOK_INIT(sb_set_mnt_opts, selinux_set_mnt_opts),
>         LSM_HOOK_INIT(sb_clone_mnt_opts, selinux_sb_clone_mnt_opts),
> --
> 2.52.0
>

