Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APU3Ml5uA2pS5wEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 12 May 2026 20:15:58 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11A5272BF
	for <lists+apparmor@lfdr.de>; Tue, 12 May 2026 20:15:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wMrdr-0006Tq-8e; Tue, 12 May 2026 18:15:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wMrdq-0006Td-1n
 for apparmor@lists.ubuntu.com; Tue, 12 May 2026 18:15:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7F41A60132
 for <apparmor@lists.ubuntu.com>; Tue, 12 May 2026 18:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B0DC4AF0C
 for <apparmor@lists.ubuntu.com>; Tue, 12 May 2026 18:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778609255;
 bh=1+WG2MzbBw4FYQ+ZqlnfYUFJjE67o+yVompxx5/7iXE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q10VsoazCAWp87x2iZ0pioO0ZNp3E+RmMgpOTCJ0p4rt0r90N+62Xf/ZF+lxgVfof
 xmqNrRW9oPV+Xye7vLbiQ7Jww7eSp61huQlu6r97VbzB+egiOt6ppCLFtSQ8jukg1u
 pf+RfcK/k3UfKUMtoteTzpvbyhzsoV3lV/ZGRgKpZ+pJk8dQZrppIpfdDPDxfjkD0u
 UG6N6kyn/5YcKABsCzTBLfpcNPml1jCG3g4z2ploBrZhLdOUmXi/WNv221gnxS1aEi
 UxB6uuT9ckY8zPxswOPg2DZr1AhWdze6MxGoZNm2W/pQj8A4hmw9Upbr0imWx1BG1H
 G9vART2Y8sV5g==
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-8b81586dff3so67726226d6.1
 for <apparmor@lists.ubuntu.com>; Tue, 12 May 2026 11:07:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/Y2unpe07pcQYnM9v3Sg1n0D+nu4BgsR8sh64QsbjHxJtzO/t8UJDbEUWXsSOx+Z2xDJwufxOqyA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yw33TJv1Q97U1ATLYYob3lx+FSpaY91/ULw+V3Wt+HVnyVjuofT
 1vFokILjSshBjaZQJFcu+EKxXdqGTDmxoPPZreoX6rFEtRMRByEyUVXNEXOucrcrvvOXaO4RIbz
 daAtXLX9cNuFJ2koofRVS9nLeQHhOmbw=
X-Received: by 2002:a05:6214:5981:b0:8c6:2245:3f49 with SMTP id
 6a1803df08f44-8c6632d9dd5mr59505866d6.32.1778609254036; Tue, 12 May 2026
 11:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260509015208.3853132-1-song@kernel.org>
 <20260509015208.3853132-7-song@kernel.org>
 <42a9075e-a4b4-4eb7-b96e-48e5c0cd2f3a@I-love.SAKURA.ne.jp>
 <CAHC9VhT9vvaoYpRX4fPZ_H13+PaqG72CpRbS+d=9xgMBaKHo8w@mail.gmail.com>
In-Reply-To: <CAHC9VhT9vvaoYpRX4fPZ_H13+PaqG72CpRbS+d=9xgMBaKHo8w@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Tue, 12 May 2026 11:07:22 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6c4kbVmBJ+4=J2WgD8JKv7q_cZqXSE3+EPkWKro0dh1g@mail.gmail.com>
X-Gm-Features: AVHnY4LZp5deom77-xEaW01b2jRxtdWLWeWdvcHJesrle08Ns_ME_r63-071_KQ
Message-ID: <CAPhsuW6c4kbVmBJ+4=J2WgD8JKv7q_cZqXSE3+EPkWKro0dh1g@mail.gmail.com>
To: Paul Moore <paul@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
 helo=tor.source.kernel.org
Subject: Re: [apparmor] [PATCH v3 6/7] tomoyo: Convert from sb_mount to
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
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 stephen.smalley.work@gmail.com, kernel-team@meta.com,
 apparmor@lists.ubuntu.com, jmorris@namei.org, omosnace@redhat.com,
 mic@digikod.net, linux-security-module@vger.kernel.org,
 viro@zeniv.linux.org.uk, gnoack@google.com, linux-fsdevel@vger.kernel.org,
 takedakn@nttdata.co.jp, selinux@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 0B11A5272BF
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
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,i-love.sakura.ne.jp,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,digikod.net,vger.kernel.org,zeniv.linux.org.uk,google.com,nttdata.co.jp,hallyn.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:paul@paul-moore.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:penguin-kernel@i-love.sakura.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:selinux@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.925];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,paul-moore.com:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 6:32=E2=80=AFAM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Tue, May 12, 2026 at 7:03=E2=80=AFAM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> > On 2026/05/09 10:52, Song Liu wrote:
> > > Replace tomoyo_sb_mount() with granular mount hooks. Each hook
> > > reconstructs the MS_* flags expected by tomoyo_mount_permission()
> > > using the original flags parameter where available.
> >
> > Please fold below diff into this patch. Then,
> >
> > Acked-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > ---
> >  security/tomoyo/tomoyo.c | 60 ++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 58 insertions(+), 2 deletions(-)
>
> Thanks Tetsuo.
>
> Song, assuming you have no objections to the comment blocks, please
> fold in Tetsuo's additions in your next version and add his ACK to
> this patch.

Updated 6/7 with these changes. Thanks to both of you!

Song

