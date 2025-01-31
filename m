Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F6BA24280
	for <lists+apparmor@lfdr.de>; Fri, 31 Jan 2025 19:21:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tdvdt-0007ho-MS; Fri, 31 Jan 2025 18:21:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <nathan@kernel.org>) id 1tdvdq-0007hW-VR
 for apparmor@lists.ubuntu.com; Fri, 31 Jan 2025 18:21:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2F2A4A41FEE;
 Fri, 31 Jan 2025 18:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108BAC4CED1;
 Fri, 31 Jan 2025 18:21:19 +0000 (UTC)
Date: Fri, 31 Jan 2025 11:21:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20250131182117.GA2398605@ax162>
References: <20250120-apparmor-pointer-bool-conversion-label-v1-1-5957d28ffde6@kernel.org>
 <15e13942-965b-49f9-bf69-36579237a4cb@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15e13942-965b-49f9-bf69-36579237a4cb@canonical.com>
Received-SPF: pass client-ip=147.75.193.91; envelope-from=nathan@kernel.org;
 helo=nyc.source.kernel.org
Subject: Re: [apparmor] [PATCH] apparmor: Fix checking address of an array
 in accum_label_info()
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
Cc: linux-security-module@vger.kernel.org, llvm@lists.linux.dev,
 apparmor@lists.ubuntu.com, patches@lists.linux.dev,
 kernel test robot <lkp@intel.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Jan 24, 2025 at 01:59:36PM -0800, John Johansen wrote:
> On 1/20/25 05:12, Nathan Chancellor wrote:
> > clang warns:
> > 
> >    security/apparmor/label.c:206:15: error: address of array 'new->vec' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
> >      206 |         AA_BUG(!new->vec);
> >          |                ~~~~~~^~~
> > 
> > The address of this array can never be NULL because it is not at the
> > beginning of a structure. Convert the assertion to check that the new
> > pointer is not NULL.
> > 
> > Fixes: de4754c801f4 ("apparmor: carry mediation check on label")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202501191802.bDp2voTJ-lkp@intel.com/
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Acked-by: John Johansen <john.johansen@canonical.com>
> 
> I have pulled this into my tree

Thanks! Is this going to be pushed to -next soon? I am still seeing this
on next-20240131.

> > ---
> >   security/apparmor/label.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/security/apparmor/label.c b/security/apparmor/label.c
> > index afded9996f61..79be2d3d604b 100644
> > --- a/security/apparmor/label.c
> > +++ b/security/apparmor/label.c
> > @@ -203,7 +203,7 @@ static void accum_label_info(struct aa_label *new)
> >   	long u = FLAG_UNCONFINED;
> >   	int i;
> > -	AA_BUG(!new->vec);
> > +	AA_BUG(!new);
> >   	/* size == 1 is a profile and flags must be set as part of creation */
> >   	if (new->size == 1)
> > 
> > ---
> > base-commit: e6b087676954e36a7b1ed51249362bb499f8c1c2
> > change-id: 20250120-apparmor-pointer-bool-conversion-label-7c1027964c7f
> > 
> > Best regards,
> 
> 

