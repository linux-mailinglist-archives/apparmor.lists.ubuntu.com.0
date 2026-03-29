Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOXcAsV7yWmIyQUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 29 Mar 2026 21:21:41 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C12A5353C47
	for <lists+apparmor@lfdr.de>; Sun, 29 Mar 2026 21:21:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w6vhM-0003vG-KZ; Sun, 29 Mar 2026 19:21:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <kuba@kernel.org>) id 1w6vhK-0003tQ-TU
 for apparmor@lists.ubuntu.com; Sun, 29 Mar 2026 19:21:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BDD7E600AC;
 Sun, 29 Mar 2026 19:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3851C116C6;
 Sun, 29 Mar 2026 19:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774811697;
 bh=2t4y18byjP1MjQQ2XhoChveQhWdoC7SnSWd/GP1c26g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L71CGYcE68iwQWH4swEnEnQd5j4J1W+HudNK3TShVFeCpkhI95IU4g4JXoykRuJrq
 k5Lip9ePtirW1wyHq/ZlHphH9D3zjq3SkRTWSKi4C+uIhO6SfqpcXVeYHCp1aNUfvo
 /B+FEGp00aaRdk80zHhk74rzEZH+rpRdusZvw6maC3gyZL7HXZpwNyiK94+LhLnKip
 dIUabtN4QvKW3DPfjhIBzqkWkDS+DEK59P6bs1a0SIM2PXnAogWQ7SZOzond6lQCaE
 02lqUAhSz0HiRhlUXj8XHI0Az2eqbWszHG9+TzIJgbP9Kmfz6qelpSkiGQI4YHqE/z
 4K3ecNoUfEvew==
Date: Sun, 29 Mar 2026 12:14:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20260329121455.72f87d3b@kernel.org>
In-Reply-To: <20260326131838.634095-5-dhowells@redhat.com>
References: <20260326131838.634095-1-dhowells@redhat.com>
 <20260326131838.634095-5-dhowells@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[kuba@kernel.org,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dhowells@redhat.com,m:stable@kernel.org,m:netdev@vger.kernel.org,m:linux-usb@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-afs@lists.infradead.org,m:hminas@synopsys.com,m:edumazet@google.com,m:mathieu.desnoyers@efficios.com,m:horms@kernel.org,m:marc.dionne@auristor.com,m:pabeni@redhat.com,m:davem@davemloft.net,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.973];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url]
X-Rspamd-Queue-Id: C12A5353C47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 13:18:29 +0000 David Howells wrote:
> Unfortunately, list_empty() is not usable with an entry that has been
> removed from a list with list_del_rcu() as ->next must be left pointing at
> the following entry so as not to break traversal under RCU.

This seems to break build for jffs.
Someone already marked this as rejected in PW.
Whoever it was PLEASE STOP.

Quoting documentation:

  Updating patch status
  ~~~~~~~~~~~~~~~~~~~~~
  
  Contributors and reviewers do not have the permissions to update patch
  state directly in patchwork. Patchwork doesn't expose much information
  about the history of the state of patches, therefore having multiple
  people update the state leads to confusion.
  
  Instead of delegating patchwork permissions netdev uses a simple mail
  bot which looks for special commands/lines within the emails sent to
  the mailing list. For example to mark a series as Changes Requested
  one needs to send the following line anywhere in the email thread::
  
    pw-bot: changes-requested
  
  As a result the bot will set the entire series to Changes Requested.
  This may be useful when author discovers a bug in their own series
  and wants to prevent it from getting applied.
  
  The use of the bot is entirely optional, if in doubt ignore its
  existence completely. Maintainers will classify and update the state
  of the patches themselves. No email should ever be sent to the list
  with the main purpose of communicating with the bot, the bot commands
  should be seen as metadata. 
  The use of the bot is restricted to authors of the patches (the
  ``From:`` header on patch submission and command must match!),
  maintainers of the modified code according to the MAINTAINERS file
  (again, ``From:`` must match the MAINTAINERS entry) and a handful of
  senior reviewers. 
  Bot records its activity here:
  
    https://netdev.bots.linux.dev/pw-bot.html
  
See:
  https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#updating-patch-status

