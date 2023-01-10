Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A1A664829
	for <lists+apparmor@lfdr.de>; Tue, 10 Jan 2023 19:07:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pFJ24-0000mR-KZ; Tue, 10 Jan 2023 18:07:32 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pFJ22-0000m0-Pn
 for apparmor@lists.ubuntu.com; Tue, 10 Jan 2023 18:07:30 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 91DC442190; 
 Tue, 10 Jan 2023 18:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1673374050;
 bh=WMRH/FSvzOZHUkAuyNF72f/8M1j1+v9Z34mjrzDHwZo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=bp88v4ALTmCYKh5+hHkn0jdFbS1oZ/fPyfFwiPUeoPGrCMsb5IMSQukRCpVtRYiJn
 XdKvlx2WZ9EC7nTpxnyCLXn/OzVLOWDi0O+V3tDzI+t1AX04ZfRkMiPELmRmcHuTWD
 SPpW7zds8SDIsJ5Fsnb9OmVK2yi4bdoIuyUbu2FZYALxXLK2ryScE0Yxgtxms7hLEi
 TcyEK5AUnDIq+nXqIJdJspVj23oXzvqqITaGRshgZToESu7dt85qpWjsHGzP+jh+8r
 OJG9llmDQon65UL3J7UZflrZT+vvOy8LN/waTsyn+f9HIuB1m2TKstutaDng9GOKRf
 rZhrSGZgja+0Q==
Message-ID: <7ad7d8b0-5b27-f8fd-6efb-d0540f07c1af@canonical.com>
Date: Tue, 10 Jan 2023 10:07:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-security-module@vger.kernel.org
References: <20230102204512.3972-1-rdunlap@infradead.org>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230102204512.3972-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: fix kernel-doc complaints
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
Cc: John Johansen <john@apparmor.net>, "Serge E. Hallyn" <serge@hallyn.com>,
 apparmor@lists.ubuntu.com, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 1/2/23 12:45, Randy Dunlap wrote:
> Correct kernel-doc notation to placate kernel-doc W=1 warnings:
> 
> security/apparmor/policy.c:439: warning: duplicate section name 'Return'
> security/apparmor/secid.c:57: warning: Cannot understand  *
> security/apparmor/file.c:174: warning: cannot understand function prototype: 'struct aa_perms default_perms = '
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: John Johansen <john.johansen@canonical.com>
> Cc: John Johansen <john@apparmor.net>
> Cc: apparmor@lists.ubuntu.com
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into apparmor-next


> ---
>   security/apparmor/file.c   |    2 +-
>   security/apparmor/policy.c |    7 ++-----
>   security/apparmor/secid.c  |    3 +--
>   3 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff -- a/security/apparmor/policy.c b/security/apparmor/policy.c
> --- a/security/apparmor/policy.c
> +++ b/security/apparmor/policy.c
> @@ -430,11 +430,9 @@ static struct aa_policy *__lookup_parent
>    * @hname: hierarchical profile name to find parent of (NOT NULL)
>    * @gfp: type of allocation.
>    *
> - * Returns: NULL on error, parent profile on success
> - *
>    * Requires: ns mutex lock held
>    *
> - * Returns: unrefcounted parent policy or NULL if error creating
> + * Return: unrefcounted parent policy on success or %NULL if error creating
>    *          place holder profiles.
>    */
>   static struct aa_policy *__create_missing_ancestors(struct aa_ns *ns,
> @@ -828,7 +826,7 @@ bool aa_current_policy_admin_capable(str
>   /**
>    * aa_may_manage_policy - can the current task manage policy
>    * @label: label to check if it can manage policy
> - * @op: the policy manipulation operation being done
> + * @mask: contains the policy manipulation operation being done
>    *
>    * Returns: 0 if the task is allowed to manipulate policy else error
>    */
> @@ -883,7 +881,6 @@ static struct aa_profile *__list_lookup_
>    * __replace_profile - replace @old with @new on a list
>    * @old: profile to be replaced  (NOT NULL)
>    * @new: profile to replace @old with  (NOT NULL)
> - * @share_proxy: transfer @old->proxy to @new
>    *
>    * Will duplicate and refcount elements that @new inherits from @old
>    * and will inherit @old children.
> diff -- a/security/apparmor/secid.c b/security/apparmor/secid.c
> --- a/security/apparmor/secid.c
> +++ b/security/apparmor/secid.c
> @@ -53,8 +53,7 @@ void aa_secid_update(u32 secid, struct a
>   	xa_unlock_irqrestore(&aa_secids, flags);
>   }
>   
> -/**
> - *
> +/*
>    * see label for inverse aa_label_to_secid
>    */
>   struct aa_label *aa_secid_to_label(u32 secid)
> diff -- a/security/apparmor/file.c b/security/apparmor/file.c
> --- a/security/apparmor/file.c
> +++ b/security/apparmor/file.c
> @@ -161,6 +161,7 @@ static int path_name(const char *op, str
>   	return 0;
>   }
>   
> +struct aa_perms default_perms = {};
>   /**
>    * aa_lookup_fperms - convert dfa compressed perms to internal perms
>    * @dfa: dfa to lookup perms for   (NOT NULL)
> @@ -171,7 +172,6 @@ static int path_name(const char *op, str
>    *
>    * Returns: a pointer to a file permission set
>    */
> -struct aa_perms default_perms = {};
>   struct aa_perms *aa_lookup_fperms(struct aa_policydb *file_rules,
>   				 aa_state_t state, struct path_cond *cond)
>   {


