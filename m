Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFO/BrtGAmpPpwEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 23:14:35 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7A15162EA
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 23:14:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wMXxE-00057T-Om; Mon, 11 May 2026 21:14:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wMXxD-00056x-5v
 for apparmor@lists.ubuntu.com; Mon, 11 May 2026 21:14:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0E0A14441C
 for <apparmor@lists.ubuntu.com>; Mon, 11 May 2026 21:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A11C2BCFC
 for <apparmor@lists.ubuntu.com>; Mon, 11 May 2026 21:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778533615;
 bh=Vhk6YYwPEmJxuRm5pxOHa9xAnh8YRHsA1LM0oPK12V4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ePCQtA8W41CIVIjMcHGJOcv6l7JtWo6C6G7/udXyOHSVdAh8HCNFw5n8ZWKQOACxp
 9VMnQuhMKLOHYzy76zBSwxFZwml9/nJCIUkzLO/mFe3pqRp1mk6AbrZsLKTb4/iAIA
 E7Yf6RU60mnt/gbOYjsUmzDxw3Y78f6maYkFX3M4xsrw/i50D1TYtdYhkXcDJpeXPE
 Ahw3FFfsj8GdMqz8+ehStT1OF6zd2WR1RZKbH+LfZIG+6QgIMVzj5GVx9foRlo5R6P
 3k27HQY22qou5SdgvX/ioRBsjqwJGyNOGHLnRorNhPKtfKHtC6HK/WbFmelFjEVXPE
 ejwj9crBFQMYg==
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-50e5c5033f6so33407481cf.0
 for <apparmor@lists.ubuntu.com>; Mon, 11 May 2026 14:06:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/tN3fq47bKifLTPdy66Rk8sar12u8vgR4VAv6iPW4/zygpiml4avqRAfY7jnE31RsviYA9B9OUeQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxRFjAj8D2CN3lCZSqZoO++lY3TTugyOIypdz8vxt8B8oZtX9gv
 xV8/1OJr5rCVnxFMB4UwGHu4gCEXtz9a5NQfrN9fSXdTWmkW6iOqmF7W3fgrZgcjjlX0Bmo3tSk
 K+2qRReq6c3txYF+RzHBpwhxuaraQs18=
X-Received: by 2002:a05:622a:588e:b0:509:1b76:e9b2 with SMTP id
 d75a77b69052e-514621e4ceamr367968911cf.55.1778533615092; Mon, 11 May 2026
 14:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260509015208.3853132-8-song@kernel.org>
 <37ceb04c4c37370a2359f73a24b9c07b@paul-moore.com>
In-Reply-To: <37ceb04c4c37370a2359f73a24b9c07b@paul-moore.com>
From: Song Liu <song@kernel.org>
Date: Mon, 11 May 2026 14:06:43 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4=oP5OGY3c9H1Ctp-Nq_o9O8f8dJc3Ox_MBkqur04vDw@mail.gmail.com>
X-Gm-Features: AVHnY4KL21_s0gqGE1PGALd_1tRQ5STcRZqygN-IW3-LqKvndAAGqAiFc8IsSho
Message-ID: <CAPhsuW4=oP5OGY3c9H1Ctp-Nq_o9O8f8dJc3Ox_MBkqur04vDw@mail.gmail.com>
To: Paul Moore <paul@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.234.252.31; envelope-from=song@kernel.org;
 helo=sea.source.kernel.org
Subject: Re: [apparmor] [PATCH v3 7/7] lsm: Remove security_sb_mount and
	security_move_mount
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
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz,
 selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, viro@zeniv.linux.org.uk,
 gnoack@google.com, linux-fsdevel@vger.kernel.org, takedakn@nttdata.co.jp,
 kernel-team@meta.com, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 2A7A15162EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,vger.kernel.org,gmail.com,i-love.sakura.ne.jp,lists.ubuntu.com,namei.org,redhat.com,digikod.net,zeniv.linux.org.uk,google.com,nttdata.co.jp,meta.com,hallyn.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:paul@paul-moore.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:penguin-kernel@i-love.sakura.ne.jp,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:kernel-team@meta.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.798];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,paul-moore.com:email,paul-moore.com:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 12:53=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
[...]
> >
> > -     LSM_HOOK_INIT(move_mount, selinux_move_mount),
>
> This should be in patch 4/7 when you convert SELinux.

Good points. I applied these changes to my local v4. I will wait a bit
longer before sending v4, though.

Thanks,
Song


> >       LSM_HOOK_INIT(dentry_init_security, selinux_dentry_init_security)=
,
> >       LSM_HOOK_INIT(dentry_create_files_as, selinux_dentry_create_files=
_as),
> >
> > --
> > 2.53.0-Meta
>
> --
> paul-moore.com

