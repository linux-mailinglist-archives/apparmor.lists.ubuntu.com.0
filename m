Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1716A8BFF
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:36:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWm-0004OH-1D; Thu, 02 Mar 2023 22:35:56 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1pXppE-0007n7-Cr
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=3oCwpVDu4xcBlhkNHBH3geMu/7Wx6m5tuk0CiJ937us=; b=oPfHzWkN8o7ub3rjHyZDbsPtuV
 7OLcJfzIoHmz3hIhOOr5kBrnrOOjnqx+vnDYKGEwImYtId4tJmI3hI7TmpRvol1qy0/js0LDSCCef
 uYyVFwuRIv+72rBzXJJL0naQqm1tyQKKt/2w75lq7w6OQGgJpvTeV7VQJ6LrUilaqMDLDtvyolKf8
 0avj6KHqtDh0Bz8fQ0U6V+osbmh5p1GVtHHfZTjtL/mGvYZwDVOByysy24tuupVVhYrVm+iTXMJtH
 iifnMDagP5WH4KcQAHvfQb48U1z36CnTuk+x2Iz2ihBwpYE8DEkqJb+70NXox4icRbETMcGAnJpzt
 8LnDrLzQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1pXpoc-003HXK-7q; Thu, 02 Mar 2023 20:46:14 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, minyard@acm.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, song@kernel.org, robinmholt@gmail.com,
 steve.wahl@hpe.com, mike.travis@hpe.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, jgross@suse.com,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org
Date: Thu,  2 Mar 2023 12:46:05 -0800
Message-Id: <20230302204612.782387-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: [apparmor] [PATCH 0/7] sysctl: slowly deprecate
	register_sysctl_table()
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
Cc: j.granados@samsung.com, linux-hyperv@vger.kernel.org,
 linux-scsi@vger.kernel.org, sujiaxun@uniontech.com, tangmeng@uniontech.com,
 apparmor@lists.ubuntu.com, patches@lists.linux.dev, willy@infradead.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, zhangpeng362@huawei.com,
 linux-fsdevel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 nixiaoming@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

As the large array of sysctls in kernel/sysctl.c is reduced we get to
the point of wanting to optimize how we register sysctls by only dealing
with flat simple structures, with no subdirectories. In particular the
last empty element should not be needed. We'll get there, and save some
memory, but as we move forward that path will be come the more relevant
path to use in the sysctl registration. It is much simpler as it avoids
recursion.

Turns out we can also convert existing users of register_sysctl_table()
which just need their subdirectories created for them. This effort
addresses most users of register_sysctl_table() in drivers/ except
parport -- that needs a bit more review.

This is part of the process to deprecate older sysctl users which uses
APIs which can incur recursion, but don't need it [0]. This is the
second effort.

Yes -- we'll get to the point *each* of these conversions means saving
one empty syctl, but that change needs a bit more careful review before
merging. But since these conversion are also deleting tables for
subdirectories, the delta in size of the kernel should not incrase
really.

The most complex change is the sgi-xp change which does deal with
a case where we have a subdirectory with an entry, I just split
that in two registrations. No point in keeping recursion just for
a few minor if we can simplify code around. More eyeballs / review /
testing on that change is appreciated.

Sending these out early so they can get tested properly early on
linux-next. I'm happy to take these via sysctl-next [0] but since
I don' think register_sysctl_table() will be nuked on v6.4 I think
it's fine for each of these to go into each respective tree. I can
pick up last stragglers on sysctl-next. If you want me to take this
via sysctl-next too, just let me know and I'm happy to do that. Either
way works.

[0] https://lkml.kernel.org/r/20230302202826.776286-1-mcgrof@kernel.org

Luis Chamberlain (7):
  scsi: simplify sysctl registration with register_sysctl()
  ipmi: simplify sysctl registration
  hv: simplify sysctl registration
  md: simplify sysctl registration
  sgi-xp: simplify sysctl registration
  tty: simplify sysctl registration
  xen: simplify sysctl registration for balloon

 drivers/char/ipmi/ipmi_poweroff.c | 16 +---------------
 drivers/hv/vmbus_drv.c            | 11 +----------
 drivers/md/md.c                   | 22 +---------------------
 drivers/misc/sgi-xp/xpc_main.c    | 24 ++++++++++--------------
 drivers/scsi/scsi_sysctl.c        | 16 +---------------
 drivers/tty/tty_io.c              | 20 +-------------------
 drivers/xen/balloon.c             | 20 +-------------------
 7 files changed, 16 insertions(+), 113 deletions(-)

-- 
2.39.1


