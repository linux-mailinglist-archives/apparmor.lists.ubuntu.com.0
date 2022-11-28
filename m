Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 871A063CCBC
	for <lists+apparmor@lfdr.de>; Wed, 30 Nov 2022 02:12:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p0Bdf-0008V7-MW; Wed, 30 Nov 2022 01:11:51 +0000
Received: from out02.mta.xmission.com ([166.70.13.232])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <ebiederm@xmission.com>) id 1oziGf-0003X2-W7
 for apparmor@lists.ubuntu.com; Mon, 28 Nov 2022 17:50:10 +0000
Received: from in01.mta.xmission.com ([166.70.13.51]:35544)
 by out02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1oziGY-00778D-Ki; Mon, 28 Nov 2022 10:50:02 -0700
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:58100
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1oziGW-006oqs-Bm; Mon, 28 Nov 2022 10:50:02 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: David Laight <David.Laight@ACULAB.COM>
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
 <2032f766-1704-486b-8f24-a670c0b3cb32@app.fastmail.com>
 <d2a6ccdd8a734d36ae88866a4c16019b@AcuMS.aculab.com>
Date: Mon, 28 Nov 2022 11:49:07 -0600
In-Reply-To: <d2a6ccdd8a734d36ae88866a4c16019b@AcuMS.aculab.com> (David
 Laight's message of "Fri, 14 Oct 2022 22:03:18 +0000")
Message-ID: <87sfi3rmuk.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1oziGW-006oqs-Bm; ; ;
 mid=<87sfi3rmuk.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX18hSeGIl+yv8nxANHdnXAlOdUtCNX9Vl/s=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,XMNoVowels,
 XMSubLong shortcircuit=no autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000] *  0.7 XMSubLong Long Subject
 *  1.5 XMNoVowels Alpha-numberic number with no vowels
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: **;David Laight <David.Laight@ACULAB.COM>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1632 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 11 (0.7%), b_tie_ro: 10 (0.6%), parse: 1.09
 (0.1%), extract_message_metadata: 13 (0.8%), get_uri_detail_list: 2.4
 (0.1%), tests_pri_-1000: 8 (0.5%), tests_pri_-950: 1.25 (0.1%),
 tests_pri_-900: 1.08 (0.1%), tests_pri_-200: 0.85 (0.1%),
 tests_pri_-100: 9 (0.6%), tests_pri_-90: 77 (4.7%), check_bayes: 75
 (4.6%), b_tokenize: 18 (1.1%), b_tok_get_all: 13 (0.8%), b_comp_prob:
 4.0 (0.2%), b_tok_touch_all: 36 (2.2%), b_finish: 0.97 (0.1%),
 tests_pri_0: 527 (32.3%), check_dkim_signature: 0.58 (0.0%),
 check_dkim_adsp: 3.9 (0.2%), poll_dns_idle: 960 (58.9%), tests_pri_10:
 2.1 (0.1%), tests_pri_500: 977 (59.9%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Mailman-Approved-At: Wed, 30 Nov 2022 01:11:50 +0000
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrei Vagin <avagin@gmail.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, 'Andy Lutomirski' <luto@kernel.org>,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej
 Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, "David S.
 Miller" <davem@davemloft.net>, Prashanth Prahlad <pprahlad@redhat.com>,
 Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

David Laight <David.Laight@ACULAB.COM> writes:

> From: Andy Lutomirski
>> Sent: 14 October 2022 04:18
> ...
>> But seriously, this makes no sense at all.  It should not be possible to exec a program and then,
>> without ptrace, change its cwd out from under it.  Do we really need to preserve this behavior?
>
> it maybe ok if the exec'ed program also 'bought-in' to the
> fact that its cwd and open files might get changed.
> But imagine someone doing it to a login shell!


I am slowly catching up on my email and I saw this conversation.

When I initially saw this thread I was confused and thought this
might run into an issue with fs/locks.c.  I was close but wrong.
fs/locks.c uses current->files as a sort of process identifier
and so is very sensitive to when it is unshared.  Making
unsharing current->files unconditionally a bug.  Not relevant to
this conversation.


There are several clone options that were only relevant for the old
LinuxThreads implementation including CLONE_FS and CLONE_SIGHAND.
The LinuxThreads implementation has not been needed since
the introduction of CLONE_THREAD in linux-2.6.0 in 17 Dec 2003.
Almost 20 years ago.

I suggest we introduce CONFIG_CLONE_FS and CONFIG_SIGHAND to allow
disabling support of these clone options.  No known user space will
care.  The are both getting in the way of kernel maintenance so there
is a reason to start pushing them out.

Further simply not worrying about UNSHARE_FS during exec fixes the
race so it essentially a bug fix by code removal.

I believe something like the patch below should get the job done.

diff --git a/fs/exec.c b/fs/exec.c
index a0b1f0337a62..7ff13c77ad04 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1186,7 +1186,8 @@ static int unshare_sighand(struct task_struct *me)
 {
 	struct sighand_struct *oldsighand = me->sighand;
 
-	if (refcount_read(&oldsighand->count) != 1) {
+	if (IS_ENABLED(CONFIG_CLONE_SIGHAND) &&
+	    refcount_read(&oldsighand->count) != 1) {
 		struct sighand_struct *newsighand;
 		/*
 		 * This ->sighand is shared with the CLONE_SIGHAND
@@ -1568,6 +1569,9 @@ static void check_unsafe_exec(struct linux_binprm *bprm)
 	if (task_no_new_privs(current))
 		bprm->unsafe |= LSM_UNSAFE_NO_NEW_PRIVS;
 
+	if (!IS_ENABLED(CONFIG_CLONE_FS))
+		return;
+
 	t = p;
 	n_fs = 1;
 	spin_lock(&p->fs->lock);
diff --git a/init/Kconfig b/init/Kconfig
index 94125d3b6893..8660a6bcc1cf 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1764,6 +1764,23 @@ config KALLSYMS_BASE_RELATIVE
 	  time constants, and no relocation pass is required at runtime to fix
 	  up the entries based on the runtime load address of the kernel.
 
+config CLONE_FS
+	bool
+	default y
+	help
+	  Support CLONE_FS being passed to clone.  The only known user
+	  is the old LinuxThreads package so it should be safe to disable
+	  this option.
+
+config CLONE_SIGHAND
+	bool
+	default y
+	help
+	  Support CLONE_SIGHAND being passed to clone.  The only known user
+	  is the old LinuxThreads package so it should be safe to disable
+	  this option.
+
+
 # end of the "standard kernel features (expert users)" menu
 
 # syscall, maps, verifier
diff --git a/kernel/fork.c b/kernel/fork.c
index 08969f5aa38d..da9017b51da4 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2023,6 +2023,16 @@ static __latent_entropy struct task_struct *copy_process(
 	if ((clone_flags & CLONE_SIGHAND) && !(clone_flags & CLONE_VM))
 		return ERR_PTR(-EINVAL);
 
+	/* Don't allow CLONE_FS if not enabled */
+	if (!IS_ENABLED(CONFIG_CLONE_FS) &&
+	    ((clone_flags & (CLONE_THREAD | CLONE_FS)) == CLONE_FS))
+		return ERR_PTR(-EINVAL);
+
+	/* Don't allow CLONE_SIGHAND if not enabled */
+	if (!IS_ENABLED(CONFIG_CLONE_SIGHAND) &&
+	    ((clone_flags & (CLONE_THREAD | CLONE_SIGHAND)) == CLONE_SIGHAND))
+		return ERR_PTR(-EINVAL);
+
 	/*
 	 * Siblings of global init remain as zombies on exit since they are
 	 * not reaped by their parent (swapper). To solve this and to avoid
@@ -3101,6 +3111,9 @@ static int unshare_fs(unsigned long unshare_flags, struct fs_struct **new_fsp)
 	if (fs->users == 1)
 		return 0;
 
+	if (!IS_ENABLED(CONFIG_CLONE_FS))
+		return -EINVAL;
+
 	*new_fsp = copy_fs_struct(fs);
 	if (!*new_fsp)
 		return -ENOMEM;

Eric

