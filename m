Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AF3C1F737
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:07:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZP-0006hd-6K; Thu, 30 Oct 2025 10:07:51 +0000
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <viro@ftp.linux.org.uk>)
 id 1vELtR-0001kQ-Ql
 for apparmor@lists.ubuntu.com; Thu, 30 Oct 2025 06:12:17 +0000
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat
 Linux)) id 1vELt9-00000008mUB-2sjF; Thu, 30 Oct 2025 06:11:59 +0000
Date: Thu, 30 Oct 2025 06:11:59 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: NeilBrown <neil@brown.name>
Message-ID: <20251030061159.GV2441659@ZenIV>
References: <20251029234353.1321957-1-neilb@ownmail.net>
 <20251029234353.1321957-8-neilb@ownmail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029234353.1321957-8-neilb@ownmail.net>
Received-SPF: none client-ip=62.89.141.173; envelope-from=viro@ftp.linux.org.uk;
 helo=zeniv.linux.org.uk
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:44 +0000
Subject: Re: [apparmor] [PATCH v4 07/14] VFS: introduce
	start_removing_dentry()
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
Cc: Jan Kara <jack@suse.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, James Morris <jmorris@namei.org>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-cifs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tyler Hicks <code@tyhicks.com>, Steve French <smfrench@gmail.com>,
 linux-unionfs@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Olga Kornievskaia <okorniev@redhat.com>,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-nfs@vger.kernel.org, Mateusz Guzik <mjguzik@gmail.com>,
 David Sterba <dsterba@suse.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Oct 30, 2025 at 10:31:07AM +1100, NeilBrown wrote:

> @@ -428,11 +429,14 @@ static bool cachefiles_invalidate_cookie(struct fscache_cookie *cookie)
>  		if (!old_tmpfile) {
>  			struct cachefiles_volume *volume = object->volume;
>  			struct dentry *fan = volume->fanout[(u8)cookie->key_hash];
> -
> -			inode_lock_nested(d_inode(fan), I_MUTEX_PARENT);
> -			cachefiles_bury_object(volume->cache, object, fan,
> -					       old_file->f_path.dentry,
> -					       FSCACHE_OBJECT_INVALIDATED);
> +			struct dentry *obj;
> +
> +			obj = start_removing_dentry(fan, old_file->f_path.dentry);
> +			if (!IS_ERR(obj))
> +				cachefiles_bury_object(volume->cache, object,
> +						       fan, obj,
> +						       FSCACHE_OBJECT_INVALIDATED);
> +			end_removing(obj);

Huh?  Where did you change cachefiles_bury_object to *not* unlock the parent?
Not in this commit, AFAICS, and that means at least a bisection hazard around
here...

Confused...

