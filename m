Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F06A8C4E
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:56:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrqj-0006P6-R2; Thu, 02 Mar 2023 22:56:33 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pXrqg-0006OA-KK
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 22:56:30 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 419E23F301; 
 Thu,  2 Mar 2023 22:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1677797788;
 bh=7bAi7GvlLZqPDpdIMXt0Yd4XZ6qIgEVOlEjLpx+UniI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=JF0zItZu8a/QA+CEzhwTb0M4jJwxjdquCHP+lb8lwhiseRuxzR9VRYQcjbxN0cEe+
 qpMubuEgJq7A9WgWbB6zgOLQmiINIic57ynnFeUgSvCLcaSpVRWhVs1LYZgR8+c0u4
 4KWrQCKMwTF88x75z/mwqtccDRh/bRWkB3VAy0yh8oGLxxsaubAcybs6qs2lguX0L4
 LuSMDcJ4GhQL+lnM9+88jmrIQ1ajtPOwfpYpMnmg5Q9o4jngcYL/gqSDtViaaWR+NW
 QYgrY1PTAGS0HHLxZYM+E9YEC4J36i31Sm+Q8e9V8CQ3fRQyyeQEzVY+BrGofC8oTj
 tVOvO6YAWFmvA==
Message-ID: <e97bf2c2-6879-de79-1e07-276bc2192d6e@canonical.com>
Date: Thu, 2 Mar 2023 14:56:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Luis Chamberlain <mcgrof@kernel.org>, ebiederm@xmission.com,
 keescook@chromium.org, yzaikin@google.com, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, luto@amacapital.net, wad@chromium.org,
 dverkamp@chromium.org, paulmck@kernel.org, baihaowen@meizu.com,
 frederic@kernel.org, jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,
 guoren@kernel.org
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-3-mcgrof@kernel.org>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230302202826.776286-3-mcgrof@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH 02/11] proc_sysctl: move helper which creates
 required subdirectories
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
Cc: j.granados@samsung.com, sujiaxun@uniontech.com, tangmeng@uniontech.com,
 apparmor@lists.ubuntu.com, patches@lists.linux.dev, willy@infradead.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-csky@vger.kernel.org, zhangpeng362@huawei.com,
 linux-fsdevel@vger.kernel.org, nixiaoming@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 3/2/23 12:28, Luis Chamberlain wrote:
> Move the code which creates the subdirectories for a ctl table
> into a helper routine so to make it easier to review. Document
> the goal.
> 
> This creates no functional changes.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Reviewed-by: John Johansen <john.johansen@canonical.com>

> ---
>   fs/proc/proc_sysctl.c | 56 ++++++++++++++++++++++++-------------------
>   1 file changed, 32 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
> index 1df0beb50dbe..6b9b2694d430 100644
> --- a/fs/proc/proc_sysctl.c
> +++ b/fs/proc/proc_sysctl.c
> @@ -1283,6 +1283,35 @@ static int insert_links(struct ctl_table_header *head)
>   	return err;
>   }
>   
> +/* Find the directory for the ctl_table. If one is not found create it. */
> +static struct ctl_dir *sysctl_mkdir_p(struct ctl_dir *dir, const char *path)
> +{
> +	const char *name, *nextname;
> +
> +	for (name = path; name; name = nextname) {
> +		int namelen;
> +		nextname = strchr(name, '/');
> +		if (nextname) {
> +			namelen = nextname - name;
> +			nextname++;
> +		} else {
> +			namelen = strlen(name);
> +		}
> +		if (namelen == 0)
> +			continue;
> +
> +		/*
> +		 * namelen ensures if name is "foo/bar/yay" only foo is
> +		 * registered first. We traverse as if using mkdir -p and
> +		 * return a ctl_dir for the last directory entry.
> +		 */
> +		dir = get_subdir(dir, name, namelen);
> +		if (IS_ERR(dir))
> +			break;
> +	}
> +	return dir;
> +}
> +
>   /**
>    * __register_sysctl_table - register a leaf sysctl table
>    * @set: Sysctl tree to register on
> @@ -1334,7 +1363,6 @@ struct ctl_table_header *__register_sysctl_table(
>   {
>   	struct ctl_table_root *root = set->dir.header.root;
>   	struct ctl_table_header *header;
> -	const char *name, *nextname;
>   	struct ctl_dir *dir;
>   	struct ctl_table *entry;
>   	struct ctl_node *node;
> @@ -1359,29 +1387,9 @@ struct ctl_table_header *__register_sysctl_table(
>   	dir->header.nreg++;
>   	spin_unlock(&sysctl_lock);
>   
> -	/* Find the directory for the ctl_table */
> -	for (name = path; name; name = nextname) {
> -		int namelen;
> -		nextname = strchr(name, '/');
> -		if (nextname) {
> -			namelen = nextname - name;
> -			nextname++;
> -		} else {
> -			namelen = strlen(name);
> -		}
> -		if (namelen == 0)
> -			continue;
> -
> -		/*
> -		 * namelen ensures if name is "foo/bar/yay" only foo is
> -		 * registered first. We traverse as if using mkdir -p and
> -		 * return a ctl_dir for the last directory entry.
> -		 */
> -		dir = get_subdir(dir, name, namelen);
> -		if (IS_ERR(dir))
> -			goto fail;
> -	}
> -
> +	dir = sysctl_mkdir_p(dir, path);
> +	if (IS_ERR(dir))
> +		goto fail;
>   	spin_lock(&sysctl_lock);
>   	if (insert_header(dir, header))
>   		goto fail_put_dir_locked;


