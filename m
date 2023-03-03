Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F6E6A9F8C
	for <lists+apparmor@lfdr.de>; Fri,  3 Mar 2023 19:49:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pYASr-0008AM-1p; Fri, 03 Mar 2023 18:49:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1pY9xp-0005K2-J8
 for apparmor@lists.ubuntu.com; Fri, 03 Mar 2023 18:17:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78594618D2
 for <apparmor@lists.ubuntu.com>; Fri,  3 Mar 2023 18:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B84C433D2
 for <apparmor@lists.ubuntu.com>; Fri,  3 Mar 2023 18:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677867424;
 bh=z9o+Fj7F9hEekeJkNgNCjr/Inru7KzeAHF1ZoYV9Iio=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=q5qfBhY9iCWtlaLxLeTmsQNk+zZgPKuSN1vP9+lXy9wtJQXElNCbzgno1bGwsBdp6
 txLh/hO3LVI43E4dxhnGuvmtPRTW2DrbnxUTgG/GHWDkHkVewGG/+zubVDWfllEgnS
 iTsB/lcmDOnObMBCN993OT8k4WipLERBXc1j1t/iFPPUkH0snFWYJ5UJGwN18UYuMz
 gRdWeXhpkE/w51KmTIU5Cu3M+EONG1PuF439+095Db1oSqd3DiP1B86yB7zA77FprW
 e4A8yQOC3nF8FXo8tWlOZlfHq4gG1sSeoRY79pbWFLPHr6w2RvXPKlQPzmetP972gL
 s4GlFmjsVXQsA==
Received: by mail-ed1-f41.google.com with SMTP id s11so13747182edy.8
 for <apparmor@lists.ubuntu.com>; Fri, 03 Mar 2023 10:17:04 -0800 (PST)
X-Gm-Message-State: AO0yUKWzR8O8gfYeSTm09uPgWJuuse+q43YPZNVPzHNQC5A3J6fjzxWC
 VX9q5Dy6LFrcHHHgp85TmQsf19mBpdZIXaXui2Y=
X-Google-Smtp-Source: AK7set8+TKohTy6ON4qynrd6qM7FwtWsRtV8zfmEmFF5syO7UhwA/Y8VS4hyO7ZdSGW9G+CTTREWUsKalOtJ4y3BnUw=
X-Received: by 2002:a05:6512:3c83:b0:4d8:86c2:75ea with SMTP id
 h3-20020a0565123c8300b004d886c275eamr3273736lfv.3.1677867401669; Fri, 03 Mar
 2023 10:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20230302204612.782387-1-mcgrof@kernel.org>
 <20230302204612.782387-5-mcgrof@kernel.org>
In-Reply-To: <20230302204612.782387-5-mcgrof@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 3 Mar 2023 10:16:29 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4k1hpLDWcQGCtEeR6LEgSboTY+tqbiPp+30_2T+rFezw@mail.gmail.com>
Message-ID: <CAPhsuW4k1hpLDWcQGCtEeR6LEgSboTY+tqbiPp+30_2T+rFezw@mail.gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 03 Mar 2023 18:49:08 +0000
Subject: Re: [apparmor] [PATCH 4/7] md: simplify sysctl registration
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
 patches@lists.linux.dev, kys@microsoft.com, jirislaby@kernel.org,
 wei.liu@kernel.org, sstabellini@kernel.org, arnd@arndb.de,
 linux-scsi@vger.kernel.org, decui@microsoft.com, willy@infradead.org,
 zhangpeng362@huawei.com, xen-devel@lists.xenproject.org, yzaikin@google.com,
 haiyangz@microsoft.com, keescook@chromium.org, minyard@acm.org,
 mike.travis@hpe.com, jejb@linux.ibm.com, apparmor@lists.ubuntu.com,
 linux-raid@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 nixiaoming@huawei.com, jgross@suse.com, martin.petersen@oracle.com,
 sujiaxun@uniontech.com, gregkh@linuxfoundation.org, robinmholt@gmail.com,
 linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com,
 ebiederm@xmission.com, tangmeng@uniontech.com, linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 2, 2023 at 12:46 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> register_sysctl_table() is a deprecated compatibility wrapper.
> register_sysctl() can do the directory creation for you so just use
> that.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Acked-by: Song Liu <song@kernel.org>

Thanks!

