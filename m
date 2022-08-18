Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 926B959A6CB
	for <lists+apparmor@lfdr.de>; Fri, 19 Aug 2022 21:56:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oP86g-00067t-9h; Fri, 19 Aug 2022 19:56:38 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <willy@infradead.org>) id 1oOgcl-0003DD-UW
 for apparmor@lists.ubuntu.com; Thu, 18 Aug 2022 14:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2AZvmHGmUWYRtU8m5E0Y2FaQ3RYx/t9Os+yxzS89zbE=; b=YYpNzkhXYjdFiNTAIrlJmpzhKN
 JcxrksfNkLVtWmxo0N7RP87fpxhFhmBWzqCGl5mTAE0vsM52rWb9WSKoULQ85A4os9R+TiOCNV87X
 dx+pCYenv4Vr2ecM2PrItSsmKhzZTCBx1ei8ZLfQ4lQjMQzlSexiV5osR/7dx/CRM3a66aB7tL2Q2
 7PUISYNqrkUoiTEC43ypjVhhkrOd6soKsf9VM44E7CEUS91i+m84oBOtJ8+BwbjidVFChlJy5Q/PE
 F1eID9xWyilIo7RkkhOXGwkHG+VLYTjd7hFqTaWn4B5/yzC/IvCatAl1QJ6r9Z0Xt5mstMYq4oypG
 B0GPw+xA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oOgcA-009t9W-K8; Thu, 18 Aug 2022 14:35:18 +0000
Date: Thu, 18 Aug 2022 15:35:18 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Yv5OJuwJq17bQDXo@casper.infradead.org>
References: <YvvBs+7YUcrzwV1a@ZenIV>
 <CAHk-=wgkNwDikLfEkqLxCWR=pLi1rbPZ5eyE8FbfmXP2=r3qcw@mail.gmail.com>
 <Yvvr447B+mqbZAoe@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yvvr447B+mqbZAoe@casper.infradead.org>
X-Mailman-Approved-At: Fri, 19 Aug 2022 19:56:37 +0000
Subject: Re: [apparmor] Switching to iterate_shared
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
Cc: jfs-discussion@lists.sourceforge.net, Hans de Goede <hdegoede@redhat.com>,
 devel@lists.orangefs.org, apparmor@lists.ubuntu.com,
 linux-unionfs@vger.kernel.org, codalist@coda.cs.cmu.edu, coda@cs.cmu.edu,
 linux-security-module@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, Namjae Jeon <linkinjeon@kernel.org>,
 ocfs2-devel@oss.oracle.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Aug 16, 2022 at 08:11:31PM +0100, Matthew Wilcox wrote:
> fs/adfs/dir_f.c:        .iterate        = adfs_f_iterate,
> fs/adfs/dir_fplus.c:    .iterate        = adfs_fplus_iterate,
> 
> ADFS is read-only, so must be safe?

I just checked ADFS.  This isn't a f_ops ->iterate, this is a special
adfs_dir_ops.  ADFS already uses f_ops->iterate_shared.


