Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEEB7362FB
	for <lists+apparmor@lfdr.de>; Tue, 20 Jun 2023 07:06:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qBTZ5-0002IH-C8; Tue, 20 Jun 2023 05:06:03 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <lkp@intel.com>) id 1qBTZ2-0002HR-PH
 for apparmor@lists.ubuntu.com; Tue, 20 Jun 2023 05:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687237560; x=1718773560;
 h=date:from:to:cc:subject:message-id;
 bh=k8dXJKm1Tj7CvpWo81Shwd/lfWNNX2BkVPkjhZZRA4s=;
 b=keg25o+62dbZw4VoBl5dawdFE/PgXaMCS2X73tcXd2kzHrtbJAO/myK2
 BkocpkmlrozWIJQoZJCZChwaLB0rnaKlnJmOJlamNgnzJLspJNBKw/y9B
 ubslPu94CGPzAfzCL5AHuREHfaK7kxnt+EHRARWMNjS02D/cYb8sQgdxB
 u0VXhkWYrr2JnWVByZt2KdwmtNxcWdpLAViBm333EcxLSOBJiL86cRi/3
 9eUVzFXv+N8/2aYE5aY8ucufuZNEH0/1Bv0QVHYAzXXNKDnbzOq8cxOoc
 NGWvGRaP3sIO7nlPwpGlbBCEtflM0DI5pQYQ3Y9gQhOVV1/UyntOyUEk3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="359768861"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; d="scan'208";a="359768861"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 22:05:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="858433812"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; d="scan'208";a="858433812"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2023 22:05:54 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qBTYv-0005VG-1l;
 Tue, 20 Jun 2023 05:05:53 +0000
Date: Tue, 20 Jun 2023 13:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <202306201331.3wBBp3Up-lkp@intel.com>
User-Agent: s-nail v14.9.24
Subject: [apparmor] [linux-next:master] BUILD REGRESSION
 47045630bc409ce6606d97b790895210dd1d517d
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
Cc: linux-cifs@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kvm@vger.kernel.org, netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, apparmor@lists.ubuntu.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-parisc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 samba-technical@lists.samba.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linux-leds@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 47045630bc409ce6606d97b790895210dd1d517d  Add linux-next specific files for 20230619

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202306122223.HHER4zOo-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306141934.UKmM9bFX-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306151954.Rsz6HP7h-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306191640.NE97q8G3-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202306200328.NX4JlBDv-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
arch/riscv/kvm/aia_imsic.c:237:9: error: call to undeclared function 'arch_atomic_long_fetch_or'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/char/mem.c:164:25: error: implicit declaration of function 'unxlate_dev_mem_ptr'; did you mean 'xlate_dev_mem_ptr'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/display/intel_display_power.h:255:70: error: declaration of 'struct seq_file' will not be visible outside of this function [-Werror,-Wvisibility]
drivers/leds/leds-cht-wcove.c:144:21: warning: no previous prototype for 'cht_wc_leds_brightness_get' [-Wmissing-prototypes]
lib/kunit/executor_test.c:138:4: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
lib/kunit/test.c:775:38: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
security/apparmor/policy_unpack.c:1173: warning: expecting prototype for verify_dfa_accept_xindex(). Prototype was for verify_dfa_accept_index() instead

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead
fs/smb/client/cifsfs.c:984 cifs_smb3_do_mount() warn: possible memory leak of 'cifs_sb'
fs/smb/client/cifssmb.c:4089 CIFSFindFirst() warn: missing error code? 'rc'
fs/smb/client/cifssmb.c:4216 CIFSFindNext() warn: missing error code? 'rc'
fs/smb/client/connect.c:2775 cifs_match_super() error: 'tlink' dereferencing possible ERR_PTR()
fs/smb/client/connect.c:2974 generic_ip_connect() error: we previously assumed 'socket' could be null (see line 2962)
{standard input}: Error: local label `"2" (instance number 9 of a fb label)' is not defined
{standard input}:1097: Error: pcrel too far

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-allyesconfig
|   `-- drivers-leds-leds-cht-wcove.c:warning:no-previous-prototype-for-cht_wc_leds_brightness_get
|-- i386-randconfig-m021-20230618
|   |-- drivers-staging-media-atomisp-pci-atomisp_fops.c-atomisp_open()-warn:missing-unwind-goto
|   |-- fs-smb-client-cifsfs.c-cifs_smb3_do_mount()-warn:possible-memory-leak-of-cifs_sb
|   |-- fs-smb-client-cifssmb.c-CIFSFindFirst()-warn:missing-error-code-rc
|   |-- fs-smb-client-cifssmb.c-CIFSFindNext()-warn:missing-error-code-rc
|   |-- fs-smb-client-connect.c-cifs_match_super()-error:tlink-dereferencing-possible-ERR_PTR()
|   `-- fs-smb-client-connect.c-generic_ip_connect()-error:we-previously-assumed-socket-could-be-null-(see-line-)
|-- parisc-allyesconfig
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- parisc-defconfig
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- parisc-randconfig-r001-20230619
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- parisc-randconfig-s042-20230618
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- parisc64-defconfig
|   `-- arch-parisc-kernel-pdt.c:warning:no-previous-prototype-for-arch_report_meminfo
|-- riscv-allmodconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- riscv-allyesconfig
|   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
|-- riscv-randconfig-s051-20230618
|   `-- arch-riscv-kernel-signal.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-__val-got-void-noderef-__user-assigned-datap
|-- sh-allmodconfig
|   |-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
|   |-- standard-input:Error:local-label-(instance-number-of-a-fb-label)-is-not-defined
|   `-- standard-input:Error:pcrel-too-far
|-- sh-magicpanelr2_defconfig
|   `-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
|-- sh-rsk7269_defconfig
|   `-- drivers-char-mem.c:error:implicit-declaration-of-function-unxlate_dev_mem_ptr
|-- x86_64-allyesconfig
|   `-- drivers-leds-leds-cht-wcove.c:warning:no-previous-prototype-for-cht_wc_leds_brightness_get
`-- x86_64-randconfig-m001-20230618
    |-- fs-smb-client-cifsfs.c-cifs_smb3_do_mount()-warn:possible-memory-leak-of-cifs_sb
    |-- fs-smb-client-cifssmb.c-CIFSFindFirst()-warn:missing-error-code-rc
    |-- fs-smb-client-cifssmb.c-CIFSFindNext()-warn:missing-error-code-rc
    |-- fs-smb-client-connect.c-cifs_match_super()-error:tlink-dereferencing-possible-ERR_PTR()
    `-- fs-smb-client-connect.c-generic_ip_connect()-error:we-previously-assumed-socket-could-be-null-(see-line-)
clang_recent_errors
|-- arm-randconfig-r002-20230619
|   |-- lib-kunit-executor_test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|   |-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|   `-- security-apparmor-policy_unpack.c:warning:expecting-prototype-for-verify_dfa_accept_xindex().-Prototype-was-for-verify_dfa_accept_index()-instead
|-- hexagon-randconfig-r011-20230619
|   `-- bin-bash:line:Segmentation-fault-LLVM_OBJCOPY-llvm-objcopy-pahole-J-btf_gen_floats-j-lang_exclude-rust-skip_encoding_btf_inconsistent_proto-btf_gen_optimized-btf_base-vmlinux-drivers-iio-adc-max1363.k
|-- hexagon-randconfig-r041-20230619
|   |-- lib-kunit-executor_test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- hexagon-randconfig-r045-20230619
|   |-- lib-kunit-executor_test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- powerpc-randconfig-r012-20230619
|   |-- lib-kunit-executor_test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- riscv-randconfig-r042-20230619
|   |-- arch-riscv-kvm-aia_imsic.c:error:call-to-undeclared-function-arch_atomic_long_fetch_or-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- lib-kunit-test.c:warning:cast-from-void-(-)(const-void-)-to-kunit_action_t-(aka-void-(-)(void-)-)-converts-to-incompatible-function-type
|-- x86_64-randconfig-a012-20230619
|   `-- security-apparmor-policy_unpack.c:warning:expecting-prototype-for-verify_dfa_accept_xindex().-Prototype-was-for-verify_dfa_accept_index()-instead
|-- x86_64-randconfig-r015-20230619
|   |-- drivers-gpu-drm-i915-display-intel_display_power.h:error:declaration-of-struct-seq_file-will-not-be-visible-outside-of-this-function-Werror-Wvisibility
|   `-- drivers-net-ethernet-jme.o:warning:objtool:jme_check_link()-falls-through-to-next-function-jme_powersave_phy()
`-- x86_64-rhel-8.3-rust
    `-- security-apparmor-policy_unpack.c:warning:expecting-prototype-for-verify_dfa_accept_xindex().-Prototype-was-for-verify_dfa_accept_index()-instead

elapsed time: 1330m

configs tested: 126
configs skipped: 4

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230619   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r021-20230619   gcc  
arc                  randconfig-r043-20230619   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                       imx_v6_v7_defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                        neponset_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r002-20230619   clang
arm                  randconfig-r046-20230619   gcc  
arm                        vexpress_defconfig   clang
arm                         vf610m4_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230619   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r022-20230619   gcc  
hexagon              randconfig-r011-20230619   clang
hexagon              randconfig-r041-20230619   clang
hexagon              randconfig-r045-20230619   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230619   gcc  
i386         buildonly-randconfig-r005-20230619   gcc  
i386         buildonly-randconfig-r006-20230619   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230619   gcc  
i386                 randconfig-i002-20230619   gcc  
i386                 randconfig-i003-20230619   gcc  
i386                 randconfig-i004-20230619   gcc  
i386                 randconfig-i005-20230619   gcc  
i386                 randconfig-i006-20230619   gcc  
i386                 randconfig-i011-20230619   clang
i386                 randconfig-i012-20230619   clang
i386                 randconfig-i013-20230619   clang
i386                 randconfig-i014-20230619   clang
i386                 randconfig-i015-20230619   clang
i386                 randconfig-i016-20230619   clang
i386                 randconfig-r033-20230619   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230619   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                 randconfig-r034-20230619   gcc  
m68k                 randconfig-r036-20230619   gcc  
microblaze           randconfig-r024-20230619   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           mtx1_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230619   gcc  
nios2                randconfig-r004-20230619   gcc  
nios2                randconfig-r016-20230619   gcc  
nios2                randconfig-r032-20230619   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230619   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc              randconfig-r012-20230619   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                randconfig-r042-20230619   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230619   clang
sh                               allmodconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r005-20230619   gcc  
sparc64              randconfig-r014-20230619   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r013-20230619   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230619   gcc  
x86_64       buildonly-randconfig-r002-20230619   gcc  
x86_64       buildonly-randconfig-r003-20230619   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230619   gcc  
x86_64               randconfig-a002-20230619   gcc  
x86_64               randconfig-a003-20230619   gcc  
x86_64               randconfig-a004-20230619   gcc  
x86_64               randconfig-a005-20230619   gcc  
x86_64               randconfig-a006-20230619   gcc  
x86_64               randconfig-a011-20230619   clang
x86_64               randconfig-a012-20230619   clang
x86_64               randconfig-a013-20230619   clang
x86_64               randconfig-a014-20230619   clang
x86_64               randconfig-a015-20230619   clang
x86_64               randconfig-a016-20230619   clang
x86_64               randconfig-r015-20230619   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r025-20230619   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

