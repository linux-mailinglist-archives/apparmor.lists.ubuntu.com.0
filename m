Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 697DN/hnTmpVMAIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 08 Jul 2026 17:08:40 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C327727C3A
	for <lists+apparmor@lfdr.de>; Wed, 08 Jul 2026 17:08:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1whTsv-0001do-1c; Wed, 08 Jul 2026 15:08:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <oleg@redhat.com>) id 1whT2s-0005lw-FM
 for apparmor@lists.ubuntu.com; Wed, 08 Jul 2026 14:14:38 +0000
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-tfAGZ0CINcinUP72MU2GTw-1; Wed,
 08 Jul 2026 10:14:31 -0400
X-MC-Unique: tfAGZ0CINcinUP72MU2GTw-1
X-Mimecast-MFC-AGG-ID: tfAGZ0CINcinUP72MU2GTw_1783520070
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D67731955DBF; Wed,  8 Jul 2026 14:14:28 +0000 (UTC)
Received: from fedora (unknown [10.44.33.83])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP
 id 49C261956086; Wed,  8 Jul 2026 14:14:24 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Wed,  8 Jul 2026 16:14:28 +0200 (CEST)
Date: Wed, 8 Jul 2026 16:14:23 +0200
To: Georgia Garcia <georgia.garcia@canonical.com>
Message-ID: <ak5bP11v3hbWQ9Yw@redhat.com>
References: <akqL3YWi28ZUzca3@redhat.com>
 <65E9B858-C580-41A3-9B39-B383ED5F0ACF@grrlz.net>
 <akqm5EMVZpqM6gnQ@redhat.com>
 <9f37884fc0922254c3d3708794cf1272f4fabdfc.camel@canonical.com>
MIME-Version: 1.0
In-Reply-To: <9f37884fc0922254c3d3708794cf1272f4fabdfc.camel@canonical.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 2J4yYqFjpCsc3QWBikYQk8H6bQLhsmSRl-yeelKIB2M_1783520070
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=oleg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Mailman-Approved-At: Wed, 08 Jul 2026 15:08:22 +0000
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
Cc: paul@paul-moore.com, Bradley Morgan <include@grrlz.net>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, jmorris@namei.org,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.41 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:georgia.garcia@canonical.com,m:paul@paul-moore.com,m:include@grrlz.net,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:jmorris@namei.org,m:serge@hallyn.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[oleg@redhat.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C327727C3A

On 07/08, Georgia Garcia wrote:
>
> On Sun, 2026-07-05 at 20:48 +0200, Oleg Nesterov wrote:
> > On 07/05, Bradley Morgan wrote:
> > >
> > > > SEND_SIG_NOINFO is defined as ((struct kernel_siginfo *) 0), so passing
> > > > NULL works, but:
> > > >
> > > > - this works "by accident" and looks as if the caller doesn't understand
> > > >   the signal sending API.
> > > >
> > > > - more importantly, this hides the usage of SEND_SIG_NOINFO from grep,
> > > >   and this is really bad.
> > > - also drop the now redundant (void)
> >
> > Yes, but the "void" cast was never necessary, I guess.
> >
> > and just in case... To me the usage of SEND_SIG_NOINFO here doesn't look right with
> > or without this change. Perhaps I am wrong, but please lets not discuss this right
> > now, this connects to other cleanups I have in mind.
> >
>
> Yes, I agree. Perhaps SEND_SIG_PRIV would be more appropriate here.

Yes, this is what I meant. And I think the same is true for most of (all?)
users of send_sig(sig, task, priv = 0), at least when task is current.
I'll return to this later.

Thanks for your ACK!

Oleg.


