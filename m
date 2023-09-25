Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 081037AE296
	for <lists+apparmor@lfdr.de>; Tue, 26 Sep 2023 01:49:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qkvKX-0005jf-TY; Mon, 25 Sep 2023 23:49:33 +0000
Received: from mgamail.intel.com ([192.55.52.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <vinicius.gomes@intel.com>)
 id 1qkvKT-0005jR-62
 for apparmor@lists.ubuntu.com; Mon, 25 Sep 2023 23:49:29 +0000
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360821170"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="360821170"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 16:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="922200708"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="922200708"
Received: from jbuzinsk-mobl1.amr.corp.intel.com (HELO vcostago-mobl3)
 ([10.212.11.99])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 16:49:26 -0700
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>, John Johansen
 <john.johansen@canonical.com>
In-Reply-To: <CAGudoHFfG7mARwSqcoLNwV81-KX4Bici5FQHjoNG4f9m83oLyg@mail.gmail.com>
References: <CAGudoHFfG7mARwSqcoLNwV81-KX4Bici5FQHjoNG4f9m83oLyg@mail.gmail.com>
Date: Mon, 25 Sep 2023 16:49:25 -0700
Message-ID: <87a5t9bypm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [apparmor] use per-cpu refcounts for apparmor labels?
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Mateusz,

Mateusz Guzik <mjguzik@gmail.com> writes:

> I'm sanity-checking perf in various microbenchmarks and I found
> apparmor to be the main bottleneck in some of them.
>
> For example: will-it-scale open1_processes -t 16, top of the profile:
>   20.17%  [kernel]                   [k] apparmor_file_alloc_security
>   20.08%  [kernel]                   [k] apparmor_file_open
>   20.05%  [kernel]                   [k] apparmor_file_free_security
>   18.39%  [kernel]                   [k] apparmor_current_getsecid_subj
> [snip]
>
> This serializes on refing/unrefing apparmor objs, sounds like a great
> candidate for per-cpu refcounting instead (I'm assuming they are
> expected to be long-lived).
>
> I would hack it up myself, but I failed to find a clear spot to switch
> back from per-cpu to centalized operation and don't want to put
> serious effort into it.
>
> Can you sort this out?

I was looking at this same workload, and proposed a patch[1] some time
ago, see if it helps:

https://lists.ubuntu.com/archives/apparmor/2023-August/012914.html

But my idea was different, in many cases, we are looking at the label
associated with the current task, and there's no need to take the
refcount.

>
> Thanks,
> -- 
> Mateusz Guzik <mjguzik gmail.com>
>

Cheers,
-- 
Vinicius

