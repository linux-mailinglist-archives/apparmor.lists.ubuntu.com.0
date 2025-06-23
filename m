Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA4BAE5437
	for <lists+apparmor@lfdr.de>; Tue, 24 Jun 2025 00:00:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uTpCl-0003pm-Q7; Mon, 23 Jun 2025 21:59:55 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uTpCj-0003pH-M2
 for apparmor@lists.ubuntu.com; Mon, 23 Jun 2025 21:59:53 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2A6673F1F4
 for <apparmor@lists.ubuntu.com>; Mon, 23 Jun 2025 21:59:53 +0000 (UTC)
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-ade0abc1ce0so406488266b.3
 for <apparmor@lists.ubuntu.com>; Mon, 23 Jun 2025 14:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750715993; x=1751320793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3je8DUXo1c4bn53B8TrkANhVyCKU4Eu0phr/wqEnFY=;
 b=PCPUt1zw7vS2bOFbO5rTHBjasyALLga4BNKt/8ncu7KalcVt3sSCKWgcILX0bvKrJF
 qSCnp8gzXH4OCjiU4vRGPJdQ+pof2O+VXCzZ1RbRRONAUUmLE/8GssBgI9fN5ycZXopl
 7PwZd7dpVFBEWM/HuE41xL/USUZOt/mp4fXmPLMkt4fSjWEyWrXUavI6HWWOuyziB/U5
 1Xmn/oyvbQcF0iDvmGGFZp9vd+uxL/sVMsiVavt4e49LLM1Bwp//BbK2Dby3BU1dkJBx
 TFnyMjHVdeQmWGH0CI/ZuNW0gzx7A1BBJqjwLWAqhAoC/dKV1laMvWM52loYoVo30RUF
 D7JQ==
X-Gm-Message-State: AOJu0YwMOX8aokUD7RmIyPy8q1vEn+P2t/oK/v3vKdZrO6EpiJT1coKW
 0ahBs0LjmuStTpjbhEI3OlMrGfhPYa2CZfPgP28X6GQnzLXXOd5NN3DzgpOCoqlOEy2xBMQZf4a
 mUlfvTnCd3EWVtfBxA2XEGWHuKuKFwNhLWWonOq1u5y5VwiM5AAm2gUv0QuIVh/JCPDJs9kRK7l
 bTsn7MUIY0yVl5ijHddVIzLuRfMw+xpBiS3YlrZURwDb9DNIiYZ+l+jmeOSMjw3so9Tw==
X-Gm-Gg: ASbGncvNVUINoMpqWjhzQ0M3F4Q6eVBv8ZDm4okZN+9OPB/tUYvnIRTPHn6Cp/P45hS
 NKMlK/m8nSCIXqevwjBfVE2x5kBtS9CFFC7EPczp+X3jpnUkWQOtg4EgbtuXzjxQuH5tEHdLequ
 UFio4=
X-Received: by 2002:a17:907:2d86:b0:ad8:9257:5728 with SMTP id
 a640c23a62f3a-ae057d8cca2mr1418476766b.27.1750715992635; 
 Mon, 23 Jun 2025 14:59:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYr+eCHetFL1BUZKcmo+ca83Zx7VNGSCqpJ5ARWn3whBiF/NxuuYnNazaym7fBQR7rpUZNERg5bxVSDre4cVs=
X-Received: by 2002:a17:907:2d86:b0:ad8:9257:5728 with SMTP id
 a640c23a62f3a-ae057d8cca2mr1418475066b.27.1750715992270; Mon, 23 Jun 2025
 14:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250613163253.125756-1-ryan.lee@canonical.com>
 <cc90bd61-2eaa-4051-bb8c-369ccb71c08e@canonical.com>
In-Reply-To: <cc90bd61-2eaa-4051-bb8c-369ccb71c08e@canonical.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Mon, 23 Jun 2025 14:59:41 -0700
X-Gm-Features: Ac12FXxodxag1dluXScogfVKrqZ06pAO3ZILbslRIFjSm-L-bsgYvCbQoM4Z1Tg
Message-ID: <CAKCV-6sy2JsvA0nyddUyYcCe3OZSDrt4wbtY8aZzm90jUu+b_Q@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH v2 4/4] apparmor: force auditing of
 conflicting attachment execs from confined
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

On Sun, Jun 22, 2025 at 3:00=E2=80=AFPM John Johansen
<john.johansen@canonical.com> wrote:
>
> On 6/13/25 09:32, Ryan Lee wrote:
> > Conflicting attachment paths are an error state that result in the
> > binary in question executing under an unexpected ix/ux fallback. As suc=
h,
> > it should be audited to record the occurrence of conflicting attachment=
s.
> >
> > Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
>
> Ryan,
> your original patch made it into apparmor-next for the 6.16 that never
> happened.
>
> Ideally we wouldn't rebase for this. Can you apply this to apparmor-next
> and send it as a
>
> Fixes: 16916b17b4f8 ("apparmor: force auditing of conflicting attachment =
execs from confined")
> patch
>

Follow-up has been sent as
https://lists.ubuntu.com/archives/apparmor/2025-June/013705.html.

>
> > ---
> >
> > This is a v2 of https://lists.ubuntu.com/archives/apparmor/2025-May/013=
613.html.
> >
> > v1 -> v2: remove redundant perms.allow |=3D MAY_EXEC (which was also in=
correctly outside of the intended conditional)
> >   security/apparmor/domain.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
> > index e8cd9badfb54..b33ce6be9427 100644
> > --- a/security/apparmor/domain.c
> > +++ b/security/apparmor/domain.c
> > @@ -724,6 +724,14 @@ static struct aa_label *profile_transition(const s=
truct cred *subj_cred,
> > @@ -727,6 +727,16 @@ static struct aa_label *profile_transition(const s=
truct cred *subj_cred,
> >               new =3D x_to_label(profile, bprm, name, perms.xindex, &ta=
rget,
> >                                &info);
> >               if (new && new->proxy =3D=3D profile->label.proxy && info=
) {
> > +                     /* Force audit on conflicting attachment fallback
> > +                      * Because perms is never used again after this a=
udit
> > +                      * we don't need to care about clobbering it
> > +                      *
> > +                      * Because perms.allow MAY_EXEC bit is already se=
t
> > +                      * we don't have to set it again
> > +                      */
> > +                     if (info =3D=3D CONFLICTING_ATTACH_STR_IX
> > +                        || info =3D=3D CONFLICTING_ATTACH_STR_UX)
> > +                             perms.audit |=3D MAY_EXEC;
> >                       /* hack ix fallback - improve how this is detecte=
d */
> >                       goto audit;
> >               } else if (!new) {
>

