Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKvdKHRgwmmecAQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Mar 2026 10:59:16 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B72FF3060AB
	for <lists+apparmor@lfdr.de>; Tue, 24 Mar 2026 10:59:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w4yXS-0007xw-Lc; Tue, 24 Mar 2026 09:59:06 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1w4yXQ-0007xJ-5k
 for apparmor@lists.ubuntu.com; Tue, 24 Mar 2026 09:59:04 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 62O9wJsG072034;
 Tue, 24 Mar 2026 18:58:19 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.2] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 62O9wJMb072031
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 24 Mar 2026 18:58:19 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <6c298238-8d87-4c41-84a7-e0373d466a15@I-love.SAKURA.ne.jp>
Date: Tue, 24 Mar 2026 18:58:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Song Liu <song@kernel.org>
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-7-song@kernel.org>
 <b720f521-e930-4f35-9505-1bfdf9e2818c@I-love.SAKURA.ne.jp>
 <4DF5C4A8-7C92-4F76-9B34-2262089E7289@meta.com>
 <33abcf34-13e2-4a37-83f3-78bb27ecbc11@I-love.SAKURA.ne.jp>
 <F0A0D13E-8208-49A4-9AC6-89AC4BF3F4FB@meta.com>
 <20260323-klappen-atemschutz-7a0af8c6b087@brauner>
 <714a614b-cfb4-4b20-af8c-df3cc56dfb92@I-love.SAKURA.ne.jp>
 <CAAeYb7k+TWArOKyOomkLZ8fwqUPjha9iORpJaj4nMyN=o4ZRQg@mail.gmail.com>
 <6609e11e-90aa-4021-974e-e9937688dd49@I-love.SAKURA.ne.jp>
 <CAPhsuW4G7vo-JZqenZ-sFHw9z02wZUJa1-+9U81U--vQhnfG_Q@mail.gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAPhsuW4G7vo-JZqenZ-sFHw9z02wZUJa1-+9U81U--vQhnfG_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav104.rs.sakura.ne.jp
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
 Christian Brauner <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>,
 "paul@paul-moore.com" <paul@paul-moore.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "stephen.smalley.work@gmail.com" <stephen.smalley.work@gmail.com>,
 Song Liu <songliubraving@meta.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "jmorris@namei.org" <jmorris@namei.org>,
 "omosnace@redhat.com" <omosnace@redhat.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "gnoack@google.com" <gnoack@google.com>, "mic@digikod.net" <mic@digikod.net>,
 "takedakn@nttdata.co.jp" <takedakn@nttdata.co.jp>,
 Kernel Team <kernel-team@meta.com>, "serge@hallyn.com" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:songliubraving@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:linux-fsdevel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:kernel-team@meta.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[i-love.sakura.ne.jp];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: B72FF3060AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/03/24 16:46, Song Liu wrote:
> On Mon, Mar 23, 2026 at 11:12 PM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
>>
>> On 2026/03/24 4:31, Song Liu wrote:
>>>> Then, how can LSM modules know that how the requested filesystem resolves
>>>> the dev_name argument, without embedding filesystem specific resolution
>>>> logic into individual LSM module?
>>>
>>> IIUC, if an LSM cares about the dev_name of a new mount, it will have to look
>>> into each individual filesystem. We can add a LSM hook for the filesystems to
>>> call. But this will require changes to individual filesystem code. OTOH,
>>> dev_name can probably bridge the gap as we change filesystems.
>>>
>>> Would this work?
>>
>> I guess something like untested diff shown below would work.
> 
> I think this doesn't work with erofs on file (requires
> CONFIG_EROFS_FS_BACKED_BY_FILE). erofs may not be the
> only one that has this problem.

This is incomplete but I think this is better than now because currently
mount() operation likely fails with -ENOENT if the requested filesystem
does not interpret fc->source as a pathname despite tomoyo_mount_acl()
always interprets fc->source as a pathname when FS_REQUIRES_DEV is set.

Also, mount() operation might by error succeed because tomoyo_mount_acl()
checks permission against unintended file when e.g. "mtd0" by chance exists
in the current directory.

We could add filesystem-specific logic to e.g. CONFIG_EROFS_FS_BACKED_BY_FILE
case that copies the resolved "struct path" to fc->source_path. But even without
adding filesystem-specific logic, mount() operation will succeed because
tomoyo_mount_acl() can handle fc->source as a string rather than a canonicalized
pathname.

Being able to know whether tomoyo_mount_acl() should interpret dev_name as a
pathname (which is subjected to canonicalization, and also subjected to more
complicated permission checks based on e.g. inode's uid/gid) is appreciated.


