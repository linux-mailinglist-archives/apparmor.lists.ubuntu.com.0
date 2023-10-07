Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 063CC7BC339
	for <lists+apparmor@lfdr.de>; Sat,  7 Oct 2023 02:08:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qourD-0006YZ-FS; Sat, 07 Oct 2023 00:07:47 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1qour1-0006Y5-Qk
 for apparmor@lists.ubuntu.com; Sat, 07 Oct 2023 00:07:36 +0000
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-5a22f9e2f40so31810177b3.1
 for <apparmor@lists.ubuntu.com>; Fri, 06 Oct 2023 17:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696637255; x=1697242055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qHD+x7Oh+0e4y3jkxNsQUc1AqCuOyOBHea4bJSZQ5Jc=;
 b=C/xVxFUhcCPb6xELOQxFeHFzvdOG5/x9iYntlDXZw/AZfKPI6rd4zVGQu+SZ+5AV0y
 6ILFoChmd/WC+IZp8FkHZfaRbQlETHS/AMpGUTm3AGcBaPI10RUdqIn2udAIZAuyBhdo
 gLZ4uzcqBAO73ZaLgavmqB7PZVayVtdC15zRYoe59KCMao39h8RFBN66qIgmg9ICHXLg
 swoaqMyczrCU/etuQLS4f5id1Dgt9JU0FhERmmQHDDe2KDdfonBfUFAUj55FNKQLZ/D/
 Om4I+YHwXxKtUtxDYe4H7Du/3x5Vb7++3fUS5/DkQHlPtmYHGvm7PXk/XBoTKwVHqfvN
 dAUA==
X-Gm-Message-State: AOJu0YwjOFTnL3v8oOqZvwUn/h8xd7BXW9DjGuJHOtCz6DrXlRQL3F5Q
 Q5hzGjQrJBwJHYyeFLLoeOfCsbyrClENld3dLPPO
X-Google-Smtp-Source: AGHT+IGMbcbhKR5JWKZAHYDpunJnIyLxNHlcgtMmlQpupe+9la3RMBig2mWSjPeHiH2RjFQs83sxugLVXPbrudQtIXk=
X-Received: by 2002:a25:1502:0:b0:d81:5d5a:25a3 with SMTP id
 2-20020a251502000000b00d815d5a25a3mr8294959ybv.43.1696637254733; Fri, 06 Oct
 2023 17:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAOTMNwuhq9Fc1PW4Y6ZOyP8H7nCk3+9gsxRapRuScZ2-a+14hA@mail.gmail.com>
 <668dd928-b00d-4f7a-5e6a-b6efc6a9c08f@canonical.com>
In-Reply-To: <668dd928-b00d-4f7a-5e6a-b6efc6a9c08f@canonical.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Oct 2023 20:07:23 -0400
Message-ID: <CAHC9VhSQ2U0jhW5Goa+OTTPtx64viGjFWFJy7Y7CsetOaWs6jg@mail.gmail.com>
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

On Wed, Sep 27, 2023 at 8:20=E2=80=AFAM John Johansen
<john.johansen@canonical.com> wrote:
>
> adding paul and the audit list
>
> On 9/26/23 05:56, Andreas Steinmetz wrote:
> > Hi,
> > it happen from time to time while setting up AppArmor properly that
> > instead of creating an audit message AppArmor locks up the system. In
> > most cases I couldn't even get any information, but this time I got
> > some.
> > I don't yet know if this is the case here but in case of "systemd
> > --user" it was a missing grant of cap_sys_resource that caused the
> > lockup. I don't know the exact capability causing the below problem
> > but granting cap_sys_admin, cap_setuid, cap_setgid and
> > cap_sys_resource prevents the lockup so it is definitely capability
> > related. dmesg output follows. Kernel is 6.5.3, distro is Arch Linux.
> >
>
> just to double check, you are using auditd and have some audit filters
> loaded, the code trace indicates yes.
>
> so at a first pass it appears this come when the task calls prlimit64,
> the capability check is denied and apparmor (or really any lsm).
> generates an audit message. The audit message goes into the audit
> subsystems, and there an exe filter which tries to get the task_exe_file
> resulting in deadlock.
>
> do_prlimit()
>         task_lock(tsk->group_leader);
>             ...
>                         if (new_rlim->rlim_max > rlim->rlim_max &&
>                                 !capable(CAP_SYS_RESOURCE))
>                                         ...
>                                         case AUDIT_EXE:
>                                                 result =3D audit_exe_comp=
are(current, e->rule.exe)
>                                                         ...
>                                                         struct file *get_=
task_exe_file(struct task_struct *task)
>                                                                 ...
>                                                                 task_lock=
(task);
>                                                                 ...
>             ...
>         task_unlock(tsk->group_leader);
>
>
> I am not sure how best to handle this.

My apologies for the delay in responding, unfortunately this email was
a bit buried in my inbox and it took me a while to get to it.

Unfortunately, like John, I'm struggling a bit to see how we might
resolve this.  Unfortunately, we don't always know the context in
which audit_filter() is going to be called; in some cases we would
need to ensure the task_lock() was held, in others we may already be
holding it on the current CPU.  The only thing I'm reasonably certain
about is that audit_exe_compare() can't safely use
get_task_exe_file().

I imagine we could think about grabbing a reference to the mm_struct
and stashing it in the audit_context so that we could access
mm_struct::exe_file with only a RCU lock, but then we have to manage
the mm_struct reference in audit_context and I worry that will be ugly
and/or expensive (likely "and").

Does anyone else have any bright ideas or crazy thoughts on this?

--=20
paul-moore.com

