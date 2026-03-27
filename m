Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBH7DmnTxWnQCAUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Mar 2026 01:46:33 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC4933D9BA
	for <lists+apparmor@lfdr.de>; Fri, 27 Mar 2026 01:46:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w5vL9-00047x-8Y; Fri, 27 Mar 2026 00:46:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1w5vL8-00047I-8B
 for apparmor@lists.ubuntu.com; Fri, 27 Mar 2026 00:46:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D78CD60054
 for <apparmor@lists.ubuntu.com>; Fri, 27 Mar 2026 00:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3F4C2BC87
 for <apparmor@lists.ubuntu.com>; Fri, 27 Mar 2026 00:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774572061;
 bh=vt7T/qUGOGLlqaNchVHzH7ZNkaAHnV/vULH5YOrsQpM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RwQe+H24wpJs63oazuy6TuUNOuF2BjCXU/yfjRKeh++eEwS0at4Lvb8j79sHrpkpm
 dA6moXoBljhfGWmtVN+lqV8oQ1LEfCVys/pV5Bx5hjE8LBehBDflEkggtG63v1Kwug
 VncZhlxUAwK/3hTzlhWRzpfiLGjD9hGll5xRkrE/lTenAIXxuCHp7ek9OU5Bq8bJ/C
 ciUcTKl9B4NtkXEMEbw7p6fsTmUbY9Pp54U51JPiYJJ4+pL8J9osKnXg1imB8bwrqG
 MxBZFpGvt/u/vysUjaG794KzVBAmazVAXWbuE6t5vL1FZ8/KfRQWoVvondIaaPbn27
 WlPl4szD3hdHA==
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-89a05955720so19118476d6.2
 for <apparmor@lists.ubuntu.com>; Thu, 26 Mar 2026 17:41:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8jD9BVaTTtV5V4dApX4oj5tWP4WgnL4K69aDJO/xG9uSuluIBKC3QTke3byJKI5177dIOTBaPNw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxjCstiM0/Mp6EQA4yFV5xANEe7p6BoT7GJ//N6MtXqcenk4SRG
 8jo1brpvxqdxjHJPyaxWtFVJ8dOc7JzLUNj47aHrlnG+GHHemu5t6iXwS9NbtlqRskvUdhUAYtw
 V5DtO5ftWtJ8KaX+OJVT0uC/027PAnzg=
X-Received: by 2002:ad4:5cc7:0:b0:89c:99f5:52c4 with SMTP id
 6a1803df08f44-89ce8d43382mr7198476d6.15.1774572060621; Thu, 26 Mar 2026
 17:41:00 -0700 (PDT)
MIME-Version: 1.0
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
In-Reply-To: <6609e11e-90aa-4021-974e-e9937688dd49@I-love.SAKURA.ne.jp>
From: Song Liu <song@kernel.org>
Date: Thu, 26 Mar 2026 17:40:49 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5PyqkkAbLr9JZKtJ7F0sys3pENdSOQqG=dggbrEf11iA@mail.gmail.com>
X-Gm-Features: AQROBzDUWLVisdSlnIPADASIVeAPQUaRFecDIf-Shx_lh3e_Wu7aKFzg04hWSF8
Message-ID: <CAPhsuW5PyqkkAbLr9JZKtJ7F0sys3pENdSOQqG=dggbrEf11iA@mail.gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
 Christian Brauner <brauner@kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.105.4.254; envelope-from=song@kernel.org;
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
 Kernel Team <kernel-team@meta.com>, "jack@suse.cz" <jack@suse.cz>,
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
 "gnoack@google.com" <gnoack@google.com>, "mic@digikod.net" <mic@digikod.net>,
 "takedakn@nttdata.co.jp" <takedakn@nttdata.co.jp>,
 "serge@hallyn.com" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:penguin-kernel@i-love.sakura.ne.jp,m:brauner@kernel.org,m:viro@zeniv.linux.org.uk,m:herton@canonical.com,m:kernel-team@meta.com,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:songliubraving@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:linux-fsdevel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,meta.com,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,lists.ubuntu.com,namei.org,redhat.com,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	NEURAL_SPAM(0.00)[0.857];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: DDC4933D9BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Christian and Al,

On Mon, Mar 23, 2026 at 11:12=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
[...]
> diff --git a/fs/namespace.c b/fs/namespace.c
> index ba5baccdde67..621b8205a0af 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -3777,7 +3777,7 @@ static bool mount_too_revealing(const struct super_=
block *sb, int *new_mnt_flags
>   * be added to the namespace tree.
>   */
>  static int do_new_mount_fc(struct fs_context *fc, const struct path *mou=
ntpoint,
> -                          unsigned int mnt_flags)
> +                          unsigned int mnt_flags, void *data, unsigned l=
ong flags)
>  {
>         struct super_block *sb;
>         struct vfsmount *mnt __free(mntput) =3D fc_mount(fc);
> @@ -3786,6 +3786,10 @@ static int do_new_mount_fc(struct fs_context *fc, =
const struct path *mountpoint,
>         if (IS_ERR(mnt))
>                 return PTR_ERR(mnt);
>
> +       error =3D security_mount_new(fc, mountpoint, mnt_flags, flags, da=
ta);
> +       if (error)
> +               return error;
> +
>         sb =3D fc->root->d_sb;
>         error =3D security_sb_kern_mount(sb);
>         if (unlikely(error))
> @@ -3857,9 +3861,7 @@ static int do_new_mount(const struct path *path, co=
nst char *fstype,
>                 err =3D -EPERM;
>
>         if (!err)
> -               err =3D security_mount_new(fc, path, mnt_flags, flags, da=
ta);
> -       if (!err)
> -               err =3D do_new_mount_fc(fc, path, mnt_flags);
> +               err =3D do_new_mount_fc(fc, path, mnt_flags, data, flags)=
;
>
>         put_fs_context(fc);
>         return err;

Could you please comment on Tetsuo's proposal here? The core
change (moving security_mount_new after fc_mount) makes sense
to me. However, it seems to require a lot of code to support this
change.

Given the current patchset addresses TOCTOU issues of bind
mount, etc. Maybe we can land this set and address TOCTOU
issue with new mount in follow-up patches?

Thanks,
Song

