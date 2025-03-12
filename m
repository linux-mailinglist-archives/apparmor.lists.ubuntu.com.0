Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 573F8A5E319
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 18:49:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsQCY-0002WJ-9Z; Wed, 12 Mar 2025 17:49:06 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsQCW-0002W8-3C
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 17:49:04 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 21CED3F174
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 17:49:03 +0000 (UTC)
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ac297c79dabso13216966b.0
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 10:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741801743; x=1742406543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AIgd+s6u+yQ/Lxa3qnIv6vKS5GJV240p1hWOUFNpmU=;
 b=QPVHQJr039z2vObSqKNCQDKXplLRV+ubz+Cwo3MKHGKeDivdonsWPHkdnPGbOKk3HD
 cbU/kOR6eJXMp5z6gq5mZ16u04XL/kESkCcRU8OHK/t4UFeDct4ju+uneXKa6kRnbeBx
 xRkDm8cBEX1z54lvR51Ycc2UXf5ogbOeSuaYWAlsEnIpzludSwJ/A/6tKt/ay76E2lDm
 uFvwGzavRQxzCPIX9Mt2gFXpogHcDrvrPFXO6xSykGiNHdlVGZ88NYWX0VgPXZaVs7cU
 THNP2G1iFsp8KynzNohUj8H6cgVpSMsuQ4k4Iq8oyg0Blt2YVBxoGnOhPMiq3imHAl7e
 CoeQ==
X-Gm-Message-State: AOJu0Yw6UWL5lbRhwQpJ6tC0D9NuWMc6WNNJ4vsO9h3l1Wma5WYzTVKA
 JU3f3u8/ezvZC/GqnsEnsvzaMiQm4X7ypyTHQ6Da4bViRR4UEFKmjcq92nNtiI8AaezzYZ1QgPy
 5BCxW/UVuf0+qnVjfy6kYBJ9mEFCDxt324u3hJ3Of0JSBtco7ucUcyn5MtmebmREJfE2WLO9qYd
 qYWjb+svcvaamucvqD3r0fR2Cuqppt/ERW8KlxHQCBrD5otRMC
X-Gm-Gg: ASbGnctj25NvxB/pXctHZafR9hP03sUoVWGAkE0GhVsTb+RITA8z2SPGVqHKQQAGDiY
 tTsyVM1Yn73/eXRJDtSmUZItIC/6Xp3NsS9xaUSbvIV/nneQx69lXUWIjqO9CaOyohNtPvP0=
X-Received: by 2002:a17:907:86a8:b0:ac1:e1d8:997c with SMTP id
 a640c23a62f3a-ac252719297mr2877280066b.31.1741801742667; 
 Wed, 12 Mar 2025 10:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4ptheRj7F4sKG6R0h6u6o0GTIYr8jY7oI2d4603rzRY706xlgGcGHB54xuP3DvFcUH3jHyDnUYN8uwxh/7fs=
X-Received: by 2002:a17:907:86a8:b0:ac1:e1d8:997c with SMTP id
 a640c23a62f3a-ac252719297mr2877277666b.31.1741801742354; Wed, 12 Mar 2025
 10:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250304205556.290042-1-ryan.lee@canonical.com>
 <20250304205556.290042-6-ryan.lee@canonical.com>
 <3610981.dWV9SEqChM@tux.boltz.de.vu>
In-Reply-To: <3610981.dWV9SEqChM@tux.boltz.de.vu>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Wed, 12 Mar 2025 10:48:51 -0700
X-Gm-Features: AQ5f1JoUBcERCoyp8PCR5IVJOQ8NjsvZxKGomlvljgkYfrVY1MYUYLdiTUIQO6k
Message-ID: <CAKCV-6tZPQ9vsDUHeyQwEvTKNqRx+7m-mmzGsd1GNKKeVi0JXQ@mail.gmail.com>
To: Christian Boltz <apparmor@cboltz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH 5/5] apparmor: disable aa_audit_file
 AA_BUG(!ad.request) due to fd inheritance
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

On Sat, Mar 8, 2025 at 11:21=E2=80=AFAM Christian Boltz <apparmor@cboltz.de=
> wrote:
>
> Hello,
>
> Am Dienstag, 4. M=C3=A4rz 2025, 21:55 schrieb Ryan Lee:
> > Inheritance of fd's triggers the lookup logic, and O_PATH fd's are
> > checked with an empty request set. If the O_PATH fd corresponds to a
> > disconnected path for an application with a profile in complain mode,
> > we have an error without a request bit set in aa_audit_file. Until we
> > can handle O_PATH fd inheritance better, the best we can do for now
> > is disable the AA_BUG line.
> >
> > Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
> > ---
> >  security/apparmor/file.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/security/apparmor/file.c b/security/apparmor/file.c
> > index c430e031db31..3267a597526e 100644
> > --- a/security/apparmor/file.c
> > +++ b/security/apparmor/file.c
> > @@ -271,7 +271,18 @@ int aa_audit_file(const struct cred *subj_cred,
> >       } else {
> >               /* only report permissions that were denied */
> >               ad.request =3D ad.request & ~perms->allow;
> > -             AA_BUG(!ad.request);
> > +
> > +             /*
> > +              * Inheritance of fd's across execution boundaries causes=
 the
> > +              * path name lookup logic to be triggered for all the fd'=
s.
> > +              * This includes O_PATH fd's for which the original reque=
sted
> > +              * set is empty. An O_PATH fd with a disconnected path re=
sults
> > +              * in a lookup error, which in complain mode, means we re=
ach
> > +              * this branch with an empty request. Until we have a bet=
ter
> > +              * way to detect and handle this case, we have to disable=
 this
> > +              * AA_BUG line.
> > +              */
> > +             // AA_BUG(!ad.request);
>
> Assuming I got your description right, this AA_BUG will only "explode"
> in complain mode.
>
> Would it be possible to do something like (pseudocode)
>
>     if !complain_mode
>         AA_BUG(!ad.request);
>
> so that AA_BUG only gets skipped for complain mode profiles, instead of
> completely commenting it out?
>

Fixed in v2, thanks

>
> Regards,
>
> Christian Boltz
> --
> What you need is a list of all unknown bugs.  ;-)
> [James Knott in opensuse-factory]

