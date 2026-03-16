Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB6vJ1khuGmdZQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 16 Mar 2026 16:27:21 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F8A29C501
	for <lists+apparmor@lfdr.de>; Mon, 16 Mar 2026 16:27:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w29qZ-0000o9-EQ; Mon, 16 Mar 2026 15:27:11 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <serge@mail.hallyn.com>)
 id 1w29qY-0000nk-A8
 for apparmor@lists.ubuntu.com; Mon, 16 Mar 2026 15:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hallyn.com; s=mail;
 t=1773674829; bh=E5y5oJyTASlanfUCdlYVfycltKAYvehU/T8znkBuxPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B7ZtIzgSoK3VkQ3BbTUOFahZYAOQQVmuVEEjL1zGmlL3aIYBDczBrbbwaAe9L22uZ
 rdwLaL+ZjoDv/CCMs/OX3fchR052GcBwbXqeBQS3tEGl924aeutrPFNR93CI/C5XYm
 Ck2I7yGAAYF8QVJf45zPLe933SfdlvSQUyahDoTUvSP1hw75/qOz85pcj3sJQe29WS
 4H2ZWTgafGAYEmwH999GFxORnZ6sbaoRjDyjmGZI1h1a+8gbRJXl/uSo6lj508Y0qh
 nB19jG7YBpROeNgv085JXfIgbNZSLTuncLwYbjjYrM17jq/D4NUKWFFUv0nhU7s3FR
 aQmadGyiVuGkQ==
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id 4B73EEBD; Mon, 16 Mar 2026 10:27:09 -0500 (CDT)
Date: Mon, 16 Mar 2026 10:27:09 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <abghTTr2xuOMMxzL@mail.hallyn.com>
References: <20260316135935.3321551-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316135935.3321551-1-arnd@kernel.org>
Received-SPF: pass client-ip=178.63.66.53; envelope-from=serge@mail.hallyn.com;
 helo=mail.hallyn.com
Subject: Re: [apparmor] [PATCH] apparmor: hide unused
	get_loaddata_common_ref() function
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
 Arnd Bergmann <arnd@arndb.de>, apparmor@lists.ubuntu.com,
 Jeff Layton <jlayton@kernel.org>, James Morris <jmorris@namei.org>,
 linux-security-module@vger.kernel.org, NeilBrown <neil@brown.name>,
 linux-kernel@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[hallyn.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[hallyn.com:s=mail];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:brauner@kernel.org,m:paul@paul-moore.com,m:arnd@arndb.de,m:apparmor@lists.ubuntu.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-security-module@vger.kernel.org,m:neil@brown.name,m:linux-kernel@vger.kernel.org,m:serge@hallyn.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[serge@hallyn.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[hallyn.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.916];
	FROM_NEQ_ENVFROM(0.00)[serge@hallyn.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,mail.hallyn.com:mid]
X-Rspamd-Queue-Id: 67F8A29C501
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 02:59:31PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly introduced function is only used in an #ifdef block,
> which causes a harmless warning:
> 
> security/apparmor/apparmorfs.c:177:28: error: 'get_loaddata_common_ref' defined but not used [-Werror=unused-function]
>   177 | static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
> 
> Move the definition next to the user to avoid the warning.
> 
> Fixes: 8e135b8aee5a ("apparmor: fix race between freeing data and fs accessing it")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Serge Hallyn <serge@hallyn.com>

> ---
> Alternatively, the #ifdef checks could be replaced with an
> 'if(IS_ENABLED(CONFIG_SECURITY_APPARMOR_EXPORT_BINARY) return;'
> check in __aa_fs_create_rawdata(), relying on the compiler's
> dead code elimination.
> ---
>  security/apparmor/apparmorfs.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index ededaf46f3ca..f762b101d682 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -174,14 +174,6 @@ static struct aa_proxy *get_proxy_common_ref(struct aa_common_ref *ref)
>  	return NULL;
>  }
>  
> -static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
> -{
> -	if (ref)
> -		return aa_get_i_loaddata(container_of(ref, struct aa_loaddata,
> -						      count));
> -	return NULL;
> -}
> -
>  static void aa_put_common_ref(struct aa_common_ref *ref)
>  {
>  	if (!ref)
> @@ -1318,6 +1310,14 @@ static const struct file_operations seq_rawdata_ ##NAME ##_fops = {	      \
>  	.release	= seq_rawdata_release,				      \
>  }									      \
>  
> +static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
> +{
> +	if (ref)
> +		return aa_get_i_loaddata(container_of(ref, struct aa_loaddata,
> +						      count));
> +	return NULL;
> +}
> +
>  static int seq_rawdata_open(struct inode *inode, struct file *file,
>  			    int (*show)(struct seq_file *, void *))
>  {
> -- 
> 2.39.5

