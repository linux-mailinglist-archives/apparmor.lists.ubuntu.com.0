Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B7632AEAF0D
	for <lists+apparmor@lfdr.de>; Fri, 27 Jun 2025 08:32:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uV2dK-0003AW-Dl; Fri, 27 Jun 2025 06:32:22 +0000
Received: from [192.198.163.11] (helo=mgamail.intel.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <lkp@intel.com>) id 1uV2dG-0003A9-Iy
 for apparmor@lists.ubuntu.com; Fri, 27 Jun 2025 06:32:18 +0000
X-CSE-ConnectionGUID: NcpHmNfxQpq36yUeaKuXJg==
X-CSE-MsgGUID: OBMinzmgTZG8YH9RJWk5/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63913407"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="63913407"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 23:32:15 -0700
X-CSE-ConnectionGUID: g3a9+yP9Qs66TO486UPSXw==
X-CSE-MsgGUID: 9z7w6EbDQP2ZXL3fpBlpFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152240808"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 26 Jun 2025 23:32:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uV2d6-000Vs0-1N;
 Fri, 27 Jun 2025 06:32:08 +0000
Date: Fri, 27 Jun 2025 14:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime =?iso-8859-1?Q?B=E9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
Message-ID: <202506271432.Hsg0FzKQ-lkp@intel.com>
References: <20250624143211.436045-2-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624143211.436045-2-maxime.belair@canonical.com>
Received-SPF: pass client-ip=192.198.163.11; envelope-from=lkp@intel.com;
 helo=mgamail.intel.com
Subject: Re: [apparmor] [PATCH v3 1/3] Wire up lsm_config_self_policy and
 lsm_config_system_policy syscalls
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
patch link:    https://lore.kernel.org/r/20250624143211.436045-2-maxime.belair%40canonical.com
patch subject: [PATCH v3 1/3] Wire up lsm_config_self_policy and lsm_config_system_policy syscalls
config: riscv-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271432.Hsg0FzKQ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271432.Hsg0FzKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271432.Hsg0FzKQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/compat.h:34,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/bpf.h:20,
                    from include/linux/security.h:35,
                    from security/lsm_syscalls.c:13:
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_lsm_set_self_attr' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:55:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(lsm_set_self_attr, unsigned int, attr, struct lsm_ctx __user *,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:55:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(lsm_set_self_attr, unsigned int, attr, struct lsm_ctx __user *,
    ^~~~~~~~~~~~~~~
>> arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_lsm_config_system_policy' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:128:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(lsm_config_system_policy, u32, lsm_id, u32, op, void __user *,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:128:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(lsm_config_system_policy, u32, lsm_id, u32, op, void __user *,
    ^~~~~~~~~~~~~~~
>> arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_lsm_config_self_policy' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:122:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(lsm_config_self_policy, u32, lsm_id, u32, op, void __user *,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:122:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(lsm_config_self_policy, u32, lsm_id, u32, op, void __user *,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_lsm_list_modules' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:96:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:96:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_lsm_get_self_attr' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:77:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(lsm_get_self_attr, unsigned int, attr, struct lsm_ctx __user *,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   security/lsm_syscalls.c:77:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(lsm_get_self_attr, unsigned int, attr, struct lsm_ctx __user *,
    ^~~~~~~~~~~~~~~


vim +35 arch/riscv/include/asm/syscall_wrapper.h

a9ad73295cc1e3 Sami Tolvanen 2024-03-11  16  
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  17  #define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  18  	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  19  	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  20  
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  21  #define SC_RISCV_REGS_TO_ARGS(x, ...)							\
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  22  	__MAP(x,__SC_ARGS								\
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  23  	      ,,regs->orig_a0,,regs->a1,,regs->a2					\
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  24  	      ,,regs->a3,,regs->a4,,regs->a5,,regs->a6)
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  25  
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  26  #else
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  27  /*
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  28   * Use type aliasing to ensure registers a0-a6 are correctly passed to the syscall
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  29   * implementation when >word-size arguments are used.
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  30   */
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  31  #define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  32  	__diag_push();									\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  33  	__diag_ignore(GCC, 8, "-Wattribute-alias",					\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  34  			"Type aliasing is used to sanitize syscall arguments");		\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11 @35  	static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong, 	\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  36  					ulong)						\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  37  			__attribute__((alias(__stringify(___se_##prefix##name))));	\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  38  	__diag_pop();									\
653650c468be21 Sami Tolvanen 2024-03-26  39  	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
653650c468be21 Sami Tolvanen 2024-03-26  40  			__used;								\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  41  	static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

