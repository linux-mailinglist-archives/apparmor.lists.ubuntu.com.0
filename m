Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 208AF6A8BEA
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:35:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrWT-0003u9-Fb; Thu, 02 Mar 2023 22:35:37 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <georgia.garcia@canonical.com>) id 1pXpku-0007HT-Rg
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 20:42:24 +0000
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9910F3F232
 for <apparmor@lists.ubuntu.com>; Thu,  2 Mar 2023 20:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1677789743;
 bh=VPNnC6C1cy3MGBtKJ7RY2J7qDK3sxM2tBtUziWuIYdg=;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
 Content-Type:MIME-Version;
 b=cwsORZACNKdUFjmD2O+0eraH3LIIbbVwDr40QqDWeb6hXl2/KfCjhG0WhgHtUdFE4
 pvtvz6yMZtpli8IkdnWqzYdiu7vS1uky/3NJDb9MheGpt4/KwJF7ysSUswtUnOdBmg
 xHdckwdwvnRIV4HID06QYgz3lzP6Uh1+BUuaj2cGJJii9HukEI+OWV0mNe0iBw3Tqv
 sHRi7thpnrvwSPSvG2Q26Ax4hzvxyjQ+luQzjq1+/wTWprK945CaGgFEwdD0FKzcaZ
 slRMsYsO3sHsakgpUuACAP38n6O44bs3Ga24LvRjPCr7Nl28wVmkiejInEVYASQHBm
 7rINeMto2Te6A==
Received: by mail-ot1-f72.google.com with SMTP id
 v8-20020a9d4e88000000b006942254c4bcso210639otk.22
 for <apparmor@lists.ubuntu.com>; Thu, 02 Mar 2023 12:42:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677789740;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VPNnC6C1cy3MGBtKJ7RY2J7qDK3sxM2tBtUziWuIYdg=;
 b=nHbe+Gyq1W8HfM+2p3KTH9jkeD6jwI+R9KlHTN1M3OL85bnzQwDHyzWo/b6djlhcYW
 oKvSIWKkkVu7JLBBGSKldtglIDpnoDQD/IIdJmfXEv4eoDJvI2rC/gA+lDSZnx9e+4zi
 zHG28cdvidXwokG6MW8ERgAh/AdNfnK/MSujaLV9MSlf77lt8XCAmB6AL3E5NGimZtW3
 aB8FPNMrFmLLW60gx48UTMwbDb2n7oOpIXdMo8r5ZsA8kBgQspcDx335Q2m0aM/TRuJq
 CHok816Zb3ImkEIyffI+wF8TQRFBqFeF2idq24dHE+j85FkYnZdiV1lWWo+pPUA1Rc8Z
 syEQ==
X-Gm-Message-State: AO0yUKVYWh4N0gOvvB4ngNrQxk5Q9o/I2R3svHCJLaPscL8MpcONvstm
 CbyNdMxV7EOvE2Vb6EROBWEvkrRsgihChpazDOt81TIcAgC18+Axq7Lkf85RWo3ChTKNZOBor+N
 jUl6YwHxNmM8/4BJAgK5lVqPI81PUvIToZe8F5A==
X-Received: by 2002:a9d:803:0:b0:690:d198:4d1e with SMTP id
 3-20020a9d0803000000b00690d1984d1emr1669417oty.8.1677789740523; 
 Thu, 02 Mar 2023 12:42:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+mzZi4KGEKQQVH4HIHgt8mr09sF5ZEI/y0N5gvVHOM4lDo9PhDEhWGcQyAF/1JU7UCO5GrTA==
X-Received: by 2002:a9d:803:0:b0:690:d198:4d1e with SMTP id
 3-20020a9d0803000000b00690d1984d1emr1669391oty.8.1677789740223; 
 Thu, 02 Mar 2023 12:42:20 -0800 (PST)
Received: from ?IPv6:2804:1b3:a7c3:d46d:73b6:f440:93a4:30?
 ([2804:1b3:a7c3:d46d:73b6:f440:93a4:30])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a9d72cb000000b0068bcef4f543sm327296otk.21.2023.03.02.12.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 12:42:19 -0800 (PST)
Message-ID: <c010472791aa57c8ea838b5e85780f5be98898d5.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: Luis Chamberlain <mcgrof@kernel.org>, ebiederm@xmission.com, 
 keescook@chromium.org, yzaikin@google.com, john.johansen@canonical.com, 
 paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
 luto@amacapital.net,  wad@chromium.org, dverkamp@chromium.org,
 paulmck@kernel.org, baihaowen@meizu.com,  frederic@kernel.org,
 jeffxu@google.com, ebiggers@kernel.org, tytso@mit.edu,  guoren@kernel.org
Date: Thu, 02 Mar 2023 17:42:07 -0300
In-Reply-To: <20230302202826.776286-5-mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-5-mcgrof@kernel.org>
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Mar 2023 22:35:35 +0000
Subject: Re: [apparmor] [PATCH 04/11] apparmor: simplify sysctls with
 register_sysctl_init()
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
Cc: j.granados@samsung.com, sujiaxun@uniontech.com, tangmeng@uniontech.com,
 apparmor@lists.ubuntu.com, patches@lists.linux.dev, willy@infradead.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-csky@vger.kernel.org, zhangpeng362@huawei.com,
 linux-fsdevel@vger.kernel.org, nixiaoming@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, 2023-03-02 at 12:28 -0800, Luis Chamberlain wrote:
> Using register_sysctl_paths() is really only needed if you have
> subdirectories with entries. We can use the simple register_sysctl()
> instead.
>=20
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  security/apparmor/lsm.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index d6cc4812ca53..47c7ec7e5a80 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1764,11 +1764,6 @@ static int apparmor_dointvec(struct ctl_table *tab=
le, int write,
>  	return proc_dointvec(table, write, buffer, lenp, ppos);
>  }
> =20
> -static struct ctl_path apparmor_sysctl_path[] =3D {
> -	{ .procname =3D "kernel", },
> -	{ }
> -};
> -
>  static struct ctl_table apparmor_sysctl_table[] =3D {
>  	{
>  		.procname       =3D "unprivileged_userns_apparmor_policy",
> @@ -1790,8 +1785,7 @@ static struct ctl_table apparmor_sysctl_table[] =3D=
 {
> =20
>  static int __init apparmor_init_sysctl(void)
>  {
> -	return register_sysctl_paths(apparmor_sysctl_path,
> -				     apparmor_sysctl_table) ? 0 : -ENOMEM;
> +	return register_sysctl("kernel", apparmor_sysctl_table) ? 0 : -ENOMEM;
>  }
>  #else
>  static inline int apparmor_init_sysctl(void)

Reviewed-by: Georgia Garcia <georgia.garcia@canonical.com>


