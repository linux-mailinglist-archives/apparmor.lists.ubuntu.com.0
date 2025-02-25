Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B37A450D1
	for <lists+apparmor@lfdr.de>; Wed, 26 Feb 2025 00:07:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tn413-00063c-H6; Tue, 25 Feb 2025 23:07:05 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tn411-00063N-Pu
 for apparmor@lists.ubuntu.com; Tue, 25 Feb 2025 23:07:03 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 556D0419E2
 for <apparmor@lists.ubuntu.com>; Tue, 25 Feb 2025 23:07:03 +0000 (UTC)
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab397fff5a3so29307366b.1
 for <apparmor@lists.ubuntu.com>; Tue, 25 Feb 2025 15:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740524822; x=1741129622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhxVVWyCQwfXKmSkilBOWUiNAHgY5P4t03n0ihpvcLY=;
 b=h0sF2JYrBp8FOiIa2jytegXnfDakUYtxjk7td7eB/jBlHDsTjgHNAycDFBToJF9Uyy
 1JNPy3yK0gMoO0HK+Odfe6bcWsoYU452nRRrKEkHOllTVAAGzhs/FfTNo14W6vAMf2I0
 YkW1LyCYlU1jRd6ymPaOSnBhODJAnZAU456ds59YKTg7nE+TqdzKkAbFmw/tcyiRy/a4
 6EBL+qLr/lCDXtRIrudjhL5KBTkMdNIa2LOjZiOsCzV+mPYmUe9ZDbbgavawrbJWFjTB
 EBmd8ELa8Uw/RtO/4akJMTU/Eqr7mtGN+gP3N3HSjoyLtEa7PokJ5KLbYxO7CIEg/kqZ
 x+2w==
X-Gm-Message-State: AOJu0YznREoCy5NePENlzGHlsX1PJR4PiIFzWTm2oMx5G2+qbAEK0pN4
 +VhnArt38NqIkwXQJ6es8bHWTQFFwdZbGHjU87weQ89moKJXpyzOlGPve96GArpBTg6WJdfue2s
 kvYZ3Py2Zwoy99f4JqUkMmXM6bCxUT+O8YX2LIwd5hv+SA79SSYdpHnci1XtxiMtaS3v4Nk6gRJ
 jomfReAhJODV4pAwgT0XzEqDQ2pgsMdds1FQ/q5h+FyeYMG6Ul
X-Gm-Gg: ASbGncssXAoF/yUG7lGHKGUWXofrfZsf7NCjYF+G4YzbaBLWSl3Z58oiqK6BBC9V25I
 6u/DSpAAQOim3TFrIIQP7OKF60FJc99I0PORwi7xuyiNYaxoHx6vm1pHbk68iVE1jPTh2fq4=
X-Received: by 2002:a17:907:180a:b0:abb:b533:3e82 with SMTP id
 a640c23a62f3a-abbeded95ccmr2025965266b.20.1740524822636; 
 Tue, 25 Feb 2025 15:07:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgKZgl7AEZTrPB5Rd4KnJxeRdpuzSeg8OvEMqgl4xnGDtwYORQWc2acWhNMbV3ow2bosg0O59GND3TbLmxOnE=
X-Received: by 2002:a17:907:180a:b0:abb:b533:3e82 with SMTP id
 a640c23a62f3a-abbeded95ccmr2025963566b.20.1740524822159; Tue, 25 Feb 2025
 15:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20250225090629.6741-1-hector.cao@canonical.com>
In-Reply-To: <20250225090629.6741-1-hector.cao@canonical.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Tue, 25 Feb 2025 15:06:51 -0800
X-Gm-Features: AWEUYZntremFhBL6wombEPLoBK23LgCT4a_Krj6QXahAJmqChwqlfdDa60GU7O0
Message-ID: <CAKCV-6tJRO=1Yp=9aAoaDFOUX=5zBX+wYRvkibt0TDpHi1mnUw@mail.gmail.com>
To: Hector Cao <hector.cao@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH] Add abstract profile for libnuma
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Feb 25, 2025 at 1:06=E2=80=AFAM Hector Cao <hector.cao@canonical.co=
m> wrote:
>
> For executables dynamically linked to libnuma, the runtimer linker
> invokes libnuma functions (num_init) that try to access
> /sys/devices/system/node/ and if the application's apparmor
> profile does not allow this access, this access will be denied
> by apparmor with following error message:
>
>   apparmor=3D"DENIED" operation=3D"open" class=3D"file"
>   name=3D"/sys/devices/system/node/" comm=3D"qemu-bridge-hel"
>   requested_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
>
> Here is the simplified call trace:
>
>   0 ... in ?? () from /lib/x86_64-linux-gnu/libnuma.so.1
>   1 ... in call_init (...) at ./elf/dl-init.c:74
>   2 ... in call_init (...) at ./elf/dl-init.c:120
>   3 _dl_init (...) at ./elf/dl-init.c:121
>   4 ... in _dl_start_user () from /lib64/ld-linux-x86-64.so.2
>
> This commit adds an abstract profile that applications that are
> linked to libnuma can include in their apparmor profile.
>
> Signed-off-by: Hector Cao <hector.cao@canonical.com>
> ---
>  profiles/apparmor.d/abstractions/libnuma | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 profiles/apparmor.d/abstractions/libnuma
>
> diff --git a/profiles/apparmor.d/abstractions/libnuma b/profiles/apparmor=
.d/abstractions/libnuma
> new file mode 100644
> index 000000000..9126294c4
> --- /dev/null
> +++ b/profiles/apparmor.d/abstractions/libnuma
> @@ -0,0 +1,19 @@
> +# vim:syntax=3Dapparmor
> +# ------------------------------------------------------------------
> +#
> +#    Copyright (C) 2025 Canonical Ltd.
> +#
> +#    This program is free software; you can redistribute it and/or
> +#    modify it under the terms of version 2 of the GNU General Public
> +#    License published by the Free Software Foundation.
> +#
> +# ------------------------------------------------------------------
> +
> +  abi <abi/4.0>,
> +
> +  # this abstract profile can be included by applications that are
> +  # dynamically linked to libnuma
> +  # libnuma defines the function num_init() as the .init function
> +  # to be called by the runtime linker (ld) when libnuma is loaded
> +
> +  @{sys}/devices/system/cpu/node/ r,

To allow local additions to the abstraction, please add "include if
exists <abstractions/libnuma.d>" to the end of the abstraction. You
can see examples of such include lines in e.g. the upstream
abstractions/nameservice.

> --
> 2.45.2
>
>

