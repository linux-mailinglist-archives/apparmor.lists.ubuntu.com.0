Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 450C8895D3B
	for <lists+apparmor@lfdr.de>; Tue,  2 Apr 2024 22:03:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rrkMC-0005yY-HV; Tue, 02 Apr 2024 20:03:44 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <linmiaohe@huawei.com>)
 id 1rr8Xs-0005rl-PA
 for apparmor@lists.ubuntu.com; Mon, 01 Apr 2024 03:41:17 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V7Gvt1Wpsz1xtQy;
 Mon,  1 Apr 2024 11:39:06 +0800 (CST)
Received: from canpemm500002.china.huawei.com (unknown [7.192.104.244])
 by mail.maildlp.com (Postfix) with ESMTPS id C7BCE1A016F;
 Mon,  1 Apr 2024 11:41:11 +0800 (CST)
Received: from [10.173.135.154] (10.173.135.154) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 11:41:10 +0800
To: <j.granados@samsung.com>
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
 <20240328-jag-sysctl_remset_misc-v1-1-47c1463b3af2@samsung.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <0e35e88d-3ea1-4f62-77e4-eb12e9f51583@huawei.com>
Date: Mon, 1 Apr 2024 11:41:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20240328-jag-sysctl_remset_misc-v1-1-47c1463b3af2@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.135.154]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500002.china.huawei.com (7.192.104.244)
Received-SPF: pass client-ip=45.249.212.190; envelope-from=linmiaohe@huawei.com;
 helo=szxga04-in.huawei.com
X-Mailman-Approved-At: Tue, 02 Apr 2024 20:03:42 +0000
Subject: Re: [apparmor] [PATCH 1/7] memory: Remove the now superfluous
 sentinel element from ctl_table array
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, keyrings@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Anup Patel <anup@brainfault.org>, James Morris <jmorris@namei.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 apparmor@lists.ubuntu.com, Atish Patra <atishp@atishpatra.org>,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Moore <paul@paul-moore.com>, Jens Axboe <axboe@kernel.dk>,
 Muchun Song <muchun.song@linux.dev>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 linux-kernel@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, "David S.
 Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2024/3/28 23:57, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which will
> reduce the overall build time size of the kernel and run time memory
> bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove sentinel from all files under mm/ that register a sysctl table.
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.

> ---
>  mm/compaction.c      | 1 -
>  mm/hugetlb.c         | 1 -
>  mm/hugetlb_vmemmap.c | 1 -
>  mm/memory-failure.c  | 1 -
>  mm/oom_kill.c        | 1 -
>  mm/page-writeback.c  | 1 -
>  mm/page_alloc.c      | 1 -
>  7 files changed, 7 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 807b58e6eb68..e8a047afca22 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -3345,7 +3345,6 @@ static struct ctl_table vm_compaction[] = {
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= SYSCTL_ONE,
>  	},
> -	{ }
>  };
>  
>  static int __init kcompactd_init(void)
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 23ef240ba48a..7ac5240a197d 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5045,7 +5045,6 @@ static struct ctl_table hugetlb_table[] = {
>  		.mode		= 0644,
>  		.proc_handler	= hugetlb_overcommit_handler,
>  	},
> -	{ }
>  };
>  
>  static void hugetlb_sysctl_init(void)
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index da177e49d956..b9a55322e52c 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -679,7 +679,6 @@ static struct ctl_table hugetlb_vmemmap_sysctls[] = {
>  		.mode		= 0644,
>  		.proc_handler	= proc_dobool,
>  	},
> -	{ }
>  };
>  
>  static int __init hugetlb_vmemmap_init(void)
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 9349948f1abf..6a112f9ecf91 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -141,7 +141,6 @@ static struct ctl_table memory_failure_table[] = {
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= SYSCTL_ONE,
>  	},
> -	{ }
>  };
>  
>  /*
> diff --git a/mm/oom_kill.c b/mm/oom_kill.c
> index 8d6a207c3c59..4d7a0004df2c 100644
> --- a/mm/oom_kill.c
> +++ b/mm/oom_kill.c
> @@ -724,7 +724,6 @@ static struct ctl_table vm_oom_kill_table[] = {
>  		.mode		= 0644,
>  		.proc_handler	= proc_dointvec,
>  	},
> -	{}
>  };
>  #endif
>  
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index 3e19b87049db..fba324e1a010 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2291,7 +2291,6 @@ static struct ctl_table vm_page_writeback_sysctls[] = {
>  		.mode		= 0644,
>  		.proc_handler	= proc_dointvec_jiffies,
>  	},
> -	{}
>  };
>  #endif
>  
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 14d39f34d336..8b9820620fe3 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6211,7 +6211,6 @@ static struct ctl_table page_alloc_sysctl_table[] = {
>  		.extra2		= SYSCTL_ONE_HUNDRED,
>  	},
>  #endif
> -	{}
>  };
>  
>  void __init page_alloc_sysctl_init(void)
> 


