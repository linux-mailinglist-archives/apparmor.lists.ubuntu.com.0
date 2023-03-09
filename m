Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4C6B337B
	for <lists+apparmor@lfdr.de>; Fri, 10 Mar 2023 02:05:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1paRCN-0000Gh-2r; Fri, 10 Mar 2023 01:05:31 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1paObQ-0000P7-7v
 for apparmor@lists.ubuntu.com; Thu, 09 Mar 2023 22:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jK36Zpm8T2on+df54b6OGLN8ramQR+T+L8HPs8R5yHE=; b=MQBnApNDuji9teSFgOuyjM3C/p
 Lgjgf584li4FUT3/bLPnV5yqTuo2UTXDrn/714v2Ip8g3XpbRRwZD7nJgpfEz6h2qyYzLRoVFAzS5
 tMd/9xsj+xvHf9pg1aj6/tfQOstrhGZ+G1zt8z2KHggdwT/JzAOm9MQzVoQv6izhooEbpCzv0yw5r
 tM+8qfELGYvw7DcEBgzyGxOP+nBEwfiCipPOReirB45OyXkLojYq6dLPJAZ2LdHzds1OUB+inU0LV
 2hzU4mCm7TVY5QLhVwYJxgZVITHlU54t7YIlOR63U6xiYpBenGFdRnv1EDD5XMZzQjyOtadrDKozg
 W7Wm31lw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1paOao-00C8rx-Vc; Thu, 09 Mar 2023 22:18:34 +0000
Date: Thu, 9 Mar 2023 14:18:34 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: ebiederm@xmission.com, keescook@chromium.org, yzaikin@google.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, minyard@acm.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, song@kernel.org, robinmholt@gmail.com,
 steve.wahl@hpe.com, mike.travis@hpe.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, jgross@suse.com,
 sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org
Message-ID: <ZApbOilWsw9Sk/k4@bombadil.infradead.org>
References: <20230302204612.782387-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302204612.782387-1-mcgrof@kernel.org>
X-Mailman-Approved-At: Fri, 10 Mar 2023 01:05:27 +0000
Subject: Re: [apparmor] [PATCH 0/7] sysctl: slowly deprecate
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
 zhangpeng362@huawei.com, linux-fsdevel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, nixiaoming@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 02, 2023 at 12:46:05PM -0800, Luis Chamberlain wrote:
> I'm happy to take these via sysctl-next [0] but since
> I don' think register_sysctl_table() will be nuked on v6.4 I think
> it's fine for each of these to go into each respective tree. I can
> pick up last stragglers on sysctl-next. If you want me to take this
> via sysctl-next too, just let me know and I'm happy to do that. Either
> way works.

As I noted I've dropped the following already-picked-up patches from
my queue:

ipmi: simplify sysctl registration
sgi-xp: simplify sysctl registration
tty: simplify sysctl registration

I've taken the rest now through sysctl-next:

scsi: simplify sysctl registration with register_sysctl()
hv: simplify sysctl registration
md: simplify sysctl registration
xen: simplify sysctl registration for balloon

If a maintainer would prefer to take one on through their
tree fine by me too, just let me know and I'll drop the patch.

  Luis

