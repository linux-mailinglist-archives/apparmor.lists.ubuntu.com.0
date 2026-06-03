Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CV9OE81MIGqH0gAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 03 Jun 2026 17:48:29 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E81A5639645
	for <lists+apparmor@lfdr.de>; Wed, 03 Jun 2026 17:48:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wUnpG-0005Rg-4D; Wed, 03 Jun 2026 15:48:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wUnpD-0005Q1-N6
 for apparmor@lists.ubuntu.com; Wed, 03 Jun 2026 15:48:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 92BA5445D2
 for <apparmor@lists.ubuntu.com>; Wed,  3 Jun 2026 15:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BA31F0089F
 for <apparmor@lists.ubuntu.com>; Wed,  3 Jun 2026 15:43:00 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-914bfa75911so94766385a.1
 for <apparmor@lists.ubuntu.com>; Wed, 03 Jun 2026 08:43:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ8SrslGXWaX5CXYmh/NQ6R7sa6GCpC4nZ2zv9aIgjzcRppZMV1Z9Yxh9aUFbBtNO1bagCst+l2+JQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzkrVG0HXUiyE489noPYcHTXsoP3Wc6F3HXOddtno12QJYRA+yz
 QTjQNmx8Donp0W+ph8Cxx+F9lRdv8Y+17OiM6SKI4gHKA9mV8/flhoHCrnxyKZTonPepej2LtfW
 G52om9ZqPdr4f5RB72KMkA7xZWNK6JME=
X-Received: by 2002:a05:620a:6601:b0:915:83b1:fc43 with SMTP id
 af79cd13be357-9158b62262amr449090185a.12.1780501379724; Wed, 03 Jun 2026
 08:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260528182607.3150386-1-song@kernel.org>
 <20260528182607.3150386-8-song@kernel.org>
In-Reply-To: <20260528182607.3150386-8-song@kernel.org>
Date: Wed, 3 Jun 2026 08:42:48 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6VJ_yuxatCUQRxxVAYZeT-5JH_AytaTh6grBHLYmDeLQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lc1ww09mSIZr5MM1D79LnYMeu-2aFD4AFO_M0ImtWHpVW8yDfo1wjCppo
Message-ID: <CAPhsuW6VJ_yuxatCUQRxxVAYZeT-5JH_AytaTh6grBHLYmDeLQ@mail.gmail.com>
To: brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.234.252.31; envelope-from=song@kernel.org;
 helo=sea.source.kernel.org
Subject: Re: [apparmor] [PATCH v5 7/8] vfs: Replace
 security_sb_mount/security_move_mount with granular hooks
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
From: Song Liu via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Song Liu <song@kernel.org>
Cc: herton@canonical.com, jack@suse.cz, paul@paul-moore.com,
 penguin-kernel@i-love.sakura.ne.jp, stephen.smalley.work@gmail.com,
 kernel-team@meta.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 omosnace@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, viro@zeniv.linux.org.uk,
 gnoack@google.com, mic@digikod.net, takedakn@nttdata.co.jp,
 selinux@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_mime,lists.ubuntu.com:from_smtp];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,suse.cz,paul-moore.com,i-love.sakura.ne.jp,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,vger.kernel.org,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:herton@canonical.com,m:jack@suse.cz,m:paul@paul-moore.com,m:penguin-kernel@i-love.sakura.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:linux-fsdevel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:selinux@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[song@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime,lists.ubuntu.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E81A5639645

Hi Christian,

On Thu, May 28, 2026 at 11:26=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> Replace the monolithic security_sb_mount() call in path_mount() and
> security_move_mount() in vfs_move_mount() with the new granular mount
> hooks:
>
> - do_loopback(): call security_mount_bind()
> - do_new_mount(): call security_mount_new()
> - do_remount(): call security_mount_remount()
> - do_reconfigure_mnt(): call security_mount_reconfigure()
> - do_move_mount_old(): call security_mount_move()
> - do_change_type(): call security_mount_change_type()
> - vfs_move_mount(): replace security_move_mount() with
>   security_mount_move()

Does this version look good to you?

Thanks,
Song

