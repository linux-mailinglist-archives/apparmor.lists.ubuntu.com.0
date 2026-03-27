Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCOqNz/SxWmMCAUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Mar 2026 01:41:35 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D8733D97A
	for <lists+apparmor@lfdr.de>; Fri, 27 Mar 2026 01:41:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w5vGJ-00024v-RV; Fri, 27 Mar 2026 00:41:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1w5vGI-000246-Pz
 for apparmor@lists.ubuntu.com; Fri, 27 Mar 2026 00:41:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CF67B600AC
 for <apparmor@lists.ubuntu.com>; Fri, 27 Mar 2026 00:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75667C2BC87
 for <apparmor@lists.ubuntu.com>; Fri, 27 Mar 2026 00:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774571503;
 bh=Rq9PRfmzEd8pFqhaLXWm0uXpL3e7gMIf0DgvFhVkaWc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m44kp1ml6ZzZCF2mP4NRV8O+p0uCknzwbQG766UIeEUoyNS8mQ94+mByRMpyn9H1u
 wLKyykBQvhQftw6ELGCy6BRZXP/sNsaoMccP1kaMMy8WZvxmT6vgQzQqziNx11HmIB
 6AjVJoFzmcOylF4B4KZSklI7R3MsD2ETngqUBZlacZGLi7USdANQauY2MBd7sbyN+M
 zhcAhWU0ZRsOZlbgmdR/QVbm7OXUenUct3Hkv8hGk62lqiZ53aVKlFABCNHCiu/TTl
 OiqdhhhgP7dMpzeFiQr7WovoOAiI1mU4LM6DHWYxygEd/LhQbtia27NuZYUROXULbQ
 ZL1pumFNKFWag==
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8cb3bae8d3eso164642085a.1
 for <apparmor@lists.ubuntu.com>; Thu, 26 Mar 2026 17:31:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZZbuNVuN4AM5zDT0h9hjg5JvnjISOXkX+/04F0BppQsHEdAEK4JWwcQeyymhdp27M4QhQMEdzTQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yx9Hset8KoIUqAFhbxdlBO6C3cXRlte7CH0LSBzXJV51ru3cuxl
 qRtkbaFN4/CKbVBi/S00PgTLQuyut2Yx2tOez4ERxq6k8WmACeVsesqw3xR0+Ychk0fE4skE9uo
 qliXN+Z0EUPCz370FHEz5il/VVtoyUgo=
X-Received: by 2002:a05:620a:1726:b0:8cd:c011:dfc1 with SMTP id
 af79cd13be357-8d01c5bdfd7mr70062485a.5.1774571502563; Thu, 26 Mar 2026
 17:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260318184400.3502908-1-song@kernel.org>
In-Reply-To: <20260318184400.3502908-1-song@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 26 Mar 2026 17:31:31 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5h=-BVp6g2UtHTUO8PQtbiSmqDrn0BT3rbdN4BkhQpeA@mail.gmail.com>
X-Gm-Features: AQROBzDtNk75hP_VA5ya8WelxQdCIDh8Ucqh_5CNwOEcbULbEq8x6UohK-ggrLE
Message-ID: <CAPhsuW5h=-BVp6g2UtHTUO8PQtbiSmqDrn0BT3rbdN4BkhQpeA@mail.gmail.com>
To: linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com, paul@paul-moore.com, 
 john.johansen@canonical.com, mic@digikod.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: Re: [apparmor] [PATCH 0/7] lsm: Replace security_sb_mount with
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
Cc: brauner@kernel.org, herton@canonical.com, jack@suse.cz,
 penguin-kernel@i-love.sakura.ne.jp, stephen.smalley.work@gmail.com,
 kernel-team@meta.com, jmorris@namei.org, omosnace@redhat.com,
 viro@zeniv.linux.org.uk, gnoack@google.com, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:paul@paul-moore.com,m:john.johansen@canonical.com,m:mic@digikod.net,m:brauner@kernel.org,m:herton@canonical.com,m:jack@suse.cz,m:penguin-kernel@i-love.sakura.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,canonical.com,suse.cz,i-love.sakura.ne.jp,gmail.com,meta.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,nttdata.co.jp,hallyn.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	NEURAL_SPAM(0.00)[0.975];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 89D8733D97A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi folks, especially SELinux, AppArmor, and LandLock maintainers,

Could you please share your comments on this set? AFAICT, there are
no functional changes (other than fixing TOCTOU) to existing LSMs.
If there are no issues with these changes, can we land the set in 7.1
kernels?

Thanks,
Song

On Wed, Mar 18, 2026 at 11:44=E2=80=AFAM Song Liu <song@kernel.org> wrote:
[...]

> All existing LSM behaviors are preserved:
>   AppArmor: same policy matching, TOCTOU fixed for bind/move
>   SELinux:  same permission checks (FILE__MOUNTON, FILESYSTEM__REMOUNT)
>   Landlock: same deny-all for sandboxed processes
>   Tomoyo:   same policy matching, TOCTOU fixed for bind/move, unused
>             data_page parameter removed
>
>
> This work is inspired by earlier discussions:
>
> [1] https://lore.kernel.org/bpf/20251127005011.1872209-1-song@kernel.org/
> [2] https://lore.kernel.org/linux-security-module/20250708230504.3994335-=
1-song@kernel.org/
>
>
> Song Liu (7):
>   lsm: Add granular mount hooks to replace security_sb_mount
>   apparmor: Remove redundant MS_MGC_MSK stripping in apparmor_sb_mount
>   apparmor: Convert from sb_mount to granular mount hooks
>   selinux: Convert from sb_mount to granular mount hooks
>   landlock: Convert from sb_mount to granular mount hooks
>   tomoyo: Convert from sb_mount to granular mount hooks
>   lsm: Remove security_sb_mount and security_move_mount

