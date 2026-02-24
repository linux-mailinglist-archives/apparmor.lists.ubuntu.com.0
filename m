Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFvxJ8hvnWlyQAQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 10:30:48 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFA51849F3
	for <lists+apparmor@lfdr.de>; Tue, 24 Feb 2026 10:30:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuokU-0006UQ-1j; Tue, 24 Feb 2026 09:30:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1vuokS-0006UF-H4
 for apparmor@lists.ubuntu.com; Tue, 24 Feb 2026 09:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 23E5360145;
 Tue, 24 Feb 2026 09:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC04C116D0;
 Tue, 24 Feb 2026 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771924853;
 bh=zQsck/PbdutrfjuyGfWsZrSGCznNVHiinSu2WQcwhXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d33MvPatWU9dWg+Iyd8o/6Y/ldYwKOH8cRg0Twmt0370/HtNEBoWP3z5uOe6wmFXJ
 YM9ycD9PQCBY6f2pUjrO96/u5KF7xm8ivKI2Fh9vCGLwg5th0xGGx+/N3bPn616+er
 dlPZiqPuHcSGvxYT6sAfWt7q6WkwtO/P0RFeZQS+YU296u3wkl+HM6Pc0aQp5zvzEE
 X6nxMKN1zyPs4ALdzch6DfnAy/FTnYRsMnHX+NVzC9EriWNJBe5KoE1zL64sE0Qrsj
 no9HXBs4Wj5/XGONNbVLX4l0ye+IcMDVik2w/nSZhnQyRG+ywegsYDlZMV36f9l8VM
 i7cfOC2T30jgw==
Date: Tue, 24 Feb 2026 10:20:46 +0100
From: Christian Brauner <brauner@kernel.org>
To: Chris Mason <clm@meta.com>
Message-ID: <20260224-granulat-joggen-cd082d178959@brauner>
References: <20260223011210.3853517-1-neilb@ownmail.net>
 <20260223011210.3853517-13-neilb@ownmail.net>
 <20260223132424.105125-1-clm@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223132424.105125-1-clm@meta.com>
Received-SPF: pass client-ip=172.105.4.254; envelope-from=brauner@kernel.org;
 helo=tor.source.kernel.org
Subject: Re: [apparmor] [PATCH v2 12/15] ovl: change ovl_create_real() to
 get a new lock when re-opening created file.
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
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>,
 Miklos Szeredi <miklos@szeredi.hu>, James Morris <jmorris@namei.org>,
 NeilBrown <neil@brown.name>, "Serge E. Hallyn" <serge@hallyn.com>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-nfs@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:clm@meta.com,m:jack@suse.cz,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:dhowells@redhat.com,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:jmorris@namei.org,m:neil@brown.name,m:serge@hallyn.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:viro@zeniv.linux.org.uk,m:linux-nfs@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[brauner@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brauner@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[suse.cz,kernel.org,gmail.com,vger.kernel.org,redhat.com,paul-moore.com,szeredi.hu,namei.org,brown.name,hallyn.com,lists.ubuntu.com,zeniv.linux.org.uk,oracle.com,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ownmail.net:email,brown.name:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 3DFA51849F3
X-Rspamd-Action: add header
X-Spam: Yes

On Mon, Feb 23, 2026 at 05:23:00AM -0800, Chris Mason wrote:
> NeilBrown <neilb@ownmail.net> wrote:
> > From: NeilBrown <neil@brown.name>
> > 
> > When ovl_create_real() is used to create a file on the upper filesystem
> > it needs to return the resulting dentry - positive and hashed.
> > It is usually the case the that dentry passed to the create function
> > (e.g.  vfs_create()) will be suitable but this is not guaranteed.  The
> > filesystem may unhash that dentry forcing a repeat lookup next time the
> > name is wanted.
> > 
> 
> Hi everyone,
> 
> Amir suggested I run these through, and this commit was flagged:
> 
> commit 62d49d1e44667e4f93bec415faabec5526992ac0
> Author: NeilBrown <neil@brown.name>
> 
> ovl: change ovl_create_real() to get a new lock when re-opening created file.
> 
> This commit changes ovl_create_real() to drop the directory lock and
> reacquire a new lock for lookup when the created dentry is unhashed. It
> also removes ovl_lookup_upper() which is no longer used.
> 
> Signed-off-by: NeilBrown <neil@brown.name>

Fwiw, all patches that are applied go through AI review. My plan is to
have a discussion on getting automation set up for this at LSFMM so that
we can have the bot directly reply to reviews but under our control so
we can vet reviews.

