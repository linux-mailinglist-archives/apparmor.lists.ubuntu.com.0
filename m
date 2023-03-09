Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A8A6B337C
	for <lists+apparmor@lfdr.de>; Fri, 10 Mar 2023 02:05:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1paRCK-0000GR-U7; Fri, 10 Mar 2023 01:05:28 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1paOUd-0008Mk-EB
 for apparmor@lists.ubuntu.com; Thu, 09 Mar 2023 22:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
 bh=0Iy5i1KRt9BRu51UqkHEc8TWm2Sma1QI6oHERNxIFTE=; b=4avk2FIZAloQ6Je2ulx3/bhxiD
 KZ0Rb78uqiP3BhAhEbXxg+9ZAm7d8f7Bk8zJDQw1jeCBK6hshVwpaUDpWh0wr1ubr+P6j656/rTo+
 NEcAbZGe1ztYqtdFZVe9HZJaK8qentKzwQ34m3yiHt7K6h9fBlaaiqPOlw4bA1bdbdIcYwTLfFJMd
 5RIH2wnpqdyASvO8vvmzKSS07e0mXlLEcGiWhoY30d7FBmgLBQrKZgHiaCKOLji1IhrrFivzc2Wqz
 JrT9bLZ/l4Mw3pDNSibfSLYuQ6r9YLlB+uqSCswBw6H0KXPLAnWTGvDUHL4iOMEE+cDBPl+pKiy2I
 JoQR9yDQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1paOTv-00C7rj-Sk; Thu, 09 Mar 2023 22:11:27 +0000
Date: Thu, 9 Mar 2023 14:11:27 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Jeff Xu <jeffxu@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Eric Biggers <ebiggers@kernel.org>
Message-ID: <ZApZj9DmMYKuCQ3g@bombadil.infradead.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-9-mcgrof@kernel.org>
 <CALmYWFucv6-9yfS=gamwSsqjgxSKZS0nvVjj_QfBmsLmQD5XOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALmYWFucv6-9yfS=gamwSsqjgxSKZS0nvVjj_QfBmsLmQD5XOQ@mail.gmail.com>
X-Mailman-Approved-At: Fri, 10 Mar 2023 01:05:27 +0000
Subject: Re: [apparmor] [PATCH 08/11] kernel: pid_namespace: simplify
 sysctls with register_sysctl()
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
Cc: j.granados@samsung.com, linux-kernel@vger.kernel.org, guoren@kernel.org,
 linux-csky@vger.kernel.org, dverkamp@chromium.org, baihaowen@meizu.com,
 paul@paul-moore.com, jmorris@namei.org, willy@infradead.org,
 ebiggers@kernel.org, zhangpeng362@huawei.com, yzaikin@google.com,
 serge@hallyn.com, keescook@chromium.org, paulmck@kernel.org,
 frederic@kernel.org, apparmor@lists.ubuntu.com, wad@chromium.org,
 nixiaoming@huawei.com, tytso@mit.edu, sujiaxun@uniontech.com,
 tangmeng@uniontech.com, patches@lists.linux.dev, luto@amacapital.net,
 linux-security-module@vger.kernel.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 02, 2023 at 03:13:54PM -0800, Jeff Xu wrote:
> On Thu, Mar 2, 2023 at 12:28 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >  kernel/pid_sysctl.h    | 3 +--
> >  2 files changed, 2 insertions(+), 4 deletions(-)
> >
> Acked-by: Jeff Xu <jeffxu@google.com>

Andrew, kernel/pid_sysctl.h is new, not on v6.3-rc1 and so I cannot
carry this on sysctl-next. Can you carry this patch on your tree?

I see Eric Biggers already took in the fs-verity patch, so I will drop
that from my queue.

I can take the rest in this series.

I will also hold off on the last patch which deprecates the routine
register_sysctl_paths() until after say the first part of the merge
window.

This will allow all of our trees to work on linux-next without conflict.

Let me know if this is OK with you and Eric!

  Luis

