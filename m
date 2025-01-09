Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6DEA0B0BC
	for <lists+apparmor@lfdr.de>; Mon, 13 Jan 2025 09:11:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXFX3-0000Jh-4y; Mon, 13 Jan 2025 08:10:45 +0000
Received: from mgamail.intel.com ([192.198.163.10])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jani.nikula@intel.com>)
 id 1tVtzF-0007Pk-9J
 for apparmor@lists.ubuntu.com; Thu, 09 Jan 2025 14:58:17 +0000
X-CSE-ConnectionGUID: PxRjMkuJSvytCsHUVm/CGw==
X-CSE-MsgGUID: iCXHwcwuSHWFBSO6fADffw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48110951"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="48110951"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 06:58:14 -0800
X-CSE-ConnectionGUID: aAxGFyBISeOF2fi1TGSFDw==
X-CSE-MsgGUID: hUbAKolZSWC8NTenKubm+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108527826"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 06:58:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joel Granados <joel.granados@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fsc?=
 =?utf-8?Q?huh?=
 <linux@weissschuh.net>, Kees Cook <kees@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
Date: Thu, 09 Jan 2025 16:58:01 +0200
Message-ID: <87frlsjapy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=192.198.163.10;
 envelope-from=jani.nikula@intel.com; helo=mgamail.intel.com
X-Mailman-Approved-At: Mon, 13 Jan 2025 08:10:43 +0000
Subject: Re: [apparmor] [PATCH] treewide: const qualify ctl_tables where
	applicable
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
Cc: linux-aio@kvack.org, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, keyrings@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 io-uring@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 Joel Granados <joel.granados@kernel.org>, codalist@coda.cs.cmu.edu,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-trace-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, openipmi-developer@lists.sourceforge.net,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, 09 Jan 2025, Joel Granados <joel.granados@kernel.org> wrote:
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 2406cda75b7b..5384d1bb4923 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4802,7 +4802,7 @@ int i915_perf_remove_config_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> -static struct ctl_table oa_table[] = {
> +static const struct ctl_table oa_table[] = {
>  	{
>  	 .procname = "perf_stream_paranoid",
>  	 .data = &i915_perf_stream_paranoid,

For i915,

Acked-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel

