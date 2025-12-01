Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F779C9B224
	for <lists+apparmor@lfdr.de>; Tue, 02 Dec 2025 11:26:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vQNah-0000mH-D2; Tue, 02 Dec 2025 10:26:39 +0000
Received: from frasgout13.his.huawei.com ([14.137.139.46])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <roberto.sassu@huaweicloud.com>)
 id 1vQ76G-0006Uf-Ag
 for apparmor@lists.ubuntu.com; Mon, 01 Dec 2025 16:50:08 +0000
Received: from mail.maildlp.com (unknown [172.18.224.235])
 by frasgout13.his.huawei.com (SkyGuard) with ESMTPS id 4dKqbp2dpSzpV02
 for <apparmor@lists.ubuntu.com>; Tue,  2 Dec 2025 00:48:38 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
 by mail.maildlp.com (Postfix) with ESMTP id 58E504056C
 for <apparmor@lists.ubuntu.com>; Tue,  2 Dec 2025 00:50:06 +0800 (CST)
Received: from [10.204.63.22] (unknown [10.204.63.22])
 by APP1 (Coremail) with SMTP id LxC2BwDH0TUexy1puQwiAA--.23436S2;
 Mon, 01 Dec 2025 17:50:04 +0100 (CET)
Message-ID: <dca0f01500f9d6705dccf3b3ef616468b1f53f57.camel@huaweicloud.com>
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Date: Mon, 01 Dec 2025 17:49:31 +0100
In-Reply-To: <87v7iqtcev.fsf_-_@email.froward.int.ebiederm.org>
References: <AM8PR10MB470801D01A0CF24BC32C25E7E40E9@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
 <AM8PR10MB470875B22B4C08BEAEC3F77FE4169@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
 <AS8P193MB1285DF698D7524EDE22ABFA1E4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB12851AC1F862B97FCE9B3F4FE4AAA@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285FF445694F149B70B21D0E46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285937F9831CECAF2A9EEE2E4752@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEEEDE0B9742310DE91E9A7E431A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEE9EF78827D73D3D7212F7E432A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEEE807D016A79FE7A2F463E4D6A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <87tsyozqdu.fsf@email.froward.int.ebiederm.org>
 <87wm3ky5n9.fsf@email.froward.int.ebiederm.org>
 <87h5uoxw06.fsf_-_@email.froward.int.ebiederm.org>
 <6dc556a0a93c18fffec71322bf97441c74b3134e.camel@huaweicloud.com>
 <87v7iqtcev.fsf_-_@email.froward.int.ebiederm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CM-TRANSID: LxC2BwDH0TUexy1puQwiAA--.23436S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr1xWrWDZrWkWr47XFWrXwb_yoW7tFWfpF
 WrKay7Jr1DGF4Iyrn7Gw4xWF4SkFWrJ3y3Jrn5K34F9a98Wr1rKr1S9FWY9FWUWr1rK3W2
 yw429r93Za4DZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
 6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
 14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8
 Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
 xUVZ2-UUUUU
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAgAJBGktg2sEdgAAsR
Received-SPF: pass client-ip=14.137.139.46;
 envelope-from=roberto.sassu@huaweicloud.com; helo=frasgout13.his.huawei.com
X-Mailman-Approved-At: Tue, 02 Dec 2025 10:26:37 +0000
Subject: Re: [apparmor] Are setuid shell scripts safe? (Implied by
 security_bprm_creds_for_exec)
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, Kees Cook <kees@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Alexei Starovoitov <ast@kernel.org>, zohar@linux.ibm.com,
 Oleg Nesterov <oleg@redhat.com>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, Yafang Shao <laoar.shao@gmail.com>,
 xu xin <xu.xin16@zte.com.cn>, linux-kselftest@vger.kernel.org,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 tiozhang <tiozhang@didiglobal.com>, Shuah Khan <shuah@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Elena Reshetova <elena.reshetova@intel.com>,
 "Paulo
 Alcantara \(SUSE\)" <pc@manguebit.com>, Paul Moore <paul@paul-moore.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Helge Deller <deller@gmx.de>,
 YueHaibing <yuehaibing@huawei.com>, Luis Chamberlain <mcgrof@kernel.org>,
 James Morris <jamorris@linux.microsoft.com>, Ingo Molnar <mingo@kernel.org>,
 Penglei Jiang <superman.xpt@gmail.com>, Hans Liljestrand <ishkamiel@gmail.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Serge Hallyn <serge@hallyn.com>,
 Randy Dunlap <rdunlap@infradead.org>, Stefan Roesch <shr@devkernel.io>,
 Frederic Weisbecker <frederic@kernel.org>, Chao Yu <chao@kernel.org>,
 apparmor <apparmor@lists.ubuntu.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Aleksa Sarai <cyphar@cyphar.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Dave Chinner <dchinner@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>,
 linux-integrity@vger.kernel.org, David Windsor <dwindsor@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Mateusz Guzik <mjguzik@gmail.com>, Will Drewry <wad@chromium.org>,
 Adrian Ratiu <adrian.ratiu@collabora.com>, Adrian Reber <areber@redhat.com>,
 Jeff Layton <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, Cyrill Gorcunov <gorcunov@gmail.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-security-module@vger.kernel.org,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, 2025-12-01 at 10:06 -0600, Eric W. Biederman wrote:
> Roberto Sassu <roberto.sassu@huaweicloud.com> writes:
>=20
> > + Mimi, linux-integrity (would be nice if we are in CC when linux-
> > security-module is in CC).
> >=20
> > Apologies for not answering earlier, it seems I don't receive the
> > emails from the linux-security-module mailing list (thanks Serge for
> > letting me know!).
> >=20
> > I see two main effects of this patch. First, the bprm_check_security
> > hook implementations will not see bprm->cred populated. That was a
> > problem before we made this patch:
> >=20
> > https://patchew.org/linux/20251008113503.2433343-1-roberto.sassu@huawei=
cloud.com/
>=20
> Thanks, that is definitely needed.
>=20
> Does calling process_measurement(CREDS_CHECK) on only the final file
> pass review?  Do you know of any cases where that will break things?

We intentionally changed the behavior of CREDS_CHECK to be invoked only
for the final file. We are monitoring for bug reports, if we receive
complains from people that the patch breaks their expectation we will
revisit the issue.

Any LSM implementing bprm_check_security looking for brpm->cred would
be affected by recalculating the DAC credentials for the final binary.

> As it stands I don't think it should be assumed that any LSM has
> computed it's final creds until bprm_creds_from_file.  Not just the
> uid and gid.

Uhm, I can be wrong, but most LSMs calculate their state change in
bprm_creds_for_exec (git grep bprm_creds_for_exec|grep LSM_HOOK_INIT).

> If the patch you posted for review works that helps sort that mess out.

Well, it works because we changed the expectation :)

> > to work around the problem of not calculating the final DAC credentials
> > early enough (well, we actually had to change our CREDS_CHECK hook
> > behavior).
> >=20
> > The second, I could not check. If I remember well, unlike the
> > capability LSM, SELinux/Apparmor/SMACK calculate the final credentials
> > based on the first file being executed (thus the script, not the
> > interpreter). Is this patch keeping the same behavior despite preparing
> > the credentials when the final binary is found?
>=20
> The patch I posted was.
>=20
> My brain is still reeling from the realization that our security modules
> have the implicit assumption that it is safe to calculate their security
> information from shell scripts.

If I'm interpreting this behavior correctly (please any LSM maintainer
could comment on it), the intent is just to transition to a different
security context where a different set of rules could apply (since we
are executing a script).

Imagine if for every script, the security transition is based on the
interpreter, it would be hard to differentiate between scripts and
associate to the respective processes different security labels.

> In the first half of the 90's I remember there was lots of effort to try
> and make setuid shell scripts and setuid perl scripts work, and the
> final conclusion was it was a lost cause.

Definitely I lack a lot of context...

> Now I look at security_bprm_creds_for_exec and security_bprm_check which
> both have the implicit assumption that it is indeed safe to compute the
> credentials from a shell script.
>=20
> When passing a file descriptor to execat we have
> BINPRM_FLAGS_PATH_INACCESSIBLE and use /dev/fd/NNN as the filename
> which reduces some of the races.
>=20
> However when just plain executing a shell script we pass the filename of
> the shell script as a command line argument, and expect the shell to
> open the filename again.  This has been a time of check to time of use
> race for decades, and one of the reasons we don't have setuid shell
> scripts.

Yes, it would be really nice to fix it!

> Yet the IMA implementation (without the above mentioned patch) assumes
> the final creds will be calculated before security_bprm_check is called,
> and security_bprm_creds_for_exec busily calculate the final creds.
>=20
> For some of the security modules I believe anyone can set any label they
> want on a file and they remain secure (At which point I don't understand
> the point of having labels on files).  I don't believe that is the case
> for selinux, or in general.

A simple example for SELinux. Suppose that the parent process has type
initrc_t, then the SELinux policy configures the following transitions
based on the label of the first file executed (sesearch -T -s initrc_t
-c process):

type_transition initrc_t NetworkManager_dispatcher_exec_t:process NetworkMa=
nager_dispatcher_t;
type_transition initrc_t NetworkManager_exec_t:process NetworkManager_t;
type_transition initrc_t NetworkManager_initrc_exec_t:process initrc_t;
type_transition initrc_t NetworkManager_priv_helper_exec_t:process NetworkM=
anager_priv_helper_t;
type_transition initrc_t abrt_dump_oops_exec_t:process abrt_dump_oops_t;
type_transition initrc_t abrt_exec_t:process abrt_t;
[...]

(there are 747 rules in my system).

If the transition would be based on the interpreter label, it would be
hard to express with rules.

If the transition does not occur for any reason the parent process
policy would still apply, but maybe it would not have the necessary
permissions for the execution of the script.

> So just to remove the TOCTOU race the security_bprm_creds_for_exec
> and security_bprm_check hooks need to be removed, after moving their
> code into something like security_bprm_creds_from_file.
>=20
> Or am I missing something and even with the TOCTOU race are setuid shell
> scripts somehow safe now?

Take this with a looot of salt, if there is a TOCTOU race, the script
will be executed with a security context that does not belong to it.
But the transition already happened. Not sure if it is safe.

I also don't know how the TOCTOU race could be solved, but I also would
like it to be fixed. I'm available to comment on any proposal!

Roberto


