Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3A8774BD3
	for <lists+apparmor@lfdr.de>; Tue,  8 Aug 2023 22:57:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qTTlU-0003E9-P8; Tue, 08 Aug 2023 20:57:16 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <paul@paul-moore.com>) id 1qTTlT-0003E2-TZ
 for apparmor@lists.ubuntu.com; Tue, 08 Aug 2023 20:57:16 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-56cb1e602e7so3898430eaf.1
 for <apparmor@lists.ubuntu.com>; Tue, 08 Aug 2023 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1691528234; x=1692133034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TS5jj+LJIlaFmebXscgv7ALonGJ5hEAqrVobn+h6tkY=;
 b=Y9hnaF54b9OdWRu8Mgo3/Um7XsJJt1IeTsHVaRqVcf1uJTYzuVx8plDvnbGPQQj30O
 nuYIxW1noSDzKhQn1bQvSQjWSQiphGrfkmDI07IJvzTyThMAKGpcSqKUnJEXOZIy4UfX
 kXhFh2CXld2Se0q0gmX+7ubme4nz6vRkqdHfLaSNTcgpkdiCs2y3lAwXmLZFgAKvIYhL
 tdmIKD6prK1gA2c3AyFva39ZjOX8CAU9OsRde34oHqg4rDAv7Z8snLfK96+XkNaGF3Gy
 KXOAdkwWxfBvmL9pFbiIERAOmX3yVhxYD3nsKV0Ml3S+yxxPlRvZ2OxG5MQgQmsS/j3a
 ewuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528234; x=1692133034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TS5jj+LJIlaFmebXscgv7ALonGJ5hEAqrVobn+h6tkY=;
 b=bpZMw1ehXXDYaeHYXU7VM5DhZoV0hDus/pBoi50w0cUIvXSaUtm5Krz0jHvtklQdMV
 elenaf2Fh6/C0Gn+6AlIBu7Wzrj4zc6PvpzGHfoWSUY5H92/5OxZv7Y4D5uARm33Yy1S
 D2hu66VoT2GVSfB1yUD2TYKEjb1fo29ysPGBi4yd0TAQyv8ieYi1gpwmFiRg3BD/5UZi
 vt73kvcRUzeg9Tcwf3EhyJBstVg9mT8RxuvSw5N+SHP34870l8Ne2xqmrj5E44Gb4EMd
 /Z/57jdeSpKZjNAuWEJ06xsRp4BkAw2SjXs+00r3aSZtIJKz5PaSewDz8TRj2Gr2hRN1
 seHg==
X-Gm-Message-State: AOJu0YwUJXFCTjv4iTt3Xntgo4d5ijHjdGMKdJ4OkT3isL6WaFLKLq1r
 f+cVmJjW16sqiWKmeMZRiyP6Cwc9P7wxzqNxFep9
X-Google-Smtp-Source: AGHT+IF6at6g2JHJkuRBhYYtMLf3GXfKz3mwW2gLejTNbDRqI3v7TYVl5ylxtV0uehKkfpThdRY8EvckgK0r71MA1+k=
X-Received: by 2002:a05:6358:8820:b0:139:a866:4155 with SMTP id
 hv32-20020a056358882000b00139a8664155mr503973rwb.5.1691528234358; Tue, 08 Aug
 2023 13:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <ZNCWUQXKrZnCeB/5@gmail.com>
 <CAHC9VhT+DPRrSnmh_2PCAf05jPCE-EPaMU_TLB=jJ+mJ+NALsw@mail.gmail.com>
 <ZNHTuHFDVdCNPXj+@gmail.com>
In-Reply-To: <ZNHTuHFDVdCNPXj+@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 8 Aug 2023 16:57:03 -0400
Message-ID: <CAHC9VhTUZe0khZCy7oow4RZYgk-9wh18_78gQY1+ikSqECNq6A@mail.gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH v2] lsm: constify the 'target' parameter in
	security_capget()
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
Cc: Alison Schofield <alison.schofield@intel.com>, selinux@vger.kernel.org,
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 eparis@parisplace.org, ztarkhani@microsoft.com, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Aug 8, 2023 at 1:33=E2=80=AFAM Khadija Kamran <kamrankhadijadj@gmai=
l.com> wrote:
>
> On Mon, Aug 07, 2023 at 07:09:33PM -0400, Paul Moore wrote:
> > On Mon, Aug 7, 2023 at 2:59=E2=80=AFAM Khadija Kamran <kamrankhadijadj@=
gmail.com> wrote:
> > >
> > >
> > >
> > > cap_capget() LSM hook declaration exceeds the 80 characters per line
> > > limit. Split the function declaration to multple lines to decrease th=
e
> >
> > "multiple" :)
> >
> > Don't worry, I'll fix that in the merge.
> >
>
> Hey Paul,
> Thank you. :)

... and now it's merged :)

--=20
paul-moore.com

