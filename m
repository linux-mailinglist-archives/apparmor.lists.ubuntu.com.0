Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9782D6B337D
	for <lists+apparmor@lfdr.de>; Fri, 10 Mar 2023 02:05:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1paRCL-0000GX-0p; Fri, 10 Mar 2023 01:05:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <akpm@linux-foundation.org>) id 1paOjo-0000n4-Ej
 for apparmor@lists.ubuntu.com; Thu, 09 Mar 2023 22:27:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0F474CE22A6;
 Thu,  9 Mar 2023 22:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4FCC433D2;
 Thu,  9 Mar 2023 22:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1678400868;
 bh=8ypCYFnJ44r5UZkUrRg3YEA023GJRxYOCkGkfnGE1rI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LrikRTauMWxorofVtFJUp/PBs3uUKJgK6V3mYsnNSRpNYK3BImPEY6YjP0wUhuNLo
 QUcCIZjm8X/yGI8zhtzvFEKQfPm8e6WopsnDGU3LdJNXEddBFgUuPDHeh0wO6LzEMt
 h43MST25WcQmDjkkaZBS2Wsit/I/gAU1diaptB9Q=
Date: Thu, 9 Mar 2023 14:27:46 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-Id: <20230309142746.0bc649a31e76bc46fd929304@linux-foundation.org>
In-Reply-To: <ZApZj9DmMYKuCQ3g@bombadil.infradead.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-9-mcgrof@kernel.org>
 <CALmYWFucv6-9yfS=gamwSsqjgxSKZS0nvVjj_QfBmsLmQD5XOQ@mail.gmail.com>
 <ZApZj9DmMYKuCQ3g@bombadil.infradead.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 9 Mar 2023 14:11:27 -0800 Luis Chamberlain <mcgrof@kernel.org> wrote:

> Andrew, kernel/pid_sysctl.h is new, not on v6.3-rc1 and so I cannot
> carry this on sysctl-next. Can you carry this patch on your tree?

Sure, no probs.

