Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RyrIAf+gS2pHXQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 06 Jul 2026 14:35:11 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A431F710965
	for <lists+apparmor@lfdr.de>; Mon, 06 Jul 2026 14:35:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wgiXJ-0005sE-0M; Mon, 06 Jul 2026 12:34:57 +0000
Received: from confino.investici.org ([93.190.126.19])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <include@grrlz.net>) id 1wgR9T-0005kL-UD
 for apparmor@lists.ubuntu.com; Sun, 05 Jul 2026 18:01:12 +0000
Received: from mx1.investici.org (unknown [127.0.0.1])
 by confino.investici.org (Postfix) with ESMTP id 4gtZq03zksz111n;
 Sun, 05 Jul 2026 17:53:32 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4gtZq00J6Gz111k;
 Sun, 05 Jul 2026 17:53:32 +0000 (UTC)
Date: Sun, 05 Jul 2026 18:53:31 +0100
To: oleg@redhat.com
In-Reply-To: <akqL3YWi28ZUzca3@redhat.com>
Message-ID: <65E9B858-C580-41A3-9B39-B383ED5F0ACF@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=93.190.126.19; envelope-from=include@grrlz.net;
 helo=confino.investici.org
X-Mailman-Approved-At: Mon, 06 Jul 2026 12:34:55 +0000
Subject: Re: [apparmor] [PATCH] apparmor: use SEND_SIG_NOINFO instead of
 NULL in aa_audit()
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
From: Bradley Morgan via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Bradley Morgan <include@grrlz.net>
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.41 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:oleg@redhat.com,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:serge@hallyn.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[include@grrlz.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[grrlz.net:replyto,grrlz.net:mid,grrlz.net:email,lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A431F710965

> SEND_SIG_NOINFO is defined as ((struct kernel_siginfo *) 0), so passing
> NULL works, but:
>
> - this works "by accident" and looks as if the caller doesn't understand
>   the signal sending API.
>
> - more importantly, this hides the usage of SEND_SIG_NOINFO from grep,
>   and this is really bad.
- also drop the now redundant (void)
>
Reviewed-by: Bradley Morgan <include@grrlz.net>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  security/apparmor/audit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/apparmor/audit.c b/security/apparmor/audit.c
> index 4a60b6fda75f..15e42e96b163 100644
> --- a/security/apparmor/audit.c
> +++ b/security/apparmor/audit.c
> @@ -192,7 +192,7 @@ int aa_audit(int type, struct aa_profile *profile,
>  	aa_audit_msg(type, ad, cb);
>  
>  	if (ad->type == AUDIT_APPARMOR_KILL)
> -		(void)send_sig_info(profile->signal, NULL,
> +		send_sig_info(profile->signal, SEND_SIG_NOINFO,
>  			ad->common.type == LSM_AUDIT_DATA_TASK &&
>  			ad->common.u.tsk ? ad->common.u.tsk : current);
>  
> -- 
> 2.52.0


Also, feel free to CC me in signal patches, so I can review, from you
or from others.
Thanks!

