Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIWvAG+jqml6UwEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 06 Mar 2026 10:50:39 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE821E3A2
	for <lists+apparmor@lfdr.de>; Fri, 06 Mar 2026 10:50:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vyRpB-00019A-4d; Fri, 06 Mar 2026 09:50:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1vyRp9-00017p-1f
 for apparmor@lists.ubuntu.com; Fri, 06 Mar 2026 09:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 851EE4350A;
 Fri,  6 Mar 2026 09:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42949C4CEF7;
 Fri,  6 Mar 2026 09:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772790130;
 bh=fFg7aWjPxphbulTb79Nt+ZDPqV4b3jllfkrmJmykajI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HH0dSpc/NY5W6vJribQ+0/VUib+ntzCMXwsF44TqYjP1DQJWwC4t2dC/dm+Mi9VCk
 o33dauJ6s4cCsTKppZWf2FouzNEPL7RkNJM2sQRR0OWzENbwBdn2ID0ImWSfUdYA3d
 G6Ycyw5KRr1tlQpXPgOg/TNKn/xLOUpRQJQZzub+CTcJdgW5iyjjUZtTDAAdL3bOoz
 15PnfIMPjE5DIc5W/D+cnLdq1HvN4kM0cGlnEspFGoym/UwjmuTFDwMIkZgkeyX7o3
 MH8iwSDfyPNa88MIts0uDSl97VM/yIsxUbTn60rD8OhRvxA6r4Zhu3gGkF95tj8S8t
 F7xNzkhP59KAA==
Date: Fri, 6 Mar 2026 10:42:02 +0100
From: Christian Brauner <brauner@kernel.org>
To: NeilBrown <neil@brown.name>
Message-ID: <20260306-fastnacht-kernig-3b350bd2fab0@brauner>
References: <20260224222542.3458677-1-neilb@ownmail.net>
 <20260224222542.3458677-6-neilb@ownmail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224222542.3458677-6-neilb@ownmail.net>
Received-SPF: pass client-ip=172.234.252.31; envelope-from=brauner@kernel.org;
 helo=sea.source.kernel.org
Subject: Re: [apparmor] [PATCH v3 05/15] Apparmor: Use
 simple_start_creating() / simple_done_creating()
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
Cc: linux-nfs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>, Miklos Szeredi <miklos@szeredi.hu>,
 selinux@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-security-module@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 apparmor@lists.ubuntu.com, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-unionfs@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 9DDE821E3A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:linux-nfs@vger.kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:djwong@kernel.org,m:stephen.smalley.work@gmail.com,m:amir73il@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:apparmor@lists.ubuntu.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[brauner@kernel.org,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[brauner@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.cz,paul-moore.com,szeredi.hu,kernel.org,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.ubuntu.com,lists.linux.dev,hallyn.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCPT_COUNT_TWELVE(0.00)[21];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: add header
X-Spam: Yes

On Wed, Feb 25, 2026 at 09:16:50AM +1100, NeilBrown wrote:
> From: NeilBrown <neil@brown.name>
> 
> Instead of explicitly locking the parent and performing a look up in
> apparmor, use simple_start_creating(), and then simple_done_creating()
> to unlock and drop the dentry.
> 
> This removes the need to check for an existing entry (as
> simple_start_creating() acts like an exclusive create and can return
> -EEXIST), simplifies error paths, and keeps dir locking code
> centralised.
> 
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: NeilBrown <neil@brown.name>
> ---

Fwiw, I think this fixes a reference count leak:

The old aafs_create returned dentries with refcount=2 (one from
lookup_noperm, one from dget in __aafs_setup_d_inode). The cleanup path
aafs_remove puts one reference leaving one reference that didn't get
cleaned up.

After your changes this is now correct as simple_done_creating() puts
the lookup reference.

