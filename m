Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD206B5983
	for <lists+apparmor@lfdr.de>; Sat, 11 Mar 2023 09:35:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pauhJ-0002Ja-I5; Sat, 11 Mar 2023 08:35:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <ebiggers@kernel.org>) id 1paU9O-00011D-9r
 for apparmor@lists.ubuntu.com; Fri, 10 Mar 2023 04:14:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08A6360C68;
 Fri, 10 Mar 2023 04:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80602C433EF;
 Fri, 10 Mar 2023 04:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678421676;
 bh=IHYty/4GTvZcVEJLtsO716Yxd/JYXDChKqHKhiBDzHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GzXqPpoGiFMKB4yYHchwmNYtVQ7zrP/Ipp7V8pXYHvSGnBNtKOZZVN7RAlBV+5JrN
 uF9mdwNrqWIk/BT4de7XsERryKBvBUQC5YpuHhnwNtnAW/Dc20JQLyW6kkzVxCWBWo
 rdGD7iaNiurnCAnLr/vxP4WQFmB71Gxw+uSBS/vR+uKL5hGFx3lpgqd/Z8PcixUejv
 i6QAyvFIbclomubfrewfOeWSW9CY2r4zihCd2YyteQMOf93ZyBZ1b6aDQhjer9BtzM
 2Jl6xziuv99xXe15KJLp3kPmOCy600ALioiA6hTy26TsENIGNpmtgWUnru8Ok+i4J3
 Tjqe7TMYbO/vg==
Date: Thu, 9 Mar 2023 20:14:33 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZAquqQg2ZhpKL3x9@sol.localdomain>
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-9-mcgrof@kernel.org>
 <CALmYWFucv6-9yfS=gamwSsqjgxSKZS0nvVjj_QfBmsLmQD5XOQ@mail.gmail.com>
 <ZApZj9DmMYKuCQ3g@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZApZj9DmMYKuCQ3g@bombadil.infradead.org>
X-Mailman-Approved-At: Sat, 11 Mar 2023 08:35:24 +0000
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
 zhangpeng362@huawei.com, yzaikin@google.com, serge@hallyn.com,
 keescook@chromium.org, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 frederic@kernel.org, apparmor@lists.ubuntu.com, wad@chromium.org,
 nixiaoming@huawei.com, tytso@mit.edu, sujiaxun@uniontech.com,
 tangmeng@uniontech.com, patches@lists.linux.dev, luto@amacapital.net,
 linux-security-module@vger.kernel.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 09, 2023 at 02:11:27PM -0800, Luis Chamberlain wrote:
> On Thu, Mar 02, 2023 at 03:13:54PM -0800, Jeff Xu wrote:
> > On Thu, Mar 2, 2023 at 12:28 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> > >  kernel/pid_sysctl.h    | 3 +--
> > >  2 files changed, 2 insertions(+), 4 deletions(-)
> > >
> > Acked-by: Jeff Xu <jeffxu@google.com>
> 
> Andrew, kernel/pid_sysctl.h is new, not on v6.3-rc1 and so I cannot
> carry this on sysctl-next. Can you carry this patch on your tree?
> 
> I see Eric Biggers already took in the fs-verity patch, so I will drop
> that from my queue.
> 
> I can take the rest in this series.
> 
> I will also hold off on the last patch which deprecates the routine
> register_sysctl_paths() until after say the first part of the merge
> window.
> 
> This will allow all of our trees to work on linux-next without conflict.
> 
> Let me know if this is OK with you and Eric!
> 

That's fine with me.  I applied the fsverity patch based on your cover letter
that said it was okay
(https://lore.kernel.org/r/20230302202826.776286-1-mcgrof@kernel.org).  If you'd
like to take all the patches so that you can remove register_sysctl_paths() in
the same cycle, that would be fine too; it's up to you.

- Eric

