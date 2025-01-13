Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C39A10D22
	for <lists+apparmor@lfdr.de>; Tue, 14 Jan 2025 18:10:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXkQg-00048E-0M; Tue, 14 Jan 2025 17:10:14 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <gnoack3000@gmail.com>)
 id 1tXLmC-0003cp-Fv
 for apparmor@lists.ubuntu.com; Mon, 13 Jan 2025 14:50:48 +0000
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso27128565e9.1
 for <apparmor@lists.ubuntu.com>; Mon, 13 Jan 2025 06:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736779848; x=1737384648;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d0NjS1II12TMN7g1xhUgyqXDJMjrZfAmxWycmrEMMZc=;
 b=Bklg+Vo8yQa8keOTsqRc+XkwcoYWFe0x5mjN0TnSXevOmCpNjSv4moP/H872qHFJ+3
 3Ry178RHgZqTbV5HlMcUWqMpac5bGFn9/vPE9N48Cqk36evzV8VwP/9IZxtQ0j2CWTCH
 Jh3m3tH7zgDUBqVaCzME71TWzLe35RBxQRxM08lfRWiaFlkLUPoe4izfaUmZzEA5VyZe
 LF2dz3jBW4/QAxc8OFrOEr8YpiKAU/09Hzi5Yj4SlrnatZas7yUM/ITGXA76XrlJ1af9
 k+90mf9kE5QESE3kdoPEdm1uXqZgqAgezmL8hA7fO1gmPpspIXYN2wtKDIy/w/tjMWmG
 kJiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE70ntaLZqAEQ7UCqmJunt0SaKaaHVT8NIQr/08Up1pzM7X3nh6wgfIGXJ6SzbJG1x7wVdqnpRYQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzYrYUe3P/km+ZkHo1xT1FrGV88kFvYjoiTyoCzUQFgpKhAxiyT
 SYdvby1Wq1zAszrddKQGv+mAVW6fQrooWlgDgKE8ZgczRcoqFTPj
X-Gm-Gg: ASbGnctoJP7nSQWToYNoJuUUX9rWI4TQXmLNizBs4jHc1zffcxz6Di7qoqb/2hlKklP
 wq1cktKFsRpRd9zPNzt7TaoOawjvNsxWZurvxynz6hNsfHj8pCeKOj7iY3MLf7Gce7bBaKvcMpr
 sYgxLQitPKx6Hk9ggqEXF4YNyBV/3NAg/qwJmM5ePnNhtp2kNEAEWIz7aS8O/pRlHQNxc11UYh/
 RCWpJR4MvMoeq8c+8co4PYuuQuhXc9DEA4ettXIoNmXdCIPRMoQNg==
X-Google-Smtp-Source: AGHT+IFFNmsPhbFB0SkryX+GHfN4UCZ+BS4WzQbbvfLIbB5I7Ed31UF72Wgu7bCYXm7jNM02zGWjNw==
X-Received: by 2002:a05:600c:5028:b0:434:fa73:a906 with SMTP id
 5b1f17b1804b1-436e9d6fe9emr136818765e9.4.1736779847430; 
 Mon, 13 Jan 2025 06:50:47 -0800 (PST)
Received: from localhost ([2a02:168:59f0:1:b0ab:dd5e:5c82:86b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e6263fsm149560315e9.39.2025.01.13.06.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 06:50:47 -0800 (PST)
Date: Mon, 13 Jan 2025 15:50:42 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Message-ID: <20250113.a860b47a11c7@gnoack.org>
References: <20250111.22fc32ae0729@gnoack.org>
 <20250112072925.1774-1-tanyaagarwal25699@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250112072925.1774-1-tanyaagarwal25699@gmail.com>
Received-SPF: pass client-ip=209.85.128.48; envelope-from=gnoack3000@gmail.com;
 helo=mail-wm1-f48.google.com
X-Mailman-Approved-At: Tue, 14 Jan 2025 17:10:11 +0000
Subject: Re: [apparmor] [PATCH V2] security: fix typos and spelling errors
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
Cc: eric.snowberg@oracle.com, paul@paul-moore.com,
 penguin-kernel@i-love.sakura.ne.jp, dmitry.kasatkin@gmail.com,
 stephen.smalley.work@gmail.com, roberto.sassu@huawei.com, jmorris@namei.org,
 zohar@linux.ibm.com, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, anupnewsmail@gmail.com,
 gnoack@google.com, skhan@linuxfoundation.org, linux-integrity@vger.kernel.org,
 serge@hallyn.com, apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 takedakn@nttdata.co.jp
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, Jan 12, 2025 at 12:59:27PM +0530, Tanya Agarwal wrote:
> From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> 
> Fix typos and spelling errors in security module comments that were
> identified using the codespell tool.
> No functional changes - documentation only.
> 
> Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> ---
> Thanks Günther, for catching this error.
> The irony of having a spelling mistake in a patch that fixes spelling
> mistakes is not lost on me :) 
> 
> I've fixed it in V2 of the patch. Thank you for the careful review!
> 
> V2: fix spelling mistake - s/beeen/been/ 
> 
>  security/apparmor/apparmorfs.c      | 6 +++---
>  security/apparmor/domain.c          | 4 ++--
>  security/apparmor/label.c           | 2 +-
>  security/apparmor/lsm.c             | 2 +-
>  security/apparmor/policy.c          | 4 ++--
>  security/integrity/evm/evm_crypto.c | 2 +-
>  security/integrity/evm/evm_main.c   | 2 +-
>  security/integrity/ima/ima_main.c   | 6 +++---
>  security/landlock/ruleset.c         | 2 +-
>  security/selinux/avc.c              | 2 +-
>  security/smack/smack.h              | 2 +-
>  security/smack/smack_access.c       | 4 ++--
>  security/smack/smack_lsm.c          | 6 +++---
>  security/smack/smackfs.c            | 2 +-
>  security/tomoyo/domain.c            | 2 +-
>  15 files changed, 24 insertions(+), 24 deletions(-)
> 

[...]

> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
> index 9b87556b03a7..cdb8c7419d7e 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -983,9 +983,9 @@ int process_buffer_measurement(struct mnt_idmap *idmap,
>  	}
>  
>  	/*
> -	 * Both LSM hooks and auxilary based buffer measurements are
> -	 * based on policy.  To avoid code duplication, differentiate
> -	 * between the LSM hooks and auxilary buffer measurements,
> +	 * Both LSM hooks and auxiliary based buffer measurements are
> +	 * based on policy. To avoid code duplication, differentiate
                          ^^^

(Small nit:) This change from two-spaces-after-the-dot to a single
space looks like it happened accidentally.  The two-space style is
dominant in the ima_main.c file.

(However, I am not involved in IMA and others have more authority to
review this part.  As Paul also said, reviews tend to go smoother when
the scope for the patch is a single subsystem - it makes the
responsibilities clearer.)

> +	 * between the LSM hooks and auxiliary buffer measurements,
>  	 * retrieving the policy rule information only for the LSM hook
>  	 * buffer measurements.
>  	 */

–Günther

