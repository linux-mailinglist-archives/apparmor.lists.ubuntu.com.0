Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3364EB417F1
	for <lists+apparmor@lfdr.de>; Wed,  3 Sep 2025 10:06:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1utiVz-0006EF-LA; Wed, 03 Sep 2025 08:06:47 +0000
Received: from smtp-out3.simply.com ([94.231.106.210])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <andreas@gaisler.com>)
 id 1utPRa-00069Z-Iu
 for apparmor@lists.ubuntu.com; Tue, 02 Sep 2025 11:44:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by smtp.simply.com (Simply.com) with ESMTP id 4cGP6x6Rpwz1FZPJ;
 Tue,  2 Sep 2025 13:44:57 +0200 (CEST)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se
 [98.128.223.123])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4cGP6w5mgsz1FXjD;
 Tue,  2 Sep 2025 13:44:56 +0200 (CEST)
Message-ID: <92bace9a-b5c4-4ea1-a1f7-4742c15a64a0@gaisler.com>
Date: Tue, 2 Sep 2025 13:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Arnd Bergmann <arnd@arndb.de>
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
 <f2371539-cd4e-4d70-9576-4bb1c677104c@gaisler.com>
 <11a4d0a953e3a9405177d67f287c69379a2b2f8f.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <11a4d0a953e3a9405177d67f287c69379a2b2f8f.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.231.106.210; envelope-from=andreas@gaisler.com;
 helo=smtp-out3.simply.com
X-Mailman-Approved-At: Wed, 03 Sep 2025 08:06:38 +0000
Subject: Re: [apparmor] [PATCH v2 3/4] arch: copy_thread: pass clone_flags
	as u64
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
Cc: linux-sh@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 selinux@vger.kernel.org, linux-um@lists.infradead.org,
 apparmor@lists.ubuntu.com, linux-block@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2025-09-02 09:15, John Paul Adrian Glaubitz wrote:
>> Thanks for this and for the whole series! Needed foundation for a
>> sparc32 clone3 implementation as well.
> 
> Can you implement clone3 for sparc64 as well?

(heavily pairing down the to list)

We'll take a look at that as well.

Cheers,
Andreas


