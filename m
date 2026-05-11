Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK/8CZ8zAmocpAEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 21:53:03 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 19628515480
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 21:53:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wMWgU-0003Ey-Tc; Mon, 11 May 2026 19:52:58 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1wMWgT-0003Co-6f
 for apparmor@lists.ubuntu.com; Mon, 11 May 2026 19:52:57 +0000
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-8ef45a6d9dfso514964985a.0
 for <apparmor@lists.ubuntu.com>; Mon, 11 May 2026 12:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1778529176; x=1779133976; darn=lists.ubuntu.com; 
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=PxQM3MCta0Hfqwc0x9Ru5t7hQnbf8j++I/Uj2TAvc2Y=;
 b=SrEIYdPfYUB6sr2dva7s7+F2EW0HUuWF3AKMH57n7+grUNXz0jPI4xYtefzWMtxl7o
 XCzZ7+AWt6NpZgRhJ+CO1mENqOuYq48+D4/xJQboQ1ofDMHyKkPjizrMqJfGpIex8q/R
 YLvPflRx3Omrev4Ed20xXKf74MdlsRmxYwQVC8svgQzalFm8cJgWzWmTFtWpuTG3XxcD
 N4HsoPlpJdaNFrVwsydRrao7+nG73wXvU23InRznDLOi93TLyUBkpW2haExzdFvmHV6x
 ik+0QCv16sfVEaDvh330WYOP3vHPJdhbqNXP9ilg94PgWYvoadNlAXTGSUtP6Zdzlhi5
 9rkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778529176; x=1779133976;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PxQM3MCta0Hfqwc0x9Ru5t7hQnbf8j++I/Uj2TAvc2Y=;
 b=pU/E2TTql2ClITqi7CyeHgKMQoYmsc3Lppe96l/5XmsEXQZIY1M18wP4dWT+kKXYYJ
 IAxyHR4pZXrBFcL0M32GyTijJEHs63EkWEL6vMESa7/mZmNPoaQqvfKUlGkmiYBtjBiJ
 FSMBPNJrCbX4K60Ul/ycXPL6F24MvzCJBgs212OCuoFZZqA9MtvE+nqFx2Tkarl6RC/q
 XGl2CxJxfW1PXWCauQh9+b94iW9otbcn5eONGwMnGeqeAwxB3T7QgzU7VufneVGwLltr
 FuZCWXw3DLkgxq8UYRKwxCsCOoYO+BGKQRnZQqGyaxUgMdUHCIehLz+KEbRqph5cF9pV
 hM2g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+TlCqfKM/wSl9FkEtGZcTR4nm0zyI/FqjN+pcZNV6LFZfkeucXOoyKiNaaYp/bU5VDtJfTTLi6wQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxFgwSnLyYrCJnqyBjBAe75hJDahdEteCPhpNhNvZ0dV0oOsBmx
 h3LkeoocBmhmfqSl4Y+Z4zqvL1QahreAm6d5tz2ybYLRwDsho14kMRd6mkmag9xuFg==
X-Gm-Gg: Acq92OH5kyDtRVeIGE/J6rADzGPzv4TNcTIrTlSFskPCKwtLa6Q8d6AbqCX1tc1qJOe
 EW4mFmDF23RFxBkB63Bswqyv1sxe4ELjGaBRY/QulEFdDFUFEzUzM8DLZmfVG+mzunB17Ji4+aT
 qIYbcuABquQWgoBmnVSWzib3inqoHH21rKyn0jr1fupkvcfC0K7dk+KfMWGX14AqgEZtX7l3VYE
 GqHZICZMTof6YqIWUTNlodICYLHGdtJDNUNZbF47UunAA/TyucbH2KxrOBOqo/a3u/HmfjdTifE
 lstQ14LEJlk1ik15WqI98bPWdIbS0xwlwPh5CazsGrkzKUB7PffIexRXkZPBWos1oFrgMWgswfK
 pOmKhe6QHLAp/l3ta7eCUES6GZunHE3QVbaONaIBTx/0ccwYCNmGdeIWd/ihD9T0s1YxzvXSytX
 Kaf3QiOnZ0Wqyl0DkOHKfzjBfeLPi6zvwa/Q+A6JDgFXAFHQWqX1IsfK+gB+RQkGhJivrC
X-Received: by 2002:a05:620a:4451:b0:8ee:a1d:baf1 with SMTP id
 af79cd13be357-904d68df87amr3599789485a.42.1778529175906; 
 Mon, 11 May 2026 12:52:55 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net.
 [71.126.255.178]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-907b9772b87sm1103258185a.5.2026.05.11.12.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 12:52:51 -0700 (PDT)
Date: Mon, 11 May 2026 15:52:51 -0400
Message-ID: <63277ce0e3f65eceb6da88d7cfec4d64@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260511_1539/pstg-lib:20260511_1103/pstg-pwork:20260511_1539
From: Paul Moore <paul@paul-moore.com>
To: penguin-kernel@I-love.SAKURA.ne.jp, Song Liu <song@kernel.org>,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com
References: <20260509015208.3853132-7-song@kernel.org>
In-Reply-To: <20260509015208.3853132-7-song@kernel.org>
Received-SPF: pass client-ip=209.85.222.176; envelope-from=paul@paul-moore.com;
 helo=mail-qk1-f176.google.com
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
 stephen.smalley.work@gmail.com, kernel-team@meta.com, jmorris@namei.org,
 omosnace@redhat.com, Song Liu <song@kernel.org>, viro@zeniv.linux.org.uk,
 gnoack@google.com, mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 19628515480
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
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:penguin-kernel@I-love.SAKURA.ne.jp,m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,gmail.com,meta.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	NEURAL_HAM(-0.00)[-0.861];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,paul-moore.com:url,paul-moore.com:mid]
X-Rspamd-Action: no action

On May  8, 2026 Song Liu <song@kernel.org> wrote:
> 
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
> ---
>  security/tomoyo/common.h |  2 +-
>  security/tomoyo/mount.c  | 31 +++++++++++++-------
>  security/tomoyo/tomoyo.c | 63 ++++++++++++++++++++++++++++++----------
>  3 files changed, 70 insertions(+), 26 deletions(-)

Tetsuo, I know you had several comments on an earlier revision.  Can you
either ACK this or let Song know what changes you require?

--
paul-moore.com

