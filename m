Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 563315F22F9
	for <lists+apparmor@lfdr.de>; Sun,  2 Oct 2022 13:37:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oexHM-0004M8-Dd; Sun, 02 Oct 2022 11:37:04 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oexHK-0004KX-I3
 for apparmor@lists.ubuntu.com; Sun, 02 Oct 2022 11:37:02 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id DFB233F158; 
 Sun,  2 Oct 2022 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1664710622;
 bh=nLCLZycZ5/d9aO/J5MwbxVeyC1WPSKE9lqA0v8wIgsQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=kqV3v5hqdhazGotBcpvi0HRTl5g6flDHck0oC7eAjkheDdIxjVSqd9qjB1V1faswX
 yWyBBjIj1gdN3aMIw4MXxxOdnSXU5n4n/jgAOyOo8pzArGP+ldxsPv1AH/x75tS+FQ
 B5Vhe37UOnZOLlMR2z6R5i3mTDIVon3g2M1Uh6S9Pw/mD69UoOj6exfoMpI0PuiWG0
 GWD2NW3VA9mh8DE+GaSZgbyq0b/C7sbciYExZ4OTi44eLZ/J3RD+YE1/B2mzjHf1oS
 ZTNKwkjvm8usitwvVY6ZLJTVdYYOObNaHHdOG6ZvDC7K03m7iO/P/hGN7fQx4IAgNz
 Lz1sU3KUXwiRg==
Message-ID: <0ee9668b-e7e8-97fd-02bb-f0cb6a14b30f@canonical.com>
Date: Sun, 2 Oct 2022 04:36:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com
References: <20220926114838.1699096-1-cuigaosheng1@huawei.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20220926114838.1699096-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: fix obsoleted comments for
 aa_getprocattr() and audit_resource()
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

On 9/26/22 04:48, Gaosheng Cui wrote:
> Update the comments for aa_getprocattr() and audit_resource(), the
> args of them have beed changed since commit 76a1d263aba3 ("apparmor:
> switch getprocattr to using label_print fns()").
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into my tree

> ---
>   security/apparmor/procattr.c | 11 +++++------
>   security/apparmor/resource.c |  2 ++
>   2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/security/apparmor/procattr.c b/security/apparmor/procattr.c
> index 86ad26ef72ed..197d41f9c32b 100644
> --- a/security/apparmor/procattr.c
> +++ b/security/apparmor/procattr.c
> @@ -17,14 +17,13 @@
>   
>   
>   /**
> - * aa_getprocattr - Return the profile information for @profile
> - * @profile: the profile to print profile info about  (NOT NULL)
> - * @string: Returns - string containing the profile info (NOT NULL)
> + * aa_getprocattr - Return the label information for @label
> + * @label: the label to print label info about  (NOT NULL)
> + * @string: Returns - string containing the label info (NOT NULL)
>    *
> - * Requires: profile != NULL
> + * Requires: label != NULL && string != NULL
>    *
> - * Creates a string containing the namespace_name://profile_name for
> - * @profile.
> + * Creates a string containing the label information for @label.
>    *
>    * Returns: size of string placed in @string else error code on failure
>    */
> diff --git a/security/apparmor/resource.c b/security/apparmor/resource.c
> index 1ae4874251a9..4c1869bb31ec 100644
> --- a/security/apparmor/resource.c
> +++ b/security/apparmor/resource.c
> @@ -45,6 +45,8 @@ static void audit_cb(struct audit_buffer *ab, void *va)
>    * @profile: profile being enforced  (NOT NULL)
>    * @resource: rlimit being auditing
>    * @value: value being set
> + * @peer: aa_albel of the task being set
> + * @info: info being auditing
>    * @error: error value
>    *
>    * Returns: 0 or sa->error else other error code on failure


