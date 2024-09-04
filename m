Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5E596C8A7
	for <lists+apparmor@lfdr.de>; Wed,  4 Sep 2024 22:37:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1slwka-000249-U0; Wed, 04 Sep 2024 20:37:12 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1slwkZ-00023x-Kc
 for apparmor@lists.ubuntu.com; Wed, 04 Sep 2024 20:37:11 +0000
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6d6a3ab427aso35826127b3.2
 for <apparmor@lists.ubuntu.com>; Wed, 04 Sep 2024 13:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725482230; x=1726087030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+uSNgAoLeuNZ3XWdQeqcMJZ932reV/H1BZ/60TxYWNg=;
 b=kBhEu43dsBzclawFtZ93FbgacWYW9UhfTUipqFFInpKlsaR7WjIcQZ/Ek/+i5VcSu5
 ocSwwltV0/ryPyXZKLkowdnZHEmZST4mGvniljldeNCVy+tdljm3XmC2hthZUOHxxrBp
 gPLtL0AxfIhQH/fIya3Qh+YRiRisQM9AeoIOqPwuXXh5A2L1TjG8x4/OtAEGMBmLNwOx
 S40IMhcCJQjdJHmZRYfobCVw7FaGnAAy3AR4VBRUFh5XyZERHRJJw1gB8Y5xiF/Zzcl0
 0Dc1R1UzGguR2EUwyn1qoZ5t2DDmzlFujmPtKdG+T+VWen6DPOG4m2kH2AuAfXNjJGOI
 v2OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7D4jGO+40vioMH7MtzT5S1BBoXUjl1KS4j1pDxZxXkckZNJ1KbSrZ7/XF5Oo3HxVc3u3WYxx7jQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyLuKA/P/0PLnbOVbTjT7mlhLN8aAEblPElR6jKPAKbNhA+8Xnc
 EjRBp8fEwg9184VPBZzLjruFaiKz7uh0wUhhKXkcm4rMMZvCT80hCKbKXuhtUMWHwF+2J7IlFia
 12btZV1mzhVwBA3NGYa9hEOdhJsITjsmr7Udj
X-Google-Smtp-Source: AGHT+IG9r5awwLWDaSa/SS1wlz6GDBVERagOH9s3xymO+3hCHtxHEKujYrlOkzwl7hougrLaBBg55clsy/6UTBUp4qs=
X-Received: by 2002:a05:690c:4589:b0:6d4:f41d:de2f with SMTP id
 00721157ae682-6d4f42d2475mr143212667b3.39.1725482230428; Wed, 04 Sep 2024
 13:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240830003411.16818-2-casey@schaufler-ca.com>
 <0a6ba6a6dbd423b56801b84b01fa8c41@paul-moore.com>
 <b444ffb9-3ea3-4ef4-b53c-954ea66f7037@schaufler-ca.com>
 <CAHC9VhQ8QDAGc9BsxvPMi6=okwj+euLC+QXL1sgMsr8eHOcx2w@mail.gmail.com>
 <93952b9f-2e40-42fc-9a61-749b9c8ee306@schaufler-ca.com>
In-Reply-To: <93952b9f-2e40-42fc-9a61-749b9c8ee306@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 4 Sep 2024 16:36:59 -0400
Message-ID: <CAHC9VhTwYftY4nLauF8A9AOawAGKdU-+TGoVfM7Paf23x1Vm8w@mail.gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.180; envelope-from=paul@paul-moore.com;
 helo=mail-yw1-f180.google.com
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

On Wed, Sep 4, 2024 at 4:28=E2=80=AFPM Casey Schaufler <casey@schaufler-ca.=
com> wrote:
> On 9/4/2024 1:00 PM, Paul Moore wrote:
> > On Tue, Sep 3, 2024 at 8:53=E2=80=AFPM Casey Schaufler <casey@schaufler=
-ca.com> wrote:
> >> On 9/3/2024 5:18 PM, Paul Moore wrote:
> >>> On Aug 29, 2024 Casey Schaufler <casey@schaufler-ca.com> wrote:
> > ..
> >
> >>>> +/*
> >>>> + * Data exported by the security modules
> >>>> + */
> >>>> +struct lsmblob {
> >>>> +    struct lsmblob_selinux selinux;
> >>>> +    struct lsmblob_smack smack;
> >>>> +    struct lsmblob_apparmor apparmor;
> >>>> +    struct lsmblob_bpf bpf;
> >>>> +    struct lsmblob_scaffold scaffold;
> >>>> +};
> >>> Warning, top shelf bikeshedding follows ...
> >> Not unexpected. :)
> >>
> >>> I believe that historically when we've talked about the "LSM blob" we=
've
> >>> usually been referring to the opaque buffers used to store LSM state =
that
> >>> we attach to a number of kernel structs using the `void *security` fi=
eld.
> >>>
> >>> At least that is what I think of when I read "struct lsmblob", and I'=
d
> >>> like to get ahead of the potential confusion while we still can.
> >>>
> >>> Casey, I'm sure you're priority is simply getting this merged and you
> >>> likely care very little about the name (as long as it isn't too horri=
ble),
> >> I would reject lsmlatefordinner out of hand.
> > Fair enough :)
> >
> >>> but what about "lsm_ref"?  Other ideas are most definitely welcome.
> >> I'm not a fan of the underscore, and ref seems to imply memory managem=
ent.
> >> How about "struct lsmsecid", which is a nod to the past "u32 secid"?
> >> Or, "struct lsmdata", "struct lsmid", "struct lsmattr".
> >> I could live with "struct lsmref", I suppose, although it pulls me tow=
ard
> >> "struct lsmreference", which is a bit long.
> > For what it's worth, I do agree that "ref" is annoyingly similar to a
> > reference counter, I don't love it here, but I'm having a hard time
> > coming up with something appropriate.
> >
> > I also tend to like the underscore, at least in the struct name, as it
> > matches well with the "lsm_ctx" struct we have as part of the UAPI.
> > When we use the struct name in function names, feel free to drop the
> > underscore, for example: "lsm_foo" -> "security_get_lsmfoo()".
> >
> > My first thought was for something like "lsmid" (ignoring the
> > underscore debate), but we already have the LSM_ID_XXX defines which
> > are something entirely different and I felt like we would be trading
> > one source of confusion for another.  There is a similar problem with
> > the LSM_ATTR_XXX defines.
> >
> > We also already have a "lsm_ctx" struct which sort of rules out
> > "lsmctx" for what are hopefully obvious reasons.
> >
> > I'd also like to avoid anything involving "secid" or "secctx" simply
> > because the whole point of this struct is to move past the idea of a
> > single integer or string representing all of the LSM properties for an
> > entity.
> >
> > I can understand "lsm_data", but that is more ambiguous than I would li=
ke.
> >
> > What about "lsm_prop" or "lsm_cred"?
>
> If we ever do the same sort of thing for the existing blobs we're
> going to need to have lsm_cred for the cred blob, so I shan't use
> it here. I can live with lsm_prop, which shouldn't confuse too many
> developers. We can start saying "property" in place of secid, which
> would be a good thing.

Works for me, thanks Casey.

--=20
paul-moore.com

