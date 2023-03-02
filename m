Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6D26A8BEC
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWU-0003uq-0r; Thu, 02 Mar 2023 22:35:38 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <tcminyard@gmail.com>) id 1pXrFO-0002N5-Ix
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 22:17:58 +0000
Received: by mail-qt1-f177.google.com with SMTP id c3so948650qtc.8
 for <apparmor@lists.ubuntu.com>; Thu, 02 Mar 2023 14:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677795477;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0eFa8ILkm7saCjWoXNnQHqm1RHUvtu7xtFURhRmKWU=;
 b=GWIdVRbSbgGAneugFpQgdh5lGR+K1O2RColDxiylPsGvgbxgTi3suTXXA6wFi8OCK0
 VNr55Ah0Gc82W4FpWSTsMpjDZ1Erp/WmIRnZDS0YpniCm5SeKBzDA3FCJ8OcngRfT3am
 LJR4Wv1lndNYH/Q/fwVcsuZerou4gr/yo1YSLP0kQcvMrmf2NmdjcDnwIAjLduXqmPNe
 VlNJuhUG6Jamo98Ukf3GRQnXMF/KhWX9aS1xIH9/YtXknnp6o/3S59Xtp1bxusSnAubi
 fOjhj1lJxSPeHuAjqExElFjdtMpPl+2YjDqfLqGQB/n6i2Ayg1FV3OBABQqVd1q1TZM5
 StNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677795477;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V0eFa8ILkm7saCjWoXNnQHqm1RHUvtu7xtFURhRmKWU=;
 b=NypvaY1YMKacoH1Gk9aZETPdN2aeh+ipPKEnAeH/rt5D/Xg4KhxFb6SRW4Fkoniye/
 9ubOkn5bjvPBInDmhEMtB5suoBz4BUFgblCatHqPQOyGnmnpfJH0/SwKDf84NQwiGK7e
 emjCx/CY5yYokfbo/mw2a2tgXAg5mJV0QFTovBeiihJG6bOLqLUpz9achHeTo4AOCZsc
 1Hq7sQg1rKGOULwPdSmTSjf5obwsCfFfmUD7D9gXwbiDRFucIs/MHwvgPmA9Qq22+DRa
 81jVPvdnErJwPsErRXCWn7uYNbqh2CjxpqAw5U+3A43znKreQR6/x0MVj/vQBV6xBw6U
 xwgw==
X-Gm-Message-State: AO0yUKWtyN3q6OVhOHH2UL/VinQBXt34VNli3JkCyXwegaRkc5Yhv7Fz
 mqKmoo5kH3fyxTdwdU6V2Q==
X-Google-Smtp-Source: AK7set/y+bOjExP+nvbPQ/5QcDoAS99DJhG2vCN39iU8gau82df1z2MZqb9gk8YkNPi+sskmliPrlQ==
X-Received: by 2002:ac8:5f47:0:b0:3bf:dd45:ed68 with SMTP id
 y7-20020ac85f47000000b003bfdd45ed68mr19008132qta.47.1677795476934; 
 Thu, 02 Mar 2023 14:17:56 -0800 (PST)
Received: from serve.minyard.net ([47.184.176.248])
 by smtp.gmail.com with ESMTPSA id
 w19-20020ac843d3000000b003bfbf3afe51sm468742qtn.93.2023.03.02.14.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 14:17:56 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9812:99fe:c8aa:e89a])
 by serve.minyard.net (Postfix) with ESMTPSA id 2843A18000C;
 Thu,  2 Mar 2023 22:17:55 +0000 (UTC)
Date: Thu, 2 Mar 2023 16:17:53 -0600
From: Corey Minyard <minyard@acm.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZAEgkeb6E+k8PFZc@minyard.net>
References: <20230302204612.782387-1-mcgrof@kernel.org>
 <20230302204612.782387-3-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302204612.782387-3-mcgrof@kernel.org>
Received-SPF: pass client-ip=209.85.160.177; envelope-from=tcminyard@gmail.com;
 helo=mail-qt1-f177.google.com
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: Re: [apparmor] [PATCH 2/7] ipmi: simplify sysctl registration
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
Reply-To: minyard@acm.org
Cc: j.granados@samsung.com, linux-hyperv@vger.kernel.org, steve.wahl@hpe.com,
 patches@lists.linux.dev, song@kernel.org, kys@microsoft.com,
 jirislaby@kernel.org, wei.liu@kernel.org, sstabellini@kernel.org,
 linux-scsi@vger.kernel.org, decui@microsoft.com, willy@infradead.org,
 zhangpeng362@huawei.com, xen-devel@lists.xenproject.org, yzaikin@google.com,
 haiyangz@microsoft.com, keescook@chromium.org, arnd@arndb.de,
 mike.travis@hpe.com, jejb@linux.ibm.com, apparmor@lists.ubuntu.com,
 linux-raid@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 nixiaoming@huawei.com, jgross@suse.com, martin.petersen@oracle.com,
 sujiaxun@uniontech.com, gregkh@linuxfoundation.org, robinmholt@gmail.com,
 linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com,
 ebiederm@xmission.com, tangmeng@uniontech.com, linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 02, 2023 at 12:46:07PM -0800, Luis Chamberlain wrote:
> register_sysctl_table() is a deprecated compatibility wrapper.
> register_sysctl() can do the directory creation for you so just use
> that.

Thanks, I have included this in my tree for the next merge window.

-corey

> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/char/ipmi/ipmi_poweroff.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
> index 163ec9749e55..870659d91db2 100644
> --- a/drivers/char/ipmi/ipmi_poweroff.c
> +++ b/drivers/char/ipmi/ipmi_poweroff.c
> @@ -659,20 +659,6 @@ static struct ctl_table ipmi_table[] = {
>  	{ }
>  };
>  
> -static struct ctl_table ipmi_dir_table[] = {
> -	{ .procname	= "ipmi",
> -	  .mode		= 0555,
> -	  .child	= ipmi_table },
> -	{ }
> -};
> -
> -static struct ctl_table ipmi_root_table[] = {
> -	{ .procname	= "dev",
> -	  .mode		= 0555,
> -	  .child	= ipmi_dir_table },
> -	{ }
> -};
> -
>  static struct ctl_table_header *ipmi_table_header;
>  #endif /* CONFIG_PROC_FS */
>  
> @@ -689,7 +675,7 @@ static int __init ipmi_poweroff_init(void)
>  		pr_info("Power cycle is enabled\n");
>  
>  #ifdef CONFIG_PROC_FS
> -	ipmi_table_header = register_sysctl_table(ipmi_root_table);
> +	ipmi_table_header = register_sysctl("dev/ipmi", ipmi_table);
>  	if (!ipmi_table_header) {
>  		pr_err("Unable to register powercycle sysctl\n");
>  		rv = -ENOMEM;
> -- 
> 2.39.1
> 

