Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 819356B357C
	for <lists+apparmor@lfdr.de>; Fri, 10 Mar 2023 05:17:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1paUBt-0001hv-J3; Fri, 10 Mar 2023 04:17:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <ebiggers@kernel.org>) id 1paUBr-0001ho-Rf
 for apparmor@lists.ubuntu.com; Fri, 10 Mar 2023 04:17:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA47B60C53;
 Fri, 10 Mar 2023 04:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F90C433EF;
 Fri, 10 Mar 2023 04:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678421830;
 bh=seNWL7u3NKJQuYerhpmVKbx/SYPqLN+Awp5eCMPqhCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tva8kSXk6mrM9aI8iXzURZS3gHSWJyE2ILXyBLY0mJR7Q/KH+0sdVu4D3Kn1opurB
 /DkbJ2Jz9k9rXU8Y9TRnbCJp3XIWhqDnFJrj/ec5RUVyinG0RmFVkzrIeGNGuZ/0i7
 JVLXsafln288RsmCZHiQPKnxRK/OmCBhVLVjdjeSp9YrBDmI5DYePO4FGmGs/iVjOi
 6DrTn60g9pJGt2q9BpdqEvDZ6E8AK9FF0OWpA5PLQc9hoYySlFHi4gIUE2EkjJhC6j
 pJlcKIEUzBYrmB7hu/sTAUcPtxDHv0dTkrP9cxd6C3wLduRVFbGOQA7xVDsMAugCfa
 /YZy3IxDDInKw==
Date: Thu, 9 Mar 2023 20:17:07 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZAqvQ57PmdDoNo+F@sol.localdomain>
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-12-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302202826.776286-12-mcgrof@kernel.org>
Subject: Re: [apparmor] [PATCH 11/11] proc_sysctl: deprecate
	register_sysctl_paths()
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
Cc: j.granados@samsung.com, jeffxu@google.com, guoren@kernel.org,
 linux-csky@vger.kernel.org, dverkamp@chromium.org, baihaowen@meizu.com,
 paul@paul-moore.com, jmorris@namei.org, willy@infradead.org,
 zhangpeng362@huawei.com, yzaikin@google.com, serge@hallyn.com,
 keescook@chromium.org, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 frederic@kernel.org, apparmor@lists.ubuntu.com, wad@chromium.org,
 nixiaoming@huawei.com, tytso@mit.edu, sujiaxun@uniontech.com,
 tangmeng@uniontech.com, patches@lists.linux.dev, luto@amacapital.net,
 linux-security-module@vger.kernel.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 02, 2023 at 12:28:26PM -0800, Luis Chamberlain wrote:
> diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
> index 780690dc08cd..e8459fc56b50 100644
> --- a/include/linux/sysctl.h
> +++ b/include/linux/sysctl.h
> @@ -221,13 +221,8 @@ extern void retire_sysctl_set(struct ctl_table_set *set);
>  struct ctl_table_header *__register_sysctl_table(
>  	struct ctl_table_set *set,
>  	const char *path, struct ctl_table *table);
> -struct ctl_table_header *__register_sysctl_paths(
> -	struct ctl_table_set *set,
> -	const struct ctl_path *path, struct ctl_table *table);
>  struct ctl_table_header *register_sysctl(const char *path, struct ctl_table *table);
>  struct ctl_table_header *register_sysctl_table(struct ctl_table * table);
> -struct ctl_table_header *register_sysctl_paths(const struct ctl_path *path,
> -						struct ctl_table *table);
>  
>  void unregister_sysctl_table(struct ctl_table_header * table);
>  
> @@ -277,12 +272,6 @@ static inline struct ctl_table_header *register_sysctl_mount_point(const char *p
>  	return NULL;
>  }
>  
> -static inline struct ctl_table_header *register_sysctl_paths(
> -			const struct ctl_path *path, struct ctl_table *table)
> -{
> -	return NULL;
> -}
> -

Seems that this patch should be titled "remove register_sysctl_paths()", not
"deprecate register_sysctl_paths()"?

- Eric

