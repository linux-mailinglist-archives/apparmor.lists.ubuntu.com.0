Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F59864E0
	for <lists+apparmor@lfdr.de>; Wed, 25 Sep 2024 18:33:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1stUwf-0008Na-0T; Wed, 25 Sep 2024 16:32:53 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1stUwd-0008NS-8h
 for apparmor@lists.ubuntu.com; Wed, 25 Sep 2024 16:32:51 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B301B40645
 for <apparmor@lists.ubuntu.com>; Wed, 25 Sep 2024 16:32:50 +0000 (UTC)
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a8d1095442cso1807166b.3
 for <apparmor@lists.ubuntu.com>; Wed, 25 Sep 2024 09:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727281970; x=1727886770;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SbrFeLJ44019vRMaM4LAncIsy3Bp1ouyZlJtynfIn3M=;
 b=vP5EGpXF1BD7B7cUxUrJZ7HR0pOfTqEn7mZ67Wj9b6T5/oqWnzMhkycotGfNbnM8Lh
 0WjPuJgDVqlptJN98zaE/jXCGGg6PgQoR1dYLdjUzILFiARqMaG7SszSFNOJU18SObLd
 pBCY3Eh4koai60DLTqKDm9VnWzhdLOxh4RL1V76DoyeeVxjwka76UIbJGtMkRkhlLkFC
 RIHW5fDSlBmQRghKxF4m+Z8KtEJaOzzS2/zRG0a4UGCi+n88VYcKxhmjpZjQ6o792VK1
 d0ibywVNiliJsBNFBxTnsqa1OdWeuCz114sb+cTfdsW6TqSK7Da1iQ6q0WIAMdqtQchX
 RpUQ==
X-Gm-Message-State: AOJu0Yw4/kXHnNKrebJ+NxZfyZvKVTychzQHiicwvIGAQM+LjR645086
 G03SJ7nC5eDX9bKyuYGOfwOgDzxt52yKymT9blidZVCiZeX2NXAvYkisMv8wLXdI5lpQfPq7G1H
 h7HfUwhqXr+EH7eCL7Ebaab/Q6z4exrhWtiZ5JBjdrok6sbBe4Efrwk7WRqxhHwKJHj972lOr06
 2tUqT0bTbPHSsgZeHv575geXTUJy7g78/+bLw5PpJ2Wt2J0t8jlEdYhst6
X-Received: by 2002:a17:907:f14d:b0:a8b:6ee7:ba26 with SMTP id
 a640c23a62f3a-a93a0322a63mr310998066b.1.1727281970209; 
 Wed, 25 Sep 2024 09:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyhjAsou5xg1ATUQUZn/TpH/Oy6SGvWoM0Kq3C38Mlo5+Tmk13E7+mzUM9r1mFE3s//wEUcv3dWOZjBVNt33Y=
X-Received: by 2002:a17:907:f14d:b0:a8b:6ee7:ba26 with SMTP id
 a640c23a62f3a-a93a0322a63mr310995966b.1.1727281969749; Wed, 25 Sep 2024
 09:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240913232104.1632869-1-ryan.lee@canonical.com>
In-Reply-To: <20240913232104.1632869-1-ryan.lee@canonical.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Wed, 25 Sep 2024 09:32:37 -0700
Message-ID: <CAKCV-6vAQ0bH9KcVhAAJVZaaLmpjmrh2uygeQnpOReM=krTN=A@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [RFC,
 PATCH 1/3] apparmor: add a cache entry expiration time aging out
 capability audit cache
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Noting for additional clarity that I have withdrawn this RFC patchset
in favor of a later PATCH v2 with the same subject line.

On Fri, Sep 13, 2024 at 4:21=E2=80=AFPM Ryan Lee <ryan.lee@canonical.com> w=
rote:
>
> When auditing capabilities, AppArmor uses a per-CPU, per-profile cache
> such that the same capability for the same profile doesn't get repeatedly
> audited, with the original goal of reducing audit logspam. However, this
> cache does not have an expiration time, resulting in confusion when a
> profile is shared across binaries (for example) and an expected DENIED
> audit entry doesn't appear, despite the cache entry having been populated
> much longer ago. This confusion was exacerbated by the per-CPU nature of
> the cache resulting in the expected entries sporadically appearing when
> the later denial+audit occurred on a different CPU.
>
> To resolve this, record the last time a capability was audited for a
> profile and add a timestamp expiration check before doing the audit. This
> first patch hardcodes a small duration for the timeout period.
>
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
> ---
>  security/apparmor/capability.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/security/apparmor/capability.c b/security/apparmor/capabilit=
y.c
> index 7c0f66f1b297..64005b3d0fcc 100644
> --- a/security/apparmor/capability.c
> +++ b/security/apparmor/capability.c
> @@ -12,6 +12,7 @@
>  #include <linux/errno.h>
>  #include <linux/gfp.h>
>  #include <linux/security.h>
> +#include <linux/timekeeping.h>
>
>  #include "include/apparmor.h"
>  #include "include/capability.h"
> @@ -33,6 +34,8 @@ struct aa_sfs_entry aa_sfs_entry_caps[] =3D {
>  struct audit_cache {
>         struct aa_profile *profile;
>         kernel_cap_t caps;
> +       /* Capabilities go from 0 to CAP_LAST_CAP */
> +       u64 ktime_ns_last_audited[CAP_LAST_CAP+1];
>  };
>
>  static DEFINE_PER_CPU(struct audit_cache, audit_cache);
> @@ -65,6 +68,8 @@ static void audit_cb(struct audit_buffer *ab, void *va)
>  static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile =
*profile,
>                       int cap, int error)
>  {
> +       const u64 AUDIT_CACHE_TIMEOUT_NS =3D 100*1000; /* 100 us */
> +       u64 audit_cache_expiration;
>         struct aa_ruleset *rules =3D list_first_entry(&profile->rules,
>                                                     typeof(*rules), list)=
;
>         struct audit_cache *ent;
> @@ -90,7 +95,9 @@ static int audit_caps(struct apparmor_audit_data *ad, s=
truct aa_profile *profile
>
>         /* Do simple duplicate message elimination */
>         ent =3D &get_cpu_var(audit_cache);
> -       if (profile =3D=3D ent->profile && cap_raised(ent->caps, cap)) {
> +       audit_cache_expiration =3D ent->ktime_ns_last_audited[cap] + AUDI=
T_CACHE_TIMEOUT_NS;
> +       if (profile =3D=3D ent->profile && cap_raised(ent->caps, cap)
> +                       && ktime_get_ns() <=3D audit_cache_expiration) {
>                 put_cpu_var(audit_cache);
>                 if (COMPLAIN_MODE(profile))
>                         return complain_error(error);
> @@ -99,6 +106,7 @@ static int audit_caps(struct apparmor_audit_data *ad, =
struct aa_profile *profile
>                 aa_put_profile(ent->profile);
>                 ent->profile =3D aa_get_profile(profile);
>                 cap_raise(ent->caps, cap);
> +               ent->ktime_ns_last_audited[cap] =3D ktime_get_ns();
>         }
>         put_cpu_var(audit_cache);
>
> --
> Major items I'm seeking input on (reason for RFC designation):
> - Whether storing a timestamp per capability is the best approach or whet=
her we should do something else
> - Whether to hardcode the expiration offset or whether to expose it as a =
sysctl (see PATCH 3/3 of this series)
>

