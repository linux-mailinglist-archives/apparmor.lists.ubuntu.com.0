Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A18D96C81A
	for <lists+apparmor@lfdr.de>; Wed,  4 Sep 2024 22:01:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1slwBk-0004e1-2E; Wed, 04 Sep 2024 20:01:12 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1slwBh-0004aJ-Di
 for apparmor@lists.ubuntu.com; Wed, 04 Sep 2024 20:01:09 +0000
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6da395fb97aso32027037b3.0
 for <apparmor@lists.ubuntu.com>; Wed, 04 Sep 2024 13:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725480068; x=1726084868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bj31Cc7yUKdv/FGIF8ZxPGEVE5FVuiVNrp+0ISWDt4c=;
 b=dKhNz4FWDqME3MY/Du9oG//bQAfcEl9wrbyg3Ra/VgCoDJE8KekXOGqSVgY07lg2P6
 KCd+ZTxCWH2a92p7z90v1LhkYVKhk/KoQsKa4LHIdPrLhJ9KkDIO7zwEpcCvvbNbFRLT
 suKV3mCgQR6BCH8obtuBNcgDNVGJOYb/5qvWtAnXHySBirDxLOqthb2m3GFbBBpU+QRj
 AbNjK8/1cR9ERlpUzATeGKhqCppSvI2i27ZyaKpESVcZDxddBf+/J+41yEK+KS/KdJvI
 lmTBxdZIP1EPHL445TcD9JE92J8QrSFV99e4nhAOm2n0LSUuJ6+yXzqd/I5cErc+Sb/n
 qrBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMs86SUwksj3GqY2KS9+sb530g/yOdOGU2GolQKs+Kfk0TdAO6BqnxapbelzuRTRuaV9cjaS3+nQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YywFyNlL/S7E3DZIqYxSQ5OPbwCZ29hZ+8ZsS5B+XVg7OudkyzO
 Qo04lEMI4zwmW7YGT5EtO7giJYP9VeRtCvJep077AKPVgYLfPXfZFlO2HbfL6ZjTbIctIhAm+I7
 790Nseml3LTO9IPaUFUnq8D2gA8FgsbrbEutL
X-Google-Smtp-Source: AGHT+IHwvQ13BznmsQbX7s8QKh0hPJ3ZlsV9dmecF5yPb9RpjrIRg7UHuPNLul3M/O4Vy1wrYN7rj/2T9vkcOmYq8W8=
X-Received: by 2002:a05:690c:3693:b0:6b1:135:4d84 with SMTP id
 00721157ae682-6d40df8a252mr200806537b3.16.1725480068164; Wed, 04 Sep 2024
 13:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240830003411.16818-2-casey@schaufler-ca.com>
 <0a6ba6a6dbd423b56801b84b01fa8c41@paul-moore.com>
 <b444ffb9-3ea3-4ef4-b53c-954ea66f7037@schaufler-ca.com>
In-Reply-To: <b444ffb9-3ea3-4ef4-b53c-954ea66f7037@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 4 Sep 2024 16:00:57 -0400
Message-ID: <CAHC9VhQ8QDAGc9BsxvPMi6=okwj+euLC+QXL1sgMsr8eHOcx2w@mail.gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.173; envelope-from=paul@paul-moore.com;
 helo=mail-yw1-f173.google.com
Subject: Re: [apparmor] [PATCH v2 1/13] LSM: Add the lsmblob data structure.
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
Cc: keescook@chromium.org, penguin-kernel@i-love.sakura.ne.jp,
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, selinux@vger.kernel.org,
 linux-security-module@vger.kernel.org, mic@digikod.net, bpf@vger.kernel.org,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Sep 3, 2024 at 8:53=E2=80=AFPM Casey Schaufler <casey@schaufler-ca.=
com> wrote:
> On 9/3/2024 5:18 PM, Paul Moore wrote:
> > On Aug 29, 2024 Casey Schaufler <casey@schaufler-ca.com> wrote:

...

> >> +/*
> >> + * Data exported by the security modules
> >> + */
> >> +struct lsmblob {
> >> +    struct lsmblob_selinux selinux;
> >> +    struct lsmblob_smack smack;
> >> +    struct lsmblob_apparmor apparmor;
> >> +    struct lsmblob_bpf bpf;
> >> +    struct lsmblob_scaffold scaffold;
> >> +};
> >
> > Warning, top shelf bikeshedding follows ...
>
> Not unexpected. :)
>
> > I believe that historically when we've talked about the "LSM blob" we'v=
e
> > usually been referring to the opaque buffers used to store LSM state th=
at
> > we attach to a number of kernel structs using the `void *security` fiel=
d.
> >
> > At least that is what I think of when I read "struct lsmblob", and I'd
> > like to get ahead of the potential confusion while we still can.
> >
> > Casey, I'm sure you're priority is simply getting this merged and you
> > likely care very little about the name (as long as it isn't too horribl=
e),
>
> I would reject lsmlatefordinner out of hand.

Fair enough :)

> > but what about "lsm_ref"?  Other ideas are most definitely welcome.
>
> I'm not a fan of the underscore, and ref seems to imply memory management=
.
> How about "struct lsmsecid", which is a nod to the past "u32 secid"?
> Or, "struct lsmdata", "struct lsmid", "struct lsmattr".
> I could live with "struct lsmref", I suppose, although it pulls me toward
> "struct lsmreference", which is a bit long.

For what it's worth, I do agree that "ref" is annoyingly similar to a
reference counter, I don't love it here, but I'm having a hard time
coming up with something appropriate.

I also tend to like the underscore, at least in the struct name, as it
matches well with the "lsm_ctx" struct we have as part of the UAPI.
When we use the struct name in function names, feel free to drop the
underscore, for example: "lsm_foo" -> "security_get_lsmfoo()".

My first thought was for something like "lsmid" (ignoring the
underscore debate), but we already have the LSM_ID_XXX defines which
are something entirely different and I felt like we would be trading
one source of confusion for another.  There is a similar problem with
the LSM_ATTR_XXX defines.

We also already have a "lsm_ctx" struct which sort of rules out
"lsmctx" for what are hopefully obvious reasons.

I'd also like to avoid anything involving "secid" or "secctx" simply
because the whole point of this struct is to move past the idea of a
single integer or string representing all of the LSM properties for an
entity.

I can understand "lsm_data", but that is more ambiguous than I would like.

What about "lsm_prop" or "lsm_cred"?

--=20
paul-moore.com

