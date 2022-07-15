Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AAB575BCD
	for <lists+apparmor@lfdr.de>; Fri, 15 Jul 2022 08:50:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oCF9P-0007w0-Fc; Fri, 15 Jul 2022 06:50:11 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <lkp@intel.com>) id 1oCF9M-0007uh-WE
 for apparmor@lists.ubuntu.com; Fri, 15 Jul 2022 06:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657867809; x=1689403809;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=33ZdI80MJCy7N9zKpMRHryy7Es8BAke9kkY6oGAN+ro=;
 b=TQw86KJt+x8J8x7b2KAf0l27bWDwBZdhx7zYipazMEc2w1CSAAIJ2tSJ
 s28wdJcdFGekt9+vGudxCxq99xur/dQMZkFYmMXLc13uBwe9L4N768twa
 bfa9B1RwcZxxKQ3wbfeJEzUqA4qZ8dRqiOcv5C0ngkl/JqQBJoYEZhpjF
 zViAAQrl0n8wH/rSCFHvsYaTlyoKzwkVfYqRrJACGtPYay173aAiGdn+N
 9uBJjaAjflQHK6Dh5wOVuvwpwAuge4UdvHYYHG6iqVux8VH/LD2O/xEWl
 oE/vHchKJc4yJwLDQC/s5h4zNembI14yOifXzL5zYAY+f7h80/YE6Kn1I Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311379286"
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; d="scan'208";a="311379286"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 23:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,273,1650956400"; d="scan'208";a="923391190"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2022 23:50:04 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oCF9I-0001cL-2s;
 Fri, 15 Jul 2022 06:50:04 +0000
Date: Fri, 15 Jul 2022 14:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <62d10e04.xFaeAbIP2Lzid8n4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: [apparmor] [linux-next:master] BUILD REGRESSION
 37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
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
Cc: linux-fsdevel@vger.kernel.org, linux-pci@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-wireless@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9  Add linux-next specific files for 20220714

Error/Warning reports:

https://lore.kernel.org/linux-mm/202207142026.qqAoch7S-lkp@intel.com
https://lore.kernel.org/llvm/202207150057.s8huMpLd-lkp@intel.com
https://lore.kernel.org/llvm/202207150400.NMBYJFkA-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

/opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: pci-epf-vntb.c:(.text+0x213a): undefined reference to `ntb_link_event'
aarch64-linux-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-ld: Unexpected run-time procedure linkages detected!
drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is not a compile-time constant
drivers/net/wireless/mac80211_hwsim.c:1431:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/pci/endpoint/functions/pci-epf-vntb.c:1247: undefined reference to `ntb_register_device'
drivers/pci/endpoint/functions/pci-epf-vntb.c:174: undefined reference to `ntb_link_event'
drivers/pci/endpoint/functions/pci-epf-vntb.c:262: undefined reference to `ntb_db_event'
drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous prototype for 'pci_read' [-Wmissing-prototypes]
drivers/pci/endpoint/functions/pci-epf-vntb.c:984:5: warning: no previous prototype for 'pci_write' [-Wmissing-prototypes]
drivers/scsi/qla2xxx/qla_init.c:171:10: warning: variable 'bail' set but not used [-Wunused-but-set-variable]
drivers/vfio/vfio_iommu_type1.c:2141:35: warning: cast to smaller integer type 'enum iommu_cap' from 'void *' [-Wvoid-pointer-to-enum-cast]
security/apparmor/policy_ns.c:83:20: warning: no previous prototype for 'alloc_unconfined' [-Wmissing-prototypes]
security/apparmor/policy_ns.c:83:20: warning: no previous prototype for function 'alloc_unconfined' [-Wmissing-prototypes]

Unverified Error/Warning (likely false positive, please contact us if interested):

arch/x86/kernel/cpu/rdrand.c:36 x86_init_rdrand() error: uninitialized symbol 'prev'.
fs/kernel_read_file.c:61 kernel_read_file() warn: impossible condition '(i_size > (((~0) >> 1))) => (s64min-s64max > s64max)'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- arc-allyesconfig
|   |-- drivers-net-wireless-mac80211_hwsim.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- arm64-randconfig-c023-20220715
|   |-- aarch64-linux-ld:Unexpected-GOT-PLT-entries-detected
|   |-- aarch64-linux-ld:Unexpected-run-time-procedure-linkages-detected
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:undefined-reference-to-ntb_db_event
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:undefined-reference-to-ntb_link_event
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:undefined-reference-to-ntb_register_device
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- i386-allyesconfig
|   |-- drivers-net-wireless-mac80211_hwsim.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- i386-randconfig-a001-20220124
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- i386-randconfig-c001
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- i386-randconfig-m021
|   `-- arch-x86-kernel-cpu-rdrand.c-x86_init_rdrand()-error:uninitialized-symbol-prev-.
|-- m68k-allmodconfig
|   |-- drivers-net-wireless-mac80211_hwsim.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- m68k-allyesconfig
|   |-- drivers-net-wireless-mac80211_hwsim.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- mips-allyesconfig
|   |-- drivers-net-wireless-mac80211_hwsim.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- powerpc-allmodconfig
|   |-- drivers-net-wireless-mac80211_hwsim.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- sh-allmodconfig
|   |-- drivers-net-wireless-mac80211_hwsim.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- x86_64-allyesconfig
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
`-- x86_64-randconfig-m001
clang_recent_errors
|-- arm-randconfig-r023-20220714
|   `-- drivers-clk-qcom-gpucc-sm8350.c:error:initializer-element-is-not-a-compile-time-constant
|-- riscv-randconfig-r002-20220714
|   `-- drivers-scsi-qla2xxx-qla_init.c:warning:variable-bail-set-but-not-used
|-- s390-randconfig-r036-20220714
|   `-- opt-cross-gcc-..-nolibc-s39-linux-bin-s39-linux-ld:pci-epf-vntb.c:(.text):undefined-reference-to-ntb_link_event
|-- x86_64-randconfig-a001
|   `-- drivers-vfio-vfio_iommu_type1.c:warning:cast-to-smaller-integer-type-enum-iommu_cap-from-void
|-- x86_64-randconfig-a005
|   |-- drivers-vfio-vfio_iommu_type1.c:warning:cast-to-smaller-integer-type-enum-iommu_cap-from-void
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-function-alloc_unconfined
|-- x86_64-randconfig-a012
|   `-- drivers-vfio-vfio_iommu_type1.c:warning:cast-to-smaller-integer-type-enum-iommu_cap-from-void
`-- x86_64-randconfig-a016
    `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-function-alloc_unconfined

elapsed time: 1263m

configs tested: 51
configs skipped: 3

gcc tested configs:
i386                          randconfig-c001
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
arm                   milbeaut_m10v_defconfig
arm                        vexpress_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                         s3c2410_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220714
hexagon              randconfig-r041-20220714

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

