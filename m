Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B43C1F732
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:07:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZP-0006hv-Ch; Thu, 30 Oct 2025 10:07:51 +0000
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <viro@ftp.linux.org.uk>)
 id 1vEM5E-0002d1-7b
 for apparmor@lists.ubuntu.com; Thu, 30 Oct 2025 06:24:28 +0000
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat
 Linux)) id 1vEM56-0000000909w-0QYX; Thu, 30 Oct 2025 06:24:20 +0000
Date: Thu, 30 Oct 2025 06:24:20 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: NeilBrown <neil@brown.name>
Message-ID: <20251030062420.GX2441659@ZenIV>
References: <20251029234353.1321957-1-neilb@ownmail.net>
 <20251029234353.1321957-13-neilb@ownmail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029234353.1321957-13-neilb@ownmail.net>
Received-SPF: none client-ip=62.89.141.173; envelope-from=viro@ftp.linux.org.uk;
 helo=zeniv.linux.org.uk
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:44 +0000
Subject: Re: [apparmor] [PATCH v4 12/14] ecryptfs: use new
 start_creating/start_removing APIs
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

On Thu, Oct 30, 2025 at 10:31:12AM +1100, NeilBrown wrote:

> +static struct dentry *ecryptfs_start_creating_dentry(struct dentry *dentry)
>  {
> -	struct dentry *lower_dir_dentry;
> +	struct dentry *parent = dget_parent(dentry->d_parent);

"Grab the reference to grandparent"?

