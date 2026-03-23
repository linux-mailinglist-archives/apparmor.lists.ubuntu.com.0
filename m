Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WANpBFQVwWn5QQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 11:26:28 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80F2F0009
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 11:26:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w4cUF-0003IS-3k; Mon, 23 Mar 2026 10:26:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1w4cUC-0003IK-Q3
 for apparmor@lists.ubuntu.com; Mon, 23 Mar 2026 10:26:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 06C7060051;
 Mon, 23 Mar 2026 10:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2965EC4CEF7;
 Mon, 23 Mar 2026 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774260989;
 bh=dQ+XJeUBxU2ECoBCOmU1p9/Q6avsSxDQDUGdBMesKTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D/PFJqSufEi0U5zbotkjJegfSLBtIqK+5upQokMTrxEhjPXnhy5msB/ev2cAx/h8m
 wY5lUmW0g4VJ6WK2XNk0PJIL9QhfcBGSz1qhOq/umKTcKpRvam1DaP+tBKltUkyUQm
 0wOQSH5C6QwA059b/jhabN04SaWSSg397v855bulQNglsGjUhsyARM+Se6NJe2XhMg
 LdpQBH8xo3/Ozj3JogkYI6UZ5VdlWn5dZwC2ZD8kJayCXkvlA+J6jyG0La7G7PbPbo
 Of4Csj8t4vckaLGuxQvtazsmAoPFRVHONmS1NYYZmF3PVQusSD3ZPN5OyCmAhn9f2g
 N/IeGBlQAcoog==
Date: Mon, 23 Mar 2026 11:16:22 +0100
From: Christian Brauner <brauner@kernel.org>
To: Song Liu <songliubraving@meta.com>
Message-ID: <20260323-klappen-atemschutz-7a0af8c6b087@brauner>
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-7-song@kernel.org>
 <b720f521-e930-4f35-9505-1bfdf9e2818c@I-love.SAKURA.ne.jp>
 <4DF5C4A8-7C92-4F76-9B34-2262089E7289@meta.com>
 <33abcf34-13e2-4a37-83f3-78bb27ecbc11@I-love.SAKURA.ne.jp>
 <F0A0D13E-8208-49A4-9AC6-89AC4BF3F4FB@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F0A0D13E-8208-49A4-9AC6-89AC4BF3F4FB@meta.com>
Received-SPF: pass client-ip=172.105.4.254; envelope-from=brauner@kernel.org;
 helo=tor.source.kernel.org
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
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
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
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "serge@hallyn.com" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [7.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[brauner@kernel.org,apparmor-bounces@lists.ubuntu.com];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:songliubraving@meta.com,m:herton@canonical.com,m:jack@suse.cz,m:paul@paul-moore.com,m:penguin-kernel@i-love.sakura.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:selinux@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[canonical.com,suse.cz,paul-moore.com,i-love.sakura.ne.jp,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,kernel.org,vger.kernel.org,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brauner@kernel.org,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i-love.sakura.ne.jp:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 9C80F2F0009
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Mon, Mar 23, 2026 at 03:32:14AM +0000, Song Liu wrote:
> 
> 
> > On Mar 22, 2026, at 3:46 AM, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
> > 
> > On 2026/03/22 10:06, Song Liu wrote:
> >>>> @@ -70,6 +70,7 @@ static bool tomoyo_check_mount_acl(struct tomoyo_request_info *r,
> >>>> * @dir:      Pointer to "struct path".
> >>>> * @type:     Name of filesystem type.
> >>>> * @flags:    Mount options.
> >>>> + * @dev_path: Pre-resolved device/source path. Maybe NULL.
> >>> 
> >>> I guess that we can avoid passing maybe-NULL dev_name if Al Viro can accept
> >>> resolving maybe-NULL dev_path argument before calling LSM hooks.
> >> 
> >> If I understand the code correctly, tomoyo records requested_dev_name for
> >> new mount. namespace.c, OTOH, does NOT do kern_path() for new mount. This 
> >> is why we keep the maybe-NULL dev_name here. I personally think this is 
> >> the best approach without changing tomoyo behavior.
> > 
> > Well, namespace.c does kern_path() for new mount, but it happens a bit later after
> > security_mount_new() was called.
> > 
> >  do_new_mount_fc() => fc_mount() => vfs_get_tree() => fc->ops->get_tree() == e.g. ext4_get_tree()
> >  => get_tree_bdev() => get_tree_bdev_flags() => lookup_bdev() => kern_path()
> > 
> > @@ -3835,6 +3855,9 @@ static int do_new_mount(const struct path *path, const char *fstype,
> > err = parse_monolithic_mount_data(fc, data);
> > if (!err && !mount_capable(fc))
> > err = -EPERM;
> > +
> > + if (!err)
> > + err = security_mount_new(fc, path, mnt_flags, flags, data);
> > if (!err)
> > err = do_new_mount_fc(fc, path, mnt_flags);
> > 
> > 
> > Since not all filesystems need to resolve dev_name argument, conversion from dev_name
> > to "struct path" is up to individual filesystem. If we can use a flag like FS_REQUIRES_DEV
> > that tells whether that filesystem will resolve dev_name argument, I think we can resolve
> > the dev_name argument before security_mount_new() is called (and can avoid TOCTOU).
> 
> I guess we can add dev_path to fs_context?

No, when and how the path is resolved is entirely up to the individual
filesystem and we're not hoisting the block-based specific path lookup
up into the VFS while leaving the other stuff per-filesystem. And it's
not as trivial as you want it to be either.

