Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E544823ED1
	for <lists+apparmor@lfdr.de>; Thu,  4 Jan 2024 10:41:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rLKDw-0005lx-Uz; Thu, 04 Jan 2024 09:41:13 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1rLKDq-0005la-SY
 for apparmor@lists.ubuntu.com; Thu, 04 Jan 2024 09:41:06 +0000
Received: from [192.168.192.85] (unknown [50.39.103.33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 960893F282; 
 Thu,  4 Jan 2024 09:41:04 +0000 (UTC)
Message-ID: <eaf76a45-3217-47c2-bf69-bdd765062e69@canonical.com>
Date: Thu, 4 Jan 2024 01:41:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fedor Pchelkin <pchelkin@ispras.ru>
References: <20231204181945.5903-1-pchelkin@ispras.ru>
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20231204181945.5903-1-pchelkin@ispras.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: fix possible memory leak in
	unpack_trans_table
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
Cc: lvc-project@linuxtesting.org, Paul Moore <paul@paul-moore.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 12/4/23 10:19, Fedor Pchelkin wrote:
> If we fail to unpack the transition table then the table elements which
> have been already allocated are not freed on error path.
> 
> unreferenced object 0xffff88802539e000 (size 128):
>    comm "apparmor_parser", pid 903, jiffies 4294914938 (age 35.085s)
>    hex dump (first 32 bytes):
>      20 73 6f 6d 65 20 6e 61 73 74 79 20 73 74 72 69   some nasty stri
>      6e 67 20 73 6f 6d 65 20 6e 61 73 74 79 20 73 74  ng some nasty st
>    backtrace:
>      [<ffffffff81ddb312>] __kmem_cache_alloc_node+0x1e2/0x2d0
>      [<ffffffff81c47194>] __kmalloc_node_track_caller+0x54/0x170
>      [<ffffffff81c225b9>] kmemdup+0x29/0x60
>      [<ffffffff83e1ee65>] aa_unpack_strdup+0xe5/0x1b0
>      [<ffffffff83e20808>] unpack_pdb+0xeb8/0x2700
>      [<ffffffff83e23567>] unpack_profile+0x1507/0x4a30
>      [<ffffffff83e27bfa>] aa_unpack+0x36a/0x1560
>      [<ffffffff83e194c3>] aa_replace_profiles+0x213/0x33c0
>      [<ffffffff83de9461>] policy_update+0x261/0x370
>      [<ffffffff83de978e>] profile_replace+0x20e/0x2a0
>      [<ffffffff81eac8bf>] vfs_write+0x2af/0xe00
>      [<ffffffff81eaddd6>] ksys_write+0x126/0x250
>      [<ffffffff88f34fb6>] do_syscall_64+0x46/0xf0
>      [<ffffffff890000ea>] entry_SYSCALL_64_after_hwframe+0x6e/0x76
> 
> Call aa_free_str_table() on error path as was done before the blamed
> commit. It implements all necessary checks, frees str_table if it is
> available and nullifies the pointers.
> 
> Found by Linux Verification Center (linuxtesting.org).
> 
> Fixes: a0792e2ceddc ("apparmor: make transition table unpack generic so it can be reused")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>

thanks, I have pulled this into my tree
Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/lib.c           | 1 +
>   security/apparmor/policy_unpack.c | 7 +++----
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/security/apparmor/lib.c b/security/apparmor/lib.c
> index 4c198d273f09..cd569fbbfe36 100644
> --- a/security/apparmor/lib.c
> +++ b/security/apparmor/lib.c
> @@ -41,6 +41,7 @@ void aa_free_str_table(struct aa_str_table *t)
>   			kfree_sensitive(t->table[i]);
>   		kfree_sensitive(t->table);
>   		t->table = NULL;
> +		t->size = 0;
>   	}
>   }
>   
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> index fc21952aca6b..887010692538 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -478,6 +478,8 @@ static bool unpack_trans_table(struct aa_ext *e, struct aa_str_table *strs)
>   		if (!table)
>   			goto fail;
>   
> +		strs->table = table;
> +		strs->size = size;
>   		for (i = 0; i < size; i++) {
>   			char *str;
>   			int c, j, pos, size2 = aa_unpack_strdup(e, &str, NULL);
> @@ -520,14 +522,11 @@ static bool unpack_trans_table(struct aa_ext *e, struct aa_str_table *strs)
>   			goto fail;
>   		if (!aa_unpack_nameX(e, AA_STRUCTEND, NULL))
>   			goto fail;
> -
> -		strs->table = table;
> -		strs->size = size;
>   	}
>   	return true;
>   
>   fail:
> -	kfree_sensitive(table);
> +	aa_free_str_table(strs);
>   	e->pos = saved_pos;
>   	return false;
>   }


