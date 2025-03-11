Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D96A5CBD7
	for <lists+apparmor@lfdr.de>; Tue, 11 Mar 2025 18:15:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ts3Cd-0006gP-Fq; Tue, 11 Mar 2025 17:15:39 +0000
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <viro@ftp.linux.org.uk>)
 id 1ts3Cb-0006gH-Vt
 for apparmor@lists.ubuntu.com; Tue, 11 Mar 2025 17:15:38 +0000
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.1 #2 (Red Hat
 Linux)) id 1ts3CY-00000004vkf-15DV; Tue, 11 Mar 2025 17:15:34 +0000
Date: Tue, 11 Mar 2025 17:15:34 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Message-ID: <20250311171534.GQ2023217@ZenIV>
References: <e54e6a2f-1178-4980-b771-4d9bafc2aa47@tnxip.de>
 <CAKCV-6s3_7RzDfo_yGQj9ndf4ZKw_Awf8oNc6pYKXgDTxiDfjw@mail.gmail.com>
 <465d1d23-3b36-490e-b0dd-74889d17fa4c@tnxip.de>
 <CAKCV-6uuKo=RK37GhM+fV90yV9sxBFqj0s07EPSoHwVZdDWa3A@mail.gmail.com>
 <ea97dd9d1cb33e28d6ca830b6bff0c2ece374dbe.camel@HansenPartnership.com>
 <CAMj1kXGLXbki1jezLgzDGE7VX8mNmHKQ3VLQPq=j5uAyrSomvQ@mail.gmail.com>
 <20250311-visite-rastplatz-d1fdb223dc10@brauner>
 <814a257530ad5e8107ce5f48318ab43a3ef1f783.camel@HansenPartnership.com>
 <20250311-trunk-farben-fe36bebe233a@brauner>
 <78a59e2a5012bfb2d6a653782ab346b44b211102.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78a59e2a5012bfb2d6a653782ab346b44b211102.camel@HansenPartnership.com>
Received-SPF: none client-ip=62.89.141.173; envelope-from=viro@ftp.linux.org.uk;
 helo=zeniv.linux.org.uk
Subject: Re: [apparmor] apparmor NULL pointer dereference on resume
	[efivarfs]
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
Cc: Christian Brauner <brauner@kernel.org>, linux-efi@vger.kernel.org,
 apparmor <apparmor@lists.ubuntu.com>,
 Malte =?iso-8859-1?Q?Schr=F6der?= <malte.schroeder@tnxip.de>,
 linux-security-module@vger.kernel.org, "jk@ozlabs.org" <jk@ozlabs.org>,
 linux-fsdevel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Mar 11, 2025 at 12:20:05PM -0400, James Bottomley wrote:

> That's the way it's supposed to work, yes.  However, if we move to an
> always persistent superblock and mnt, I was thinking there'd have to be
> an indicator in the sfi about whether the variables were reflected or
> not.

Just have a pointer to superblock set at ->get_tree() and cleared at
the very beginning of ->kill_sb(), then have notifier bugger off if
that thing's NULL or if atomic_inc_not_zero(sb->s_active) fails
(rcu_read_lock() is sufficient for memory safety of that).  And
do deactivate_super() when you are done.

That'll give you exclusion with umount.  As for the rest of that...
fuck it, just have kern_mount()/kern_unmount() inside that.
How hot do you expect that notifier chain to be?

Or screw playing with open/iterate_dir, but that'll need some thinking -
theoretically everything you need is already accessible, but direct
access to ->d_lock/->d_sib in there is almost certainly not the right
level of abstraction.  We already have similar bits and pieces
in autofs and ceph, and it's just a matter of figuring out a good
set of primitives.

