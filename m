Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9F3BCDC18
	for <lists+apparmor@lfdr.de>; Fri, 10 Oct 2025 17:15:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7EqP-0007nC-BG; Fri, 10 Oct 2025 15:15:45 +0000
Received: from sonic310-30.consmr.mail.ne1.yahoo.com ([66.163.186.211])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <casey@schaufler-ca.com>)
 id 1v7EqN-0007mz-MR
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 15:15:43 +0000
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1760109342; bh=CMy7zU0hFZfi05XDI6EQ393Ll9F5DT12CZN1Tud9JHD=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=WmkzJdJUHRI/VOO2I0wZkZEnVLq3cwspKBPTiHllP45uijPBuYUVLGRALViNSzz/ZxKrq0gp24kbWbhApbfBVTNiEuGblRJ+9kYC8Y2yOOtYwZIkGdHGsI6edROtyLiXp700c39rRlhX84u73ekJzElRfWqCB8pF1MZmNRN7bqvdtXK2n/fb3rizR2ByTzvC/YGrmMDJHMXrl0fSXW/ILmCc2hsLBRyXHRUoevw1hSOsy3Ra2lYeQHXOt+iFwBa1k3zUHUXTPt7Qgo/itsQ72F1ecTnQepH31WS9SdyMbkAg8W0e+Ag4hNetYFVZ7CU0lZoqMMDgB8Ya4ZSx6fLNbg==
X-YMail-OSG: HIc.fSkVM1k66w0Jv5kJJgbNBlZA48teX84CM_p9L_c3PGS6DkD.hQflVZ2kUWg
 7kjNRT.fE_xmBAj5iRHJ.omX0_UCLX_ZnxSHGNWpnrZ4OHZriy9g_BlzQcCqZtjJHlfBrvsN8x2F
 eJOb3FZxqAji7FS4Q1a89kAkPpR16zNHiKugdnezMzOcKGotZdeyh_vocRM8CTTyFMWH6HPKHkav
 eN3_izwKAU3ZHS.kEv6nDdl57QNDaUsUSHtOjR8HS3zcvq3tENDBSszS_Fd66r6WDn9OrIK7Z4Em
 PZfSRXxNNgV7Bx27J62SVg7CUvJCPcV0XvgtIAMbbZpUf1DaDwwz.iQMKoQ6ou4Rusq9Pq_lhIlA
 hhgglocvH9jG2ZV_bVaeS39CdHOwOIrdAW.Pf37X.tlxcEJH1Vu4vgKPpaTQp78ksiID8d54sCCg
 I6V2Qb28qmQ5q5cict5mvGv5Cq0AjiTs8Si.Us6ry5UrPsr3tVVupLdtPuUtrnOTQh1QbevQ8Rj_
 piHCzZqibT8klGBLRxFSd3xbkRzHpZEF1BNgnG08xRZuQ6Mwc67LmHqxNOQZ3wqaSKHFF9ZseSyc
 QBu9DmKEKsgAGDmxWfk0dOeVITJVfRmcu_n168UB5EC3.lrPj_H9aD16RjIpJhd6nf4afF8X5zl4
 8hd__CnAdOe2vfkMPflGFTyOfSUtg9g.DINohiLOQeywBgIdlyiQi_hYqE5NdFFQLgOaqSE3Wkjl
 TovBDrHR.kCJ99sAEcp.zeKKbUlB0GzmZTMwBHwmPGBln0cHhzT328zLV017yy7a8v2U86Omha2T
 SCpQRoEI0kqDHJIS0J2B1CQgx_nLgF4sXTzB9t2LSTcLWq4NZIcprtmEMtHQlgjB4kRIhSXtI1Yv
 Jp09bl.V7Y.u8R_ZxOuXrFU1OfFC8iXJeYcGwKeDksAgniM0O__U.SH8rTVVCVCHxhuD.YbPglMC
 qF.8fZcZrSPrPirGqeakp4WNeCfM8Bod1.vDGmFoD161rk4yldp78_xuzrCxtBHOCQTtNdxyDvFt
 BX8bmT87wiILbjhYf4OE9mhzC66MTgHnSbTIaGMO_WngnSW_V_gn0flR2PAlWOkY4_vSD.EJTGo4
 JCeOuq_LzV6n51R1qTOodvwEYnOnSg3mlQxZuJ5rXdv36syo3UzxAkCbDSpGFcjpzM1_pClLyqhI
 kZ4YWx6xQR66jmIIzOUrUOCVdeY9kk9KabPuxvfyAzqqFcN0AIAPoQEt5mgPqeI_1lg9_aUypNM5
 BFhTve6RBIAYb.odWj7xbKfcLvMikvGS57VeD1mE5GEEqIO8fQKLI3cpeHJTX2zdpXhCq3kTNvVD
 HgBZHKCsn1V2aqTkUzI3CWAIDE506uYfyXPVBPZDQ74q5yWbthC232eJLeDVJfMgU1wm_36_z.HO
 oiYjlKeGpgDcXli5Se6r4H3CcttSvze9sBZFU4Isu7.8hKg.lQsYzPLX4k0wFM2eMT_XuEjDI8_Z
 hGtOPQ9sHwLhEzrZsBT1Ij5_.FBWU1SxxeQV4CFNbJKc5wx369BvIeQhVRt1w4I3ZRgJ8dk9odge
 jBziedl3y5KRmOhF1FII7sF6mxUgdV5_1SyybzE59cCxNVRKM1rPdo3qu0Py35lDbe.0pjSPkuqP
 InklYXd93XTgtbPeESK08hGk9HJ1jSCp8O3fz467mCyEphPRkNfzw09B58lS8OQ6OksPQsoTggE9
 Qe0LsbXfr.fjBlZITf_51LmT3obUXHels.jp9ygWU9_BrTRrkyq0Ujp4oEtvrQQIIweJQCoJxNHc
 .RX8bwiF.vuv7o99btnxIbpIE3sL3BAy8O1OE6fcKPMuZurkKMBTSvWawl3IGdieTawf6Jf.iHBD
 dAwhb81e8sKjXSVGHODpca.uocTgwi3L_stOtZ5xXctdBCACRNh28jt4yRwQ5LqweSy4IeY1eZwu
 rphXJm3itU9BZIUkvPH1Ryk4WvDbR9QQfAks.8FNcVWSGfKRr9mhJJ26NZTMBf9F6GX5LClCc9Wg
 Qrf6F_gzUXpBg4LFusT189jR23rMh4DptWnB.CzyTyvjEEgJttvz4YlmhNbLTdbmt.C.KSFg8.6k
 bzdirp1oHo.3DZtygoH8Fh5qc1wuqzF2iSZoDprqKkJ4.c_ZOTjkhepvLpybSDerV4adTCXFRZP4
 MZi.893ef6N8FhiQ5_s8HSW2I5FOaxzZzokNe9G4wgBeboOBk4ETnAiH.WdIS5XUU11OqS9P_gYS
 OtkKC7sczAL8VitAIVRcJCSvYpVePXUbE_Rgb5M9tvP1TsYM.zILyCKbR6untwY5JxhSWAHsqNBc
 sN.cWSYo_3vaV1Dihzi51Wu9V
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 397e9ee9-8051-4bd7-a384-f966a5b3db07
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ne1.yahoo.com with HTTP; Fri, 10 Oct 2025 15:15:42 +0000
Received: by hermes--production-gq1-66b66ffd5-4kj8j (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5a3bbbe036446cce417e04accb83fa7c; 
 Fri, 10 Oct 2025 15:15:39 +0000 (UTC)
Message-ID: <dcde4774-3852-455a-87be-6c9c0b7198e2@schaufler-ca.com>
Date: Fri, 10 Oct 2025 08:15:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
References: <20251010132610.12001-1-maxime.belair@canonical.com>
 <20251010132610.12001-6-maxime.belair@canonical.com>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20251010132610.12001-6-maxime.belair@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.24562
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Received-SPF: none client-ip=66.163.186.211;
 envelope-from=casey@schaufler-ca.com;
 helo=sonic310-30.consmr.mail.ne1.yahoo.com
Subject: Re: [apparmor] [PATCH v6 5/5] Smack: add support for
 lsm_config_self_policy and lsm_config_system_policy
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
Cc: paul@paul-moore.com, song@kernel.org, kees@kernel.org,
 linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 rdunlap@infradead.org, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, penguin-kernel@I-love.SAKURA.ne.jp,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 10/10/2025 6:25 AM, Maxime Bélair wrote:
> Enable users to manage Smack policies through the new hooks
> lsm_config_self_policy and lsm_config_system_policy.
>
> lsm_config_self_policy allows adding Smack policies for the current cred.
> For now it remains restricted to CAP_MAC_ADMIN.
>
> lsm_config_system_policy allows adding globabl Smack policies. This is
> restricted to CAP_MAC_ADMIN.
>
> Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>

I will be reviewing these patches, but will not be able to do so
until early November. I know how frustrating review delays can be,
but it really can't be helped this time around. Thank you for your
patience.

> ---
>  security/smack/smack.h     |  8 +++++
>  security/smack/smack_lsm.c | 73 ++++++++++++++++++++++++++++++++++++++
>  security/smack/smackfs.c   |  2 +-
>  3 files changed, 82 insertions(+), 1 deletion(-)
>
> diff --git a/security/smack/smack.h b/security/smack/smack.h
> index bf6a6ed3946c..3e3d30dfdcf7 100644
> --- a/security/smack/smack.h
> +++ b/security/smack/smack.h
> @@ -275,6 +275,14 @@ struct smk_audit_info {
>  #endif
>  };
>  
> +/*
> + * This function is in smackfs.c
> + */
> +ssize_t smk_write_rules_list(struct file *file, const char __user *buf,
> +			     size_t count, loff_t *ppos,
> +			     struct list_head *rule_list,
> +			     struct mutex *rule_lock, int format);
> +
>  /*
>   * These functions are in smack_access.c
>   */
> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 99833168604e..bf4bb2242768 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -5027,6 +5027,76 @@ static int smack_uring_cmd(struct io_uring_cmd *ioucmd)
>  
>  #endif /* CONFIG_IO_URING */
>  
> +/**
> + * smack_lsm_config_system_policy - Configure a system smack policy
> + * @op: operation to perform. Currently, only LSM_POLICY_LOAD is supported
> + * @buf: User-supplied buffer in the form "<fmt><policy>"
> + *        <fmt> is the 1-byte format of <policy>
> + *        <policy> is the policy to load
> + * @size: size of @buf
> + * @flags: reserved for future use; must be zero
> + *
> + * Returns: number of written rules on success, negative value on error
> + */
> +static int smack_lsm_config_system_policy(u32 op, void __user *buf, size_t size,
> +					  u32 flags)
> +{
> +	loff_t pos = 0;
> +	u8 fmt;
> +
> +	if (op != LSM_POLICY_LOAD || flags)
> +		return -EOPNOTSUPP;
> +
> +	if (size < 2)
> +		return -EINVAL;
> +
> +	if (get_user(fmt, (uint8_t *)buf))
> +		return -EFAULT;
> +
> +	return smk_write_rules_list(NULL, buf + 1, size - 1, &pos, NULL, NULL, fmt);
> +}
> +
> +/**
> + * smack_lsm_config_self_policy - Configure a smack policy for the current cred
> + * @op: operation to perform. Currently, only LSM_POLICY_LOAD is supported
> + * @buf: User-supplied buffer in the form "<fmt><policy>"
> + *        <fmt> is the 1-byte format of <policy>
> + *        <policy> is the policy to load
> + * @size: size of @buf
> + * @flags: reserved for future use; must be zero
> + *
> + * Returns: number of written rules on success, negative value on error
> + */
> +static int smack_lsm_config_self_policy(u32 op, void __user *buf, size_t size,
> +					u32 flags)
> +{
> +	loff_t pos = 0;
> +	u8 fmt;
> +	struct task_smack *tsp;
> +
> +	if (op != LSM_POLICY_LOAD || flags)
> +		return -EOPNOTSUPP;
> +
> +	if (size < 2)
> +		return -EINVAL;
> +
> +	if (get_user(fmt, (uint8_t *)buf))
> +		return -EFAULT;
> +	/**
> +	 * smk_write_rules_list could be used to gain privileges.
> +	 * This function is thus restricted to CAP_MAC_ADMIN.
> +	 * TODO: Ensure that the new rule does not give extra privileges
> +	 * before dropping this CAP_MAC_ADMIN check.
> +	 */
> +	if (!capable(CAP_MAC_ADMIN))
> +		return -EPERM;
> +
> +
> +	tsp = smack_cred(current_cred());
> +	return smk_write_rules_list(NULL, buf + 1, size - 1, &pos, &tsp->smk_rules,
> +				    &tsp->smk_rules_lock, fmt);
> +}
> +
>  struct lsm_blob_sizes smack_blob_sizes __ro_after_init = {
>  	.lbs_cred = sizeof(struct task_smack),
>  	.lbs_file = sizeof(struct smack_known *),
> @@ -5203,6 +5273,9 @@ static struct security_hook_list smack_hooks[] __ro_after_init = {
>  	LSM_HOOK_INIT(uring_sqpoll, smack_uring_sqpoll),
>  	LSM_HOOK_INIT(uring_cmd, smack_uring_cmd),
>  #endif
> +	LSM_HOOK_INIT(lsm_config_self_policy, smack_lsm_config_self_policy),
> +	LSM_HOOK_INIT(lsm_config_system_policy, smack_lsm_config_system_policy),
> +
>  };
>  
>  
> diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
> index 90a67e410808..ed1814588d56 100644
> --- a/security/smack/smackfs.c
> +++ b/security/smack/smackfs.c
> @@ -441,7 +441,7 @@ static ssize_t smk_parse_long_rule(char *data, struct smack_parsed_rule *rule,
>   *	"subject<whitespace>object<whitespace>
>   *	 acc_enable<whitespace>acc_disable[<whitespace>...]"
>   */
> -static ssize_t smk_write_rules_list(struct file *file, const char __user *buf,
> +ssize_t smk_write_rules_list(struct file *file, const char __user *buf,
>  					size_t count, loff_t *ppos,
>  					struct list_head *rule_list,
>  					struct mutex *rule_lock, int format)

