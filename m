Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C0197463C
	for <lists+apparmor@lfdr.de>; Wed, 11 Sep 2024 01:05:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1so9vb-0007FM-CF; Tue, 10 Sep 2024 23:05:43 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1so9va-0007DL-7B
 for apparmor@lists.ubuntu.com; Tue, 10 Sep 2024 23:05:42 +0000
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c2460e885dso36774a12.0
 for <apparmor@lists.ubuntu.com>; Tue, 10 Sep 2024 16:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726009541; x=1726614341;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CGDNjxA8a/+7X5OLMsKVJ1MSV2s9K8DgSyu27kL3bTc=;
 b=BLEZsBOzRBerSAmZw52ZY42BjmHk+O5PpXV/iEWoW2B9Cgb32rtXkqFyPOBEj9yye6
 ErkAuhDHUD5S6E+fuBPCmu+20cKLNS/+569eTc+WOk3AJFvUWxAzQT1uE6QOK8dsw5xf
 IRo29HanFCdRywWe8ADcrFZ6I2/ZM6LEKyR1jACuE4AuSsp2UIky2cERmD139eOf5hjF
 Bd6oI+Qs7hylviCMpd6Nb3IrnOiixaYBCLXTth1PI3fvt/wvBxTM4GpMKTt0Y9yERqHH
 IXOC7ijOD+GUkgu4nJttlohIlgQOxLizKJJJvdbwrIuya6ykT/jI0RwNKUeofpY7enLP
 f8HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9/GoECf5Ll7Mry8bcyyEcZ7yMlnWMdtu1QSnBaRftzNUwVfpGP/I5MM1h4psHU81Jrp3jcwIjJg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzrDIUm+AEivVMTevz91cxj+sN6LDifNMQNDkmE4DNeByr1kkDk
 aqc8FzZdLepd77hhNNJaiFX5bfi50KR38VgwqIhl1hf+51P4MSS0tqQlj98zVxg0hcmT7c18dSb
 BM3uglfJUtagFx7943y1aypNx0SCf7SsGhpyi
X-Google-Smtp-Source: AGHT+IHi+pt6zImju/NyZ5JtEjJPlJdjWNiRZnmzpVbUhgzUBz1ExYC4BgzyceVyNtRPkeaqMAMV1q5yq7wvDn/CO+U=
X-Received: by 2002:a05:6402:278d:b0:58b:15e4:d786 with SMTP id
 4fb4d7f45d1cf-5c40dacefbamr74233a12.5.1726009540433; Tue, 10 Sep 2024
 16:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
 <47697d5f8d557113244b7c044251fe09@paul-moore.com>
In-Reply-To: <47697d5f8d557113244b7c044251fe09@paul-moore.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 11 Sep 2024 01:05:04 +0200
Message-ID: <CAG48ez1GiPYROLukVwBQhDeFWzp8Xo9uUs-1B5X1YgqNw78dAA@mail.gmail.com>
To: Paul Moore <paul@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.51; envelope-from=jannh@google.com;
 helo=mail-ed1-f51.google.com
Subject: Re: [apparmor] [PATCH v2 1/2] KEYS: use synchronous task work for
 changing parent credentials
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
Cc: linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 Ondrej Mosnacek <omosnace@redhat.com>, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Sep 10, 2024 at 11:07=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> On Aug  5, 2024 Jann Horn <jannh@google.com> wrote:
> > -     cred->session_keyring =3D key_ref_to_ptr(keyring_r);
> > -     keyring_r =3D NULL;
> > -     init_task_work(newwork, key_change_session_keyring);
> > +     /* the parent mustn't be init and mustn't be a kernel thread */
> > +     if (is_global_init(parent) || (READ_ONCE(parent->flags) & PF_KTHR=
EAD) !=3D 0)
> > +             goto put_task;
>
> I think we need to explicitly set @ret if we are failing here, yes?

Ah, yes. Thanks.

