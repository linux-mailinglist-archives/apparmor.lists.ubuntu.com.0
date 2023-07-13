Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8C5751D11
	for <lists+apparmor@lfdr.de>; Thu, 13 Jul 2023 11:21:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qJsW6-0002Mn-U0; Thu, 13 Jul 2023 09:21:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cuigaosheng1@huawei.com>) id 1qJsW5-0002Mg-86
 for apparmor@lists.ubuntu.com; Thu, 13 Jul 2023 09:21:41 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R1pv12y9PztRVF;
 Thu, 13 Jul 2023 17:18:37 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 17:21:37 +0800
To: John Johansen <john.johansen@canonical.com>, <paul@paul-moore.com>,
 <jmorris@namei.org>, <serge@hallyn.com>
References: <20230625011349.1457810-1-cuigaosheng1@huawei.com>
 <0a3930d7-32a6-13d1-b8a0-3dd9fdfa884d@canonical.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <97d2697c-39fe-f3f0-a079-35fb4debdd46@huawei.com>
Date: Thu, 13 Jul 2023 17:21:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0a3930d7-32a6-13d1-b8a0-3dd9fdfa884d@canonical.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Subject: Re: [apparmor] [PATCH -next 00/11] Fix kernel-doc warnings in
	apparmor
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Thanks for taking time to review these patches!

> I have pulled these into the private testing repo, at
> https://gitlab.com/jjohansen/apparmor-kernel
>
> if there aren't revisions to 5/11 andd 10/11 this week
> I will add a patch ontop to do the suggested revision.
> If you post new versions I will pull those in and rebase,
> before pushing these up to the more public repos.
>
These patches have been pulled into the private testing repo,
so please add a patch ontop to do the suggested revision，
thanks again for your work.


On 2023/7/10 16:45, John Johansen wrote:
> On 6/24/23 18:13, Gaosheng Cui wrote:
>> Fix kernel-doc warnings in apparmor, thanks very much!
>>
> I have pulled these into the private testing repo, at
> https://gitlab.com/jjohansen/apparmor-kernel
>
> if there aren't revisions to 5/11 andd 10/11 this week
> I will add a patch ontop to do the suggested revision.
> If you post new versions I will pull those in and rebase,
> before pushing these up to the more public repos.
>
>
>> Gaosheng Cui (11):
>>    apparmor: Fix kernel-doc warnings in apparmor/audit.c
>>    apparmor: Fix kernel-doc warnings in apparmor/capability.c
>>    apparmor: Fix kernel-doc warnings in apparmor/domain.c
>>    apparmor: Fix kernel-doc warnings in apparmor/file.c
>>    apparmor: Fix kernel-doc warnings in apparmor/label.c
>>    apparmor: Fix kernel-doc warnings in apparmor/lib.c
>>    apparmor: Fix kernel-doc warnings in apparmor/match.c
>>    apparmor: Fix kernel-doc warnings in apparmor/resource.c
>>    apparmor: Fix kernel-doc warnings in apparmor/policy_unpack.c
>>    apparmor: Fix kernel-doc warnings in apparmor/policy_compat.c
>>    apparmor: Fix kernel-doc warnings in apparmor/policy.c
>>
>>   security/apparmor/audit.c         |  1 +
>>   security/apparmor/capability.c    |  4 ++--
>>   security/apparmor/domain.c        | 10 ++++++----
>>   security/apparmor/file.c          |  6 +++---
>>   security/apparmor/label.c         | 20 +++++++++++---------
>>   security/apparmor/lib.c           |  4 ++--
>>   security/apparmor/match.c         |  4 ++--
>>   security/apparmor/policy.c        | 17 ++++++++++-------
>>   security/apparmor/policy_compat.c |  1 +
>>   security/apparmor/policy_unpack.c |  2 +-
>>   security/apparmor/resource.c      |  8 ++++----
>>   11 files changed, 43 insertions(+), 34 deletions(-)
>>
>
> .

