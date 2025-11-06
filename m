Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FD4C3BE38
	for <lists+apparmor@lfdr.de>; Thu, 06 Nov 2025 15:54:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vH1NR-0002I7-EO; Thu, 06 Nov 2025 14:54:17 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vH1NP-0002Hs-Qw
 for apparmor@lists.ubuntu.com; Thu, 06 Nov 2025 14:54:15 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DC83E40189
 for <apparmor@lists.ubuntu.com>; Thu,  6 Nov 2025 14:54:14 +0000 (UTC)
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-59428dcd1fbso631540e87.0
 for <apparmor@lists.ubuntu.com>; Thu, 06 Nov 2025 06:54:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762440853; x=1763045653;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AeJV8PctFSZqeTwM/Nu1W1BbU7+ROG2OVp5zv88vYO8=;
 b=QXfqlPPtdVS4zSxcI6Z7hwzS5SRSZWowqg3GZbKmxxAb4IZ87f3vmx5ppvbdxB/k+z
 0KKjnabo8fdZeiQ3PJ07xrpyzcpCvvGaqOJZpjztZfNTeK0cUTROFw+bD4h71XZM4DL6
 uR20ejLto9kdv3vNevrOlDd2xQFxJ/2ccN1CXrp+FeujyqQXNI/ao7unfiwpeoGzh5ld
 20vbuDX7rMgPgXZMkjsw1AJOgsvpWsVVBHLE09qzojtMQL73PoMkh7SU7F3l98KWzbdA
 bMx0qwHiBRnO5P0RGAVodnk+gw3rii6YZEtO1UuPj6cHwZUkz+znQTvVXT7YL6QjwowZ
 6T9Q==
X-Gm-Message-State: AOJu0YwGxq6S3jX1S3tsfdCHMFKOcEfUw8H74HW6EgOigoN0v5uqXX6e
 3F0rfJ4XE4rUB1rbgw3jMdz3X+DOX4fdi8mKbWlrFhXQ8ZCl5Wh3Gw+09h7Fz+wQ1w3I6ly30BG
 tO2AwWvcKXGlWuYuDdjFiesAd8W7PyKsIV2st1kGkY71Bbirgq1/1bjEgtk8w+2k9NfO4b1QPg0
 5dqg==
X-Gm-Gg: ASbGncvPFzKy1XmULIYWHWVk5+OgrxVoUg8shqHq6CK60vahZtCxWjMdv79RWCKuBXh
 d0DwFVuCk+HNMUs+jqkkvLVkG6iW9JsvpHNRbnMgbKNVnO3pUM+aLq3n4F2NzlP4JvCKPgy8Ffk
 TASu+JbtEoymeVx5yE9RfPvrlocfbZDTRNWs7MgLC23fEY5CWh8y+2tAqcYs4O8Bkjsnf5acL89
 922+DOB/1+qj8BruAgXaKDKT+UyY9dZkdrqImNzqJrYiZrO1PlfVDW5o98xJPUlsTH8FieLKFX3
 FMsjA2Tnkeei3trAnl2WMHm2eepQmxKGQfDEn+9U4bs8pq2cwqVrNYxo8TPXamX3BQdl3dDwH9m
 6+/Ds5jWXfxpsXG3+qfYfboCEuW771RGEPA==
X-Received: by 2002:a05:6512:61a1:b0:563:2efc:dea7 with SMTP id
 2adb3069b0e04-5943d7c9126mr2591526e87.34.1762440853561; 
 Thu, 06 Nov 2025 06:54:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkya0pNrMU6ObtM5yVc6w7wtXddBoJJXH84XUOtreiOgT24KGL2kymBLvJ1zbA5T8rX5+9bg==
X-Received: by 2002:a05:6512:61a1:b0:563:2efc:dea7 with SMTP id
 2adb3069b0e04-5943d7c9126mr2591517e87.34.1762440853104; 
 Thu, 06 Nov 2025 06:54:13 -0800 (PST)
Received: from [10.207.66.60] ([93.94.208.159])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5944a5a0d0asm758572e87.111.2025.11.06.06.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 06:54:12 -0800 (PST)
Message-ID: <f169ae3a-d50d-4eb3-a977-bb16270527bd@canonical.com>
Date: Thu, 6 Nov 2025 06:54:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
References: <20251106145138.2123-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20251106145138.2123-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Replace deprecated strcpy
 in d_namespace_path
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

On 11/6/25 06:51, Thorsten Blum wrote:
> strcpy() is deprecated; replace it with a direct '/' assignment. The
> buffer is already NUL-terminated, so there is no need to copy an
> additional NUL terminator as strcpy() did.
> 
> Update the comment and add the local variable 'is_root' for clarity.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

hey Thorsten,

sorry I have just been swamped, and traveling, ...
I will start on the patch backlog tonight

> ---
>   security/apparmor/path.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/security/apparmor/path.c b/security/apparmor/path.c
> index d6c74c357ffd..65a0ca5cc1bd 100644
> --- a/security/apparmor/path.c
> +++ b/security/apparmor/path.c
> @@ -164,12 +164,15 @@ static int d_namespace_path(const struct path *path, char *buf, char **name,
>   	}
>   
>   out:
> -	/*
> -	 * Append "/" to the pathname.  The root directory is a special
> -	 * case; it already ends in slash.
> +	/* Append "/" to directory paths, except for root "/" which
> +	 * already ends in a slash.
>   	 */
> -	if (!error && isdir && ((*name)[1] != '\0' || (*name)[0] != '/'))
> -		strcpy(&buf[aa_g_path_max - 2], "/");
> +	if (!error && isdir) {
> +		bool is_root = (*name)[0] == '/' && (*name)[1] == '\0';
> +
> +		if (!is_root)
> +			buf[aa_g_path_max - 2] = '/';
> +	}
>   
>   	return error;
>   }


