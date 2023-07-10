Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CE82F74D08C
	for <lists+apparmor@lfdr.de>; Mon, 10 Jul 2023 10:48:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qImZA-0007kR-5a; Mon, 10 Jul 2023 08:48:20 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qImZ8-0007kG-Hf
 for apparmor@lists.ubuntu.com; Mon, 10 Jul 2023 08:48:18 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 9A2783F323; 
 Mon, 10 Jul 2023 08:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1688978898;
 bh=Z/gL9U9h5Em+3aV81BCbewJzSllI5Ghayx0OULbP+so=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ewXq8l5DS0FT2hJCD5L9XG29STBWwsin2ywcbmZbyIth2YiSTym/obgmS6z2LUjvZ
 FN2zHtdCgalJMKVvNKfv59Z6RGSieq8v5CXpiLokMXShOiWEnlVB9oDZyYsZlZT9EX
 yjjc7s1PD65ejF97zvfcbi/+aGb1l+o9N/ik7udsLyvODvENfu7xEO1LWLPGDnwqwx
 ZhzjVkOCWj3e4hE29upYa53rVmkEX4eX2j2ulWiUN2YmErnHPU6y7cOH7PyGUHpDfi
 rB6ZXSOnlcHNzUoW6YLtSyB1RfDIZncKRKgfdxYQnrlC/2UifMaPmo/+xHUQuEv7Wg
 yBttjRbY10TFQ==
Message-ID: <685315da-3a6d-6d1e-03cb-1fc07ff68121@canonical.com>
Date: Mon, 10 Jul 2023 01:48:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>
References: <20230707080737.49899-1-yang.lee@linux.alibaba.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230707080737.49899-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Unfortunately Gaosheng Cui beat you to this fix on 6/24 with
[PATCH -next 08/11] apparmor: Fix kernel-doc warnings in apparmor/resource.c

thankyou for taking the time to help make apparmor better

-
john

> security/apparmor/resource.c:111: warning: Function parameter or member 'label' not described in 'aa_task_setrlimit'
> security/apparmor/resource.c:111: warning: Function parameter or member 'task' not described in 'aa_task_setrlimit'
> security/apparmor/resource.c:111: warning: Function parameter or member 'resource' not described in 'aa_task_setrlimit'
> security/apparmor/resource.c:111: warning: Function parameter or member 'new_rlim' not described in 'aa_task_setrlimit'
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>   security/apparmor/resource.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/security/apparmor/resource.c b/security/apparmor/resource.c
> index e85948164896..2bebc5d9e741 100644
> --- a/security/apparmor/resource.c
> +++ b/security/apparmor/resource.c
> @@ -97,10 +97,10 @@ static int profile_setrlimit(struct aa_profile *profile, unsigned int resource,
>   
>   /**
>    * aa_task_setrlimit - test permission to set an rlimit
> - * @label - label confining the task  (NOT NULL)
> - * @task - task the resource is being set on
> - * @resource - the resource being set
> - * @new_rlim - the new resource limit  (NOT NULL)
> + * @label: label confining the task  (NOT NULL)
> + * @task: task the resource is being set on
> + * @resource: the resource being set
> + * @new_rlim: the new resource limit  (NOT NULL)
>    *
>    * Control raising the processes hard limit.
>    *


