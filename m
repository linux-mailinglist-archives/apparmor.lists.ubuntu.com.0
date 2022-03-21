Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 970414E31A1
	for <lists+apparmor@lfdr.de>; Mon, 21 Mar 2022 21:20:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nWOVg-0007Jp-1H; Mon, 21 Mar 2022 20:20:12 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nWOVe-0007Ji-LO
 for apparmor@lists.ubuntu.com; Mon, 21 Mar 2022 20:20:10 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 9DC7C3F675; 
 Mon, 21 Mar 2022 20:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647894009;
 bh=uamzDTJ4eJ/ciPYegLGLh1LwOQ1s4XFLg66bcANk+sw=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=PhIGq27tIR6YGTpy+wnDQh8CRjPzA5RjWXdayxXMhy9VMK/vpwY2lrozuck/Q0BGn
 2yNfzkrnwblJGs4nRobrc6x/F1mcqSShK2KsSINwDHalwonqRl1KBYfR/79XCmtIUZ
 9TaqHNCZy9x0rba3HHAdQtIv/xnIs3/jmTaTaePPl3/8fhxYte7Of7yWFujkaPGFSY
 owDvM8DqO9XrRHYH7zI+Ji44jGokH9O8pFnPIsw+8Vb4WkzEhyCapetCAnoJlRKANZ
 kPdxmH8wylIKPTu0S2a5dPc6fNFg+xVQjcL9f9ipykTZbnSca5Tbm3u2UHPnUKJoXy
 SK0i5xVgkTLog==
Message-ID: <a6ce3c77-bb90-f074-e3a5-eb16c7b6ea8b@canonical.com>
Date: Mon, 21 Mar 2022 13:20:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>
References: <20220317010330.82929-1-yang.lee@linux.alibaba.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220317010330.82929-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH -next] apparmor: Fix some kernel-doc comments
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
Cc: apparmor@lists.ubuntu.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 3/16/22 18:03, Yang Li wrote:
> Remove some warnings found by running scripts/kernel-doc,
> which is caused by using 'make W=1'.
> 
> security/apparmor/domain.c:137: warning: Function parameter or member
> 'state' not described in 'label_compound_match'
> security/apparmor/domain.c:137: warning: Excess function parameter
> 'start' description in 'label_compound_match'
> security/apparmor/domain.c:1294: warning: Excess function parameter
> 'onexec' description in 'aa_change_profile'
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into my tree


> ---
>  security/apparmor/domain.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
> index a29e69d2c300..d71023f5c9c4 100644
> --- a/security/apparmor/domain.c
> +++ b/security/apparmor/domain.c
> @@ -119,7 +119,7 @@ static inline unsigned int match_component(struct aa_profile *profile,
>   * @profile: profile to find perms for
>   * @label: label to check access permissions for
>   * @stack: whether this is a stacking request
> - * @start: state to start match in
> + * @state: state to start match in
>   * @subns: whether to do permission checks on components in a subns
>   * @request: permissions to request
>   * @perms: perms struct to set
> @@ -1279,7 +1279,6 @@ static int change_profile_perms_wrapper(const char *op, const char *name,
>  /**
>   * aa_change_profile - perform a one-way profile transition
>   * @fqname: name of profile may include namespace (NOT NULL)
> - * @onexec: whether this transition is to take place immediately or at exec
>   * @flags: flags affecting change behavior
>   *
>   * Change to new profile @name.  Unlike with hats, there is no way


