Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2FA85B871
	for <lists+apparmor@lfdr.de>; Tue, 20 Feb 2024 11:01:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rcMvt-00074Q-LA; Tue, 20 Feb 2024 10:01:02 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jack@suse.cz>)
 id 1rcMvl-00073g-LA; Tue, 20 Feb 2024 10:00:53 +0000
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B8EE1F867;
 Tue, 20 Feb 2024 10:00:53 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id ECA5E1358A;
 Tue, 20 Feb 2024 10:00:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id q1xsOVR41GWkbwAAn2gu4w
 (envelope-from <jack@suse.cz>); Tue, 20 Feb 2024 10:00:52 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 8853BA0807; Tue, 20 Feb 2024 11:00:52 +0100 (CET)
Date: Tue, 20 Feb 2024 11:00:52 +0100
From: Jan Kara <jack@suse.cz>
To: syzbot <syzbot+7d5fa8eb99155f439221@syzkaller.appspotmail.com>
Message-ID: <20240220100052.gbuy6dopqql7m7yl@quack3>
References: <000000000000ae0abc0600e0d534@google.com>
 <000000000000af682a0611c9a06f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000af682a0611c9a06f@google.com>
X-Spam-Level: *
X-Spamd-Bar: +
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [1.49 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLrqdkzci5prbpfh8ttufrg9xb)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.cz:+];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.00)[44.04%]; SUBJECT_HAS_QUESTION(0.00)[];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=6769a69bd0e144b4];
 TAGGED_RCPT(0.00)[7d5fa8eb99155f439221];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[19];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim,suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Score: 1.49
X-Rspamd-Queue-Id: 0B8EE1F867
X-Spam-Flag: NO
Subject: Re: [apparmor] [syzbot] [apparmor?] [ext4?] general protection
 fault in common_perm_cond
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
Cc: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, paul@paul-moore.com,
 john@apparmor.net, apparmor@lists.ubuntu.com, jmorris@namei.org,
 terrelln@fb.com, linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 adilger.kernel@dilger.ca, apparmor-owner@lists.ubuntu.com, tytso@mit.edu,
 linux-ext4@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon 19-02-24 21:39:02, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit 6f861765464f43a71462d52026fbddfc858239a5
> Author: Jan Kara <jack@suse.cz>
> Date:   Wed Nov 1 17:43:10 2023 +0000
> 
>     fs: Block writes to mounted block devices
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1644f22c180000
> start commit:   b6e6cc1f78c7 Merge tag 'x86_urgent_for_6.5_rc2' of git://g..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6769a69bd0e144b4
> dashboard link: https://syzkaller.appspot.com/bug?extid=7d5fa8eb99155f439221
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137b16dca80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14153b7ca80000
> 
> If the result looks correct, please mark the issue as fixed by replying with:

Makes sense.
 
#syz fix: fs: Block writes to mounted block devices

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

