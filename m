Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CIsTCAKhS2pMXQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 06 Jul 2026 14:35:14 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B87C710980
	for <lists+apparmor@lfdr.de>; Mon, 06 Jul 2026 14:35:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wgiXJ-0005sM-6w; Mon, 06 Jul 2026 12:34:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <oleg@redhat.com>) id 1wgRt3-0001bX-Ej
 for apparmor@lists.ubuntu.com; Sun, 05 Jul 2026 18:48:17 +0000
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-676-3UqcXPImOcyk_WgjeI8yOg-1; Sun,
 05 Jul 2026 14:48:11 -0400
X-MC-Unique: 3UqcXPImOcyk_WgjeI8yOg-1
X-Mimecast-MFC-AGG-ID: 3UqcXPImOcyk_WgjeI8yOg_1783277290
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 97C4B19560B9; Sun,  5 Jul 2026 18:48:09 +0000 (UTC)
Received: from fedora (unknown [10.44.32.112])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP
 id 08025180058F; Sun,  5 Jul 2026 18:48:05 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Sun,  5 Jul 2026 20:48:09 +0200 (CEST)
Date: Sun, 5 Jul 2026 20:48:04 +0200
To: Bradley Morgan <include@grrlz.net>
Message-ID: <akqm5EMVZpqM6gnQ@redhat.com>
References: <akqL3YWi28ZUzca3@redhat.com>
 <65E9B858-C580-41A3-9B39-B383ED5F0ACF@grrlz.net>
MIME-Version: 1.0
In-Reply-To: <65E9B858-C580-41A3-9B39-B383ED5F0ACF@grrlz.net>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: NjJMs3LKGYsplgo6QxkKqHOUQoKCIR5s5f8P-jO4ZiI_1783277290
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=oleg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
From: Oleg Nesterov via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Oleg Nesterov <oleg@redhat.com>
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.41 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:include@grrlz.net,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:serge@hallyn.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[grrlz.net:email,lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	HAS_REPLYTO(0.00)[oleg@redhat.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B87C710980

On 07/05, Bradley Morgan wrote:
>
> > SEND_SIG_NOINFO is defined as ((struct kernel_siginfo *) 0), so passing
> > NULL works, but:
> >
> > - this works "by accident" and looks as if the caller doesn't understand
> >   the signal sending API.
> >
> > - more importantly, this hides the usage of SEND_SIG_NOINFO from grep,
> >   and this is really bad.
> - also drop the now redundant (void)

Yes, but the "void" cast was never necessary, I guess.

and just in case... To me the usage of SEND_SIG_NOINFO here doesn't look right with
or without this change. Perhaps I am wrong, but please lets not discuss this right
now, this connects to other cleanups I have in mind.

The purpose of this change is to make aa_audit() grep-friendly wrt SEND_SIG_NOINFO.
And because send_sig_info(NULL) looks "just wrong" to me, no matter what.

> Reviewed-by: Bradley Morgan <include@grrlz.net>

Thanks,

> Also, feel free to CC me in signal patches, so I can review, from you
> or from others.

OK, will do.

Oleg.


