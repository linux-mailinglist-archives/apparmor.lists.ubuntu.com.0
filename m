Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E59C744A68
	for <lists+apparmor@lfdr.de>; Sat,  1 Jul 2023 18:01:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qFd1l-00070u-2K; Sat, 01 Jul 2023 16:00:49 +0000
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by huckleberry.canonical.com with esmtp (Exim 4.86_2)
 (envelope-from <me@beroal.in.ua>) id 1qFd1k-00070n-7F
 for apparmor@lists.ubuntu.com; Sat, 01 Jul 2023 16:00:48 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO00666D;
 1 Jul 2023 19:00:50 +0300
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 1 Jul 2023 19:00:47 +0300
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG00666A; 1 Jul 2023 19:00:39 +0300
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 361G0ZU8019526
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <apparmor@lists.ubuntu.com>; Sat, 1 Jul 2023 19:00:36 +0300
Message-ID: <2c7b993c-6bb6-7558-f0aa-ddbc28ebe380@beroal.in.ua>
Date: Sat, 1 Jul 2023 19:00:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: apparmor@lists.ubuntu.com
Content-Language: en-US
From: me@beroal.in.ua
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] May a GUI program be manipulated via a display server
	socket?
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

Hi. Suppose that a program M (malicious) tries to open a URL in a web 
browser V (victim). In a typical AppArmor profile for M, V is executed 
with the `Px` mode, for example:

```
/usr/lib/firefox/firefox Px,
```

Can M give V an environment variable (`WAYLAND_DISPLAY` for Wayland or 
`DISPLAY` for X11) which tells V to execute user input from a Unix 
socket which M controls? If yes, then M can do something on websites 
under the name of a user. In other words, V isn't isolated after all.

I'm worried because this situation is quite common. Many programs are 
expected to open a URL, and many jobs are controlled via a web browser 
nowadays.


