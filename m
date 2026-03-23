Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MI0AekWwWn5QQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 11:33:13 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAED2F0242
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 11:33:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w4cal-0003xM-Tz; Mon, 23 Mar 2026 10:33:03 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1w4caj-0003wV-W2
 for apparmor@lists.ubuntu.com; Mon, 23 Mar 2026 10:33:02 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 62NAW4RB055580;
 Mon, 23 Mar 2026 19:32:04 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.2] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 62NAW3IX055577
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 23 Mar 2026 19:32:04 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <714a614b-cfb4-4b20-af8c-df3cc56dfb92@I-love.SAKURA.ne.jp>
Date: Mon, 23 Mar 2026 19:32:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Brauner <brauner@kernel.org>, Song Liu <songliubraving@meta.com>
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-7-song@kernel.org>
 <b720f521-e930-4f35-9505-1bfdf9e2818c@I-love.SAKURA.ne.jp>
 <4DF5C4A8-7C92-4F76-9B34-2262089E7289@meta.com>
 <33abcf34-13e2-4a37-83f3-78bb27ecbc11@I-love.SAKURA.ne.jp>
 <F0A0D13E-8208-49A4-9AC6-89AC4BF3F4FB@meta.com>
 <20260323-klappen-atemschutz-7a0af8c6b087@brauner>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20260323-klappen-atemschutz-7a0af8c6b087@brauner>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav203.rs.sakura.ne.jp
X-Virus-Status: clean
Received-SPF: pass client-ip=202.181.97.72;
 envelope-from=penguin-kernel@I-love.SAKURA.ne.jp; helo=www262.sakura.ne.jp
Subject: Re: [apparmor] [PATCH 6/7] tomoyo: Convert from sb_mount to
	granular mount hooks
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
Cc: "herton@canonical.com" <herton@canonical.com>,
 "jack@suse.cz" <jack@suse.cz>, "paul@paul-moore.com" <paul@paul-moore.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "stephen.smalley.work@gmail.com" <stephen.smalley.work@gmail.com>,
 Kernel Team <kernel-team@meta.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "jmorris@namei.org" <jmorris@namei.org>,
 "omosnace@redhat.com" <omosnace@redhat.com>, Song Liu <song@kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "gnoack@google.com" <gnoack@google.com>, "mic@digikod.net" <mic@digikod.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "takedakn@nttdata.co.jp" <takedakn@nttdata.co.jp>,
 "serge@hallyn.com" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:songliubraving@meta.com,m:herton@canonical.com,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[i-love.sakura.ne.jp];
	FORGED_SENDER(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,kernel.org,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[I-love.SAKURA.ne.jp:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 6CAED2F0242
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/03/23 19:16, Christian Brauner wrote:
>>> Since not all filesystems need to resolve dev_name argument, conversion from dev_name
>>> to "struct path" is up to individual filesystem. If we can use a flag like FS_REQUIRES_DEV
>>> that tells whether that filesystem will resolve dev_name argument, I think we can resolve
>>> the dev_name argument before security_mount_new() is called (and can avoid TOCTOU).
>>

I was expecting that "struct file_system_type"->fs_flags containing FS_REQUIRES_DEV
is a sign that the dev_name argument is a pathname. But it seems that such assumption 
no longer holds true. For example, cramfs started treating dev_name like "mtd$num"
as if /dev/mtdblock$num since 4.15. So, current TOMOYO logic causes mount request of
cramfs with dev_name like "mtd0" to fail.

>> I guess we can add dev_path to fs_context?
> 
> No, when and how the path is resolved is entirely up to the individual
> filesystem and we're not hoisting the block-based specific path lookup
> up into the VFS while leaving the other stuff per-filesystem. And it's
> not as trivial as you want it to be either.

Then, how can LSM modules know that how the requested filesystem resolves
the dev_name argument, without embedding filesystem specific resolution
logic into individual LSM module?

I want some flag like FS_REQUIRES_DEV that tells individual LSM module
whether the dev_name argument should be interpreted as a pathname.


