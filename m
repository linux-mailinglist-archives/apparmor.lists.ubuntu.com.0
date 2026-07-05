Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8G9tFwChS2pIXQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 06 Jul 2026 14:35:12 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A161710976
	for <lists+apparmor@lfdr.de>; Mon, 06 Jul 2026 14:35:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wgiXJ-0005sW-A1; Mon, 06 Jul 2026 12:34:57 +0000
Received: from latitanza.investici.org ([185.218.207.228])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <include@grrlz.net>) id 1wgS3H-0002jL-GQ
 for apparmor@lists.ubuntu.com; Sun, 05 Jul 2026 18:58:51 +0000
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 4gtc6Y3ryBzGpHX;
 Sun, 05 Jul 2026 18:52:05 +0000 (UTC)
Received: by mx3.investici.org (Postfix) id 4gtc6Y0XLDzGpHR;
 Sun, 05 Jul 2026 18:52:05 +0000 (UTC)
Date: Sun, 05 Jul 2026 19:52:04 +0100
To: Oleg Nesterov <oleg@redhat.com>
In-Reply-To: <akqm5EMVZpqM6gnQ@redhat.com>
References: <akqL3YWi28ZUzca3@redhat.com>
 <65E9B858-C580-41A3-9B39-B383ED5F0ACF@grrlz.net>
 <akqm5EMVZpqM6gnQ@redhat.com>
Message-ID: <F171E6D6-6356-4519-A448-C654138A62EB@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.218.207.228; envelope-from=include@grrlz.net;
 helo=latitanza.investici.org
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:oleg@redhat.com,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:serge@hallyn.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[grrlz.net:replyto,grrlz.net:mid,grrlz.net:email,lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[include@grrlz.net]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A161710976

On July 5, 2026 7:48:04 PM GMT+01:00, Oleg Nesterov <oleg@redhat.com>
wrote:
>On 07/05, Bradley Morgan wrote:
>>
>> > SEND_SIG_NOINFO is defined as ((struct kernel_siginfo *) 0), so
>passing
>> > NULL works, but:
>> >
>> > - this works "by accident" and looks as if the caller doesn't
>understand
>> >   the signal sending API.
>> >
>> > - more importantly, this hides the usage of SEND_SIG_NOINFO from grep,
>> >   and this is really bad.
>> - also drop the now redundant (void)
>
>Yes, but the "void" cast was never necessary, I guess.
>
>and just in case... To me the usage of SEND_SIG_NOINFO here doesn't look
>right with
>or without this change. Perhaps I am wrong, but please lets not discuss
>this right
>now, this connects to other cleanups I have in mind.
>
>The purpose of this change is to make aa_audit() grep-friendly wrt
>SEND_SIG_NOINFO.
>And because send_sig_info(NULL) looks "just wrong" to me, no matter what.

No need, just a teeny tiny description nit.

>> Reviewed-by: Bradley Morgan <include@grrlz.net>
>
>Thanks,
>
>> Also, feel free to CC me in signal patches, so I can review, from you
>> or from others.
>
>OK, will do.
>
>Oleg.
>
>

Thanks!

