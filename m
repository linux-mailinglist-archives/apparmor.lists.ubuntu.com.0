Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D4B7CEB1D
	for <lists+apparmor@lfdr.de>; Thu, 19 Oct 2023 00:23:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qtEx1-0001v7-6A; Wed, 18 Oct 2023 22:23:39 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1qtEwt-0001ur-Tw
 for apparmor@lists.ubuntu.com; Wed, 18 Oct 2023 22:23:32 +0000
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-d9a6399cf78so180095276.0
 for <apparmor@lists.ubuntu.com>; Wed, 18 Oct 2023 15:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697667811; x=1698272611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Ajnftp73O59rJQP7PyQI1ag+kBRLHglVcmFRcE57mQ=;
 b=quEEYqj6BKSEUcqMxI0Uk3orlk4CkZ58MxJ4l6lAafC91dM9N50FTWd3K0cyznsreX
 xzT6pg1lo5C57+SnwyhDkLWsvdwDLD1zpNNbwD7ymBA4tsbP9gdRn3LD5hgVWWmaG9lX
 vUCQb2A9BjPAZXjyo84mKbBRKnkCHVYFLS6d5bQY0DKgmtc7Op3WW4ew7E2tX1knaIpV
 77XYDwkAZVHic47Otg0s3X8A06c5821QAzf0OEbtpxHNiOJj6ulrT/qY032Plpw/b8jC
 MzIk9Fr98LRdF9zOcsD0XgYNxR0NZi1BsoCgOGY4Zxyj918YGPFwy9IIfT31wd54a6o4
 ug9g==
X-Gm-Message-State: AOJu0YyTAfTgCk3X0hR15kMxhbNJx26cUT/cM1sEH7DCIIZdyStkCOqY
 IHhhHtuSbhQmkEujfoj11ij46gmriyD7nKscVJB2
X-Google-Smtp-Source: AGHT+IFkCIlvjS3UdbaJfDthTUMuOXzDQ+rtt8Q34aeqMzb7V8/8FtAyrqc+XHMjw98FzTE3rdSrA+2aJlcqrNkLkzA=
X-Received: by 2002:a25:154:0:b0:d86:4342:290 with SMTP id
 81-20020a250154000000b00d8643420290mr126206ybb.21.1697667810731; 
 Wed, 18 Oct 2023 15:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAOTMNwuhq9Fc1PW4Y6ZOyP8H7nCk3+9gsxRapRuScZ2-a+14hA@mail.gmail.com>
 <668dd928-b00d-4f7a-5e6a-b6efc6a9c08f@canonical.com>
 <CAHC9VhSQ2U0jhW5Goa+OTTPtx64viGjFWFJy7Y7CsetOaWs6jg@mail.gmail.com>
 <CAOTMNwsca-CuzOdmc5HeUCtBGWJVKb2GB_r1QEF-TnJv1Kkhyg@mail.gmail.com>
 <CAHC9VhQNTiX=na2a1QsAQWwPfjuvd2xnFGHAPxTs=wQXNt6eZg@mail.gmail.com>
 <6da3d0b6-aaae-4586-bd71-749d6fb38708@canonical.com>
 <CAHC9VhToqz-hs8vuUhd=vNKOXNc_iXOAbtuVTNGWJUvbbzq_kQ@mail.gmail.com>
 <CAHC9VhQyb_SfA0_=fqrVLZjYj76gLzwnf2Gs3j73FRVD-0vGeg@mail.gmail.com>
 <740fe39c-dab5-4ec9-b717-f5168e689985@canonical.com>
 <CAHC9VhQTbTkQzCdicPtj7WfEhJgmkX=zxPNu9cGVmHhbbzBzcg@mail.gmail.com>
 <CAHC9VhQ_i0TnA+Snsg-gsPEEb=uHyiNKDm48jmiuRc7y1-Gd=Q@mail.gmail.com>
In-Reply-To: <CAHC9VhQ_i0TnA+Snsg-gsPEEb=uHyiNKDm48jmiuRc7y1-Gd=Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Oct 2023 18:23:20 -0400
Message-ID: <CAHC9VhTE+xCnAj-NXgCZJwYkp9i1KAJCgQDPWjE3msVYScTQCg@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] AppArmor kernel audit locks up system
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
Cc: audit@vger.kernel.org, apparmor@lists.ubuntu.com,
 Andreas Steinmetz <anstein99@googlemail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Oct 18, 2023 at 5:00=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Wed, Oct 18, 2023 at 4:50=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > It shouldn't, the only time we ever really operate on something other
> > than @current is when a fork/clone happens and we are filtering on the
> > new child process.  At least that used to be the case, I can't imagine
> > someone would audit something other than @current (not sure you could
> > with respect to this stuff?), but I guess it couldn't hurt to double
> > check on the current code base.
>
> Yes, that still looks to be the case.
>
> --
> paul-moore.com

Patch posting:

https://lore.kernel.org/audit/20231018222023.371274-2-paul@paul-moore.com

--=20
paul-moore.com

