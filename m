Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B7CB0814
	for <lists+apparmor@lfdr.de>; Tue, 09 Dec 2025 17:07:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vT0F8-0002RE-CW; Tue, 09 Dec 2025 16:07:14 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jack@suse.cz>) id 1vSwpp-0004dJ-GY
 for apparmor@lists.ubuntu.com; Tue, 09 Dec 2025 12:28:53 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C74D95BE26;
 Tue,  9 Dec 2025 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1765283332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ygaHW8o5EWTBSXhXnK7ekdPvbFwd/VSzrB9zkhVTLRQ=;
 b=VJlXEdXFL5fd4Sem3MzdBi6M+Hr11U7VtVbf3ME1dk5aSuhjv3O/iSL8Yd/XI8EpEFKwGn
 qt5OE3BhUWleFUONVE7NBCIrv8ySHriCLSY0zQvS97diMAG7hRy1P55heddbwQqqP5orwx
 zke8vzmd4c6IaLFBZbk/OIH2tq5XjmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1765283332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ygaHW8o5EWTBSXhXnK7ekdPvbFwd/VSzrB9zkhVTLRQ=;
 b=7U2McOFDYb7YMgNpJuCJtvWZaYZMflyH94JOMxO/WJFjXPjjRW/ONo04eFBGZ6oK+Zhnh3
 bJ4+1uZfHqHgl3Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1765283332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ygaHW8o5EWTBSXhXnK7ekdPvbFwd/VSzrB9zkhVTLRQ=;
 b=VJlXEdXFL5fd4Sem3MzdBi6M+Hr11U7VtVbf3ME1dk5aSuhjv3O/iSL8Yd/XI8EpEFKwGn
 qt5OE3BhUWleFUONVE7NBCIrv8ySHriCLSY0zQvS97diMAG7hRy1P55heddbwQqqP5orwx
 zke8vzmd4c6IaLFBZbk/OIH2tq5XjmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1765283332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ygaHW8o5EWTBSXhXnK7ekdPvbFwd/VSzrB9zkhVTLRQ=;
 b=7U2McOFDYb7YMgNpJuCJtvWZaYZMflyH94JOMxO/WJFjXPjjRW/ONo04eFBGZ6oK+Zhnh3
 bJ4+1uZfHqHgl3Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B094C3EA63;
 Tue,  9 Dec 2025 12:28:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EYIZKwQWOGnwYgAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 09 Dec 2025 12:28:52 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 4850FA08E4; Tue,  9 Dec 2025 13:28:48 +0100 (CET)
Date: Tue, 9 Dec 2025 13:28:48 +0100
From: Jan Kara <jack@suse.cz>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Message-ID: <722m42dxrfxao7y6ul5cb26orxoinsrozwqlf7ts52lpbfzgxs@gm6kakrzlhkz>
References: <87tsyozqdu.fsf@email.froward.int.ebiederm.org>
 <87wm3ky5n9.fsf@email.froward.int.ebiederm.org>
 <87h5uoxw06.fsf_-_@email.froward.int.ebiederm.org>
 <6dc556a0a93c18fffec71322bf97441c74b3134e.camel@huaweicloud.com>
 <87v7iqtcev.fsf_-_@email.froward.int.ebiederm.org>
 <dca0f01500f9d6705dccf3b3ef616468b1f53f57.camel@huaweicloud.com>
 <87ms42rq3t.fsf@email.froward.int.ebiederm.org>
 <GV2PPF74270EBEE90CDCD964F69E806EF58E4D9A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <20251204054915.GI1712166@ZenIV>
 <GV2PPF74270EBEE0AAAE2EB22B668EE21A7E4A6A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PPF74270EBEE0AAAE2EB22B668EE21A7E4A6A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; FREEMAIL_TO(0.00)[hotmail.de];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_LAST(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_DN_EQ_ADDR_SOME(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,hotmail.de];
 FREEMAIL_CC(0.00)[zeniv.linux.org.uk,xmission.com,huaweicloud.com,gmail.com,redhat.com,kernel.org,amacapital.net,chromium.org,linux-foundation.org,suse.com,hallyn.com,linux.microsoft.com,infradead.org,google.com,gmx.de,linutronix.de,kernel.dk,vger.kernel.org,kvack.org,didiglobal.com,manguebit.com,huawei.com,paul-moore.com,cyphar.com,devkernel.io,zte.com.cn,suse.cz,intel.com,joelfernandes.org,oracle.com,collabora.com,linux.ibm.com,canonical.com,lists.ubuntu.com];
 R_RATELIMIT(0.00)[to_ip_from(RLnys8keiybp4qp9x9peydjp1o)];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_GT_50(0.00)[61]; TAGGED_RCPT(0.00)[];
 SUBJECT_HAS_QUESTION(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.30
Received-SPF: pass client-ip=195.135.223.131; envelope-from=jack@suse.cz;
 helo=smtp-out2.suse.de
X-Mailman-Approved-At: Tue, 09 Dec 2025 16:07:12 +0000
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 Yafang Shao <laoar.shao@gmail.com>, xu xin <xu.xin16@zte.com.cn>,
 linux-kselftest@vger.kernel.org,
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
 Al Viro <viro@zeniv.linux.org.uk>, Dave Chinner <dchinner@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>,
 linux-integrity@vger.kernel.org, David Windsor <dwindsor@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Mateusz Guzik <mjguzik@gmail.com>, Will Drewry <wad@chromium.org>,
 Adrian Ratiu <adrian.ratiu@collabora.com>, Adrian Reber <areber@redhat.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Andy Lutomirski <luto@amacapital.net>, Cyrill Gorcunov <gorcunov@gmail.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu 04-12-25 14:03:27, Bernd Edlinger wrote:
> On 12/4/25 06:49, Al Viro wrote:
> > On Wed, Dec 03, 2025 at 02:16:29PM +0100, Bernd Edlinger wrote:
> > 
> >> Hmm, yes, that looks like an issue.
> >>
> >> I would have expected the security engine to look at bprm->filenanme
> >> especially in the case, when bprm->interp != bprm->filename,
> >> and check that it is not a sym-link with write-access for the
> >> current user and of course also that the bprm->file is not a regular file
> >> which is writable by the current user, if that is the case I would have expected
> >> the secuity engine to enforce non-new-privs on a SUID executable somehow.
> > 
> > Check that _what_ is not a symlink?  And while we are at it, what do write
> > permissions to any symlinks have to do with anything whatsoever?
> 
> When we execve a normal executable, we do open the binary file with
> deny_write_access so this might allow the security engine to inspaect the
> binary, before it is used.

That would be seriously flawed IMO because there are lot of cases where
code is executed without deny_write_access() - like shared libraries, code
loaded by interpreter, and probably more.

> However this behavior has changed recently,
> now it has some exceptions, where even this behavior is no longer
> guaranteed for binary executables, due to commit
> 0357ef03c94ef835bd44a0658b8edb672a9dbf51, but why?  I have no idea...

Because for hierarchical storage implementation you may need to fill in the
executable data from remote storage on demand and the deny_write_access
logic was making this impossible. We even tried to completely remove the
deny_write_access logic exactly because it has very limited use and
complicates things (commit 2a010c412853 ("fs: don't block i_writecount
during exec")) but that had to be reverted because some userspace depends
on the ETXTBUSY behavior.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

