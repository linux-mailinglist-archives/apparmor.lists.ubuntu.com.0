Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE62C9B22A
	for <lists+apparmor@lfdr.de>; Tue, 02 Dec 2025 11:26:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vQNah-0000mB-AF; Tue, 02 Dec 2025 10:26:39 +0000
Received: from out02.mta.xmission.com ([166.70.13.232])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ebiederm@xmission.com>)
 id 1vQ6Pw-0007i4-MO
 for apparmor@lists.ubuntu.com; Mon, 01 Dec 2025 16:06:24 +0000
Received: from in01.mta.xmission.com ([166.70.13.51]:50512)
 by out02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1vQ6Pi-009mGN-1t; Mon, 01 Dec 2025 09:06:10 -0700
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:40282
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1vQ6Pg-00Cg1V-BQ; Mon, 01 Dec 2025 09:06:09 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
In-Reply-To: <6dc556a0a93c18fffec71322bf97441c74b3134e.camel@huaweicloud.com>
 (Roberto Sassu's message of "Tue, 25 Nov 2025 12:55:00 +0100")
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
Date: Mon, 01 Dec 2025 10:06:00 -0600
Message-ID: <87v7iqtcev.fsf_-_@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1vQ6Pg-00Cg1V-BQ; ; ;
 mid=<87v7iqtcev.fsf_-_@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=72.198.198.28; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX1/O4IKUzWWwapDxt1axB69s37nkia9NNac=
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa01.xmission.com
X-Spam-Level: ****
X-Spam-Status: No, score=4.0 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,TR_AI_Phishing,TR_XM_PhishingBody,XMGappySubj_01,
 XMGappySubj_02,XMSubLong,XM_B_AI_SPAM_COMBINATION,XM_B_Phish_Phrases,
 XM_Multi_Part_URI autolearn=disabled version=3.4.2
X-Spam-Virus: No
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000] *  0.7 XMSubLong Long Subject
 *  1.0 XMGappySubj_02 Gappier still
 *  0.5 XMGappySubj_01 Very gappy subject
 *  1.2 XM_Multi_Part_URI URI: Long-Multi-Part URIs
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa01 1397; Body=1 Fuz1=1 Fuz2=1]
 *  1.0 XM_B_Phish_Phrases Commonly used Phishing Phrases
 *  0.0 XM_B_AI_SPAM_COMBINATION Email matches multiple AI-related
 *      patterns
 *  0.5 TR_AI_Phishing Email matches multiple AI-related patterns
 *  0.0 TR_XM_PhishingBody Phishing flag in body of message
X-Spam-DCC: XMission; sa01 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ****;Roberto Sassu <roberto.sassu@huaweicloud.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 576 ms - load_scoreonly_sql: 0.03 (0.0%),
 signal_user_changed: 2.8 (0.5%), b_tie_ro: 1.85 (0.3%), parse: 1.32
 (0.2%), extract_message_metadata: 17 (2.9%), get_uri_detail_list: 2.5
 (0.4%), tests_pri_-2000: 24 (4.1%), tests_pri_-1000: 14 (2.5%),
 tests_pri_-950: 1.46 (0.3%), tests_pri_-900: 1.33 (0.2%),
 tests_pri_-90: 118 (20.4%), check_bayes: 116 (20.1%), b_tokenize: 24
 (4.1%), b_tok_get_all: 11 (1.9%), b_comp_prob: 3.5 (0.6%),
 b_tok_touch_all: 74 (12.9%), b_finish: 0.62 (0.1%), tests_pri_0: 385
 (66.9%), check_dkim_signature: 0.44 (0.1%), check_dkim_adsp: 2.7
 (0.5%), poll_dns_idle: 0.61 (0.1%), tests_pri_10: 1.64 (0.3%),
 tests_pri_500: 7 (1.1%), rewrite_mail: 0.00 (0.0%)
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: too long (recipient list exceeded maximum allowed size of
 512 bytes)
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out02.mta.xmission.com);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=166.70.13.232; envelope-from=ebiederm@xmission.com;
 helo=out02.mta.xmission.com
X-Mailman-Approved-At: Tue, 02 Dec 2025 10:26:37 +0000
Subject: [apparmor] Are setuid shell scripts safe? (Implied by
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

Roberto Sassu <roberto.sassu@huaweicloud.com> writes:

> + Mimi, linux-integrity (would be nice if we are in CC when linux-
> security-module is in CC).
>
> Apologies for not answering earlier, it seems I don't receive the
> emails from the linux-security-module mailing list (thanks Serge for
> letting me know!).
>
> I see two main effects of this patch. First, the bprm_check_security
> hook implementations will not see bprm->cred populated. That was a
> problem before we made this patch:
>
> https://patchew.org/linux/20251008113503.2433343-1-roberto.sassu@huaweicloud.com/

Thanks, that is definitely needed.

Does calling process_measurement(CREDS_CHECK) on only the final file
pass review?  Do you know of any cases where that will break things?

As it stands I don't think it should be assumed that any LSM has
computed it's final creds until bprm_creds_from_file.  Not just the
uid and gid.

If the patch you posted for review works that helps sort that mess out.

> to work around the problem of not calculating the final DAC credentials
> early enough (well, we actually had to change our CREDS_CHECK hook
> behavior).
>
> The second, I could not check. If I remember well, unlike the
> capability LSM, SELinux/Apparmor/SMACK calculate the final credentials
> based on the first file being executed (thus the script, not the
> interpreter). Is this patch keeping the same behavior despite preparing
> the credentials when the final binary is found?

The patch I posted was.

My brain is still reeling from the realization that our security modules
have the implicit assumption that it is safe to calculate their security
information from shell scripts.

In the first half of the 90's I remember there was lots of effort to try
and make setuid shell scripts and setuid perl scripts work, and the
final conclusion was it was a lost cause.

Now I look at security_bprm_creds_for_exec and security_bprm_check which
both have the implicit assumption that it is indeed safe to compute the
credentials from a shell script.

When passing a file descriptor to execat we have
BINPRM_FLAGS_PATH_INACCESSIBLE and use /dev/fd/NNN as the filename
which reduces some of the races.

However when just plain executing a shell script we pass the filename of
the shell script as a command line argument, and expect the shell to
open the filename again.  This has been a time of check to time of use
race for decades, and one of the reasons we don't have setuid shell
scripts.

Yet the IMA implementation (without the above mentioned patch) assumes
the final creds will be calculated before security_bprm_check is called,
and security_bprm_creds_for_exec busily calculate the final creds.

For some of the security modules I believe anyone can set any label they
want on a file and they remain secure (At which point I don't understand
the point of having labels on files).  I don't believe that is the case
for selinux, or in general.

So just to remove the TOCTOU race the security_bprm_creds_for_exec
and security_bprm_check hooks need to be removed, after moving their
code into something like security_bprm_creds_from_file.

Or am I missing something and even with the TOCTOU race are setuid shell
scripts somehow safe now?

Eric

