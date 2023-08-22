Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 86064784A76
	for <lists+apparmor@lfdr.de>; Tue, 22 Aug 2023 21:30:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qYX4z-0005i8-6q; Tue, 22 Aug 2023 19:30:17 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qYX4x-0005hI-GA
 for apparmor@lists.ubuntu.com; Tue, 22 Aug 2023 19:30:15 +0000
Received: from [10.8.192.2] (unknown [50.47.144.217])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id D90D8400FF; 
 Tue, 22 Aug 2023 19:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1692732615;
 bh=7UGJKiMwREX7/31Oko06508K+pkv6d1OnT5I882h52Y=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=IDrLVBDyKuVt/8mIdzJXNDmAeO7EXxTvdChGCS4gN96FwdcRem3FwauyhmhbLejDq
 G4D9RcJtuYXZVg0A+lLb9RGxxZcb4laV5MPTbzdHOJpiVZtF3ZL2Gi0grTNI+x0eqr
 Cgwg9pVKICWEDG8x7ckVpnic10TZVhvy3eZxusRNuWfQblz4PzwkkelrVG4PBW+kpO
 CMHX8YLUsoaLZqw+JtmcN/UQNUWEzN3T8PLBnS5h0Gc8sq0K+9COK3qXOIvC5mYEcV
 eXTE1vvskO4A08eUZnnRCm9lqyCFN0917dMjBie2NGNH+l6+LnL9dH4yk/ezwCkOD8
 UcAicGcUvER0g==
Message-ID: <2ea99c70-1be1-c0bb-bf3c-ed65a25744de@canonical.com>
Date: Tue, 22 Aug 2023 12:30:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Xiu Jianfeng <xiujianfeng@huaweicloud.com>, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com
References: <20230810201056.429575-1-xiujianfeng@huaweicloud.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230810201056.429575-1-xiujianfeng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH -next] apparmor: remove unused functions in
	policy_ns.c/.h
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

On 8/10/23 13:10, Xiu Jianfeng wrote:
> From: Xiu Jianfeng <xiujianfeng@huawei.com>
> 
> These functions are not used now, remove them.
> 
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>

Acked-by: John Johansen <john.johansen@canonical.com>

this has pulled into apparmor-next-next so it will land
next cycle

> ---
>   security/apparmor/include/policy_ns.h | 14 ----------
>   security/apparmor/policy_ns.c         | 37 ---------------------------
>   2 files changed, 51 deletions(-)
> 
> diff --git a/security/apparmor/include/policy_ns.h b/security/apparmor/include/policy_ns.h
> index 33d665516fc1..d646070fd966 100644
> --- a/security/apparmor/include/policy_ns.h
> +++ b/security/apparmor/include/policy_ns.h
> @@ -86,10 +86,7 @@ const char *aa_ns_name(struct aa_ns *parent, struct aa_ns *child, bool subns);
>   void aa_free_ns(struct aa_ns *ns);
>   int aa_alloc_root_ns(void);
>   void aa_free_root_ns(void);
> -void aa_free_ns_kref(struct kref *kref);
>   
> -struct aa_ns *aa_find_ns(struct aa_ns *root, const char *name);
> -struct aa_ns *aa_findn_ns(struct aa_ns *root, const char *name, size_t n);
>   struct aa_ns *__aa_lookupn_ns(struct aa_ns *view, const char *hname, size_t n);
>   struct aa_ns *aa_lookupn_ns(struct aa_ns *view, const char *name, size_t n);
>   struct aa_ns *__aa_find_or_create_ns(struct aa_ns *parent, const char *name,
> @@ -151,15 +148,4 @@ static inline struct aa_ns *__aa_find_ns(struct list_head *head,
>   	return __aa_findn_ns(head, name, strlen(name));
>   }
>   
> -static inline struct aa_ns *__aa_lookup_ns(struct aa_ns *base,
> -					   const char *hname)
> -{
> -	return __aa_lookupn_ns(base, hname, strlen(hname));
> -}
> -
> -static inline struct aa_ns *aa_lookup_ns(struct aa_ns *view, const char *name)
> -{
> -	return aa_lookupn_ns(view, name, strlen(name));
> -}
> -
>   #endif /* AA_NAMESPACE_H */
> diff --git a/security/apparmor/policy_ns.c b/security/apparmor/policy_ns.c
> index fd5b7afbcb48..1f02cfe1d974 100644
> --- a/security/apparmor/policy_ns.c
> +++ b/security/apparmor/policy_ns.c
> @@ -159,43 +159,6 @@ void aa_free_ns(struct aa_ns *ns)
>   	kfree_sensitive(ns);
>   }
>   
> -/**
> - * aa_findn_ns  -  look up a profile namespace on the namespace list
> - * @root: namespace to search in  (NOT NULL)
> - * @name: name of namespace to find  (NOT NULL)
> - * @n: length of @name
> - *
> - * Returns: a refcounted namespace on the list, or NULL if no namespace
> - *          called @name exists.
> - *
> - * refcount released by caller
> - */
> -struct aa_ns *aa_findn_ns(struct aa_ns *root, const char *name, size_t n)
> -{
> -	struct aa_ns *ns = NULL;
> -
> -	rcu_read_lock();
> -	ns = aa_get_ns(__aa_findn_ns(&root->sub_ns, name, n));
> -	rcu_read_unlock();
> -
> -	return ns;
> -}
> -
> -/**
> - * aa_find_ns  -  look up a profile namespace on the namespace list
> - * @root: namespace to search in  (NOT NULL)
> - * @name: name of namespace to find  (NOT NULL)
> - *
> - * Returns: a refcounted namespace on the list, or NULL if no namespace
> - *          called @name exists.
> - *
> - * refcount released by caller
> - */
> -struct aa_ns *aa_find_ns(struct aa_ns *root, const char *name)
> -{
> -	return aa_findn_ns(root, name, strlen(name));
> -}
> -
>   /**
>    * __aa_lookupn_ns - lookup the namespace matching @hname
>    * @view: namespace to search in  (NOT NULL)


