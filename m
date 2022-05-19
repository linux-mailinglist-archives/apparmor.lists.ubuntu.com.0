Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E48F52CEB5
	for <lists+apparmor@lfdr.de>; Thu, 19 May 2022 10:53:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nrbtu-0007ae-Nd; Thu, 19 May 2022 08:52:54 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nrbts-0007aW-Ak
 for apparmor@lists.ubuntu.com; Thu, 19 May 2022 08:52:52 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 076133F772; 
 Thu, 19 May 2022 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1652950372;
 bh=nv2aYgsqLrcfkBftEjGmPU9Khiz+v8yeJ6QN6I+2278=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=PVHotn9HvK3R8kdYeONbfIuxtLlfbc1tYxn0fMMitiMpTAEUWDoHJSTEmfeVaXzMj
 9SkyTgiC/g6dq1hOpGQdli9CiEhy2LjY4r2Xb2aX0ahuPqWhpiSCNQnH2myBawCJNG
 /fhZe69xKqY7t2dtn4eM/ZEXV7DFclzuC4LdynxrQGCZSO+p61WQmNfwQQH06D9rAx
 s42YS9L3MseAjkC4fIv+8Kz9hy/49DiAZJAODsZfS4gnVG6uqIYrnSMmr5dJLHSyID
 lVBHdiyUUDMW/eH5wvBS/LSBVBArcjHsLcD8cUB6mcWbDZfauPLaBMWBp1uwIilHNl
 TBbUsikMYw3pw==
Message-ID: <61824a01-0c03-7c74-1101-a30d3ae99f32@canonical.com>
Date: Thu, 19 May 2022 01:52:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>
References: <20220512075350.31163-1-yang.lee@linux.alibaba.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220512075350.31163-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH -next] apparmor: Fix aa_str_perms()
	kernel-doc comment
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

On 5/12/22 00:53, Yang Li wrote:
> Add the description of @start and remove @state in aa_str_perms()
> kernel-doc comment to remove warnings found by running scripts/kernel-doc,
> which is caused by using 'make W=1'.
> 
> security/apparmor/file.c:260: warning: Function parameter or member
> 'start' not described in 'aa_str_perms'
> security/apparmor/file.c:260: warning: Excess function parameter 'state'
> description in 'aa_str_perms'
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

sorry, for the delay on this I have pulled it into my tree

Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>  security/apparmor/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/file.c b/security/apparmor/file.c
> index e1b7e93602e4..137c99bb5d4a 100644
> --- a/security/apparmor/file.c
> +++ b/security/apparmor/file.c
> @@ -247,7 +247,7 @@ struct aa_perms aa_compute_fperms(struct aa_dfa *dfa, unsigned int state,
>  /**
>   * aa_str_perms - find permission that match @name
>   * @dfa: to match against  (MAYBE NULL)
> - * @state: state to start matching in
> + * @start: the state of the dfa to start matching in
>   * @name: string to match against dfa  (NOT NULL)
>   * @cond: conditions to consider for permission set computation  (NOT NULL)
>   * @perms: Returns - the permissions found when matching @name


