Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C48E974466
	for <lists+apparmor@lfdr.de>; Tue, 10 Sep 2024 22:57:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1so7vn-0003cs-CC; Tue, 10 Sep 2024 20:57:47 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <serge@mail.hallyn.com>)
 id 1so7vl-0003ck-0m
 for apparmor@lists.ubuntu.com; Tue, 10 Sep 2024 20:57:45 +0000
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id 6C88F45D; Tue, 10 Sep 2024 15:57:44 -0500 (CDT)
Date: Tue, 10 Sep 2024 15:57:44 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20240910205744.GA314978@mail.hallyn.com>
References: <20240821072238.3028-1-shenlichuan@vivo.com>
 <46fc455c-385c-44fb-b194-0fd046f6d21c@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46fc455c-385c-44fb-b194-0fd046f6d21c@canonical.com>
Received-SPF: pass client-ip=178.63.66.53; envelope-from=serge@mail.hallyn.com;
 helo=mail.hallyn.com
Subject: Re: [apparmor] [PATCH v1] security/apparmor: remove duplicate
 unpacking in unpack_perm function
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
Cc: opensource.kernel@vivo.com, Paul Moore <paul@paul-moore.com>,
 Shen Lichuan <shenlichuan@vivo.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Sep 09, 2024 at 11:57:05PM -0700, John Johansen wrote:
> On 8/21/24 00:22, Shen Lichuan wrote:
> > The code was unpacking the 'allow' parameter twice.
> > This change removes the duplicate part.
> > 
> > Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> 
> NAK, this would break the unpack. The first entry is actually a reserved
> value and is just being thrown away atm. Instead of double unpacking to
> perms->allow we could unpack it to a temp variable that just gets discarded

Heh, I recon this should probably be documented in a comment? :)
> 
> 
> > ---
> >   security/apparmor/policy_unpack.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> > index 5a570235427d..4ec1e1251012 100644
> > --- a/security/apparmor/policy_unpack.c
> > +++ b/security/apparmor/policy_unpack.c
> > @@ -649,7 +649,6 @@ static bool unpack_perm(struct aa_ext *e, u32 version, struct aa_perms *perm)
> >   		return false;
> >   	return	aa_unpack_u32(e, &perm->allow, NULL) &&
> > -		aa_unpack_u32(e, &perm->allow, NULL) &&
> >   		aa_unpack_u32(e, &perm->deny, NULL) &&
> >   		aa_unpack_u32(e, &perm->subtree, NULL) &&
> >   		aa_unpack_u32(e, &perm->cond, NULL) &&
> 

