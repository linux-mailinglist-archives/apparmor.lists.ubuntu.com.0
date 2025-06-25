Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C8508AE73E9
	for <lists+apparmor@lfdr.de>; Wed, 25 Jun 2025 02:42:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uUEDg-0006ap-CK; Wed, 25 Jun 2025 00:42:32 +0000
Received: from mgamail.intel.com ([198.175.65.10])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <lkp@intel.com>) id 1uUEDf-0006aT-0n
 for apparmor@lists.ubuntu.com; Wed, 25 Jun 2025 00:42:31 +0000
X-CSE-ConnectionGUID: n0sROSCVT5u3tc1C4Ved2w==
X-CSE-MsgGUID: EMPjPkMbRU+/WnySzH0qQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70497667"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="70497667"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 17:42:28 -0700
X-CSE-ConnectionGUID: D6eAnGzDS2CVyTA3FvngIg==
X-CSE-MsgGUID: b/dXdKFATX2y6HDy5S3wfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="183103928"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 24 Jun 2025 17:42:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uUEDV-000Sd4-1v;
 Wed, 25 Jun 2025 00:42:21 +0000
Date: Wed, 25 Jun 2025 08:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime =?iso-8859-1?Q?B=E9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
Message-ID: <202506250843.UnXrlnza-lkp@intel.com>
References: <20250624143211.436045-3-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624143211.436045-3-maxime.belair@canonical.com>
Received-SPF: pass client-ip=198.175.65.10; envelope-from=lkp@intel.com;
 helo=mgamail.intel.com
Subject: Re: [apparmor] [PATCH v3 2/3] lsm: introduce
	security_lsm_config_*_policy hooks
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
Cc: paul@paul-moore.com, song@kernel.org, kees@kernel.org,
 linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, rdunlap@infraread.org, oe-kbuild-all@lists.linux.dev,
 mic@digikod.net, takedakn@nttdata.co.jp, linux-kernel@vger.kernel.org,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9c32cda43eb78f78c73aee4aa344b777714e259b]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-B-lair/Wire-up-lsm_config_self_policy-and-lsm_config_system_policy-syscalls/20250624-225008
base:   9c32cda43eb78f78c73aee4aa344b777714e259b
patch link:    https://lore.kernel.org/r/20250624143211.436045-3-maxime.belair%40canonical.com
patch subject: [PATCH v3 2/3] lsm: introduce security_lsm_config_*_policy hooks
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250625/202506250843.UnXrlnza-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250843.UnXrlnza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506250843.UnXrlnza-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from init/main.c:21:
>> include/linux/security.h:1618:12: warning: 'security_lsm_config_system_policy' defined but not used [-Wunused-function]
    1618 | static int security_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/security.h:1611:12: warning: 'security_lsm_config_self_policy' defined but not used [-Wunused-function]
    1611 | static int security_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/security_lsm_config_system_policy +1618 include/linux/security.h

  1617	
> 1618	static int security_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
  1619						     size_t size, u32 flags)
  1620	{
  1621	
  1622		return -EOPNOTSUPP;
  1623	}
  1624	#endif	/* CONFIG_SECURITY */
  1625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

