Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 869345FAA7C
	for <lists+apparmor@lfdr.de>; Tue, 11 Oct 2022 04:08:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oi4gs-0001Bz-VX; Tue, 11 Oct 2022 02:08:18 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oi4gr-0001Bj-4A
 for apparmor@lists.ubuntu.com; Tue, 11 Oct 2022 02:08:17 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 0C7BB401B5; 
 Tue, 11 Oct 2022 02:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1665454095;
 bh=4WO49grOBiJl/rCd0rQT7UkOwQnggatViyK+FXpwnNE=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=at/Rgt8prKMh6H7gS5msExDuUtmEatDaXOAoCMK2ys5hi1eXwx1nPmnbf0itOxEzg
 SCPiuNM+CP6bgoP1+9jQHlsl2X6zsoDOdoR2gXNYtcjNmRKXxJiSJfcFKuanAETG5Z
 zZHAvhBwMpUPPZ7rF559H2luJgojkVOagWEqk5vCfx7jTQGBI00tuFM8boo1MZjA4n
 AbPcw1WDoC1GfJlrHeVuFuDaYo0GZL772mlV8XCI1pUWu5rlOP9Vc77uQf6EqmjRKF
 PQ9SkrqeZ7E63IgJf7o6WTuHy2wvhOd96qFbpLbRgQD3Jjch0H5qDh8ttmCKJDqlCW
 krv5UxkWF9o4g==
Message-ID: <3f84d6aa-f472-a1dc-dd05-a32267a6d074@canonical.com>
Date: Mon, 10 Oct 2022 19:08:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <20221008063411.14829-1-jiapeng.chong@linux.alibaba.com>
 <20221008063411.14829-3-jiapeng.chong@linux.alibaba.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221008063411.14829-3-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH 3/3] AppArmor: Fix kernel-doc
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
Cc: paul@paul-moore.com, Abaci Robot <abaci@linux.alibaba.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 10/7/22 23:34, Jiapeng Chong wrote:
> security/apparmor/ipc.c:53: warning: expecting prototype for audit_cb(). Prototype was for audit_signal_cb() instead.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2337
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into my tree

> ---
>   security/apparmor/ipc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/ipc.c b/security/apparmor/ipc.c
> index 1d4099385bdf..5acde746775f 100644
> --- a/security/apparmor/ipc.c
> +++ b/security/apparmor/ipc.c
> @@ -45,7 +45,7 @@ static const char *audit_signal_mask(u32 mask)
>   }
>   
>   /**
> - * audit_cb - call back for signal specific audit fields
> + * audit_signal_cb() - call back for signal specific audit fields
>    * @ab: audit_buffer  (NOT NULL)
>    * @va: audit struct to audit values of  (NOT NULL)
>    */


