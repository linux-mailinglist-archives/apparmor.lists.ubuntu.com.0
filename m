Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACF0724BFD
	for <lists+apparmor@lfdr.de>; Tue,  6 Jun 2023 21:00:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q6buj-00028i-05; Tue, 06 Jun 2023 19:00:16 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <serge@mail.hallyn.com>) id 1q6bug-00028U-6f
 for apparmor@lists.ubuntu.com; Tue, 06 Jun 2023 19:00:14 +0000
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id 8A751F2D; Tue,  6 Jun 2023 14:00:13 -0500 (CDT)
Date: Tue, 6 Jun 2023 14:00:13 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Paul Moore <paul@paul-moore.com>
Message-ID: <20230606190013.GA640488@mail.hallyn.com>
References: <20230511142535.732324-1-cgzones@googlemail.com>
 <20230531140734.GA515872@mail.hallyn.com>
 <20230531140847.GB515872@mail.hallyn.com>
 <CAJ2a_DesiD+LU-aWOEWRkyc0rcmZ0Za5i6-rZX-kHP2GzQyuFg@mail.gmail.com>
 <CAHC9VhQBuQ+yE1wmEYA4UcVwnRFXoyu9_4Qw5LWszUrkm_ornw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhQBuQ+yE1wmEYA4UcVwnRFXoyu9_4Qw5LWszUrkm_ornw@mail.gmail.com>
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
 Christian Brauner <brauner@kernel.org>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, Stephen Smalley <stephen.smalley.work@gmail.com>,
 Frederick Lawler <fred@cloudflare.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, Micah Morton <mortonm@chromium.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Dave Chinner <dchinner@redhat.com>,
 Eric Paris <eparis@parisplace.org>, bpf@vger.kernel.org,
 =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>,
 Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, May 31, 2023 at 06:13:55PM -0400, Paul Moore wrote:
> On Wed, May 31, 2023 at 2:34 PM Christian Göttsche
> <cgzones@googlemail.com> wrote:
> > On Wed, 31 May 2023 at 16:08, Serge E. Hallyn <serge@hallyn.com> wrote:
> > >
> > > On Wed, May 31, 2023 at 09:07:34AM -0500, Serge E. Hallyn wrote:
> > > > On Thu, May 11, 2023 at 04:25:24PM +0200, Christian Göttsche wrote:
> > > > > Introduce a new capable flag, CAP_OPT_NODENYAUDIT, to not generate
> > > > > an audit event if the requested capability is not granted.  This will be
> > > > > used in a new capable_any() functionality to reduce the number of
> > > > > necessary capable calls.
> > > > >
> > > > > Handle the flag accordingly in AppArmor and SELinux.
> > > > >
> > > > > Suggested-by: Paul Moore <paul@paul-moore.com>
> > > > > Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> > > >
> > > > Reviewed-by: Serge Hallyn <serge@hallyn.com>
> > >
> > > Sorry, obviously I should have removed this, until the comment below was
> > > answered :)
> > >
> > > > > ---
> > > > >  include/linux/security.h       |  2 ++
> > > > >  security/apparmor/capability.c |  8 +++++---
> > > > >  security/selinux/hooks.c       | 14 ++++++++------
> > > > >  3 files changed, 15 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/include/linux/security.h b/include/linux/security.h
> > > > > index e2734e9e44d5..629c775ec297 100644
> > > > > --- a/include/linux/security.h
> > > > > +++ b/include/linux/security.h
> > > > > @@ -67,6 +67,8 @@ struct watch_notification;
> > > > >  #define CAP_OPT_NOAUDIT BIT(1)
> > > > >  /* If capable is being called by a setid function */
> > > > >  #define CAP_OPT_INSETID BIT(2)
> > > > > +/* If capable should audit the security request for authorized requests only */
> > > > > +#define CAP_OPT_NODENYAUDIT BIT(3)
> > > > >
> > > > >  /* LSM Agnostic defines for security_sb_set_mnt_opts() flags */
> > > > >  #define SECURITY_LSM_NATIVE_LABELS 1
> > > > > diff --git a/security/apparmor/capability.c b/security/apparmor/capability.c
> > > > > index 326a51838ef2..98120dd62ca7 100644
> > > > > --- a/security/apparmor/capability.c
> > > > > +++ b/security/apparmor/capability.c
> > > > > @@ -108,7 +108,8 @@ static int audit_caps(struct common_audit_data *sa, struct aa_profile *profile,
> > > > >   * profile_capable - test if profile allows use of capability @cap
> > > > >   * @profile: profile being enforced    (NOT NULL, NOT unconfined)
> > > > >   * @cap: capability to test if allowed
> > > > > - * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
> > > > > + * @opts: CAP_OPT_NOAUDIT/CAP_OPT_NODENYAUDIT bit determines whether audit
> > > > > + * record is generated
> > > > >   * @sa: audit data (MAY BE NULL indicating no auditing)
> > > > >   *
> > > > >   * Returns: 0 if allowed else -EPERM
> > > > > @@ -126,7 +127,7 @@ static int profile_capable(struct aa_profile *profile, int cap,
> > > > >     else
> > > > >             error = -EPERM;
> > > > >
> > > > > -   if (opts & CAP_OPT_NOAUDIT) {
> > > > > +   if ((opts & CAP_OPT_NOAUDIT) || ((opts & CAP_OPT_NODENYAUDIT) && error)) {
> > > > >             if (!COMPLAIN_MODE(profile))
> > > > >                     return error;
> > > > >             /* audit the cap request in complain mode but note that it
> > > > > @@ -142,7 +143,8 @@ static int profile_capable(struct aa_profile *profile, int cap,
> > > > >   * aa_capable - test permission to use capability
> > > > >   * @label: label being tested for capability (NOT NULL)
> > > > >   * @cap: capability to be tested
> > > > > - * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
> > > > > + * @opts: CAP_OPT_NOAUDIT/CAP_OPT_NODENYAUDIT bit determines whether audit
> > > > > + * record is generated
> > > > >   *
> > > > >   * Look up capability in profile capability set.
> > > > >   *
> > > > > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > > > > index 79b4890e9936..0730edf2f5f1 100644
> > > > > --- a/security/selinux/hooks.c
> > > > > +++ b/security/selinux/hooks.c
> > > > > @@ -1571,7 +1571,7 @@ static int cred_has_capability(const struct cred *cred,
> > > > >     u16 sclass;
> > > > >     u32 sid = cred_sid(cred);
> > > > >     u32 av = CAP_TO_MASK(cap);
> > > > > -   int rc;
> > > > > +   int rc, rc2;
> > > > >
> > > > >     ad.type = LSM_AUDIT_DATA_CAP;
> > > > >     ad.u.cap = cap;
> > > > > @@ -1590,11 +1590,13 @@ static int cred_has_capability(const struct cred *cred,
> > > > >     }
> > > > >
> > > > >     rc = avc_has_perm_noaudit(sid, sid, sclass, av, 0, &avd);
> > > > > -   if (!(opts & CAP_OPT_NOAUDIT)) {
> > > > > -           int rc2 = avc_audit(sid, sid, sclass, av, &avd, rc, &ad);
> > > > > -           if (rc2)
> > > > > -                   return rc2;
> > > > > -   }
> > > > > +   if ((opts & CAP_OPT_NOAUDIT) || ((opts & CAP_OPT_NODENYAUDIT) && rc))
> > > > > +           return rc;
> > > >
> > > > Hm, if the caller passes only CAP_OPT_NODENYAUDIT, and rc == 0, then
> > > > you will audit the allow.  Is that what you want, or did you want, or
> > > > did you want CAP_OPT_NODENYAUDIT to imply CAP_OPT_NOAUDIT?
> > > >
> >
> > The new option should cause to issue an audit event if (and only if)
> > the requested capability is in effect for the current task. If the
> > task does not have the capability no audit event should be issued.
> >
> > The new option should not imply CAP_OPT_NOAUDIT since we want an audit
> > event in the case the capability is in effect.
> >
> > I admit the naming is a bit confusing as CAP_OPT_NODENYAUDIT as well
> > as the commit description contains a double negation (while the inline
> > comment for the macro definition does not).
> >
> > Do you prefer naming the constant CAP_OPT_ALLOWAUDIT or CAP_OPT_AUDIT_ON_ALLOW?
> 
> I think we need a different name, although I'm struggling to think of
> something ... I don't think ALLOWAUDIT is right, as I believe it
> implies that it is needed to "allow" auditing to take place for the
> operation.  AUDIT_ON_ALLOW is better, but it still seems like it would
> be required if you wanted to generate audit records on a successful
> operation, which isn't correct.  I think we need to focus on the idea
> that the flag blocks auditing for denials.
> 
> CAP_OPT_NOAUDITDENY is pretty much what you have, but in my mind the
> NOAUDITDENY shares enough with the existing NOAUDIT flag that it makes
> a bit more sense.
> 
> I honestly don't know.  However, whatever you pick, make sure you
> update patch 2/X so that the name of ns_capable_nodenyaudit() is kept
> close to the flag's name.

(Sorry for the late response.  I still need to fix my filters)

Is CAP_OPT_NOAUDIT_ONDENY or CAP_OPT_AUDIT_ONLY_ONALLOW too long? :)

Anyway, Christian, I leave the final choice to you, then please feel
free to add my Reviewed-by.

thanks,
-serge

