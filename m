Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFsSKZDCwWkHWQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 23:45:36 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D6B2FE76A
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 23:45:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w4o1W-0004Fh-UX; Mon, 23 Mar 2026 22:45:26 +0000
Received: from mgamail.intel.com ([192.198.163.10])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <lkp@intel.com>) id 1w4o1V-0004FN-6O
 for apparmor@lists.ubuntu.com; Mon, 23 Mar 2026 22:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774305925; x=1805841925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/4U+DFZaun0U2N53e9WcUbM+CfTDtWxXba3EGX9WYho=;
 b=cKbCPz828o8ejfr9+rjgL9cwF+D6ZDMxkC8EccmWAjurmxJ1J6UPYnzi
 LAAM3T5tPlpzO41uAxE5XroipU9ZSU/gOhCfQTW+j+Lblv/+5fFub8OxA
 gEm72Tvf/tS397dijfQ2ePxLUXrJNZLk5jEtV/XoxNaWQKOUCwwUY2Dce
 89vSLt+kScQCnl/ptrz1efqINaQRXhBURw8EtIdQEM54dg+wVjY+rRkqX
 SJwmqLN9PBVdyZL4aP6a4JI8C0DcIld3e+5zOVouGz5LgeWSo5Fzo9Fmx
 +IA3K/xYV73D3y58IhgmbcuZ1vDUa1JKkQ37fXRBJ5OKAuci70wcE5ahY A==;
X-CSE-ConnectionGUID: nbTd200ZTrOkpefAtMi5bg==
X-CSE-MsgGUID: GQmN3WFiQkeobUWOUP+dqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86685067"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="86685067"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 15:45:23 -0700
X-CSE-ConnectionGUID: SwX5nIW0Tzan2DLFVEoosA==
X-CSE-MsgGUID: ILsyuvz8T9SoqJKqlQl9Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="262083210"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 23 Mar 2026 15:45:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1w4o1M-000000003LU-13Qd;
 Mon, 23 Mar 2026 22:45:16 +0000
Date: Tue, 24 Mar 2026 06:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Message-ID: <202603240630.eCfHPMhL-lkp@intel.com>
References: <20260323150505.3513839-5-dhowells@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323150505.3513839-5-dhowells@redhat.com>
Received-SPF: pass client-ip=192.198.163.10; envelope-from=lkp@intel.com;
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
Cc: llvm@lists.linux.dev, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, stable@kernel.org,
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:dhowells@redhat.com,m:netdev@vger.kernel.org,m:llvm@lists.linux.dev,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:stable@kernel.org,m:edumazet@google.com,m:mathieu.desnoyers@efficios.com,m:horms@kernel.org,m:oe-kbuild-all@lists.linux.dev,m:marc.dionne@auristor.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-afs@lists.infradead.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,intel.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 74D6B2FE76A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/rxrpc-Fix-key-quota-calculation-for-multitoken-keys/20260323-234846
base:   net/main
patch link:    https://lore.kernel.org/r/20260323150505.3513839-5-dhowells%40redhat.com
patch subject: [PATCH net v2 04/10] list: Move on_list_rcu() to list.h and add on_list() also
config: arm-randconfig-004-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240630.eCfHPMhL-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240630.eCfHPMhL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240630.eCfHPMhL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/dwc2/gadget.c:4313:13: error: conflicting types for 'on_list'
    4313 | static bool on_list(struct dwc2_hsotg_ep *ep, struct dwc2_hsotg_req *test)
         |             ^
   include/linux/list.h:392:20: note: previous definition is here
     392 | static inline bool on_list(const struct list_head *entry)
         |                    ^
>> drivers/usb/dwc2/gadget.c:4341:22: error: too many arguments to function call, expected single argument 'entry', have 2 arguments
    4341 |         if (!on_list(hs_ep, hs_req)) {
         |              ~~~~~~~        ^~~~~~
   include/linux/list.h:392:20: note: 'on_list' declared here
     392 | static inline bool on_list(const struct list_head *entry)
         |                    ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/entry +4341 drivers/usb/dwc2/gadget.c

5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4324  
8b9bc4608eefeb drivers/usb/gadget/s3c-hsotg.c Lukasz Majewski    2012-05-04  4325  /**
1f91b4cc03556b drivers/usb/dwc2/gadget.c      Felipe Balbi       2015-08-06  4326   * dwc2_hsotg_ep_dequeue - dequeue given endpoint
8b9bc4608eefeb drivers/usb/gadget/s3c-hsotg.c Lukasz Majewski    2012-05-04  4327   * @ep: The endpoint to dequeue.
8b9bc4608eefeb drivers/usb/gadget/s3c-hsotg.c Lukasz Majewski    2012-05-04  4328   * @req: The request to be removed from a queue.
8b9bc4608eefeb drivers/usb/gadget/s3c-hsotg.c Lukasz Majewski    2012-05-04  4329   */
1f91b4cc03556b drivers/usb/dwc2/gadget.c      Felipe Balbi       2015-08-06  4330  static int dwc2_hsotg_ep_dequeue(struct usb_ep *ep, struct usb_request *req)
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4331  {
1f91b4cc03556b drivers/usb/dwc2/gadget.c      Felipe Balbi       2015-08-06  4332  	struct dwc2_hsotg_req *hs_req = our_req(req);
1f91b4cc03556b drivers/usb/dwc2/gadget.c      Felipe Balbi       2015-08-06  4333  	struct dwc2_hsotg_ep *hs_ep = our_ep(ep);
941fcce4ff6701 drivers/usb/dwc2/gadget.c      Dinh Nguyen        2014-11-11  4334  	struct dwc2_hsotg *hs = hs_ep->parent;
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4335  	unsigned long flags;
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4336  
1e01129373f757 drivers/usb/dwc2/gadget.c      Marek Szyprowski   2014-09-09  4337  	dev_dbg(hs->dev, "ep_dequeue(%p,%p)\n", ep, req);
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4338  
22258f4906aa87 drivers/usb/gadget/s3c-hsotg.c Lukasz Majewski    2012-06-14  4339  	spin_lock_irqsave(&hs->lock, flags);
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4340  
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02 @4341  	if (!on_list(hs_ep, hs_req)) {
22258f4906aa87 drivers/usb/gadget/s3c-hsotg.c Lukasz Majewski    2012-06-14  4342  		spin_unlock_irqrestore(&hs->lock, flags);
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4343  		return -EINVAL;
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4344  	}
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4345  
c524dd5f432a06 drivers/usb/dwc2/gadget.c      Mian Yousaf Kaukab 2015-09-29  4346  	/* Dequeue already started request */
c524dd5f432a06 drivers/usb/dwc2/gadget.c      Mian Yousaf Kaukab 2015-09-29  4347  	if (req == &hs_ep->req->req)
c524dd5f432a06 drivers/usb/dwc2/gadget.c      Mian Yousaf Kaukab 2015-09-29  4348  		dwc2_hsotg_ep_stop_xfr(hs, hs_ep);
c524dd5f432a06 drivers/usb/dwc2/gadget.c      Mian Yousaf Kaukab 2015-09-29  4349  
1f91b4cc03556b drivers/usb/dwc2/gadget.c      Felipe Balbi       2015-08-06  4350  	dwc2_hsotg_complete_request(hs, hs_ep, hs_req, -ECONNRESET);
22258f4906aa87 drivers/usb/gadget/s3c-hsotg.c Lukasz Majewski    2012-06-14  4351  	spin_unlock_irqrestore(&hs->lock, flags);
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4352  
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4353  	return 0;
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4354  }
5b7d70c6dbf2db drivers/usb/gadget/s3c-hsotg.c Ben Dooks          2009-06-02  4355  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

