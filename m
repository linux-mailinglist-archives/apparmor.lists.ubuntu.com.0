Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPmlJKCbu2lhlwIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 07:45:52 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 456732C6E6A
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 07:45:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w378Y-0004bb-2w; Thu, 19 Mar 2026 06:45:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1w378W-0004bO-TU
 for apparmor@lists.ubuntu.com; Thu, 19 Mar 2026 06:45:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 955B843342;
 Thu, 19 Mar 2026 06:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095C3C19425;
 Thu, 19 Mar 2026 06:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1773902414;
 bh=X9L49s7yEBoJxFTNA1J/pynK8VJPzrAxAQkztnEd9no=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qE4xaQgEoQSrXGqL4bSi0CCuq6Dl27pCxcKN6vHpsK9qKeE15yQinCUUb7n87/7r1
 ncyzfjkxZdQqGcBDvgphlfIzVAuIhWoG1+yETlTu0yGSX19vJpgWMk/fuUo81fBKjW
 RVg+NLPaum5bk0Jwy4nHxD2LdO5znV+AGeGe2umg=
Date: Thu, 19 Mar 2026 07:40:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel J Blueman <daniel@quora.org>
Message-ID: <2026031904-default-staining-0240@gregkh>
References: <20260319062433.17648-1-daniel@quora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319062433.17648-1-daniel@quora.org>
Received-SPF: pass client-ip=172.234.252.31;
 envelope-from=gregkh@linuxfoundation.org; helo=sea.source.kernel.org
Subject: Re: [apparmor] [PATCH] apparmor: Fix string overrun due to missing
	termination
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
Cc: Paul Moore <paul@paul-moore.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Thorsten Blum <thorsten.blum@linux.dev>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [4.69 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:thorsten.blum@linux.dev,m:serge@hallyn.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.124];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,quora.org:email]
X-Rspamd-Queue-Id: 456732C6E6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 02:24:32PM +0800, Daniel J Blueman wrote:
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
> >ffff0008901cc000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ^
> ffff0008901cc080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff0008901cc100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> 
> This was introduced by previous incorrect conversion from strcpy(). Fix it
> by adding the missing terminator.
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> Fixes: 93d4dbdc8da0 ("apparmor: Replace deprecated strcpy in d_namespace_path")
> ---
>  security/apparmor/path.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/security/apparmor/path.c b/security/apparmor/path.c
> index 65a0ca5cc1bd..2494e8101538 100644
> --- a/security/apparmor/path.c
> +++ b/security/apparmor/path.c
> @@ -164,14 +164,16 @@ static int d_namespace_path(const struct path *path, char *buf, char **name,
>  	}
>  
>  out:
> -	/* Append "/" to directory paths, except for root "/" which
> -	 * already ends in a slash.
> +	/* Append "/" to directory paths and reterminate string, except for
> +	 * root "/" which already ends in a slash.
>  	 */
>  	if (!error && isdir) {
>  		bool is_root = (*name)[0] == '/' && (*name)[1] == '\0';
>  
> -		if (!is_root)
> +		if (!is_root) {
>  			buf[aa_g_path_max - 2] = '/';
> +			buf[aa_g_path_max - 1] = '\0';
> +		}
>  	}
>  
>  	return error;
> -- 
> 2.53.0
> 
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

