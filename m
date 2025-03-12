Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D36A5E310
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 18:47:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsQAw-0002KU-Py; Wed, 12 Mar 2025 17:47:26 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsQAv-0002KM-81
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 17:47:25 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3A0593F2B2
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 17:47:23 +0000 (UTC)
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ac29ae0b2fbso13715966b.0
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 10:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741801642; x=1742406442;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIJHcv/bsTL5KI57ZzyPmPzg7AJiLzC5syREpVAi/Yo=;
 b=lQf7ZyIg1dLXf5m+9djBvi08FjcWHwJ+YzW62NKuOa/9S6I57QQG3x+nZzpR20QVcT
 3fECWx69ZjqEDY9BHN+KO5ZEQLtEiZ19zitq9Wjm9jFsU5BedaTAR6K9fOoN2xVVQPzY
 nFXoM8r60QyAdiTZtGX2djChFYuduDvMBiCXA3hyaFg1MynbHUDy2uFAD7IPh05zH1Lc
 W4osjG4V8PuABMy/Fz/Nfmw52BkDIBBwJCl/piudECM1sgmDC+LSbpACQYLulzuVWnCl
 iS1wuOlUy5YNqs9jXcEJ3JTag7IVKWCPWafx0weRkr3UcjYE5L1ctxgkxwXFa0FxmCVd
 H+Hw==
X-Gm-Message-State: AOJu0Ywpq+WHY5X2alsWQe+eK5+g8Rkx33T5MZG21Abib/A4WLn0F8gi
 TNIG+xl7SFVRNKwAWht7z9TLMO0ozARQcPvEjNtvEJ3uL7hVkwMg9/WN9TjBDQkRAlbclZvwuR2
 BxUtqglUPfvjT/xun8c5bsTcck4WqzPm9HIcqnThwawd1Ruk8HeDSFjlHgebJFSmCTCkW3WHA7h
 vz+uFYyn7EfJ+RbIr4ex1+azzLVgoMuRDbf2ZNsqR4+MdxW1+3VvFsHp+o
X-Gm-Gg: ASbGncs8GjJ/wFRkBWUXWpQVLGtT7tTKnopKvkGapvdmy1KAaQ/VnE3WOKFcn8fqq22
 E42lJ7KV0sf42v46dChdrI1YPosMQH/slpc7jt6ND6ilDOjvklhGDRsiV2G5M2J4KJCppNvk=
X-Received: by 2002:a17:907:94ce:b0:ac1:e1e1:1f37 with SMTP id
 a640c23a62f3a-ac25273af3dmr3055615666b.10.1741801641775; 
 Wed, 12 Mar 2025 10:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWoZ/xRfLrVwCbVoDcFZ1BKq25ho307v2ViD/8Q92dYyheIlgQ1tlxUNcQVTV4yIf/W5Zeoh3IGC5xw4ytHcI=
X-Received: by 2002:a17:907:94ce:b0:ac1:e1e1:1f37 with SMTP id
 a640c23a62f3a-ac25273af3dmr3055613366b.10.1741801641467; Wed, 12 Mar 2025
 10:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250304205556.290042-1-ryan.lee@canonical.com>
In-Reply-To: <20250304205556.290042-1-ryan.lee@canonical.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Wed, 12 Mar 2025 10:47:10 -0700
X-Gm-Features: AQ5f1JpZCwPYz3qCkAinmmmTjHSnkzQXYGOIGe-QTVZvdQPK0cZxsghJxrqxQGA
Message-ID: <CAKCV-6uzb55=TNSUoTsh0AxDA+VtNoxN3z=7+0G3oZuUW1ToCA@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH 0/5] Enable operations with disconnected
 paths to succeed in complain mode
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

Followed up with a v2 patchset

On Tue, Mar 4, 2025 at 12:56=E2=80=AFPM Ryan Lee <ryan.lee@canonical.com> w=
rote:
>
> AppArmor was previously blocking operations with disconnected paths, even
> when the profile was loaded in complain mode. Instead, this patchset audi=
ts
> the disconnected path as being prefixed with a '#' sentinel, and updates
> the other code doing path lookups to continue with mediation with complai=
n
> mode profiles.
>
> Similar checks will be needed for disconnection in the IPC case, once tha=
t
> code is ready.
>
> Ryan Lee (5):
>   apparmor: pass complain-mode information to aa_path_name path lookup
>   apparmor: don't return early in profile_path_perm for disconnected
>     paths in complain mode
>   apparmor: create new learning profile in complain mode upon disconnect
>     exec
>   apparmor: don't bail early in mount on disconnected paths in complain
>     mode
>   apparmor: disable aa_audit_file AA_BUG(!ad.request) due to fd
>     inheritance
>
>  security/apparmor/domain.c       | 40 ++++++++++++++++++++++++--------
>  security/apparmor/file.c         | 21 +++++++++++++----
>  security/apparmor/include/path.h |  4 ++--
>  security/apparmor/mount.c        | 19 +++++++++------
>  security/apparmor/path.c         | 37 +++++++++++++++++++----------
>  5 files changed, 86 insertions(+), 35 deletions(-)
>
> --
> 2.43.0
>

