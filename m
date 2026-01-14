Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE9CD1D513
	for <lists+apparmor@lfdr.de>; Wed, 14 Jan 2026 10:01:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vfwkB-00009P-DN; Wed, 14 Jan 2026 09:00:47 +0000
Received: from m16.mail.163.com ([220.197.31.4])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <robinshao007@163.com>)
 id 1vfwkA-00007b-BE
 for apparmor@lists.ubuntu.com; Wed, 14 Jan 2026 09:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
 Content-Type; bh=XqL/oJUzvFIF5Gyl7KDLcwFDTINiXgn1pZVBrnu0SZA=;
 b=jPnE68n3CXBBXdw/mEbzEY4p59XsMSvQyO2tpCSseXISlXjp28UUS+2OivdKfR
 vqwkvB+/AMnqD9ZIumZ3yvXle1LkDm27Hm72Uo6zjAydlRFDXUXoaFE3rYSfNJY9
 rT8cKv9TodMmETrqGtcmh4fGDpcc6AgDG5uA3pZF2LwHI=
Received: from [192.168.3.175] (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgD3nwA2W2dpM2ynKg--.3S2;
 Wed, 14 Jan 2026 17:00:40 +0800 (CST)
Message-ID: <ac64a614-3baf-4e3d-8e85-af38a5158ea7@163.com>
Date: Wed, 14 Jan 2026 17:00:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <f3721413-a4ee-4efc-8bbb-60c19d8d5acf@163.com>
 <17fe3a3f-81ad-4413-8a89-e8e9a507d981@canonical.com>
From: Fei Shao <robinshao007@163.com>
In-Reply-To: <17fe3a3f-81ad-4413-8a89-e8e9a507d981@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3nwA2W2dpM2ynKg--.3S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww1fAr4DZrWxArWUAr1UJrb_yoW8Aw4kpF
 sxtF17Jr1DJF1UArn7tw1rJFyrtr1UJry5Xw17Jry8ZrnIkF1UKr1Iqr95uFyDZry3Kr15
 XryUJFy3Zr1UArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zicyCZUUUUU=
X-Originating-IP: [113.215.70.110]
X-CM-SenderInfo: purex0pvkd0iiqx6il2tof0z/xtbC6xgZJGlnWzgpgAAA3K
Received-SPF: pass client-ip=220.197.31.4; envelope-from=robinshao007@163.com;
 helo=m16.mail.163.com
Subject: Re: [apparmor] [ISSUE]Does apparmor support the port limit for app
 please?
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi  John，

I checked my system version. It is UBUNTU 2404 and the apparmor version 
is 4.0.1. It is smaller than 4.1, so it doesn't support it.
I will check it in newer version.

Thanks.

Fei Shao

在 2026-01-14 14:44, John Johansen 写道:
> On 1/13/26 21:10, Fei Shao wrote:
>> Hi all,
>> I write a profile for nginx like below:
>> ---------------------------------------------
>> profile /usr/sbin/nginx {
>>    include <abstractions/base>
>>
>>
>>    capability net_bind_service,
>>    capability setuid,
>>    capability setgid,
>>
>>    capability dac_read_search,
>>
>>
>>    network inet tcp port=80,   #<==this line
>>    /usr/sbin/nginx mrix,
>> /etc/nginx/** r,
>> /var/log/nginx/** rw,
>> }
>> ---------------------------------------------
>>
>> if put the "network inet tcp port=80" in usr.sbin.nginx file, the 
>> aa-enforce return is :
>>
>> ---------------------------------------------
>> sudo aa-enforce usr.sbin.nginx
>> ERROR: Invalid or unknown keywords in 'network  inet tcp port=80
>> ---------------------------------------------
>>
>> so I have an issue about this, does apparmor support the port limit 
>> for app please?
>>
>
> it will depend on the version of apparmor you have, and the kernel. 
> ATM the port
> limitation is not in the upstream kernel.
>
> In userspace you need a 4.1.x or newer userspace. You can get that 
> info from packaging
> or running the command apparmor_parser -V. You will also need a kernel 
> with the out of
> tree networking patch that has been in dev.
>
> Ubuntu is carrying the patch that allows this in their kernel. There 
> needs to be another
> round of revision on the it, and the new version needs to be posted 
> for review. this will
> not happen in time for the 6.20 kernel, but there is a chance it could 
> happen for the 6.21
> kernel.
>
>>
>> Thanks
>>
>> Fei Shao
>>
>>
>


