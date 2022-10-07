Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9BD5F81AA
	for <lists+apparmor@lfdr.de>; Sat,  8 Oct 2022 02:53:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ogy5d-0005gQ-6P; Sat, 08 Oct 2022 00:53:17 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <david.laight@aculab.com>) id 1oglzX-0006Dx-M1
 for apparmor@lists.ubuntu.com; Fri, 07 Oct 2022 11:58:11 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-25-ABR5MNZQOUi4UB5yYMDNEA-1; Fri, 07 Oct 2022 12:58:08 +0100
X-MC-Unique: ABR5MNZQOUi4UB5yYMDNEA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Fri, 7 Oct
 2022 12:58:06 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Fri, 7 Oct 2022 12:58:06 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Theodore Ts'o' <tytso@mit.edu>, Kees Cook <keescook@chromium.org>
Thread-Topic: [PATCH] Fix race condition when exec'ing setuid files
Thread-Index: AQHY2e33//tmcksZekaHt2mlO/Dtmq4C0tkw
Date: Fri, 7 Oct 2022 11:58:06 +0000
Message-ID: <f01aae2a5936450f889fa5a7d350d363@AcuMS.aculab.com>
References: <202209131456.76A13BC5E4@keescook>
 <202210061301.207A20C8E5@keescook> <Yz+Dln7AAMU+Oj9X@mit.edu>
In-Reply-To: <Yz+Dln7AAMU+Oj9X@mit.edu>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 08 Oct 2022 00:53:16 +0000
Subject: Re: [apparmor] [PATCH] Fix race condition when exec'ing setuid files
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
Cc: Micah Morton <mortonm@chromium.org>, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrei Vagin <avagin@gmail.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Jann Horn <jannh@google.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Theodore Ts'o
> Sent: 07 October 2022 02:41
>=20
> On Thu, Oct 06, 2022 at 01:20:35PM -0700, Kees Cook wrote:
> >
> > So the question, then, is "why are they trying to exec while actively
> > spawning new threads?" That appears to be the core problem here, and as
> > far as I can tell, the kernel has behaved this way for a very long time=
.
> > I don't think the kernel should fix this, either, because it leads to a
> > very weird state for userspace, where the thread spawner may suddenly
> > die due to the exec happening in another thread. This really looks like
> > something userspace needs to handle correctly (i.e. don't try to exec
> > while actively spawning threads).
>=20
> One of the classic failure modes is when a threaded program calls a
> library, and that library might try to do a fork/exec (or call
> system(3) to run some command.  e.g., such as running "lvm create ..."
> or to spawn some kind of helper daemon.
>=20
> There are a number of stack overflow questions about this, and there
> are some solutions to _some_ of the problems, such as using
> pthread_atfork(), and knowing that you are about to call fork/exec,
> and use some out of band mechanism to to make sure no threads get
> spawned until the fork/exec is completed --- but if you don't know
> that a library is going to do a fork/exec, well, life is tough.

Or that a library thread is about to create a new thread.

> One technique even advocated by a stack overflow article is "avoid
> using threads whenver possible".  :-/

Doesn't fork() only create the current thread in the new process?
So by the time exec() runs there is a nice single threaded process
with an fd table that isn't shared.

For helpers there is always (a properly implemented) posix_spawn() :-)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


