Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 318916B002A
	for <lists+apparmor@lfdr.de>; Wed,  8 Mar 2023 08:48:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pZoWj-00070m-CS; Wed, 08 Mar 2023 07:47:57 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <wei.liu.linux@gmail.com>) id 1pZCk2-0001wN-5u
 for apparmor@lists.ubuntu.com; Mon, 06 Mar 2023 15:27:10 +0000
Received: by mail-wr1-f45.google.com with SMTP id v16so9286989wrn.0
 for <apparmor@lists.ubuntu.com>; Mon, 06 Mar 2023 07:27:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116429;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WjzbTdN7CLD76LwUYgSQFGlrkv+uCLMJlqFIMmRORpA=;
 b=Zdafih82sZJRWuNBvs90OGmPWyRLn0Et7IhUqPjnm/eeVu82Y6YCADzCCElxsvIdDN
 Hu5RTxnBWGyKXVogUSs/P/robujf64NX+EzUiJTpB5CZ0/q266VtNns0bPMNldAR0Owm
 wslkBZ/uRj7HJTIoUFyImEQKL6GbruR94bEfAXJWvw2LAKywvd3Sa1c99plch34py9Jk
 I8xkqqAYyuR5ZO3tSBQeHNyDph9ieBWRUFl3eSbiNflqKg+/lFQxxvp0j+ZIf21vSp4e
 pxAC/Uwy02tO7LZTWeNQTC7k8IqVMndhEkcAVL9FVR+5WtNB8nlujI4vM76/UoKjuruT
 E4UQ==
X-Gm-Message-State: AO0yUKUgd2Tx+yy91LQPwV4fz5HPjX6FpQdeyEmIUERBdThmg48nNz8z
 OBZNRL0MS2sv/DKtOvc2DRA=
X-Google-Smtp-Source: AK7set8sLVDUwT8GQGScn0gVSp+FOGcmG6WKTOjmYMNL/6orgxuEwPFL/9jsyQwuVKKF6cXajJRglg==
X-Received: by 2002:adf:eb4b:0:b0:2c6:e744:cf71 with SMTP id
 u11-20020adfeb4b000000b002c6e744cf71mr6185222wrn.52.1678116429360; 
 Mon, 06 Mar 2023 07:27:09 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a056000014100b002c5534db60bsm10414947wrx.71.2023.03.06.07.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:27:08 -0800 (PST)
Date: Mon, 6 Mar 2023 15:27:03 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZAYGR4DFQrjZVpC5@liuwe-devbox-debian-v2>
References: <20230302204612.782387-1-mcgrof@kernel.org>
 <20230302204612.782387-4-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302204612.782387-4-mcgrof@kernel.org>
Received-SPF: pass client-ip=209.85.221.45;
 envelope-from=wei.liu.linux@gmail.com; helo=mail-wr1-f45.google.com
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:47:56 +0000
Subject: Re: [apparmor] [PATCH 3/7] hv: simplify sysctl registration
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
Cc: j.granados@samsung.com, linux-hyperv@vger.kernel.org, steve.wahl@hpe.com,
 patches@lists.linux.dev, song@kernel.org, kys@microsoft.com,
 jirislaby@kernel.org, wei.liu@kernel.org, sstabellini@kernel.org,
 arnd@arndb.de, linux-scsi@vger.kernel.org, decui@microsoft.com,
 willy@infradead.org, zhangpeng362@huawei.com, xen-devel@lists.xenproject.org,
 yzaikin@google.com, haiyangz@microsoft.com, keescook@chromium.org,
 minyard@acm.org, mike.travis@hpe.com, jejb@linux.ibm.com,
 apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, nixiaoming@huawei.com,
 jgross@suse.com, martin.petersen@oracle.com, sujiaxun@uniontech.com,
 gregkh@linuxfoundation.org, robinmholt@gmail.com, linux-kernel@vger.kernel.org,
 oleksandr_tyshchenko@epam.com, ebiederm@xmission.com, tangmeng@uniontech.com,
 linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 02, 2023 at 12:46:08PM -0800, Luis Chamberlain wrote:
> register_sysctl_table() is a deprecated compatibility wrapper.
> register_sysctl() can do the directory creation for you so just use
> that.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Reviewed-by: Wei Liu <wei.liu@kernel.org>

