Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7202EA0B0B6
	for <lists+apparmor@lfdr.de>; Mon, 13 Jan 2025 09:10:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXFX6-0000M4-S4; Mon, 13 Jan 2025 08:10:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <bhe@redhat.com>) id 1tWvKt-0000li-0g
 for apparmor@lists.ubuntu.com; Sun, 12 Jan 2025 10:36:51 +0000
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-0DSN8VPiNBSr_DA-YHIeIA-1; Sun,
 12 Jan 2025 05:36:43 -0500
X-MC-Unique: 0DSN8VPiNBSr_DA-YHIeIA-1
X-Mimecast-MFC-AGG-ID: 0DSN8VPiNBSr_DA-YHIeIA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A2F3A19560BB; Sun, 12 Jan 2025 10:36:36 +0000 (UTC)
Received: from localhost (unknown [10.72.113.4])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5808B195608A; Sun, 12 Jan 2025 10:36:31 +0000 (UTC)
Date: Sun, 12 Jan 2025 18:36:27 +0800
From: Baoquan He <bhe@redhat.com>
To: Joel Granados <joel.granados@kernel.org>
Message-ID: <Z4ObK5hkQ7qjWgbf@MiWiFi-R3L-srv>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bhe@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Mailman-Approved-At: Mon, 13 Jan 2025 08:10:42 +0000
Subject: Re: [apparmor] [PATCH v2] treewide: const qualify ctl_tables where
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
Cc: linux-aio@kvack.org, linux-hyperv@vger.kernel.org,
 Corey Minyard <cminyard@mvista.com>, Kees Cook <kees@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, keyrings@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 io-uring@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-security-module@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-trace-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, linux-raid@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, openipmi-developer@lists.sourceforge.net,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Song Liu <song@kernel.org>,
 kexec@lists.infradead.org,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 linux-xfs@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 01/10/25 at 03:16pm, Joel Granados wrote:
...snip...
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index c0caa14880c3..71b0809e06d6 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -925,7 +925,7 @@ static int kexec_limit_handler(const struct ctl_table *table, int write,
>  	return proc_dointvec(&tmp, write, buffer, lenp, ppos);
>  }
>  
> -static struct ctl_table kexec_core_sysctls[] = {
> +static const struct ctl_table kexec_core_sysctls[] = {
>  	{
>  		.procname	= "kexec_load_disabled",
>  		.data		= &kexec_load_disabled,

For the kexec/kdump part,

Acked-by: Baoquan He <bhe@redhat.com>
......


