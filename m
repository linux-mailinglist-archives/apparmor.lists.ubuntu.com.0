Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8CA0B0B0
	for <lists+apparmor@lfdr.de>; Mon, 13 Jan 2025 09:10:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXFX3-0000KG-Qd; Mon, 13 Jan 2025 08:10:45 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <corey@minyard.net>) id 1tVuj3-0003L3-Jw
 for apparmor@lists.ubuntu.com; Thu, 09 Jan 2025 15:45:37 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-71e157a79c8so289681a34.2
 for <apparmor@lists.ubuntu.com>; Thu, 09 Jan 2025 07:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736437536; x=1737042336;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
 b=F4PZZy28t+etKAYnq5c5wDHDPwdqjqanjb5mxpHXEBeckeMmlL9UfrERaFtVbyABs3
 RYi5VWJExck/hz9MUW7siNcBaYmjL4pwlnhM4hsGnpuZHQcFzmTlRPQsAVsp2+k1bypc
 vrBNqEocFUooPXLnBLncWTxTvyHmL6DemYQvtXzQabgNsyLMQZQdtfacO4dawEjl6UIy
 3bRBmn3DlhAI7YpUxevxk1UVdhECAHwXTMCafSp9jO4WiD+syQ4DPIXgFuHyXAGfo74K
 Qb8f40FjYcrG2jJf2ZJDwuXoVZpaM+8bxn8DqWc1+vz8o5MXnIgo8SeMmZytAU+zZogl
 E96A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF/AB3gJ03gFfs5Ht6IQYFKxu9ENJEliABNx+D1UfmfosdPl1HTJ4S5ofqkKMG0vG47DJkkUdzYw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxBtMXelyH68vA1e9hsTmtZMWImxCcuXcrSZw7m+clfqu0poW6U
 0HZnqPALj9cCiSeLfpCK3k8pfyt9h1uD1iZc70IiJUrUommcC5rzUtu20ZvVGoE=
X-Gm-Gg: ASbGncvs/00TFOqDd54jcq/govx4vRc2nIXIIZF3NDFkzZd6oBiJ15RDjtYeOkJ1orl
 AIpWqIPbiCpRc75fmUPlelbfKxnQlxCeV3z29uuW/SaukZlceNeJ/snlSeGTt6ftk6vxXNa6GaN
 wy8H2FIafN5YHPz85M6qKkaxFSTVEu7+nr/PMl38KI3lWTXgAkCoL8v1NEZ8mG3LSsaM+T+zixa
 eFGiprPDbI1oNF1x4X7SUciiFuq/bJLoNo+AaQH88Sjvcf71gwN26a+fCvA
X-Google-Smtp-Source: AGHT+IHELUnxP9ZvL+e2Ztemz39I9ORoPYZLTVwEa+XG73J5uz7w7yM0cuXu9KZqTaUsGk+1/+jmGA==
X-Received: by 2002:a05:6830:6610:b0:716:a95d:9ef with SMTP id
 46e09a7af769-721e2e000d6mr4949630a34.2.1736437534534; 
 Thu, 09 Jan 2025 07:45:34 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:9076:47eb:1e0a:16fb])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f882625f0esm386258eaf.9.2025.01.09.07.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 07:45:34 -0800 (PST)
Date: Thu, 9 Jan 2025 09:45:27 -0600
From: Corey Minyard <corey@minyard.net>
To: Joel Granados <joel.granados@kernel.org>
Message-ID: <Z3_vF3I453flXoZv@mail.minyard.net>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
Received-SPF: none client-ip=209.85.210.46; envelope-from=corey@minyard.net;
 helo=mail-ot1-f46.google.com
X-Mailman-Approved-At: Mon, 13 Jan 2025 08:10:43 +0000
Subject: Re: [apparmor] [PATCH] treewide: const qualify ctl_tables where
	applicable
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
Reply-To: corey@minyard.net
Cc: linux-aio@kvack.org, linux-hyperv@vger.kernel.org,
 Kees Cook <kees@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, keyrings@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 io-uring@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-security-module@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-trace-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, openipmi-developer@lists.sourceforge.net,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org, kexec@lists.infradead.org,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-xfs@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Jan 09, 2025 at 02:16:39PM +0100, Joel Granados wrote:
> Add the const qualifier to all the ctl_tables in the tree except the
> ones in ./net dir. The "net" sysctl code is special as it modifies the
> arrays before passing it on to the registration function.
> 
...
> diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
> index 941d2dcc8c9d..de84f59468a9 100644
> --- a/drivers/char/ipmi/ipmi_poweroff.c
> +++ b/drivers/char/ipmi/ipmi_poweroff.c
> @@ -650,7 +650,7 @@ static struct ipmi_smi_watcher smi_watcher = {
>  #ifdef CONFIG_PROC_FS
>  #include <linux/sysctl.h>
>  
> -static struct ctl_table ipmi_table[] = {
> +static const struct ctl_table ipmi_table[] = {
>  	{ .procname	= "poweroff_powercycle",
>  	  .data		= &poweroff_powercycle,
>  	  .maxlen	= sizeof(poweroff_powercycle),

For the IPMI portion:

Acked-by: Corey Minyard <cminyard@mvista.com>


