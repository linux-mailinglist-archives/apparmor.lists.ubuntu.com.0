Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E4818AAE1B2
	for <lists+apparmor@lfdr.de>; Wed,  7 May 2025 15:58:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCfHz-0006UI-60; Wed, 07 May 2025 13:58:23 +0000
Received: from mgamail.intel.com ([192.198.163.18])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <lkp@intel.com>) id 1uCfHx-0006U5-09
 for apparmor@lists.ubuntu.com; Wed, 07 May 2025 13:58:21 +0000
X-CSE-ConnectionGUID: vC0/9QEQRbGogvvlURTKZA==
X-CSE-MsgGUID: ZkCQh9LmRX6ofa31OkFIoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47613050"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="47613050"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 06:58:18 -0700
X-CSE-ConnectionGUID: vnx8wscpTRCgNzf2C2Pp5w==
X-CSE-MsgGUID: K1Ux9pV0TFuSEc0nzuSVgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="140011265"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 06:58:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uCfHo-0007vN-2T;
 Wed, 07 May 2025 13:58:12 +0000
Date: Wed, 7 May 2025 21:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime =?iso-8859-1?Q?B=E9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
Message-ID: <202505072131.ogtsaLPI-lkp@intel.com>
References: <20250506143254.718647-2-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506143254.718647-2-maxime.belair@canonical.com>
Received-SPF: pass client-ip=192.198.163.18; envelope-from=lkp@intel.com;
 helo=mgamail.intel.com
Subject: Re: [apparmor] [PATCH 1/3] Wire up the lsm_manage_policy syscall
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
Cc: penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com, kees@kernel.org,
 linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 llvm@lists.linux.dev, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, mic@digikod.net,
 takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9c32cda43eb78f78c73aee4aa344b777714e259b]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-B-lair/Wire-up-the-lsm_manage_policy-syscall/20250506-224212
base:   9c32cda43eb78f78c73aee4aa344b777714e259b
patch link:    https://lore.kernel.org/r/20250506143254.718647-2-maxime.belair%40canonical.com
patch subject: [PATCH 1/3] Wire up the lsm_manage_policy syscall
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250507/202505072131.ogtsaLPI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072131.ogtsaLPI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072131.ogtsaLPI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1618:2: warning: syscall lsm_manage_policy not implemented [-W#warnings]
    1618 | #warning syscall lsm_manage_policy not implemented
         |  ^
   1 warning generated.
--
>> <stdin>:1618:2: warning: syscall lsm_manage_policy not implemented [-W#warnings]
    1618 | #warning syscall lsm_manage_policy not implemented
         |  ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

