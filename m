Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 284E4A10D21
	for <lists+apparmor@lfdr.de>; Tue, 14 Jan 2025 18:10:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXkQe-000485-Na; Tue, 14 Jan 2025 17:10:12 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <tanyaagarwal25699@gmail.com>)
 id 1tXjY3-0007X1-Qf
 for apparmor@lists.ubuntu.com; Tue, 14 Jan 2025 16:13:47 +0000
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso9227737a12.0
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jan 2025 08:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736871227; x=1737476027;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=REzSH4yhDLO8NjgMwRAvoxIEo8VPLNcaq/DGKubTjh4=;
 b=pZZ5EQPzQsQP/o+fM0OxUxSSo9rO1Jw1hONJOIYbOjbKCQmf+dnCrBTOc3+3resgMM
 GplyXI+GHt8m1tSUIDZZ7/1NluOeGbo0zQG8CPKI6M7KdDx5TwmrQySEPQ/SOnZF54Ms
 ztThrdGVbuGjokovPZ2kKKf61sn3vXTai9+Sb2tSXy2yOwv42KQVj79gKK64ANrps+Y+
 61LdLvI9BHjPkGH7AVWeZoztx/n/HmRhq16h1k+xoq7ACY+kJFoiKwuymuVwDkSqvUEL
 XQyupOOZni2WoXOVqdYg3oMe6H3bKVSYEwrOgYtd0FAf9GYheaEaKPif/Dk2lidL13sY
 YDyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWje3YmABcOv3uO9Mxjo31e5A7Xt+Z8yrokr1ZY/hVK1elE0Eg6Sd5dF4fiIkhzSIJwe8nj0/pb9w==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwML4CIjI+WCe4Pxt3iR6q+LMgNW1zIRcFTk2qlCCIE07kqFhb5
 iDcJ7yyTiNUbGeMaJEGglOEbWyLfFOp+lUKQ0h9bryijYF9bNrv2Xrbjx5m7rNafyZThITtIwLk
 +biGq0c9fF5d0WjgnXPURrn4Suqc=
X-Gm-Gg: ASbGncvTh2IHwR4HiJ1zQBMHvifUiJJtPWbGxbEU3oyGPvbWs3/QqrIZA179rj4JdcG
 htSOlsRpNGc8EwdmQA5J550UZ6DQd/AyP55n7syT6eDMaCQF/p1AkLmWNW0AGbzcoGJpAUK+N
X-Google-Smtp-Source: AGHT+IHfUa2T9hmA+yE2tNUCc5EEsgMa1En9ZeCxdpUYQgtW5NsOqO2EBrDWdKsbAlbD5X5gZ10c+VCpT7pMRMxlQPM=
X-Received: by 2002:a17:906:c110:b0:aa6:3da3:db48 with SMTP id
 a640c23a62f3a-ab2abca061amr2389992366b.53.1736871226609; Tue, 14 Jan 2025
 08:13:46 -0800 (PST)
MIME-Version: 1.0
References: <20250111.22fc32ae0729@gnoack.org>
 <20250112072925.1774-1-tanyaagarwal25699@gmail.com>
 <20250113.a860b47a11c7@gnoack.org>
 <d1b05612412a1d4b858662f296b45279c2141aa8.camel@linux.ibm.com>
In-Reply-To: <d1b05612412a1d4b858662f296b45279c2141aa8.camel@linux.ibm.com>
From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Date: Tue, 14 Jan 2025 21:43:34 +0530
X-Gm-Features: AbW1kvZI6OeEaHe6jrROM7_UZdMN5yodd5GfuQ7LCBF4Zely2GTCiPUb4NEv39U
Message-ID: <CAPdGtUw9Ee7weCmS2ZP-Hi5KwPw9-O1fGRrY_KLKQh-SWgEN5Q@mail.gmail.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.43;
 envelope-from=tanyaagarwal25699@gmail.com; helo=mail-ed1-f43.google.com
X-Mailman-Approved-At: Tue, 14 Jan 2025 17:10:11 +0000
Subject: Re: [apparmor] [PATCH V2] security: fix typos and spelling errors
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
Cc: serge@hallyn.com, paul@paul-moore.com, eric.snowberg@oracle.com,
 penguin-kernel@i-love.sakura.ne.jp, dmitry.kasatkin@gmail.com,
 stephen.smalley.work@gmail.com, roberto.sassu@huawei.com, jmorris@namei.org,
 omosnace@redhat.com, mic@digikod.net, linux-security-module@vger.kernel.org,
 anupnewsmail@gmail.com, gnoack@google.com, skhan@linuxfoundation.org,
 linux-integrity@vger.kernel.org,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 takedakn@nttdata.co.jp
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Jan 14, 2025 at 12:49=E2=80=AFAM Mimi Zohar <zohar@linux.ibm.com> w=
rote:
>
> On Mon, 2025-01-13 at 15:50 +0100, G=C3=BCnther Noack wrote:
> > On Sun, Jan 12, 2025 at 12:59:27PM +0530, Tanya Agarwal wrote:
> > > From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> > >
> > > Fix typos and spelling errors in security module comments that were
> > > identified using the codespell tool.
> > > No functional changes - documentation only.
> > >
> > > Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> > > ---
> > > Thanks G=C3=BCnther, for catching this error.
> > > The irony of having a spelling mistake in a patch that fixes spelling
> > > mistakes is not lost on me :)
> > >
> > > I've fixed it in V2 of the patch. Thank you for the careful review!
> > >
> > > V2: fix spelling mistake - s/beeen/been/
> > >
> > >  security/apparmor/apparmorfs.c      | 6 +++---
> > >  security/apparmor/domain.c          | 4 ++--
> > >  security/apparmor/label.c           | 2 +-
> > >  security/apparmor/lsm.c             | 2 +-
> > >  security/apparmor/policy.c          | 4 ++--
> > >  security/integrity/evm/evm_crypto.c | 2 +-
> > >  security/integrity/evm/evm_main.c   | 2 +-
> > >  security/integrity/ima/ima_main.c   | 6 +++---
> > >  security/landlock/ruleset.c         | 2 +-
> > >  security/selinux/avc.c              | 2 +-
> > >  security/smack/smack.h              | 2 +-
> > >  security/smack/smack_access.c       | 4 ++--
> > >  security/smack/smack_lsm.c          | 6 +++---
> > >  security/smack/smackfs.c            | 2 +-
> > >  security/tomoyo/domain.c            | 2 +-
> > >  15 files changed, 24 insertions(+), 24 deletions(-)
> > >
> >
> > [...]
> >
> > > diff --git a/security/integrity/ima/ima_main.c
> > > b/security/integrity/ima/ima_main.c
> > > index 9b87556b03a7..cdb8c7419d7e 100644
> > > --- a/security/integrity/ima/ima_main.c
> > > +++ b/security/integrity/ima/ima_main.c
> > > @@ -983,9 +983,9 @@ int process_buffer_measurement(struct mnt_idmap *=
idmap,
> > >     }
> > >
> > >     /*
> > > -    * Both LSM hooks and auxilary based buffer measurements are
> > > -    * based on policy.  To avoid code duplication, differentiate
> > > -    * between the LSM hooks and auxilary buffer measurements,
> > > +    * Both LSM hooks and auxiliary based buffer measurements are
> > > +    * based on policy. To avoid code duplication, differentiate
> >                           ^^^
> >
> > (Small nit:) This change from two-spaces-after-the-dot to a single
> > space looks like it happened accidentally.  The two-space style is
> > dominant in the ima_main.c file.
> >
> > (However, I am not involved in IMA and others have more authority to
> > review this part.  As Paul also said, reviews tend to go smoother when
> > the scope for the patch is a single subsystem - it makes the
> > responsibilities clearer.)
> >
> > > +    * between the LSM hooks and auxiliary buffer measurements,
>
> The spelling mistake being corrected in two places is auxilary -> auxilia=
ry.  Thank
> you for noticing the unnecessary change from two spaces to one space as w=
ell.
>
> FYI, I agree with Paul the patch should be split.
>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>

Hi All,
Thanks for the review.
Sure, I'll split patches of different security subsystems so, that
they are easy for maintainers to merge.

Regards,
Tanya

