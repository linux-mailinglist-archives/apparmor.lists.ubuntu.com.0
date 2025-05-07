Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 70668AAED07
	for <lists+apparmor@lfdr.de>; Wed,  7 May 2025 22:25:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uClKb-00033z-Nn; Wed, 07 May 2025 20:25:29 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1uClKZ-00031r-Va
 for apparmor@lists.ubuntu.com; Wed, 07 May 2025 20:25:28 +0000
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-70a2d8a8396so1968697b3.3
 for <apparmor@lists.ubuntu.com>; Wed, 07 May 2025 13:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649527; x=1747254327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NALzzc7ouJeBPR1TUY0o8qCUJh5kyiSiCwpTtRH0S2Q=;
 b=Ar4fNZnHFDY7Upwg8ka2HtPxnJNuksn4eDGqOS1PMR2/WPpKwxiGOAL8Qc8nhS1+jL
 IbxsXcKao0sb9585jFc4ZJ/+kzrl68xkxNI3JF7Mr1j5MArJfZMD1LRqHNZRRprJcrql
 amB4jeyWa6xWdtvHBTVmL6PPlf8H1qphEi1aVOD5BqvrzN9EHR9yHaD7WP6ChmXHdDJH
 oxiXypOcsk+AjfpMyQMw8gaBLpQK/SOkRCnvvzCmofoMpz+gzZScOZdsi4N9jhZb2dv8
 IC27C2pwfzJPigLgUvL5I5eDAWv+kaG9Dq8YwAlDXVZEEtlQrcYbrMMc8hnx3lQblg3+
 aglw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS3gdFYR9HkH8pMmqO/U67ScqSScO66TxfepWmyFee4xlfXX93Zx653cbkruQtqBgUuq6+NmECyg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yz580zvbkLKAgp8y7JAmRxSvrCY/k2h8OgpLsHgQE8gmxFGiSo0
 TK2lvvWbM+8+VrOCg493Ke9NeIqfVQ470MNAXblVqsQ0YKcv83SYnHYcUuBsJ+kKzhnTMw46iWF
 CDSbcMHb+TKw1tV2MfxOpJxlK71fO2cnMt+kn
X-Gm-Gg: ASbGnctY7KF6QazH7RRxzbxmt9wCmjchd66dZ99BhwGNO9vb/NJSqfbyEWeeI4sb17A
 fvXoUAK6mLCFgSPBEIjt+uHqcDwRrwA2BCBXYrK6Pv8hXo84WyXEgOQd7ropC6LwbEJqID/yRz7
 dHC+rObDGlGFN+vpmpBF7NtQ==
X-Google-Smtp-Source: AGHT+IEnsTmJtfSd7Oi4sYpnW+x9F1ytxun5MpNFWBa6XR5ci2YLPQTnwDSO5rA4KRr9sVcjKs48yaHdzYejiKICMdQ=
X-Received: by 2002:a05:690c:3581:b0:708:100a:5797 with SMTP id
 00721157ae682-70a1da6eff0mr72099047b3.11.1746649526482; Wed, 07 May 2025
 13:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-3-maxime.belair@canonical.com>
 <9c68743f-5efa-4a77-a29b-d3e8f2b2a462@I-love.SAKURA.ne.jp>
In-Reply-To: <9c68743f-5efa-4a77-a29b-d3e8f2b2a462@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 May 2025 16:25:15 -0400
X-Gm-Features: ATxdqUGLFAcBMOosGYQgzrTfPBBKYyLh7ma_JO834Kmp4fDuZcqb-SMlNb5e7uk
Message-ID: <CAHC9VhRKwB4quqBtYQyxRqCX2C6fCgTbyAP3Ov+NdQ06t1aFdA@mail.gmail.com>
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.178; envelope-from=paul@paul-moore.com;
 helo=mail-yw1-f178.google.com
Subject: Re: [apparmor] [PATCH 2/3] lsm: introduce
	security_lsm_manage_policy hook
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, kees@kernel.org,
 linux-security-module@vger.kernel.org, linux-api@vger.kernel.org,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, May 7, 2025 at 6:41=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2025/05/06 23:32, Maxime B=C3=A9lair wrote:
> > diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
> > index dcaad8818679..b39e6635a7d5 100644
> > --- a/security/lsm_syscalls.c
> > +++ b/security/lsm_syscalls.c
> > @@ -122,5 +122,10 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, id=
s, u32 __user *, size,
> >  SYSCALL_DEFINE5(lsm_manage_policy, u32, lsm_id, u32, op, void __user *=
, buf, u32
> >               __user *, size, u32, flags)
> >  {
> > -     return 0;
> > +     size_t usize;
> > +
> > +     if (get_user(usize, size))
> > +             return -EFAULT;
> > +
> > +     return security_lsm_manage_policy(lsm_id, op, buf, usize, flags);
> >  }
>
> syzbot will report user-controlled unbounded huge size memory allocation =
attempt. ;-)
>
> This interface might be fine for AppArmor, but TOMOYO won't use this inte=
rface because
> TOMOYO's policy is line-oriented ASCII text data where the destination is=
 switched via
> pseudo=E2=80=91filesystem's filename ...

While Tetsuo's comment is limited to TOMOYO, I believe the argument
applies to a number of other LSMs as well.  The reality is that there
is no one policy ideal shared across LSMs and that complicates things
like the lsm_manage_policy() proposal.  I'm intentionally saying
"complicates" and not "prevents" because I don't want to flat out
reject something like this, but I think there needs to be a larger
discussion among the different LSM groups about what such an API
should look like.  We may not need to get every LSM to support this
new API, but we need to get something that would work for a
significant majority and would be general/extensible enough that we
would expect it to work with the majority of future LSMs (as much as
we can predict the future anyway).

--
paul-moore.com

