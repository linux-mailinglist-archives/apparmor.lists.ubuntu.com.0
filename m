Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 750AE74E929
	for <lists+apparmor@lfdr.de>; Tue, 11 Jul 2023 10:32:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qJ8nJ-0003dG-PE; Tue, 11 Jul 2023 08:32:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1qIq7g-0007di-Hd
 for apparmor@lists.ubuntu.com; Mon, 10 Jul 2023 12:36:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E95360FE3;
 Mon, 10 Jul 2023 12:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3A7C433CB;
 Mon, 10 Jul 2023 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688992570;
 bh=H2xgbjqXpjCIL1YrRX5e2Lm0dCE6nhNpxkhLzNT5ua0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GYBFwi445q0lt0ZphYZpLmOt5wR+meJbqPSRhxet7P0iiPRYgnHSi9LobGg38wRHk
 YRw3H+QXcyvvByqsJ+4wCmkCN6cf2UfzMYa1sqxLulNzp2UeGTyc0ij28Jne5oQ1T1
 3RwWXPXG0ww5I/wkFqIbXj1fKOk/tlA6pnousvcLf4fNGPnso9ohJABAD43u0T4XNZ
 4qx5bhLf1Dg7cYvF3ikt77ixrICUwaQpwn/PA/WiTF+kWZvjsjd1ey6AFXxc5U5x4u
 9w1gOuNArxobHqFss0Ukd6pKRPqY5GTMTdaOCIUwXl2G+JmZTqpL3AJhz3XT+Fb/gm
 tN6yuNjSBVu7g==
Date: Mon, 10 Jul 2023 14:35:28 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230710-zudem-entkam-bb508cbd8c78@brauner>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <5e40891f6423feb5b68f025e31f26e9a50ae9390.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5e40891f6423feb5b68f025e31f26e9a50ae9390.camel@kernel.org>
X-Mailman-Approved-At: Tue, 11 Jul 2023 08:32:24 +0000
Subject: Re: [apparmor] [PATCH v2 00/89] fs: new accessors for inode->i_ctime
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
Cc: lucho@ionkov.net, rafael@kernel.org, djwong@kernel.org, al@alarsen.net,
 cmllamas@google.com, andrii@kernel.org, hughd@google.com,
 agordeev@linux.ibm.com, hch@lst.de, hubcap@omnibond.com, pc@manguebit.com,
 linux-xfs@vger.kernel.org, bvanassche@acm.org, jeffxu@chromium.org,
 mpe@ellerman.id.au, john@keeping.me.uk, yi.zhang@huawei.com, jmorris@namei.org,
 christophe.leroy@csgroup.eu, code@tyhicks.com, stern@rowland.harvard.edu,
 borntraeger@linux.ibm.com, devel@lists.orangefs.org, mirimmad17@gmail.com,
 sprasad@microsoft.com, jaharkes@cs.cmu.edu, linux-um@lists.infradead.org,
 npiggin@gmail.com, viro@zeniv.linux.org.uk, ericvh@kernel.org,
 surenb@google.com, trond.myklebust@hammerspace.com, anton@tuxera.com,
 wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
 stephen.smalley.work@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, lsahlber@redhat.com, senozhatsky@chromium.org,
 arve@android.com, chuck.lever@oracle.com, svens@linux.ibm.com,
 jolsa@kernel.org, jack@suse.com, tj@kernel.org, akpm@linux-foundation.org,
 linux-trace-kernel@vger.kernel.org, xu.xin16@zte.com.cn, shaggy@kernel.org,
 dhavale@google.com, penguin-kernel@I-love.SAKURA.ne.jp, zohar@linux.ibm.com,
 linux-mm@kvack.org, joel@joelfernandes.org, edumazet@google.com,
 sdf@google.com, jomajm@gmail.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, paul@paul-moore.com, rituagar@linux.ibm.com,
 john.fastabend@gmail.com, mcgrof@kernel.org, chi.minghao@zte.com.cn,
 codalist@coda.cs.cmu.edu, selinux@vger.kernel.org, zhangpeng362@huawei.com,
 quic_ugoswami@quicinc.com, yhs@fb.com, yzaikin@google.com,
 linkinjeon@kernel.org, mhiramat@kernel.org, ecryptfs@vger.kernel.org,
 tkjos@android.com, madkar@cs.stonybrook.edu, gor@linux.ibm.com,
 yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, miklos@szeredi.hu, huyue2@coolpad.com,
 jaegeuk@kernel.org, gargaditya08@live.com, maco@android.com,
 hirofumi@mail.parknet.co.jp, haoluo@google.com, tony.luck@intel.com,
 tytso@mit.edu, nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net,
 muchun.song@linux.dev, roberto.sassu@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn,
 gpiccoli@igalia.com, ebiederm@xmission.com, anna@kernel.org,
 quic_uaggarwa@quicinc.com, bwarrum@linux.ibm.com, mike.kravetz@oracle.com,
 jingyuwang_vip@163.com, linux-efi@vger.kernel.org, error27@gmail.com,
 martin@omnibond.com, trix@redhat.com, ocfs2-devel@lists.linux.dev,
 ast@kernel.org, sebastian.reichel@collabora.com, clm@fb.com,
 linux-mtd@lists.infradead.org, willy@infradead.org, marc.dionne@auristor.com,
 linux-afs@lists.infradead.org, raven@themaw.net, naohiro.aota@wdc.com,
 daniel@iogearbox.net, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, quic_linyyuan@quicinc.com, coda@cs.cmu.edu,
 slava@dubeyko.com, idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com,
 serge@hallyn.com, chengzhihao1@huawei.com, axboe@kernel.dk, amir73il@gmail.com,
 linuszeng@tencent.com, keescook@chromium.org, arnd@arndb.de,
 autofs@vger.kernel.org, rostedt@goodmis.org, yifeliu@cs.stonybrook.edu,
 dlemoal@kernel.org, eparis@parisplace.org, ceph-devel@vger.kernel.org,
 xiang@kernel.org, yijiangshan@kylinos.cn, dhowells@redhat.com,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, kolga@netapp.com,
 song@kernel.org, samba-technical@lists.samba.org, sfrench@samba.org,
 jk@ozlabs.org, netdev@vger.kernel.org, rpeterso@redhat.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, davem@davemloft.net,
 jfs-discussion@lists.sourceforge.net, princekumarmaurya06@gmail.com,
 ebiggers@google.com, neilb@suse.de, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, me@bobcopeland.com, kpsingh@kernel.org,
 okanatov@gmail.com, almaz.alexandrovich@paragon-software.com,
 joseph.qi@linux.alibaba.com, hayama@lineo.co.jp, adilger.kernel@dilger.ca,
 mikulas@artax.karlin.mff.cuni.cz, shaozhengchao@huawei.com,
 chenzhongjin@huawei.com, ardb@kernel.org, anton.ivanov@cambridgegreys.com,
 agruenba@redhat.com, richard@nod.at, mark@fasheh.com, shr@devkernel.io,
 Dai.Ngo@oracle.com, cluster-devel@redhat.com, jgg@ziepe.ca, kuba@kernel.org,
 riel@surriel.com, salah.triki@gmail.com, dushistov@mail.ru,
 linux-cifs@vger.kernel.org, hca@linux.ibm.com, chao@kernel.org,
 apparmor@lists.ubuntu.com, josef@toxicpanda.com, Liam.Howlett@Oracle.com,
 tom@talpey.com, hdegoede@redhat.com, linux-hardening@vger.kernel.org,
 aivazian.tigran@gmail.com, dchinner@redhat.com, dsterba@suse.com,
 xiubli@redhat.com, konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org,
 leon@kernel.org, luisbg@kernel.org, martin.lau@linux.dev, v9fs@lists.linux.dev,
 fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org, lrh2000@pku.edu.cn,
 linux-security-module@vger.kernel.org, ezk@cs.stonybrook.edu,
 jefflexu@linux.alibaba.com, linux@treblig.org, hannes@cmpxchg.org,
 phillip@squashfs.org.uk, johannes@sipsolutions.net, sj1557.seo@samsung.com,
 dwmw2@infradead.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, jlbec@evilplan.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Jul 07, 2023 at 08:42:31AM -0400, Jeff Layton wrote:
> On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote:
> > v2:
> > - prepend patches to add missing ctime updates
> > - add simple_rename_timestamp helper function
> > - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_*
> > - drop individual inode_ctime_set_{sec,nsec} helpers
> > 
> 
> After review by Jan and others, and Jan's ext4 rework, the diff on top
> of the series I posted a couple of days ago is below. I don't really
> want to spam everyone with another ~100 patch v3 series, but I can if
> you think that's best.
> 
> Christian, what would you like me to do here?

I picked up the series from the list and folded the fixups you posted
here into the respective fs conversion patches. I hope that helps you
avoid a resend. You should have received a separate "thank you" mail for
all of this.

To each patch that I folded one of the fixlets from below into I added a
git note that records a link to your mail here and the respective patch
hunk from this mail that I folded into the patch. git.kernel.org will
show notes by default. For example,
https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/commit/?h=vfs.ctime&id=8b0e3c2e99004609a16ba145bcbdfdddb78e220e
should show you the note I added. You can also fetch them via
git fetch $remote refs/notes/*:refs/notes/*
(You probably know that ofc but jic.) if you're interested.

Based on v6.5-rc1 as of today.

Btw, both b4 and patchwork somehow treat the series in weird was.
IOW, based on the message id of the cover letter I was able to pull most
messages except for:

[07/92] fs: add ctime accessors infrastructure
[08/92] fs: new helper: simple_rename_timestamp
[92/92] fs: rename i_ctime field to __i_ctime

which I pulled in separately. Not sure what the cause of this is.

