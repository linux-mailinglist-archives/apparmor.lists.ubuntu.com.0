Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB4578E5A
	for <lists+apparmor@lfdr.de>; Tue, 19 Jul 2022 01:38:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oDaJY-0005wF-GF; Mon, 18 Jul 2022 23:38:12 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <lkp@intel.com>) id 1oDaJV-0005w8-JD
 for apparmor@lists.ubuntu.com; Mon, 18 Jul 2022 23:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658187489; x=1689723489;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=VQyC/hOp1k/THL4RsIPvnfCiglULK2+aEj5I7+E/pmM=;
 b=g8oIl0TQ5uttJmJTksmS1RFxRdBE365ZY3qJrVFkM7cvLS8j/lhlObqN
 LuIP9VsMfqHhxQcQ4qRYOY/PRP7b8dlDkhQdGNphze466m1yeYG6nzdYZ
 GheQw/wOEnJ37wW6xU52EW3zxkX8NAxxhsrAR5peBQU2WXtHQeJiek6Rl
 lY+hNzRbGqAU7b6LH5ijCjPcnHKo8ib6Vn7HsDr+iIqpVbNAgEeQzzmXT
 VCBo+Bif0o0ejqr6AT5IvXrmjO+B3T3xmXclzHCETGB88q1oL1Fs3NVsp
 vtpfVnDycboi/7RVZBjVRPRDtfa/gKv+BdqIrEFpzV/3b8zG8VxTaWs+9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="350309694"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="350309694"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 16:38:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="739652209"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2022 16:38:03 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oDaJP-0004ro-BP;
 Mon, 18 Jul 2022 23:38:03 +0000
Date: Tue, 19 Jul 2022 07:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <62d5eebf.e9jDQ0OnJ8xy689Q%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: [apparmor] [linux-next:master] BUILD REGRESSION
 036ad6daa8f0fd357af7f50f9da58539eaa6f68c
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
Cc: apparmor@lists.ubuntu.com, linux-scsi@vger.kernel.org,
 mpi3mr-linuxdrv.pdl@broadcom.com, linux-pci@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-can@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 036ad6daa8f0fd357af7f50f9da58539eaa6f68c  Add linux-next specific files for 20220718

Error/Warning reports:

https://lore.kernel.org/linux-mm/202206292052.LsFui3zO-lkp@intel.com
https://lore.kernel.org/linux-mm/202207160452.HPLSlqzA-lkp@intel.com
https://lore.kernel.org/llvm/202207090100.acXdJ79H-lkp@intel.com
https://lore.kernel.org/llvm/202207150400.NMBYJFkA-lkp@intel.com
https://lore.kernel.org/llvm/202207190150.mf4rb4VG-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2837:6: warning: no previous prototype for function 'dc_reset_state' [-Wmissing-prototypes]
drivers/pci/endpoint/functions/pci-epf-vntb.c:1247: undefined reference to `ntb_register_device'
drivers/pci/endpoint/functions/pci-epf-vntb.c:174: undefined reference to `ntb_link_event'
drivers/pci/endpoint/functions/pci-epf-vntb.c:262: undefined reference to `ntb_db_event'
drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous prototype for 'pci_read' [-Wmissing-prototypes]
drivers/pci/endpoint/functions/pci-epf-vntb.c:984:5: warning: no previous prototype for 'pci_write' [-Wmissing-prototypes]
drivers/scsi/mpi3mr/mpi3mr_os.c:1655:22: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/mpi3mr/mpi3mr_os.c:389:40: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/scsi/qla2xxx/qla_init.c:171:10: warning: variable 'bail' set but not used [-Wunused-but-set-variable]
drivers/vfio/vfio_iommu_type1.c:2141:35: warning: cast to smaller integer type 'enum iommu_cap' from 'void *' [-Wvoid-pointer-to-enum-cast]
reset-simple.c:(.text+0x3aa): undefined reference to `devm_ioremap_resource'
security/apparmor/policy_ns.c:83:20: warning: no previous prototype for 'alloc_unconfined' [-Wmissing-prototypes]
security/apparmor/policy_ns.c:83:20: warning: no previous prototype for function 'alloc_unconfined' [-Wmissing-prototypes]
unix_connect.c:115:55: error: expected identifier before '(' token
vmlinux.o: warning: objtool: ct_idle_enter+0x21: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_idle_exit+0x27: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_irq_enter+0x22: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_irq_exit+0x22: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_enter.constprop.0+0x38: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_enter_state+0x41: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_exit.constprop.0+0x44: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_exit_state+0x41: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_nmi_enter+0x37: call to ftrace_likely_update() leaves .noinstr.text section

Unverified Error/Warning (likely false positive, please contact us if interested):

arch/x86/kernel/cpu/rdrand.c:38 x86_init_rdrand() error: uninitialized symbol 'prev'.
drivers/char/random.c:886:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/clk/renesas/clk-r8a7779.c:137 r8a7779_cpg_clocks_init() warn: possible memory leak of 'data'
drivers/firmware/arm_scmi/powercap.c:376:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:2994:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/misc/habanalabs/gaudi2/gaudi2.c:8728:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/net/can/slcan/slcan-core.c:601:14: sparse:    void *
drivers/net/can/slcan/slcan-core.c:601:14: sparse:    void [noderef] __rcu *
drivers/net/can/slcan/slcan-core.c:601:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
drivers/net/dsa/microchip/ksz9477.c:501:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/net/ethernet/microchip/lan743x_main.c:1238:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/net/wireless/ath/ath9k/hif_usb.c:251:57: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
drivers/soc/mediatek/mtk-mutex.c:793:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/staging/media/zoran/zr36016.c:430:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/staging/media/zoran/zr36050.c:829:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/staging/media/zoran/zr36060.c:869:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/target/target_core_device.c:1013:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/thunderbolt/tmu.c:758:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
fs/kernel_read_file.c:61 kernel_read_file() warn: impossible condition '(i_size > (((~0) >> 1))) => (s64min-s64max > s64max)'
mm/memory.c:5183:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
net/ipv6/raw.c:938:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
net/ipv6/tcp_ipv6.c:347:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
net/l2tp/l2tp_ip6.c:660:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
security/apparmor/policy_ns.c:83:19: sparse: sparse: symbol 'alloc_unconfined' was not declared. Should it be static?
sound/soc/sof/intel/mtl.c:553:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- arc-allyesconfig
|   |-- drivers-char-random.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-firmware-arm_scmi-powercap.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-bios-bios_parser2.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-misc-habanalabs-gaudi2-gaudi2.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-net-dsa-microchip-ksz9477.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-net-ethernet-microchip-lan743x_main.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   |-- drivers-scsi-mpi3mr-mpi3mr_os.c:warning:cast-from-pointer-to-integer-of-different-size
|   |-- drivers-scsi-mpi3mr-mpi3mr_os.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-soc-mediatek-mtk-mutex.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-staging-media-zoran-zr36016.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-staging-media-zoran-zr36050.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-staging-media-zoran-zr36060.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-target-target_core_device.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-thunderbolt-tmu.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- mm-memory.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- net-ipv6-raw.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- net-ipv6-tcp_ipv6.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- net-l2tp-l2tp_ip6.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|   `-- sound-soc-sof-intel-mtl.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|-- i386-allyesconfig
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   |-- drivers-scsi-mpi3mr-mpi3mr_os.c:warning:cast-from-pointer-to-integer-of-different-size
|   |-- drivers-scsi-mpi3mr-mpi3mr_os.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- i386-randconfig-a014-20220718
|   |-- drivers-scsi-mpi3mr-mpi3mr_os.c:warning:cast-from-pointer-to-integer-of-different-size
|   |-- drivers-scsi-mpi3mr-mpi3mr_os.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- i386-randconfig-a015-20220718
|   |-- drivers-scsi-mpi3mr-mpi3mr_os.c:warning:cast-from-pointer-to-integer-of-different-size
|   `-- drivers-scsi-mpi3mr-mpi3mr_os.c:warning:cast-to-pointer-from-integer-of-different-size
|-- i386-randconfig-a016-20220718
|   |-- drivers-scsi-mpi3mr-mpi3mr_os.c:warning:cast-from-pointer-to-integer-of-different-size
|   `-- drivers-scsi-mpi3mr-mpi3mr_os.c:warning:cast-to-pointer-from-integer-of-different-size
|-- i386-randconfig-c033-20220718
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- i386-randconfig-m021-20220718
|   |-- arch-x86-kernel-cpu-rdrand.c-x86_init_rdrand()-error:uninitialized-symbol-prev-.
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- i386-randconfig-s002-20220718
|   |-- fs-ntfs3-attrib.c:sparse:sparse:cast-to-restricted-__le64
clang_recent_errors
|-- arm64-randconfig-r001-20220718
|   |-- drivers-scsi-qla2xxx-qla_init.c:warning:variable-bail-set-but-not-used
|   |-- drivers-vfio-vfio_iommu_type1.c:warning:cast-to-smaller-integer-type-enum-iommu_cap-from-void
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-function-alloc_unconfined
|-- i386-randconfig-a003-20220718
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-function-alloc_unconfined
|-- powerpc-randconfig-r035-20220718
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:no-previous-prototype-for-function-dc_reset_state
|-- s390-randconfig-r032-20220718
|   `-- reset-simple.c:(.text):undefined-reference-to-devm_ioremap_resource
|-- x86_64-randconfig-a001
|   `-- drivers-vfio-vfio_iommu_type1.c:warning:cast-to-smaller-integer-type-enum-iommu_cap-from-void
`-- x86_64-randconfig-a005
    |-- drivers-vfio-vfio_iommu_type1.c:warning:cast-to-smaller-integer-type-enum-iommu_cap-from-void
    `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-function-alloc_unconfined

elapsed time: 721m

configs tested: 78
configs skipped: 2

gcc tested configs:
i386                 randconfig-c001-20220718
sh                          landisk_defconfig
powerpc                     tqm8541_defconfig
sh                            migor_defconfig
powerpc                  iss476-smp_defconfig
sh                          r7785rp_defconfig
arm                        oxnas_v6_defconfig
arc                              alldefconfig
mips                    maltaup_xpa_defconfig
arm                       omap2plus_defconfig
m68k                          multi_defconfig
arm                          lpd270_defconfig
sh                             sh03_defconfig
arm64                            alldefconfig
m68k                                defconfig
powerpc                     rainier_defconfig
x86_64                           alldefconfig
parisc                generic-64bit_defconfig
powerpc                      tqm8xx_defconfig
loongarch                           defconfig
ia64                             allmodconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
x86_64               randconfig-k001-20220718
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64               randconfig-a013-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a011-20220718
x86_64               randconfig-a015-20220718
x86_64               randconfig-a014-20220718
x86_64               randconfig-a016-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a013-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a015-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a016-20220718
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
arc                  randconfig-r043-20220718
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
arm                     am200epdkit_defconfig
powerpc                        fsp2_defconfig
powerpc                     akebono_defconfig
powerpc                    socrates_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                 randconfig-a003-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a004-20220718
i386                 randconfig-a005-20220718
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

