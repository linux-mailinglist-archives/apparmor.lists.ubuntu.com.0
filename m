Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD79CFC59
	for <lists+apparmor@lfdr.de>; Sat, 16 Nov 2024 03:17:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tC8NE-0004aC-Fw; Sat, 16 Nov 2024 02:17:20 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1tC8ND-0004a2-H6
 for apparmor@lists.ubuntu.com; Sat, 16 Nov 2024 02:17:19 +0000
Received: from [192.168.192.84] (unknown [50.39.104.138])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 92B183F212; 
 Sat, 16 Nov 2024 02:17:16 +0000 (UTC)
Message-ID: <7cc38d2d-5e4f-4b03-a1a8-e0b89f4005b8@canonical.com>
Date: Fri, 15 Nov 2024 18:17:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nathan Chancellor <nathan@kernel.org>
References: <20241111-apparmor-fix-label-declaration-warning-v1-1-adb64ab6482b@kernel.org>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20241111-apparmor-fix-label-declaration-warning-v1-1-adb64ab6482b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: Add empty statement between label
 and declaration in profile_transition(()
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
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 apparmor@lists.ubuntu.com, patches@lists.linux.dev,
 linux-security-module@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 11/11/24 06:49, Nathan Chancellor wrote:
> Clang 18 and newer warns (or errors with CONFIG_WERROR=y):
> 
>    security/apparmor/domain.c:695:3: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
>      695 |                 struct aa_profile *new_profile = NULL;
>          |                 ^
> 
> With Clang 17 and older, this is just an unconditional hard error:
> 
>    security/apparmor/domain.c:695:3: error: expected expression
>      695 |                 struct aa_profile *new_profile = NULL;
>          |                 ^
>    security/apparmor/domain.c:697:3: error: use of undeclared identifier 'new_profile'
>      697 |                 new_profile = aa_new_learning_profile(profile, false, name,
>          |                 ^
>    security/apparmor/domain.c:699:8: error: use of undeclared identifier 'new_profile'
>      699 |                 if (!new_profile) {
>          |                      ^
>    security/apparmor/domain.c:704:11: error: use of undeclared identifier 'new_profile'
>      704 |                         new = &new_profile->label;
>          |                                ^
> 
> Add a semicolon directly after the label to create an empty statement,
> which keeps the original intent of the code while clearing up the
> warning/error on all clang versions.
> 
> Fixes: ee650b3820f3 ("apparmor: properly handle cx/px lookup failure for complain")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411101808.AI8YG6cs-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

thanks for the patch, but I went with an alternate version, that I did last Sunday
(sorry I guess I forgot to push the tree). Since I hadn't pushed the tree I did
consider replacing my patch with it but in the end decided to not go with
the C99 variable declaration, moving the var to the top of the outer block (what
my Sunday patch did).

The reason being that while I don't think the style guideline forbid them, I end
up getting patches for them anyways, as some compiler flag sets will warn about
them.




> ---
>   security/apparmor/domain.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
> index 602d7a1bb44823a9b81e34d270b03c5f3aff3a34..eb0f222aa29442686b0a6751001c879f5b366c59 100644
> --- a/security/apparmor/domain.c
> +++ b/security/apparmor/domain.c
> @@ -691,7 +691,7 @@ static struct aa_label *profile_transition(const struct cred *subj_cred,
>   			error = -EACCES;
>   		}
>   	} else if (COMPLAIN_MODE(profile)) {
> -create_learning_profile:
> +create_learning_profile:;
>   		/* no exec permission - learning mode */
>   		struct aa_profile *new_profile = NULL;
>   
> 
> ---
> base-commit: 8c4f7960ae8a7a03a43f814e4af471b8e6ea3391
> change-id: 20241111-apparmor-fix-label-declaration-warning-fcd24ce2d447
> 
> Best regards,


