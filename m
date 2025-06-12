Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 993F2AD7D61
	for <lists+apparmor@lfdr.de>; Thu, 12 Jun 2025 23:24:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uPpPX-0006LS-0b; Thu, 12 Jun 2025 21:24:35 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uPpPV-0006L9-Nv
 for apparmor@lists.ubuntu.com; Thu, 12 Jun 2025 21:24:33 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6E7313F826
 for <apparmor@lists.ubuntu.com>; Thu, 12 Jun 2025 21:24:33 +0000 (UTC)
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ade0abc1ce0so143540766b.3
 for <apparmor@lists.ubuntu.com>; Thu, 12 Jun 2025 14:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749763473; x=1750368273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4gcL8sGzYrzaPYqvVot2EPtjJbX2EirOWIBuOFVXeGo=;
 b=o/+dYQw7QYqsAWBGR8xWnCzvhL0krVOiYTM7BZcjjy+WomQ6vOhJLYjuKvbksBIrsQ
 p9EiooLbgtvJDTN8QycEXenTQP4rEg6Vme1YWzbTUlp2ZwwHLYgjfvUF2LcSDt6XcFyi
 AFdPeKU0Z7vOLZqKFEuVFK9SCE4c/1WRV9h0w/uiECAtyJlEq1El3uwkWZjOdJEfqxIp
 YRbRiRs54dUezrZlril08OaV7vmxST2JNAJbFgpF7/D/Q3Y1/yAUsMS6SnuL1+NTqbTv
 XscTSYgcE9Po2cHkrPfopRPOchrb/x4ELKwaivakQKfAGUGOfIwHtXk07wc3UGH7KFB8
 Nhqw==
X-Gm-Message-State: AOJu0YxIOBYnVM2QZZ7jHVMyme7lgdg8zji0IXPoPkf2fZI2kiKOhkG5
 zSqXt4NDIpWszPUFUQfCSMgN3tn6LPqUl+k/U88H4X3pEUiwxgXOuY4IhEvZEXAEeFREj4cfFU5
 VRTZ5Dx8l3DaYkmNBIh8PfwN6xXy2YLbgkHE+E0Xq/mpmxyIsXwH5Pu77IdLgbOCL+ANGJdLi5Y
 3c/WDSWr9ak+mJG28l9vpWLZ2Nwsu948fcSu3WC/PLIpYxnIVn5n30RZYERid3Wno=
X-Gm-Gg: ASbGnctwQWlcTq1k9pYFOadMKDbX6gBmtpQCcmh3vQRonwnEeNeh0QQTBD9bBwDQoar
 Oz1Y2LpvgHUc1prsNKYZQBpsnVMUbsCNkeIhnY8srIZgh6BxYVKuTR5h3FjZEqu3kttjtTysoFI
 tHXKQ=
X-Received: by 2002:a17:906:ef06:b0:ad5:3156:2c06 with SMTP id
 a640c23a62f3a-adec5ca99d6mr52991666b.28.1749763473000; 
 Thu, 12 Jun 2025 14:24:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1/JGXk3c0ofbmywL19CdFmfm+eIulrB0z5SWRL4WKRhEyRJIDUe8Fbzugtwx/Jb2oYHfg6AZzs811bIL4a1M=
X-Received: by 2002:a17:906:ef06:b0:ad5:3156:2c06 with SMTP id
 a640c23a62f3a-adec5ca99d6mr52990466b.28.1749763472665; Thu, 12 Jun 2025
 14:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250502005558.8257-1-ryan.lee@canonical.com>
 <20250502005558.8257-5-ryan.lee@canonical.com>
In-Reply-To: <20250502005558.8257-5-ryan.lee@canonical.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Thu, 12 Jun 2025 14:24:21 -0700
X-Gm-Features: AX0GCFvGWMvdBowOrekR6xpEv1ZLspWetXlJ0Lul5A04qtf6qBMEoQ4CzQdeiwc
Message-ID: <CAKCV-6sayjRKjAw+jSShNzvNs8oO5RjSbuc7PAyWoUapvB+bAQ@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH 4/4] apparmor: force auditing of conflicting
 attachment execs from confined
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

Update: turns out that this patch has a small but critical
typographical error (both the perms modification lines should be under
the conditional in braces), so we'll be sending a fixed patch as a v2.

On Thu, May 1, 2025 at 5:56=E2=80=AFPM Ryan Lee <ryan.lee@canonical.com> wr=
ote:
>
> Conflicting attachment paths are an error state that result in the
> binary in question executing under an unexpected ix/ux fallback. As such,
> it should be audited to record the occurrence of conflicting attachments.
>
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
> ---
>  security/apparmor/domain.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
> index e8cd9badfb54..b33ce6be9427 100644
> --- a/security/apparmor/domain.c
> +++ b/security/apparmor/domain.c
> @@ -724,6 +724,14 @@ static struct aa_label *profile_transition(const str=
uct cred *subj_cred,
>                 new =3D x_to_label(profile, bprm, name, perms.xindex, &ta=
rget,
>                                  &info);
>                 if (new && new->proxy =3D=3D profile->label.proxy && info=
) {
> +                       /* Force audit on conflicting attachment fallback
> +                        * Because perms is never used again after this a=
udit
> +                        * we don't need to care about clobbering it
> +                        */
> +                       if (info =3D=3D CONFLICTING_ATTACH_STR_IX
> +                          || info =3D=3D CONFLICTING_ATTACH_STR_UX)
> +                               perms.audit |=3D MAY_EXEC;
> +                               perms.allow |=3D MAY_EXEC;
>                         /* hack ix fallback - improve how this is detecte=
d */
>                         goto audit;
>                 } else if (!new) {
> --
> 2.43.0
>

