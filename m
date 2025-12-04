Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD99CA4604
	for <lists+apparmor@lfdr.de>; Thu, 04 Dec 2025 16:58:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vRBjD-0001Uw-2V; Thu, 04 Dec 2025 15:58:47 +0000
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <viro@ftp.linux.org.uk>)
 id 1vR2EE-0001qw-R6
 for apparmor@lists.ubuntu.com; Thu, 04 Dec 2025 05:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=s6+X3uAjfnbMKEn6Xkh/hO+HnZ24JeUWApwybKJc010=; b=nXmoy3q7PEPpF5abxhwxO3qXvd
 TkOCDMpiiUph/GGfD1WSJSK6FPE7975gCK4ZlbwYerMAlQ+aDVWKI0+zdSP+F0KjPdtQh7MNS982p
 z3URRnIZyusnvBJZ0tu+Gk9YMZthTHw6do/oReTtyIYkuoIlZyFmFoCJSyIVZsPmb/mEgU5ADU4bK
 UpeFaQlqNn8cm5F7j27o7aJ9XMA+VckFrpslNClucgYUn+qf2Q0VjoEWhwaITyMRS1yfk5eRiK27k
 h1+uW0AsswtW89hBcY65p1OQhlSrI4BenMrX6NTWbeIfKYv8oym8o/6VjEDkCnb89R955AmHDd024
 le4n+XBg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat
 Linux)) id 1vR2DL-00000008t6s-2eTQ; Thu, 04 Dec 2025 05:49:15 +0000
Date: Thu, 4 Dec 2025 05:49:15 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Message-ID: <20251204054915.GI1712166@ZenIV>
References: <GV2PPF74270EBEE9EF78827D73D3D7212F7E432A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEEE807D016A79FE7A2F463E4D6A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <87tsyozqdu.fsf@email.froward.int.ebiederm.org>
 <87wm3ky5n9.fsf@email.froward.int.ebiederm.org>
 <87h5uoxw06.fsf_-_@email.froward.int.ebiederm.org>
 <6dc556a0a93c18fffec71322bf97441c74b3134e.camel@huaweicloud.com>
 <87v7iqtcev.fsf_-_@email.froward.int.ebiederm.org>
 <dca0f01500f9d6705dccf3b3ef616468b1f53f57.camel@huaweicloud.com>
 <87ms42rq3t.fsf@email.froward.int.ebiederm.org>
 <GV2PPF74270EBEE90CDCD964F69E806EF58E4D9A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PPF74270EBEE90CDCD964F69E806EF58E4D9A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
Received-SPF: none client-ip=62.89.141.173; envelope-from=viro@ftp.linux.org.uk;
 helo=zeniv.linux.org.uk
X-Mailman-Approved-At: Thu, 04 Dec 2025 15:58:45 +0000
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
 "Paulo Alcantara \(SUSE\)" <pc@manguebit.com>,
 Paul Moore <paul@paul-moore.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Helge Deller <deller@gmx.de>, YueHaibing <yuehaibing@huawei.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 James Morris <jamorris@linux.microsoft.com>, Ingo Molnar <mingo@kernel.org>,
 Penglei Jiang <superman.xpt@gmail.com>, Hans Liljestrand <ishkamiel@gmail.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Serge Hallyn <serge@hallyn.com>,
 Randy Dunlap <rdunlap@infradead.org>, Stefan Roesch <shr@devkernel.io>,
 Frederic Weisbecker <frederic@kernel.org>, Chao Yu <chao@kernel.org>,
 apparmor <apparmor@lists.ubuntu.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Aleksa Sarai <cyphar@cyphar.com>,
 Roberto Sassu <roberto.sassu@huaweicloud.com>,
 Dave Chinner <dchinner@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Suren Baghdasaryan <surenb@google.com>, linux-integrity@vger.kernel.org,
 David Windsor <dwindsor@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>,
 Will Drewry <wad@chromium.org>, Adrian Ratiu <adrian.ratiu@collabora.com>,
 Adrian Reber <areber@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, Cyrill Gorcunov <gorcunov@gmail.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Dec 03, 2025 at 02:16:29PM +0100, Bernd Edlinger wrote:

> Hmm, yes, that looks like an issue.
> 
> I would have expected the security engine to look at bprm->filenanme
> especially in the case, when bprm->interp != bprm->filename,
> and check that it is not a sym-link with write-access for the
> current user and of course also that the bprm->file is not a regular file
> which is writable by the current user, if that is the case I would have expected
> the secuity engine to enforce non-new-privs on a SUID executable somehow.

Check that _what_ is not a symlink?  And while we are at it, what do write
permissions to any symlinks have to do with anything whatsoever?

