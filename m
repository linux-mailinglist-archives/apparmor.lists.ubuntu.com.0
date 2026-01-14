Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 195C1D21520
	for <lists+apparmor@lfdr.de>; Wed, 14 Jan 2026 22:25:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vg8MH-0005hL-NM; Wed, 14 Jan 2026 21:24:53 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vg8MG-0005hD-QY
 for apparmor@lists.ubuntu.com; Wed, 14 Jan 2026 21:24:52 +0000
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 995443F301
 for <apparmor@lists.ubuntu.com>; Wed, 14 Jan 2026 21:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768425892;
 bh=9M9BTemgkKnTpYlS7tO8jAUp6dP9DmVcKsWH16Qfoxk=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=JlavYx/6WVUKPVJBno9rhVMaZ3v7Gqg1iXOi5uM5TI47B305zgZxSRhC23m+PJ7Q5
 M1bucLpDD+lwtg3QE5O17misuqPAR/akSSPILiaIMpu8XGOl8k5ngzLsITAH7iaMZC
 sz0liKiuqlMgVJ9BIijbVaA9u+8o/U7RD40AOxnHqtuf4Qhx6y3Qp3Zywx3X4HW8X7
 La6KzZXKYRjNiKc74o4RWbNgFGKGbGlC11wer6Zf1n4ESc1Eu1WNVBzCktjYRqOARv
 C5qKO6wWTIGUmDf6ZvgtTteVmpDCNFehGRuXYhCfpQXhgjY28Y4VTcu61JopBuCRTv
 GH0Xzf26f0Gs6mtuEoL3Qwl6aA2Dq7oDnyfqRT2QMU57gJ8A10XiRyQjkjvChTitlN
 D2/PYS3ldpv2INxZGPUKhiVgg3gyCJN8jQCrv2eIb/Ji8ipQzLje42s2ZiszntM6iy
 dhM+XLvMzDvrR4cxSoZWpR+3L/yAvY/rbKubZhQFkZEiQxBsBaSKdGk/A67VESDpqK
 KNUDeupdjy0hZJyUscis07OSQbHSJcPJ7hnS7Vg/sucIA/2RHQSbQhX+npqQPoh1gU
 11aUcYMzOCYVKJx2kXodBFzVeIgxqrAwu1rsl5UlGAIeb273kgH5BzNLpSR9gFWWrR
 QkqghuIwn3vCX0bKzy0J9Nzk=
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c3dfa080662so103580a12.1
 for <apparmor@lists.ubuntu.com>; Wed, 14 Jan 2026 13:24:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768425891; x=1769030691;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9M9BTemgkKnTpYlS7tO8jAUp6dP9DmVcKsWH16Qfoxk=;
 b=P7vwJVvjJsHKDoQjJoI26EMXvRqDockuwIbZAdgi9J51KQ6hhwzexneQ5dXU0FCpFZ
 cQL614i70o0N+oVvDKFN5UHor97Mj1sONlBGbP7OqPMRK/+uqIFXgeLLbRk9zZ7A2xbW
 wqT9dAo6JZ1nC2Z++MAy3TXJTAbkEeVm+H/ZJzwyFqynLJ6soQJVlezeCNG4sIOcC6IV
 afaZ0+LBT8tQOxaanXZSPrYXQGQUBV7kQAkZNdHz4bHk1bgFB0p+F1uA9tqsd1CISo5b
 3D5NgYDELpHJZlAn5h4nUpVZZFLY3xcKIKBuIMhGaV8RzRFL2FEQ8fmgYZ94YTypTpWI
 cw0w==
X-Gm-Message-State: AOJu0YwdxX8X47V9TkLAhdfQ1vvDv/uSszTSzHKU6KxTzFZ0jT5116Sa
 q9Kr0MHGcVouuzyQRGWRHADDicBmM722V7cO5jXzGa+xY1wyDR+loAVwWv+dF2ICXDJK0jHRlWl
 AIIFFxqnAAK1IQcv8jNtYGDpo0GYt1A8HiPZCKJJstRpZ637ho4s6ub8Ht1diZLe3dYaHkyf+UC
 N1O8LYp2jQTg==
X-Gm-Gg: AY/fxX6jirmRDgDdHI2DEKoH+pFlMcdvFZPL5E07FETr2HNJ1V9K9hu980NomLt7ieu
 0z4NApDxe2nCupDBYsGwVFGagQ1cCxyOIic5tu3uf6AJ7LsGumzKBQYBrrBEN/MPqPI1tHLpAkk
 ljHQf8RE5zjiCCYeU80YdiCCNZiBi0cYlg5wYwDUxG9ArHMumLXdKk2EuSENom43i7EnGP7jNmI
 MjIOp2eJ6RKAQJRd282VJLip4FwlRYlValB7TrirXsP6IuFrozmJ+14H5avL9KWTSlXzJY8bcIs
 wMlm0OYutv9pA5GZys0OzDcmYjmFO3m+r9lDKGIM6rZr3nMDM4E0nXYxf8sT8Zpb50X3CWMOOqd
 ah9Rmd/EzdZVGRJwb4o56qZO+
X-Received: by 2002:a05:6a20:12d4:b0:364:783:8c0e with SMTP id
 adf61e73a8af0-38deeaa93a7mr684654637.11.1768425891221; 
 Wed, 14 Jan 2026 13:24:51 -0800 (PST)
X-Received: by 2002:a05:6a20:12d4:b0:364:783:8c0e with SMTP id
 adf61e73a8af0-38deeaa93a7mr684628637.11.1768425890579; 
 Wed, 14 Jan 2026 13:24:50 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-81f8e6c26basm433696b3a.69.2026.01.14.13.24.49
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 13:24:50 -0800 (PST)
Message-ID: <c0bd2921-2f1c-405d-bab6-eb9ca6bcb141@canonical.com>
Date: Wed, 14 Jan 2026 13:24:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <3ef6ce03-637e-4e4c-875a-180d9daa400a@163.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <3ef6ce03-637e-4e4c-875a-180d9daa400a@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 1/14/26 01:19, Fei Shao wrote:
> Hi all,
> 
> 
> I write a py script to test the dac_override option, but I failed.
> The py script is :
> ----------------------------------------------------
> #!/usr/bin/env python3
> import os  # 用于文件/目录的基础操作（删除、判断文件是否存在）
> import time
> 
> def create_file(file_path, content="默认初始内容\n"):
>      try:
>          if os.path.exists(file_path):
>              print(f"⚠️ 文件 {file_path} 已存在，跳过新建操作")
>              return False
> 
>          with open(file_path, "w", encoding="utf-8") as f:
>              f.write(content)
>          print(f"successfully :{file_path}")
>          return True
>      except Exception as e:
>          print(f" failed : {e}")
>          return False
> 
> 
> if __name__ == "__main__":
>      test_file = "/home/sf/apparmor/test/test_file"+str(int(time.time())) +".txt"
>      create_file(test_file, "content of file \n")
> ----------------------------------------------------
> 
> 
> the profile is :
> --------------------------------------------------------
> abi <abi/4.0>,
> 
> include <tunables/global>
> 
> profile /home/sf/apparmor/operfile.py {
>    include <abstractions/base>
>    include <abstractions/evince>
>    include <abstractions/python>
> 
>    capability dac_override,
>    capability dac_read_search,
> 
>    /etc/apt/apt.conf.d/ r,
>    /etc/apt/apt.conf.d/** r,
> 
>    /home/sf/apparmor/operfile.py r,
>    /home/sf/apparmor/test/ rwix,
>    /home/sf/apparmor/test/** rw,
> 
>    /proc/self/mem r, # 进程内存访问（Python 运行必需）
>    /sys/devices/** r, # 系统设备信息（可选，视脚本需求）
>    /tmp/** rw, # 临时文件目录（Python 常用）
>    /usr/bin/python3.12 mrix,
>    /var/tmp/** rw, # 系统临时目录
>    owner /home/*/apparmor/ r,
>    /usr/lib/python3*/** r,        # Python 库文件读取
> 
> }
> 
> ---------------------------------------------------------------
> 
> I use the command "sudo aa-enforce home.sf.apparmor.operfile.py" to make sure the profile is loaded.
> 
> When the attribute of "/home/sf/apparmor/test/" is 755, the script worked well with command "./operfile.py".
> 
> When the attribute of "/home/sf/apparmor/test/" is 555,   command "./operfile.py" returned "failed : [Errno 13] Permission denied: '/home/sf/apparmor/test/test_file1768381998.txt'". If I use the "sudo ./operfile.py", the file could be created well.  It seems the dac_overried doesn't work here.
> 

who is the owner of the file in the failure case, and what is the user
id of the task trying to access the file.

As Zygmunt has already pointed out the AppArmor capability rule
doesn't elevate capabilities, it just ensures that the task can have
the given capability. AppArmor mediation works in conjunction with
regular DAC mediation, and is purely restrictive, that is to say
it will not allow something DAC doesn't allow.

While I don't have the full information about your system I am fairly
sure you are seeing DAC reject access to the file. If you look in your
system logs, you will find that there isn't an AppArmor denial message
for this event. Instead what is happening is AppArmor is allowing the
access but DAC is denying it.

> I checked with "sudo aa-logprof", but no information is returned.

this indicates that there isn't a denial message from apparmor in your logs

> Would you like tell me why the py script can't create file when test folder is 555 please?
> 
so as stated above this looks to be a DAC permission issue. Though I
will add on the AppArmor side the director permissions are not what is
important (they still are important on the DAC side). Instead AppArmor
permissions have to be set for the file within the dir (which you do
have in the profile).

> My os is ubuntu 2404 and my apparmor is 4.0.1.
> 
> Thanks
> 
> Fei Shao
> 
> 
> 


