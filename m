Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F99B0280B
	for <lists+apparmor@lfdr.de>; Sat, 12 Jul 2025 01:59:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uaNe7-0003DI-Ng; Fri, 11 Jul 2025 23:59:15 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1uZz0M-000087-6y
 for apparmor@lists.ubuntu.com; Thu, 10 Jul 2025 21:40:34 +0000
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-714066c7bbbso16093717b3.3
 for <apparmor@lists.ubuntu.com>; Thu, 10 Jul 2025 14:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752183633; x=1752788433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wG3MiVJh0RcPO7dGyjbbquYVHNZCnHmFZCdF5hrjIg=;
 b=g2mrUaS59czbBPfT7EFTaXtUn78gvlep/TU9STbyptHsmoAo24w4id+n2kGlQmg2Ee
 zYy+pWOHmDAXjNZhD+DdrjI3XL57NlGV2cIca+yztuBMciERrRDQNvU0YwCouED+Jpdz
 jGMKZCkKdl/zObye3zwoNzG75ICE1XAIMdTolXUYpa5PTI6MK1tcc2ZJPQeAobxik/HR
 08JZ7aRnS/t9lD2cfQJS9wRddODupw7a+PCPOn4I/XQEYwiYh6ZKOMvnaM3ZZQOme9AX
 G/nEBZHr46L7no0fx/SQ8oXCiR76Gh0IpmrGTK/AES3nk5t4HgvzBjLySHDXxIDNxw5u
 LgMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8e4u7Ghh13jdCMDvr/de/psaLWMz6Z9+twOTZMvxHmYrsL0qPbbZCtVIdtBFeSdey9HJksciN9w==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzEXbc9+plVq8tZsH3YKkGggSwaMSxDBiGRyGKHnv3qejONxwGc
 T0v2+77QNRtWIvcBmo7D6axtgq94qzPUEpEoaSqBddWd8y0+NbLguL6mY0DrJlr+G/Q0eZg2VEX
 CTtQxK13pgl/haSk0U15eZqk8hbfA5rYfd5I0FV7b
X-Gm-Gg: ASbGncs9i0rnj+lCEWYeSjnBPS+nlLqJtZZEosM/elHmY8c5M4qoPRKcOnPrAMAkB0b
 GNYxMtG+TA6SnXaIAw7K3LzRPCqDsTUeJAY4FMECkQnapuhdUrJK8X9KARhc+i66uoD9juTfmN9
 fUTOw30cyso3CdcKX/WpWZ3sEvPq1NwhGHOJrmwP9gJHpXVmJdlevzXSkqjvlI8F9QIljcj2pNU
 kRuZLaUz2ZavxQiHA==
X-Google-Smtp-Source: AGHT+IEUNp7yAcXsQe/JR+irOSVx8v6wD/QnrcWD8zPh1FLoq9LoOpgHSEVTC/K3sabkCRfbQXhsH559rzftY5+dmIM=
X-Received: by 2002:a05:690c:63c6:b0:712:e516:2a30 with SMTP id
 00721157ae682-717d5e134b4mr20477787b3.28.1752183632871; Thu, 10 Jul 2025
 14:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250708230504.3994335-1-song@kernel.org>
 <20250709102410.GU1880847@ZenIV>
 <CAHC9VhSS1O+Cp7UJoJnWNbv-Towia72DitOPH0zmKCa4PBttkw@mail.gmail.com>
 <1959367A-15AB-4332-B1BC-7BBCCA646636@meta.com>
 <20250710-roden-hosen-ba7f215706bb@brauner>
In-Reply-To: <20250710-roden-hosen-ba7f215706bb@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 10 Jul 2025 17:40:19 -0400
X-Gm-Features: Ac12FXygeQp3no1_lmAy5tCkImjlkaS0qLNeFNCTV52hKWMKCGltsNt3Gzdmr0Q
Message-ID: <CAHC9VhTinnzXSw1757_yeFdyayXkpTr6jQk8kzETtB5r=WNaxw@mail.gmail.com>
To: Song Liu <songliubraving@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.170; envelope-from=paul@paul-moore.com;
 helo=mail-yw1-f170.google.com
X-Mailman-Approved-At: Fri, 11 Jul 2025 23:59:10 +0000
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
Cc: "mattbobrowski@google.com" <mattbobrowski@google.com>,
 "jack@suse.cz" <jack@suse.cz>,
 "penguin-kernel@i-love.sakura.ne.jp" <penguin-kernel@i-love.sakura.ne.jp>,
 "tomoyo-users_en@lists.sourceforge.net"
 <tomoyo-users_en@lists.sourceforge.net>,
 "amir73il@gmail.com" <amir73il@gmail.com>, "ast@kernel.org" <ast@kernel.org>,
 "omosnace@redhat.com" <omosnace@redhat.com>, Song Liu <song@kernel.org>,
 "takedakn@nttdata.co.jp" <takedakn@nttdata.co.jp>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "andrii@kernel.org" <andrii@kernel.org>,
 "repnop@google.com" <repnop@google.com>,
 "john@apparmor.net" <john@apparmor.net>,
 "enlightened@chromium.org" <enlightened@chromium.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 Kernel Team <kernel-team@meta.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "josef@toxicpanda.com" <josef@toxicpanda.com>,
 "kpsingh@kernel.org" <kpsingh@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 "mic@digikod.net" <mic@digikod.net>, "m@maowtm.org" <m@maowtm.org>,
 Christian Brauner <brauner@kernel.org>,
 "stephen.smalley.work@gmail.com" <stephen.smalley.work@gmail.com>,
 "tomoyo-users_ja@lists.sourceforge.net"
 <tomoyo-users_ja@lists.sourceforge.net>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "eddyz87@gmail.com" <eddyz87@gmail.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "gnoack@google.com" <gnoack@google.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "martin.lau@linux.dev" <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Jul 10, 2025 at 7:46=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
> On Wed, Jul 09, 2025 at 05:06:36PM +0000, Song Liu wrote:

...

> I'll happily review proposals. Fwiw, I'm pretty sure that this is
> something that Mickael is interested in as well.

As a gentle reminder, please be sure to include the LSM list on these
efforts, at the absolute least I want to review the patches, and I'm
sure the other individual LSM subsystem maintainers will surely want
to take a look too.

--=20
paul-moore.com

