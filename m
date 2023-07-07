Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C874B361
	for <lists+apparmor@lfdr.de>; Fri,  7 Jul 2023 16:55:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qHmri-0003AA-Ai; Fri, 07 Jul 2023 14:55:22 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <rdunlap@infradead.org>) id 1qHmrg-0003A1-5n
 for apparmor@lists.ubuntu.com; Fri, 07 Jul 2023 14:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=O1NoqMhtAQJgT4QBfdt5+/2ZYFc7QVgY2GbwxuDpmuI=; b=WJhiu6Xcy+tUuNmUW+DBF0De7C
 tqlkA6+PN4TYzPKf3sK4o3ZshV5sx1+Mft30BFOssBA3inUI64oQSqNzFUKGR0u6myH2cHfK4aIJd
 3NXOhZim72Qlp4KCd4bWCp+z1KBRAeCxPYAC9AhsHpiPAlezoZzYIOETtiyYe4GaPsOvxgQY1vo2V
 EXqv/Dhry+HOSFNqyzMK28YUSMgultU+HCRMEM8EKFVKSXlxPSINnEHa0qQ1DuGq4WivRG60hk8G8
 JOXZW/FKcTuz7xvZN/icDCyKyyQ7FYm2167cPBzziuNAV2kgozdTZ2ZNRZ9LnZ0fqfnSaCifNW1Gb
 QEiyTxXQ==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qHmrX-004wEc-2r; Fri, 07 Jul 2023 14:55:11 +0000
Message-ID: <b4173c39-0d6e-a02b-df2f-4f9eb6a1453d@infradead.org>
Date: Fri, 7 Jul 2023 07:55:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, john.johansen@canonical.com
References: <20230707080737.49899-1-yang.lee@linux.alibaba.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230707080737.49899-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH -next] apparmor: Fix some kernel-doc comments
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
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On 7/7/23 01:07, Yang Li wrote:
> Use colons to separate parameter names from their specific meanings.
> silencethe warnings:
> 
> security/apparmor/resource.c:111: warning: Function parameter or member 'label' not described in 'aa_task_setrlimit'
> security/apparmor/resource.c:111: warning: Function parameter or member 'task' not described in 'aa_task_setrlimit'
> security/apparmor/resource.c:111: warning: Function parameter or member 'resource' not described in 'aa_task_setrlimit'
> security/apparmor/resource.c:111: warning: Function parameter or member 'new_rlim' not described in 'aa_task_setrlimit'
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  security/apparmor/resource.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/security/apparmor/resource.c b/security/apparmor/resource.c
> index e85948164896..2bebc5d9e741 100644
> --- a/security/apparmor/resource.c
> +++ b/security/apparmor/resource.c
> @@ -97,10 +97,10 @@ static int profile_setrlimit(struct aa_profile *profile, unsigned int resource,
>  
>  /**
>   * aa_task_setrlimit - test permission to set an rlimit
> - * @label - label confining the task  (NOT NULL)
> - * @task - task the resource is being set on
> - * @resource - the resource being set
> - * @new_rlim - the new resource limit  (NOT NULL)
> + * @label: label confining the task  (NOT NULL)
> + * @task: task the resource is being set on
> + * @resource: the resource being set
> + * @new_rlim: the new resource limit  (NOT NULL)
>   *
>   * Control raising the processes hard limit.
>   *

-- 
~Randy

