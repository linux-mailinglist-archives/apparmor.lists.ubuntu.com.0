Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FppEGCVvmnYTgMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sat, 21 Mar 2026 13:56:00 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F4C2E55FB
	for <lists+apparmor@lfdr.de>; Sat, 21 Mar 2026 13:55:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w3vri-0006uU-29; Sat, 21 Mar 2026 12:55:42 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1w3vrf-0006th-FZ
 for apparmor@lists.ubuntu.com; Sat, 21 Mar 2026 12:55:39 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 62LCseeN068067;
 Sat, 21 Mar 2026 21:54:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.2] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 62LCseWX068062
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 21 Mar 2026 21:54:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <b720f521-e930-4f35-9505-1bfdf9e2818c@I-love.SAKURA.ne.jp>
Date: Sat, 21 Mar 2026 21:54:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Song Liu <song@kernel.org>, viro@zeniv.linux.org.uk
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-7-song@kernel.org>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20260318184400.3502908-7-song@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav201.rs.sakura.ne.jp
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
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz, paul@paul-moore.com,
 selinux@vger.kernel.org, stephen.smalley.work@gmail.com, kernel-team@meta.com,
 apparmor@lists.ubuntu.com, jmorris@namei.org, omosnace@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 gnoack@google.com, mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:viro@zeniv.linux.org.uk,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:linux-fsdevel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_NA(0.00)[i-love.sakura.ne.jp];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,google.com,digikod.net,nttdata.co.jp,hallyn.com];
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
X-Rspamd-Queue-Id: 40F4C2E55FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/03/19 3:43, Song Liu wrote:
> Replace tomoyo_sb_mount() with granular mount hooks. Each hook
> reconstructs the MS_* flags expected by tomoyo_mount_permission()
> using the original flags parameter where available.
> 
> Key changes:
> - mount_bind: passes the pre-resolved source path to
>   tomoyo_mount_acl() via a new dev_path parameter, instead of
>   re-resolving dev_name via kern_path(). This eliminates a TOCTOU
>   vulnerability.
> - mount_new, mount_remount, mount_reconfigure: use the original
>   mount(2) flags for policy matching.
> - mount_move: passes pre-resolved paths for both source and
>   destination.
> - mount_change_type: passes raw ms_flags directly.
> 
> Also removes the unused data_page parameter from
> tomoyo_mount_permission().
> 
> Code generated with the assistance of Claude, reviewed by human.
> 
> Signed-off-by: Song Liu <song@kernel.org>

Basically OK. One question to Al Viro.

Do you still refuse the idea of resolving dev_path argument before calling LSM hooks
(the proposal you NAKed at https://lkml.kernel.org/r/20250709102410.GU1880847@ZenIV )
despite this series removes security_sb_mount() and security_move_mount() hooks?

> diff --git a/security/tomoyo/mount.c b/security/tomoyo/mount.c
> index 322dfd188ada..82ffe7d02814 100644
> --- a/security/tomoyo/mount.c
> +++ b/security/tomoyo/mount.c
> @@ -70,6 +70,7 @@ static bool tomoyo_check_mount_acl(struct tomoyo_request_info *r,
>   * @dir:      Pointer to "struct path".
>   * @type:     Name of filesystem type.
>   * @flags:    Mount options.
> + * @dev_path: Pre-resolved device/source path. Maybe NULL.

I guess that we can avoid passing maybe-NULL dev_name if Al Viro can accept
resolving maybe-NULL dev_path argument before calling LSM hooks.


