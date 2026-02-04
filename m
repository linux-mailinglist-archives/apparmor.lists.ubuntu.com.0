Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE9nMHwmg2kxigMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 11:59:08 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 78573E4D6E
	for <lists+apparmor@lfdr.de>; Wed, 04 Feb 2026 11:59:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vnaaz-0005n9-2Y; Wed, 04 Feb 2026 10:58:53 +0000
Received: from mgamail.intel.com ([198.175.65.10])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <lkp@intel.com>) id 1vnaax-0005ma-9a
 for apparmor@lists.ubuntu.com; Wed, 04 Feb 2026 10:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770202731; x=1801738731;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e4OYY/P0s+n3f6l0Un+2wnNzSCxA9PSWh2mQE2h/QLI=;
 b=hqNR841utIngbsWawjnZ0aiXnuVPRsIUqADG7ZL2m1yKeBtmpBoOMzko
 CuSElyk3WQbUDQ+CeFEWRio9dZJlRWZK8ZSm8Qz6jbdZMsglRhxq0J4/S
 Th2viGDVK6Zy0CVbwDgwJXc4LAHw83nbGInHW+KwnydYdDMbSSkXNZypf
 f1JNily4m2l6BQ5QoWaixfJ+NPBPvy3wqSYl0co/gJU/OjZNrW99fiT81
 Be5YNK43oC3gh2RdBQE+xU5DIIcWJXy/gjGKJTzNyVq2tuHaDJ3L7HRM4
 KOIYpKzkjA7dNV/9ai6NJPTK72TnuNd+1dGJ7U9Yu6cqvWlV66BR/w8QA Q==;
X-CSE-ConnectionGUID: +GEEsD6vSRmwDDbIV63w7Q==
X-CSE-MsgGUID: bVNHOCqiTrCcR4FIt5htLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88807948"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="88807948"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:58:40 -0800
X-CSE-ConnectionGUID: oBTx9fyySBW7CeLiYKyMow==
X-CSE-MsgGUID: 6hswnyijS3qwmcCTJ28ksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209230824"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 04 Feb 2026 02:58:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vnaaN-00000000hii-2R8J;
 Wed, 04 Feb 2026 10:58:15 +0000
Date: Wed, 4 Feb 2026 18:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@ownmail.net>, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Howells <dhowells@redhat.com>, Jan Kara <jack@suse.cz>,
 Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>
Message-ID: <202602041851.x2RfFgKO-lkp@intel.com>
References: <20260204050726.177283-5-neilb@ownmail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204050726.177283-5-neilb@ownmail.net>
Received-SPF: pass client-ip=198.175.65.10; envelope-from=lkp@intel.com;
 helo=mgamail.intel.com
Subject: Re: [apparmor] [PATCH 04/13] Apparmor: Use simple_start_creating()
 / simple_done_creating()
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
Cc: linux-nfs@vger.kernel.org, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-unionfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:neilb@ownmail.net,m:brauner@kernel.org,m:viro@zeniv.linux.org.uk,m:dhowells@redhat.com,m:jack@suse.cz,m:chuck.lever@oracle.com,m:jlayton@kernel.org,m:miklos@szeredi.hu,m:amir73il@gmail.com,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:stephen.smalley.work@gmail.com,m:linux-nfs@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-unionfs@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ownmail.net,kernel.org,zeniv.linux.org.uk,redhat.com,suse.cz,oracle.com,szeredi.hu,gmail.com,canonical.com,paul-moore.com,namei.org,hallyn.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,git-scm.com:url,intel.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 78573E4D6E
X-Rspamd-Action: no action

Hi NeilBrown,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on viro-vfs/for-next linus/master v6.19-rc8 next-20260203]
[cannot apply to pcmoore-selinux/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/fs-proc-Don-t-lock-root-inode-when-creating-self-and-thread-self/20260204-131659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260204050726.177283-5-neilb%40ownmail.net
patch subject: [PATCH 04/13] Apparmor: Use simple_start_creating() / simple_done_creating()
config: arm-randconfig-r133-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041851.x2RfFgKO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041851.x2RfFgKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041851.x2RfFgKO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/apparmor/apparmorfs.c:295:16: sparse: sparse: Using plain integer as NULL pointer

vim +295 security/apparmor/apparmorfs.c

   247	
   248	/**
   249	 * aafs_create - create a dentry in the apparmorfs filesystem
   250	 *
   251	 * @name: name of dentry to create
   252	 * @mode: permissions the file should have
   253	 * @parent: parent directory for this dentry
   254	 * @data: data to store on inode.i_private, available in open()
   255	 * @link: if symlink, symlink target string
   256	 * @fops: struct file_operations that should be used for
   257	 * @iops: struct of inode_operations that should be used
   258	 *
   259	 * This is the basic "create a xxx" function for apparmorfs.
   260	 *
   261	 * Returns a pointer to a dentry if it succeeds, that must be free with
   262	 * aafs_remove(). Will return ERR_PTR on failure.
   263	 */
   264	static struct dentry *aafs_create(const char *name, umode_t mode,
   265					  struct dentry *parent, void *data, void *link,
   266					  const struct file_operations *fops,
   267					  const struct inode_operations *iops)
   268	{
   269		struct dentry *dentry;
   270		struct inode *dir;
   271		int error;
   272	
   273		AA_BUG(!name);
   274		AA_BUG(!parent);
   275	
   276		if (!(mode & S_IFMT))
   277			mode = (mode & S_IALLUGO) | S_IFREG;
   278	
   279		error = simple_pin_fs(&aafs_ops, &aafs_mnt, &aafs_count);
   280		if (error)
   281			return ERR_PTR(error);
   282	
   283		dir = d_inode(parent);
   284	
   285		dentry = simple_start_creating(parent, name);
   286		if (IS_ERR(dentry)) {
   287			error = PTR_ERR(dentry);
   288			goto fail;
   289		}
   290	
   291		error = __aafs_setup_d_inode(dir, dentry, mode, data, link, fops, iops);
   292		simple_done_creating(dentry);
   293		if (error)
   294			goto fail;
 > 295		return 0;
   296	fail:
   297		simple_release_fs(&aafs_mnt, &aafs_count);
   298		return ERR_PTR(error);
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

