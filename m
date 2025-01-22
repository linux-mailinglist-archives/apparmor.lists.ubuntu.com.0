Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 373C8A19A25
	for <lists+apparmor@lfdr.de>; Wed, 22 Jan 2025 22:09:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tahyw-0005TT-2c; Wed, 22 Jan 2025 21:09:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <sergeh@kernel.org>) id 1tagwv-0006Vo-2s
 for apparmor@lists.ubuntu.com; Wed, 22 Jan 2025 20:03:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 61BB4A429B9;
 Wed, 22 Jan 2025 20:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61344C4CED2;
 Wed, 22 Jan 2025 20:03:37 +0000 (UTC)
Date: Wed, 22 Jan 2025 20:03:34 +0000
From: sergeh@kernel.org
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Z5FPFhc9w0aemqL_@lei>
References: <20250122065543.1515519-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122065543.1515519-1-arnd@kernel.org>
Received-SPF: pass client-ip=147.75.193.91; envelope-from=sergeh@kernel.org;
 helo=nyc.source.kernel.org
X-Mailman-Approved-At: Wed, 22 Jan 2025 21:09:47 +0000
Subject: Re: [apparmor] [PATCH] apparmor: remove unused variable
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
Cc: Paul Moore <paul@paul-moore.com>, Arnd Bergmann <arnd@arndb.de>,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Colin Ian King <colin.i.king@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jan 22, 2025 at 07:55:35AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The local 'sock' variable has become unused after a change to the
> aa_sock_file_perm() calling conventions:
> 
> security/apparmor/file.c: In function '__file_sock_perm':
> security/apparmor/file.c:544:24: error: unused variable 'sock' [-Werror=unused-variable]
>   544 |         struct socket *sock = (struct socket *) file->private_data;
> 
> Remove it here.

That's interesting.  The aa_sock_file_perm() further in will
still trip the AA_BUG(!sock) if there's some shenanigans going
on so no big loss in dropping the AA_BUG.

> Fixes: c05e705812d1 ("apparmor: add fine grained af_unix mediation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Serge Hallyn <serge@hallyn.com>

> ---
>  security/apparmor/file.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/security/apparmor/file.c b/security/apparmor/file.c
> index 85f89814af1e..e3a858649942 100644
> --- a/security/apparmor/file.c
> +++ b/security/apparmor/file.c
> @@ -541,11 +541,8 @@ static int __file_sock_perm(const char *op, const struct cred *subj_cred,
>  			    struct aa_label *flabel, struct file *file,
>  			    u32 request, u32 denied)
>  {
> -	struct socket *sock = (struct socket *) file->private_data;
>  	int error;
>  
> -	AA_BUG(!sock);
> -
>  	/* revalidation due to label out of date. No revocation at this time */
>  	if (!denied && aa_label_is_subset(flabel, label))
>  		return 0;
> -- 
> 2.39.5
> 

