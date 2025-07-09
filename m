Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEB6AFF615
	for <lists+apparmor@lfdr.de>; Thu, 10 Jul 2025 02:43:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uZfNv-0007pX-Jh; Thu, 10 Jul 2025 00:43:35 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1uZWaF-0006m1-7u
 for apparmor@lists.ubuntu.com; Wed, 09 Jul 2025 15:19:43 +0000
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e812fc35985so4853173276.0
 for <apparmor@lists.ubuntu.com>; Wed, 09 Jul 2025 08:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752074382; x=1752679182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YzEGonVmXproAomin5eIhv7ocY+0CXz52Ye0JGlwwtY=;
 b=tua8X3vFDWXDjpsq+IqBVRSoYOYI+TCaFt0aaORuW0pHxz2CSwP6t6P6g4e/dN8W+g
 39Klq8t7B7b5ptD8kdqImWXKe5KJvTKEXgPsaGjj5KK1mytZvWRcyrCy2T+gXm+iSJ/C
 0qv3UibI09b1qztid/3qTzyyDHq3Sauzs8e9GEItF/uDGNHTrJgfIe2bii86jdyCxXRG
 fVOrMKq9D7QtsY3mPyeXgJ7wJI2BipOvCpylvL6QJvaDqcBpIpCREvA+f8AomauqByGr
 +izR247ini0aXKCtjWs/sM5k6tB1dxpwSRX8uh79toXpSe2hCH/0HolwnApDuxkMv1g8
 YM4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCrY8jIPLifCaSjEQWeHviTmSq2h6LOt234P1vnBaPMPamOHERnS2AIdHSzDd1fPP1m5V2kL544g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzIUwm1ODPDDIfwlS/r7A3Yc9MESMHyC2d2atzSM1v79g8aZ4Cn
 S6K9cw9YS06si0u6blOmNnWA1WeHebVb9ftIYXfD/yMuTuBKRTNCONg97Ud/x6z2gAgyDQ2eUst
 drqFejChOBAphqhhCEkPwYY1BzwaYwuo9fFo5NAhH
X-Gm-Gg: ASbGncuBXLxgl9p6tK3tbL28KKXXJtEvgOYO7P6+vS023Yb7BCL6zhyPGhw9xM0Vmfo
 EIwNu2EjOiImqWJ6Yro9G+hCdV/AgDaAAVIcdiCByQfoHm5Q+ygQYDs0AwmlVNbTxbBAXeTzvHA
 QNwDE2+pnhLVmewUg76+Jd1i7Z2SowBkprAsjzcXV386k=
X-Google-Smtp-Source: AGHT+IFjdm/SLcamSWISUQ66DrdwMnktjlqu7nOrNWg4Q3frFotVmkLuYoFvM0O8pXxaPwSx2wsTZlYITGZbRbzkEHs=
X-Received: by 2002:a05:690c:62c5:b0:70e:7706:8250 with SMTP id
 00721157ae682-717b17ace8cmr45883167b3.16.1752074381801; Wed, 09 Jul 2025
 08:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250708230504.3994335-1-song@kernel.org>
 <20250709102410.GU1880847@ZenIV>
In-Reply-To: <20250709102410.GU1880847@ZenIV>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 9 Jul 2025 11:19:30 -0400
X-Gm-Features: Ac12FXxwFg_uAGld7AFSlsXAxl6RXBEAoPyYFqRJUVoeSEfIzHaujAQ4qrD1sLk
Message-ID: <CAHC9VhSS1O+Cp7UJoJnWNbv-Towia72DitOPH0zmKCa4PBttkw@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.171; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f171.google.com
X-Mailman-Approved-At: Thu, 10 Jul 2025 00:43:34 +0000
Subject: Re: [apparmor] [RFC] vfs: security: Parse dev_name before calling
	security_sb_mount
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
Cc: mattbobrowski@google.com, jack@suse.cz, penguin-kernel@i-love.sakura.ne.jp,
 tomoyo-users_en@lists.sourceforge.net, amir73il@gmail.com, ast@kernel.org,
 omosnace@redhat.com, Song Liu <song@kernel.org>, takedakn@nttdata.co.jp,
 daniel@iogearbox.net, andrii@kernel.org, repnop@google.com, john@apparmor.net,
 enlightened@chromium.org, selinux@vger.kernel.org, kernel-team@meta.com,
 apparmor@lists.ubuntu.com, josef@toxicpanda.com, kpsingh@kernel.org,
 mic@digikod.net, m@maowtm.org, brauner@kernel.org,
 stephen.smalley.work@gmail.com, tomoyo-users_ja@lists.sourceforge.net,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, eddyz87@gmail.com,
 linux-security-module@vger.kernel.org, gnoack@google.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jul 9, 2025 at 6:24=E2=80=AFAM Al Viro <viro@zeniv.linux.org.uk> wr=
ote:
> On Tue, Jul 08, 2025 at 04:05:04PM -0700, Song Liu wrote:
> > security_sb_mount handles multiple types of mounts: new mount, bind
> > mount, etc. When parameter dev_name is a path, it need to be parsed
> > with kern_path.

...

> security_sb_mount() is and had always been a mind-boggling trash of an AP=
I.
>
> It makes no sense in terms of operations being requested.  And any questi=
ons
> regarding its semantics had been consistently met with blanket "piss off,
> LSM gets to do whatever it wants to do, you are not to question the sanit=
y
> and you are not to request any kind of rules - give us the fucking syscal=
l
> arguments and let us at it".

I'm not going to comment on past remarks made by other devs, but I do
want to make it clear that I am interested in making sure we have LSM
hooks which satisfy both the needs of the existing in-tree LSMs while
also presenting a sane API to the kernel subsystems in which they are
placed.  I'm happy to revisit any of our existing LSM hooks to
restructure them to better fit these goals; simply send some patches
and let's discuss them.

> Come up with a saner API.  We are done accomodating that idiocy.  The onl=
y
> changes you get to make in fs/namespace.c are "here's our better-defined
> hooks, please call <this hook> when you do <that>".

I don't have the cycles to revisit the security_sb_mount() hook
myself, but perhaps Song Liu does with some suggestions/guidance from
you or Christian on what an improved LSM hook would look like from a
VFS perspective.

--=20
paul-moore.com

