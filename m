Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8110751CCF8
	for <lists+apparmor@lfdr.de>; Fri,  6 May 2022 01:50:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nmlF3-0003bb-LD; Thu, 05 May 2022 23:50:41 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nmlF2-0003bR-4O
 for apparmor@lists.ubuntu.com; Thu, 05 May 2022 23:50:40 +0000
Received: from [10.8.192.2] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B101F3F12A; 
 Thu,  5 May 2022 23:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1651794638;
 bh=dSmM81Jr6aZxH4buxfxvj3u5nJy76Cg4xdcCmI7lfUc=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=Mbuw3EixTZzxk0F+fbfACWOGQSoe0i+dp+1uEUsj3FvbxFN5iWbo8gvlY/PSVcgBx
 7+3Lw5Sa9TOtx4uk2zNqL/iXG440ab0S9fnnTp9OfqBRyyTnoZydS8y45oZJ7528St
 DRaI8jkWJKitrQBeh16lwZ50+IUqGifCKRYv302oSq8Q86DwVz5AjVWl3RFfxbtb/n
 +VL2qKakkT9fAGx21hREDMWDBuwQTQKzdFAquKPj/iVrDndft5IDCkM3Yt2sLP+SX7
 BmG2xGcG/ZBReF6n9D2YZwK+9HE5490XcOYJzXFg5LNQC/K5dCNur4KVArfVw41ik3
 Id6i2qXrAlGbw==
Message-ID: <152c0b41-5e7b-9c46-3f87-b91bafa5450f@canonical.com>
Date: Thu, 5 May 2022 16:50:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>, apparmor@lists.ubuntu.com
References: <CAODFaZ4bBHgc9zn9qphV_X5FiSregdUajmK80bFGiqJTb=fZbw@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <CAODFaZ4bBHgc9zn9qphV_X5FiSregdUajmK80bFGiqJTb=fZbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] Apparmor : wild cards/CPU spike
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

On 5/5/22 11:34, Murali Selvaraj wrote:
> Hi All,
> 
> I have enabled Apparmor in my embedded system running in 4.9 Kernel and 4 processes are running in enforce mode.
> 
> I have an entry in all four profiles ( */tmp/** rw*).  Do you think it will cause the CPU spike?

it should not. The additional mediation beyond DAC does cause some additional overhead. How much depends on
the test/syscall but generally the value is small on the order of 1% or in stastically noise.

> If we have multiple wild card entries in the profile, will it really cause the CPU spike.
> 
no more than any other rule. AppArmor policy goes throw a compile that builds a minimized state
machine. This means that the runtime cost does not vary by the number of rules, or the type
of rules used. Whether you have 1 rule or 10k rules whether they are all just name matches or
all the rules are using wild cards.

The time taken to do a match is based on the length of the path being matched and is similar to
the cost of string compare.

> I compared profiles in enforce vs disable; I could see the overall CPU usage around 1% difference.
> Do we have any CPU threshold impact as expected by enabling Apparmor? 
> 

It very much depends on the workload and I will add the caveat that I haven't done any performance
overhead testing recently, but around 1% is was what testing averaged last I looked. I should also
note that unconfined generally doesn't have measurable overhead as it is treated specially to
minimize time in the apparmor code. This means that only applications that are confined should see
mediation overhead.

> Please share your suggestions.
> 
> Thanks
> Murali.S


