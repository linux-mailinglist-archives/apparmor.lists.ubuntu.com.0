Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D05D60C374
	for <lists+apparmor@lfdr.de>; Tue, 25 Oct 2022 07:46:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1onClO-0003ru-Mr; Tue, 25 Oct 2022 05:46:10 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1onClM-0003rn-Ow
 for apparmor@lists.ubuntu.com; Tue, 25 Oct 2022 05:46:08 +0000
Received: from [192.168.43.182] (unknown [62.168.35.125])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2B1723F0EB; 
 Tue, 25 Oct 2022 05:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1666676768;
 bh=QxFnl4TfwxL06Scp4jWtM9/xBq83fFjLDVwdNQtnq7g=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=eC/M0dCauIquijmLuvlNw+cQoXCSEcgJwChUMGT0FGwhUNEyhf4U+VRacmV8V68cp
 c+Mn6G0tfrmWKp39RG/5l4MO7ofi9ZlN1xKpM4r6AX9WdMRyaOiXb+7ozzA9bxy44c
 aw00EcbXKKKrZ0GbaMcYrqqlAiFJdO7CxXcBim/y76fo+/qDpWgHFGc4dc3Wwzh4hu
 ALJNadg9/WAXCpb9qXQJ+yzXYkhOVjEfE8gved+yU2hv6bjDn1r/mo2mOQN9xhv7Op
 GHV8yTlcYpch2yfyOpsaFtA2BrAi1PRpf5jzrl74RmxBkmUS49K1nE2gOJ5D6nAFCk
 BneTAtZ/KfVrQ==
Message-ID: <a43b4a3e-887b-9068-5e14-414c1619f2fb@canonical.com>
Date: Mon, 24 Oct 2022 22:46:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com
References: <20221025035930.2151976-1-cuigaosheng1@huawei.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221025035930.2151976-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH -next] apparmor: fix a memleak in
	free_ruleset()
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 10/24/22 20:59, Gaosheng Cui wrote:
> When the aa_profile is released, we will call free_ruleset to
> release aa_ruleset, but we don't free the memory of aa_ruleset,
> so there will be memleak, fix it.
> 
> unreferenced object 0xffff8881475df800 (size 1024):
>    comm "apparmor_parser", pid 883, jiffies 4294899650 (age 9114.088s)
>    hex dump (first 32 bytes):
>      00 f8 5d 47 81 88 ff ff 00 f8 5d 47 81 88 ff ff  ..]G......]G....
>      00 00 00 00 00 00 00 00 00 dc 65 47 81 88 ff ff  ..........eG....
>    backtrace:
>      [<00000000370e658e>] __kmem_cache_alloc_node+0x182/0x700
>      [<00000000f2f5a6d2>] kmalloc_trace+0x2c/0x130
>      [<00000000c5c905b3>] aa_alloc_profile+0x1bc/0x5c0
>      [<00000000bc4fa72b>] unpack_profile+0x319/0x30c0
>      [<00000000eab791e9>] aa_unpack+0x307/0x1450
>      [<000000002c3a6ee1>] aa_replace_profiles+0x1b8/0x3790
>      [<00000000d0c3fd54>] policy_update+0x35a/0x890
>      [<00000000d04fed90>] profile_replace+0x1d1/0x260
>      [<00000000cba0c0a7>] vfs_write+0x283/0xd10
>      [<000000006bae64a5>] ksys_write+0x134/0x260
>      [<00000000b2fd8f31>] __x64_sys_write+0x78/0xb0
>      [<00000000f3c8a015>] do_syscall_64+0x5c/0x90
>      [<00000000a242b1db>] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> Fixes: 217af7e2f4de ("apparmor: refactor profile rules and attachments")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into apparmor-next

> ---
>   security/apparmor/policy.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
> index 6f4cc8bfe03d..ebb99a12929b 100644
> --- a/security/apparmor/policy.c
> +++ b/security/apparmor/policy.c
> @@ -215,6 +215,7 @@ static void free_ruleset(struct aa_ruleset *rules)
>   	for (i = 0; i < rules->secmark_count; i++)
>   		kfree_sensitive(rules->secmark[i].label);
>   	kfree_sensitive(rules->secmark);
> +	kfree_sensitive(rules);
>   }
>   
>   struct aa_ruleset *aa_alloc_ruleset(gfp_t gfp)


