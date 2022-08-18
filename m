Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AA2598868
	for <lists+apparmor@lfdr.de>; Thu, 18 Aug 2022 18:14:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oOi9y-0002dW-J7; Thu, 18 Aug 2022 16:14:18 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oOi9x-0002dH-82
 for apparmor@lists.ubuntu.com; Thu, 18 Aug 2022 16:14:17 +0000
Received: from [10.0.0.100]
 (cpe5896308f56e8-cm5896308f56e6.cpe.net.cable.rogers.com [99.255.30.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 104733F127; 
 Thu, 18 Aug 2022 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1660839256;
 bh=YZZSkhT+TTALwtfUjy6aWTR//Rq9MQ2cQ72rzDjTaGo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=eKZn0EnaLQ3LPA55KId1jrSyN9QJDFoGajfUjb4kCVLZw+GJfPoyEZk5YsBGY9MBs
 BD5uhH5otcM+iD4WwVifrNr5NL1BUfcSMeQnhx/CHDs9NWQTtQwx1gGwhuoQTCfKMQ
 uST4xRWXm8MKtsgcqv+2mfMMUaoVq3HafCDVAbqHwknm58OvYYcZd9zEcvuHOCriAW
 5f5enAoNjxCzorVuGXsIE8HVJabgP9KqXKSRwJtYh0VtfpPArngeXisaJpK+yDOAEe
 WaTsYv22CXUAmrDXOQbGO1R7EFcMRumQCCw3nOo7oiJ1DQDXooj3VDnRI/oZGvfm7y
 iW9MAUvGRwJEw==
Message-ID: <dc966283-d0b9-b411-0792-c8553b948c2e@canonical.com>
Date: Thu, 18 Aug 2022 09:14:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <YvvBs+7YUcrzwV1a@ZenIV>
 <CAHk-=wgkNwDikLfEkqLxCWR=pLi1rbPZ5eyE8FbfmXP2=r3qcw@mail.gmail.com>
 <Yvvr447B+mqbZAoe@casper.infradead.org>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <Yvvr447B+mqbZAoe@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: jfs-discussion@lists.sourceforge.net, coda@cs.cmu.edu,
 apparmor@lists.ubuntu.com, linux-unionfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Hans de Goede <hdegoede@redhat.com>,
 linux-security-module@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 Namjae Jeon <linkinjeon@kernel.org>, devel@lists.orangefs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 8/16/22 12:11, Matthew Wilcox wrote:
> On Tue, Aug 16, 2022 at 11:58:36AM -0700, Linus Torvalds wrote:
>> That said, our filldir code is still confusing as hell. And I would
>> really like to see that "shared vs non-shared" iterator thing go away,
>> with everybody using the shared one - and filesystems that can't deal
>> with it using their own lock.
>>
>> But that's a completely independent wart in our complicated filldir saga.
>>
>> But if somebody were to look at that iterate-vs-iterate_shared, that
>> would be lovely. A quick grep shows that we don't have *that* many of
>> the non-shared cases left:
>>
>>        git grep '\.iterate\>.*='
>>
>> seems to imply that converting them to a "use my own load" wouldn't be
>> _too_ bad.
>>
>> And some of them might actually be perfectly ok with the shared
>> semantics (ie inode->i_rwsem held just for reading) and they just were
>> never converted originally.
> 
> What's depressing is that some of these are newly added.  It'd be
> great if we could attach something _like_ __deprecated to things
> that checkpatch could pick up on.
> 
> fs/adfs/dir_f.c:        .iterate        = adfs_f_iterate,
> fs/adfs/dir_fplus.c:    .iterate        = adfs_fplus_iterate,
> 
> ADFS is read-only, so must be safe?
> 
> fs/ceph/dir.c:  .iterate = ceph_readdir,
> fs/ceph/dir.c:  .iterate = ceph_readdir,
> 
> At least CEPH has active maintainers, cc'd
> 
> fs/coda/dir.c:  .iterate        = coda_readdir,
> 
> Would anyone notice if we broke CODA?  Maintainers cc'd anyway.
> 
> fs/exfat/dir.c: .iterate        = exfat_iterate,
> 
> Exfat is a new addition, but has active maintainers.
> 
> fs/jfs/namei.c: .iterate        = jfs_readdir,
> 
> Maintainer cc'd
> 
> fs/ntfs/dir.c:  .iterate        = ntfs_readdir,         /* Read directory contents. */
> 
> Maybe we can get rid of ntfs soon.
> 
> fs/ocfs2/file.c:        .iterate        = ocfs2_readdir,
> fs/ocfs2/file.c:        .iterate        = ocfs2_readdir,
> 
> maintainers cc'd
> 
> fs/orangefs/dir.c:      .iterate = orangefs_dir_iterate,
> 
> New; maintainer cc'd
> 
> fs/overlayfs/readdir.c: .iterate        = ovl_iterate,
> 
> Active maintainer, cc'd
> 
> fs/proc/base.c: .iterate        = proc_##LSM##_attr_dir_iterate, \
> 
> Hmm.  We need both SMACK and Apparmor to agree to this ... cc's added.

This is fine for AppArmor


> 
> fs/vboxsf/dir.c:        .iterate = vboxsf_dir_iterate,
> 
> Also newly added.  Maintainer cc'd.
> 


