Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C10718973
	for <lists+apparmor@lfdr.de>; Wed, 31 May 2023 20:34:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q4QeQ-0006ue-UH; Wed, 31 May 2023 18:34:26 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cgzones@googlemail.com>) id 1q4QeO-0006uT-IM
 for apparmor@lists.ubuntu.com; Wed, 31 May 2023 18:34:24 +0000
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-437d6a60763so927645137.0
 for <apparmor@lists.ubuntu.com>; Wed, 31 May 2023 11:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1685558063; x=1688150063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=33aBmP8iR+QR8+u9TV+rf6CnvGlRTn2mBObMMEn9tYI=;
 b=LJV/baSrmGNc6tPk8ylKWCuIGECOqrJVAVpDb70Ahb/I/1D8qf9DOJx5k77MTQoFfa
 p0hdUBhDBzbJBxcYuLo6cQm1LMrXF7Vo2SxMR5zTWN/Is8PE1ctmCI6pV2IhGQWnulM1
 qkkehs/umBSgRNRuenpGCPFSSnqTh4mM0SIbamrJ5Tr9MBm2LhMfMcL/VgqQ83JEzS1V
 xDFyFnGaN3e7afBSbvYJ5IlzbJn50hWvHYBylRWqvcdAF+Ezm0+QzhYqAYD5tVRVvJXs
 fDbP8y7KTddD3vehSfc8T8j7EJTVogaPc79b+Gz2I+f4zxMfPaFVXpbrtUnW4a8Pft5h
 8qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685558063; x=1688150063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=33aBmP8iR+QR8+u9TV+rf6CnvGlRTn2mBObMMEn9tYI=;
 b=PnUzK/83owZuwukPOIHK/tAYyh9RPqNMTrt/o4AiRLhfGSZjRp0ieNOzjbDcUNF/aB
 BGYwoAIgeEKwHdNBG3sPPSJtNqr6TKDWAiM91Nz2hRsD1hc7DrYUc6vYBFR/YrPUM9Xb
 fxXLOW9HhzCQmQU/LSKr/8D6y3pqNEI8gUKjR8NT/PMJDWDKeHSIQRtvPsak5SlwD64L
 XqwNCHqrPN/hVYIK8AlmM2nDGM8cy2TOIymll44BsYlu5BrJL/Zf1gOVqIeO7RKiY9QY
 WIfgD4WrAjNXhm7wYNJ9bOigRecbFMlKQp14PzIZMcZFW5PcW5NSOfuw6ecjQEI2JOc3
 nOLA==
X-Gm-Message-State: AC+VfDzewpUrzvmZljj3iVcimXbjGTm3BnvEOZ2Cgiq41CjWyjbHZwSC
 rXaX1B2PEpS5rXRqr3hMM5eg8zeL0WeFYNJAlx4=
X-Google-Smtp-Source: ACHHUZ6x+ftYwcavcU6cEhCbwmLmHjhiqOMdfkvnF8KWuF3QQHKffvs9igoEYqyQoZ3HESUrPljfu9omFesj5xaVEh0=
X-Received: by 2002:a05:6102:374:b0:439:4fb6:83fa with SMTP id
 f20-20020a056102037400b004394fb683famr5202635vsa.9.1685558062408; Wed, 31 May
 2023 11:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230511142535.732324-1-cgzones@googlemail.com>
 <20230531140734.GA515872@mail.hallyn.com>
 <20230531140847.GB515872@mail.hallyn.com>
In-Reply-To: <20230531140847.GB515872@mail.hallyn.com>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Wed, 31 May 2023 20:34:11 +0200
Message-ID: <CAJ2a_DesiD+LU-aWOEWRkyc0rcmZ0Za5i6-rZX-kHP2GzQyuFg@mail.gmail.com>
To: "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.44;
 envelope-from=cgzones@googlemail.com; helo=mail-vs1-f44.google.com
Subject: Re: [apparmor] [PATCH v4 1/9] capability: introduce new capable
	flag NODENYAUDIT
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linux-security-module@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, Micah Morton <mortonm@chromium.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Dave Chinner <dchinner@redhat.com>,
 Eric Paris <eparis@parisplace.org>, bpf@vger.kernel.org,
 Frederick Lawler <fred@cloudflare.com>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, 31 May 2023 at 16:08, Serge E. Hallyn <serge@hallyn.com> wrote:
>
> On Wed, May 31, 2023 at 09:07:34AM -0500, Serge E. Hallyn wrote:
> > On Thu, May 11, 2023 at 04:25:24PM +0200, Christian G=C3=B6ttsche wrote=
:
> > > Introduce a new capable flag, CAP_OPT_NODENYAUDIT, to not generate
> > > an audit event if the requested capability is not granted.  This will=
 be
> > > used in a new capable_any() functionality to reduce the number of
> > > necessary capable calls.
> > >
> > > Handle the flag accordingly in AppArmor and SELinux.
> > >
> > > Suggested-by: Paul Moore <paul@paul-moore.com>
> > > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> >
> > Reviewed-by: Serge Hallyn <serge@hallyn.com>
>
> Sorry, obviously I should have removed this, until the comment below was
> answered :)
>
> > > ---
> > >  include/linux/security.h       |  2 ++
> > >  security/apparmor/capability.c |  8 +++++---
> > >  security/selinux/hooks.c       | 14 ++++++++------
> > >  3 files changed, 15 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/include/linux/security.h b/include/linux/security.h
> > > index e2734e9e44d5..629c775ec297 100644
> > > --- a/include/linux/security.h
> > > +++ b/include/linux/security.h
> > > @@ -67,6 +67,8 @@ struct watch_notification;
> > >  #define CAP_OPT_NOAUDIT BIT(1)
> > >  /* If capable is being called by a setid function */
> > >  #define CAP_OPT_INSETID BIT(2)
> > > +/* If capable should audit the security request for authorized reque=
sts only */
> > > +#define CAP_OPT_NODENYAUDIT BIT(3)
> > >
> > >  /* LSM Agnostic defines for security_sb_set_mnt_opts() flags */
> > >  #define SECURITY_LSM_NATIVE_LABELS 1
> > > diff --git a/security/apparmor/capability.c b/security/apparmor/capab=
ility.c
> > > index 326a51838ef2..98120dd62ca7 100644
> > > --- a/security/apparmor/capability.c
> > > +++ b/security/apparmor/capability.c
> > > @@ -108,7 +108,8 @@ static int audit_caps(struct common_audit_data *s=
a, struct aa_profile *profile,
> > >   * profile_capable - test if profile allows use of capability @cap
> > >   * @profile: profile being enforced    (NOT NULL, NOT unconfined)
> > >   * @cap: capability to test if allowed
> > > - * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is gen=
erated
> > > + * @opts: CAP_OPT_NOAUDIT/CAP_OPT_NODENYAUDIT bit determines whether=
 audit
> > > + * record is generated
> > >   * @sa: audit data (MAY BE NULL indicating no auditing)
> > >   *
> > >   * Returns: 0 if allowed else -EPERM
> > > @@ -126,7 +127,7 @@ static int profile_capable(struct aa_profile *pro=
file, int cap,
> > >     else
> > >             error =3D -EPERM;
> > >
> > > -   if (opts & CAP_OPT_NOAUDIT) {
> > > +   if ((opts & CAP_OPT_NOAUDIT) || ((opts & CAP_OPT_NODENYAUDIT) && =
error)) {
> > >             if (!COMPLAIN_MODE(profile))
> > >                     return error;
> > >             /* audit the cap request in complain mode but note that i=
t
> > > @@ -142,7 +143,8 @@ static int profile_capable(struct aa_profile *pro=
file, int cap,
> > >   * aa_capable - test permission to use capability
> > >   * @label: label being tested for capability (NOT NULL)
> > >   * @cap: capability to be tested
> > > - * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is gen=
erated
> > > + * @opts: CAP_OPT_NOAUDIT/CAP_OPT_NODENYAUDIT bit determines whether=
 audit
> > > + * record is generated
> > >   *
> > >   * Look up capability in profile capability set.
> > >   *
> > > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > > index 79b4890e9936..0730edf2f5f1 100644
> > > --- a/security/selinux/hooks.c
> > > +++ b/security/selinux/hooks.c
> > > @@ -1571,7 +1571,7 @@ static int cred_has_capability(const struct cre=
d *cred,
> > >     u16 sclass;
> > >     u32 sid =3D cred_sid(cred);
> > >     u32 av =3D CAP_TO_MASK(cap);
> > > -   int rc;
> > > +   int rc, rc2;
> > >
> > >     ad.type =3D LSM_AUDIT_DATA_CAP;
> > >     ad.u.cap =3D cap;
> > > @@ -1590,11 +1590,13 @@ static int cred_has_capability(const struct c=
red *cred,
> > >     }
> > >
> > >     rc =3D avc_has_perm_noaudit(sid, sid, sclass, av, 0, &avd);
> > > -   if (!(opts & CAP_OPT_NOAUDIT)) {
> > > -           int rc2 =3D avc_audit(sid, sid, sclass, av, &avd, rc, &ad=
);
> > > -           if (rc2)
> > > -                   return rc2;
> > > -   }
> > > +   if ((opts & CAP_OPT_NOAUDIT) || ((opts & CAP_OPT_NODENYAUDIT) && =
rc))
> > > +           return rc;
> >
> > Hm, if the caller passes only CAP_OPT_NODENYAUDIT, and rc =3D=3D 0, the=
n
> > you will audit the allow.  Is that what you want, or did you want, or
> > did you want CAP_OPT_NODENYAUDIT to imply CAP_OPT_NOAUDIT?
> >

The new option should cause to issue an audit event if (and only if)
the requested capability is in effect for the current task. If the
task does not have the capability no audit event should be issued.

The new option should not imply CAP_OPT_NOAUDIT since we want an audit
event in the case the capability is in effect.

I admit the naming is a bit confusing as CAP_OPT_NODENYAUDIT as well
as the commit description contains a double negation (while the inline
comment for the macro definition does not).

Do you prefer naming the constant CAP_OPT_ALLOWAUDIT or CAP_OPT_AUDIT_ON_AL=
LOW?

> > > +
> > > +   rc2 =3D avc_audit(sid, sid, sclass, av, &avd, rc, &ad);
> > > +   if (rc2)
> > > +           return rc2;
> > > +
> > >     return rc;
> > >  }
> > >
> > > --
> > > 2.40.1

