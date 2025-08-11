Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EF83EB204AC
	for <lists+apparmor@lfdr.de>; Mon, 11 Aug 2025 11:59:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ulPIu-0002wU-LP; Mon, 11 Aug 2025 09:58:56 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <valoq@mailbox.org>) id 1ulPIs-0002wB-IV
 for apparmor@lists.ubuntu.com; Mon, 11 Aug 2025 09:58:54 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c0qpg1FH9z9srT;
 Mon, 11 Aug 2025 11:58:51 +0200 (CEST)
Date: Mon, 11 Aug 2025 11:58:48 +0200
From: valoq <valoq@mailbox.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <aJm-2Hj9_7woDXBd@mailbox.org>
References: <aJiPtAhLY2esOAkC@mailbox.org>
 <de1c49d7-4033-4091-b190-46a82f6b4a92@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de1c49d7-4033-4091-b190-46a82f6b4a92@canonical.com>
X-MBO-RS-ID: e77d6edd4fd54239c54
X-MBO-RS-META: mfzi5y9izz9kr8i5nrjkg8prji54see1
Received-SPF: pass client-ip=80.241.56.152; envelope-from=valoq@mailbox.org;
 helo=mout-p-102.mailbox.org
Subject: Re: [apparmor] Upstream kernel socket path isolation
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

On Sun, Aug 10, 2025 at 02:56:13PM -0700, John Johansen wrote:
> On 8/10/25 05:25, valoq wrote:
> > Recently I have been testing apparmor process isolation and came across different behaviors in regards to socket isolation, especially in regards to socket file path filtering.
> >  From what I have gathered, the documented features in apparmor are only enforced with a kernel fully patched with all apparmor features, like what ubuntu implements.
> > Which means that all other linux distributions out there are currently not providing any effective process isolation through apparmor since escape path like socket communication is wide open. (the base abstraction commonly
> > +included allows sockets and there is no file path filter implemented in distro kernels other then ubuntu)
> 
> yes the base abstraction is problematic. It is something I would like to kill but that is harder said than done
> 
> > If I understand it correctly, the recently added aa patches for linux 6.17 will bring this feature for everyone but I would like to know if this is actually the correct assumption and if starting with kernel 6.17 the
> 
> It will for unix sockets, if you are using a version of apparmor that supports the new abi. Because unix sockets cross both socket, and file mediation and are done the way they are in the kernel, there was no way to land ubuntu's version in the kernel without breaking existing policy for non-ubuntu systems. Policy will have declare it is using the new abi, and existing unix policy rules should work, but there are some cases where there may need to be a tweak to the rules. The tweak is that the new unix socket is slightly stricters, when shared across processes, so the rules are backwards compatible and will work on an ubuntu system using the older af_unix mediation (that is it can be downgraded transparently).

There is curently a rather popular project on github that provides many aa profiles. https://github.com/roddhjav/apparmor.d
I assume this already includes the new abi so only the kernel is missing on most distros?
It was rather surprising to find out how different the upstream kernel handles apparmor, especialy since there is no mention of this in any official distros documentation. I will try to add some warning to the wikis about the kernel requirements for effective isolation since it seems like many distros advertise apparmor despite the trivial escape path through unix domain sockets. Thank you for the work on bringing this into the mainline kernel

> 
> Fine grained inet/inet6 mediation is still a wip, we plan to post the current patches up for review, but it is unlikely that they will land for 6.18, those will be more likely 6.19. Fine grained mediation of other socket types like netlink are something for future improvement atm.

This is for filtering specific domains or network interfaces? This is not strictly required to prevent sandbox escape though, correct?

> 
> > +upstream linux kernel actually does include all required patches to provide effective isolation. Perhaps someone could point out where the differences between upstream kernel and ubuntus/apparmor kernel are documented?
> > 
> there is some info in the upstream wiki, the biggest issue is it hasn't been kept up to date.
> 
> > 
> > During my dive into apparmor I also noticed two possible bugs or at least strange behaviors that I wanted to point out/have checked:
> > 
> > 1.
> > If a profile has an include statement like:
> > include <abstractions/base>
> > and the profile is edited to comment out this line with a single # like this:
> > #include <abstractions/base>
> > then the single # is ignored and the include is interpreted anyway.
> > Only when several ## are put before the include or there is a space in between will the line be effectively commented out. Is this intentional?
> > 
> 
> sadly yes. its a historical artifact. When includes where first added, they were add to look like C includes (a mistake), and using the # was also considered "good" as it allowed them to be added to policy without breaking older versions of apparmor. If you put a space between the # and include it becomes a comment, if use double # (ie. ##) its a comment. Its unfortunate that it still persists but there is still too much policy using it.
> 
> It has been officially deprecated upstream, but that means its still not removed for another 5 years

Perhaps we can get that removed or at the very least create a warning in the logs about it? Took me a few hours to figure this out and I will likely not be the only one


> > Im not sure there is any critical use case to exploit this, but at the very least it allows to probe for the existance of any file in the filesystem without aa permissions and reveal its metadata, which seems to contradict
> > +the MAC model.
> > 
> it does, and we will improve here but won't be able to do a perfect job. The Linux kernel doesn't allow the LSM to full hide the existence of files. Its really unfortunate, but we can certainly do better.

Doesn't the landlock lsm do exactly that? Perhaps there is a way to use the same method in apparmor


On an unrelated note: Has the patch for user namespace filtering made it into the kernel yet? I havent seen any news about it recently.

Regardless, I am very grateful and happy about the work and progress with apparmor, so thank you.

