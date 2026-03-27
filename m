Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOLrL+fMxmn5OgUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Mar 2026 19:31:03 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 424803490A6
	for <lists+apparmor@lfdr.de>; Fri, 27 Mar 2026 19:31:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w6BxI-0005Uv-QQ; Fri, 27 Mar 2026 18:30:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1w6BxH-0005Ug-Rq
 for apparmor@lists.ubuntu.com; Fri, 27 Mar 2026 18:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6570444D4
 for <apparmor@lists.ubuntu.com>; Fri, 27 Mar 2026 18:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4A3C2BCB3
 for <apparmor@lists.ubuntu.com>; Fri, 27 Mar 2026 18:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774635800;
 bh=feRd78SnzzN9peQBD3ZQ+Yp9wwvOiZ6LtOzLWt3aD0g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uhN8oGf+58RkHh5b53jcaOqkvMhbnfcWMzBbECYkX5vAr/0z628Z7XbUBFd8q6v46
 puVRjtCobd+Q5hguG8AEK5iaKPIc1/rRifCjfUesMoLqU7tSHMypbjbJjvPqT5g9K+
 cQ903leR0+nvqfaLgDIl+/wZADmsn+8587W41zUf7ah1L8Wm6g3lXPGWeLn2fe2N2b
 lGk8vDTJ4eoF6jhUbW2rMSLLgCrb4Ccu2cbPxkfUlWntwWQXtDPhRMpA8MufwMuLhn
 sftBTL1uDeifotOY9M6vRlTwlZMSSdhLugDM54pv+q8PNqwnTZUkedMhOgcuiLm0v2
 og4X2jWg9EqdA==
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-509217e84a3so19964821cf.3
 for <apparmor@lists.ubuntu.com>; Fri, 27 Mar 2026 11:23:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWHv5YUKzUl+HhOlAwZNbd+2yKEhW+M12m3iqsa7QupUP7TfKEkAGSmUqPiK9uh/xzfa1JJSeZ3Tg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yz4VJ9x9mPe38GA5EL6GF6xXaVi4fYvCnTTSSKoncjH2blXNSU5
 mVKa3L2P2iSilas2rUANftZAfI5b4hLELpO0rLY73Ey2PwgyGgbeNIjgZcZrPAT4UNulRypr0QC
 8AN6Cb7cvDGKBw826byJGMMTFsyD9VHY=
X-Received: by 2002:a05:622a:a10:b0:50b:4d01:fae7 with SMTP id
 d75a77b69052e-50ba37ef2f2mr47635231cf.4.1774635799631; Fri, 27 Mar 2026
 11:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260318184400.3502908-1-song@kernel.org>
 <CAPhsuW5h=-BVp6g2UtHTUO8PQtbiSmqDrn0BT3rbdN4BkhQpeA@mail.gmail.com>
 <CAHC9VhQUU9L9OTtyo+2mdi0P5jCk1RXnJBxT1+YUyywMSfLuPg@mail.gmail.com>
In-Reply-To: <CAHC9VhQUU9L9OTtyo+2mdi0P5jCk1RXnJBxT1+YUyywMSfLuPg@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Fri, 27 Mar 2026 11:23:08 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5VjD60MZ0vRxQwT8+HHy+vmz_HxTvRNOB+3M4FRb3K_w@mail.gmail.com>
X-Gm-Features: AQROBzD7NbhK9Rel07l4LVbNdklRhRELnwIDJSfWFmGCvrH1Z0u1ClJ2IRPv1HY
Message-ID: <CAPhsuW5VjD60MZ0vRxQwT8+HHy+vmz_HxTvRNOB+3M4FRb3K_w@mail.gmail.com>
To: Paul Moore <paul@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.234.252.31; envelope-from=song@kernel.org;
 helo=sea.source.kernel.org
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
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz,
 selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, viro@zeniv.linux.org.uk,
 gnoack@google.com, linux-fsdevel@vger.kernel.org, takedakn@nttdata.co.jp,
 kernel-team@meta.com, serge@hallyn.com
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
	FORGED_RECIPIENTS(0.00)[m:paul@paul-moore.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:penguin-kernel@i-love.sakura.ne.jp,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:kernel-team@meta.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[song@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,vger.kernel.org,gmail.com,i-love.sakura.ne.jp,lists.ubuntu.com,namei.org,redhat.com,digikod.net,zeniv.linux.org.uk,google.com,nttdata.co.jp,meta.com,hallyn.com];
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
	NEURAL_SPAM(0.00)[0.997];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,paul-moore.com:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 424803490A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Thu, Mar 26, 2026 at 8:31=E2=80=AFPM Song Liu <song@kernel.org> wrote:
> >
> > Hi folks, especially SELinux, AppArmor, and LandLock maintainers,
> >
> > Could you please share your comments on this set?
>
> I think we are all aware of this patchset, but most of us are fairly
> busy at the moment.  This patchset is in my queue to review, but it
> isn't something I'm going to be able to review this week.
>
> > If there are no issues with these changes, can we land the set in 7.1
> > kernels?
>
> Given that we are near the end of -rc5, that is highly unlikely.
>
> https://github.com/LinuxSecurityModule/kernel?tab=3Dreadme-ov-file#kernel=
-development-process

Thanks for sharing this information! Looking forward to more detailed
review/feedback.

Song

