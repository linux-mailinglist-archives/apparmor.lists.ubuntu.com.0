Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA7EB26D33
	for <lists+apparmor@lfdr.de>; Thu, 14 Aug 2025 19:00:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1umbJI-00085O-AA; Thu, 14 Aug 2025 17:00:16 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1umbJG-00085F-3n
 for apparmor@lists.ubuntu.com; Thu, 14 Aug 2025 17:00:14 +0000
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 295673F798
 for <apparmor@lists.ubuntu.com>; Thu, 14 Aug 2025 17:00:13 +0000 (UTC)
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-e9319457c7eso1896261276.0
 for <apparmor@lists.ubuntu.com>; Thu, 14 Aug 2025 10:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755190811; x=1755795611;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QP4ipH5jMk3L5gWa/X4gYceDNltNECrFt8EHELNVrrA=;
 b=epDG5Oj2h8ai8sTZa2ZK/nuHJsncCpMz+k6H1sMbNlZ7DkTm6YuNYWAsVomgdQBfBy
 uqV8Bcd7b7pBsR2+yQRyb8ZGkoZs1rq9Jiufq/D5qqUCfZC4JlEmw/Vyz7JCl98w0mIF
 xyBiTMdI2399p/93mhXc6vPYP1/H01c8q2yk6a3DXF62PCZU2HbPhFpdSHLWNeNmYZH+
 rxSoLweA/wJKdd5A9VSkokkvKkzIm9LONT8yngz7qgurtHXyxtB+3oq/rs/OslOBbBKP
 qEiOEgKrbGuvbFDiFo8xSupioLvkCfqynjNsNGhKqv2LKRiXTs7M68km3qxonGIrRb82
 Uhcw==
X-Gm-Message-State: AOJu0YxXgusoV7PJ0bmKuU8SrbRRMdNpQJB7Wfswljsoir+3anTxCz2E
 Kgkykt9UvQjgVRe3ccxM7LVROs0apynw3bP/p1FfYypjzHXWmYy3tXSNoKu3/g6vS5ctQh3eoof
 GCmCS7ug23OavLY54kPHQUpBp88GPxhOplpzKQtNrpSB+06royUF4nHKr/8iq3x/MPRhkveJmGW
 yWaeHbTceU2aG5KSDD55k640kp+O2YqNelN8eQzbwG5rZtgi93kvqj6ulZ1YXq
X-Gm-Gg: ASbGnct0bTt6Y2iG7cn+BdQpKegagBA9ZiMJ7Yz65XSlhho0CnyUNp8osunl63gWnON
 oTDHNOlWtjNnOPHEiQiWfvfpGTV/8qKJ4GE4La52KGNiAe7DDGXgK3zNh4ZOOhCAj24EsY1uSCs
 pNbZl5Kl0B25ZFXPV2Rmxj
X-Received: by 2002:a25:dc86:0:b0:e90:679e:ba4 with SMTP id
 3f1490d57ef6-e931ee385a8mr3302867276.4.1755190811414; 
 Thu, 14 Aug 2025 10:00:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUOvn066rdd6Jd4SMIvry0lcQC4o8LBfBc8VJJemQ/WZq+q9nEmxOdVcmwAfXmLvtlTqJQPVz+aX0WTl/hOiM=
X-Received: by 2002:a25:dc86:0:b0:e90:679e:ba4 with SMTP id
 3f1490d57ef6-e931ee385a8mr3302804276.4.1755190810832; Thu, 14 Aug 2025
 10:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250813160148.132192-1-chandramohan.explore@gmail.com>
 <CAKCV-6tNEvLe=T5aNy10soxKzQ-0PXotJw=ZOZXdT4wg75vn5g@mail.gmail.com>
In-Reply-To: <CAKCV-6tNEvLe=T5aNy10soxKzQ-0PXotJw=ZOZXdT4wg75vn5g@mail.gmail.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Thu, 14 Aug 2025 09:59:59 -0700
X-Gm-Features: Ac12FXyiNIlv0D5bCsfEswsaQFex0U_cWqu8X6O_pdplTkE8P7fWyPxvdrYVPhI
Message-ID: <CAKCV-6ugJhDsH9SRiWnziZa7dNLbjTVO7X82_qwO8=1rF2i8CA@mail.gmail.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [apparmor] Fwd: [PATCH] apparmor: Remove unused value
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

---------- Forwarded message ---------
From: Ryan Lee <ryan.lee@canonical.com>
Date: Thu, Aug 14, 2025 at 9:59=E2=80=AFAM
Subject: Re: [PATCH] apparmor: Remove unused value
To: Chandra Mohan Sundar <chandramohan.explore@gmail.com>


On Wed, Aug 13, 2025 at 9:19=E2=80=AFAM Chandra Mohan Sundar
<chandramohan.explore@gmail.com> wrote:
>
> The value "new" is being assigned to NULL but that statement does not
>  have effect since "new" is being overwritten in the subsequent fallback =
case.
>
> Remove the unused value. This issue was reported by coverity static
> analyzer.
>
> Fixes: a9eb185be84e9 (apparmor: fix x_table_lookup)
> Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
> ---
>  security/apparmor/domain.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
> index 267da82afb14..9c0c7fa8de46 100644
> --- a/security/apparmor/domain.c
> +++ b/security/apparmor/domain.c
> @@ -592,7 +592,6 @@ static struct aa_label *x_to_label(struct aa_profile =
*profile,
>                 if (!new || **lookupname !=3D '&')
>                         break;
>                 stack =3D new;
> -               new =3D NULL;
>                 fallthrough;    /* to X_NAME */
>         case AA_X_NAME:
>                 if (xindex & AA_X_CHILD)
> --
> 2.43.0
>
>

Since v2 was posted just now I'm leaving a record through this reply
that this v1 is considered withdrawn.

Ryan

