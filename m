Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 36052AE13D4
	for <lists+apparmor@lfdr.de>; Fri, 20 Jun 2025 08:30:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uSVFz-0000kU-NI; Fri, 20 Jun 2025 06:29:47 +0000
Received: from mgamail.intel.com ([198.175.65.18])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <lkp@intel.com>) id 1uSVFy-0000ju-2m
 for apparmor@lists.ubuntu.com; Fri, 20 Jun 2025 06:29:46 +0000
X-CSE-ConnectionGUID: XBurI3ipSNWYQkjUykZ2dg==
X-CSE-MsgGUID: 12BQYdwBS+GNp9jQGwylTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52799562"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="52799562"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:29:43 -0700
X-CSE-ConnectionGUID: HyJO1NXySR6iHuubhhWGag==
X-CSE-MsgGUID: 00rE7B2WR9WdVeFR74EtcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="151370534"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 19 Jun 2025 23:29:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uSVFn-000LQy-1v;
 Fri, 20 Jun 2025 06:29:35 +0000
Date: Fri, 20 Jun 2025 14:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime =?iso-8859-1?Q?B=E9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
Message-ID: <202506201415.KiEs36AG-lkp@intel.com>
References: <20250619181600.478038-3-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619181600.478038-3-maxime.belair@canonical.com>
Received-SPF: pass client-ip=198.175.65.18; envelope-from=lkp@intel.com;
 helo=mgamail.intel.com
Subject: Re: [apparmor] [PATCH v2 2/3] lsm: introduce
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
Cc: penguin-kernel@i-love.sakura.ne.jp, paul@paul-moore.com, song@kernel.org,
 kees@kernel.org, linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 llvm@lists.linux.dev, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, mic@digikod.net,
 takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9c32cda43eb78f78c73aee4aa344b777714e259b]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-B-lair/Wire-up-lsm_config_self_policy-and-lsm_config_system_policy-syscalls/20250620-022714
base:   9c32cda43eb78f78c73aee4aa344b777714e259b
patch link:    https://lore.kernel.org/r/20250619181600.478038-3-maxime.belair%40canonical.com
patch subject: [PATCH v2 2/3] lsm: introduce security_lsm_config_*_policy hooks
config: x86_64-buildonly-randconfig-003-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201415.KiEs36AG-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201415.KiEs36AG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201415.KiEs36AG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:52:
>> include/linux/security.h:1614:2: error: expected function body after function declarator
    1614 |         return -EOPNOTSUPP;
         |         ^
>> include/linux/security.h:1615:1: error: extraneous closing brace ('}')
    1615 | }
         | ^
   include/linux/security.h:1620:2: error: expected function body after function declarator
    1620 |         return -EOPNOTSUPP;
         |         ^
   include/linux/security.h:1621:1: error: extraneous closing brace ('}')
    1621 | }
         | ^
   4 errors generated.
--
   In file included from kernel/sysctl.c:29:
>> include/linux/security.h:1614:2: error: expected function body after function declarator
    1614 |         return -EOPNOTSUPP;
         |         ^
>> include/linux/security.h:1615:1: error: extraneous closing brace ('}')
    1615 | }
         | ^
   include/linux/security.h:1620:2: error: expected function body after function declarator
    1620 |         return -EOPNOTSUPP;
         |         ^
   include/linux/security.h:1621:1: error: extraneous closing brace ('}')
    1621 | }
         | ^
   In file included from kernel/sysctl.c:46:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:13:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:803:46: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     803 |         if (U32_MAX >= SIZE_MAX / sizeof(*p) && len > SIZE_MAX / sizeof(*p))
         |                                                 ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.
--
   In file included from kernel/signal.c:30:
>> include/linux/security.h:1614:2: error: expected function body after function declarator
    1614 |         return -EOPNOTSUPP;
         |         ^
>> include/linux/security.h:1615:1: error: extraneous closing brace ('}')
    1615 | }
         | ^
   include/linux/security.h:1620:2: error: expected function body after function declarator
    1620 |         return -EOPNOTSUPP;
         |         ^
   include/linux/security.h:1621:1: error: extraneous closing brace ('}')
    1621 | }
         | ^
   kernel/signal.c:142:37: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     142 |         case 4: ready  = signal->sig[3] &~ blocked->sig[3];
         |                                            ^            ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   kernel/signal.c:142:19: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     142 |         case 4: ready  = signal->sig[3] &~ blocked->sig[3];
         |                          ^           ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   kernel/signal.c:143:30: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     143 |                 ready |= signal->sig[2] &~ blocked->sig[2];
         |                                            ^            ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   kernel/signal.c:143:12: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     143 |                 ready |= signal->sig[2] &~ blocked->sig[2];
         |                          ^           ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   kernel/signal.c:144:30: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     144 |                 ready |= signal->sig[1] &~ blocked->sig[1];
         |                                            ^            ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   kernel/signal.c:144:12: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     144 |                 ready |= signal->sig[1] &~ blocked->sig[1];
         |                          ^           ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   kernel/signal.c:148:37: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     148 |         case 2: ready  = signal->sig[1] &~ blocked->sig[1];
         |                                            ^            ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   kernel/signal.c:148:19: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     148 |         case 2: ready  = signal->sig[1] &~ blocked->sig[1];
         |                          ^           ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   8 warnings and 4 errors generated.
--
   In file included from kernel/dma/swiotlb.c:53:
   In file included from include/trace/events/swiotlb.h:41:
   In file included from include/trace/define_trace.h:119:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:62:
>> include/linux/security.h:1614:2: error: expected function body after function declarator
    1614 |         return -EOPNOTSUPP;
         |         ^
>> include/linux/security.h:1615:1: error: extraneous closing brace ('}')
    1615 | }
         | ^
   include/linux/security.h:1620:2: error: expected function body after function declarator
    1620 |         return -EOPNOTSUPP;
         |         ^
   include/linux/security.h:1621:1: error: extraneous closing brace ('}')
    1621 | }
         | ^
   kernel/dma/swiotlb.c:639:20: warning: shift count >= width of type [-Wshift-count-overflow]
     639 |                     phys_limit < DMA_BIT_MASK(64) &&
         |                                  ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 4 errors generated.
--
   In file included from kernel/events/core.c:34:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:62:
>> include/linux/security.h:1614:2: error: expected function body after function declarator
    1614 |         return -EOPNOTSUPP;
         |         ^
>> include/linux/security.h:1615:1: error: extraneous closing brace ('}')
    1615 | }
         | ^
   include/linux/security.h:1620:2: error: expected function body after function declarator
    1620 |         return -EOPNOTSUPP;
         |         ^
   include/linux/security.h:1621:1: error: extraneous closing brace ('}')
    1621 | }
         | ^
   In file included from kernel/events/core.c:43:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:135:21: note: expanded from macro '_calc_vm_trans'
     135 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 4 errors generated.


vim +1614 include/linux/security.h

  1610	
  1611	static int security_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
  1612						   size_t size, u32 flags)
  1613	
> 1614		return -EOPNOTSUPP;
> 1615	}
  1616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

