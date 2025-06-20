Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688EAE13D3
	for <lists+apparmor@lfdr.de>; Fri, 20 Jun 2025 08:29:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uSVFz-0000kN-JB; Fri, 20 Jun 2025 06:29:47 +0000
Received: from mgamail.intel.com ([198.175.65.18])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <lkp@intel.com>) id 1uSVFx-0000ju-4v
 for apparmor@lists.ubuntu.com; Fri, 20 Jun 2025 06:29:45 +0000
X-CSE-ConnectionGUID: mYeX2u75SGSu9d9zp8E23w==
X-CSE-MsgGUID: Iq9mYI6ARLC4nBSSGfY/aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52799579"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="52799579"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 23:29:43 -0700
X-CSE-ConnectionGUID: 6/qi+xb+SXS8ZP7Y8EHbmg==
X-CSE-MsgGUID: kCKCdyveR5aVl7otqVCwdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="151370535"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 19 Jun 2025 23:29:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uSVFn-000LR1-28;
 Fri, 20 Jun 2025 06:29:35 +0000
Date: Fri, 20 Jun 2025 14:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime =?iso-8859-1?Q?B=E9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
Message-ID: <202506201414.tHOEthTb-lkp@intel.com>
References: <20250619181600.478038-4-maxime.belair@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619181600.478038-4-maxime.belair@canonical.com>
Received-SPF: pass client-ip=198.175.65.18; envelope-from=lkp@intel.com;
 helo=mgamail.intel.com
Subject: Re: [apparmor] [PATCH v2 3/3] AppArmor: add support for
 lsm_config_self_policy and lsm_config_system_policy
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
 jmorris@namei.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9c32cda43eb78f78c73aee4aa344b777714e259b]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-B-lair/Wire-up-lsm_config_self_policy-and-lsm_config_system_policy-syscalls/20250620-022714
base:   9c32cda43eb78f78c73aee4aa344b777714e259b
patch link:    https://lore.kernel.org/r/20250619181600.478038-4-maxime.belair%40canonical.com
patch subject: [PATCH v2 3/3] AppArmor: add support for lsm_config_self_policy and lsm_config_system_policy
config: x86_64-buildonly-randconfig-002-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201414.tHOEthTb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201414.tHOEthTb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201414.tHOEthTb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/apparmorfs.c:454: warning: Function parameter or struct member 'name' not described in 'aa_profile_load_ns_name'
>> security/apparmor/apparmorfs.c:454: warning: Function parameter or struct member 'name_size' not described in 'aa_profile_load_ns_name'
>> security/apparmor/apparmorfs.c:454: warning: Function parameter or struct member 'buf' not described in 'aa_profile_load_ns_name'
>> security/apparmor/apparmorfs.c:454: warning: Function parameter or struct member 'size' not described in 'aa_profile_load_ns_name'
>> security/apparmor/apparmorfs.c:454: warning: Function parameter or struct member 'ppos' not described in 'aa_profile_load_ns_name'
--
>> security/apparmor/lsm.c:1287: warning: Function parameter or struct member 'lsm_id' not described in 'apparmor_lsm_config_self_policy'
>> security/apparmor/lsm.c:1287: warning: Function parameter or struct member 'op' not described in 'apparmor_lsm_config_self_policy'
>> security/apparmor/lsm.c:1287: warning: Function parameter or struct member 'flags' not described in 'apparmor_lsm_config_self_policy'
>> security/apparmor/lsm.c:1318: warning: Function parameter or struct member 'lsm_id' not described in 'apparmor_lsm_config_system_policy'
>> security/apparmor/lsm.c:1318: warning: Function parameter or struct member 'op' not described in 'apparmor_lsm_config_system_policy'
>> security/apparmor/lsm.c:1318: warning: Function parameter or struct member 'flags' not described in 'apparmor_lsm_config_system_policy'


vim +454 security/apparmor/apparmorfs.c

   441	
   442	/**
   443	 * aa_profile_load_ns_name - load a profile into the current namespace identified by name
   444	 * @name The name of the namesapce to load the policy in. "" for root_ns
   445	 * @name_size size of @name. 0 For root ns
   446	 * @buf buffer containing the user-provided policy
   447	 * @size size of @buf
   448	 * @ppos position pointer in the file
   449	 *
   450	 * Returns: 0 on success, negative value on error
   451	 */
   452	ssize_t aa_profile_load_ns_name(char *name, size_t name_size, const void __user *buf,
   453					size_t size, loff_t *ppos)
 > 454	{
   455		struct aa_ns *ns;
   456	
   457		if (name_size == 0)
   458			ns = aa_get_ns(root_ns);
   459		else
   460			ns = aa_lookupn_ns(root_ns, name, name_size);
   461	
   462		if (!ns)
   463			return -EINVAL;
   464	
   465		int error = policy_update(AA_MAY_LOAD_POLICY | AA_MAY_REPLACE_POLICY,
   466					  buf, size, ppos, ns);
   467	
   468		aa_put_ns(ns);
   469	
   470		return error >= 0 ? 0 : error;
   471	}
   472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

