Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D837B25FD
	for <lists+apparmor@lfdr.de>; Thu, 28 Sep 2023 21:36:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qlwnu-00071j-AR; Thu, 28 Sep 2023 19:36:06 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <serge@mail.hallyn.com>)
 id 1qlwnk-0006yX-Cl
 for apparmor@lists.ubuntu.com; Thu, 28 Sep 2023 19:35:56 +0000
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id 9128C60B; Thu, 28 Sep 2023 14:35:55 -0500 (CDT)
Date: Thu, 28 Sep 2023 14:35:55 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20230928193555.GA1908893@mail.hallyn.com>
References: <20230919015608.8390-1-kunyu@nfschina.com>
 <056095ad-ecf4-b93e-252a-7e3c48e94f11@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <056095ad-ecf4-b93e-252a-7e3c48e94f11@canonical.com>
Subject: Re: [apparmor] [PATCH v2] apparmor/file: Removing unnecessary
 initial values for variable pointers
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
Cc: paul@paul-moore.com, Li kunyu <kunyu@nfschina.com>,
 apparmor@lists.ubuntu.com, jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Sep 28, 2023 at 10:36:16AM -0700, John Johansen wrote:
> On 9/18/23 18:56, Li kunyu wrote:
> > These variable pointers are assigned during use and do not need to be
> > initialized for assignment.
> > 
> > Signed-off-by: Li kunyu <kunyu@nfschina.com>
> > ---
> >   v2: Fix timestamp issues
> > 
> >   security/apparmor/file.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/security/apparmor/file.c b/security/apparmor/file.c
> > index 698b124e649f..12eafdf18fc0 100644
> > --- a/security/apparmor/file.c
> > +++ b/security/apparmor/file.c
> > @@ -264,7 +264,7 @@ int aa_path_perm(const char *op, struct aa_label *label,
> >   {
> >   	struct aa_perms perms = {};
> >   	struct aa_profile *profile;
> > -	char *buffer = NULL;
> > +	char *buffer;
> 
> this is okay
> 
> >   	int error;
> >   	flags |= PATH_DELEGATE_DELETED | (S_ISDIR(cond->mode) ? PATH_IS_DIR :
> > @@ -412,7 +412,7 @@ int aa_path_link(struct aa_label *label, struct dentry *old_dentry,
> >   		d_backing_inode(old_dentry)->i_uid,
> >   		d_backing_inode(old_dentry)->i_mode
> >   	};
> > -	char *buffer = NULL, *buffer2 = NULL;
> > +	char *buffer, *buffer2;
> 
> this can cause an oops if buffer2 allocation fails. There are a couple of ways I can
> see to fix this, do you want to take a crack at it.
> 
> 
> >   	struct aa_profile *profile;
> >   	int error;

I don't whether this kind of thing has become in vogue, but while indeed
the first case is okay right now, it becomes more likely that a future patch
to this function will inadvertently goto aa_put_buffer(buffer) before the
aa_get_buffer call.  I would not have NACKed an original version of this fn
without the = NULL, but I'm not in favor of dropping it.

-serge

