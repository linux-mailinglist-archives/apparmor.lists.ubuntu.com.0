Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC7BD22CD8
	for <lists+apparmor@lfdr.de>; Thu, 15 Jan 2026 08:27:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vgHl3-0004BB-FA; Thu, 15 Jan 2026 07:27:05 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vgHl1-0004Aw-Hb
 for apparmor@lists.ubuntu.com; Thu, 15 Jan 2026 07:27:03 +0000
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5E3D43F1C0
 for <apparmor@lists.ubuntu.com>; Thu, 15 Jan 2026 07:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768462023;
 bh=/KBNgon4Vfxjc8ejqhITVlCDpPeV9PH0mD3SmrzCBDY=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=KQOtdjluLIW8wc7rx9c/KuubLFfEVJpjeqOnEMvDWpBWTlEWn6kbNNoDCEJTFkUt3
 +aXOX/XyhvtAJRlGR1F/zLat9zSJpsNDa4UpAkjv01AAiOMJc/D20pzU0jSEeJepUx
 GciC6TYPxcNqW7LtVKH9dtDG6o8PwWCshOIZVSaFJj7ZgkGc1ANDvQ/kgbmUu9wZsv
 n22wwD7x+pICvRBzieRwNFkE1bD43Zrs8cPJnvMRRJEB9xDS1ziBUoBSYZZxl8RaA5
 g+CU7zgzc2mnk38cqbDrr4v/wbfHJPMEfMQwk0ztroojiF9HFurZAas2789t5FMI/7
 4R0q99vp4AXdXlazIehzp1AB6ZQ2xXmS76Rqdnxp4VBG0j9tj4pT+thzdCPLvE4m3j
 ISIOp94afUf8ml6dZwZdwiwAwBSTWlZfDZ5oLc9xs2up1cKBFvWamt35PT4ChCCt2q
 lk/paJLEwPPs1Ah6LrHxYz4BfMpvtmC71H4ha219DjKO5rmRfQ4Yb+IqpQMlcLn8+e
 4uZyw43bIgM7CH85WPqPUMTP3AU8QP1nka45wZwH739kHiV3EMjuQLVWs/3YLfCJSn
 +fNwfIIj3DSRsAUiSM3aOQ5eFIOysiO4ReoCMrWnHBByPFTsk+5/v0bnwhNABQsiN9
 AFenk0bkZ1avDmzLtVsJULd8=
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a13be531b2so7012465ad.2
 for <apparmor@lists.ubuntu.com>; Wed, 14 Jan 2026 23:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462022; x=1769066822;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/KBNgon4Vfxjc8ejqhITVlCDpPeV9PH0mD3SmrzCBDY=;
 b=h/VfC8ishaXbYZR6zDseXVPR7N7PpV/bXcTfTvfEDiqb6PTkIgvHfAFH14mhn+R34l
 5pkh9JnPKuTZWhydziChNXtHgdZ8nY1gGZMGdbPA2h7PQ3ztbK3Amrkn+TOzrwCfyyM+
 61Qg9y2svKsT4pO+wYhHRZ+gMfKnlLwgvxRvX46tasF7gRiugtmL4LbCEB9mFM0sjYwF
 SGWqZY7RQMSD3juck1w8VSKros1oQPm+FO/xUPxp/JUIB5+/kws1XEDk58tGT9mQ3Q97
 2SGYOJlX5aupBtnT4LovzNhLtdlMlbM+jgcqWeKH1vwxjISNXjuOSVPfbx98SZyqvLC9
 5MNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyuEaP2AnabMUbZWjeH6l3HkWmEjqotA/7aaMJL74C6FuWDVp1DOXFDCr7nOEmDFVEZU2vEGEZrA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzD4fid26UqtqVUQRHL1VY9Tacp0HySuAZOic5sJtQmGbbU+24m
 DNKrcmxItv8DZtLfqa9GgM2vu5v15yQQwz1vOxs7CsYos6jolgBbgLoRkBBVOkRENAO4nrVsCXW
 5PrL9jf03hWYCWSOze8K1AkJjCz4nY/PzsUqQ4eHBxjf1hiZXOpaKkZqsYlEKac4dnvFsMojubS
 ukO2ZEEXD7oQ==
X-Gm-Gg: AY/fxX6b2KOmQ7exzRrYJInjcw1VN8dEYcRf2cEKtAaCifzv7AcXGlZdhMPGVQDHV2L
 0y3lKHKcvk9E2eR17f+MCy6gzNTR/8MmemeUuzylnqFCFY3fgisX01Ev6sjxQMNYkAX+7mdH7+n
 SKMATUO4TMz/odQ7S9mDsgF66Fj6QBxutYYZigCUmrAgiiDmhcqFt4UqHfMjtO+Mzo4abe4a27C
 QwEztU4yMqN7m343JW2WbUOuNGq9oem9z2dFOnRkTUXhir1qI9nrV9pKyf9m7fLXf2NUH+y3UyF
 QmYzOe9XcS520A/vBSQ166P5igvNMqW7rcXtRrJqP1zgjag22XobpIdTXqde5XpHVIhrWId1ls4
 cyM5w4axRtnijSO/aJWQYId1Q
X-Received: by 2002:a17:903:2304:b0:29e:5623:7fc3 with SMTP id
 d9443c01a7336-2a59bae7ebbmr45733155ad.12.1768462021854; 
 Wed, 14 Jan 2026 23:27:01 -0800 (PST)
X-Received: by 2002:a17:903:2304:b0:29e:5623:7fc3 with SMTP id
 d9443c01a7336-2a59bae7ebbmr45733005ad.12.1768462021437; 
 Wed, 14 Jan 2026 23:27:01 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2a3e3c3a204sm241678355ad.1.2026.01.14.23.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 23:27:00 -0800 (PST)
Message-ID: <e8c5e37a-f718-4165-8043-ca123055941a@canonical.com>
Date: Wed, 14 Jan 2026 23:26:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fei Shao <robinshao007@163.com>, apparmor@lists.ubuntu.com
References: <3ef6ce03-637e-4e4c-875a-180d9daa400a@163.com>
 <c0bd2921-2f1c-405d-bab6-eb9ca6bcb141@canonical.com>
 <ae030ecd-c7f0-4c34-94e4-48addc78c9f9@163.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <ae030ecd-c7f0-4c34-94e4-48addc78c9f9@163.com>
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

On 1/14/26 18:05, Fei Shao wrote:
> 
> 
> 在 2026-01-15 5:24, John Johansen 写道:
>> On 1/14/26 01:19, Fei Shao wrote:
>>> Hi all,
>>>
>>>
>>> I write a py script to test the dac_override option, but I failed.
>>> The py script is :
>>> ----------------------------------------------------
>>> #!/usr/bin/env python3
>>> import os  # 用于文件/目录的基础操作（删除、判断文件是否存在）
>>> import time
>>>
>>> def create_file(file_path, content="默认初始内容\n"):
>>>      try:
>>>          if os.path.exists(file_path):
>>>              print(f"⚠️ 文件 {file_path} 已存在，跳过新建操作")
>>>              return False
>>>
>>>          with open(file_path, "w", encoding="utf-8") as f:
>>>              f.write(content)
>>>          print(f"successfully :{file_path}")
>>>          return True
>>>      except Exception as e:
>>>          print(f" failed : {e}")
>>>          return False
>>>
>>>
>>> if __name__ == "__main__":
>>>      test_file = "/home/sf/apparmor/test/test_file"+str(int(time.time())) +".txt"
>>>      create_file(test_file, "content of file \n")
>>> ----------------------------------------------------
>>>
>>>
>>> the profile is :
>>> --------------------------------------------------------
>>> abi <abi/4.0>,
>>>
>>> include <tunables/global>
>>>
>>> profile /home/sf/apparmor/operfile.py {
>>>    include <abstractions/base>
>>>    include <abstractions/evince>
>>>    include <abstractions/python>
>>>
>>>    capability dac_override,
>>>    capability dac_read_search,
>>>
>>>    /etc/apt/apt.conf.d/ r,
>>>    /etc/apt/apt.conf.d/** r,
>>>
>>>    /home/sf/apparmor/operfile.py r,
>>>    /home/sf/apparmor/test/ rwix,
>>>    /home/sf/apparmor/test/** rw,
>>>
>>>    /proc/self/mem r, # 进程内存访问（Python 运行必需）
>>>    /sys/devices/** r, # 系统设备信息（可选，视脚本需求）
>>>    /tmp/** rw, # 临时文件目录（Python 常用）
>>>    /usr/bin/python3.12 mrix,
>>>    /var/tmp/** rw, # 系统临时目录
>>>    owner /home/*/apparmor/ r,
>>>    /usr/lib/python3*/** r,        # Python 库文件读取
>>>
>>> }
>>>
>>> ---------------------------------------------------------------
>>>
>>> I use the command "sudo aa-enforce home.sf.apparmor.operfile.py" to make sure the profile is loaded.
>>>
>>> When the attribute of "/home/sf/apparmor/test/" is 755, the script worked well with command "./operfile.py".
>>>
>>> When the attribute of "/home/sf/apparmor/test/" is 555,  command "./operfile.py" returned "failed : [Errno 13] Permission denied: '/home/sf/apparmor/test/test_file1768381998.txt'". If I use the "sudo ./operfile.py", the file could be created well.  It seems the dac_overried doesn't work here.
>>>
>>
>> who is the owner of the file in the failure case, and what is the user
>> id of the task trying to access the file.
>>
>> As Zygmunt has already pointed out the AppArmor capability rule
>> doesn't elevate capabilities, it just ensures that the task can have
>> the given capability. AppArmor mediation works in conjunction with
>> regular DAC mediation, and is purely restrictive, that is to say
>> it will not allow something DAC doesn't allow.
>>
>> While I don't have the full information about your system I am fairly
>> sure you are seeing DAC reject access to the file. If you look in your
>> system logs, you will find that there isn't an AppArmor denial message
>> for this event. Instead what is happening is AppArmor is allowing the
>> access but DAC is denying it.
>>
>>> I checked with "sudo aa-logprof", but no information is returned.
>>
>> this indicates that there isn't a denial message from apparmor in your logs
>>
>>> Would you like tell me why the py script can't create file when test folder is 555 please?
>>>
>> so as stated above this looks to be a DAC permission issue. Though I
>> will add on the AppArmor side the director permissions are not what is
>> important (they still are important on the DAC side). Instead AppArmor
>> permissions have to be set for the file within the dir (which you do
>> have in the profile).
> 
> What is the function of the configuration option *|capability dac_override|*?
> 
removing the dac_override capability from privileged processes (aka root), so
where possible the application runs with a reduced privilege set.

>>
>>> My os is ubuntu 2404 and my apparmor is 4.0.1.
>>>
>>> Thanks
>>>
>>> Fei Shao
>>>
>>>
>>>
>>
> 


