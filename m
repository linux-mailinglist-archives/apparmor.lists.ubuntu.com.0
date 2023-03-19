Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B1E6C04FC
	for <lists+apparmor@lfdr.de>; Sun, 19 Mar 2023 21:53:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pe02F-0003VW-O0; Sun, 19 Mar 2023 20:53:47 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pdzwb-0003IT-6l
 for apparmor@lists.ubuntu.com; Sun, 19 Mar 2023 20:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bpylSVII1FYDPpIVeV+6MThI+CQatbJ+23qCa7MroYI=; b=h79wg4kJj+IQX0Ct/ULTrC7dxx
 v0HiZsAxr9rRp7MAlzrIs6Qon3wmZm355l7uwPG+9CwpJ3SVqcIllLqxIVBoQIrKj4NVoM62ach6f
 sFjamd25p6gWQDmSMtexer35BP89oCUHk6yZk8WHnAIFMegzx9Y6G5iwL5g1M5zV48U7EFd/ZXCBh
 nv9hgAc7XcvLw8zVCPpn5nakGDILXl34n1bbIamb2erFNDuFs0loLUhRTWSiIHRXWDzvzJK5W0Y2e
 2S5BIWC1xBAToDLYy8pqvRXgYTFPUeCO3nUzOC1vlEofgKDXiZeZB7ITDzKmkSu3hb0/hUo2vImMW
 hF2zuyKw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1pdzvo-007PPe-0v; Sun, 19 Mar 2023 20:47:08 +0000
Date: Sun, 19 Mar 2023 13:47:08 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <ZBd0zOqlH2H423ux@bombadil.infradead.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-9-mcgrof@kernel.org>
 <CALmYWFucv6-9yfS=gamwSsqjgxSKZS0nvVjj_QfBmsLmQD5XOQ@mail.gmail.com>
 <ZApZj9DmMYKuCQ3g@bombadil.infradead.org>
 <20230309142746.0bc649a31e76bc46fd929304@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309142746.0bc649a31e76bc46fd929304@linux-foundation.org>
X-Mailman-Approved-At: Sun, 19 Mar 2023 20:53:46 +0000
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
Cc: j.granados@samsung.com, Jeff Xu <jeffxu@google.com>, guoren@kernel.org,
 linux-csky@vger.kernel.org, dverkamp@chromium.org, baihaowen@meizu.com,
 paul@paul-moore.com, jmorris@namei.org, willy@infradead.org,
 Eric Biggers <ebiggers@kernel.org>, zhangpeng362@huawei.com,
 yzaikin@google.com, serge@hallyn.com, keescook@chromium.org,
 paulmck@kernel.org, linux-kernel@vger.kernel.org, frederic@kernel.org,
 apparmor@lists.ubuntu.com, wad@chromium.org, nixiaoming@huawei.com,
 tytso@mit.edu, sujiaxun@uniontech.com, tangmeng@uniontech.com,
 patches@lists.linux.dev, luto@amacapital.net,
 linux-security-module@vger.kernel.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 09, 2023 at 02:27:46PM -0800, Andrew Morton wrote:
> On Thu, 9 Mar 2023 14:11:27 -0800 Luis Chamberlain <mcgrof@kernel.org> wrote:
> 
> > Andrew, kernel/pid_sysctl.h is new, not on v6.3-rc1 and so I cannot
> > carry this on sysctl-next. Can you carry this patch on your tree?
> 
> Sure, no probs.

Andrew, this one patch will have to go through your tree as kernel/pid_sysctl.h
only exist on your tree. I'll drop it on my end!

Thanks!

  Luis

