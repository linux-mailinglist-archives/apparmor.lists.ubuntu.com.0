Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 42478D1D779
	for <lists+apparmor@lfdr.de>; Wed, 14 Jan 2026 10:20:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vfx2d-0002JS-Gb; Wed, 14 Jan 2026 09:19:51 +0000
Received: from m16.mail.163.com ([117.135.210.5])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <robinshao007@163.com>)
 id 1vfx2b-0002Hn-U7
 for apparmor@lists.ubuntu.com; Wed, 14 Jan 2026 09:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:From:Subject:To:
 Content-Type; bh=egMDndmpF4QrTXfDSRYOIdLAXQ/M4HNYvXrWeeCf14g=;
 b=kNZTlz3bCUQj2KszhrR5FkmhGxmiZMuheHJW7INBV1k6OuvyyR7QJvmjnstvyb
 pcxeo7HpiaQqz2Ti6g1icEQNVVyBD8JNIOIKFgzqc31u/pEn4J0h9JT+LPK5aJhJ
 fD11eRype7ues6v+sYN7T7DzKK7b1dvunXqXoXVUPzTi8=
Received: from [192.168.3.175] (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnvMerX2dp4fmpFg--.85S2; 
 Wed, 14 Jan 2026 17:19:41 +0800 (CST)
Message-ID: <3ef6ce03-637e-4e4c-875a-180d9daa400a@163.com>
Date: Wed, 14 Jan 2026 17:19:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fei Shao <robinshao007@163.com>
To: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnvMerX2dp4fmpFg--.85S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFy8Ary7tF17Xry3Cry3urg_yoW5JrW5pF
 sxCrnrJrn8GF17Zr17Jw13JF15tr1UJF43XasIgr40yr1UAr1vgrWxKrnYgryUXFWkuw15
 ZasrXry7Jr12vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UsqXLUUUUU=
X-Originating-IP: [113.215.70.110]
X-CM-SenderInfo: purex0pvkd0iiqx6il2tof0z/xtbCxBA4Q2lnX7CdzgAA3d
Received-SPF: pass client-ip=117.135.210.5; envelope-from=robinshao007@163.com;
 helo=m16.mail.163.com
Subject: [apparmor] [ISSUE]Why my python script can't override the DAC
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

Hi all,


I write a py script to test the dac_override option, but I failed.
The py script is :
----------------------------------------------------
#!/usr/bin/env python3
import os  # 用于文件/目录的基础操作（删除、判断文件是否存在）
import time

def create_file(file_path, content="默认初始内容\n"):
     try:
         if os.path.exists(file_path):
             print(f"⚠️ 文件 {file_path} 已存在，跳过新建操作")
             return False

         with open(file_path, "w", encoding="utf-8") as f:
             f.write(content)
         print(f"successfully :{file_path}")
         return True
     except Exception as e:
         print(f" failed : {e}")
         return False


if __name__ == "__main__":
     test_file = 
"/home/sf/apparmor/test/test_file"+str(int(time.time())) +".txt"
     create_file(test_file, "content of file \n")
----------------------------------------------------


the profile is :
--------------------------------------------------------
abi <abi/4.0>,

include <tunables/global>

profile /home/sf/apparmor/operfile.py {
   include <abstractions/base>
   include <abstractions/evince>
   include <abstractions/python>

   capability dac_override,
   capability dac_read_search,

   /etc/apt/apt.conf.d/ r,
   /etc/apt/apt.conf.d/** r,

   /home/sf/apparmor/operfile.py r,
   /home/sf/apparmor/test/ rwix,
   /home/sf/apparmor/test/** rw,

   /proc/self/mem r, # 进程内存访问（Python 运行必需）
   /sys/devices/** r, # 系统设备信息（可选，视脚本需求）
   /tmp/** rw, # 临时文件目录（Python 常用）
   /usr/bin/python3.12 mrix,
   /var/tmp/** rw, # 系统临时目录
   owner /home/*/apparmor/ r,
   /usr/lib/python3*/** r,        # Python 库文件读取

}

---------------------------------------------------------------

I use the command "sudo aa-enforce home.sf.apparmor.operfile.py" to make 
sure the profile is loaded.

When the attribute of "/home/sf/apparmor/test/" is 755, the script 
worked well with command "./operfile.py".

When the attribute of "/home/sf/apparmor/test/" is 555,   command 
"./operfile.py" returned "failed : [Errno 13] Permission denied: 
'/home/sf/apparmor/test/test_file1768381998.txt'". If I use the "sudo 
./operfile.py", the file could be created well.  It seems the 
dac_overried doesn't work here.

I checked with "sudo aa-logprof", but no information is returned.
Would you like tell me why the py script can't create file when test 
folder is 555 please?

My os is ubuntu 2404 and my apparmor is 4.0.1.

Thanks

Fei Shao



