Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC4A6B0029
	for <lists+apparmor@lfdr.de>; Wed,  8 Mar 2023 08:48:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pZoWl-000717-Pu; Wed, 08 Mar 2023 07:47:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <ebiggers@kernel.org>) id 1pZdHy-0003IB-Mo
 for apparmor@lists.ubuntu.com; Tue, 07 Mar 2023 19:47:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41457B8117B;
 Tue,  7 Mar 2023 19:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29617C433D2;
 Tue,  7 Mar 2023 19:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678218477;
 bh=/1zAIbTQcsRF2izXv8x+EJJixmh8dm5+NhK5ibW2Rsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AyyYAwqUTTOk9EKiTutS5g25pM/VHwE2Yo3m82FjZAEXqu/CleA62t3i3SG/UTcG8
 cfH4mySgtTAl/FkN3gD0CJ7euNCSl9MX75AxDRKpva3vVaLJWbvyQOasMf1XPhtEse
 iBPu1h6EuVXY5lSdO/v6rwRJyxtn75T589Un0p3nRcpQZTj4bzppHMLBRDyhPnoXuz
 bHLOcMt+mmUsAQeljRkMmtZP9ekqGRdabMDAkS8V22Sb9MTBleK1hrduVVF14vWP/W
 aM3Nzol2A4VsZbRWcmcKEm4dvZ7lbDMj/phDraV03qLey3PXcapCMK6yTL8Mqeg2US
 bLMU3ZOVlo9ww==
Date: Tue, 7 Mar 2023 11:47:54 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZAeU6shP3vjBOqo7@sol.localdomain>
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-10-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302202826.776286-10-mcgrof@kernel.org>
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:47:56 +0000
Subject: Re: [apparmor] [PATCH 09/11] fs-verity: simplify sysctls with
	register_sysctl()
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
Cc: j.granados@samsung.com, jeffxu@google.com, guoren@kernel.org,
 linux-csky@vger.kernel.org, dverkamp@chromium.org, baihaowen@meizu.com,
 paul@paul-moore.com, jmorris@namei.org, willy@infradead.org,
 zhangpeng362@huawei.com, yzaikin@google.com, serge@hallyn.com,
 keescook@chromium.org, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 frederic@kernel.org, apparmor@lists.ubuntu.com, wad@chromium.org,
 nixiaoming@huawei.com, tytso@mit.edu, sujiaxun@uniontech.com,
 tangmeng@uniontech.com, patches@lists.linux.dev, luto@amacapital.net,
 linux-security-module@vger.kernel.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 02, 2023 at 12:28:24PM -0800, Luis Chamberlain wrote:
> register_sysctl_paths() is only needed if your child (directories) have
> entries but this does not so just use register_sysctl() so to do away
> with the path specification.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  fs/verity/signature.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next  

- Eric

