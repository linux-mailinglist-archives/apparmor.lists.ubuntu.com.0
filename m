Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D05CD1C8DC
	for <lists+apparmor@lfdr.de>; Wed, 14 Jan 2026 06:10:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vft9J-0000KR-Si; Wed, 14 Jan 2026 05:10:29 +0000
Received: from m16.mail.163.com ([220.197.31.3])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <robinshao007@163.com>)
 id 1vft9H-0000Io-Sp
 for apparmor@lists.ubuntu.com; Wed, 14 Jan 2026 05:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:To:From:Subject:
 Content-Type; bh=Ng0Oa3fn0f8I/E6u4EbYtkDQTMevfKsklFzTrNsc67s=;
 b=faT6eO4TVmS2kCWZJzp0lr6bpTJ7k59Z6f4R7hRrNNn31PwIjzZ8OFhJChe3ve
 4Hak61YfecrfdsKdcLq1Trt5R4C7jbYpvoCDCIkahpomiJnFFfgHZ5Pt9eY7fBYU
 XkSaO51mub69FGt5fjshXvZSBShBHrbAe/vTtceZDNXzg=
Received: from [192.168.3.175] (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wAH05Y5JWdpjWwkFg--.1040S2; 
 Wed, 14 Jan 2026 13:10:18 +0800 (CST)
Message-ID: <f3721413-a4ee-4efc-8bbb-60c19d8d5acf@163.com>
Date: Wed, 14 Jan 2026 13:10:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
From: Fei Shao <robinshao007@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAH05Y5JWdpjWwkFg--.1040S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtryDJr4kCFy3Kw1DXw15twb_yoW3trc_Aa
 4DAF1jqr1UJF17J3WUtr1UJr18Jr1UXr12qF1xXrWDJF1xJrykJFnrJ3y5Xr1UWF18XryU
 Xr1UXryrJr1UJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUAwIPUUUUU==
X-Originating-IP: [113.215.70.110]
X-CM-SenderInfo: purex0pvkd0iiqx6il2tof0z/xtbC7BqLlmlnJTrsagAA38
Received-SPF: pass client-ip=220.197.31.3; envelope-from=robinshao007@163.com;
 helo=m16.mail.163.com
Subject: [apparmor] [ISSUE]Does apparmor support the port limit for app
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
I write a profile for nginx like below:
---------------------------------------------
profile /usr/sbin/nginx {
   include <abstractions/base>


   capability net_bind_service,
   capability setuid,
   capability setgid,

   capability dac_read_search,


   network inet tcp port=80,   #<==this line
   /usr/sbin/nginx mrix,
/etc/nginx/** r,
/var/log/nginx/** rw,
}
---------------------------------------------

if put the "network inet tcp port=80" in usr.sbin.nginx file, the 
aa-enforce return is :

---------------------------------------------
sudo aa-enforce usr.sbin.nginx
ERROR: Invalid or unknown keywords in 'network  inet tcp port=80
---------------------------------------------

so I have an issue about this, does apparmor support the port limit for 
app please?


Thanks

Fei Shao


