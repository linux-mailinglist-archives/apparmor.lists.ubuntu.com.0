Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJHlM8J7yWmIyQUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 29 Mar 2026 21:21:38 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0DE353C3F
	for <lists+apparmor@lfdr.de>; Sun, 29 Mar 2026 21:21:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w6vhN-0003vo-0I; Sun, 29 Mar 2026 19:21:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <kuba@kernel.org>) id 1w6vhK-0003tP-UX
 for apparmor@lists.ubuntu.com; Sun, 29 Mar 2026 19:21:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B92B260054;
 Sun, 29 Mar 2026 19:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB585C116C6;
 Sun, 29 Mar 2026 19:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774811530;
 bh=o/yp8qy8Rbn8pJPvjcvzhSGLE6cgVQWLWrs+k/X0tNo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ug2PkI59dzaumq1kfHe7AM8vGd6gYTu2DkprdY3/WoPS35Mcv5Ua98WvhRV9bSncQ
 WAJivNsRgSkn2mrYpy3QHCWfJeUSNHe+xmJFI7IZC4Go08Q2kIxr6ZX6fOP0622+rT
 vJ84hwXyDzXN9Ebq9jm/SCXzbipCMks5p+jHQJJQbj9hZQl/nSa31sZVT0AbLv8vBR
 7sbvuaPNSm/2Xjh4UeSzUxrT0vfb2j5kmhTRRyUcE2pjbqeH9ZnJyPvRaxz0rlsTNE
 iTvoPeScH/dyM9R9xDye2m4W+52NyHo0I57ZAT2LQzGGKNkpwnMgdopTKOUaWgCgjt
 GUDbt17aLiEDw==
Date: Sun, 29 Mar 2026 12:12:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20260329121208.6092419d@kernel.org>
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
 Paolo Abeni <pabeni@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, "David
 S. Miller" <davem@davemloft.net>
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kuba@kernel.org,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dhowells@redhat.com,m:stable@kernel.org,m:netdev@vger.kernel.org,m:linux-usb@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-afs@lists.infradead.org,m:hminas@synopsys.com,m:edumazet@google.com,m:mathieu.desnoyers@efficios.com,m:horms@kernel.org,m:marc.dionne@auristor.com,m:pabeni@redhat.com,m:torvalds@linux-foundation.org,m:davem@davemloft.net,s:lists@lfdr.de];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8F0DE353C3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 13:18:29 +0000 David Howells wrote:
> diff --git a/include/linux/list.h b/include/linux/list.h
> index 00ea8e5fb88b..d224e7210d1b 100644
> --- a/include/linux/list.h
> +++ b/include/linux/list.h
> @@ -381,6 +381,32 @@ static inline int list_empty(const struct list_head *head)
>  	return READ_ONCE(head->next) == head;
>  }
>  
> +/**
> + * on_list - Test whether an entry is on a list.
> + * @entry: The entry to check
> + *
> + * Test whether an entry is on a list.  Safe to use on an entry initialised
> + * with INIT_LIST_HEAD() or LIST_HEAD() or removed with things like
> + * list_del_init().  Not safe for use with list_del() or list_del_rcu().
> + */
> +static inline bool on_list(const struct list_head *entry)
> +{
> +	return !list_empty(entry);
> +}
> +
> +/**
> + * on_list_rcu - Test whether an entry is on a list (RCU-del safe).
> + * @entry: The entry to check
> + *
> + * Test whether an entry is on a list.  Safe to use on an entry initialised
> + * with INIT_LIST_HEAD() or LIST_HEAD() or removed with things like
> + * list_del_init().  Also safe for use with list_del() or list_del_rcu().
> + */
> +static inline bool on_list_rcu(const struct list_head *entry)
> +{
> +	return !list_empty(entry) && entry->prev != LIST_POISON2;
> +}

Could someone with sufficient weight to their name ack this?

The non-RCU version of on_list() does not sit well with me.
It provides no additional semantics above list_empty() and
the uninit / poison-related gotchas more obvious when typing
!list_empty(&entry->list).

I can believe the RCU version is more useful. It could probably
be used on both RCU and non-RCU entries?

Last minor nit - the list API consistently uses list_ as a prefix.
I have no better name to suggest but it's sad that on_list_rcu()
breaks that.

I think you're missing a READ_ONCE(), BTW.

