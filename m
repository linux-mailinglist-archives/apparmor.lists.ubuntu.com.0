Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 786CA5FF78D
	for <lists+apparmor@lfdr.de>; Sat, 15 Oct 2022 02:15:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ojUq6-0002Lf-6u; Sat, 15 Oct 2022 00:15:42 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jannh@google.com>) id 1ojMjE-0005Fh-2Z
 for apparmor@lists.ubuntu.com; Fri, 14 Oct 2022 15:36:04 +0000
Received: by mail-il1-f176.google.com with SMTP id q11so2692810ilj.10
 for <apparmor@lists.ubuntu.com>; Fri, 14 Oct 2022 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ytj3+kIoMyv4FX1lyc9tQ8OGwlhuPVWv2RqpKd5YyDU=;
 b=JR0xr0fIsskJTzO427SqrUgqb1DWjVVtwkmODGGjkSZJ4FMfX2ZsXK6Mm2spguP5Fi
 nyMmB82X0MA3h2JOCrtW3gl25dxsj4jiveXGKR6Z8STGPeeVjmS2VTjycP+RBn0tVhJl
 RTnAEkh5Qc5sIHtelNV80ZV0a1sV1g2AGrc8jU/2ZL2m19qrw9p6cxMlxHCX1YxptKvv
 NWg2UfEw3P0qeI86qPSMdLeiUDU5LTngBxTc3KHC3yReE92Ufkh4RP9JTPdhqddOZWDg
 6zCkai4UfclKgR3ffQ4VMj7CkN9eR7ciGLAV2JgtjXPGADfXQqzzW05FazqVHzwOwv/N
 dRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ytj3+kIoMyv4FX1lyc9tQ8OGwlhuPVWv2RqpKd5YyDU=;
 b=YaFZhqeCy2xEwRH4aEgKG5Lp1rRJo4enM/vs+XJJtj36E9HeSGbcfG9ZQbSSP9OusX
 SxwZ/rfVK0yB5L520+zjRaX7gnFOBcllHw96yzYPsPKPF84hLpHjO2ephGav0cfycRvK
 2LEPVJ7mV2gHXzsoQ+Il1EB8Ku4s8h0qkTtLHcDWfOjFIsN1m7rkwgLsigPE65BJ3CyH
 yjLw1F8FddBAHPoREP3n4P4fYoxKhz8W8PRm5Lky4mAvVMjnhyr0E+MCl6v2i23ylJd6
 4M2Q2DCEX4bDi5DMiRPDuKlyg1U6ib61D94UIxAx+8zCuYCxYZtM9gbLgA88t+EOeBnJ
 axaw==
X-Gm-Message-State: ACrzQf0Uk7b/Zv+XWigXAWyWrmnU/dXrqxXgHExIuoT4VP8PAee/olWe
 3YVB6pB7VLkCT+Gj9+ZDeUtmnJpCz1Kl9YJN1zHSiw==
X-Google-Smtp-Source: AMsMyM7SIvsGjFVFdZwPi/xpWspvv9GkH6JpuhbcRadzt8f/XtARZ9xDpqKEwls7AQ8KnXFNx+6y9OAVQ6OkLrOgJ1E=
X-Received: by 2002:a05:6e02:1c27:b0:2fc:6aa7:edda with SMTP id
 m7-20020a056e021c2700b002fc6aa7eddamr2701536ilh.177.1665761762432; Fri, 14
 Oct 2022 08:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
 <2032f766-1704-486b-8f24-a670c0b3cb32@app.fastmail.com>
In-Reply-To: <2032f766-1704-486b-8f24-a670c0b3cb32@app.fastmail.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 14 Oct 2022 17:35:26 +0200
Message-ID: <CAG48ez3hM+-V39QpFaNfRJxVrQVBu2Dm-B-xFN2GEt9p81Vd2Q@mail.gmail.com>
To: Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 15 Oct 2022 00:15:40 +0000
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
Cc: Micah Morton <mortonm@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Andrei Vagin <avagin@gmail.com>, linux-hardening@vger.kernel.org,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Oct 14, 2022 at 5:18 AM Andy Lutomirski <luto@kernel.org> wrote:
> On Thu, Oct 6, 2022, at 7:13 AM, Jann Horn wrote:
> > On Thu, Oct 6, 2022 at 11:05 AM Christian Brauner <brauner@kernel.org> =
wrote:
> >> On Thu, Oct 06, 2022 at 01:27:34AM -0700, Kees Cook wrote:
> >> > The check_unsafe_exec() counting of n_fs would not add up under a he=
avily
> >> > threaded process trying to perform a suid exec, causing the suid por=
tion
> >> > to fail. This counting error appears to be unneeded, but to catch an=
y
> >> > possible conditions, explicitly unshare fs_struct on exec, if it end=
s up
> >>
> >> Isn't this a potential uapi break? Afaict, before this change a call t=
o
> >> clone{3}(CLONE_FS) followed by an exec in the child would have the
> >> parent and child share fs information. So if the child e.g., changes t=
he
> >> working directory post exec it would also affect the parent. But after
> >> this change here this would no longer be true. So a child changing a
> >> workding directoro would not affect the parent anymore. IOW, an exec i=
s
> >> accompanied by an unshare(CLONE_FS). Might still be worth trying ofc b=
ut
> >> it seems like a non-trivial uapi change but there might be few users
> >> that do clone{3}(CLONE_FS) followed by an exec.
> >
> > I believe the following code in Chromium explicitly relies on this
> > behavior, but I'm not sure whether this code is in active use anymore:
> >
> > https://source.chromium.org/chromium/chromium/src/+/main:sandbox/linux/=
suid/sandbox.c;l=3D101?q=3DCLONE_FS&sq=3D&ss=3Dchromium
>
> Wait, this is absolutely nucking futs.  On a very quick inspection, the s=
harable things like this are fs, files, sighand, and io.    files and sigha=
nd get unshared, which makes sense.  fs supposedly checks for extra refs an=
d prevents gaining privilege.  io is... ignored!  At least it's not immedia=
tely obvious that io is a problem.
>
> But seriously, this makes no sense at all.  It should not be possible to =
exec a program and then, without ptrace, change its cwd out from under it. =
 Do we really need to preserve this behavior?

I agree that this is pretty wild.

The single user I'm aware of is Chrome, and as far as I know, they use
it for establishing their sandbox on systems where unprivileged user
namespaces are disabled - see
<https://chromium.googlesource.com/chromium/src/+/main/docs/linux/suid_sand=
box.md>.
They also have seccomp-based sandboxing, but IIRC there are some small
holes that mean it's still useful for them to be able to set up
namespaces, like how sendmsg() on a unix domain socket can specify a
file path as the destination address.

(By the way, I think maybe Chrome wouldn't need this wacky trick with
the shared fs_struct if the "NO_NEW_PRIVS permits chroot()" thing had
ever landed that you
(https://lore.kernel.org/lkml/0e2f0f54e19bff53a3739ecfddb4ffa9a6dbde4d.1327=
858005.git.luto@amacapital.net/)
and Micka=C3=ABl Sala=C3=BCn proposed in the past... or alternatively, if t=
here
was a way to properly filter all the syscalls that Chrome has to
permit for renderers.)

(But also, to be clear, I don't speak for Chrome, this is just my
understanding of how their stuff works.)

