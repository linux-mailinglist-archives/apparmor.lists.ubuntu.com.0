Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD557ADF4
	for <lists+apparmor@lfdr.de>; Wed, 20 Jul 2022 04:29:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oDzSa-0003e2-PK; Wed, 20 Jul 2022 02:29:12 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oDzSZ-0003dv-Cv
 for apparmor@lists.ubuntu.com; Wed, 20 Jul 2022 02:29:11 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 2D5763F3B9; 
 Wed, 20 Jul 2022 02:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1658284150;
 bh=9j/ZqHLMNdT5QMf1JvgP7iBoNYWJdux7J9tU03wREIM=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=rDojAGkctKN4FpCk51sLeFbhP9LNM4q0qtwFwbV9eMs2c61IFkE5c/xXsVBnmepjM
 SN5k5docgU8Xo6hw5MInmVYAUk0bU6strqyRLN65/t9q2NWd2E0GFm6KKGuDo4yUXC
 8Y3i8NNLA6eM24Tnh6FiOK0ZAko7pcq+VVhXWo6JS88T47M6B7xFbOcCXF7PxseSZt
 Npr5sU9j8ZVfUt4YReZP6NdwWHULL9cAGaJGw1wqqm1wbwiLWOb1IwdIH50RVdFOWB
 IF8Ijsrqcu0jeOkOJ3QUQKGensqtNbWg+2P6lITj7F7TgYF28EDWvbXnVJ9rS+bFJv
 1onzKBGzmICZg==
Message-ID: <110d78bc-d1f4-0b69-9562-c6758b39279d@canonical.com>
Date: Tue, 19 Jul 2022 19:29:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Souptick Joarder <jrdr.linux@gmail.com>, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com
References: <20220719021218.6807-1-jrdr.linux@gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220719021218.6807-1-jrdr.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: Mark alloc_unconfined() as static
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
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 7/18/22 19:12, Souptick Joarder wrote:
> From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>
> 
> Kernel test robot throws below warning ->
> security/apparmor/policy_ns.c:83:20: warning: no previous prototype
> for function 'alloc_unconfined' [-Wmissing-prototypes]
> 
> Mark it as static.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>

Thanks, I have pulled this into apparmor-next

Acked-by: John Johansen <john.johansen@canonical.com>


> ---
>   security/apparmor/policy_ns.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/policy_ns.c b/security/apparmor/policy_ns.c
> index 300953a02a24..4f6e9b3c24e6 100644
> --- a/security/apparmor/policy_ns.c
> +++ b/security/apparmor/policy_ns.c
> @@ -80,7 +80,7 @@ const char *aa_ns_name(struct aa_ns *curr, struct aa_ns *view, bool subns)
>   	return aa_hidden_ns_name;
>   }
>   
> -struct aa_profile *alloc_unconfined(const char *name)
> +static struct aa_profile *alloc_unconfined(const char *name)
>   {
>   	struct aa_profile *profile;
>   


