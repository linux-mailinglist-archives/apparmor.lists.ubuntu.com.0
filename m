Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMqZDsZsm2kEzgMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 22 Feb 2026 21:53:26 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD31705E2
	for <lists+apparmor@lfdr.de>; Sun, 22 Feb 2026 21:53:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuGRy-0004Jx-1h; Sun, 22 Feb 2026 20:53:10 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <serge@mail.hallyn.com>)
 id 1vuGRw-0004Jp-Pl
 for apparmor@lists.ubuntu.com; Sun, 22 Feb 2026 20:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hallyn.com; s=mail;
 t=1771793587; bh=rBR6mKA2YTWqFBrvr1bBxZQaQCdGcFHlkMKutJewIj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wEn05ERFEe2N1GPBVte78a078GlaXXGHzLndIa1hlcGD61ukrW4MzYXlByXtFdtaa
 H9H2WOs3Nw/pH22lzVOy1nqJVOq+reqUwwT/JQwZsb0XuVkOY8SKl5DgOZv1mge8zI
 BdAvwLVNjB286Mn0LG1+/t+EIptaDblmfjgVllf8GBMxD1/ELm68/xGpvv7weA3H/J
 4eU+ovqVBZoPVDXvEXT4n+5p064JtW+i8PLsDj6r1tTnQAvrrG1PRqc4pcTgwvykKN
 vZTiteOJc1p8bazaONCrFXbwMTZLa23XFiXIGtiVm0fV3THD87oXAcKC76LDj7BXFR
 k6wTckYGi6bYA==
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id B78FB5A4; Sun, 22 Feb 2026 14:53:07 -0600 (CST)
Date: Sun, 22 Feb 2026 14:53:07 -0600
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Message-ID: <aZtss2/FsdJSrk0y@mail.hallyn.com>
References: <20260222204645.285727-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222204645.285727-1-thorsten.blum@linux.dev>
Received-SPF: pass client-ip=178.63.66.53; envelope-from=serge@mail.hallyn.com;
 helo=mail.hallyn.com
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Replace memcpy + NUL
 termination with kmemdup_nul in do_setattr
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
Cc: Paul Moore <paul@paul-moore.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:serge@hallyn.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[serge@hallyn.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[hallyn.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[serge@hallyn.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,hallyn.com:email]
X-Rspamd-Queue-Id: 65DD31705E2
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 09:46:44PM +0100, Thorsten Blum wrote:
> Use kmemdup_nul() to copy 'value' instead of using memcpy() followed by
> a manual NUL termination.  No functional changes.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Looks correct, thanks.

Reviewed-by: Serge Hallyn <serge@hallyn.com>

> ---
>  security/apparmor/lsm.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..49aa6ad68838 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -858,12 +858,9 @@ static int do_setattr(u64 attr, void *value, size_t size)
>  
>  	/* AppArmor requires that the buffer must be null terminated atm */
>  	if (args[size - 1] != '\0') {
> -		/* null terminate */
> -		largs = args = kmalloc(size + 1, GFP_KERNEL);
> +		largs = args = kmemdup_nul(value, size, GFP_KERNEL);
>  		if (!args)
>  			return -ENOMEM;
> -		memcpy(args, value, size);
> -		args[size] = '\0';
>  	}
>  
>  	error = -EINVAL;
> -- 
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

