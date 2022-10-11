Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CCD5FAA7B
	for <lists+apparmor@lfdr.de>; Tue, 11 Oct 2022 04:08:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oi4gZ-00016o-RH; Tue, 11 Oct 2022 02:07:59 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oi4gY-00016a-VN
 for apparmor@lists.ubuntu.com; Tue, 11 Oct 2022 02:07:58 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id E7AAA401B5; 
 Tue, 11 Oct 2022 02:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1665454078;
 bh=cHcNseQwUTp3FPcIMTHgHU83y+HrOU+Ge3hY4Xs+g0A=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=hnkDwRENocAnksmik2JMbNCXm77AT1LQP2otJZV+LQTAXQ62FvJU2zDv6fhQRSD0g
 2mEBYG+3Pgo5WP1pZBhi0nrQY0q9C5voFBJ3Mhk+R/eGpEf70hhSNQI9NQn+GFl0XX
 CmZIfI1Djy8JEKElAdTK15J1gUw+MU+AU/c4pZ43L5t4O2zzLZ5gX31vMSwM09gDsc
 cdNz7putiNbecsAsReUT881PjGE4PFJWkmoAdEbQQllGqVR0SSS05c7kesvFGc/oob
 4GDgk6BfYMHbO50mQluWR3vmIySEG8D8O4msi8S15ThouSZ9UBY/3kKW0uYjoVlbQs
 k0lv/UClv725w==
Message-ID: <5225f90f-eb9f-c3c3-c266-f1e52b29ba34@canonical.com>
Date: Mon, 10 Oct 2022 19:07:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <20221008063411.14829-1-jiapeng.chong@linux.alibaba.com>
 <20221008063411.14829-2-jiapeng.chong@linux.alibaba.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221008063411.14829-2-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH 2/3] LSM: Fix kernel-doc
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
> security/apparmor/lsm.c:753: warning: expecting prototype for apparmor_bprm_committed_cred(). Prototype was for apparmor_bprm_committed_creds() instead.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2338
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into my tree

> ---
>   security/apparmor/lsm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index cc83cbf2ce20..c56afd1307c1 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -746,7 +746,7 @@ static void apparmor_bprm_committing_creds(struct linux_binprm *bprm)
>   }
>   
>   /**
> - * apparmor_bprm_committed_cred - do cleanup after new creds committed
> + * apparmor_bprm_committed_creds() - do cleanup after new creds committed
>    * @bprm: binprm for the exec  (NOT NULL)
>    */
>   static void apparmor_bprm_committed_creds(struct linux_binprm *bprm)


