Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFE87CE966
	for <lists+apparmor@lfdr.de>; Wed, 18 Oct 2023 22:51:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qtDVO-0000VO-JD; Wed, 18 Oct 2023 20:51:02 +0000
Received: from mail-yb1-f180.google.com ([209.85.219.180])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1qtDVI-0000VH-VV
 for apparmor@lists.ubuntu.com; Wed, 18 Oct 2023 20:50:57 +0000
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-d9a6b21d1daso8452262276.3
 for <apparmor@lists.ubuntu.com>; Wed, 18 Oct 2023 13:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697662256; x=1698267056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KN6f1Ml7961JRQwvUIDIpjC4WOraH1mCSiOZgezmG1w=;
 b=bB0cXR91lsPljD2S1kMNbZfoJx/sy3drO+pIuKbJhy+T/WMhkqBncss32TXDzeVWhy
 IMwktNwoSOrbhxxaBovLSXwgyQ7gs2dBSVXCApYTp0/Zi/trYvzK+QXI3WK0ofvViEFj
 FJX/U42mpak6Hg/kJ4oUHFmn/W30HKY4x6GJpjpu0cw8tu4C8zh6ahSvibV04RKl1mWO
 sD5N7g5sHaBet0Cv5jWS0XsJlMBybVmfF+uisr0JNoduohtULWf93vdNn5hZ+p6V0Nbr
 V/8koQ9sIEg+rkEI1KygqwEoxpRmvIIKufHTM133MwvHb85tg8eIjumr2ivycrq2R1Pc
 EwLw==
X-Gm-Message-State: AOJu0Yw4imHiQhFgRvs5FbeqJR/31a4vbs9uZadiq2P9PsZ7RWMW0hLH
 rCQ3yHN8JD5jRyG8M+hjVQO/3QwUv23aVKRG7VdeL2Akk0/P8tA=
X-Google-Smtp-Source: AGHT+IG3PJnwxGdeZMAqqvIUieMyj7asoX9P3m88scMV3ga8Q6/nF1ZoYSHGn3OqTzUWhVrUfJ1uIPJiHVos7jK9X2I=
X-Received: by 2002:a25:818e:0:b0:d77:e338:1b6b with SMTP id
 p14-20020a25818e000000b00d77e3381b6bmr567749ybk.14.1697662255939; Wed, 18 Oct
 2023 13:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAOTMNwuhq9Fc1PW4Y6ZOyP8H7nCk3+9gsxRapRuScZ2-a+14hA@mail.gmail.com>
 <668dd928-b00d-4f7a-5e6a-b6efc6a9c08f@canonical.com>
 <CAHC9VhSQ2U0jhW5Goa+OTTPtx64viGjFWFJy7Y7CsetOaWs6jg@mail.gmail.com>
 <CAOTMNwsca-CuzOdmc5HeUCtBGWJVKb2GB_r1QEF-TnJv1Kkhyg@mail.gmail.com>
 <CAHC9VhQNTiX=na2a1QsAQWwPfjuvd2xnFGHAPxTs=wQXNt6eZg@mail.gmail.com>
 <6da3d0b6-aaae-4586-bd71-749d6fb38708@canonical.com>
 <CAHC9VhToqz-hs8vuUhd=vNKOXNc_iXOAbtuVTNGWJUvbbzq_kQ@mail.gmail.com>
 <CAHC9VhQyb_SfA0_=fqrVLZjYj76gLzwnf2Gs3j73FRVD-0vGeg@mail.gmail.com>
 <740fe39c-dab5-4ec9-b717-f5168e689985@canonical.com>
In-Reply-To: <740fe39c-dab5-4ec9-b717-f5168e689985@canonical.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Oct 2023 16:50:45 -0400
Message-ID: <CAHC9VhQTbTkQzCdicPtj7WfEhJgmkX=zxPNu9cGVmHhbbzBzcg@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] AppArmor kernel audit locks up system
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
Cc: audit@vger.kernel.org, apparmor@lists.ubuntu.com,
 Andreas Steinmetz <anstein99@googlemail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Oct 18, 2023 at 4:34=E2=80=AFPM John Johansen
<john.johansen@canonical.com> wrote:
> On 10/18/23 13:03, Paul Moore wrote:
> > On Mon, Oct 9, 2023 at 1:51=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> >> On Mon, Oct 9, 2023 at 1:41=E2=80=AFPM John Johansen
> >> <john.johansen@canonical.com> wrote:
> >>> On 10/9/23 10:06, Paul Moore wrote:
> >>>> I don't think anyone is objecting to resolving this, it's more a
> >>>> matter of *how* we can resolve it.
> >>>
> >>> currently I am see four crazy/stupid paths forward, each with their o=
wn
> >>> pain points.
> >
> > ...
> >
> >>> 4. caching a reference in the audit_context as paul has suggested.
> >>
> >> I don't like this idea, but I'm struggling to come up with something
> >> less awful.  Below is a quick, untested patch to describe the concept
> >> with code.  It is worth noting that we don't take a mm_struct
> >> reference in the io_uring entry point because I'm not sure filtering
> >> on the executable file makes much sense there given the async nature
> >> of io_uring, however I'm open to comments here (as well as pretty much
> >> everything else in this pseudo-patch).
> >
> > Looking at this a bit more, I'm now wondering if there is a fifth
> > option: call mmget() directly and skip the task_lock().
> >
> > Take a look at the move_pages(2) code path:
> >
> >   SYSCALL_DEFINE6(move_pages, ...)
> >     -> kernel_move_pages(...)
> >       -> find_mm_struct(...)
> >         -> mmget(...)
> >
> > In find_mm_struct(), if the task being manipulated is *not* the
> > current task then get_task_mm() is called, which takes task_lock().
> > However, if the task being manipulated *is* the current task then the
> > task_lock() can be avoided and a direct call to get_mm() is used;
> > get_mm() does a simple atomic_inc() without any additional locking.
> >
> > What do you think of this approach (untested, copy-n-pasted patch):
> >
> hrmmm, I like the idea but the task !=3D current path still suffers from
> the issue. If we can verify this case never happens great, otherwise
> we either bail on that case or still need to come up with an
> alternative.

It shouldn't, the only time we ever really operate on something other
than @current is when a fork/clone happens and we are filtering on the
new child process.  At least that used to be the case, I can't imagine
someone would audit something other than @current (not sure you could
with respect to this stuff?), but I guess it couldn't hurt to double
check on the current code base.

> otherwise it looks good

It just passed through the audit and SELinux test suites without
problem, so I'm hopeful this might be a viable solution.

> > diff --git a/kernel/audit_watch.c b/kernel/audit_watch.c
> > index 65075f1e4ac8..ffd17ad97324 100644
> > --- a/kernel/audit_watch.c
> > +++ b/kernel/audit_watch.c
> > @@ -526,8 +526,19 @@ int audit_exe_compare(struct task_struct *tsk, str=
uct audit
> > _fsnotify_mark *mark)
> >         struct file *exe_file;
> >         unsigned long ino;
> >         dev_t dev;
> > +       struct mm_struct *mm;
> >
> > -       exe_file =3D get_task_exe_file(tsk);
> > +       /* almost always (always?) comparing @current, but handle both =
cases */
> > +       if (likely(tsk =3D=3D current)) {
> > +               mmget(current->mm);
> > +               mm =3D current->mm;
> > +       } else {
> > +               mm =3D get_task_mm(tsk);
> > +               if (!mm)
> > +                       return 0;
> > +       }
> > +       exe_file =3D get_mm_exe_file(mm);> +       mmput(mm);
> >         if (!exe_file)
> >                 return 0;
> >         ino =3D file_inode(exe_file)->i_ino;
> >
> > --
> > paul-moore.com

--=20
paul-moore.com

