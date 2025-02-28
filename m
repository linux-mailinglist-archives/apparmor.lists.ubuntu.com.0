Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 01159A4A99E
	for <lists+apparmor@lfdr.de>; Sat,  1 Mar 2025 09:05:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1toHqo-0003Wy-T9; Sat, 01 Mar 2025 08:05:34 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <valoq@mailbox.org>) id 1to61h-0001hh-Pc
 for apparmor@lists.ubuntu.com; Fri, 28 Feb 2025 19:28:01 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Z4JC32Xd5z9sHh;
 Fri, 28 Feb 2025 20:27:59 +0100 (CET)
Date: Fri, 28 Feb 2025 20:27:54 +0100
From: valoq@mailbox.org
To: John Johansen <john.johansen@canonical.com>
Message-ID: <Z8IOOtTTX_S1bikS@mailbox.org>
References: <ZyONOXXSHjV2zfJU@mailbox.org>
 <6335362c-28f2-48ae-bdcc-8ab04de9b69d@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6335362c-28f2-48ae-bdcc-8ab04de9b69d@canonical.com>
X-MBO-RS-META: moyyx7euk97ue1cjd9i3bxhe47hxbmyq
X-MBO-RS-ID: c78ef5b4c4f5e65ad2d
Received-SPF: pass client-ip=80.241.56.151; envelope-from=valoq@mailbox.org;
 helo=mout-p-101.mailbox.org
X-Mailman-Approved-At: Sat, 01 Mar 2025 08:05:33 +0000
Subject: Re: [apparmor] Restricted userns
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hello John,

can you give us a quick update on the status of this restricted userns feature? Did it
make it into kernel 6.14 and if not when would it currently be expected.

Thank you

On Thu, Oct 31, 2024 at 07:54:04AM -0700, John Johansen wrote:
> On 10/31/24 06:59, valoq wrote:
> > Ubuntu added a patch last year to allow user namespaces only for processes
> > confined by apparmor and allegedly the kernel patch for this feature made
> > it into the upstream kernel as well, but there seems to be no documentation
> > available about it. Additionaly, apparmor now includes default profiles
> > with the userns permission making use of this feature, but there is no
> > documentation about the requirements of this feature.
> > 
> As implemented in Ubuntu, there are three parts.
> 1. for an application to use user namespaces the application must be confined
>    by a profile, that explicitly allows the use of user namespaces.
> 2. when enabled, unconfined is not allowed to use unprivileged user namespaces.
> 3. apparmor enables a policy var via sysctl on boot. It was done this way for
>    two reasons.
>    a. So that new kernels could be taken back to old releases and not break
>       them with the feature being turned on by default in the kernel.
>    b. So that the feature could be turned on, on older releases without
>       having to have an updated apparmor userspace to enable the feature
>       in policy.
> 
> > How can this feature actually be used on other linux distributions and
> > vanilla linux kernels? It seems like
> > kernel.apparmor_restrict_unprivileged_userns is not available outside of
> > ubuntu and most similar flags appear undocumented as well.
> > Is support for restricted userns actually available outside of ubuntu?
> > 
> 
> Currently it is not.
> 
> The ability to mediate userns creation in profiles landed in 6.7.
> 
> The 2 and 3rd parts have not landed upstream yet. This is largely because
> the Ubuntu patches hard code the behavior where for upstream we want the
> behavior to be properly part of policy.
> 
> There is a patch to extend the current mediation that is a requirement
> for parts 2/3 that I will try to post out this week. The other parts
> I still need to evaluate. But I don't think landing full support for
> is possible for 6.13. So I am currently planning to try and land full
> support in 6.14.
> 
> 

