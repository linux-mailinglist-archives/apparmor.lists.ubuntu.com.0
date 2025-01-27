Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D364EA1DDA4
	for <lists+apparmor@lfdr.de>; Mon, 27 Jan 2025 21:59:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tcWCm-0004zq-1a; Mon, 27 Jan 2025 20:59:36 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tcWCk-0004zG-4K
 for apparmor@lists.ubuntu.com; Mon, 27 Jan 2025 20:59:34 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CB6723F299
 for <apparmor@lists.ubuntu.com>; Mon, 27 Jan 2025 20:59:33 +0000 (UTC)
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-aa63b02c69cso513406866b.0
 for <apparmor@lists.ubuntu.com>; Mon, 27 Jan 2025 12:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738011573; x=1738616373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gQGlNTxdBFzzr8vBchoLXLW34W904568hRvQiORagrs=;
 b=b2lcUUy/SiehjM/avKyufPTizLk1XgldcXT2/QMefKkeKFp7Qo8JhMYaim3mQhY7zX
 kNmpsFvU7Ux0x+XVdZKlLLIW3A+fTqMmUXz7wB1jmRH1S4hNBrsmcS7XZRFBRAQxDtWg
 1Cny6M8Ij2tzKkczSa38c9fb/FRX64WdClZ2ZIGBExHPeS9RDqNuN3w3hBuiVBx1mLpF
 CuzSDP3eH5MPcm85tnRdSNbx0dOMcw2Ciq8kvqGC3wqOkOTaT8tBLBnuWGZ88rHtwmrk
 8w42T2LMzetqwMOjIy1ElTxyJYnHUEdSdaWBjvQAU6uyPUF3C5Nnsu7qtuey+Xfj5M74
 7n3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1f7M2C40Hwdhzosa/lc5bVlHhG68aO0xER20ZA8Gi/HzOxZ3FV7HS/CTecrcqHlgM5oWJD/8L3Q==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwGSrAqdcTIyOqgHKOY33Or1PAX5NCBU6KKZ0x7lQMaTiC12hCu
 INkXkvMKPJNGJWrA4YHoUVVw24SSCqFZalBwoS1kGAgsUFPcb5oT/TtouDNv5hyNjps99loolAn
 ZfaHIIScOaSY9MS1AO7ISAig++3gKbfBI0HEhNrSpobpiXMYCJHVXnO2wcNPorL+6KL4BKh3fUp
 KXyN8GdxaXyibm3PUebOYltLRwbcIN+V1jhmGhm6rD94ZkiCdN08HhmNEA7ps=
X-Gm-Gg: ASbGncu0GHLXZo+9VyPTHVhneg5wzdGRp0VHIOyubwoh49lP81C7t2oJGfrbfmr83t2
 3HI/Y0qRHP9lWb44VLNrs/YE+60vjNflMxha1osyiWdvUxeiduk9qGBiZ5n7a
X-Received: by 2002:a17:907:7f26:b0:ab2:f255:59f5 with SMTP id
 a640c23a62f3a-ab6bbada799mr82490066b.16.1738011573255; 
 Mon, 27 Jan 2025 12:59:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENl/Z2UHRvb/N1dGDukBTnLoKCGZWuwO5l9LFHqTqir7HRPJ1sriCkV2rXrgh8NZj9dejS+DTR/WIIeul9qsc=
X-Received: by 2002:a17:907:7f26:b0:ab2:f255:59f5 with SMTP id
 a640c23a62f3a-ab6bbada799mr82488066b.16.1738011572880; Mon, 27 Jan 2025
 12:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20250127205404.3116679-1-mjguzik@gmail.com>
In-Reply-To: <20250127205404.3116679-1-mjguzik@gmail.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Mon, 27 Jan 2025 12:59:21 -0800
X-Gm-Features: AWEUYZnjUjiQ1zZWGav8HmNl07KvoOIluiSJmcazFZoE-1JpclxsniNKKfgRq7E
Message-ID: <CAKCV-6sRcOOcLOqc62PyUKqbmmqTOje8vf0kDhLdNKaa4r57_Q@mail.gmail.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH] apparmor: use the condition in AA_BUG_FMT
	even with debug disabled
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 paul@paul-moore.com, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

For the record, a previous patch that removes the sock variable was
previously accepted:
https://lists.ubuntu.com/archives/apparmor/2025-January/013449.html
(patch) and https://lists.ubuntu.com/archives/apparmor/2025-January/013463.=
html
(ack from John Johansen)

On Mon, Jan 27, 2025 at 12:54=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> =
wrote:
>
> This follows the established practice and fixes a build failure for me:
> security/apparmor/file.c: In function =E2=80=98__file_sock_perm=E2=80=99:
> security/apparmor/file.c:544:24: error: unused variable =E2=80=98sock=E2=
=80=99 [-Werror=3Dunused-variable]
>   544 |         struct socket *sock =3D (struct socket *) file->private_d=
ata;
>       |                        ^~~~
>
> Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> ---
>
> Plausibly the sock var wants to be eliminated altogether, but I just
> want this to build.
>
>  security/apparmor/include/lib.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/security/apparmor/include/lib.h b/security/apparmor/include/=
lib.h
> index 256f4577c653..d947998262b2 100644
> --- a/security/apparmor/include/lib.h
> +++ b/security/apparmor/include/lib.h
> @@ -60,7 +60,11 @@ do {                                                  =
               \
>  #define AA_BUG_FMT(X, fmt, args...)                                    \
>         WARN((X), "AppArmor WARN %s: (" #X "): " fmt, __func__, ##args)
>  #else
> -#define AA_BUG_FMT(X, fmt, args...) no_printk(fmt, ##args)
> +#define AA_BUG_FMT(X, fmt, args...)                                    \
> +       do {                                                            \
> +               BUILD_BUG_ON_INVALID(X);                                \
> +               no_printk(fmt, ##args);                                 \
> +       } while (0)
>  #endif
>
>  int aa_parse_debug_params(const char *str);
> --
> 2.43.0
>
>

