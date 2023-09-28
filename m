Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9F17B240B
	for <lists+apparmor@lfdr.de>; Thu, 28 Sep 2023 19:36:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qluw9-0006c8-J0; Thu, 28 Sep 2023 17:36:29 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1qluvz-0006b4-OO
 for apparmor@lists.ubuntu.com; Thu, 28 Sep 2023 17:36:20 +0000
Received: from [192.168.192.83] (unknown [50.39.103.33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 530B43F6F0; 
 Thu, 28 Sep 2023 17:36:18 +0000 (UTC)
Message-ID: <056095ad-ecf4-b93e-252a-7e3c48e94f11@canonical.com>
Date: Thu, 28 Sep 2023 10:36:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Li kunyu <kunyu@nfschina.com>, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com
References: <20230919015608.8390-1-kunyu@nfschina.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230919015608.8390-1-kunyu@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH v2] apparmor/file: Removing unnecessary
 initial values for variable pointers
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 9/18/23 18:56, Li kunyu wrote:
> These variable pointers are assigned during use and do not need to be
> initialized for assignment.
> 
> Signed-off-by: Li kunyu <kunyu@nfschina.com>
> ---
>   v2: Fix timestamp issues
> 
>   security/apparmor/file.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/security/apparmor/file.c b/security/apparmor/file.c
> index 698b124e649f..12eafdf18fc0 100644
> --- a/security/apparmor/file.c
> +++ b/security/apparmor/file.c
> @@ -264,7 +264,7 @@ int aa_path_perm(const char *op, struct aa_label *label,
>   {
>   	struct aa_perms perms = {};
>   	struct aa_profile *profile;
> -	char *buffer = NULL;
> +	char *buffer;

this is okay

>   	int error;
>   
>   	flags |= PATH_DELEGATE_DELETED | (S_ISDIR(cond->mode) ? PATH_IS_DIR :
> @@ -412,7 +412,7 @@ int aa_path_link(struct aa_label *label, struct dentry *old_dentry,
>   		d_backing_inode(old_dentry)->i_uid,
>   		d_backing_inode(old_dentry)->i_mode
>   	};
> -	char *buffer = NULL, *buffer2 = NULL;
> +	char *buffer, *buffer2;

this can cause an oops if buffer2 allocation fails. There are a couple of ways I can
see to fix this, do you want to take a crack at it.


>   	struct aa_profile *profile;
>   	int error;
>   


