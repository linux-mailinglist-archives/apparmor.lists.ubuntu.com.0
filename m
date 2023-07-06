Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2074A020
	for <lists+apparmor@lfdr.de>; Thu,  6 Jul 2023 16:57:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qHQPx-0001Ci-V4; Thu, 06 Jul 2023 14:57:13 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jack@suse.cz>) id 1qHQPw-0001CK-4H
 for apparmor@lists.ubuntu.com; Thu, 06 Jul 2023 14:57:12 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D95081F88F;
 Thu,  6 Jul 2023 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1688655431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NJEM6bD3baXfKwVmrUUZvxYT3AKqRBG+HXOO4JRx2k0=;
 b=P6Fui+t4vyteVR038WrkFSmdUkghFdvgIPL13ylpec9zRRxuuIdZPsch9fWFrjaLfj6c1/
 gBTJXEe+iRDhXv/I3gZct5M/9bT9p9WJPtjPibW6hvnmzP3lZcUYxHgxm7sNHhXOiplhC1
 MHhnN8DKKOJAreIorTawfZI6C8xHle4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1688655431;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NJEM6bD3baXfKwVmrUUZvxYT3AKqRBG+HXOO4JRx2k0=;
 b=EHsWZw93r7MnEk131Nf6ZZrIx0Ar3jCQjLdBqNT4Dj/cgWVA7OZgiOLowuFnasJWAXWOOI
 hlwMbfUTl9rlokCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C7232138FC;
 Thu,  6 Jul 2023 14:57:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KVWQMEfWpmTDBQAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 06 Jul 2023 14:57:11 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 525C1A0707; Thu,  6 Jul 2023 16:57:11 +0200 (CEST)
Date: Thu, 6 Jul 2023 16:57:11 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230706145711.qq6lpczp5zjv7lva@quack3>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-87-jlayton@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705190309.579783-87-jlayton@kernel.org>
Subject: Re: [apparmor] [PATCH v2 89/92] apparmor: convert to ctime accessor
	functions
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed 05-07-23 15:01:54, Jeff Layton wrote:
> In later patches, we're going to change how the inode's ctime field is
> used. Switch to using accessor functions instead of raw accesses of
> inode->i_ctime.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  security/apparmor/apparmorfs.c    | 6 +++---
>  security/apparmor/policy_unpack.c | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 3d0d370d6ffd..7dbd0a5aaeeb 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -226,7 +226,7 @@ static int __aafs_setup_d_inode(struct inode *dir, struct dentry *dentry,
>  
>  	inode->i_ino = get_next_ino();
>  	inode->i_mode = mode;
> -	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
> +	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
>  	inode->i_private = data;
>  	if (S_ISDIR(mode)) {
>  		inode->i_op = iops ? iops : &simple_dir_inode_operations;
> @@ -1557,7 +1557,7 @@ void __aafs_profile_migrate_dents(struct aa_profile *old,
>  		if (new->dents[i]) {
>  			struct inode *inode = d_inode(new->dents[i]);
>  
> -			inode->i_mtime = inode->i_ctime = current_time(inode);
> +			inode->i_mtime = inode_set_ctime_current(inode);
>  		}
>  		old->dents[i] = NULL;
>  	}
> @@ -2546,7 +2546,7 @@ static int aa_mk_null_file(struct dentry *parent)
>  
>  	inode->i_ino = get_next_ino();
>  	inode->i_mode = S_IFCHR | S_IRUGO | S_IWUGO;
> -	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
> +	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
>  	init_special_inode(inode, S_IFCHR | S_IRUGO | S_IWUGO,
>  			   MKDEV(MEM_MAJOR, 3));
>  	d_instantiate(dentry, inode);
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> index ed180722a833..8b8846073e14 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -89,10 +89,10 @@ void __aa_loaddata_update(struct aa_loaddata *data, long revision)
>  		struct inode *inode;
>  
>  		inode = d_inode(data->dents[AAFS_LOADDATA_DIR]);
> -		inode->i_mtime = inode->i_ctime = current_time(inode);
> +		inode->i_mtime = inode_set_ctime_current(inode);
>  
>  		inode = d_inode(data->dents[AAFS_LOADDATA_REVISION]);
> -		inode->i_mtime = inode->i_ctime = current_time(inode);
> +		inode->i_mtime = inode_set_ctime_current(inode);
>  	}
>  }
>  
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

