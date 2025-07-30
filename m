Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6315EB15E07
	for <lists+apparmor@lfdr.de>; Wed, 30 Jul 2025 12:20:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uh3uv-0005DE-28; Wed, 30 Jul 2025 10:20:13 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1uh3us-0005D2-JI
 for apparmor@lists.ubuntu.com; Wed, 30 Jul 2025 10:20:10 +0000
Received: from [192.168.192.85] (unknown [50.47.147.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 1403D41C0F; 
 Wed, 30 Jul 2025 10:20:08 +0000 (UTC)
Message-ID: <f021b454-bd51-42f9-ba96-f6ae98cb22f2@canonical.com>
Date: Wed, 30 Jul 2025 03:20:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nathan Chancellor <nathan@kernel.org>
References: <20250721231041.GA1015606@ax162>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20250721231041.GA1015606@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] -Wformat-invalid-specifier after 88fec3526e84 in
	-next
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
Cc: linux-security-module@vger.kernel.org, llvm@lists.linux.dev,
 apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 7/21/25 16:10, Nathan Chancellor wrote:
> Hi John,
> 
> After commit 88fec3526e84 ("apparmor: make sure unix socket labeling is
> correctly updated.") in -next, I am seeing some warnings from clang when
> building arm64 allmodconfig with LTO enabled. This can be more simply
> reproduced on top of defconfig:
> 
>    $ make -skj"$(nproc)" ARCH=arm64 LLVM=1 mrproper defconfig
> 
>    $ scripts/config \
>        -d LTO_NONE \
>        -e LTO_CLANG_THIN \
>        -e SECURITY_APPARMOR \
>        -e SECURITY_APPARMOR_DEBUG
> 
>    $ make -skj"$(nproc)" ARCH=arm64 LLVM=1 olddefconfig security/apparmor/lsm.o
>    security/apparmor/lsm.c:1206:2: warning: invalid conversion specifier '0' [-Wformat-invalid-specifier]
>     1206 |         AA_BUG(rcu_access_pointer(new_ctx->label));
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    security/apparmor/include/lib.h:56:3: note: expanded from macro 'AA_BUG'
>       56 |                 AA_BUG_FMT((X), "" args);                                   \
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>    security/apparmor/include/lib.h:61:34: note: expanded from macro 'AA_BUG_FMT'
>       61 |         WARN((X), "AppArmor WARN %s: (" #X "): " fmt, __func__, ##args)
>          |                                         ^~
>    <scratch space>:2:1144: note: expanded from here
>        2 | "(({ typeof(*(new_ctx->label)) *__UNIQUE_ID_rcu1155 = (typeof(*(new_ctx->label)) *)({ do { __attribute__((__noreturn__)) extern void __compiletime_assert_1156(void) __attribute__((__error__(\"Unsupported access size for {READ,WRITE}_ONCE().\"))); ..."
>    ...
>    include/asm-generic/bug.h:134:29: note: expanded from macro 'WARN'
>      134 |                 __WARN_printf(TAINT_WARN, format);                      \
>          |                                           ^~~~~~
>    include/asm-generic/bug.h:106:17: note: expanded from macro '__WARN_printf'
>      106 |                 __warn_printk(arg);                                     \
>          |                               ^~~
> 
> Ultimately, rcu_access_pointer() expands to __READ_ONCE(), which arm64
> specifically defines for CONFIG_LTO using some inline asm expressions,
> see commit e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire
> when CONFIG_LTO=y"). Within those asm literals are % characters for the
> asm templates, which are ultimately interpreted as format specifiers
> when they get expanded by the preprocessors, hence the warning.
> 
> There is nothing technically wrong here, although if this were to ever
> trigger, it would probably look quite ugly in the kernel log because of
> how long the string literal expansion of __READ_ONCE would be. It is
> possible to shut this warning up in a similar manner to the existing GCC
> pragma if necessary but I was unsure if that would be preferred off bat,
> hence just the report at first.
> 

Thanks for the info Nathan,

in this case
88fec3526e84 apparmor: make sure unix socket labeling is correctly updated.

actually made this check invalid, so it as been removed, fixing this issue.

> Cheers,
> Nathan
> 
> diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> index 2e7c2c282f3a..9dfbc6dc8859 100644
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h
> @@ -114,10 +114,10 @@
>   #define __diag_str(s)		__diag_str1(s)
>   #define __diag(s)		_Pragma(__diag_str(clang diagnostic s))
>   
> -#define __diag_clang_13(s)	__diag(s)
> +#define __diag_clang_all(s)	__diag(s)
>   
>   #define __diag_ignore_all(option, comment) \
> -	__diag_clang(13, ignore, option)
> +	__diag_clang(all, ignore, option)
>   
>   /*
>    * clang has horrible behavior with "g" or "rm" constraints for asm
> diff --git a/security/apparmor/include/lib.h b/security/apparmor/include/lib.h
> index 444197075fd6..7f2c649dc7dd 100644
> --- a/security/apparmor/include/lib.h
> +++ b/security/apparmor/include/lib.h
> @@ -53,7 +53,11 @@ do {									\
>   #define AA_BUG(X, args...)						    \
>   	do {								    \
>   		_Pragma("GCC diagnostic ignored \"-Wformat-zero-length\""); \
> +		__diag_push();						    \
> +		__diag_ignore(clang, all, "-Wformat-invalid-specifier",	    \
> +			      "May be called with asm that has %");	    \
>   		AA_BUG_FMT((X), "" args);				    \
> +		__diag_pop();						    \
>   		_Pragma("GCC diagnostic warning \"-Wformat-zero-length\""); \
>   	} while (0)
>   #ifdef CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS


