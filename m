Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF42C1F73B
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:08:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZL-0006eO-Vp; Thu, 30 Oct 2025 10:07:47 +0000
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <viro@ftp.linux.org.uk>)
 id 1vEM3E-0002Uz-2A
 for apparmor@lists.ubuntu.com; Thu, 30 Oct 2025 06:22:24 +0000
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat
 Linux)) id 1vEM34-00000008yCG-1FE4; Thu, 30 Oct 2025 06:22:14 +0000
Date: Thu, 30 Oct 2025 06:22:14 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: NeilBrown <neil@brown.name>
Message-ID: <20251030062214.GW2441659@ZenIV>
References: <20251029234353.1321957-1-neilb@ownmail.net>
 <20251029234353.1321957-12-neilb@ownmail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029234353.1321957-12-neilb@ownmail.net>
Received-SPF: none client-ip=62.89.141.173; envelope-from=viro@ftp.linux.org.uk;
 helo=zeniv.linux.org.uk
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:44 +0000
Subject: Re: [apparmor] [PATCH v4 11/14] Add start_renaming_two_dentries()
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

On Thu, Oct 30, 2025 at 10:31:11AM +1100, NeilBrown wrote:

> +++ b/fs/debugfs/inode.c

Why does debugfs_change_name() need any of that horror?  Seriously, WTF?
This is strictly a name change on a filesystem that never, ever moves
anything from one directory to another.

IMO struct renamedata is a fucking eyesore, but that aside, this:

> @@ -539,22 +540,30 @@ static int sel_make_policy_nodes(struct selinux_fs_info *fsi,
>  	if (ret)
>  		goto out;
>  
> -	lock_rename(tmp_parent, fsi->sb->s_root);
> +	rd.old_parent = tmp_parent;
> +	rd.new_parent = fsi->sb->s_root;
>  
>  	/* booleans */
> -	d_exchange(tmp_bool_dir, fsi->bool_dir);
> +	ret = start_renaming_two_dentries(&rd, tmp_bool_dir, fsi->bool_dir);
> +	if (!ret) {
> +		d_exchange(tmp_bool_dir, fsi->bool_dir);
>  
> -	swap(fsi->bool_num, bool_num);
> -	swap(fsi->bool_pending_names, bool_names);
> -	swap(fsi->bool_pending_values, bool_values);
> +		swap(fsi->bool_num, bool_num);
> +		swap(fsi->bool_pending_names, bool_names);
> +		swap(fsi->bool_pending_values, bool_values);
>  
> -	fsi->bool_dir = tmp_bool_dir;
> +		fsi->bool_dir = tmp_bool_dir;
> +		end_renaming(&rd);
> +	}
>  
>  	/* classes */
> -	d_exchange(tmp_class_dir, fsi->class_dir);
> -	fsi->class_dir = tmp_class_dir;
> +	ret = start_renaming_two_dentries(&rd, tmp_class_dir, fsi->class_dir);
> +	if (ret == 0) {
> +		d_exchange(tmp_class_dir, fsi->class_dir);
> +		fsi->class_dir = tmp_class_dir;
>  
> -	unlock_rename(tmp_parent, fsi->sb->s_root);
> +		end_renaming(&rd);
> +	}
>  
>  out:
>  	sel_remove_old_bool_data(bool_num, bool_names, bool_values);

is very interesting - suddenly you get two non-overlapping scopes instead of one.
Why is that OK?

