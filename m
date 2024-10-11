Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 581C9999E0B
	for <lists+apparmor@lfdr.de>; Fri, 11 Oct 2024 09:37:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1szACw-0000NY-Rt; Fri, 11 Oct 2024 07:37:06 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1szACv-0000NR-BP
 for apparmor@lists.ubuntu.com; Fri, 11 Oct 2024 07:37:05 +0000
Received: from [192.168.192.84] (unknown [50.39.103.33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 967D53F1E8; 
 Fri, 11 Oct 2024 07:37:02 +0000 (UTC)
Message-ID: <3ca7f932-df55-44c5-86c4-0785fd15c50f@canonical.com>
Date: Fri, 11 Oct 2024 00:36:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Casey Schaufler <casey@schaufler-ca.com>, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
References: <20241009173222.12219-1-casey@schaufler-ca.com>
 <20241009173222.12219-2-casey@schaufler-ca.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20241009173222.12219-2-casey@schaufler-ca.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH v4 01/13] LSM: Add the lsm_prop data
	structure.
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
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org, selinux@vger.kernel.org,
 mic@digikod.net, bpf@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 10/9/24 10:32, Casey Schaufler wrote:
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

Acked-by: John Johansen <john.johansen@canonical.com>

> Cc: apparmor@lists.ubuntu.com
> Cc: bpf@vger.kernel.org
> Cc: selinux@vger.kernel.org
> Cc: linux-security-module@vger.kernel.org
> ---
>   include/linux/lsm/apparmor.h | 17 +++++++++++++++++
>   include/linux/lsm/bpf.h      | 16 ++++++++++++++++
>   include/linux/lsm/selinux.h  | 16 ++++++++++++++++
>   include/linux/lsm/smack.h    | 17 +++++++++++++++++
>   include/linux/security.h     | 20 ++++++++++++++++++++
>   5 files changed, 86 insertions(+)
>   create mode 100644 include/linux/lsm/apparmor.h
>   create mode 100644 include/linux/lsm/bpf.h
>   create mode 100644 include/linux/lsm/selinux.h
>   create mode 100644 include/linux/lsm/smack.h
> 
> diff --git a/include/linux/lsm/apparmor.h b/include/linux/lsm/apparmor.h
> new file mode 100644
> index 000000000000..612cbfacb072
> --- /dev/null
> +++ b/include/linux/lsm/apparmor.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Linux Security Module interface to other subsystems.
> + * AppArmor presents single pointer to an aa_label structure.
> + */
> +#ifndef __LINUX_LSM_APPARMOR_H
> +#define __LINUX_LSM_APPARMOR_H
> +
> +struct aa_label;
> +
> +struct lsm_prop_apparmor {
> +#ifdef CONFIG_SECURITY_APPARMOR
> +	struct aa_label *label;
> +#endif
> +};
> +
> +#endif /* ! __LINUX_LSM_APPARMOR_H */
> diff --git a/include/linux/lsm/bpf.h b/include/linux/lsm/bpf.h
> new file mode 100644
> index 000000000000..8106e206fcef
> --- /dev/null
> +++ b/include/linux/lsm/bpf.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Linux Security Module interface to other subsystems.
> + * BPF may present a single u32 value.
> + */
> +#ifndef __LINUX_LSM_BPF_H
> +#define __LINUX_LSM_BPF_H
> +#include <linux/types.h>
> +
> +struct lsm_prop_bpf {
> +#ifdef CONFIG_BPF_LSM
> +	u32 secid;
> +#endif
> +};
> +
> +#endif /* ! __LINUX_LSM_BPF_H */
> diff --git a/include/linux/lsm/selinux.h b/include/linux/lsm/selinux.h
> new file mode 100644
> index 000000000000..9455a6b5b910
> --- /dev/null
> +++ b/include/linux/lsm/selinux.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Linux Security Module interface to other subsystems.
> + * SELinux presents a single u32 value which is known as a secid.
> + */
> +#ifndef __LINUX_LSM_SELINUX_H
> +#define __LINUX_LSM_SELINUX_H
> +#include <linux/types.h>
> +
> +struct lsm_prop_selinux {
> +#ifdef CONFIG_SECURITY_SELINUX
> +	u32 secid;
> +#endif
> +};
> +
> +#endif /* ! __LINUX_LSM_SELINUX_H */
> diff --git a/include/linux/lsm/smack.h b/include/linux/lsm/smack.h
> new file mode 100644
> index 000000000000..ff730dd7a734
> --- /dev/null
> +++ b/include/linux/lsm/smack.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Linux Security Module interface to other subsystems.
> + * Smack presents a pointer into the global Smack label list.
> + */
> +#ifndef __LINUX_LSM_SMACK_H
> +#define __LINUX_LSM_SMACK_H
> +
> +struct smack_known;
> +
> +struct lsm_prop_smack {
> +#ifdef CONFIG_SECURITY_SMACK
> +	struct smack_known *skp;
> +#endif
> +};
> +
> +#endif /* ! __LINUX_LSM_SMACK_H */
> diff --git a/include/linux/security.h b/include/linux/security.h
> index b86ec2afc691..555249a8d121 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -34,6 +34,10 @@
>   #include <linux/sockptr.h>
>   #include <linux/bpf.h>
>   #include <uapi/linux/lsm.h>
> +#include <linux/lsm/selinux.h>
> +#include <linux/lsm/smack.h>
> +#include <linux/lsm/apparmor.h>
> +#include <linux/lsm/bpf.h>
>   
>   struct linux_binprm;
>   struct cred;
> @@ -152,6 +156,22 @@ enum lockdown_reason {
>   	LOCKDOWN_CONFIDENTIALITY_MAX,
>   };
>   
> +/* scaffolding */
> +struct lsm_prop_scaffold {
> +	u32 secid;
> +};
> +
> +/*
> + * Data exported by the security modules
> + */
> +struct lsm_prop {
> +	struct lsm_prop_selinux selinux;
> +	struct lsm_prop_smack smack;
> +	struct lsm_prop_apparmor apparmor;
> +	struct lsm_prop_bpf bpf;
> +	struct lsm_prop_scaffold scaffold;
> +};
> +
>   extern const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1];
>   extern u32 lsm_active_cnt;
>   extern const struct lsm_id *lsm_idlist[];


