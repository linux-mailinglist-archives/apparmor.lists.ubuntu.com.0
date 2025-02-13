Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CE20BA34E20
	for <lists+apparmor@lfdr.de>; Thu, 13 Feb 2025 19:57:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tieOl-0001l6-Ip; Thu, 13 Feb 2025 18:57:19 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tieOk-0001kp-D0
 for apparmor@lists.ubuntu.com; Thu, 13 Feb 2025 18:57:18 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8558D3F277
 for <apparmor@lists.ubuntu.com>; Thu, 13 Feb 2025 18:57:17 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5dedc89fa85so79392a12.2
 for <apparmor@lists.ubuntu.com>; Thu, 13 Feb 2025 10:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739473037; x=1740077837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPm2tpub5RHpk/eJF5Nqi9G5daAmPsIuINqxI4vXwEo=;
 b=gKP0rvxhITtqG9LisHyrTdjF7lYCpr/qAjjKm7CScjOF1fUjteeEECMjDvJM9V0ctc
 wXqRnaN3kG2uyeA7roNM59I8SErzdA5ByrVdYxEF3pgP4GVxRW4zItMXA0/nzpbP2BZw
 7vkZIDbC9LBnlmKGxJO091d85evggo3YJVl0jIh3l0nI357q/plCxxywMAQmS3UZzuJC
 yCdpVdrIB1Tv0UME41gshR21dp4ubYBLK7B5uPi9HRTbQIFs67nvgqFxpvAqh5ckErLa
 66/0tQAK+AXI3MWLuY//nawHK23hAc7aXou0lPty941U2tsMozofgdesXit8L70pjKB1
 esTg==
X-Gm-Message-State: AOJu0Ywd7+wfG2Y4d8oP5MQNwJF8zlQL0JUcJ5T+gME8RHtcxzlbxgZi
 ITIt51ZgWY7CRylFX0uyVa/eQ7GPj6yQEX+SZ89Eh5bvliUY0EF5fzum7k+UMKdLUBnuayGWDdD
 56YpGr7Wk1ZG0yXvHywFbESyxUVhP3TNu6/MkdGfEQfJ1a4aoIxAkoKWyNOJUwfDKxCWSReu1gS
 LTDux91CvKRBk01h9wyLC5UZAsgPIEFQP32m4oK/nvteHMlJSoRyAVJQU+
X-Gm-Gg: ASbGncsjC5SOhxsKT3+vCo6QxBhiRqG22ZAEyhKVRAzCmgU8TaAzQUg1oG7Fs7ygnYv
 ynqhdtFhynNjLtw5yg2IQ5QFh/ex86n+Dj4hop7YoJxb2t+uCZGAyaQoDnFPC
X-Received: by 2002:a05:6402:2791:b0:5d0:c697:1f02 with SMTP id
 4fb4d7f45d1cf-5dec9d4b44emr9195527a12.17.1739473037088; 
 Thu, 13 Feb 2025 10:57:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcgL8HYO1PE6NDbMhf5Ab/vGE+QtZNL4LiKQugGWs3rofAokUdpkGKWqSLpKHMhiCn0XM5VWb9yUFHbj14ivg=
X-Received: by 2002:a05:6402:2791:b0:5d0:c697:1f02 with SMTP id
 4fb4d7f45d1cf-5dec9d4b44emr9195462a12.17.1739473036624; Thu, 13 Feb 2025
 10:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20250213155741.1619500-1-hector.cao@canonical.com>
In-Reply-To: <20250213155741.1619500-1-hector.cao@canonical.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Thu, 13 Feb 2025 10:57:04 -0800
X-Gm-Features: AWEUYZmqAUbAIvge8mERlPMS_nosEBhKNFp1n2F6iidrRIAYkJaEZnv78v5VFYA
Message-ID: <CAKCV-6v4MxM71sfp4E+s9WSyiQnXgSU6K7Ep9cA_Df3mA-q+sg@mail.gmail.com>
To: Hector Cao <hector.cao@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH v2] Allow access to sys devices nodes for
	libnuma
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

On Thu, Feb 13, 2025 at 7:58=E2=80=AFAM Hector Cao <hector.cao@canonical.co=
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
> Allow access to this sysfs folder so that we do not have to
> specify this permission for every executable linked to libnuma

IMO this should go into a dedicated numa abstraction and not be added
to abstractions/base.

>
> Changes in v2:
>   - Fix typo: add missing ending '/' character to the path
>
> Signed-off-by: Hector Cao <hector.cao@canonical.com>
> ---
>  profiles/apparmor.d/abstractions/base | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/profiles/apparmor.d/abstractions/base b/profiles/apparmor.d/=
abstractions/base
> index bf3f3184e..52cbab920 100644
> --- a/profiles/apparmor.d/abstractions/base
> +++ b/profiles/apparmor.d/abstractions/base
> @@ -108,6 +108,8 @@
>    @{sys}/devices/system/cpu/       r,
>    @{sys}/devices/system/cpu/online r,
>    @{sys}/devices/system/cpu/possible r,
> +  # runtime initialization for binaries linked to libnuma
> +  @{sys}/devices/system/node/     r,
>
>    # transparent hugepage support
>    @{sys}/kernel/mm/transparent_hugepage/hpage_pmd_size r,
> --
> 2.45.2
>
>

