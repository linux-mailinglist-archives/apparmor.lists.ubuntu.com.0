Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAwZGZ8zAmocpAEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 21:53:03 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D64515488
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 21:53:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wMWgL-00039V-GR; Mon, 11 May 2026 19:52:49 +0000
Received: from mail-qv1-f54.google.com ([209.85.219.54])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1wMWgK-00038C-Dj
 for apparmor@lists.ubuntu.com; Mon, 11 May 2026 19:52:48 +0000
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-8bc3ef10cc4so53240216d6.1
 for <apparmor@lists.ubuntu.com>; Mon, 11 May 2026 12:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1778529167; x=1779133967; darn=lists.ubuntu.com; 
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=LL+UPYnZCOjrePrtqK6xOAZ5G7o1QmvEfzGseYDEIaM=;
 b=gixuTaz3iurntlTxgo3JlmuWRbW8xu9ObkR+zu+j6u3+hZm5smquQbkFJSUs9TPtfF
 WF3sNL+7rAlQNcBxNs8gv6QyN+lymb/qrqB+SrX524/4EyGT97BAAMsvfScHyLcC8GXc
 qEGQUy4bxJcEtxqQ61MXozJNdpx6Set/VVJxDqptDZw0BKEA6denzA1mc5KP7+hv4xSw
 W6rRfxB4k9WuV8rSoWrMnllEa/3/H8pF3zzuJfQM3VC5LBEi7m+ULhXcBeCeE0K+1KAQ
 D62NtQtvmE25I4i9QGz97G6t247cbqQyKDGvk9HcOpmhV4UzvrhVhMkm9kOFyYpeyAsa
 87Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778529167; x=1779133967;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LL+UPYnZCOjrePrtqK6xOAZ5G7o1QmvEfzGseYDEIaM=;
 b=ZdwUStrSnAcOPP+wJHe3Hny4P37GKmlAPtjxSUicdkaEjnHmdDZ43awBxcsXXWJuoh
 L8ONo7y0TeiEawX1ZBRinFmC9nuzP+gZGrfcYvdhVPH4p7sx7IpopsG0cuSLOpsNrPPA
 Q8ZpU0y2IRFc8xuYVrwF5pv9NyYpFDcZezfv7T0z7Nr2pg7ER9FO5MNHOYEJmyHme+9I
 af3SVtJ+LHBWEvA6RRnGjT8iz3w+51YO+2FIXYlp9FYWu/6ElLRi2fBDEN32ShePo4Ze
 4G1WvJIRrQfnuSsZDXbRi1XXo0CS+e+xOijFMccab+d4GoVivq1C9fa2RToD8qRwfD8u
 PBag==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XlyyWZn8c45bhf75jx2b6qJ6Z68gzcJUvnP3fUawatEQf7Nrs1+vvKFYl2s5vX4WDmwhuxnA3+A==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzVfoDGfaCdF2i+Sd8bg6TLTDwgKbeml7wnOSkEwHF+e2FHI9ij
 k3xSDpW2VSDeqBVNnKsKUmHRHSJS0q42RLcBsCCO0Eu5+H5TT6Bid1ttIU1NGRNsiw==
X-Gm-Gg: Acq92OEBgnL7gAV/OVdXhj8NE7WKsymHCnKfyvqT1XNQt/1pdExP9nAc1JPoXv2S/ZE
 aHazsy+2CwoHvgKMob4RM6WhnldMLC3a6MOQ2G+raDCKRy/S2nykq2GzHYEUJdmNSIUvj4cw7C4
 1AhTzPvbvy1GR2mkmRPlwDoHyVCktI9uJ3p+S8FCyG30gTe8Em0tyD0xxqvyta29SKv6XtDIezJ
 jr6qTA8HJPBxLngspzVFfno4n7oJVZmfcm4T9wPmIhy1HTMbBipeNlds61SVtbn59jwgKVJjGUn
 VeZZQwGpGKALtlemrPJs9eVnWB3UPb7DCTs7GkICO9U4e+YS5br2ez28cXsmMNgRqU/yYIKdhvW
 J90xe1h2Xuyxabr8eZEu7fSFMxEkvYw31JpJMsNksTkERWS0Z7Ri6zOsx0zIIUsB8H4ckCqvEbO
 9oPb2+5m3YDEXmWfC1tV1gz8l+57M7makXzJfZw2FEgL2PAIRDyGeHOvkz9yJHiLGOOXqToPKGn
 iXL12U=
X-Received: by 2002:a05:6214:2301:b0:8b5:e126:e77d with SMTP id
 6a1803df08f44-8c1a2531e7emr167597196d6.8.1778529166775; 
 Mon, 11 May 2026 12:52:46 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net.
 [71.126.255.178]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b53d450dcbsm322404436d6.45.2026.05.11.12.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 12:52:45 -0700 (PDT)
Date: Mon, 11 May 2026 15:52:44 -0400
Message-ID: <ce407923a8717656e21a9f59b45043d4@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260511_1539/pstg-lib:20260511_1103/pstg-pwork:20260511_1539
From: Paul Moore <paul@paul-moore.com>
To: john.johansen@canonical.com, georgia.garcia@canonical.com,
 Song Liu <song@kernel.org>, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com
References: <20260509015208.3853132-4-song@kernel.org>
In-Reply-To: <20260509015208.3853132-4-song@kernel.org>
Received-SPF: pass client-ip=209.85.219.54; envelope-from=paul@paul-moore.com;
 helo=mail-qv1-f54.google.com
Subject: Re: [apparmor] [PATCH v3 3/7] apparmor: Convert from sb_mount to
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
 penguin-kernel@I-love.SAKURA.ne.jp, stephen.smalley.work@gmail.com,
 kernel-team@meta.com, jmorris@namei.org, omosnace@redhat.com,
 Song Liu <song@kernel.org>, viro@zeniv.linux.org.uk, gnoack@google.com,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 52D64515488
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[paul-moore.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:georgia.garcia@canonical.com,m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:brauner@kernel.org,m:herton@canonical.com,m:jack@suse.cz,m:penguin-kernel@I-love.SAKURA.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[kernel.org,canonical.com,suse.cz,I-love.SAKURA.ne.jp,gmail.com,meta.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	NEURAL_HAM(-0.00)[-0.815];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,paul-moore.com:url,paul-moore.com:mid]
X-Rspamd-Action: no action

On May  8, 2026 Song Liu <song@kernel.org> wrote:
> 
> Replace AppArmor's monolithic apparmor_sb_mount() with granular
> mount hooks.
> 
> Key changes:
> - mount_bind: uses the pre-resolved struct path from VFS instead of
>   re-resolving dev_name via kern_path(), eliminating a TOCTOU
>   vulnerability. aa_bind_mount() now takes a struct path instead of
>   a string for the source.
> - mount_new, mount_remount: receive the original mount(2) flags and
>   data parameters for policy matching via match_mnt_flags() and
>   AA_MNT_CONT_MATCH data matching.
> - mount_reconfigure: handles MS_REMOUNT|MS_BIND (mount attribute
>   reconfiguration) which was previously handled as a remount.
> - mount_move: reuses apparmor_move_mount() which already handles
>   pre-resolved paths.
> - mount_change_type: propagation type changes.
> 
> aa_move_mount_old() is removed since move mounts now go through
> security_mount_move() with pre-resolved struct path pointers for
> both the old mount(2) and new move_mount(2) APIs.
> 
> Code generated with the assistance of Claude, reviewed by human.
> 
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  security/apparmor/include/mount.h |  5 +-
>  security/apparmor/lsm.c           | 99 ++++++++++++++++++++++++-------
>  security/apparmor/mount.c         | 37 ++----------
>  3 files changed, 83 insertions(+), 58 deletions(-)

John, Georgia, are you guys okay with this patch?

--
paul-moore.com

