Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D86748B35
	for <lists+apparmor@lfdr.de>; Wed,  5 Jul 2023 20:02:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qH6pk-0001I6-Dk; Wed, 05 Jul 2023 18:02:32 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qH6pj-0001Hz-3K
 for apparmor@lists.ubuntu.com; Wed, 05 Jul 2023 18:02:31 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C2F0E414C5; 
 Wed,  5 Jul 2023 18:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1688580150;
 bh=Ml6u5VGqvgonexNAqzQPeVeGEc4fEqTY9Ir/lPqp668=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=AzfHjPOox/m5CoOulzZnHpGWwEKBBxqulnzx2rQ2j1AYoBK1KhcgztMTACpRInTn0
 xx7EU/9BRkeGy2QGWjuDDUrjCVThjXLQrjq8UVAKOppxbD9uy9gSk2V35n3vz35Ema
 LEFJHwuJowPA6ZayZDET+gFpG9BZtQ8G2QpqfleIgEFwTRuntLyS7m9P6OBOaTAf1C
 ZRfyMWZami/mCsutIfPqphb8dagEYXv7GSx0/a5CczOUuhakm4B161EEbF4PPU6V+j
 huJeHxppPElk79gu8QRdQKHC/eNEClVXqAuIhhVnCvP+AI/NlalhwgQxj4ViLlYZ0x
 sp0FDsk8t2xTQ==
Message-ID: <30faaa83-bdb3-69b8-1fa9-7c1f4f011045@canonical.com>
Date: Wed, 5 Jul 2023 11:02:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Minjie Du <duminjie@vivo.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Nick Terrell <terrelln@fb.com>,
 "moderated list:APPARMOR SECURITY MODULE" <apparmor@lists.ubuntu.com>,
 "open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230704085653.6443-1-duminjie@vivo.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230704085653.6443-1-duminjie@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH v1] security: remove duplicate logical
	judgments in return
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
Cc: opensource.kernel@vivo.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 7/4/23 01:56, Minjie Du wrote:
> Fix: delate duplicate logical judgments:
> aa_unpack_u32(e, &perm->allow, NULL);
> Please check this. Thank you!
> 
> Signed-off-by: Minjie Du <duminjie@vivo.com>

NAK, it is a bug but not in a way that we can do this, which will break the unpack. The first entry is reserved, and for the moment should be skipped. Double loading to
&perm->allow, effectively does that but was not what was intended either. There is a patch coming that loads the first entry to a tmp variable and does a check that it is 0.

> ---
>   security/apparmor/policy_unpack.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> index 694fb7a09..2069adf0a 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -646,7 +646,6 @@ static bool unpack_perm(struct aa_ext *e, u32 version, struct aa_perms *perm)
>   		return false;
>   
>   	return	aa_unpack_u32(e, &perm->allow, NULL) &&
> -		aa_unpack_u32(e, &perm->allow, NULL) &&
>   		aa_unpack_u32(e, &perm->deny, NULL) &&
>   		aa_unpack_u32(e, &perm->subtree, NULL) &&
>   		aa_unpack_u32(e, &perm->cond, NULL) &&


