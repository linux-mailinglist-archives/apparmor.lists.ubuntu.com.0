Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D37AB66BB
	for <lists+apparmor@lfdr.de>; Wed, 14 May 2025 11:02:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uF7zt-0004wx-AB; Wed, 14 May 2025 09:01:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <kees@kernel.org>) id 1uEwpC-0003jh-6x
 for apparmor@lists.ubuntu.com; Tue, 13 May 2025 21:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F9CC5C3E8A;
 Tue, 13 May 2025 20:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33023C4CEE4;
 Tue, 13 May 2025 20:57:32 +0000 (UTC)
Date: Tue, 13 May 2025 13:57:27 -0700
From: Kees Cook <kees@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>, Kees Cook <keescook@chromium.org>
User-Agent: K-9 Mail for Android
In-Reply-To: <h65sagivix3zbrppthcobnysgnlrnql5shiu65xyg7ust6mc54@cliutza66zve>
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
 <86CE201B-5632-4BB7-BCF6-7CB2C2895409@chromium.org>
 <h65sagivix3zbrppthcobnysgnlrnql5shiu65xyg7ust6mc54@cliutza66zve>
Message-ID: <D03AE210-6874-43B6-B917-80CD259AE2AC@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kees@kernel.org;
 helo=dfw.source.kernel.org
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
 Fenghua Yu <fenghua.yu@intel.com>, Jann Horn <jannh@google.com>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, oleg@redhat.com,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On May 13, 2025 6:05:45 AM PDT, Mateusz Guzik <mjguzik@gmail=2Ecom> wrote:
>On Thu, Oct 06, 2022 at 08:25:01AM -0700, Kees Cook wrote:
>> On October 6, 2022 7:13:37 AM PDT, Jann Horn <jannh@google=2Ecom> wrote=
:
>> >On Thu, Oct 6, 2022 at 11:05 AM Christian Brauner <brauner@kernel=2Eor=
g> wrote:
>> >> On Thu, Oct 06, 2022 at 01:27:34AM -0700, Kees Cook wrote:
>> >> > The check_unsafe_exec() counting of n_fs would not add up under a =
heavily
>> >> > threaded process trying to perform a suid exec, causing the suid p=
ortion
>> >> > to fail=2E This counting error appears to be unneeded, but to catc=
h any
>> >> > possible conditions, explicitly unshare fs_struct on exec, if it e=
nds up
>> >>
>> >> Isn't this a potential uapi break? Afaict, before this change a call=
 to
>> >> clone{3}(CLONE_FS) followed by an exec in the child would have the
>> >> parent and child share fs information=2E So if the child e=2Eg=2E, c=
hanges the
>> >> working directory post exec it would also affect the parent=2E But a=
fter
>> >> this change here this would no longer be true=2E So a child changing=
 a
>> >> workding directoro would not affect the parent anymore=2E IOW, an ex=
ec is
>> >> accompanied by an unshare(CLONE_FS)=2E Might still be worth trying o=
fc but
>> >> it seems like a non-trivial uapi change but there might be few users
>> >> that do clone{3}(CLONE_FS) followed by an exec=2E
>> >
>> >I believe the following code in Chromium explicitly relies on this
>> >behavior, but I'm not sure whether this code is in active use anymore:
>> >
>> >https://source=2Echromium=2Eorg/chromium/chromium/src/+/main:sandbox/l=
inux/suid/sandbox=2Ec;l=3D101?q=3DCLONE_FS&sq=3D&ss=3Dchromium
>>=20
>> Oh yes=2E I think I had tried to forget this existed=2E Ugh=2E Okay, so=
 back to the drawing board, I guess=2E The counting will need to be fixed=
=2E=2E=2E
>>=20
>> It's possible we can move the counting after dethread -- it seems the e=
arly count was just to avoid setting flags after the point of no return, bu=
t it's not an error condition=2E=2E=2E
>>=20
>
>I landed here from git blame=2E
>
>I was looking at sanitizing shared fs vs suid handling, but the entire
>ordeal is so convoluted I'm confident the best way forward is to whack
>the problem to begin with=2E
>
>Per the above link, the notion of a shared fs struct across different
>processes is depended on so merely unsharing is a no-go=2E
>
>However, the shared state is only a problem for suid/sgid=2E
>
>Here is my proposal: *deny* exec of suid/sgid binaries if fs_struct is
>shared=2E This will have to be checked for after the execing proc becomes
>single-threaded ofc=2E

Unfortunately the above Chrome helper is setuid and uses CLONE_FS=2E

But to echo what Eric asked: what problem are you trying to solve?

-Kees

--=20
Kees Cook

