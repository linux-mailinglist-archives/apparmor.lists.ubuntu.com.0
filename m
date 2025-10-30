Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BE86AC1F72D
	for <lists+apparmor@lfdr.de>; Thu, 30 Oct 2025 11:07:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vEPZO-0006gy-Vu; Thu, 30 Oct 2025 10:07:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <linkinjeon@kernel.org>) id 1vEGGm-0000hf-Ck
 for apparmor@lists.ubuntu.com; Thu, 30 Oct 2025 00:12:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 911C244E48
 for <apparmor@lists.ubuntu.com>; Thu, 30 Oct 2025 00:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBE2C116B1
 for <apparmor@lists.ubuntu.com>; Thu, 30 Oct 2025 00:02:23 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b6d2f5c0e8eso94241266b.3
 for <apparmor@lists.ubuntu.com>; Wed, 29 Oct 2025 17:02:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhj47LAJBulgX95djqrjOyCxcisB2L5f3ddNGe7+f+vdHwrEaDLsrC0KJe6sWfAs3vT09hS6Y2xw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yy8Bx4iBzp2VdG7dtlxutyYNfqjsfcaOdmVfIzEt2HH4Be7886b
 Vi6+PUJsnyGYMCBCjs06Qx75xL0wbukyDXA8x2+DssUSXMoVO6Tm76RaJdfTaOIwUJV8ULSI4TQ
 Ls3GmhOLFmNbfxOzEpe6TipgYit2Hii4=
X-Google-Smtp-Source: AGHT+IFp6XmtNYQvDgzIxt6N/UJfVu4TmDjNTFEnDMi0BPOBbAiMhgT+FO6/cnvMt+r32HZOllHtr/4V9Y8hAvFbtRA=
X-Received: by 2002:a17:907:3cc4:b0:b45:eea7:e97c with SMTP id
 a640c23a62f3a-b703d5569b8mr475849266b.47.1761782541878; Wed, 29 Oct 2025
 17:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251029234353.1321957-1-neilb@ownmail.net>
 <20251029234353.1321957-11-neilb@ownmail.net>
In-Reply-To: <20251029234353.1321957-11-neilb@ownmail.net>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 30 Oct 2025 09:02:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8QGx=GWNCw8n3Pfp-4VDOY6OTtnHvGjcvAAHESH-eLyA@mail.gmail.com>
X-Gm-Features: AWmQ_bl65wcvcAo59bCN4Dy6QbeOgouXiHvgTquU1892ABOO7FZA8E3Xbxk2z5k
Message-ID: <CAKYAXd8QGx=GWNCw8n3Pfp-4VDOY6OTtnHvGjcvAAHESH-eLyA@mail.gmail.com>
To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.234.252.31;
 envelope-from=linkinjeon@kernel.org; helo=sea.source.kernel.org
X-Mailman-Approved-At: Thu, 30 Oct 2025 10:07:44 +0000
Subject: Re: [apparmor] [PATCH v4 10/14] VFS/ovl/smb: introduce
	start_renaming_dentry()
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
 linux-unionfs@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Olga Kornievskaia <okorniev@redhat.com>, selinux@vger.kernel.org,
 ecryptfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 Mateusz Guzik <mjguzik@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
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

On Thu, Oct 30, 2025 at 8:46=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> From: NeilBrown <neil@brown.name>
>
> Several callers perform a rename on a dentry they already have, and only
> require lookup for the target name.  This includes smb/server and a few
> different places in overlayfs.
>
> start_renaming_dentry() performs the required lookup and takes the
> required lock using lock_rename_child()
>
> It is used in three places in overlayfs and in ksmbd_vfs_rename().
>
> In the ksmbd case, the parent of the source is not important - the
> source must be renamed from wherever it is.  So start_renaming_dentry()
> allows rd->old_parent to be NULL and only checks it if it is non-NULL.
> On success rd->old_parent will be the parent of old_dentry with an extra
> reference taken.  Other start_renaming function also now take the extra
> reference and end_renaming() now drops this reference as well.
>
> ovl_lookup_temp(), ovl_parent_lock(), and ovl_parent_unlock() are
> all removed as they are no longer needed.
>
> OVL_TEMPNAME_SIZE and ovl_tempname() are now declared in overlayfs.h so
> that ovl_check_rename_whiteout() can access them.
>
> ovl_copy_up_workdir() now always cleans up on error.
>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: NeilBrown <neil@brown.name>
For ksmbd part,
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!

