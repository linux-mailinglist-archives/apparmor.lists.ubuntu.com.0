Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /HakHVTfLGr4XAQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sat, 13 Jun 2026 06:40:52 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224167DAEF
	for <lists+apparmor@lfdr.de>; Sat, 13 Jun 2026 06:40:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wYGAb-0006GB-Bj; Sat, 13 Jun 2026 04:40:33 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wYGAZ-0006G2-S1
 for apparmor@lists.ubuntu.com; Sat, 13 Jun 2026 04:40:31 +0000
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AA4F43F1E4
 for <apparmor@lists.ubuntu.com>; Sat, 13 Jun 2026 04:40:31 +0000 (UTC)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-36d97a4e08fso1506943a91.0
 for <apparmor@lists.ubuntu.com>; Fri, 12 Jun 2026 21:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781325630; x=1781930430;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7D/U3m+0FGnBHJREEG6qJ7+tzxYRCsOc5bWJ6KTvx3c=;
 b=LIzaXk9mfWHt1xMYqpWVFRTBK4jFvYQ29pMVUDaylPDP+Ab8Df4wx+5gmyPhwmSPoT
 nwsXaxjZd4lhnS9rPr7wBpvdux4OFftaSbyPXwrfyYuSIpJbpO+X6XkItV3IHVzng1iw
 q1/mz3Q7aOtGnlBYE1urmZPF93N6qch1YdF5VTPHmt1GbWdaT3R4ClysV+FeJrVdTNhL
 SQ/3ypkpjgU5tBhftnJlFUxtRjpxzfO+vtY4SCcHvRWznPO4prfXNYEgykawuOHf3aSo
 zYouqNB8MlYAxiRpZe4WXHtjwz/Ae7oF+c8FxzJLnWO9POo6xaoOuM/xD30ebnPmwjto
 Delg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8uQ2O94MtDEr552zcl08lllexsRe8DDdW4N9UStVH0oW7pXfVkjqkKSKqlTuJ51waecW0oi+mUaw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwfSYgbqgOtkP3qreEOGtyHmKTdGrVDd6guVWlTHSBaHvnX9mUj
 ObcPegkqXaXKu2RVn7NPPYKYLTS3ReVhvoWufc8KMEVagJWYHEdkOUWXYXJaTi7j22gJNZj4GM/
 /4sGbyNx8rDEfpCXtCuNUlmofw/X4tpcb8/N3E/20cTqqV8wettHTfTXFzyjbZrfsH2vfduqaUZ
 8U+w==
X-Gm-Gg: Acq92OFCY7XHyoBBFJPKHOcu9592LaF4i0O6N0+lA4bQcEL9ct9cpXELa2lMtJhPbWf
 YDfsAfGomZydSj+WY3+UidbyXuZv3svzrPnzCwXx3elagfZap1+84WAL8Tz/sytYlx+lOliPoFH
 J3s1/BvblUfs/WunWOw6qAFRR+N+D+W4M6A1ys6eYphSWmUQgSadrlYTAAHuvbOCEf6A4yVQ6Zz
 LA1/ht7g75If5La24zTnLKSFVkNHVg0BytLxcevrysLbzc/WiyqstLTyVNZdFEmqHA5ebzV4ZOd
 /zbOzplUnX+egNVoKztActZd4WRsWOxVahMMDPQ/m0FSF6nYcOnA+/lxDvpXhWj8m8he/1njQfk
 qC4RhiznJLDYADC4/eZQttSVqnst8aklWQzYJ
X-Received: by 2002:a17:90b:3a81:b0:36d:633a:e7e5 with SMTP id
 98e67ed59e1d1-37c2bc5d64bmr2065408a91.3.1781325629883; 
 Fri, 12 Jun 2026 21:40:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3a81:b0:36d:633a:e7e5 with SMTP id
 98e67ed59e1d1-37c2bc5d64bmr2065385a91.3.1781325629470; 
 Fri, 12 Jun 2026 21:40:29 -0700 (PDT)
Received: from [192.168.192.71] ([50.47.147.90])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-c8665186828sm3051436a12.21.2026.06.12.21.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 21:40:28 -0700 (PDT)
Message-ID: <847161f0-7c76-4765-bd2d-dbdda242e2a8@canonical.com>
Date: Fri, 12 Jun 2026 21:40:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel J Blueman <daniel@quora.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Thorsten Blum <thorsten.blum@linux.dev>, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org
References: <20260327115833.7572-1-daniel@quora.org>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260327115833.7572-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Fix string overrun due to
 missing termination
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
From: John Johansen via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: John Johansen <john.johansen@canonical.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.89 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:thorsten.blum@linux.dev,m:apparmor@lists.ubuntu.com,m:linux-security-module@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	R_DKIM_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1224167DAEF

On 3/27/26 04:58, Daniel J Blueman wrote:
> When booting Ubuntu 26.04 with Linux 7.0-rc4 on an ARM64 Qualcomm
> Snapdragon X1 we see a string buffer overrun:
> 
> BUG: KASAN: slab-out-of-bounds in aa_dfa_match (security/apparmor/match.c:535)
> Read of size 1 at addr ffff0008901cc000 by task snap-update-ns/2120
> 
> CPU: 5 UID: 60578 PID: 2120 Comm: snap-update-ns Not tainted 7.0.0-rc4+ #22 PREEMPTLAZY
> Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN60WW 09/11/2025
> Call trace:
> show_stack (arch/arm64/kernel/stacktrace.c:501) (C)
> dump_stack_lvl (lib/dump_stack.c:122)
> print_report (mm/kasan/report.c:379 mm/kasan/report.c:482)
> kasan_report (mm/kasan/report.c:597)
> __asan_report_load1_noabort (mm/kasan/report_generic.c:378)
> aa_dfa_match (security/apparmor/match.c:535)
> match_mnt_path_str (security/apparmor/mount.c:244 security/apparmor/mount.c:336)
> match_mnt (security/apparmor/mount.c:371)
> aa_bind_mount (security/apparmor/mount.c:447 (discriminator 4))
> apparmor_sb_mount (security/apparmor/lsm.c:719 (discriminator 1))
> security_sb_mount (security/security.c:1062 (discriminator 31))
> path_mount (fs/namespace.c:4101)
> __arm64_sys_mount (fs/namespace.c:4172 fs/namespace.c:4361 fs/namespace.c:4338 fs/namespace.c:4338)
> invoke_syscall.constprop.0 (arch/arm64/kernel/syscall.c:35 arch/arm64/kernel/syscall.c:49)
> el0_svc_common.constprop.0 (./include/linux/thread_info.h:142 (discriminator 2) arch/arm64/kernel/syscall.c:140 (discriminator 2))
> do_el0_svc (arch/arm64/kernel/syscall.c:152)
> el0_svc (arch/arm64/kernel/entry-common.c:80 arch/arm64/kernel/entry-common.c:725)
> el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:744)
> el0t_64_sync (arch/arm64/kernel/entry.S:596)
> 
> Allocated by task 2120:
> kasan_save_stack (mm/kasan/common.c:58)
> kasan_save_track (./arch/arm64/include/asm/current.h:19 mm/kasan/common.c:70 mm/kasan/common.c:79)
> kasan_save_alloc_info (mm/kasan/generic.c:571)
> __kasan_kmalloc (mm/kasan/common.c:419)
> __kmalloc_noprof (./include/linux/kasan.h:263 mm/slub.c:5260 mm/slub.c:5272)
> aa_get_buffer (security/apparmor/lsm.c:2201)
> aa_bind_mount (security/apparmor/mount.c:442)
> apparmor_sb_mount (security/apparmor/lsm.c:719 (discriminator 1))
> security_sb_mount (security/security.c:1062 (discriminator 31))
> path_mount (fs/namespace.c:4101)
> __arm64_sys_mount (fs/namespace.c:4172 fs/namespace.c:4361 fs/namespace.c:4338 fs/namespace.c:4338)
> invoke_syscall.constprop.0 (arch/arm64/kernel/syscall.c:35 arch/arm64/kernel/syscall.c:49)
> el0_svc_common.constprop.0 (./include/linux/thread_info.h:142 (discriminator 2) arch/arm64/kernel/syscall.c:140 (discriminator 2))
> do_el0_svc (arch/arm64/kernel/syscall.c:152)
> el0_svc (arch/arm64/kernel/entry-common.c:80 arch/arm64/kernel/entry-common.c:725)
> el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:744)
> el0t_64_sync (arch/arm64/kernel/entry.S:596)
> 
> The buggy address belongs to the object at ffff0008901ca000
> which belongs to the cache kmalloc-rnd-06-8k of size 8192
> The buggy address is located 0 bytes to the right of
> allocated 8192-byte region [ffff0008901ca000, ffff0008901cc000)
> 
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x9101c8
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:-1 pincount:0
> flags: 0x8000000000000040(head|zone=2)
> page_type: f5(slab)
> raw: 8000000000000040 ffff000800016c40 fffffdffe2d14e10 ffff000800015c70
> raw: 0000000000000000 0000000800010001 00000000f5000000 0000000000000000
> head: 8000000000000040 ffff000800016c40 fffffdffe2d14e10 ffff000800015c70
> head: 0000000000000000 0000000800010001 00000000f5000000 0000000000000000
> head: 8000000000000003 fffffdffe2407201 fffffdffffffffff 00000000ffffffff
> head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
> ffff0008901cbf00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffff0008901cbf80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> ffff0008901cc000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ^
> ffff0008901cc080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff0008901cc100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> 
> This was introduced by previous incorrect conversion from strcpy(). Fix it
> by adding the missing terminator.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> Fixes: 93d4dbdc8da0 ("apparmor: Replace deprecated strcpy in d_namespace_path")

sorry for the lateness of my reply, my email wasn't working when I pulled this
in for 7.1

just for the record

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/path.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/security/apparmor/path.c b/security/apparmor/path.c
> index 65a0ca5cc1bd..2494e8101538 100644
> --- a/security/apparmor/path.c
> +++ b/security/apparmor/path.c
> @@ -164,14 +164,16 @@ static int d_namespace_path(const struct path *path, char *buf, char **name,
>   	}
>   
>   out:
> -	/* Append "/" to directory paths, except for root "/" which
> -	 * already ends in a slash.
> +	/* Append "/" to directory paths and reterminate string, except for
> +	 * root "/" which already ends in a slash.
>   	 */
>   	if (!error && isdir) {
>   		bool is_root = (*name)[0] == '/' && (*name)[1] == '\0';
>   
> -		if (!is_root)
> +		if (!is_root) {
>   			buf[aa_g_path_max - 2] = '/';
> +			buf[aa_g_path_max - 1] = '\0';
> +		}
>   	}
>   
>   	return error;


