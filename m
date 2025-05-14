Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 57300AB784C
	for <lists+apparmor@lfdr.de>; Wed, 14 May 2025 23:58:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uFK73-0005Yf-8s; Wed, 14 May 2025 21:58:05 +0000
Received: from mail-yb1-f180.google.com ([209.85.219.180])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1uFK72-0005YV-00
 for apparmor@lists.ubuntu.com; Wed, 14 May 2025 21:58:04 +0000
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e7b451b708aso228364276.3
 for <apparmor@lists.ubuntu.com>; Wed, 14 May 2025 14:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747259882; x=1747864682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cd3hwDzjEL8BVjWNpHIodN9KpUcVouQgmKQ6Ucvmu/M=;
 b=StZ184T7avUH2Gv8Ao5sWpJDFysEi0LwsExWhJ8SETf2GpbP1QKpVpIG1VTs30RSbp
 zhVNHM4UEKFh1t7YYK/Pl8ch0QfLIiE744JGLrr3cIkYH7C93TmMCnQy1lNwUFZvGglt
 2qUY4jNjmeDlUl2k2eUJlbCehx+VI+XOx6d21VYVybT5gB4wSCPp1me0uGO++MOmszvQ
 R3OWallwU6EriKH49JdYSnLGlcEN2klr3PMkJIUwR8BbuykRE0KkO1AfBKD21959OzQH
 Y/J+k7IL5I3eMZtLmaaEBtfZYhjodg1/49ZmGlLl/mK4hKfdnU4CD3OmWDPXluXSVNrV
 AgSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7EJwQAKm75TdHcsm/3jyxItWKWcKzBXbtLVWQeWrRTjR8e+fxccwpNaruPu1sQw8J9VZZuBubRg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwtSz34hROqqwNrUNCRxTfOsZqdYp57QzZ23UrIzkRI7JRluL+F
 P9NwutokFd+gZKyJC7Fp0KeFQEBjuclhN2jdEyXUkzzd45DImT9CpDuNMt4RcqHsgWypsg6CLAd
 VdaCQ9ndn5XD1tAakw4pv8XnuqWfUwsGFJzcr
X-Gm-Gg: ASbGncvGRaEmAPDcxHDfaGvXOZgvsJ8DjQ3bF5heaXM0RiqC3NKOUCJdtUft2FA6nWq
 VQhnZc5a1+yE2LbXTjs0CW88OIyI7nX1NJ8/vLo1wmqSsZIDM2zugyGAFhSi5uWdRjUPPuiK/t4
 LndRjbcc3iYw97DfPqJvS0SnPE996np5azunJtYUXKMlA=
X-Google-Smtp-Source: AGHT+IHAu8/NGifUGGvqy1muRemXjrNd0svPOPeQFyYnJTSpuDaE7BUNisyhGtBUb1e5c878a+beHwpBV6XXMuiK0sc=
X-Received: by 2002:a05:6902:114e:b0:e76:8058:a065 with SMTP id
 3f1490d57ef6-e7b3d4ba991mr6148542276.6.1747259882613; Wed, 14 May 2025
 14:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250428190430.850240-1-ebiggers@kernel.org>
 <20250514042147.GA2073@sol>
In-Reply-To: <20250514042147.GA2073@sol>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 14 May 2025 17:57:52 -0400
X-Gm-Features: AX0GCFu-8Aa284A3Wv4qgq0Bn3X2NviBEUYoaX5YYoj-p-8WsCK_D4vIgnJJLjo
Message-ID: <CAHC9VhRL=Jsx8B1s-3qmVOXuRuRF2hTOi3uEnRiWra+7oQJvrg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.180; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f180.google.com
Subject: Re: [apparmor] [PATCH] apparmor: use SHA-256 library API instead of
	crypto_shash API
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
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, May 14, 2025 at 12:22=E2=80=AFAM Eric Biggers <ebiggers@kernel.org>=
 wrote:
> On Mon, Apr 28, 2025 at 12:04:30PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > This user of SHA-256 does not support any other algorithm, so the
> > crypto_shash abstraction provides no value.  Just use the SHA-256
> > library API instead, which is much simpler and easier to use.
> >
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >
> > This patch is targeting the apparmor tree for 6.16.
> >
> >  security/apparmor/Kconfig  |  3 +-
> >  security/apparmor/crypto.c | 85 ++++++--------------------------------
> >  2 files changed, 13 insertions(+), 75 deletions(-)
>
> Any interest in taking this patch through the apparmor or security trees?

Something like this would need to go through the AppArmor tree.  As a
FYI, the AppArmor devs are fairly busy at the moment so it may take a
bit for them to get around to this.

--=20
paul-moore.com

