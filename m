Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBmSJh+oqmmzVAEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 06 Mar 2026 11:10:39 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AA14321E7BB
	for <lists+apparmor@lfdr.de>; Fri, 06 Mar 2026 11:10:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vyS8W-0004Tv-36; Fri, 06 Mar 2026 10:10:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <brauner@kernel.org>) id 1vyS8V-0004Tn-8C
 for apparmor@lists.ubuntu.com; Fri, 06 Mar 2026 10:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDB6140513;
 Fri,  6 Mar 2026 10:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A5FC4CEF7;
 Fri,  6 Mar 2026 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772791424;
 bh=2k86Dtm5s9d5fuxoJ9fHeDpBAjwOVfZAGlB/JmB3VzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m5eJ64atM8CSqw/MFjNXRrxzHZxZT0IBlWe/NQZtx2XiegpWzk9QGLezy2pa/YbfU
 xtk86J7xCw5xi/XgfSdxYaLcnSBQI+NqT6UnzHy0w4Tf/ewxqIXGBWBnoDewzKWpqt
 gla/VKzwagTuoRDKQmlWYIGEo255wDo0Ruxpy+b4aKGeHwOu1OT4COczr0n1spvh6m
 YYxtdzNadC/MvG7p7bpMrLJvbXCGKo0xO+V58N36G45KnREJAziJK+kkCiOwMVW7+p
 5H/AG3mUibbev5gybwevloaYp72DLAyI2k59DOJNlxe8cWCA5bqTCMKlTB4QC7I+m9
 FpkwlN+s9sM0Q==
Date: Fri, 6 Mar 2026 11:03:36 +0100
From: Christian Brauner <brauner@kernel.org>
To: NeilBrown <neil@brown.name>
Message-ID: <20260306-stolz-verzichten-2ee626da4503@brauner>
References: <20260224222542.3458677-1-neilb@ownmail.net>
 <20260224222542.3458677-11-neilb@ownmail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224222542.3458677-11-neilb@ownmail.net>
Received-SPF: pass client-ip=172.234.252.31; envelope-from=brauner@kernel.org;
 helo=sea.source.kernel.org
Subject: Re: [apparmor] [PATCH v3 10/15] cachefiles: change
 cachefiles_bury_object to use start_renaming_dentry()
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
X-Rspamd-Queue-Id: AA14321E7BB
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

On Wed, Feb 25, 2026 at 09:16:55AM +1100, NeilBrown wrote:
> From: NeilBrown <neil@brown.name>
> 
> Rather then using lock_rename() and lookup_one() etc we can use
> the new start_renaming_dentry().  This is part of centralising dir
> locking and lookup so that locking rules can be changed.
> 
> Some error check are removed as not necessary.  Checks for rep being a
> non-dir or IS_DEADDIR and the check that ->graveyard is still a
> directory only provide slightly more informative errors and have been
> dropped.
> 
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: NeilBrown <neil@brown.name>
> ---
>  fs/cachefiles/namei.c | 76 ++++++++-----------------------------------
>  1 file changed, 14 insertions(+), 62 deletions(-)
> 
> diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
> index e5ec90dccc27..3af42ec78411 100644
> --- a/fs/cachefiles/namei.c
> +++ b/fs/cachefiles/namei.c
> @@ -270,7 +270,8 @@ int cachefiles_bury_object(struct cachefiles_cache *cache,
>  			   struct dentry *rep,
>  			   enum fscache_why_object_killed why)
>  {
> -	struct dentry *grave, *trap;
> +	struct dentry *grave;
> +	struct renamedata rd = {};
>  	struct path path, path_to_graveyard;
>  	char nbuffer[8 + 8 + 1];
>  	int ret;
> @@ -302,77 +303,36 @@ int cachefiles_bury_object(struct cachefiles_cache *cache,
>  		(uint32_t) ktime_get_real_seconds(),
>  		(uint32_t) atomic_inc_return(&cache->gravecounter));
>  
> -	/* do the multiway lock magic */
> -	trap = lock_rename(cache->graveyard, dir);
> -	if (IS_ERR(trap))
> -		return PTR_ERR(trap);
> -
> -	/* do some checks before getting the grave dentry */
> -	if (rep->d_parent != dir || IS_DEADDIR(d_inode(rep))) {
> -		/* the entry was probably culled when we dropped the parent dir
> -		 * lock */
> -		unlock_rename(cache->graveyard, dir);
> -		_leave(" = 0 [culled?]");
> -		return 0;

I think this is a subtle change in behavior?

If rep->d_parent != dir after lock_rename this returned 0 in the old
code. With your changes the same condition in __start_renaming_dentry
returns -EINVAL which means cachefiles_io_error() sets CACHEFILES_DEAD
and permanently disables the cache.

> -	}
> -
> -	if (!d_can_lookup(cache->graveyard)) {
> -		unlock_rename(cache->graveyard, dir);
> -		cachefiles_io_error(cache, "Graveyard no longer a directory");
> -		return -EIO;
> -	}
> -
> -	if (trap == rep) {
> -		unlock_rename(cache->graveyard, dir);
> -		cachefiles_io_error(cache, "May not make directory loop");
> +	rd.mnt_idmap = &nop_mnt_idmap;
> +	rd.old_parent = dir;
> +	rd.new_parent = cache->graveyard;
> +	rd.flags = 0;
> +	ret = start_renaming_dentry(&rd, 0, rep, &QSTR(nbuffer));
> +	if (ret) {
> +		cachefiles_io_error(cache, "Cannot lock/lookup in graveyard");
>  		return -EIO;
>  	}
>  
>  	if (d_mountpoint(rep)) {
> -		unlock_rename(cache->graveyard, dir);
> +		end_renaming(&rd);
>  		cachefiles_io_error(cache, "Mountpoint in cache");
>  		return -EIO;
>  	}
>  
> -	grave = lookup_one(&nop_mnt_idmap, &QSTR(nbuffer), cache->graveyard);
> -	if (IS_ERR(grave)) {
> -		unlock_rename(cache->graveyard, dir);
> -		trace_cachefiles_vfs_error(object, d_inode(cache->graveyard),
> -					   PTR_ERR(grave),
> -					   cachefiles_trace_lookup_error);
> -
> -		if (PTR_ERR(grave) == -ENOMEM) {
> -			_leave(" = -ENOMEM");
> -			return -ENOMEM;
> -		}

This too?

In the old code a -ENOMEM return from lookup_one() let the cache stay
alive and returned directly. The new code gets sent via
cachefiles_io_error() causing again CACHEFILES_DEAD to be set and
permanently disabling the cache.

Maybe both changes are intentional. If so we should probably note this
in the commit message or this should be fixed?

If you give me a fixup! on top of vfs-7.1.directory I can fold it.

