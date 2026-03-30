Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDPGJFRVymn27gUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 30 Mar 2026 12:49:56 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 390AF359A8C
	for <lists+apparmor@lfdr.de>; Mon, 30 Mar 2026 12:49:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w7ABh-0002wI-Tm; Mon, 30 Mar 2026 10:49:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <dhowells@redhat.com>) id 1w7ABf-0002vf-VX
 for apparmor@lists.ubuntu.com; Mon, 30 Mar 2026 10:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774867778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6CbeBbXEhiNM7kEGDQxi0LjkO7hSdtdP9Ej33IXIkE=;
 b=Oh2PFAPBaI7VgLxhAdSo7LLQmIwaKSCoZeB9vyh9nXfLqQIyQpAET8xXfkdvWXtKrSIbsN
 wGjti8Q51JyMbqEEhlG4H9CHUQch4g4vrZK9VTYgseAytmpBfxqkvxR0Ki+mH+wYPu6Ylw
 Qss5/qNFFnnRx1m8AniyWE3jCh1Eog4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-343-vgCQ4JUgMBOlmC67iSTGSQ-1; Mon,
 30 Mar 2026 06:49:37 -0400
X-MC-Unique: vgCQ4JUgMBOlmC67iSTGSQ-1
X-Mimecast-MFC-AGG-ID: vgCQ4JUgMBOlmC67iSTGSQ_1774867775
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5587C195608E; Mon, 30 Mar 2026 10:49:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.35.245])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4C7AD1955D84; Mon, 30 Mar 2026 10:49:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
References: <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
 <20260326131838.634095-1-dhowells@redhat.com>
 <20260326131838.634095-5-dhowells@redhat.com>
 <20260329121208.6092419d@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
Date: Mon, 30 Mar 2026 11:49:25 +0100
Message-ID: <1179840.1774867765@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: hr55NBSWLOS35L2vCMl60cFrnI3w_fmpuIu-JCVaGOM_1774867775
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <972872.1774858862.1@warthog.procyon.org.uk>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dhowells@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
 linux-afs@lists.infradead.org, dhowells@redhat.com,
 Minas Harutyunyan <hminas@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Simon Horman <horms@kernel.org>, Marc Dionne <marc.dionne@auristor.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:stable@kernel.org,m:netdev@vger.kernel.org,m:linux-usb@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-afs@lists.infradead.org,m:dhowells@redhat.com,m:hminas@synopsys.com,m:edumazet@google.com,m:mathieu.desnoyers@efficios.com,m:horms@kernel.org,m:marc.dionne@auristor.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dhowells@redhat.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[redhat.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,warthog.procyon.org.uk:mid]
X-Rspamd-Queue-Id: 390AF359A8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> ... and I do *not* see a huge advantage to a helper function that just wraps
> "list_empty()" with another name that is actually *less* descriptive.

I don't like list_empty() as the name of the function used to find out whether
an entry is on a list.  Yes, technically, all it's doing is seeing if the
list_head is 'empty', but, linguistically, it looks wrong: the question you're
asking is not if the list is empty (you're not looking at the list head), but
if the entry is on a list.

So if I see in the code:

	if (list_empty(p))

what is the test actually asking?

Note that various other list types in the kernel have separate "is the list
empty" and "is the entry on a list" primitives, though, granted, usually
because they require separate functions programmatically.

Anyway, I'll find a different way to do this, not involving checking the prev
pointer.  What I don't want to do is hard code "prev == LIST_POISON2" into my
stuff.  Anything like that really needs to be in list.h.

David


