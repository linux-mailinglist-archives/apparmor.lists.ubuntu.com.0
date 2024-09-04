Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DA76696AD37
	for <lists+apparmor@lfdr.de>; Wed,  4 Sep 2024 02:18:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sldjE-0000Db-Fr; Wed, 04 Sep 2024 00:18:32 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sldjD-0000DK-37
 for apparmor@lists.ubuntu.com; Wed, 04 Sep 2024 00:18:31 +0000
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6bf7ad1ec3aso30823336d6.0
 for <apparmor@lists.ubuntu.com>; Tue, 03 Sep 2024 17:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725409109; x=1726013909;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :content-disposition:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ctskL29EfLAIjmAHt2I735/optYRiZRhKdp9ltI34F8=;
 b=FzoB4DfRPosWXU+Q5TC3Jn9lhahpafNw9qgD8iQSpeHeI72y98hJQAVcZNLj89VgMz
 m0y20JY8okNBwBvIHLW4hieNtfP74tqUyBx9mtK/pcLZzxPrkHWbsEqQeyqvIrENh8NU
 JHKqFOEJMbGqZf/o/VQm8NSaTPcEujYPT93nBsD0ot89dMuSr1p7DV/5PRWGcGtQASsx
 4ApBQvPST4/5HUH7Q4KL87VPD+/CejXtjVDZpdXGwnEMST41RjnK/aWZzadHEAJQZA0Z
 sGluStj9/TFrNQcCQFjeuo5K1n9GxPQB5jyJszUYUpQm6/Nr7pKl8yfoijJmgDrjdJiO
 z3eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9FI7Q0rQbs27VOytnsLSsjXEM0akrO9rPZUVRYcUZL/7hKGjvq5HjUZLq/LdO3/IsZdW5PJD4qw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxeLtV50basUJtgTa/UQR0i9U7fjdvcICVIVy811F3fXGqPmQ3R
 q/ytY6BCtl009KF4wHiRCTLLaMLv11BzPntfoiuPV41jYMjp5laz906VJkOYdQ==
X-Google-Smtp-Source: AGHT+IFYJX0OQDlnuyOuBDrX8gGL7waDJfZYhEV62tEOWfBsBjGK1AKaf/72ZP06vAhwNwcLxyT9Jg==
X-Received: by 2002:a05:6214:4a06:b0:6c5:dc7:577c with SMTP id
 6a1803df08f44-6c50dc75934mr51075426d6.2.1725409109526; 
 Tue, 03 Sep 2024 17:18:29 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c5122edbfdsm10390956d6.108.2024.09.03.17.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 17:18:29 -0700 (PDT)
Date: Tue, 03 Sep 2024 20:18:28 -0400
Message-ID: <0a6ba6a6dbd423b56801b84b01fa8c41@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey@schaufler-ca.com,
 linux-security-module@vger.kernel.org
References: <20240830003411.16818-2-casey@schaufler-ca.com>
In-Reply-To: <20240830003411.16818-2-casey@schaufler-ca.com>
Received-SPF: pass client-ip=209.85.219.45; envelope-from=paul@paul-moore.com;
 helo=mail-qv1-f45.google.com
Subject: Re: [apparmor] [PATCH v2 1/13] LSM: Add the lsmblob data structure.
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
Cc: keescook@chromium.org, penguin-kernel@i-love.sakura.ne.jp,
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, selinux@vger.kernel.org, mic@digikod.net,
 bpf@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Aug 29, 2024 Casey Schaufler <casey@schaufler-ca.com> wrote:
> 
> When more than one security module is exporting data to audit and
> networking sub-systems a single 32 bit integer is no longer
> sufficient to represent the data. Add a structure to be used instead.
> 
> The lsmblob structure definition is intended to keep the LSM
> specific information private to the individual security modules.
> The module specific information is included in a new set of
> header files under include/lsm. Each security module is allowed
> to define the information included for its use in the lsmblob.
> SELinux includes a u32 secid. Smack includes a pointer into its
> global label list. The conditional compilation based on feature
> inclusion is contained in the include/lsm files.
> 
> Suggested-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: apparmor@lists.ubuntu.com
> Cc: bpf@vger.kernel.org
> Cc: selinux@vger.kernel.org
> Cc: linux-security-module@vger.kernel.org
> ---
>  include/linux/lsm/apparmor.h | 17 +++++++++++++++++
>  include/linux/lsm/bpf.h      | 16 ++++++++++++++++
>  include/linux/lsm/selinux.h  | 16 ++++++++++++++++
>  include/linux/lsm/smack.h    | 17 +++++++++++++++++
>  include/linux/security.h     | 20 ++++++++++++++++++++
>  5 files changed, 86 insertions(+)
>  create mode 100644 include/linux/lsm/apparmor.h
>  create mode 100644 include/linux/lsm/bpf.h
>  create mode 100644 include/linux/lsm/selinux.h
>  create mode 100644 include/linux/lsm/smack.h

...

> diff --git a/include/linux/security.h b/include/linux/security.h
> index 1390f1efb4f0..0057a22137e8 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -34,6 +34,10 @@
>  #include <linux/sockptr.h>
>  #include <linux/bpf.h>
>  #include <uapi/linux/lsm.h>
> +#include <linux/lsm/selinux.h>
> +#include <linux/lsm/smack.h>
> +#include <linux/lsm/apparmor.h>
> +#include <linux/lsm/bpf.h>
>  
>  struct linux_binprm;
>  struct cred;
> @@ -140,6 +144,22 @@ enum lockdown_reason {
>  	LOCKDOWN_CONFIDENTIALITY_MAX,
>  };
>  
> +/* scaffolding */
> +struct lsmblob_scaffold {
> +	u32 secid;
> +};
> +
> +/*
> + * Data exported by the security modules
> + */
> +struct lsmblob {
> +	struct lsmblob_selinux selinux;
> +	struct lsmblob_smack smack;
> +	struct lsmblob_apparmor apparmor;
> +	struct lsmblob_bpf bpf;
> +	struct lsmblob_scaffold scaffold;
> +};

Warning, top shelf bikeshedding follows ...

I believe that historically when we've talked about the "LSM blob" we've
usually been referring to the opaque buffers used to store LSM state that
we attach to a number of kernel structs using the `void *security` field.

At least that is what I think of when I read "struct lsmblob", and I'd
like to get ahead of the potential confusion while we still can.

Casey, I'm sure you're priority is simply getting this merged and you
likely care very little about the name (as long as it isn't too horrible),
but what about "lsm_ref"?  Other ideas are most definitely welcome.

I'm not going to comment on all the other related occurrences in the
patchset, but all the "XXX_lsmblob_XXX" functions should be adjusted based
on what we name the struct, e.g. "XXX_lsmref_XXX".

--
paul-moore.com

