Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C1BBD0493
	for <lists+apparmor@lfdr.de>; Sun, 12 Oct 2025 17:08:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7xfo-00038I-He; Sun, 12 Oct 2025 15:07:48 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <serge@mail.hallyn.com>)
 id 1v7xfm-00038A-9B
 for apparmor@lists.ubuntu.com; Sun, 12 Oct 2025 15:07:46 +0000
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id 6224D758; Sun, 12 Oct 2025 10:07:45 -0500 (CDT)
Date: Sun, 12 Oct 2025 10:07:45 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Message-ID: <aOvEQVqYUnMXrMxI@mail.hallyn.com>
References: <20251011164645.46822-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011164645.46822-2-thorsten.blum@linux.dev>
Received-SPF: pass client-ip=178.63.66.53; envelope-from=serge@mail.hallyn.com;
 helo=mail.hallyn.com
Subject: Re: [apparmor] [PATCH] apparmor: Replace sprintf/strcpy with
 scnprintf/strscpy in aa_policy_init
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
Cc: Paul Moore <paul@paul-moore.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-hardening@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sat, Oct 11, 2025 at 06:46:46PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated and sprintf() does not perform bounds checking
> either. Although an overflow is unlikely, it's better to proactively
> avoid it by using the safer strscpy() and scnprintf(), respectively.
> 
> Additionally, unify memory allocation for 'hname' to simplify and
> improve aa_policy_init().
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Serge Hallyn <serge@hallyn.com>

> ---
>  security/apparmor/lib.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/security/apparmor/lib.c b/security/apparmor/lib.c
> index 82dbb97ad406..acf7f5189bec 100644
> --- a/security/apparmor/lib.c
> +++ b/security/apparmor/lib.c
> @@ -478,19 +478,17 @@ bool aa_policy_init(struct aa_policy *policy, const char *prefix,
>  		    const char *name, gfp_t gfp)
>  {
>  	char *hname;
> +	size_t hname_sz;
>  
> +	hname_sz = (prefix ? strlen(prefix) + 2 : 0) + strlen(name) + 1;
>  	/* freed by policy_free */
> -	if (prefix) {
> -		hname = aa_str_alloc(strlen(prefix) + strlen(name) + 3, gfp);
> -		if (hname)
> -			sprintf(hname, "%s//%s", prefix, name);
> -	} else {
> -		hname = aa_str_alloc(strlen(name) + 1, gfp);
> -		if (hname)
> -			strcpy(hname, name);
> -	}
> +	hname = aa_str_alloc(hname_sz, gfp);
>  	if (!hname)
>  		return false;
> +	if (prefix)
> +		scnprintf(hname, hname_sz, "%s//%s", prefix, name);
> +	else
> +		strscpy(hname, name, hname_sz);
>  	policy->hname = hname;
>  	/* base.name is a substring of fqname */
>  	policy->name = basename(policy->hname);
> -- 
> 2.51.0

