Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C476BD221BA
	for <lists+apparmor@lfdr.de>; Thu, 15 Jan 2026 03:17:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vgCuw-0004Ok-6N; Thu, 15 Jan 2026 02:16:58 +0000
Received: from m16.mail.163.com ([220.197.31.4])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <robinshao007@163.com>)
 id 1vfZwS-0003Km-Gf
 for apparmor@lists.ubuntu.com; Tue, 13 Jan 2026 08:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:To:From:Subject:
 Content-Type; bh=d/8ezcxCL9/SJwNVeAGUr3cNY46Dj91EWkFyzTDqvWQ=;
 b=qbKSvYdYYSgVVk7pME2oTaBf5ky6E38vYXp/Nq7Ai+Zzxis9Xd+ibiRAJ5L/x0
 PR4yTMiPoGxDL9973SqnykaNp1jxNX21/CBTCpEWNM/nsvqLh3BVJ+vtfS0pLDip
 twxrhLKl5z6LysHYjThkY6HSLttk+wekpWCUJNbse6rZo=
Received: from [192.168.3.175] (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgC3ntbPBGZp84UsKg--.492S2;
 Tue, 13 Jan 2026 16:39:45 +0800 (CST)
Message-ID: <f672976a-5aa3-44c0-87df-a450a122ab2b@163.com>
Date: Tue, 13 Jan 2026 16:39:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
From: Fei Shao <robinshao007@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgC3ntbPBGZp84UsKg--.492S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtryDJr4kCFy3Kw1DXw15twb_yoW3trc_Aa
 4DAF1jqr1UJF17J3WUtr1UJr18Jr1UXr12qF1xXrWDJF1xJrykJFnrJ3y5Xr1UWF18XryU
 Xr1UXryrJr1UJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUtC7UUUUUU==
X-Originating-IP: [113.215.70.101]
X-CM-SenderInfo: purex0pvkd0iiqx6il2tof0z/xtbC6xEpNGlmBNGgmQAA3E
Received-SPF: pass client-ip=220.197.31.4; envelope-from=robinshao007@163.com;
 helo=m16.mail.163.com
X-Mailman-Approved-At: Thu, 15 Jan 2026 02:16:55 +0000
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


