Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C94DE596CFF
	for <lists+apparmor@lfdr.de>; Wed, 17 Aug 2022 12:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oOGdG-0004t7-4p; Wed, 17 Aug 2022 10:50:42 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <willy@infradead.org>) id 1oO1yv-0005FQ-8A
 for apparmor@lists.ubuntu.com; Tue, 16 Aug 2022 19:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=j3XcZj58ibAYo7JZ+DBGHbio8/+pmx+vaIAoYTPhszo=; b=C3ggZZuTRiGe+co72VGz5WtuLJ
 dEtZCyVzUM/eFKokG1H5+2fq5HnCQW1/XI3EnYPaBS8QQO9lxUZ1VUrcCmag9//Qh8vNBLfpz1mMI
 wPIz1JuLFLurE6ZIBrsfqaJgC46BC+tsi/iCNppteb7Iq1x5WwTqSgflaHVjt80Oo7N5zxT3TE7ME
 D47v+hXMewesjsDdRS0l90YMCI+ctr26b2bcQMrDuMV6Ik31zqsKLqtPZE7xiBkUAxOrYhr8aM+3U
 v9TQa3ty7tM2bpDblyqo+kJk2VdOjZI+nsGlYX6risKRNaTbeuVXpiySdoN5yJ2RptQrlEc7NFx1l
 ZR3SyIng==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oO1yO-007GSa-01; Tue, 16 Aug 2022 19:11:32 +0000
Date: Tue, 16 Aug 2022 20:11:31 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Yvvr447B+mqbZAoe@casper.infradead.org>
References: <YvvBs+7YUcrzwV1a@ZenIV>
 <CAHk-=wgkNwDikLfEkqLxCWR=pLi1rbPZ5eyE8FbfmXP2=r3qcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgkNwDikLfEkqLxCWR=pLi1rbPZ5eyE8FbfmXP2=r3qcw@mail.gmail.com>
X-Mailman-Approved-At: Wed, 17 Aug 2022 10:50:40 +0000
Subject: [apparmor] Switching to iterate_shared
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

On Tue, Aug 16, 2022 at 11:58:36AM -0700, Linus Torvalds wrote:
> That said, our filldir code is still confusing as hell. And I would
> really like to see that "shared vs non-shared" iterator thing go away,
> with everybody using the shared one - and filesystems that can't deal
> with it using their own lock.
> 
> But that's a completely independent wart in our complicated filldir saga.
> 
> But if somebody were to look at that iterate-vs-iterate_shared, that
> would be lovely. A quick grep shows that we don't have *that* many of
> the non-shared cases left:
> 
>       git grep '\.iterate\>.*='
> 
> seems to imply that converting them to a "use my own load" wouldn't be
> _too_ bad.
> 
> And some of them might actually be perfectly ok with the shared
> semantics (ie inode->i_rwsem held just for reading) and they just were
> never converted originally.

What's depressing is that some of these are newly added.  It'd be
great if we could attach something _like_ __deprecated to things
that checkpatch could pick up on.

fs/adfs/dir_f.c:        .iterate        = adfs_f_iterate,
fs/adfs/dir_fplus.c:    .iterate        = adfs_fplus_iterate,

ADFS is read-only, so must be safe?

fs/ceph/dir.c:  .iterate = ceph_readdir,
fs/ceph/dir.c:  .iterate = ceph_readdir,

At least CEPH has active maintainers, cc'd

fs/coda/dir.c:  .iterate        = coda_readdir,

Would anyone notice if we broke CODA?  Maintainers cc'd anyway.

fs/exfat/dir.c: .iterate        = exfat_iterate,

Exfat is a new addition, but has active maintainers.

fs/jfs/namei.c: .iterate        = jfs_readdir,

Maintainer cc'd

fs/ntfs/dir.c:  .iterate        = ntfs_readdir,         /* Read directory contents. */

Maybe we can get rid of ntfs soon.

fs/ocfs2/file.c:        .iterate        = ocfs2_readdir,
fs/ocfs2/file.c:        .iterate        = ocfs2_readdir,

maintainers cc'd

fs/orangefs/dir.c:      .iterate = orangefs_dir_iterate,

New; maintainer cc'd

fs/overlayfs/readdir.c: .iterate        = ovl_iterate,

Active maintainer, cc'd

fs/proc/base.c: .iterate        = proc_##LSM##_attr_dir_iterate, \

Hmm.  We need both SMACK and Apparmor to agree to this ... cc's added.

fs/vboxsf/dir.c:        .iterate = vboxsf_dir_iterate,

Also newly added.  Maintainer cc'd.

