Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 862A67BE8B3
	for <lists+apparmor@lfdr.de>; Mon,  9 Oct 2023 19:51:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qpuPv-0003eW-Pu; Mon, 09 Oct 2023 17:51:43 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1qpuPn-0003eA-0f
 for apparmor@lists.ubuntu.com; Mon, 09 Oct 2023 17:51:35 +0000
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-d9a518d66a1so7443276.0
 for <apparmor@lists.ubuntu.com>; Mon, 09 Oct 2023 10:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696873894; x=1697478694;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+SQFLOVL26ISAamx07pqwYfNUbmzEOzTQvF4d1QDaE=;
 b=xMP8ATAajWr7Wri4UBGNddm3P7xZ9cHL+zDwWxrFtdok4WFVRr9+2MoGoYF+B+uXmF
 200pTx1H42tDIlkgHHWuEvtW+ssz2tS3bnkhdCGAXBmVVmk4xpOP5YgNsPZgcG2Fs6AH
 MZg332E0J37L82iRQ7FivYE7Nezj8yfb2RUZ0nzmYiJ2A2MJvGjyUXJ0pIYF04v7J1p2
 dKGybODF+7WLWbstaOGDBcfZp4CmW8xvYowiUnINjU60I6Dmq3JS7rB44cQO+AdnPS/Q
 alIlKluDUVT6GFrAO4eGFHCquhWsqxIagMmfB7hwWmDE9hUddyVBshZJIQHic1c+RkNR
 ltMQ==
X-Gm-Message-State: AOJu0YzvLGbp1iVbKNPWvI28AxrcPe20nYvldZjzJAW927ehkRdVU3t6
 TmnY7L5wWlGNBpz/SL4swX4QxPCT9XUKroUTwCqX
X-Google-Smtp-Source: AGHT+IGzoL+NbJqZw7oG5q5gMEu/Eho2XM2TlPXvREYmtRVqwoJefN/f5Lpb9kdbL4ttrvBxqXN7rv/WBpgG+5iGocw=
X-Received: by 2002:a25:4903:0:b0:d81:9cdf:1795 with SMTP id
 w3-20020a254903000000b00d819cdf1795mr13548112yba.57.1696873893792; Mon, 09
 Oct 2023 10:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAOTMNwuhq9Fc1PW4Y6ZOyP8H7nCk3+9gsxRapRuScZ2-a+14hA@mail.gmail.com>
 <668dd928-b00d-4f7a-5e6a-b6efc6a9c08f@canonical.com>
 <CAHC9VhSQ2U0jhW5Goa+OTTPtx64viGjFWFJy7Y7CsetOaWs6jg@mail.gmail.com>
 <CAOTMNwsca-CuzOdmc5HeUCtBGWJVKb2GB_r1QEF-TnJv1Kkhyg@mail.gmail.com>
 <CAHC9VhQNTiX=na2a1QsAQWwPfjuvd2xnFGHAPxTs=wQXNt6eZg@mail.gmail.com>
 <6da3d0b6-aaae-4586-bd71-749d6fb38708@canonical.com>
In-Reply-To: <6da3d0b6-aaae-4586-bd71-749d6fb38708@canonical.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Oct 2023 13:51:22 -0400
Message-ID: <CAHC9VhToqz-hs8vuUhd=vNKOXNc_iXOAbtuVTNGWJUvbbzq_kQ@mail.gmail.com>
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

On Mon, Oct 9, 2023 at 1:41=E2=80=AFPM John Johansen
<john.johansen@canonical.com> wrote:
> On 10/9/23 10:06, Paul Moore wrote:
> > I don't think anyone is objecting to resolving this, it's more a
> > matter of *how* we can resolve it.
>
> currently I am see four crazy/stupid paths forward, each with their own
> pain points.
>
>
> 1. lift the capable() and security_task_setrlimit() calls out of the lock=
.
>
> this might be possible, it should be fine for capable() but does open
> a potential race window for security_task_setrlimit() if the LSM hooks
> mediation looks at the tasks current resource value.

Ignoring the race for a moment, I worry that even if we solve it for
this particular case it could easily come back to bite us somewhere
else.

> 2. rework get_task_exe_file() to not need the task lock. That looks
> like a major under taking, and I don't currently see it as viable.

Agreed.

> 3. get the task lock switch to a recursive spin_lock. Another large
> piece of work that I don't currently see as viable.

Agreed.

> 4. caching a reference in the audit_context as paul has suggested.

I don't like this idea, but I'm struggling to come up with something
less awful.  Below is a quick, untested patch to describe the concept
with code.  It is worth noting that we don't take a mm_struct
reference in the io_uring entry point because I'm not sure filtering
on the executable file makes much sense there given the async nature
of io_uring, however I'm open to comments here (as well as pretty much
everything else in this pseudo-patch).

WARNING: this is a cut-n-paste so it's probably mangled.

diff --git a/kernel/audit.h b/kernel/audit.h
index a60d2840559e..eac470aaca4f 100644
--- a/kernel/audit.h
+++ b/kernel/audit.h
@@ -146,6 +146,8 @@ struct audit_context {
       u32                 target_sid;
       char                target_comm[TASK_COMM_LEN];

+       struct mm_struct    *mm;
+
       struct audit_tree_refs *trees, *first_trees;
       struct list_head killed_trees;
       int tree_count;
diff --git a/kernel/audit_watch.c b/kernel/audit_watch.c
index 65075f1e4ac8..a619394530bd 100644
--- a/kernel/audit_watch.c
+++ b/kernel/audit_watch.c
@@ -526,8 +526,12 @@ int audit_exe_compare(struct task_struct *tsk, struct =
audit
_fsnotify_mark *mark)
       struct file *exe_file;
       unsigned long ino;
       dev_t dev;
+       struct mm_struct *mm;

-       exe_file =3D get_task_exe_file(tsk);
+       mm =3D tsk->audit_context->mm;
+       if (!mm)
+               return 0;
+       exe_file =3D get_mm_exe_file(mm);
       if (!exe_file)
               return 0;
       ino =3D file_inode(exe_file)->i_ino;
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 21d2fa815e78..edeff28a4bab 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1019,6 +1019,10 @@ static void audit_reset_context(struct audit_context=
 *ctx
)
       ctx->target_sessionid =3D 0;
       ctx->target_sid =3D 0;
       ctx->target_comm[0] =3D '\0';
+       if (ctx->mm) {
+               mmput(ctx->mm);
+               ctx->mm =3D NULL;
+       }
       unroll_tree_refs(ctx, NULL, 0);
       WARN_ON(!list_empty(&ctx->killed_trees));
       audit_free_module(ctx);
@@ -2035,6 +2039,9 @@ void __audit_syscall_entry(int major, unsigned long a=
1, un
signed long a2,
                       return;
       }

+       /* get mm as it requires task_lock() which may not be safe later */
+       context->mm =3D get_task_mm(current);
+
       context->arch       =3D syscall_get_arch(current);
       context->major      =3D major;
       context->argv[0]    =3D a1;

--=20
paul-moore.com

