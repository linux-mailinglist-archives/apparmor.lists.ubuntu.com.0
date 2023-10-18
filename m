Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F279E7CE872
	for <lists+apparmor@lfdr.de>; Wed, 18 Oct 2023 22:04:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qtCli-0007bR-7s; Wed, 18 Oct 2023 20:03:50 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1qtCla-0007b7-R8
 for apparmor@lists.ubuntu.com; Wed, 18 Oct 2023 20:03:43 +0000
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-d9a3d737d66so7708771276.2
 for <apparmor@lists.ubuntu.com>; Wed, 18 Oct 2023 13:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697659422; x=1698264222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w4Gxw1C8KcIs53WSGBMfXhJG2TCDEjZFtIERU3MURUA=;
 b=ZFOAnl5mXC4yL5NPJ0Y6FNmxq7Lrd+qzu+YoPBVMGcAgejdZhh4vYvZ9krl4SGkp4t
 +Lj1PXhJ+R+nnIowElCPXK1t/yY0IQGA8sjJg8258J5bD2EMpH4Zd3POtjgtc4aYPT3N
 o7ZxhyEX85HRlxsVdrpUqeGag/wH7DBf/tFMnvNZNoLhEiVe4CcqajUXXT4uD7p6kSb1
 +tRE22d7gqR5jX09yMYGlko+dgM5RGl3zdX24rjJ/tiVo1YPTNlaxAMo9Xu1jc0SlzAr
 pzGsfMi2qRu6dynt9JMsEpyI/vAm8jQXtbUfHhNJF1gp9H5VjSGRuaWkQPleqvxG0Nib
 Barg==
X-Gm-Message-State: AOJu0Yw/Z1QIl5EWhgpRcfYHFJCqIfC5aWpG8d3z6qhODROhaFTG0Z0T
 kvnvLjUuouLQCElG2AuDZEKCsUSeZbUsyrwQNJEA
X-Google-Smtp-Source: AGHT+IG+JHFLaubNRx8yq+mgVsUfH7/oin1xEPgvhRmNHownjZYLVap7Gi16lGJ+fOWv9Oft51bGkuhMW93w8m7l84w=
X-Received: by 2002:a25:abf2:0:b0:d9c:66d1:958f with SMTP id
 v105-20020a25abf2000000b00d9c66d1958fmr391386ybi.55.1697659421574; Wed, 18
 Oct 2023 13:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAOTMNwuhq9Fc1PW4Y6ZOyP8H7nCk3+9gsxRapRuScZ2-a+14hA@mail.gmail.com>
 <668dd928-b00d-4f7a-5e6a-b6efc6a9c08f@canonical.com>
 <CAHC9VhSQ2U0jhW5Goa+OTTPtx64viGjFWFJy7Y7CsetOaWs6jg@mail.gmail.com>
 <CAOTMNwsca-CuzOdmc5HeUCtBGWJVKb2GB_r1QEF-TnJv1Kkhyg@mail.gmail.com>
 <CAHC9VhQNTiX=na2a1QsAQWwPfjuvd2xnFGHAPxTs=wQXNt6eZg@mail.gmail.com>
 <6da3d0b6-aaae-4586-bd71-749d6fb38708@canonical.com>
 <CAHC9VhToqz-hs8vuUhd=vNKOXNc_iXOAbtuVTNGWJUvbbzq_kQ@mail.gmail.com>
In-Reply-To: <CAHC9VhToqz-hs8vuUhd=vNKOXNc_iXOAbtuVTNGWJUvbbzq_kQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Oct 2023 16:03:29 -0400
Message-ID: <CAHC9VhQyb_SfA0_=fqrVLZjYj76gLzwnf2Gs3j73FRVD-0vGeg@mail.gmail.com>
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

On Mon, Oct 9, 2023 at 1:51=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
> On Mon, Oct 9, 2023 at 1:41=E2=80=AFPM John Johansen
> <john.johansen@canonical.com> wrote:
> > On 10/9/23 10:06, Paul Moore wrote:
> > > I don't think anyone is objecting to resolving this, it's more a
> > > matter of *how* we can resolve it.
> >
> > currently I am see four crazy/stupid paths forward, each with their own
> > pain points.

...

> > 4. caching a reference in the audit_context as paul has suggested.
>
> I don't like this idea, but I'm struggling to come up with something
> less awful.  Below is a quick, untested patch to describe the concept
> with code.  It is worth noting that we don't take a mm_struct
> reference in the io_uring entry point because I'm not sure filtering
> on the executable file makes much sense there given the async nature
> of io_uring, however I'm open to comments here (as well as pretty much
> everything else in this pseudo-patch).

Looking at this a bit more, I'm now wondering if there is a fifth
option: call mmget() directly and skip the task_lock().

Take a look at the move_pages(2) code path:

 SYSCALL_DEFINE6(move_pages, ...)
   -> kernel_move_pages(...)
     -> find_mm_struct(...)
       -> mmget(...)

In find_mm_struct(), if the task being manipulated is *not* the
current task then get_task_mm() is called, which takes task_lock().
However, if the task being manipulated *is* the current task then the
task_lock() can be avoided and a direct call to get_mm() is used;
get_mm() does a simple atomic_inc() without any additional locking.

What do you think of this approach (untested, copy-n-pasted patch):

diff --git a/kernel/audit_watch.c b/kernel/audit_watch.c
index 65075f1e4ac8..ffd17ad97324 100644
--- a/kernel/audit_watch.c
+++ b/kernel/audit_watch.c
@@ -526,8 +526,19 @@ int audit_exe_compare(struct task_struct *tsk, struct =
audit
_fsnotify_mark *mark)
       struct file *exe_file;
       unsigned long ino;
       dev_t dev;
+       struct mm_struct *mm;

-       exe_file =3D get_task_exe_file(tsk);
+       /* almost always (always?) comparing @current, but handle both case=
s */
+       if (likely(tsk =3D=3D current)) {
+               mmget(current->mm);
+               mm =3D current->mm;
+       } else {
+               mm =3D get_task_mm(tsk);
+               if (!mm)
+                       return 0;
+       }
+       exe_file =3D get_mm_exe_file(mm);
+       mmput(mm);
       if (!exe_file)
               return 0;
       ino =3D file_inode(exe_file)->i_ino;

--
paul-moore.com

