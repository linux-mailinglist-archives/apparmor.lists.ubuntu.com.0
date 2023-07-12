Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1280F752913
	for <lists+apparmor@lfdr.de>; Thu, 13 Jul 2023 18:49:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qJzV1-0002cp-CS; Thu, 13 Jul 2023 16:49:03 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <rdunlap@infradead.org>) id 1qJbv2-0006t2-TW
 for apparmor@lists.ubuntu.com; Wed, 12 Jul 2023 15:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=689SEK0ciFY8KgDlRHFBreHHAC2z+cvH0wQ011Q2aMI=; b=df/VKiT91ZqRa0x7ofoJaXGlph
 PM7CRP4KkwoXZKNJlvYdkig+/LLrQ9LVGVf40H6Qaywx20JwTqHlizlUxF15FF/hdi7QMcfJ88rOM
 Tk9o3z44pMTcermnTCrLWAF39fzqRsD0ms+1lMmZtzToJzTD0SUcPG6eXBFgIigvbDeEBrSIYXiW/
 GnykGmmqxl8DWPpBQb6tfrtLGgdO7lnddHDuy7SXW0bC9E1PhpCLadB/V3QSWJPX+bNFvOifeRdsy
 3Vg5gSGOgGr74Cyg+9z9dxsezgnvq5bViTggfgF6K6g7cj7jT1ssxpJXUEt4gBcr4IJbEN74vqTce
 EZsIkLBg==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qJboy-000MRl-20; Wed, 12 Jul 2023 15:32:04 +0000
Message-ID: <03e153ce-328b-f279-2a40-4074bea2bc8f@infradead.org>
Date: Wed, 12 Jul 2023 08:31:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Jeff Layton <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621144507.55591-2-jlayton@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230621144507.55591-2-jlayton@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 13 Jul 2023 16:49:01 +0000
Subject: Re: [apparmor] [PATCH 01/79] fs: add ctime accessors infrastructure
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Jeff,

On arch/um/, (subarch i386 or x86_64), hostfs build fails with:

../fs/hostfs/hostfs_kern.c:520:36: error: incompatible type for arg
ument 2 of 'inode_set_ctime_to_ts'
../include/linux/fs.h:1499:73: note: expected 'struct timespec64' b
ut argument is of type 'const struct hostfs_timespec *'


-- 
~Randy

