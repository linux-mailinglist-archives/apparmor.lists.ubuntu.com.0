Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC6B55550F
	for <lists+apparmor@lfdr.de>; Wed, 22 Jun 2022 21:50:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1o46MZ-0006xA-IW; Wed, 22 Jun 2022 19:50:07 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1o46MW-0006wu-WD
 for apparmor@lists.ubuntu.com; Wed, 22 Jun 2022 19:50:05 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id BDA954162B; 
 Wed, 22 Jun 2022 19:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1655927404;
 bh=EkPLoMlB5urjTl/KfgKOygiZqi6zn+K/seeJTHaMOME=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=FSNbigvl5J71VArTsLrqadPIQK76Q8y+Ll+gjMoPoF4ZDMzxmEKfCIy/bUBXYuxxb
 x/PSOaQY8hS1Egjv5/a4nvocVSJO8cPuWTO83ppDM4qugJuyJvU/CX6z+O/b7aHijr
 TvChCox9Fs214d4wWnsgugtQobh3h6BOZJxelzyAQu3n/0O2Lvm/jFVlfpp0CTK0Gr
 1SY7W3OOD8HClN3PHJktYqPGA9a0C6SG3BbbBkXylsL4+OBA9xouogdOKzx4Kd0rdr
 EEL+bCJnEJMeekndLPNb3XjRoMBtMwkGyPpnAptMvgNCOeuJXjA/owdGPoLwCdrV5k
 /k38nwUDRIqXQ==
Message-ID: <3839b02b-36b2-a722-83f9-1e86e66746f2@canonical.com>
Date: Wed, 22 Jun 2022 12:49:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Xiu Jianfeng <xiujianfeng@huawei.com>, jmorris@namei.org, serge@hallyn.com
References: <20220614090001.155107-1-xiujianfeng@huawei.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220614090001.155107-1-xiujianfeng@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH -next] apparmor: Fix memleak in
 aa_simple_write_to_buffer()
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Sorry this feel through the cracks some how.

Acked-by: John Johansen <john.johansen@canonical.com>

I will pull this into my tree and send it up with my next pull request.

On 6/14/22 02:00, Xiu Jianfeng wrote:
> When copy_from_user failed, the memory is freed by kvfree. however the
> management struct and data blob are allocated independently, so only
> kvfree(data) cause a memleak issue here. Use aa_put_loaddata(data) to
> fix this issue.
> 
> Fixes: a6a52579e52b5 ("apparmor: split load data into management struct and data blob")
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
> ---
>  security/apparmor/apparmorfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 8b9c92f3ff95..0275a350dc23 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -403,7 +403,7 @@ static struct aa_loaddata *aa_simple_write_to_buffer(const char __user *userbuf,
>  
>  	data->size = copy_size;
>  	if (copy_from_user(data->data, userbuf, copy_size)) {
> -		kvfree(data);
> +		aa_put_loaddata(data);
>  		return ERR_PTR(-EFAULT);
>  	}
>  


