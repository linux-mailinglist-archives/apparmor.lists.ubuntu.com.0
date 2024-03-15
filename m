Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8B687D4C4
	for <lists+apparmor@lfdr.de>; Fri, 15 Mar 2024 20:59:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rlDiJ-0003Si-Ie; Fri, 15 Mar 2024 19:59:35 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <serge@hallyn.com>) id 1rlDi9-0003SP-9l
 for apparmor@lists.ubuntu.com; Fri, 15 Mar 2024 19:59:25 +0000
Received: from serge-l-PF3DENS3 (unknown [72.163.2.238])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: serge)
 by mail.hallyn.com (Postfix) with ESMTPSA id 8AAB0888;
 Fri, 15 Mar 2024 14:59:21 -0500 (CDT)
Date: Fri, 15 Mar 2024 14:59:19 -0500
From: Serge Hallyn <serge@hallyn.com>
To: Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>
Message-ID: <ZfSol9llgsKWj1p9@serge-l-PF3DENS3>
References: <20240315113828.258005-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315113828.258005-1-cgzones@googlemail.com>
Received-SPF: pass client-ip=178.63.66.53; envelope-from=serge@hallyn.com;
 helo=mail.hallyn.com
Subject: Re: [apparmor] [PATCH 01/10] capability: introduce new capable flag
 CAP_OPT_NOAUDIT_ONDENY
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
Cc: Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, James Morris <jmorris@namei.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-block@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>,
 linux-security-module@vger.kernel.org,
 Khadija Kamran <kamrankhadijadj@gmail.com>, apparmor@lists.ubuntu.com,
 bpf@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Mar 15, 2024 at 12:37:22PM +0100, Christian Göttsche wrote:
> Introduce a new capable flag, CAP_OPT_NOAUDIT_ONDENY, to not generate
> an audit event if the requested capability is not granted.  This will be
> used in a new capable_any() functionality to reduce the number of
> necessary capable calls.
> 
> Handle the flag accordingly in AppArmor and SELinux.
> 
> CC: linux-block@vger.kernel.org
> Suggested-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>

Thanks.

Reviewed-by: Serge Hallyn <serge@hallyn.com>

> ---
> v5:
>    rename flag to CAP_OPT_NOAUDIT_ONDENY, suggested by Serge:
>      https://lore.kernel.org/all/20230606190013.GA640488@mail.hallyn.com/
> ---
>  include/linux/security.h       |  2 ++
>  security/apparmor/capability.c |  8 +++++---
>  security/selinux/hooks.c       | 14 ++++++++------
>  3 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 41a8f667bdfa..c60cae78ff8b 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -70,6 +70,8 @@ struct lsm_ctx;
>  #define CAP_OPT_NOAUDIT BIT(1)
>  /* If capable is being called by a setid function */
>  #define CAP_OPT_INSETID BIT(2)
> +/* If capable should audit the security request for authorized requests only */
> +#define CAP_OPT_NOAUDIT_ONDENY BIT(3)
>  
>  /* LSM Agnostic defines for security_sb_set_mnt_opts() flags */
>  #define SECURITY_LSM_NATIVE_LABELS	1
> diff --git a/security/apparmor/capability.c b/security/apparmor/capability.c
> index 9934df16c843..08c9c9a0fc19 100644
> --- a/security/apparmor/capability.c
> +++ b/security/apparmor/capability.c
> @@ -108,7 +108,8 @@ static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile
>   * profile_capable - test if profile allows use of capability @cap
>   * @profile: profile being enforced    (NOT NULL, NOT unconfined)
>   * @cap: capability to test if allowed
> - * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
> + * @opts: CAP_OPT_NOAUDIT/CAP_OPT_NOAUDIT_ONDENY bit determines whether audit
> + *	record is generated
>   * @ad: audit data (MAY BE NULL indicating no auditing)
>   *
>   * Returns: 0 if allowed else -EPERM
> @@ -126,7 +127,7 @@ static int profile_capable(struct aa_profile *profile, int cap,
>  	else
>  		error = -EPERM;
>  
> -	if (opts & CAP_OPT_NOAUDIT) {
> +	if ((opts & CAP_OPT_NOAUDIT) || ((opts & CAP_OPT_NOAUDIT_ONDENY) && error)) {
>  		if (!COMPLAIN_MODE(profile))
>  			return error;
>  		/* audit the cap request in complain mode but note that it
> @@ -143,7 +144,8 @@ static int profile_capable(struct aa_profile *profile, int cap,
>   * @subj_cred: cred we are testing capability against
>   * @label: label being tested for capability (NOT NULL)
>   * @cap: capability to be tested
> - * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
> + * @opts: CAP_OPT_NOAUDIT/CAP_OPT_NOAUDIT_ONDENY bit determines whether audit
> + *	record is generated
>   *
>   * Look up capability in profile capability set.
>   *
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 3448454c82d0..1a2c7c1a89be 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -1624,7 +1624,7 @@ static int cred_has_capability(const struct cred *cred,
>  	u16 sclass;
>  	u32 sid = cred_sid(cred);
>  	u32 av = CAP_TO_MASK(cap);
> -	int rc;
> +	int rc, rc2;
>  
>  	ad.type = LSM_AUDIT_DATA_CAP;
>  	ad.u.cap = cap;
> @@ -1643,11 +1643,13 @@ static int cred_has_capability(const struct cred *cred,
>  	}
>  
>  	rc = avc_has_perm_noaudit(sid, sid, sclass, av, 0, &avd);
> -	if (!(opts & CAP_OPT_NOAUDIT)) {
> -		int rc2 = avc_audit(sid, sid, sclass, av, &avd, rc, &ad);
> -		if (rc2)
> -			return rc2;
> -	}
> +	if ((opts & CAP_OPT_NOAUDIT) || ((opts & CAP_OPT_NOAUDIT_ONDENY) && rc))
> +		return rc;
> +
> +	rc2 = avc_audit(sid, sid, sclass, av, &avd, rc, &ad);
> +	if (rc2)
> +		return rc2;
> +
>  	return rc;
>  }
>  
> -- 
> 2.43.0
> 
> 

