Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7499C287D
	for <lists+apparmor@lfdr.de>; Sat,  9 Nov 2024 00:59:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1t9Ysy-0003PJ-FF; Fri, 08 Nov 2024 23:59:28 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1t96FJ-00040s-Cy
 for apparmor@lists.ubuntu.com; Thu, 07 Nov 2024 17:24:37 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <75ea2e8a-fc2e-487a-8f20-c0664b1eaf05@canonical.com>
Date: Thu, 7 Nov 2024 18:24:22 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <8EE9A6D7-A3F1-4A77-9345-9E1C5B3C0DA3@linux.dev>
References: <20241107112526.2312-2-thorsten.blum@linux.dev>
 <75ea2e8a-fc2e-487a-8f20-c0664b1eaf05@canonical.com>
To: John Johansen <john.johansen@canonical.com>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.170;
 envelope-from=thorsten.blum@linux.dev; helo=out-170.mta0.migadu.com
X-Mailman-Approved-At: Fri, 08 Nov 2024 23:59:27 +0000
Subject: Re: [apparmor] [RESEND PATCH] apparmor: Remove unnecessary NULL
 check before kvfree()
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
Cc: Paul Moore <paul@paul-moore.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 linux-security-module@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 7. Nov 2024, at 18:09, John Johansen wrote:
> On 11/7/24 03:25, Thorsten Blum wrote:
>> Since kvfree() already checks if its argument is NULL, an additional
>> check before calling kvfree() is unnecessary and can be removed.
>> Remove it and the following Coccinelle/coccicheck warning reported by
>> ifnullfree.cocci:
>>   WARNING: NULL check before some freeing functions is not needed
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> 
> sorry I am way way behind on this. I am going to work through the backlog
> on this list today.
> 
> Acked-by: John Johansen <john.johansen@canonical.com>
> 
> I have pulled this in to my local tree, and will push it up in a few
> hours once I been through the other patches and testing.

No worries and thanks for the update.

Thorsten

