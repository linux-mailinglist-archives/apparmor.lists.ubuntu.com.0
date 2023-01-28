Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E867F404
	for <lists+apparmor@lfdr.de>; Sat, 28 Jan 2023 03:35:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pLb3N-0007xj-Mi; Sat, 28 Jan 2023 02:34:53 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pLb3L-0007xa-N6
 for apparmor@lists.ubuntu.com; Sat, 28 Jan 2023 02:34:51 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id B283A3F116; 
 Sat, 28 Jan 2023 02:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1674873291;
 bh=p0MVPSCR+Nwm3g+JfA+sZRpCUs4LHkTwQYrFz1Oisew=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=O5gjYNCeUUh/fplooQkbIInGcImYFOUXlNYzU3fFNYuzN0rQ0ef4BM0cQWOxry6Tu
 rRDKf3xuse/O2tlCz4d9A7gkHrNfY+5NXUAfHcL/q7zaIwWRs2UVFojh17Odn+MNnT
 3S72hY7apUwjF0qSF2yPKvh/TdXIZh0fBdrM6/Zt696U26i7TIkQ/uvUJGOKV5+EM5
 K7aBJ+0VOW2F1XI6DuLieOmCMuuAPGOYeCA2X0I5fEZx5hbklDXul7dFaFsbvFUmhA
 V/NWZZIpYjt3T/4PPnFvNYzJRhFK3jStmV2z/wuwHFRS+ZfH1ec33QKaEYdZKXoObY
 UrKcU+AZbioQQ==
Message-ID: <4fa85b15-1c55-9050-9cd0-fe66c3b957eb@canonical.com>
Date: Fri, 27 Jan 2023 18:34:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: "Yin, Fengwei" <fengwei.yin@intel.com>,
 kernel test robot <oliver.sang@intel.com>
References: <202212311546.755a3ed7-oliver.sang@intel.com>
 <42194ba4-cc3b-c8b3-06e6-e2938df3a87c@intel.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <42194ba4-cc3b-c8b3-06e6-e2938df3a87c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [linus:master] 1ad22fcc4d:
 stress-ng.kill.ops_per_sec -42.5% regression
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
Cc: feng.tang@intel.com, lkp@intel.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, zhengjun.xing@linux.intel.com,
 ying.huang@intel.com, oe-lkp@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 1/27/23 17:37, Yin, Fengwei wrote:
> Hi John,
> 
> On 12/31/2022 3:18 PM, kernel test robot wrote:
>>
>> Greeting,
>>
>> FYI, we noticed a -42.5% regression of stress-ng.kill.ops_per_sec due to commit:
>>
>>
>> commit: 1ad22fcc4d0d2fb2e0f35aed555a86d016d5e590 ("apparmor: rework profile->rules to be a list")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: stress-ng
>> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
>> with following parameters:
>>
>> 	nr_threads: 10%
>> 	disk: 1HDD
>> 	testtime: 60s
>> 	fs: ext4
>> 	class: os
>> 	test: kill
>> 	cpufreq_governor: performance
> Do you think any other information need be collected for this regression
> report? Thanks.
> 

no, I know what is causing it, I just haven't had time to fix it yet.


