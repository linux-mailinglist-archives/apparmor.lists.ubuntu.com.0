Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CA3A1AA85
	for <lists+apparmor@lfdr.de>; Thu, 23 Jan 2025 20:43:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tb36t-0003yM-UM; Thu, 23 Jan 2025 19:43:27 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tb36s-0003xU-CI
 for apparmor@lists.ubuntu.com; Thu, 23 Jan 2025 19:43:26 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 73EA23F31B
 for <apparmor@lists.ubuntu.com>; Thu, 23 Jan 2025 19:43:23 +0000 (UTC)
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-aafc90962ffso116760566b.0
 for <apparmor@lists.ubuntu.com>; Thu, 23 Jan 2025 11:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737661402; x=1738266202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFEb+jSUKHGrACcVDUQEDS+ei4EXcNiR2sfKcmdnXzc=;
 b=wc3YkE8YF9UBwSPd900iYz4Lo1JWqcDslbUXS/xk7izH93wkAJZFiTO0oeMt2TagDR
 AJUpN4Ugo8GeuxPTu1b6Qtzt2L/Qp0+qCVMV8YLmQafSWfvX66/6ZgbkGNLPv4NRoIHV
 yQ+JWwf3+N07CzCgslsimXdkM/wD09UL5Gm1CBiFACS+kii8unQiVsTskQJe7lWLKEzY
 tAy/9goc+S4trLwDsCGZZaxo8PsP6mRIk1dcQtFEiH8K1WIJjnaY9B5G0LxYF/h95iek
 coVpnigH0DoslYTMxiVMQf0rGSL3C8x1U+J0/jhoSqklFIcftGeKvNiWAPMj6+i5X9+i
 60/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKL1dxBgcGBlvy1+hwtBq+p1oVdp5FTO+vPpNkUHXAXuHe7Iz16ktrqZNICB7870IzyAPzgG9kbA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yz7woL2IM32m7LYPdHiTjJqRt9D13ESjQHphUs/wivnvI557eIF
 z2DsylMuLH74borue9Vz3/V1CjlwwcML3WyuREVQLioA3Rm7e9M+q7JZt+aIcDUNTQJIZDFLtQt
 CpK15Ym9nTxKZmxbC1afKqs80Pw3k32t9UghDx5rT0TgdO/ho+ekSSV13T9k38fQ8zVJkp+NtyY
 MsA2rZKI5FJs3bmwmDz5Q9QRxlDn9P8suBbztwLP9Wt6sv/h69
X-Gm-Gg: ASbGnct3XjYlW4LjSBEksgfRCKSpcG7BKiE1krsmAagFW7LgNs+fDpQRK9tcLnbmFmu
 9lEwtZJjS0PdtCo655LSH3VS9xkq9H1VDMejz4KNAlTX6oitqHw==
X-Received: by 2002:a17:907:7ba8:b0:aa6:7c8e:8087 with SMTP id
 a640c23a62f3a-ab38b1b4669mr2508908966b.12.1737661401717; 
 Thu, 23 Jan 2025 11:43:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaQlMp5FTCYi/neDeOQYo+So63fMDIzARzvqiMW7urZaWlrE67uGrWBic3XOHPgZ/MwwBQbNDR539YPrdquIw=
X-Received: by 2002:a17:907:7ba8:b0:aa6:7c8e:8087 with SMTP id
 a640c23a62f3a-ab38b1b4669mr2508905366b.12.1737661401267; Thu, 23 Jan 2025
 11:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20250123192058.2558-1-tanyaagarwal25699@gmail.com>
In-Reply-To: <20250123192058.2558-1-tanyaagarwal25699@gmail.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Thu, 23 Jan 2025 11:43:09 -0800
X-Gm-Features: AWEUYZngTXPGMoeyAfN22iSJQ2hdBPmkPmu8W9oGAU2fHIWnuUexnzyL8gzKv7U
Message-ID: <CAKCV-6swo49thNAsmBWPwM-foK=L2CFphLJxePC+WE5Ou1oBbg@mail.gmail.com>
To: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH] apparmor: fix typos and spelling errors
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
Cc: paul@paul-moore.com, apparmor <apparmor@lists.ubuntu.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 jmorris@namei.org, linux-security-module@vger.kernel.org,
 skhan@linuxfoundation.org, anupnewsmail@gmail.com, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Reviewed-by: Ryan Lee <ryan.lee@canonical.com>

On Thu, Jan 23, 2025 at 11:30=E2=80=AFAM Tanya Agarwal
<tanyaagarwal25699@gmail.com> wrote:
>
> From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
>
> Fix typos and spelling errors in apparmor module comments that were
> identified using the codespell tool.
> No functional changes - documentation only.
>
> Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
> This patch set is split into individual patches for each LSM
> to facilitate easier review by respective maintainers.
>
> Original discussion:
> https://lore.kernel.org/all/20250112072925.1774-1-tanyaagarwal25699@gmail=
.com
>
>  security/apparmor/apparmorfs.c | 6 +++---
>  security/apparmor/domain.c     | 4 ++--
>  security/apparmor/label.c      | 2 +-
>  security/apparmor/lsm.c        | 2 +-
>  security/apparmor/policy.c     | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorf=
s.c
> index 2c0185ebc900..0c2f248d31bf 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -43,7 +43,7 @@
>   * The interface is split into two main components based on their functi=
on
>   * a securityfs component:
>   *   used for static files that are always available, and which allows
> - *   userspace to specificy the location of the security filesystem.
> + *   userspace to specify the location of the security filesystem.
>   *
>   *   fns and data are prefixed with
>   *      aa_sfs_
> @@ -204,7 +204,7 @@ static struct file_system_type aafs_ops =3D {
>  /**
>   * __aafs_setup_d_inode - basic inode setup for apparmorfs
>   * @dir: parent directory for the dentry
> - * @dentry: dentry we are seting the inode up for
> + * @dentry: dentry we are setting the inode up for
>   * @mode: permissions the file should have
>   * @data: data to store on inode.i_private, available in open()
>   * @link: if symlink, symlink target string
> @@ -2244,7 +2244,7 @@ static void *p_next(struct seq_file *f, void *p, lo=
ff_t *pos)
>  /**
>   * p_stop - stop depth first traversal
>   * @f: seq_file we are filling
> - * @p: the last profile writen
> + * @p: the last profile written
>   *
>   * Release all locking done by p_start/p_next on namespace tree
>   */
> diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
> index 5939bd9a9b9b..d959931eac28 100644
> --- a/security/apparmor/domain.c
> +++ b/security/apparmor/domain.c
> @@ -755,7 +755,7 @@ static int profile_onexec(const struct cred *subj_cre=
d,
>                 /* change_profile on exec already granted */
>                 /*
>                  * NOTE: Domain transitions from unconfined are allowed
> -                * even when no_new_privs is set because this aways resul=
ts
> +                * even when no_new_privs is set because this always resu=
lts
>                  * in a further reduction of permissions.
>                  */
>                 return 0;
> @@ -926,7 +926,7 @@ int apparmor_bprm_creds_for_exec(struct linux_binprm =
*bprm)
>          *
>          * NOTE: Domain transitions from unconfined and to stacked
>          * subsets are allowed even when no_new_privs is set because this
> -        * aways results in a further reduction of permissions.
> +        * always results in a further reduction of permissions.
>          */
>         if ((bprm->unsafe & LSM_UNSAFE_NO_NEW_PRIVS) &&
>             !unconfined(label) &&
> diff --git a/security/apparmor/label.c b/security/apparmor/label.c
> index 91483ecacc16..8bcff51becb8 100644
> --- a/security/apparmor/label.c
> +++ b/security/apparmor/label.c
> @@ -1456,7 +1456,7 @@ bool aa_update_label_name(struct aa_ns *ns, struct =
aa_label *label, gfp_t gfp)
>
>  /*
>   * cached label name is present and visible
> - * @label->hname only exists if label is namespace hierachical
> + * @label->hname only exists if label is namespace hierarchical
>   */
>  static inline bool use_label_hname(struct aa_ns *ns, struct aa_label *la=
bel,
>                                    int flags)
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 1edc12862a7d..04bf5d2f6e00 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -2006,7 +2006,7 @@ static int __init alloc_buffers(void)
>          * two should be enough, with more CPUs it is possible that more
>          * buffers will be used simultaneously. The preallocated pool may=
 grow.
>          * This preallocation has also the side-effect that AppArmor will=
 be
> -        * disabled early at boot if aa_g_path_max is extremly high.
> +        * disabled early at boot if aa_g_path_max is extremely high.
>          */
>         if (num_online_cpus() > 1)
>                 num =3D 4 + RESERVE_COUNT;
> diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
> index d0244fab0653..5cec3efc4794 100644
> --- a/security/apparmor/policy.c
> +++ b/security/apparmor/policy.c
> @@ -463,7 +463,7 @@ static struct aa_policy *__lookup_parent(struct aa_ns=
 *ns,
>  }
>
>  /**
> - * __create_missing_ancestors - create place holders for missing ancesto=
res
> + * __create_missing_ancestors - create place holders for missing ancesto=
rs
>   * @ns: namespace to lookup profile in (NOT NULL)
>   * @hname: hierarchical profile name to find parent of (NOT NULL)
>   * @gfp: type of allocation.
> @@ -1068,7 +1068,7 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns=
, struct aa_label *label,
>                 goto out;
>
>         /* ensure that profiles are all for the same ns
> -        * TODO: update locking to remove this constaint. All profiles in
> +        * TODO: update locking to remove this constraint. All profiles i=
n
>          *       the load set must succeed as a set or the load will
>          *       fail. Sort ent list and take ns locks in hierarchy order
>          */
> --
> 2.39.5
>
>

