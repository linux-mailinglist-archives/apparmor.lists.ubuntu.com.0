Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 457DFD2216A
	for <lists+apparmor@lfdr.de>; Thu, 15 Jan 2026 03:06:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vgCkC-0003Av-MB; Thu, 15 Jan 2026 02:05:52 +0000
Received: from m16.mail.163.com ([117.135.210.5])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <robinshao007@163.com>)
 id 1vgCkB-00039s-8E
 for apparmor@lists.ubuntu.com; Thu, 15 Jan 2026 02:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
 Content-Type; bh=cSsjSVqZC6KClzjAXSnOdxpt8cg8PoWG58CKpxgOFKM=;
 b=SIXh1r72GE0G7YlDJnS7pUWKTOROaSTnNMeC7bECwMLecKItP/Yvbq/6Gub8cm
 A9vTZajxxEtVMQa3SAorxMNulMi8EzVI+AoijUmAzYd7EgJpb/325/jVqbahAykx
 i9htLCL6QbIK5ZNPRPufsV0j2zUwbD5DtlPzFKRM11wkE=
Received: from [192.168.3.175] (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wAnTQhxS2hpMqkCGA--.24626S2; 
 Thu, 15 Jan 2026 10:05:38 +0800 (CST)
Message-ID: <ae030ecd-c7f0-4c34-94e4-48addc78c9f9@163.com>
Date: Thu, 15 Jan 2026 10:05:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
References: <3ef6ce03-637e-4e4c-875a-180d9daa400a@163.com>
 <c0bd2921-2f1c-405d-bab6-eb9ca6bcb141@canonical.com>
From: Fei Shao <robinshao007@163.com>
In-Reply-To: <c0bd2921-2f1c-405d-bab6-eb9ca6bcb141@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnTQhxS2hpMqkCGA--.24626S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFW8uw48GryUZw1Dtr48Crg_yoWrXw15pr
 1ay3W2yFZ8JF17Awnrtr13JF15tr1UJr47X345Xry0yFn8ArnFqrWxKr1Fga47X395Cw1Y
 q347XFy7JryDArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRhYFtUUUUU=
X-Originating-IP: [113.215.70.110]
X-CM-SenderInfo: purex0pvkd0iiqx6il2tof0z/xtbC6xNjbmloS3MH4QAA3q
Received-SPF: pass client-ip=117.135.210.5; envelope-from=robinshao007@163.com;
 helo=m16.mail.163.com
Subject: Re: [apparmor] [ISSUE]Why my python script can't override the DAC
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



在 2026-01-15 5:24, John Johansen 写道:
> On 1/14/26 01:19, Fei Shao wrote:
>> Hi all,
>>
>>
>> I write a py script to test the dac_override option, but I failed.
>> The py script is :
>> ----------------------------------------------------
>> #!/usr/bin/env python3
>> import os  # 用于文件/目录的基础操作（删除、判断文件是否存在）
>> import time
>>
>> def create_file(file_path, content="默认初始内容\n"):
>>      try:
>>          if os.path.exists(file_path):
>>              print(f"⚠️ 文件 {file_path} 已存在，跳过新建操作")
>>              return False
>>
>>          with open(file_path, "w", encoding="utf-8") as f:
>>              f.write(content)
>>          print(f"successfully :{file_path}")
>>          return True
>>      except Exception as e:
>>          print(f" failed : {e}")
>>          return False
>>
>>
>> if __name__ == "__main__":
>>      test_file = 
>> "/home/sf/apparmor/test/test_file"+str(int(time.time())) +".txt"
>>      create_file(test_file, "content of file \n")
>> ----------------------------------------------------
>>
>>
>> the profile is :
>> --------------------------------------------------------
>> abi <abi/4.0>,
>>
>> include <tunables/global>
>>
>> profile /home/sf/apparmor/operfile.py {
>>    include <abstractions/base>
>>    include <abstractions/evince>
>>    include <abstractions/python>
>>
>>    capability dac_override,
>>    capability dac_read_search,
>>
>>    /etc/apt/apt.conf.d/ r,
>>    /etc/apt/apt.conf.d/** r,
>>
>>    /home/sf/apparmor/operfile.py r,
>>    /home/sf/apparmor/test/ rwix,
>>    /home/sf/apparmor/test/** rw,
>>
>>    /proc/self/mem r, # 进程内存访问（Python 运行必需）
>>    /sys/devices/** r, # 系统设备信息（可选，视脚本需求）
>>    /tmp/** rw, # 临时文件目录（Python 常用）
>>    /usr/bin/python3.12 mrix,
>>    /var/tmp/** rw, # 系统临时目录
>>    owner /home/*/apparmor/ r,
>>    /usr/lib/python3*/** r,        # Python 库文件读取
>>
>> }
>>
>> ---------------------------------------------------------------
>>
>> I use the command "sudo aa-enforce home.sf.apparmor.operfile.py" to 
>> make sure the profile is loaded.
>>
>> When the attribute of "/home/sf/apparmor/test/" is 755, the script 
>> worked well with command "./operfile.py".
>>
>> When the attribute of "/home/sf/apparmor/test/" is 555,  command 
>> "./operfile.py" returned "failed : [Errno 13] Permission denied: 
>> '/home/sf/apparmor/test/test_file1768381998.txt'". If I use the "sudo 
>> ./operfile.py", the file could be created well.  It seems the 
>> dac_overried doesn't work here.
>>
>
> who is the owner of the file in the failure case, and what is the user
> id of the task trying to access the file.
>
> As Zygmunt has already pointed out the AppArmor capability rule
> doesn't elevate capabilities, it just ensures that the task can have
> the given capability. AppArmor mediation works in conjunction with
> regular DAC mediation, and is purely restrictive, that is to say
> it will not allow something DAC doesn't allow.
>
> While I don't have the full information about your system I am fairly
> sure you are seeing DAC reject access to the file. If you look in your
> system logs, you will find that there isn't an AppArmor denial message
> for this event. Instead what is happening is AppArmor is allowing the
> access but DAC is denying it.
>
>> I checked with "sudo aa-logprof", but no information is returned.
>
> this indicates that there isn't a denial message from apparmor in your 
> logs
>
>> Would you like tell me why the py script can't create file when test 
>> folder is 555 please?
>>
> so as stated above this looks to be a DAC permission issue. Though I
> will add on the AppArmor side the director permissions are not what is
> important (they still are important on the DAC side). Instead AppArmor
> permissions have to be set for the file within the dir (which you do
> have in the profile).

What is the function of the configuration option *|capability 
dac_override|*?

>
>> My os is ubuntu 2404 and my apparmor is 4.0.1.
>>
>> Thanks
>>
>> Fei Shao
>>
>>
>>
>


