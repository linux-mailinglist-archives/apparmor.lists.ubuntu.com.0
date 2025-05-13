Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B9AB66B8
	for <lists+apparmor@lfdr.de>; Wed, 14 May 2025 11:02:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uF7zs-0004wo-1y; Wed, 14 May 2025 09:01:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <kees@kernel.org>) id 1uEyzw-00089t-2d
 for apparmor@lists.ubuntu.com; Tue, 13 May 2025 23:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B2B124ACED;
 Tue, 13 May 2025 23:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D25C4CEE4;
 Tue, 13 May 2025 23:15:55 +0000 (UTC)
Date: Tue, 13 May 2025 16:15:52 -0700
From: Kees Cook <kees@kernel.org>
To: Jann Horn <jannh@google.com>
User-Agent: K-9 Mail for Android
In-Reply-To: <CAG48ez0aP8LaGppy6Yon7xcFbQa1=CM-HXSZChvXYV2VJZ8y7g@mail.gmail.com>
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
 <86CE201B-5632-4BB7-BCF6-7CB2C2895409@chromium.org>
 <h65sagivix3zbrppthcobnysgnlrnql5shiu65xyg7ust6mc54@cliutza66zve>
 <D03AE210-6874-43B6-B917-80CD259AE2AC@kernel.org>
 <CAG48ez0aP8LaGppy6Yon7xcFbQa1=CM-HXSZChvXYV2VJZ8y7g@mail.gmail.com>
Message-ID: <6C9B4DB6-0E73-471D-A278-39F61A825DB6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.234.252.31; envelope-from=kees@kernel.org;
 helo=sea.source.kernel.org
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
Cc: Micah Morton <mortonm@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrei Vagin <avagin@gmail.com>, linux-hardening@vger.kernel.org,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, oleg@redhat.com,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Christian Brauner <brauner@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On May 13, 2025 2:09:48 PM PDT, Jann Horn <jannh@google=2Ecom> wrote:
>On Tue, May 13, 2025 at 10:57=E2=80=AFPM Kees Cook <kees@kernel=2Eorg> wr=
ote:
>> On May 13, 2025 6:05:45 AM PDT, Mateusz Guzik <mjguzik@gmail=2Ecom> wro=
te:
>> >Here is my proposal: *deny* exec of suid/sgid binaries if fs_struct is
>> >shared=2E This will have to be checked for after the execing proc beco=
mes
>> >single-threaded ofc=2E
>>
>> Unfortunately the above Chrome helper is setuid and uses CLONE_FS=2E
>
>Chrome first launches a setuid helper, and then the setuid helper does
>CLONE_FS=2E Mateusz's proposal would not impact this usecase=2E
>
>Mateusz is proposing to block the case where a process first does
>CLONE_FS, and *then* one of the processes sharing the fs_struct does a
>setuid execve()=2E Linux already downgrades such an execve() to be
>non-setuid, which probably means anyone trying to do this will get
>hard-to-understand problems=2E Mateusz' proposal would just turn this
>hard-to-debug edgecase, which already doesn't really work, into a
>clean error; I think that is a nice improvement even just from the
>UAPI standpoint=2E
>
>If this change makes it possible to clean up the kernel code a bit, even =
better=2E


Ah! Okay, I appreciate the clarification=2E :) I'm game to try making it a=
n error instead of silent downgrading=2E

-Kees


--=20
Kees Cook
--=20
Kees Cook

