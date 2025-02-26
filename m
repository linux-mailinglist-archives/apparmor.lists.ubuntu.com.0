Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AF9A46CD8
	for <lists+apparmor@lfdr.de>; Wed, 26 Feb 2025 22:00:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tnOWB-0000V6-Ly; Wed, 26 Feb 2025 21:00:35 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tnOW9-0000Ux-8q
 for apparmor@lists.ubuntu.com; Wed, 26 Feb 2025 21:00:33 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BC7373F299
 for <apparmor@lists.ubuntu.com>; Wed, 26 Feb 2025 21:00:32 +0000 (UTC)
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab397fff5a3so31399466b.1
 for <apparmor@lists.ubuntu.com>; Wed, 26 Feb 2025 13:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740603632; x=1741208432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P6QALNDPCtlffOHZspUQT1gLu++3wBekVJ/Z3Vv0TmQ=;
 b=iK12Cnkq+SZzR632T7/vWVlKVu1hGIDzxlPkhdJRhKEHB13WVj2aBlvWli/acqKYiv
 EroPc3AQeUPtGs8VYswFBFZuAqVnJPORP2uKs/lr+QqkvmpDaaPPRW15JQlR107Wv3++
 VZEa5gGja15J7D7SgdrmP1GiQZNt1VUtL8GmIiy3aj/k2RPaJ5J+IqFu238EA/3mUVtM
 pN4mlemxuEZLEyBNRpeG+9+62sDdEh9xtAS5TLz+O94ImZ8NgGBoqo9jiWgIHywlGoNG
 14iHhp9A8ZTho1x7xs7KEoPpJ+rOu/WXwE/jK5plZhUYD7EtDs3GI50Zu+fOupwaNZR/
 wJ1g==
X-Gm-Message-State: AOJu0YwlgVfPnqJ3pHEc244Y0S0GFWkoUEUnXmbu1DyU9KT3doA8dAZv
 DNfYcdxCXj5KpAulFtYO7Apl4dQM60pvf9VAzEj6K52wBgtg+if4CRR+AXnf2SECbGdKMe+QNny
 CgzfIgJawuRHO3MK44hL49/63SfvUKmtTBVLzX0QEyIqobrLS+PlXDU2j5nPrPu13TQX6pF2d9a
 xE6/dfSMm7/jdABD8gDv7W1O+H0ZiO9IPQbKjJd9xlSI1/MA5f
X-Gm-Gg: ASbGncsXk6ElOOAidOX305T3CUPi8hTUhUQYl7pwNmsqQvZE7uHXJUhoWvf81E0uIgo
 JST+a9YMlo5D1wWWhhf2FuyMIMscwgiJ3VzNABqGANIZyzPimYMsZZU3SMdqj4HPhUQMNJrQ=
X-Received: by 2002:a17:907:6c0f:b0:abb:e6dc:f615 with SMTP id
 a640c23a62f3a-abf062db242mr145746266b.23.1740603631897; 
 Wed, 26 Feb 2025 13:00:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnf2b6kHndbWyPDyOBffVP6EuVil44gGa037tLYvaWq2Fqi276U/QpwW/7pmONWRPYJVbgaqdXJMQVpkd4Ylo=
X-Received: by 2002:a17:907:6c0f:b0:abb:e6dc:f615 with SMTP id
 a640c23a62f3a-abf062db242mr145739666b.23.1740603631494; Wed, 26 Feb 2025
 13:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20250225232034.40309-1-hector.cao@canonical.com>
In-Reply-To: <20250225232034.40309-1-hector.cao@canonical.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Wed, 26 Feb 2025 13:00:20 -0800
X-Gm-Features: AQ5f1Jp_HmVrZ0d6BmhJPU1ftueS35j7NowQoru9wXEyjUAYHzs_jkLK1NbeRQg
Message-ID: <CAKCV-6sxVJ5GZoBM60iWMpdu48skf1H3N469OhR3_GDGFzwawg@mail.gmail.com>
To: Hector Cao <hector.cao@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH v2] Add abstract profile for libnuma
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

On Tue, Feb 25, 2025 at 3:21=E2=80=AFPM Hector Cao <hector.cao@canonical.co=
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
>  profiles/apparmor.d/abstractions/libnuma | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 profiles/apparmor.d/abstractions/libnuma
>
> diff --git a/profiles/apparmor.d/abstractions/libnuma b/profiles/apparmor=
.d/abstractions/libnuma
> new file mode 100644
> index 000000000..e06e03299
> --- /dev/null
> +++ b/profiles/apparmor.d/abstractions/libnuma
> @@ -0,0 +1,22 @@
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
> +
> +  # Include additions to the abstraction
> +  include if exists <abstractions/libnuma.d>
> --
> 2.45.2
>

Reviewed-by: Ryan Lee <ryan.lee@canonical.com>

