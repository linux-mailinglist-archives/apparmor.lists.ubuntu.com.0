Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 056F15A0018
	for <lists+apparmor@lfdr.de>; Wed, 24 Aug 2022 19:10:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oQttL-0005ok-Uf; Wed, 24 Aug 2022 17:10:11 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oQttJ-0005oV-Cj
 for apparmor@lists.ubuntu.com; Wed, 24 Aug 2022 17:10:09 +0000
Received: from [10.0.0.100]
 (cpe5896308f56e8-cm5896308f56e6.cpe.net.cable.rogers.com [99.255.30.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 3B56D3F04B; 
 Wed, 24 Aug 2022 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1661361008;
 bh=tUvu8igyJ8SieKzyGBjoH9CdpCFj5M06wi08ejJhQtk=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Xts7TuuryXoFLDS4GpHrw+LeRz7edXUpX+4dYUmPobUcQ+KJnICV0WlWUTmfjg9Pd
 MPi0RNfOYAe9QXzE7eWT8pWjLNW2JuMRFcTTbmUt02DzbBGfl8KRVjxVP8ObSYvfNx
 gsoBsXaGvoQF/Yk9yMYP4e2PZIrBd2ZCzR/PygfjgVWI5+zs8z7KEwhsCXD3h/zyFl
 pvEdmX3t7jtBKYPGreXYoYX4bOwL12J/44sU7tv5ToeYLWw3DbuTRv6NC0aYrcOnT6
 ppDSZuE6169ipImQTGbppm1g6TVf+1boo+4Wp5sUPK/kgO/AEqTQG3q+Yhlu2WfHp/
 CiZVqqkCaUTiw==
Message-ID: <90e259e4-6877-ee1e-ed6e-aa972f305126@canonical.com>
Date: Wed, 24 Aug 2022 10:10:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com
References: <20220823011503.2757088-1-cuigaosheng1@huawei.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220823011503.2757088-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: fix a memleak in
	multi_transaction_new()
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

On 8/22/22 18:15, Gaosheng Cui wrote:
> In multi_transaction_new(), the variable t is not freed or passed out
> on the failure of copy_from_user(t->data, buf, size), which could lead
> to a memleak.
> 
> Fix this bug by adding a put_multi_transaction(t) in the error path.
> 
> Fixes: 1dea3b41e84c5 ("apparmor: speed up transactional queries")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

yep, thanks. I will pull this into apparmor-next

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/apparmorfs.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index d066ccc219e2..7160e7aa58b9 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -868,8 +868,10 @@ static struct multi_transaction *multi_transaction_new(struct file *file,
>   	if (!t)
>   		return ERR_PTR(-ENOMEM);
>   	kref_init(&t->count);
> -	if (copy_from_user(t->data, buf, size))
> +	if (copy_from_user(t->data, buf, size)) {
> +		put_multi_transaction(t);
>   		return ERR_PTR(-EFAULT);
> +	}
>   
>   	return t;
>   }


