Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE7F999AE7
	for <lists+apparmor@lfdr.de>; Fri, 11 Oct 2024 05:08:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sz60i-0000KP-Hh; Fri, 11 Oct 2024 03:08:12 +0000
Received: from mail-qk1-f182.google.com ([209.85.222.182])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sz60f-0000K1-Oa
 for apparmor@lists.ubuntu.com; Fri, 11 Oct 2024 03:08:09 +0000
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7afc847094fso95758685a.2
 for <apparmor@lists.ubuntu.com>; Thu, 10 Oct 2024 20:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728616088; x=1729220888;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JBDimyqC4CJK4p2iBMj8GbFo0/9rbwMGrV3N2csFsfI=;
 b=cPKDHo93z77RWkSlJJCvfpaIr1UOwTgWMVpnfH/2sLfTAHXaNQWYJfmFSKwXkrW0jQ
 Totx0oVEjLkFNsVV3CAwsP9y/p8Tl/2MrB2IT+8rdzVPAoYO7C/oziFSMNAXrjp13yQs
 D/yRTSGj3OtmwVPwhHoerGrEtLpYlgQEmJlbaX5TE6keDJBJhMJcsoQl2JQPSQMXjfFt
 7C6rbbkQXzS67sdvXGI5ajAYPSq5brDXwkMBzR+VK5A6IaGiXYwaR5LdrAtBr0TBkN6w
 Kh7XP5ZkEWiukm5XmG+I7+BZdDMmIan1olDZEQEd9azwxv+01MUpjviMBNXNJ5JKoGtu
 Pqfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUZwN9cOYcXnKl9jDwT+Ic3f+xwKeFxO7uA1GIZAeb4lGcT78GOwz09XFjptd17YzbIPHE2KeqQA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyXu7f4W2hpmpOsqbe4+UJoctVRj+jiZCdn1XCjD9fOJ13qUZ+x
 77v1VxUdFa5e4fAlp/cJ+NaPH4UDCyK2sPmvBcJCxs7Y30qeWdJ09WszH8u/cA==
X-Google-Smtp-Source: AGHT+IEq45tHLzd0BJhXzLGe1YJAlDo84n078XLgRxpwqpJN8UttW19ZEx28YGyczqACohCw1soA3Q==
X-Received: by 2002:a05:620a:444c:b0:7a9:c346:382c with SMTP id
 af79cd13be357-7b11a35f629mr149344885a.20.1728616088451; 
 Thu, 10 Oct 2024 20:08:08 -0700 (PDT)
Received: from localhost ([70.22.175.108]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b114956044sm97771285a.79.2024.10.10.20.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 20:08:07 -0700 (PDT)
Date: Thu, 10 Oct 2024 23:08:07 -0400
Message-ID: <1e6f94db91f0df07373ec1e0c8f3eced@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey@schaufler-ca.com,
 linux-security-module@vger.kernel.org
References: <20241009173222.12219-2-casey@schaufler-ca.com>
In-Reply-To: <20241009173222.12219-2-casey@schaufler-ca.com>
Received-SPF: pass client-ip=209.85.222.182; envelope-from=paul@paul-moore.com;
 helo=mail-qk1-f182.google.com
Subject: Re: [apparmor] [PATCH v4 1/13] LSM: Add the lsm_prop data structure.
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

On Oct  9, 2024 Casey Schaufler <casey@schaufler-ca.com> wrote:
> 
> When more than one security module is exporting data to audit and
> networking sub-systems a single 32 bit integer is no longer
> sufficient to represent the data. Add a structure to be used instead.
> 
> The lsm_prop structure definition is intended to keep the LSM
> specific information private to the individual security modules.
> The module specific information is included in a new set of
> header files under include/lsm. Each security module is allowed
> to define the information included for its use in the lsm_prop.
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

Looks good to me, thanks for the lsm_prop rename.  As a FYI, I did add
a line to the MAINTAINERS entry for include/linux/lsm/.

--
paul-moore.com

