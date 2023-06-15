Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FD6731F52
	for <lists+apparmor@lfdr.de>; Thu, 15 Jun 2023 19:37:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q9quW-0001Xl-LY; Thu, 15 Jun 2023 17:37:28 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <lkp@intel.com>) id 1q9quT-0001Xb-Qv
 for apparmor@lists.ubuntu.com; Thu, 15 Jun 2023 17:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686850645; x=1718386645;
 h=date:from:to:cc:subject:message-id;
 bh=PWPJoaMbHANmDB3CUyCVWvAacGb/nPhFLWGZlahdFpg=;
 b=gN/x0/agtGpgrOUshw2w4jOt2kzKn/n287vN4Goio+Ob6xiZ0ShZBVWZ
 SAD36qhKhhH7fpXBwkXV4IcE8N6bjyUtnhSGj4Wq80Z5KQ3DRS569IsV4
 5tsGMmJ1gSaRlhxI7DLEWcQwmMtyLJqA/ARIXrzege8dLajf9IGSj13dI
 z09mQFYX/7aFNCyBVdv3sDJQdmyTH28UrtHLckIiDeKIeRQmYS6OBP9aL
 s289K/sKE8/c9lUtr2pVK+M04hV3IW2DcdrhN15hmRgHpfzG8aY99Ih4l
 ZGgv8XMqNkRHa1WaReUL5ooauGDwN+Ve6ACg+L//XssPFtUL64Ttlbmi0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348698492"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="348698492"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 10:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="802497649"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="802497649"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2023 10:36:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q9qtl-0000DW-0N;
 Thu, 15 Jun 2023 17:36:41 +0000
Date: Fri, 16 Jun 2023 01:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <202306160110.pbELGy91-lkp@intel.com>
User-Agent: s-nail v14.9.24
Subject: [apparmor] [linux-next:master] BUILD REGRESSION
 925294c9aa184801cc0a451b69a18dd0fe7d847d
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
Cc: linux-cifs@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-net-drivers@amd.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, apparmor@lists.ubuntu.com,
 lvs-devel@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>,
 linux-leds@vger.kernel.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, linux-riscv@lists.infradead.org,
 rcu@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kunit-dev@googlegroups.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 925294c9aa184801cc0a451b69a18dd0fe7d847d  Add linux-next specific files for 20230615

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202306122223.HHER4zOo-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306141920.TTvpsXwJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306141934.UKmM9bFX-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306142017.23VmBLmG-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306151506.goHEegOd-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306151656.yttECVTP-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306151954.Rsz6HP7h-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
drivers/char/mem.c:164:25: error: implicit declaration of function 'unxlate_dev_mem_ptr'; did you mean 'xlate_dev_mem_ptr'? [-Werror=implicit-function-declaration]
drivers/leds/leds-cht-wcove.c:144:21: warning: no previous prototype for 'cht_wc_leds_brightness_get' [-Wmissing-prototypes]
drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:1022:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/net/ethernet/sfc/ef100_netdev.c:313: undefined reference to `efx_tc_netdev_event'
drivers/net/ethernet/sfc/ef100_netdev.c:329: undefined reference to `efx_tc_netevent_event'
drivers/net/ethernet/sfc/tc_encap_actions.c:277: undefined reference to `ip_send_check'
kernel/rcu/rcuscale.c:301:20: error: use of undeclared identifier 'get_rcu_tasks_gp_kthread'; did you mean 'get_rcu_tasks_trace_gp_kthread'?
kernel/rcu/rcuscale.c:322:14: error: use of undeclared identifier 'tasks_scale_read_lock'
kernel/rcu/rcuscale.c:323:16: error: use of undeclared identifier 'tasks_scale_read_unlock'
kernel/rcu/rcuscale.c:330:20: error: use of undeclared identifier 'get_rcu_tasks_rude_gp_kthread'; did you mean 'get_rcu_tasks_trace_gp_kthread'?
kernel/rcu/tasks.h:1113:21: warning: no previous prototype for function 'get_rcu_tasks_gp_kthread' [-Wmissing-prototypes]
lib/kunit/executor_test.c:138:4: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
lib/kunit/test.c:775:38: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
security/apparmor/policy_unpack.c:1173: warning: expecting prototype for verify_dfa_accept_xindex(). Prototype was for verify_dfa_accept_index() instead

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead
fs/smb/client/cifsfs.c:982 cifs_smb3_do_mount() warn: possible memory leak of 'cifs_sb'
fs/smb/client/cifssmb.c:4089 CIFSFindFirst() warn: missing error code? 'rc'
fs/smb/client/cifssmb.c:4216 CIFSFindNext() warn: missing error code? 'rc'
fs/smb/client/connect.c:2775 cifs_match_super() error: 'tlink' dereferencing possible ERR_PTR()
fs/smb/client/connect.c:2974 generic_ip_connect() error: we previously assumed 'socket' could be null (see line 2962)
{standard input}: Error: local label `"2" (instance number 9 of a fb label)' is not defined
{standard input}:1097: Error: pcrel too far

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-randconfig-r046-20230615
|   `-- drivers-media-platform-verisilicon-rockchip_vpu981_hw_av1_dec.c:warning:the-frame-size-of-bytes-is-larger-than-bytes
|-- i386-allyesconfig
|   `-- drivers-leds-leds-cht-wcove.c:warning:no-previous-prototype-for-cht_wc_leds_brightness_get
|-- i386-randconfig-i014-20230614
|   |-- drivers-net-ethernet-sfc-ef100_netdev.c:undefined-reference-to-efx_tc_netdev_event
|   `-- drivers-net-ethernet-sfc-ef100_netdev.c:undefined-reference-to-efx_tc_netevent_event
|-- i386-randconfig-m021-20230614
|   |-- fs-smb-client-cifsfs.c-cifs_smb3_do_mount()-warn:possible-memory-leak-of-cifs_sb
|   |-- fs-smb-client-cifssmb.c-CIFSFindFirst()-warn:missing-error-code-rc
|   |-- fs-smb-client-cifssmb.c-CIFSFindNext()-warn:missing-error-code-rc
|   |-- fs-smb-client-connect.c-cifs_match_super()-error:tlink-dereferencing-possible-ERR_PTR()
|   `-- fs-smb-client-connect.c-generic_ip_connect()-error:we-previously-assumed-socket-could-be-null-(see-line-)
|-- parisc-allyesconfig
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- parisc-defconfig
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- parisc64-defconfig
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- riscv-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- riscv-allyesconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- riscv-buildonly-randconfig-r001-20230614
|   `-- drivers-net-ethernet-sfc-tc_encap_actions.c:undefined-reference-to-ip_send_check
|-- riscv-randconfig-s031-20230611
|   `-- arch-riscv-kernel-signal.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-__val-got-void-noderef-__user-assigned-datap
|-- sh-allmodconfig
|   |-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
|   |-- standard-input:Error:local-label-(instance-number-of-a-fb-label)-is-not-defined
|   `-- standard-input:Error:pcrel-too-far
|-- sh-randconfig-r006-20230615
|   `-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
|-- sh-randconfig-r033-20230615
|   `-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
|-- sh-rsk7203_defconfig
|   `-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
|-- sh-se7619_defconfig
|   `-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
`-- x86_64-allyesconfig
    `-- drivers-leds-leds-cht-wcove.c:warning:no-previous-prototype-for-cht_wc_leds_brightness_get
clang_recent_errors
|-- hexagon-buildonly-randconfig-r003-20230614
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- hexagon-randconfig-r014-20230614
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- hexagon-randconfig-r041-20230615
|   |-- lib-kunit-executor_test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- i386-randconfig-i001-20230614
|   `-- security-apparmor-policy_unpack.c:warning:expecting-prototype-for-verify_dfa_accept_xindex().-Prototype-was-for-verify_dfa_accept_index()-instead
|-- i386-randconfig-i002-20230614
|   |-- kernel-rcu-rcuscale.c:error:use-of-undeclared-identifier-get_rcu_tasks_gp_kthread
|   |-- kernel-rcu-rcuscale.c:error:use-of-undeclared-identifier-get_rcu_tasks_rude_gp_kthread
|   `-- kernel-rcu-tasks.h:warning:no-previous-prototype-for-function-get_rcu_tasks_gp_kthread
|-- riscv-randconfig-r042-20230615
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- riscv-rv32_defconfig
|   `-- security-apparmor-policy_unpack.c:warning:expecting-prototype-for-verify_dfa_accept_xindex().-Prototype-was-for-verify_dfa_accept_index()-instead
|-- s390-randconfig-r026-20230615
|   |-- kernel-rcu-rcuscale.c:error:use-of-undeclared-identifier-tasks_scale_read_lock
|   |-- kernel-rcu-rcuscale.c:error:use-of-undeclared-identifier-tasks_scale_read_unlock
|   |-- lib-kunit-executor_test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- x86_64-randconfig-a001-20230614
|   `-- kernel-rcu-tasks.h:warning:no-previous-prototype-for-function-get_rcu_tasks_gp_kthread
|-- x86_64-randconfig-a005-20230614
|   |-- net-netfilter-ipvs-ip_vs_proto.o:warning:objtool:.init.text:unexpected-end-of-section
|   `-- security-apparmor-policy_unpack.c:warning:expecting-prototype-for-verify_dfa_accept_xindex().-Prototype-was-for-verify_dfa_accept_index()-instead
|-- x86_64-randconfig-a015-20230615
|   `-- drivers-net-ethernet-jme.o:warning:objtool:.text.jme_check_link:unexpected-end-of-section
`-- x86_64-rhel-8.3-rust
    `-- security-apparmor-policy_unpack.c:warning:expecting-prototype-for-verify_dfa_accept_xindex().-Prototype-was-for-verify_dfa_accept_index()-instead

elapsed time: 725m

configs tested: 124
configs skipped: 6

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230614   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r035-20230615   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r012-20230614   gcc  
arc                  randconfig-r043-20230615   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r046-20230615   gcc  
arm                        realview_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon      buildonly-randconfig-r003-20230614   clang
hexagon              randconfig-r014-20230614   clang
hexagon              randconfig-r041-20230615   clang
hexagon              randconfig-r045-20230615   clang
i386                             alldefconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230614   clang
i386                 randconfig-i002-20230614   clang
i386                 randconfig-i003-20230614   clang
i386                 randconfig-i004-20230614   clang
i386                 randconfig-i005-20230614   clang
i386                 randconfig-i006-20230614   clang
i386                 randconfig-i011-20230614   gcc  
i386                 randconfig-i012-20230614   gcc  
i386                 randconfig-i013-20230614   gcc  
i386                 randconfig-i014-20230614   gcc  
i386                 randconfig-i015-20230614   gcc  
i386                 randconfig-i016-20230614   gcc  
i386                 randconfig-r001-20230615   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230614   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r031-20230615   gcc  
microblaze   buildonly-randconfig-r002-20230614   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                          ath79_defconfig   clang
mips         buildonly-randconfig-r005-20230614   gcc  
mips                           mtx1_defconfig   clang
mips                 randconfig-r003-20230615   clang
nios2                               defconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r024-20230615   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r006-20230614   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                 mpc8540_ads_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r004-20230615   gcc  
riscv                randconfig-r042-20230615   clang
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r016-20230614   gcc  
s390                 randconfig-r026-20230615   clang
s390                 randconfig-r044-20230615   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r006-20230615   gcc  
sh                   randconfig-r033-20230615   gcc  
sh                          rsk7203_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230615   gcc  
sparc                randconfig-r032-20230615   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64              randconfig-r011-20230614   gcc  
sparc64              randconfig-r015-20230614   gcc  
sparc64              randconfig-r025-20230615   gcc  
sparc64              randconfig-r034-20230615   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230614   clang
x86_64               randconfig-a002-20230614   clang
x86_64               randconfig-a003-20230614   clang
x86_64               randconfig-a004-20230614   clang
x86_64               randconfig-a005-20230614   clang
x86_64               randconfig-a006-20230614   clang
x86_64               randconfig-a011-20230614   gcc  
x86_64               randconfig-a012-20230614   gcc  
x86_64               randconfig-a013-20230614   gcc  
x86_64               randconfig-a014-20230614   gcc  
x86_64               randconfig-a015-20230614   gcc  
x86_64               randconfig-a016-20230614   gcc  
x86_64               randconfig-r002-20230615   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r023-20230615   gcc  
xtensa               randconfig-r036-20230615   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

