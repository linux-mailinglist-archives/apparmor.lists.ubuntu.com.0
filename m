Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F6E6A8C4B
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:56:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrqM-0006Iz-HI; Thu, 02 Mar 2023 22:56:10 +0000
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <keescook@chromium.org>) id 1pXrqK-0006Hh-Gs
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 22:56:08 +0000
Received: by mail-pl1-f169.google.com with SMTP id p6so947945plf.0
 for <apparmor@lists.ubuntu.com>; Thu, 02 Mar 2023 14:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1677797767;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=fDa++rPUZHG1cADT97wEka7i9XpBCSMw+BsUJit3tM8=;
 b=apW6CO+GriA5ax10w+Ltl21EZyiCuiEkrosyVJE39MbM7iiqBxUYPqTnJSZJrvIQ5m
 AyBgf/dBZT8ggeDyaszfb5BRhMl3PsNMujEvWYmubxg2OsoEQS9fDcbnxUg4wG8mHx8b
 JSd7FVNrEyw/RGhiZ1WY6WaWHYqk9swiQFrcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677797767;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fDa++rPUZHG1cADT97wEka7i9XpBCSMw+BsUJit3tM8=;
 b=C4ovs8JOp+yJKCFVcJNKGzyiAVMRe9iKHzvyt9DSqJ3uR5oh0Hci/G0MZNsEQ2rqmf
 Qh5rswiF6lsevvUeoFvx+fbmAT3aaFlCOhx368ARKVXmyyxwJ+eQn6/u0ij4ETO6+MgO
 aI6fqYM3m/9L7GBCAiQPm9FHAdzfqt6pWoTDlPUMz/MhtryRdHkHMLHMS1DsULWQUNEF
 MDtQzeHpj7xck9yXarJWxGJ2yM7rYzSa/+OTzaEQIQYytJ1O7fL652McFAZw+YqZlGHp
 EMSLyzktTQeT+U+5V2NOGR562rRuE76q7L9GR6bPIUB8199EcBNy55YxenlwC1yRJZ3N
 3TVQ==
X-Gm-Message-State: AO0yUKXCivvaMCwRiyI3Chn7jB9AtH2B+2K+iEL97QAGzhbWqky7Wq3a
 Ibmjs19aIn82z4lm8ON393lppg==
X-Google-Smtp-Source: AK7set+MEnLjHdrL/UF2pQiGl3CRsjFYnt0FAye8NGhtXVtdNjGBD457Drx+Q5YR8VVMf1FPUpgIMQ==
X-Received: by 2002:a17:90b:4a8c:b0:237:b702:49c0 with SMTP id
 lp12-20020a17090b4a8c00b00237b70249c0mr12768587pjb.45.1677797766720; 
 Thu, 02 Mar 2023 14:56:06 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a294d00b00234a2f6d9c0sm224637pjf.57.2023.03.02.14.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 14:56:06 -0800 (PST)
Message-ID: <64012986.170a0220.67312.124e@mx.google.com>
X-Google-Original-Message-ID: <202303021455.@keescook>
Date: Thu, 2 Mar 2023 14:56:05 -0800
From: Kees Cook <keescook@chromium.org>
To: Luis Chamberlain <mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-6-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302202826.776286-6-mcgrof@kernel.org>
Subject: Re: [apparmor] [PATCH 05/11] loadpin: simplify sysctls use with
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
 ebiggers@kernel.org, zhangpeng362@huawei.com, yzaikin@google.com,
 serge@hallyn.com, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 frederic@kernel.org, apparmor@lists.ubuntu.com, wad@chromium.org,
 nixiaoming@huawei.com, tytso@mit.edu, sujiaxun@uniontech.com,
 tangmeng@uniontech.com, patches@lists.linux.dev, luto@amacapital.net,
 linux-security-module@vger.kernel.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 02, 2023 at 12:28:20PM -0800, Luis Chamberlain wrote:
> register_sysctl_paths() is not required, we can just use
> register_sysctl() with the required path specified.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

