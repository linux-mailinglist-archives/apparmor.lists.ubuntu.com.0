Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OQcC0wMy2msDQYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 31 Mar 2026 01:50:36 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A44E3626D6
	for <lists+apparmor@lfdr.de>; Tue, 31 Mar 2026 01:50:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w7MNF-0001dJ-Qh; Mon, 30 Mar 2026 23:50:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <dhowells@redhat.com>) id 1w7MNE-0001d0-NN
 for apparmor@lists.ubuntu.com; Mon, 30 Mar 2026 23:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774914623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4//0gHIbpafUUo1kR2n1Am7xkOI04D7fEcFujAkL3aw=;
 b=Jwld01rkrqHbupodp+Fg05aCHVJ6luaux00YHFZ8tS6eyGvivceKG6pOG+QHQY/VuZxE4r
 iY0qyFU5eLUKVQqrGXCRRxR80dKQ1Rxba0rOfb9mKMYU1k3R+pfUgWrdUgdMOtcxx2WhqK
 pbY7UR9V/7Schq0RNNwELkNKVg5AUbg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-422-zqA9f9snPU-ZRNj8WWh5tg-1; Mon,
 30 Mar 2026 19:50:17 -0400
X-MC-Unique: zqA9f9snPU-ZRNj8WWh5tg-1
X-Mimecast-MFC-AGG-ID: zqA9f9snPU-ZRNj8WWh5tg_1774914615
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4D644180035C; Mon, 30 Mar 2026 23:50:14 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.35.245])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6465018002A6; Mon, 30 Mar 2026 23:50:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wjDKfhS5TvEfrsOgBgAvFMPfAd3wT=Um2AQb4txHq5sAQ@mail.gmail.com>
References: <CAHk-=wjDKfhS5TvEfrsOgBgAvFMPfAd3wT=Um2AQb4txHq5sAQ@mail.gmail.com>
 <20260326131838.634095-1-dhowells@redhat.com>
 <20260326131838.634095-5-dhowells@redhat.com>
 <20260329121208.6092419d@kernel.org>
 <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
 <1179840.1774867765@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Tue, 31 Mar 2026 00:50:07 +0100
Message-ID: <1317861.1774914607@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 8fmwvnc3yL4hu351DS9T5dJKaZQ8Rot2TbF4pLt3_ew_1774914615
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1317860.1774914607.1@warthog.procyon.org.uk>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dhowells@redhat.com;
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[warthog.procyon.org.uk:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 0A44E3626D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> Dammit, you should *KNOW* that already from core logic. Not with a
> flag, not with a function to ask, but from how things work. The whole
> "am I on a list or not" should not be a list issue, it should be
> obvious.

The circumstance in question is this: There's a list of outstanding calls
attached to the rxrpc network namespace.  Calls may hang around on it beyond
the life of the socket that created them for a little bit to deal with network
protocol cleanup, timer cleanup, work func cleanup.  Under normal operation,
calls are removed as the last ref is put.

However, should the namespace be deleted, rxrpc_destroy_all_calls() trawls the
list to report any calls that haven't been cleaned up and the calls are
deleted from the list as it reports them so that the spinlock doesn't have to
be kept held.  It used to do other work here too, IIRC, but that's no longer
the case, so perhaps this loop is not needed now, and a warning will suffice
if the list is not empty (or I could just report, say, the first 10 calls and
not worry about calling cond_resched()).  The wait at the bottom of the
function should be sufficient to hold up namespace deallocation.

If I don't delete entries in rxrpc_destroy_all_calls(), then rxrpc_put_call()
only needs list_empty() to guard against the call not having being queued yet.
I could have a flag for that, but it would be superfluous.

Note that the reason for the RCU walking is because /proc/net/rxrpc/calls
walks over the same list, so I still need the next patch which switches to
list_del_rcu().

David


