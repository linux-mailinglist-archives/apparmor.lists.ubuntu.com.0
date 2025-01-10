Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D02D3A0B0B3
	for <lists+apparmor@lfdr.de>; Mon, 13 Jan 2025 09:10:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXFX3-0000K9-Lh; Mon, 13 Jan 2025 08:10:45 +0000
Received: from mgamail.intel.com ([198.175.65.21])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ashutosh.dixit@intel.com>)
 id 1tWIa8-0006QX-Ly
 for apparmor@lists.ubuntu.com; Fri, 10 Jan 2025 17:14:01 +0000
X-CSE-ConnectionGUID: g65EhPSdQuSU4NsjTTY4+w==
X-CSE-MsgGUID: wWG3GM8DTomKuQVfimx2gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36712484"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36712484"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 09:13:58 -0800
X-CSE-ConnectionGUID: d+N1H3FPQryemumCSoERgQ==
X-CSE-MsgGUID: skCK+1HISZSgobnkHZdoJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127073384"
Received: from orsosgc001.jf.intel.com (HELO orsosgc001.intel.com)
 ([10.165.21.142])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 09:13:57 -0800
Date: Fri, 10 Jan 2025 09:13:56 -0800
Message-ID: <8534hqvbfv.wl-ashutosh.dixit@intel.com>
From: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To: Joel Granados <joel.granados@kernel.org>
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.2 (x86_64-redhat-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=198.175.65.21;
 envelope-from=ashutosh.dixit@intel.com; helo=mgamail.intel.com
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
 Kees Cook <kees@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, keyrings@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 io-uring@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-security-module@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-trace-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, openipmi-developer@lists.sourceforge.net,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org, kexec@lists.infradead.org,
 Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 linux-xfs@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, 09 Jan 2025 05:16:39 -0800, Joel Granados wrote:
>
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 2406cda75b7b..5384d1bb4923 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4802,7 +4802,7 @@ int i915_perf_remove_config_ioctl(struct drm_device *dev, void *data,
>	return ret;
>  }
>
> -static struct ctl_table oa_table[] = {
> +static const struct ctl_table oa_table[] = {
>	{
>	 .procname = "perf_stream_paranoid",
>	 .data = &i915_perf_stream_paranoid,
> diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> index 8ec1b84cbb9e..57cf01efc07f 100644
> --- a/drivers/gpu/drm/xe/xe_observation.c
> +++ b/drivers/gpu/drm/xe/xe_observation.c
> @@ -56,7 +56,7 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>	}
>  }
>
> -static struct ctl_table observation_ctl_table[] = {
> +static const struct ctl_table observation_ctl_table[] = {
>	{
>	 .procname = "observation_paranoid",
>	 .data = &xe_observation_paranoid,

For i915 and xe:

Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

