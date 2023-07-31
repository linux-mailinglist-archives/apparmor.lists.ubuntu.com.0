Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 42186769F97
	for <lists+apparmor@lfdr.de>; Mon, 31 Jul 2023 19:39:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qQWro-00082X-Ad; Mon, 31 Jul 2023 17:39:36 +0000
Received: from [192.55.52.120] (helo=mgamail.intel.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <alison.schofield@intel.com>) id 1qQWI0-0004Vx-Dq
 for apparmor@lists.ubuntu.com; Mon, 31 Jul 2023 17:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690822956; x=1722358956;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jzZeHXRLpqb1X/zrxooFFBTcwn3/wXpUCDYN5d8GPZE=;
 b=ktkFnl3bSBLE4FPU1ad7jKr+Wg2jdszcX10WKOTw3QWwTafret/Rh8wA
 798kP4yO6IXZ+7g/lEk4Nm2w6pa1om2LOB5BUW1M05WYTdrNO/pZV2D02
 nfvdh5B97tY/NOPKao8jNhkdGzrZj+BPnZwX+ICa3aXOm7IFni2htzwf6
 buisNCs7IvbPoOWPaRPA/o7LRLNgnyCSy5cauQWlFn2ssijCMHDyjSh/3
 k1yWSwKYqqRfyppdS2zRoR4eJfMpq/0/+lIPEcEXdaKgny8gYJ0l+BMaW
 bFNixsuhGW5pPXC43Dr6uWDgeH6Ll6ge78ivGtqJrM3Byk0SNMkzYk5/e A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="367976047"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="367976047"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 10:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="728374611"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="728374611"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2)
 ([10.255.229.233])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 10:02:19 -0700
Date: Mon, 31 Jul 2023 10:02:17 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <ZMfpGXM5LlDdrENi@aschofie-mobl2>
References: <cover.1690786466.git.kamrankhadijadj@gmail.com>
 <7fd5ea487559760818af96f7c1f2c25bec515049.1690786467.git.kamrankhadijadj@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fd5ea487559760818af96f7c1f2c25bec515049.1690786467.git.kamrankhadijadj@gmail.com>
X-Mailman-Approved-At: Mon, 31 Jul 2023 17:39:33 +0000
Subject: Re: [apparmor] [PATCH 1/2] lsm: change 'target' parameter to
 'const' in security_capget LSM hook
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
Cc: paul@paul-moore.com, selinux@vger.kernel.org,
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 eparis@parisplace.org, ztarkhani@microsoft.com, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Jul 31, 2023 at 12:07:31PM +0500, Khadija Kamran wrote:
> Three LSMs register the implementations for the "capget" hook: AppArmor,
> SELinux, and the normal capability code. Looking at the function
> implementations we may observe that the first parameter "target" is not
> changing.
> 
> Mark the first argument "target" of LSM hook security_capget(...) as
> "const" since it will not be changing in the LSM hook.


The commit message may be simplified, from this:
[PATCH 1/2] lsm: change 'target' parameter to 'const' in security_capget LSM hook

to something like this:
[PATCH 1/2] lsm: Constify the target parameter in security_capget()

"Constify" is the commonly used language in git logs.
See git log --pretty=oneline --abbrev-commit | grep Constify

Alison

 --snip --

> 

