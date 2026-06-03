Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4VLPAS3SH2qtqQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 03 Jun 2026 09:05:17 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 73832634F95
	for <lists+apparmor@lfdr.de>; Wed, 03 Jun 2026 09:05:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=suse.de header.s=susede2_rsa header.b=AyTKD3wA;
	dkim=fail ("headers eddsa verify failed") header.d=suse.de header.s=susede2_ed25519 header.b=zmYylHtG;
	dkim=fail ("headers rsa verify failed") header.d=suse.de header.s=susede2_rsa header.b=wBZWRfs0;
	dkim=fail ("headers eddsa verify failed") header.d=suse.de header.s=susede2_ed25519 header.b=JTqCn7pi;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=suse.de (policy=none)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wUfep-0003yv-0L; Wed, 03 Jun 2026 07:04:55 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ddiss@suse.de>) id 1wUfem-0003yf-TA
 for apparmor@lists.ubuntu.com; Wed, 03 Jun 2026 07:04:53 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D73FF6A8B2;
 Wed,  3 Jun 2026 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1780470292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWV/FEUH5MzVbwQ2bHhE4FOeDVhI5rPmxLqybfhW9qc=;
 b=AyTKD3wAAGurgZhqrgfhQqzE/GMX26YplCFNe4M+F9Pi1vE/WpHLIhLoa3SEWBPg0MRaiY
 KfYGHpQnKjCbkluFECtE8LOt2+u+Z6csMS4uFDoE14waY+qxuzWhodxv/fZairybkiMn2A
 BhaTMrZYv0oAa9zfyknLtnrY/z1+N7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1780470292;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWV/FEUH5MzVbwQ2bHhE4FOeDVhI5rPmxLqybfhW9qc=;
 b=zmYylHtGmV72l1H+jslrL+AmrC9Iu3HONaoF0ko1OW3QcQ3dj+ataDxN5lFtWhV8bWzLii
 Q7nP+bXgNSPiP+CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1780470290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWV/FEUH5MzVbwQ2bHhE4FOeDVhI5rPmxLqybfhW9qc=;
 b=wBZWRfs09GT1eNXkhPKvCZ7+ecanEBLWxETR1RWJV2Dcr0bW7ov0ctmV+GuUc8mFl5eehJ
 PI8PfGndZGT8svssDzA7+k4cA6tHvDxqtqDUuC3iUGYLCVwxrSMfUsjuc7voMUJ6IW4Pz+
 ie2XuQvVvvkJSD8grp3/WYaL7SfLJyM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1780470290;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWV/FEUH5MzVbwQ2bHhE4FOeDVhI5rPmxLqybfhW9qc=;
 b=JTqCn7piYVSuuQPjlHBVP2Cb3zPQkOi0RtRA1f3tmJsDfg+TYLo0XTH/vC2CTD0mkCxdKy
 iheT+ukXSYBTUrAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 732D8779A7;
 Wed,  3 Jun 2026 07:04:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QlaICxHSH2ooPQAAD6G6ig
 (envelope-from <ddiss@suse.de>); Wed, 03 Jun 2026 07:04:49 +0000
Date: Wed, 3 Jun 2026 17:04:38 +1000
From: David Disseldorp <ddiss@suse.de>
To: Georgia Garcia <georgia.garcia@canonical.com>
Message-ID: <20260603170438.448fcf99.ddiss@suse.de>
In-Reply-To: <20260528190412.680277-1-georgia.garcia@canonical.com>
References: <20260528190412.680277-1-georgia.garcia@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.51
Received-SPF: pass client-ip=195.135.223.130; envelope-from=ddiss@suse.de;
 helo=smtp-out1.suse.de
Subject: Re: [apparmor] [PATCH] apparmor: don't audit files pointing to
 aa_null.dentry
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.99 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:georgia.garcia@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[ddiss@suse.de,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ddiss@suse.de,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[suse.de:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,suse.de:mid,suse.de:from_mime,suse.de:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73832634F95

On Thu, 28 May 2026 16:04:12 -0300, Georgia Garcia wrote:

> In 4a134723f9f1 there was a change to not audit files pointing to
> aa_null.dentry because they provide no value, but setting the error
> variable instead of returning -EACCES was still causing them to be
> audited.

It might be worth mentioning that some callers don't explicitly
initialize @name, which may be dereferenced in the subsequent
aa_audit_file() path.

> Fixes: 4a134723f9f1 ("apparmor: move check for aa_null file to cover all cases")
> Signed-off-by: Georgia Garcia <georgia.garcia@canonical.com>

Acked-by: David Disseldorp <ddiss@suse.de>

> ---
>  security/apparmor/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/file.c b/security/apparmor/file.c
> index 694e157149e8..fc5abd5473c8 100644
> --- a/security/apparmor/file.c
> +++ b/security/apparmor/file.c
> @@ -157,7 +157,7 @@ static int path_name(const char *op, const struct cred *subj_cred,
>  
>  	/* don't reaudit files closed during inheritance */
>  	if (unlikely(path->dentry == aa_null.dentry))
> -		error = -EACCES;
> +		return -EACCES;
>  	else
>  		error = aa_path_name(path, flags, buffer, name, &info,
>  				     labels_profile(label)->disconnected);


