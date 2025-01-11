Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8AA0B0B5
	for <lists+apparmor@lfdr.de>; Mon, 13 Jan 2025 09:10:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXFX5-0000L8-CJ; Mon, 13 Jan 2025 08:10:47 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <gnoack3000@gmail.com>)
 id 1tWkQO-0003OK-LZ
 for apparmor@lists.ubuntu.com; Sat, 11 Jan 2025 22:57:48 +0000
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso2713395f8f.1
 for <apparmor@lists.ubuntu.com>; Sat, 11 Jan 2025 14:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736636268; x=1737241068;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WCg8xb2Xo0sCdKeVm7YztXx4jNd36j2wC37CJSNkcMk=;
 b=jV84gfIu7k5ajTmEQt44JUDsfk3HQyrjtGpHoCiAVC8aSl1rJKwAnUfp5+lP3B/5hq
 k5DwFzKFD3ucASMyyFi+x3JDNA0ITx4jv9N4cmPPOzKjDwOZyCuq08XJ6p4veSIKREK2
 51s1fAXHLr6ZvNnCuRI9uGJVAtxov0FfCzYwDJEj64B1sUz3WwIYz9dpfMhi1zHZU4JO
 jT7VCa3/+ofiGhJ0kZmalNpD/20JQL4qN2oAn8c1tVx90zsUuKeJFGN5u5Gnr5F+wdFQ
 PIpQxzThkNIV/CNLsrfQCCClWz577Qysmz1/9r0ynz3Qw9XeLXt4t3ntAifvIIAcTqjH
 Y8nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbxVRQ6N9YnB7N4I/HWF17AHXz2l1feVbw/A4GfRcEOh5L/5vkyFl04T08cJrfm65MKlTURjVMJA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YygDSFO6L0JwhCKDDuRBKe1LrMgUOLLl/2oNIjsCA6rj4zE7qdl
 r1ZfCzhMwmZfUv+mu5qwJiOtgH/WfEKrdLo93zhrxEu9OPcTD63A
X-Gm-Gg: ASbGncsK9cloi4/Imwzoi3Rx0fLADvwisIifToWFfxfv1Q3V0wid82plFDhmvqC+wZW
 zdfe1lqwXRA7X8cTBUkQNzreRtSAHKmhUef/t8zUBdWRwQIg8yfU68OD3gkjsaNDCVW7awh//RD
 RKId4JSN7k/Zy+F14UulsAchq/DqMnqbZzratIUn92Vt+x/y6BUvW3LRdGK645eaaUW37hBl0En
 MOEWq6rohaPYu7WYP6wUd3AS+l/g1ucjajXiGQ6+IBQm0MJjsp/uw==
X-Google-Smtp-Source: AGHT+IERK75MQXlZrMsw5ugl1zvCvzHVzDpi46b4X8b1ULkGHE0Lp2HvsnlaXz59QeqobQgHNn2/vg==
X-Received: by 2002:a05:6000:144d:b0:386:3082:ee2d with SMTP id
 ffacd0b85a97d-38a8730fac5mr12551076f8f.41.1736636267724; 
 Sat, 11 Jan 2025 14:57:47 -0800 (PST)
Received: from localhost ([2a02:168:59f0:1:1e69:7aff:fe05:97e6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1d13sm8310900f8f.91.2025.01.11.14.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 14:57:47 -0800 (PST)
Date: Sat, 11 Jan 2025 23:57:41 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Message-ID: <20250111.22fc32ae0729@gnoack.org>
References: <20250111194149.51058-1-tanyaagarwal25699@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250111194149.51058-1-tanyaagarwal25699@gmail.com>
Received-SPF: pass client-ip=209.85.221.48; envelope-from=gnoack3000@gmail.com;
 helo=mail-wr1-f48.google.com
X-Mailman-Approved-At: Mon, 13 Jan 2025 08:10:43 +0000
Subject: Re: [apparmor] [PATCH] security: fix typos and spelling errors
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

Thanks for the fixes!

On Sun, Jan 12, 2025 at 01:11:50AM +0530, Tanya Agarwal wrote:
> From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> 
> Fix typos and spelling errors in security module comments that were
> identified using the codespell tool.
> No functional changes - documentation only.
> 
> Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> ---
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
> [...]
>
> diff --git a/security/landlock/ruleset.c b/security/landlock/ruleset.c
> index a93bdbf52fff..18cc88378d1d 100644
> --- a/security/landlock/ruleset.c
> +++ b/security/landlock/ruleset.c
> @@ -121,7 +121,7 @@ create_rule(const struct landlock_id id,
>  		return ERR_PTR(-ENOMEM);
>  	RB_CLEAR_NODE(&new_rule->node);
>  	if (is_object_pointer(id.type)) {
> -		/* This should be catched by insert_rule(). */
> +		/* This should have beeen caught by insert_rule(). */

This is accidentally introducing another typo: s/beeen/been/

—Günther

-- 

