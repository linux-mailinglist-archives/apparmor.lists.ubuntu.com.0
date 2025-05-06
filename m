Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 48438AACBDD
	for <lists+apparmor@lfdr.de>; Tue,  6 May 2025 19:07:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCLlX-0000KB-SO; Tue, 06 May 2025 17:07:35 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uCLlU-0000En-WA
 for apparmor@lists.ubuntu.com; Tue, 06 May 2025 17:07:33 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2318B3F174
 for <apparmor@lists.ubuntu.com>; Tue,  6 May 2025 17:07:32 +0000 (UTC)
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-acf0113e311so524841766b.1
 for <apparmor@lists.ubuntu.com>; Tue, 06 May 2025 10:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746551251; x=1747156051;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WQHjxQ599keg+lxgKKgv5hY1aqkd9MG97ygANGkcWy4=;
 b=t8++Ps9x4AZbzHyLsyCBjt/BF/rycz2v4hZxdqtCkbcDH+ZYfxuVAUn0sxtCBwTq86
 CBWzxJOhJhITFKu90gmFMVmhK7QJxIh//nPjd0PwxFpD93z+MlwmdwtmLxYLeTO2qCBK
 WvfNLgX4DN+EOIv4rOHcEF7GrT9m92RuZsZDgOb5CmI6CrW6QeqEyCfqh8YFQTNucSom
 QOJCDozVMNyKlj0qN47H/5oCE/MAoVdU6rKd+Cr4m8Nz1AfBl8q/nCZUdBKt+6M14qMz
 TdcBNKGWjYDbI8/Abeanm0IWrOt6sXuAoCrx1ppNDZOYh5ZOXu37CoHdj+Lu50qRMXna
 mCNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdPnMWYCHx9HJWsqk7FUjqyHxVDKVlwuQ44S9/hosmfTo42bc2IOJZM4vemItIVtab6aHfiHahqw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwoKwc/PymTLwQ1ziIYcwUkIMjq5anIdFfCmMKOjB5bhT4HFBzj
 Wa2YqGd5RaEblOKWR9JN1J6cXtDgSHjeU6Q0VBnnAS50c/T5GE5wPztSJmxjPn0dSLFRXL7bTFs
 JyWHSVRqa/k3lfwgz4ppvhS+VMKPyp3wdoWSNwuLjItbYBWyTV2DinemO2AhzLZwzMt1leb7w1S
 KefdxFfUCz2WE24nl30eqClEypMOxXBU/j/6tKGiTrUz+XhW/c
X-Gm-Gg: ASbGncs0wm00RGQfS7xcw65Dso1BqCRbvxdBxeGZXXWKmIpTVVkuZVAhwd5ZU/tSoes
 TduaqIHaSpcaybcc1om2mVV6G28SDlD9InmW14/jMa0EO2z3xoOdclfLFdqk3mnq7Aw2o
X-Received: by 2002:a17:907:a4c1:b0:acf:c80d:ad81 with SMTP id
 a640c23a62f3a-ad1e8d03300mr24484366b.39.1746551251640; 
 Tue, 06 May 2025 10:07:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEELCfRqIOuYUnndVtrp9GHbcIPFv6oQ0mX4mJunFchFQKzR4N7i7UxFMlcDKaCqsfET+x4XtS3/doFGJc8mF0=
X-Received: by 2002:a17:907:a4c1:b0:acf:c80d:ad81 with SMTP id
 a640c23a62f3a-ad1e8d03300mr24480566b.39.1746551251309; Tue, 06 May 2025
 10:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250506170425.152177-1-colin.i.king@gmail.com>
In-Reply-To: <20250506170425.152177-1-colin.i.king@gmail.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Tue, 6 May 2025 10:07:17 -0700
X-Gm-Features: ATxdqUGnt11yRJyWyktYtIrCkZT5mDo5sbrkN2hZjNJrjV5n2rzCVahg-DNhbLY
Message-ID: <CAKCV-6uAdn9SvUFrYqGo0ZzJUtPAYgRFcfHPgmrG_GDt2Ob6Hg@mail.gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH][next] apparmor: Fix incorrect
	profile->signal range check
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
Cc: Paul Moore <paul@paul-moore.com>, kernel-janitors@vger.kernel.org,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, May 6, 2025 at 10:04=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> The check on profile->signal is always false, the value can never be
> less than 1 *and* greater than MAXMAPPED_SIG. Fix this by replacing
> the logical operator && with ||.
>
> Fixes: 84c455decf27 ("apparmor: add support for profiles to define the ki=
ll signal")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  security/apparmor/policy_unpack.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy=
_unpack.c
> index 73139189df0f..e643514a3d92 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -919,7 +919,7 @@ static struct aa_profile *unpack_profile(struct aa_ex=
t *e, char **ns_name)
>
>         /* optional */
>         (void) aa_unpack_u32(e, &profile->signal, "kill");
> -       if (profile->signal < 1 && profile->signal > MAXMAPPED_SIG) {
> +       if (profile->signal < 1 || profile->signal > MAXMAPPED_SIG) {
>                 info =3D "profile kill.signal invalid value";
>                 goto fail;
>         }
> --
> 2.49.0
Reviewed-by: Ryan Lee <ryan.lee@canonical.com>

>
>

