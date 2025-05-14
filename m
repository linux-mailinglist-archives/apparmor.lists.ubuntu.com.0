Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0AAB66B9
	for <lists+apparmor@lfdr.de>; Wed, 14 May 2025 11:02:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uF7zt-0004xC-RD; Wed, 14 May 2025 09:01:53 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mjguzik@gmail.com>) id 1uEzb6-0002zM-TL
 for apparmor@lists.ubuntu.com; Wed, 14 May 2025 00:03:45 +0000
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5fbf52aad74so734631a12.1
 for <apparmor@lists.ubuntu.com>; Tue, 13 May 2025 17:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747181024; x=1747785824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6lqSoGgVBEs4e77J4dvCBv01iW/I9gHcChJC6DVoY/E=;
 b=CVVI/oxiuchRKZACJJvotLLGQgMGX1udbGHXUdXM7BX4hpVUxZw35zD/eqsXtcSs21
 xQzo+PzN7jnWOZrz/X6sjmunhoN/VRjCX88p6G2VLRivUDf4iqaRO8VmdIFE4zdnx0QZ
 XW/4BMXkvDHXZBSnPO3xvSlxhb4jmaU9v2JAIsk0gz0BvT88xtkizyHeP4OfB+goTGUw
 KdxFQcC94ARMgsWouWrK7+bvIbKt9Yg0YGSgkzTZGQvrhEOpCeqd9cbmsaiyzGiYpcNw
 toJD1FbCpJ8f3tN56gzOWfaqaF92ajkctjpaPO/T4Qg3OMwR8JscEGQh9N3oc3WpPWJ9
 2ayw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVzykgYO11B/zRvarV/KJWJMNl/xjysbZrv2qvJDRGSrFovQvFMcHiPhmLWv5Tt7jGEVmtXC6KqA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyUsR3bXrfv+Ug27n34a8V05n8Wi6zSBD31BqKd55mPZWxSqWpR
 GnsUfde6HDwlt1hUjPTfrMMeTvhGZqw+x9NoT1XeYR8hDriAX9lO+MRWJhXBYjWXv97nbAJu0xA
 j9ZYbrzCUaUIF10NA552RsThRZN0=
X-Gm-Gg: ASbGnctY/C1Z8/eyN1caep5Oq7ed0IDDo7sYsYRp4Hb98XoxrnKlW+WRS4i8PMYZ1LX
 BpotnWZnyv9sLWHFXIArPzc731oBoxv6aby905jpp6E+WIpw7KEg/ciGG9J0YijcUE4Ix9yohnF
 k6/NfdJF8w97IFIAsFtu27/+vBLaZL4nDg/4t1zYZpfg==
X-Google-Smtp-Source: AGHT+IGRlSkJ0UH4AJ6sv5ErNW8p3B/IKPPQ+Oz8ZXhFjDVyTM4z7WXblF2mhP+ITGzr1p9iVxs23uJFZScuNAmdKVU=
X-Received: by 2002:a17:907:1785:b0:ad2:cce:8d5e with SMTP id
 a640c23a62f3a-ad4f71dc930mr154641766b.7.1747181023932; Tue, 13 May 2025
 17:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
 <86CE201B-5632-4BB7-BCF6-7CB2C2895409@chromium.org>
 <h65sagivix3zbrppthcobnysgnlrnql5shiu65xyg7ust6mc54@cliutza66zve>
 <D03AE210-6874-43B6-B917-80CD259AE2AC@kernel.org>
 <CAG48ez0aP8LaGppy6Yon7xcFbQa1=CM-HXSZChvXYV2VJZ8y7g@mail.gmail.com>
 <871pss17hq.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <871pss17hq.fsf@email.froward.int.ebiederm.org>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 14 May 2025 02:03:31 +0200
X-Gm-Features: AX0GCFst7wU9kVixjwdrqiox0NLTh4DbO3zQ5nACeNFmn77IHwc5Pm1sBQG733I
Message-ID: <CAGudoHH-Jn5_4qnLV3qwzjTi2ZgfmfaO0qVSWW5gqdqkvchnDQ@mail.gmail.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.41; envelope-from=mjguzik@gmail.com;
 helo=mail-ed1-f41.google.com
X-Mailman-Approved-At: Wed, 14 May 2025 09:01:51 +0000
Subject: Re: [apparmor] [PATCH 1/2] fs/exec: Explicitly unshare fs_struct on
	exec
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
Cc: Micah Morton <mortonm@chromium.org>, Kees Cook <kees@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrei Vagin <avagin@gmail.com>, linux-hardening@vger.kernel.org,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 oleg@redhat.com, Eric Paris <eparis@parisplace.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, May 14, 2025 at 12:17=E2=80=AFAM Eric W. Biederman
<ebiederm@xmission.com> wrote:
>
> Jann Horn <jannh@google.com> writes:
>
> > On Tue, May 13, 2025 at 10:57=E2=80=AFPM Kees Cook <kees@kernel.org> wr=
ote:
> >> On May 13, 2025 6:05:45 AM PDT, Mateusz Guzik <mjguzik@gmail.com> wrot=
e:
> >> >Here is my proposal: *deny* exec of suid/sgid binaries if fs_struct i=
s
> >> >shared. This will have to be checked for after the execing proc becom=
es
> >> >single-threaded ofc.
> >>
> >> Unfortunately the above Chrome helper is setuid and uses CLONE_FS.
> >
> > Chrome first launches a setuid helper, and then the setuid helper does
> > CLONE_FS. Mateusz's proposal would not impact this usecase.
> >
> > Mateusz is proposing to block the case where a process first does
> > CLONE_FS, and *then* one of the processes sharing the fs_struct does a
> > setuid execve(). Linux already downgrades such an execve() to be
> > non-setuid, which probably means anyone trying to do this will get
> > hard-to-understand problems. Mateusz' proposal would just turn this
> > hard-to-debug edgecase, which already doesn't really work, into a
> > clean error; I think that is a nice improvement even just from the
> > UAPI standpoint.
> >
> > If this change makes it possible to clean up the kernel code a bit, eve=
n better.
>
> What has brought this to everyone's attention just now?  This is
> the second mention of this code path I have seen this week.
>

There is a syzkaller report concerning ->in_exec handling, for example:
https://lore.kernel.org/all/67dc67f0.050a0220.25ae54.001f.GAE@google.com/#t

> AKA: security/commoncap.c:cap_bprm_creds_from_file(...)
> > ...
> >       /* Don't let someone trace a set[ug]id/setpcap binary with the re=
vised
> >        * credentials unless they have the appropriate permit.
> >        *
> >        * In addition, if NO_NEW_PRIVS, then ensure we get no new privs.
> >        */
> >       is_setid =3D __is_setuid(new, old) || __is_setgid(new, old);
> >
> >       if ((is_setid || __cap_gained(permitted, new, old)) &&
> >           ((bprm->unsafe & ~LSM_UNSAFE_PTRACE) ||
> >            !ptracer_capable(current, new->user_ns))) {
> >               /* downgrade; they get no more than they had, and maybe l=
ess */
> >               if (!ns_capable(new->user_ns, CAP_SETUID) ||
> >                   (bprm->unsafe & LSM_UNSAFE_NO_NEW_PRIVS)) {
> >                       new->euid =3D new->uid;
> >                       new->egid =3D new->gid;
> >               }
> >               new->cap_permitted =3D cap_intersect(new->cap_permitted,
> >                                                  old->cap_permitted);
> >       }
>
> The actual downgrade is because a ptrace'd executable also takes
> this path.
>
> I have seen it argued rather forcefully that continuing rather than
> simply failing seems better in the ptrace case.
>
> In general I think it can be said this policy is "safe".  AKA we don't
> let a shared fs struct confuse privileged applications.  So nothing
> to panic about.
>
> It looks like most of the lsm's also test bprm->unsafe.
>
> So I imagine someone could very carefully separate the non-ptrace case
> from the ptrace case but *shrug*.
>
> Perhaps:
>
>         if ((is_setid || __cap_gained(permitted, new_old)) &&
>             ((bprm->unsafe & ~LSM_UNSAFE_PTRACE) ||
>              !ptracer_capable(current, new->user_ns))) {
> +               if (!(bprm->unsafe & LSM_UNSAFE_PTRACE)) {
> +                       return -EPERM;
> +               }
>                 /* downgrade; they get no more than they had, and maybe l=
ess */
>                 if (!ns_capable(new->user_ns, CAP_SETUID) ||
>                     (bprm->unsafe & LSM_UNSAFE_NO_NEW_PRIVS)) {
>                         new->euid =3D new->uid;
>                         new->egid =3D new->gid;
>                 }
>                 new->cap_permitted =3D cap_intersect(new->cap_permitted,
>                                                    old->cap_permitted);
>          }
>
> If that is what you want that doesn't look to scary.  I don't think
> it simplifies anything about fs->in_exec.  As fs->in_exec is set when
> the processing calling exec is the only process that owns the fs_struct.
> With fs->in_exec just being a flag that doesn't allow another thread
> to call fork and start sharing the fs_struct during exec.
>
> *Shrug*
>
> I don't see why anyone would care.  It is just a very silly corner case.

Well I don't see how ptrace factors into any of this, apart from being
a different case of ignoring suid/sgid.

I can agree the suid/sgid situation vs CLONE_FS is a silly corner
case, but one which needs to be handled for security reasons and which
currently has weirdly convoluted code to do it.

The intent behind my proposal is very much to get the crapper out of
the way in a future-proof and simple manner.

In check_unsafe_exec() you can find a nasty loop over threads in the
group to find out if the fs struct is used by anyone outside of said
group. Since fs struct users are not explicitly tracked and any of
them can have different creds than the current thread, the kernel opts
to ignore suid/sgid if there are extra users found (for security
reasons). The loop depends on no new threads showing up as the list is
being walked, to that end copy_fs() can transiently return an error if
it spots ->in_exec.

The >in_exec field is used as a boolean/flag, but parallel execs using
the same fs struct from different thread groups don't look serialized.
This is supposed to be fine as in this case ->in_exec is not getting
set to begin with, but it gets unconditionally unset on all execs.

And so on. It's all weird af.

Initially I was thinking about serializing all execs using a given
fs_struct to bypass majority of the fuckery, but that's some churn to
add and it still leaves possible breakage down the road -- should this
unsafe sharing detection ever become racing nobody will find out until
the bad guys have their turn with it.

While unconditional unsharing turns out to be a no-go because of
chrome, one can still do postpone detection until after the caller is
single-threaded. By that time, if this is only the that thread and
fs_struct has ->users =3D=3D 1, we know there is nobody sharing the struct
or racing to add a ref to it. This allows treating ->users as a
regular refcount, removes the weird loop over threads and removes the
(at best misleading) ->in_exec field.

With this in place it becomes trivial to also *deny* suid/sgid exec
instead of trying to placate it. If you are sharing fs and are execing
a binary in the first place, things are a little fishy. But if you are
execing a suid/sgid, the kernel has to ignore the bit so either you
are doing something wrong or are trying to exploit a bug. In order to
sort this crapper out, I think one can start with a runtime tunable
and a once-per-boot printk stating it denied such an exec (and stating
how to bring it back). To be removed some time after hitting LTS
perhaps.

--=20
Mateusz Guzik <mjguzik gmail.com>

