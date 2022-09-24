Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E1C5E8F8C
	for <lists+apparmor@lfdr.de>; Sat, 24 Sep 2022 21:40:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ocB0M-0002G2-D8; Sat, 24 Sep 2022 19:40:02 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cuigaosheng1@huawei.com>) id 1obf0G-00030k-5i
 for apparmor@lists.ubuntu.com; Fri, 23 Sep 2022 09:29:48 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYmwV5RZRzWgwL;
 Fri, 23 Sep 2022 17:25:46 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 17:29:44 +0800
To: "Serge E. Hallyn" <serge@hallyn.com>
References: <20220922030024.1282700-1-cuigaosheng1@huawei.com>
 <20220922145612.GA23772@mail.hallyn.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <9a193f21-5f78-d045-762a-8f04caae7e2d@huawei.com>
Date: Fri, 23 Sep 2022 17:29:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20220922145612.GA23772@mail.hallyn.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 24 Sep 2022 19:40:01 +0000
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 paul@paul-moore.com, jmorris@namei.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

> On Thu, Sep 22, 2022 at 11:00:24AM +0800, Gaosheng Cui wrote:
>> aa_get_newest_cred_label(__task_cred(task)) can do the same things as
>> aa_get_newest_label(__aa_task_raw_label(task)), so we can replace it
>> and remove __aa_task_raw_label() to simply code.
> nitpick -
>
> "to simplify the code".
>
Thanks for taking the time to review this patch, I have made a patch v2 and submitted it.

link: https://patchwork.kernel.org/project/linux-security-module/list/?series=679790

On 2022/9/22 22:56, Serge E. Hallyn wrote:
> On Thu, Sep 22, 2022 at 11:00:24AM +0800, Gaosheng Cui wrote:
>> aa_get_newest_cred_label(__task_cred(task)) can do the same things as
>> aa_get_newest_label(__aa_task_raw_label(task)), so we can replace it
>> and remove __aa_task_raw_label() to simply code.
> nitpick -
>
> "to simplify the code".
>
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> ---
>>   security/apparmor/include/cred.h | 13 -------------
>>   security/apparmor/task.c         |  2 +-
>>   2 files changed, 1 insertion(+), 14 deletions(-)
>>
>> diff --git a/security/apparmor/include/cred.h b/security/apparmor/include/cred.h
>> index 0b9ae4804ef7..58fdc72af664 100644
>> --- a/security/apparmor/include/cred.h
>> +++ b/security/apparmor/include/cred.h
>> @@ -63,19 +63,6 @@ static inline struct aa_label *aa_get_newest_cred_label(const struct cred *cred)
>>   	return aa_get_newest_label(aa_cred_raw_label(cred));
>>   }
>>   
>> -/**
>> - * __aa_task_raw_label - retrieve another task's label
>> - * @task: task to query  (NOT NULL)
>> - *
>> - * Returns: @task's label without incrementing its ref count
>> - *
>> - * If @task != current needs to be called in RCU safe critical section
>> - */
>> -static inline struct aa_label *__aa_task_raw_label(struct task_struct *task)
>> -{
>> -	return aa_cred_raw_label(__task_cred(task));
>> -}
>> -
>>   /**
>>    * aa_current_raw_label - find the current tasks confining label
>>    *
>> diff --git a/security/apparmor/task.c b/security/apparmor/task.c
>> index 503dc0877fb1..0a8f9fa7ca0a 100644
>> --- a/security/apparmor/task.c
>> +++ b/security/apparmor/task.c
>> @@ -31,7 +31,7 @@ struct aa_label *aa_get_task_label(struct task_struct *task)
>>   	struct aa_label *p;
>>   
>>   	rcu_read_lock();
>> -	p = aa_get_newest_label(__aa_task_raw_label(task));
>> +	p = aa_get_newest_cred_label(__task_cred(task));
>>   	rcu_read_unlock();
>>   
>>   	return p;
>> -- 
>> 2.25.1
> .

