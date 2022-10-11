Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AB85FAA77
	for <lists+apparmor@lfdr.de>; Tue, 11 Oct 2022 04:07:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oi4gJ-000142-Nk; Tue, 11 Oct 2022 02:07:43 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oi4gI-00013v-0a
 for apparmor@lists.ubuntu.com; Tue, 11 Oct 2022 02:07:42 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 1C587401B5; 
 Tue, 11 Oct 2022 02:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1665454059;
 bh=YhGmLBEzGnw2BU3ecsBkuHOHWJmHOdBpaqjMHif3Ps8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=bSCqcbH1FII0CwcPsw8We/01oY0wab5jxrZZ+9abqcR4NhSYrUbCYn2EoQua33aYr
 O4OzLpx2OZXxExOW8xD350hSUduYi6mwn7BrwHqLaR8DclyhMRdi9QYvDuyR7AQnYH
 CquY4TBEmz3ut67vx8iWHay2EmKQvhh8JFPj64LOQLZ731bZe/tnfh9qj2CCpAHaqo
 gFS/p42KBCOgIHrunNVzZ2ot4zJRsTfjihortNVnNjgcZ9eObEkk9RNTDWHd7Kg6+E
 n/hWN8aoDmIWaca0pOgIrl56MKqdgyX+3s2LkBG6Nlh8aSaYhax2S7J6thzEc7+XP+
 Z4B8ejjT4pudA==
Message-ID: <aa1e5177-157a-4ec3-0da0-cb30a2337b3b@canonical.com>
Date: Mon, 10 Oct 2022 19:07:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <20221008063411.14829-1-jiapeng.chong@linux.alibaba.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221008063411.14829-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH 1/3] AppArmor: Fix kernel-doc
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
> security/apparmor/audit.c:93: warning: expecting prototype for audit_base(). Prototype was for audit_pre() instead.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2339
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into my tree

> ---
>   security/apparmor/audit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/audit.c b/security/apparmor/audit.c
> index 8dfdda98fbf1..5a7978aa4b19 100644
> --- a/security/apparmor/audit.c
> +++ b/security/apparmor/audit.c
> @@ -83,7 +83,7 @@ static const char *const aa_class_names[] = {
>    */
>   
>   /**
> - * audit_base - core AppArmor function.
> + * audit_pre() - core AppArmor function.
>    * @ab: audit buffer to fill (NOT NULL)
>    * @ca: audit structure containing data to audit (NOT NULL)
>    *


