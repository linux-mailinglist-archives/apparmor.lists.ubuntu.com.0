Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80B739BB2
	for <lists+apparmor@lfdr.de>; Thu, 22 Jun 2023 11:04:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qCGEn-0007ER-Ur; Thu, 22 Jun 2023 09:04:21 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qCGEn-0007EK-93
 for apparmor@lists.ubuntu.com; Thu, 22 Jun 2023 09:04:21 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C00D13F2A1; 
 Thu, 22 Jun 2023 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1687424660;
 bh=ayzNnVsbZ0qeDBn5EvGx27yHY9+ZBPBaAooVSL1pPUY=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=dmozHwgfcnxYKNUZTPAqBT53uMVSoRswGrYTR/0vGMWQPOFBDSxQiiU3FBdG37uDj
 Ijie988tucDwwL8SgglHdSPwrNY5gHypA2dzF1yvLQ2dvVy9qXx8a5lvZdu6D8KheK
 XRhvGGJ2AokB5paiC8XSLw7bAbhAJn6SyW3fHv5nIxI1ZoYHekE22mBZogWphzK9Y3
 +wiMMhtiSr4WPuhLWq5hvl5GoA4pqOo3V8SQP6efLzUyb1fG9axShfTA5Ax22w9wbz
 Wwnl6C4Gs5wkP2tJl0kvwHNs7UxWNrUMCeNF1AYLdy8ICi8RR7pWrxwJuURZ5UP++D
 HrFdabCy8MuGg==
Message-ID: <5ab83751-e0e2-a0ef-ffd4-4bd292e8498f@canonical.com>
Date: Thu, 22 Jun 2023 02:04:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621144735.55953-1-jlayton@kernel.org>
 <20230621144735.55953-75-jlayton@kernel.org>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230621144735.55953-75-jlayton@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH 76/79] apparmor: switch to new ctime accessors
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
Cc: apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 6/21/23 07:46, Jeff Layton wrote:
> In later patches, we're going to change how the ctime.tv_nsec field is
> utilized. Switch to using accessor functions instead of raw accesses of
> inode->i_ctime.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
lgtm
Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/apparmorfs.c    | 6 +++---
>   security/apparmor/policy_unpack.c | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 3d0d370d6ffd..8c72a94dd9e3 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -226,7 +226,7 @@ static int __aafs_setup_d_inode(struct inode *dir, struct dentry *dentry,
>   
>   	inode->i_ino = get_next_ino();
>   	inode->i_mode = mode;
> -	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
> +	inode->i_atime = inode->i_mtime = inode_ctime_set_current(inode);
>   	inode->i_private = data;
>   	if (S_ISDIR(mode)) {
>   		inode->i_op = iops ? iops : &simple_dir_inode_operations;
> @@ -1557,7 +1557,7 @@ void __aafs_profile_migrate_dents(struct aa_profile *old,
>   		if (new->dents[i]) {
>   			struct inode *inode = d_inode(new->dents[i]);
>   
> -			inode->i_mtime = inode->i_ctime = current_time(inode);
> +			inode->i_mtime = inode_ctime_set_current(inode);
>   		}
>   		old->dents[i] = NULL;
>   	}
> @@ -2546,7 +2546,7 @@ static int aa_mk_null_file(struct dentry *parent)
>   
>   	inode->i_ino = get_next_ino();
>   	inode->i_mode = S_IFCHR | S_IRUGO | S_IWUGO;
> -	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
> +	inode->i_atime = inode->i_mtime = inode_ctime_set_current(inode);
>   	init_special_inode(inode, S_IFCHR | S_IRUGO | S_IWUGO,
>   			   MKDEV(MEM_MAJOR, 3));
>   	d_instantiate(dentry, inode);
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> index 4c188a44d65c..334d69b118a9 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -89,10 +89,10 @@ void __aa_loaddata_update(struct aa_loaddata *data, long revision)
>   		struct inode *inode;
>   
>   		inode = d_inode(data->dents[AAFS_LOADDATA_DIR]);
> -		inode->i_mtime = inode->i_ctime = current_time(inode);
> +		inode->i_mtime = inode_ctime_set_current(inode);
>   
>   		inode = d_inode(data->dents[AAFS_LOADDATA_REVISION]);
> -		inode->i_mtime = inode->i_ctime = current_time(inode);
> +		inode->i_mtime = inode_ctime_set_current(inode);
>   	}
>   }
>   


