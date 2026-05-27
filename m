Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPvxJ51fF2qpCggAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 27 May 2026 23:18:21 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 446105EA60F
	for <lists+apparmor@lfdr.de>; Wed, 27 May 2026 23:18:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSLdg-0008Ip-RR; Wed, 27 May 2026 21:18:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1wSLde-0008GM-OK
 for apparmor@lists.ubuntu.com; Wed, 27 May 2026 21:18:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D6CB44D8C
 for <apparmor@lists.ubuntu.com>; Wed, 27 May 2026 21:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2BA1F01560
 for <apparmor@lists.ubuntu.com>; Wed, 27 May 2026 21:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779916149;
 bh=SGNQeth4C737npdaj8qyPJlkY2CV1woEfMjV+LyPpKs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=YYbl47tSWadaLp25wNd29TyEhD4mDuRPA28dakOeAUi2bdlKLPhX785Mg1CaYsLVE
 sD2/UqQMwyaKYORziMsp06JC0jnVFXsmv28Cq6AUsef4IIA4og8Jp30IHGFpcDCxmh
 TIH1q1zW3VniIGan5y6fvFl8fQkRzkWDwZ3OHjKXax0ebudOFasMJQQa23pSLWcf/R
 qoyK3Q/TewfmY7g3nmlToY+2U48SfjZPF15+bF6ESDIbdeyvyqu5Lw8dU03J7LZzUP
 YeJJxhVvVPKVl39qKuc06tiwWWPMT2IgRsnRwrT1bjnpvpOlrVaFq6LhYVYJvPA38H
 h0l76bbb6sc0Q==
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-914b4be9c4bso540529585a.0
 for <apparmor@lists.ubuntu.com>; Wed, 27 May 2026 14:09:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ92S18nzXAPuEnNYwn1bOG4hfLjkpZVVz2jH0HzC1VQzhzaN6nFCVB6hrjUcKH9Ipp/4Az7Mh/uDg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxjN9UCAjizTi9rDWpA0Ri05Ma+O1CuhA8VofzjCDAlxO6cVGzb
 GafN4UCzhy5KE2YljE3VASrowoCPpQlMzFADGJ/n5uojq9JUYjS8bGtB7fvOzkSTos04/0/jnjx
 iLsi0s4kYzvtg2ORHW5bm2rBKunXIkcI=
X-Received: by 2002:a05:620a:408f:b0:90c:a08f:c5f0 with SMTP id
 af79cd13be357-914b49cd89fmr3578191385a.33.1779916148247; Wed, 27 May 2026
 14:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260515200158.4081915-1-song@kernel.org>
 <20260515200158.4081915-2-song@kernel.org>
 <177944135249.2871055.11361892114499566606.b4-review@b4>
 <CAPhsuW4BVSQ6oqyk=kExuZUkB9PWRRqUf_EJ=x3mNmtkT4oH4g@mail.gmail.com>
 <20260527-landen-bahnfahren-eckpfeiler-c1e1e9cb73aa@brauner>
In-Reply-To: <20260527-landen-bahnfahren-eckpfeiler-c1e1e9cb73aa@brauner>
From: Song Liu <song@kernel.org>
Date: Wed, 27 May 2026 14:08:56 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4bwf=G--_gfMZOOAkpRJDfC0FSv=Tq+UAdAOY0euDamg@mail.gmail.com>
X-Gm-Features: AVHnY4JoTXa2GC7TLUEwE7AqXzVEqSqzeUkn5eeygD5_8kZaIgsnYmpV6LQtVMg
Message-ID: <CAPhsuW4bwf=G--_gfMZOOAkpRJDfC0FSv=Tq+UAdAOY0euDamg@mail.gmail.com>
To: Christian Brauner <brauner@kernel.org>, paul@paul-moore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.234.252.31; envelope-from=song@kernel.org;
 helo=sea.source.kernel.org
Subject: Re: [apparmor] [PATCH v4 1/7] lsm: Add granular mount hooks to
	replace security_sb_mount
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
Cc: herton@canonical.com, kernel-team@meta.com, jack@suse.cz,
 selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, viro@zeniv.linux.org.uk,
 gnoack@google.com, linux-fsdevel@vger.kernel.org, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FREEMAIL_CC(0.00)[canonical.com,meta.com,suse.cz,vger.kernel.org,gmail.com,i-love.sakura.ne.jp,lists.ubuntu.com,namei.org,redhat.com,digikod.net,zeniv.linux.org.uk,google.com,nttdata.co.jp,hallyn.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:paul@paul-moore.com,m:herton@canonical.com,m:kernel-team@meta.com,m:jack@suse.cz,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:penguin-kernel@i-love.sakura.ne.jp,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.875];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 446105EA60F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 5:17=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
[...]
> > 1/7 adds new hooks:
> >   lsm: Add granular mount hooks to replace security_sb_mount
> > 2/7 through 6/7 migrate LSMs from old hooks to new hooks:
> >   apparmor: Remove redundant MS_MGC_MSK stripping in apparmor_sb_mount
> >   apparmor: Convert from sb_mount to granular mount hooks
> >   selinux: Convert from sb_mount to granular mount hooks
> >   landlock: Convert from sb_mount to granular mount hooks
> >   tomoyo: Convert from sb_mount to granular mount hooks
> > 7/7 removes old hooks:
> >   lsm: Remove security_sb_mount and security_move_mount
> >
> > Some ideas to change this:
>
> My thought had been:
>
> * Add the new hooks to security/.
> * add the individual lsm implementations.
> * Now replace the old hooks with the new hooks in fs/namespace.c
> * Delete the old hooks in security/
>
> IOW, why the migration step? It is a full replacement anyway.

I think having a migration like this doesn't really make
review more difficult. But I am OK refactoring the patches
as requested.

Paul, do you have a strong preference either way?

Thanks,
Song

