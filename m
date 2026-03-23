Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPh6JejEwWlTWQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 23:55:36 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9F2FE9FC
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 23:55:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w4oBD-0005Jz-R7; Mon, 23 Mar 2026 22:55:27 +0000
Received: from mgamail.intel.com ([198.175.65.19])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <lkp@intel.com>) id 1w4oBC-0005Ig-EP
 for apparmor@lists.ubuntu.com; Mon, 23 Mar 2026 22:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774306526; x=1805842526;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=obUpamcW4SXV1lZNedXwbRTWMDTBANY2dB2b8QgkLJU=;
 b=dp+sAUI63nd1Vqlpcau4aorWa5DI8osw2VjksE2BkUiQooJfqgn8BTjb
 gODCJhit+6eqJJuvWsD7HuaKms3aATcYFP4gQEBAOG77k+VoblR5AkcNG
 6XhBrOkxp4dbYmcgFBdcjBOdq8RsrdsDubH/KIvt4wXYn9KBWwwhOmk5O
 e6Pc5KAgr3QEzgw2Bha6HYIQ71YKQfchLAm7OpHnvFK2Atd3ePzWe4G1I
 u2AY/cK4mmlxLK58Y3SdqlsQO5Xnu1WXp/BXo49j/pLGrPL3I8H18XaY8
 2EE8g+GYCx4sbV4yzNd/aXkqd04BALl0OnU681ORBufGzbvP0aSKM+beJ Q==;
X-CSE-ConnectionGUID: kL//T67MS2KUEP2sJzlOfA==
X-CSE-MsgGUID: mnjoNKlFSOaTesaCKGsgzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75200038"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75200038"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 15:55:24 -0700
X-CSE-ConnectionGUID: rwro3G/aSRygcqgDcCEPkQ==
X-CSE-MsgGUID: ZTQtoYOrRMipHeEYtZ4Geg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228902325"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2026 15:55:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w4oB3-000000003MX-1jgX;
 Mon, 23 Mar 2026 22:55:17 +0000
Date: Tue, 24 Mar 2026 06:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Message-ID: <202603240650.DP6vwmk9-lkp@intel.com>
References: <20260323150505.3513839-5-dhowells@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323150505.3513839-5-dhowells@redhat.com>
Received-SPF: pass client-ip=198.175.65.19; envelope-from=lkp@intel.com;
 helo=mgamail.intel.com
Subject: Re: [apparmor] [PATCH net v2 04/10] list: Move on_list_rcu() to
 list.h and add on_list() also
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
Cc: apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, stable@kernel.org,
 David Howells <dhowells@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Simon Horman <horms@kernel.org>, oe-kbuild-all@lists.linux.dev,
 Marc Dionne <marc.dionne@auristor.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-afs@lists.infradead.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.19 / 15.00];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dhowells@redhat.com,m:netdev@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:stable@kernel.org,m:edumazet@google.com,m:mathieu.desnoyers@efficios.com,m:horms@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:marc.dionne@auristor.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-afs@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[intel.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: 74C9F2FE9FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/rxrpc-Fix-key-quota-calculation-for-multitoken-keys/20260323-234846
base:   net/main
patch link:    https://lore.kernel.org/r/20260323150505.3513839-5-dhowells%40redhat.com
patch subject: [PATCH net v2 04/10] list: Move on_list_rcu() to list.h and add on_list() also
config: arc-randconfig-r071-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240650.DP6vwmk9-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240650.DP6vwmk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240650.DP6vwmk9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/dwc2/gadget.c:4313:13: error: conflicting types for 'on_list'
    4313 | static bool on_list(struct dwc2_hsotg_ep *ep, struct dwc2_hsotg_req *test)
         |             ^~~~~~~
   In file included from include/linux/module.h:12,
                    from drivers/usb/dwc2/gadget.c:15:
   include/linux/list.h:392:20: note: previous definition of 'on_list' was here
     392 | static inline bool on_list(const struct list_head *entry)
         |                    ^~~~~~~


vim +/on_list +4313 drivers/usb/dwc2/gadget.c

4fe4f9fecc3695 drivers/usb/dwc2/gadget.c      Minas Harutyunyan 2018-12-10  4307  
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4308  /**
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4309   * on_list - check request is on the given endpoint
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4310   * @ep: The endpoint to check.
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4311   * @test: The request to test if it is on the endpoint.
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4312   */
1f91b4cc03556b drivers/usb/dwc2/gadget.c      Felipe Balbi      2015-08-06 @4313  static bool on_list(struct dwc2_hsotg_ep *ep, struct dwc2_hsotg_req *test)
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4314  {
1f91b4cc03556b drivers/usb/dwc2/gadget.c      Felipe Balbi      2015-08-06  4315  	struct dwc2_hsotg_req *req, *treq;
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4316  
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4317  	list_for_each_entry_safe(req, treq, &ep->queue, queue) {
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4318  		if (req == test)
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4319  			return true;
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4320  	}
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4321  
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4322  	return false;
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4323  }
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks         2009-06-02  4324  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

