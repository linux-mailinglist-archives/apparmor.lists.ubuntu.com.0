Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B2C7737FF
	for <lists+apparmor@lfdr.de>; Tue,  8 Aug 2023 07:34:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qTFLs-000297-AZ; Tue, 08 Aug 2023 05:33:52 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kamrankhadijadj@gmail.com>) id 1qTFLp-00028z-RE
 for apparmor@lists.ubuntu.com; Tue, 08 Aug 2023 05:33:49 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-3fe490c05c9so20424545e9.0
 for <apparmor@lists.ubuntu.com>; Mon, 07 Aug 2023 22:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691472829; x=1692077629;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0MpGXuBiuN9koLckS5szeKEmUEXvO5QPu+ncywhWoiA=;
 b=dXveSpIxliCvwAyywLr+6QkZ6nrxpU3g0kRvl817jVrI+TELGMLRuVuQA0mUtpxjfv
 qp9ek7ArN61dppnkaOUz0x60jp75QaNxfSJl35Z4aJrZJv4A27mlzfmlVS6iNzb3kzEA
 sOqwXGNgxE+b0k+nhBI59pkWEqLJystOFWuclYiCJPt/MP/GlsYZckpTqwcC7Ziv44GT
 z+/9KNbvR5dCFaM+y9ASy/uH6wSIcsBolz4I5VJYA1ovrC/pZ/ruD8q/vzdFSqWBITyD
 CraqbOI6Zn0isCXl+3xQBYjFlrtsOeTtwxfKdzUoGwm8NY9vs0FHQVbD0eUVphXIAXVG
 MOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691472829; x=1692077629;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0MpGXuBiuN9koLckS5szeKEmUEXvO5QPu+ncywhWoiA=;
 b=Lb/S2lF4lK81toI4X9ua+ZPXmQd9cmvwe7qBJoUflf8ozPLaAqBTIWUb2souIVMq7/
 px3aIfmJLE+oA6foJ4tolNSXlM7jSCM+4MryS3noNBclTsE3xR+wZ87KxHY8ykkB0FLk
 xLxDuC+5ooUw6Fn+UFJ2vU2NxZwJW6p++Qkh6MnoBstz24YuV4c4j4a67xrQhTThXr2i
 TJWqzaS+8xfOcY6rdqgEQR5cQ0Px8e6150LZu8gRoERU5buqyxYtNyZn+2KO8xVfNWTR
 z03Ie1M+R1THZ+Vda4UbZAy6ilstmSXp5yIxOzLXbqoHb3Jl/RFHDr9Ax/52fNanVJ7h
 +qJA==
X-Gm-Message-State: AOJu0YxOKIyUcvF0zhr+wowWuLh8eENzpewP6lxc0ZC7sdHm3ANm8ixD
 c3PbPeiWQy13s7SVOf7o858=
X-Google-Smtp-Source: AGHT+IH3o9fSz3J+trqyHYXdiDpwfrwl61+YP2/JN6E3g3m41PBKKYJRMnJQG8WwN5bwpD/yKjjAfg==
X-Received: by 2002:a5d:5083:0:b0:317:dcdd:3fa1 with SMTP id
 a3-20020a5d5083000000b00317dcdd3fa1mr5827685wrt.34.1691472828609; 
 Mon, 07 Aug 2023 22:33:48 -0700 (PDT)
Received: from khadija-virtual-machine ([124.29.208.67])
 by smtp.gmail.com with ESMTPSA id
 23-20020a05600c229700b003fbdd5d0758sm12633902wmf.22.2023.08.07.22.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 22:33:47 -0700 (PDT)
Date: Tue, 8 Aug 2023 10:33:44 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Message-ID: <ZNHTuHFDVdCNPXj+@gmail.com>
References: <ZNCWUQXKrZnCeB/5@gmail.com>
 <CAHC9VhT+DPRrSnmh_2PCAf05jPCE-EPaMU_TLB=jJ+mJ+NALsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhT+DPRrSnmh_2PCAf05jPCE-EPaMU_TLB=jJ+mJ+NALsw@mail.gmail.com>
Received-SPF: pass client-ip=209.85.128.41;
 envelope-from=kamrankhadijadj@gmail.com; helo=mail-wm1-f41.google.com
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

On Mon, Aug 07, 2023 at 07:09:33PM -0400, Paul Moore wrote:
> On Mon, Aug 7, 2023 at 2:59 AM Khadija Kamran <kamrankhadijadj@gmail.com> wrote:
> >
> >
> >
> > cap_capget() LSM hook declaration exceeds the 80 characters per line
> > limit. Split the function declaration to multple lines to decrease the
> 
> "multiple" :)
> 
> Don't worry, I'll fix that in the merge.
>

Hey Paul,
Thank you. :)

> There is one more nitpick below, but I think this looks good.  I'll
> give this a few days to see if John can ACK the AppArmor bits, but if
> we don't hear from him by mid-week I'll plan to merge this.
> 
> Thanks!
> 
> > line length.
> >
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> > Changes in v2:
> >  - Squash the patches 1/2 and 2/2 into a single patch
> >  - Simplify the commit message
> >
> >  include/linux/lsm_hook_defs.h | 2 +-
> >  include/linux/security.h      | 7 ++++---
> >  kernel/capability.c           | 2 +-
> >  security/apparmor/lsm.c       | 2 +-
> >  security/commoncap.c          | 2 +-
> >  security/security.c           | 2 +-
> >  security/selinux/hooks.c      | 2 +-
> >  7 files changed, 10 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
> > index 6bb55e61e8e8..fd3844e11077 100644
> > --- a/include/linux/lsm_hook_defs.h
> > +++ b/include/linux/lsm_hook_defs.h
> > @@ -36,7 +36,7 @@ LSM_HOOK(int, 0, binder_transfer_file, const struct cred *from,
> >  LSM_HOOK(int, 0, ptrace_access_check, struct task_struct *child,
> >          unsigned int mode)
> >  LSM_HOOK(int, 0, ptrace_traceme, struct task_struct *parent)
> > -LSM_HOOK(int, 0, capget, struct task_struct *target, kernel_cap_t *effective,
> > +LSM_HOOK(int, 0, capget, const struct task_struct *target, kernel_cap_t *effective,
> >          kernel_cap_t *inheritable, kernel_cap_t *permitted)
> >  LSM_HOOK(int, 0, capset, struct cred *new, const struct cred *old,
> >          const kernel_cap_t *effective, const kernel_cap_t *inheritable,
> > diff --git a/include/linux/security.h b/include/linux/security.h
> > index e2734e9e44d5..fef65d0e522d 100644
> > --- a/include/linux/security.h
> > +++ b/include/linux/security.h
> > @@ -145,7 +145,8 @@ extern int cap_capable(const struct cred *cred, struct user_namespace *ns,
> >  extern int cap_settime(const struct timespec64 *ts, const struct timezone *tz);
> >  extern int cap_ptrace_access_check(struct task_struct *child, unsigned int mode);
> >  extern int cap_ptrace_traceme(struct task_struct *parent);
> > -extern int cap_capget(struct task_struct *target, kernel_cap_t *effective, kernel_cap_t *inheritable, kernel_cap_t *permitted);
> > +extern int cap_capget(const struct task_struct *target, kernel_cap_t *effective,
> > +                                         kernel_cap_t *inheritable, kernel_cap_t *permitted);
> 
> Don't resubmit the patch just for this, I'll fix it during the merge,
> but generally nice to make sure the wrapped lines are aligned with the
> previous line; look at the security_cap_get() declaration (below) in
> this patch to see an example.

Okay noted. 

Regards,
Khadija

> 
> >  extern int cap_capset(struct cred *new, const struct cred *old,
> >                       const kernel_cap_t *effective,
> >                       const kernel_cap_t *inheritable,
> > @@ -271,7 +272,7 @@ int security_binder_transfer_file(const struct cred *from,
> >                                   const struct cred *to, struct file *file);
> >  int security_ptrace_access_check(struct task_struct *child, unsigned int mode);
> >  int security_ptrace_traceme(struct task_struct *parent);
> > -int security_capget(struct task_struct *target,
> > +int security_capget(const struct task_struct *target,
> >                     kernel_cap_t *effective,
> >                     kernel_cap_t *inheritable,
> >                     kernel_cap_t *permitted);
> > @@ -553,7 +554,7 @@ static inline int security_ptrace_traceme(struct task_struct *parent)
> >         return cap_ptrace_traceme(parent);
> >  }
> >
> > -static inline int security_capget(struct task_struct *target,
> > +static inline int security_capget(const struct task_struct *target,
> >                                    kernel_cap_t *effective,
> >                                    kernel_cap_t *inheritable,
> >                                    kernel_cap_t *permitted)
> > diff --git a/kernel/capability.c b/kernel/capability.c
> > index 3e058f41df32..67bdee3414dd 100644
> > --- a/kernel/capability.c
> > +++ b/kernel/capability.c
> > @@ -112,7 +112,7 @@ static inline int cap_get_target_pid(pid_t pid, kernel_cap_t *pEp,
> >         int ret;
> >
> >         if (pid && (pid != task_pid_vnr(current))) {
> > -               struct task_struct *target;
> > +               const struct task_struct *target;
> >
> >                 rcu_read_lock();
> >
> > diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> > index f431251ffb91..12dd96c3b2f0 100644
> > --- a/security/apparmor/lsm.c
> > +++ b/security/apparmor/lsm.c
> > @@ -144,7 +144,7 @@ static int apparmor_ptrace_traceme(struct task_struct *parent)
> >  }
> >
> >  /* Derived from security/commoncap.c:cap_capget */
> > -static int apparmor_capget(struct task_struct *target, kernel_cap_t *effective,
> > +static int apparmor_capget(const struct task_struct *target, kernel_cap_t *effective,
> >                            kernel_cap_t *inheritable, kernel_cap_t *permitted)
> >  {
> >         struct aa_label *label;
> > diff --git a/security/commoncap.c b/security/commoncap.c
> > index 0b3fc2f3afe7..5fd64d3e5bfd 100644
> > --- a/security/commoncap.c
> > +++ b/security/commoncap.c
> > @@ -197,7 +197,7 @@ int cap_ptrace_traceme(struct task_struct *parent)
> >   * This function retrieves the capabilities of the nominated task and returns
> >   * them to the caller.
> >   */
> > -int cap_capget(struct task_struct *target, kernel_cap_t *effective,
> > +int cap_capget(const struct task_struct *target, kernel_cap_t *effective,
> >                kernel_cap_t *inheritable, kernel_cap_t *permitted)
> >  {
> >         const struct cred *cred;
> > diff --git a/security/security.c b/security/security.c
> > index d5ff7ff45b77..fb2d93b481f1 100644
> > --- a/security/security.c
> > +++ b/security/security.c
> > @@ -893,7 +893,7 @@ int security_ptrace_traceme(struct task_struct *parent)
> >   *
> >   * Return: Returns 0 if the capability sets were successfully obtained.
> >   */
> > -int security_capget(struct task_struct *target,
> > +int security_capget(const struct task_struct *target,
> >                     kernel_cap_t *effective,
> >                     kernel_cap_t *inheritable,
> >                     kernel_cap_t *permitted)
> > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > index 79b4890e9936..ff42d49f1b41 100644
> > --- a/security/selinux/hooks.c
> > +++ b/security/selinux/hooks.c
> > @@ -2056,7 +2056,7 @@ static int selinux_ptrace_traceme(struct task_struct *parent)
> >                             SECCLASS_PROCESS, PROCESS__PTRACE, NULL);
> >  }
> >
> > -static int selinux_capget(struct task_struct *target, kernel_cap_t *effective,
> > +static int selinux_capget(const struct task_struct *target, kernel_cap_t *effective,
> >                           kernel_cap_t *inheritable, kernel_cap_t *permitted)
> >  {
> >         return avc_has_perm(current_sid(), task_sid_obj(target),
> > --
> > 2.34.1
> 
> -- 
> paul-moore.com

