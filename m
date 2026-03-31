Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBELNhEXy2lrDwYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 31 Mar 2026 02:36:33 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFC6362B25
	for <lists+apparmor@lfdr.de>; Tue, 31 Mar 2026 02:36:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w7N5k-0008FD-Nk; Tue, 31 Mar 2026 00:36:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <kuba@kernel.org>) id 1w7N5j-0008Ez-Bb
 for apparmor@lists.ubuntu.com; Tue, 31 Mar 2026 00:36:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EBF5960133;
 Tue, 31 Mar 2026 00:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B763CC4CEF7;
 Tue, 31 Mar 2026 00:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774915936;
 bh=jp4GPIkcXzyuueYJbiqqPav/rW1ddSu+I1Gm/Qd/ReQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GaY/3ZjKypngfcURKwc7rTnaQcQZFk1Mt5fd6C6YnJkY0eOWeyX4tBuQy/qhdg5t9
 /+b5kIsE5fA/Fq29XjrygD/HaOHuD9EfazDtMMIRmSmM0xwcCuB5dIVNTQ/mAIsNVs
 rfteN9dcBhDDDRMGldyQ0K9DSCGVv1422zZQbfuoIi8tDWXLibCuBn245P7JHPOI1o
 6ubW53uJL80sQfzKzzZ6mX9PwEQHiROcjLThEr29trrC7VC8r5JKpFLVslBDOUg9Op
 dafo/+7keVpjO7DqF578ErUcJJHkIgdgMFoc+bqEsqC9LF4YefuFCNjxpb/76t+j4+
 j7XYDRs2zUSAg==
Date: Mon, 30 Mar 2026 17:12:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, David Howells
 <dhowells@redhat.com>
Message-ID: <20260330171214.4d95a6c3@kernel.org>
In-Reply-To: <CAHk-=wjDKfhS5TvEfrsOgBgAvFMPfAd3wT=Um2AQb4txHq5sAQ@mail.gmail.com>
References: <20260326131838.634095-1-dhowells@redhat.com>
 <20260326131838.634095-5-dhowells@redhat.com>
 <20260329121208.6092419d@kernel.org>
 <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
 <1179840.1774867765@warthog.procyon.org.uk>
 <CAHk-=wjDKfhS5TvEfrsOgBgAvFMPfAd3wT=Um2AQb4txHq5sAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=kuba@kernel.org;
 helo=tor.source.kernel.org
Subject: Re: [apparmor] [PATCH net v3 04/11] list: Move on_list_rcu() to
 list.h and add on_list() also
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
Cc: stable@kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, Minas Harutyunyan <hminas@synopsys.com>,
 Eric Dumazet <edumazet@google.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Simon Horman <horms@kernel.org>, Marc Dionne <marc.dionne@auristor.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kuba@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:dhowells@redhat.com,m:stable@kernel.org,m:netdev@vger.kernel.org,m:linux-usb@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-afs@lists.infradead.org,m:hminas@synopsys.com,m:edumazet@google.com,m:mathieu.desnoyers@efficios.com,m:horms@kernel.org,m:marc.dionne@auristor.com,m:pabeni@redhat.com,m:davem@davemloft.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 9CFC6362B25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 15:14:07 -0700 Linus Torvalds wrote:
> On Mon, 30 Mar 2026 at 03:49, David Howells <dhowells@redhat.com> wrote:
> >
> > Anyway, I'll find a different way to do this, not involving checking the prev
> > pointer.  What I don't want to do is hard code "prev == LIST_POISON2" into my
> > stuff.  Anything like that really needs to be in list.h.  
> 
> So i think the proper model is:
> 
> (a) normal and good list users should never *use* this kind of "is
> this entry on a list or not".
> 
> Dammit, you should *KNOW* that already from core logic. Not with a
> flag, not with a function to ask, but from how things work. The whole
> "am I on a list or not" should not be a list issue, it should be
> obvious.

+1 FWIW, the use of the on_list_rcu() in patch 5 looks kinda shady:

@@ -654,9 +654,9 @@ void rxrpc_put_call(struct rxrpc_call *call, enum rxrpc_call_trace why)
 	if (dead) {
 		ASSERTCMP(__rxrpc_call_state(call), ==, RXRPC_CALL_COMPLETE);
 
-		if (!list_empty(&call->link)) {
+		if (on_list_rcu(&call->link)) {
 			spin_lock(&rxnet->call_lock);
-			list_del_init(&call->link);
+			list_del_rcu(&call->link);
 			spin_unlock(&rxnet->call_lock);
 		}

I haven't dug around to see if there's some higher level lock
protecting the whole op, so I didn't mention it. But I was worried
that on_list() would lead to questionable code, and the first use
didn't deliver the reassurance I was hoping for.

> (b) if the code in question really doesn't know what the ^%&%^ it did,
> and has lost sight of what it has done to a list entry, and really
> wants some kind of "did I remove this entry already" logic, I would
> encourage such uses to either re-consider, or just use the
> "__list_del_clearprev()" function when removing entries.
> 
> Because I really don't want the core list handling to cater to code
> that doesn't know what the hell it has done.


