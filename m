Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C72931688
	for <lists+apparmor@lfdr.de>; Mon, 15 Jul 2024 16:19:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sTMXv-0000MD-NE; Mon, 15 Jul 2024 14:19:19 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <georgia.garcia@canonical.com>)
 id 1sTMXt-0000Lp-Rt
 for apparmor@lists.ubuntu.com; Mon, 15 Jul 2024 14:19:17 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6D0DC3F2C4
 for <apparmor@lists.ubuntu.com>; Mon, 15 Jul 2024 14:19:17 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1fb1759e34dso26381905ad.2
 for <apparmor@lists.ubuntu.com>; Mon, 15 Jul 2024 07:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721053154; x=1721657954;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/8pG/3FBfOWhh8pwkTWdbaExfS1+bWjS0N8YwTRlOM=;
 b=eH985YduVdACZ6mDsWGOzaOoisvJUMSwKwqAhMurJTlc+0is6Ba3/EYrnB68Sx4qyn
 hDeHXbOSKEwkBRU74EuXVWfkjP72JnsV1MEoHQuVBiq+qWPoMzZ64qntMTVARZC0FtjG
 eVrXKmSpX9EiCgAUk7D939Kv0Ng3B7VQH47pnfBRoQmxkQoXIjkd5qowbzyUrtbZ2viN
 uNagzGX8tdOaKP+3aLhimRPD6zD6xTFxQnOyhOSdyM5osZU0GiY0LKnADJv7Zdd/iMtY
 WymBikRkyeDb+ravD6bTnnEmCQbmYxPc2HkntUD2YADCcgObOf7DUUrMXtpKtjWkGWWs
 bA1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSRSL26KOAMcy9ukItsqQ3z9RvkdSqCDBfnzTGW5702EKKLnMIIneqFjVfbb/JNjdD01h76+fAtlxq8O9bTvPTURbaP9APIthC
X-Gm-Message-State: AOJu0YwiBAzCyQ9MsEXlXJpSj9kaE1MaApyPjIjdjb1u8aCqIKOjr3YA
 EAZ4OrtJJm/azUzR35yAfgntq9Cc3nsiKXiMZ//QnrYiorhSRZhkHCnGKNXTKXHF0wVsX4YnXYx
 tMyOm4SAFkiGWFiWBhdEZ5ErGzwLFt4klCIpVXydL3Cns7Ilj+l26QoLBWvBXrAXwgz61eG9fi5
 +gRnyGzK+h
X-Received: by 2002:a17:902:e549:b0:1fa:2277:f56c with SMTP id
 d9443c01a7336-1fbb6d6017fmr141802805ad.41.1721053154340; 
 Mon, 15 Jul 2024 07:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa5zIXe44WgjgbmKW9wuCDMVI6G8tAyTj0CAw3IeyU0yvLCNw/FI/O00VtOkdGmDH4JnNJMg==
X-Received: by 2002:a17:902:e549:b0:1fa:2277:f56c with SMTP id
 d9443c01a7336-1fbb6d6017fmr141802585ad.41.1721053153849; 
 Mon, 15 Jul 2024 07:19:13 -0700 (PDT)
Received: from ?IPv6:2001:1284:f502:e16:f7e7:cd8:d514:3617?
 ([2001:1284:f502:e16:f7e7:cd8:d514:3617])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bb70060sm42426165ad.58.2024.07.15.07.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 07:19:13 -0700 (PDT)
Message-ID: <8217ce983bcd4eebd43f3deb1461fb8880df7f0d.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>, 
 john.johansen@canonical.com
Date: Mon, 15 Jul 2024 11:19:09 -0300
In-Reply-To: <20240628153712.288166-1-aleksandr.mikhalitsyn@canonical.com>
References: <20240628153712.288166-1-aleksandr.mikhalitsyn@canonical.com>
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
Subject: Re: [apparmor] [PATCH] apparmor: take nosymfollow flag into account
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
Cc: stgraber@stgraber.org, brauner@kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, 2024-06-28 at 17:37 +0200, Alexander Mikhalitsyn wrote:
> A "nosymfollow" flag was added in commit
> dab741e0e02b ("Add a "nosymfollow" mount option.")
>=20
> While we don't need to implement any special logic on
> the AppArmor kernel side to handle it, we should provide
> user with a correct list of mount flags in audit logs.
>=20

Reviewed-by: Georgia Garcia <georgia.garcia@canonical.com>

> Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com=
>
> ---
>  security/apparmor/mount.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/security/apparmor/mount.c b/security/apparmor/mount.c
> index 49fe8da6fea4..bf8863253e07 100644
> --- a/security/apparmor/mount.c
> +++ b/security/apparmor/mount.c
> @@ -44,6 +44,8 @@ static void audit_mnt_flags(struct audit_buffer *ab, un=
signed long flags)
>  		audit_log_format(ab, ", mand");
>  	if (flags & MS_DIRSYNC)
>  		audit_log_format(ab, ", dirsync");
> +	if (flags & MS_NOSYMFOLLOW)
> +		audit_log_format(ab, ", nosymfollow");
>  	if (flags & MS_NOATIME)
>  		audit_log_format(ab, ", noatime");
>  	if (flags & MS_NODIRATIME)


