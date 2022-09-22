Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C53655E663F
	for <lists+apparmor@lfdr.de>; Thu, 22 Sep 2022 16:56:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1obNce-00080t-R5; Thu, 22 Sep 2022 14:56:16 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <serge@mail.hallyn.com>) id 1obNcb-0007xU-0I
 for apparmor@lists.ubuntu.com; Thu, 22 Sep 2022 14:56:13 +0000
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id 8B5FF9CA; Thu, 22 Sep 2022 09:56:12 -0500 (CDT)
Date: Thu, 22 Sep 2022 09:56:12 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Message-ID: <20220922145612.GA23772@mail.hallyn.com>
References: <20220922030024.1282700-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922030024.1282700-1-cuigaosheng1@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [apparmor] [PATCH] apparmor: Simply obtain the newest label on
	a cred
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
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Sep 22, 2022 at 11:00:24AM +0800, Gaosheng Cui wrote:
> aa_get_newest_cred_label(__task_cred(task)) can do the same things as
> aa_get_newest_label(__aa_task_raw_label(task)), so we can replace it
> and remove __aa_task_raw_label() to simply code.

nitpick -

"to simplify the code".

> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  security/apparmor/include/cred.h | 13 -------------
>  security/apparmor/task.c         |  2 +-
>  2 files changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/security/apparmor/include/cred.h b/security/apparmor/include/cred.h
> index 0b9ae4804ef7..58fdc72af664 100644
> --- a/security/apparmor/include/cred.h
> +++ b/security/apparmor/include/cred.h
> @@ -63,19 +63,6 @@ static inline struct aa_label *aa_get_newest_cred_label(const struct cred *cred)
>  	return aa_get_newest_label(aa_cred_raw_label(cred));
>  }
>  
> -/**
> - * __aa_task_raw_label - retrieve another task's label
> - * @task: task to query  (NOT NULL)
> - *
> - * Returns: @task's label without incrementing its ref count
> - *
> - * If @task != current needs to be called in RCU safe critical section
> - */
> -static inline struct aa_label *__aa_task_raw_label(struct task_struct *task)
> -{
> -	return aa_cred_raw_label(__task_cred(task));
> -}
> -
>  /**
>   * aa_current_raw_label - find the current tasks confining label
>   *
> diff --git a/security/apparmor/task.c b/security/apparmor/task.c
> index 503dc0877fb1..0a8f9fa7ca0a 100644
> --- a/security/apparmor/task.c
> +++ b/security/apparmor/task.c
> @@ -31,7 +31,7 @@ struct aa_label *aa_get_task_label(struct task_struct *task)
>  	struct aa_label *p;
>  
>  	rcu_read_lock();
> -	p = aa_get_newest_label(__aa_task_raw_label(task));
> +	p = aa_get_newest_cred_label(__task_cred(task));
>  	rcu_read_unlock();
>  
>  	return p;
> -- 
> 2.25.1

