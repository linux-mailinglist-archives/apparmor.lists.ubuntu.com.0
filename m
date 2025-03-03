Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F1870A4B926
	for <lists+apparmor@lfdr.de>; Mon,  3 Mar 2025 09:24:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tp16W-000205-Fg; Mon, 03 Mar 2025 08:24:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1tp16U-0001zv-Gh
 for apparmor@lists.ubuntu.com; Mon, 03 Mar 2025 08:24:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 862E55C4645;
 Mon,  3 Mar 2025 08:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B47C4CED6;
 Mon,  3 Mar 2025 08:15:25 +0000 (UTC)
Date: Mon, 3 Mar 2025 09:14:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <2025030339-playset-august-055b@gregkh>
References: <7286c87d1ad7b705d123f23ad213ec40a9f23351.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7286c87d1ad7b705d123f23ad213ec40a9f23351.camel@decadent.org.uk>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=gregkh@linuxfoundation.org; helo=dfw.source.kernel.org
Subject: Re: [apparmor] CVE-2024-56741: apparmor: test: Fix memory leak for
 aa_unpack_strdup()
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
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, apparmor@lists.ubuntu.com,
 linux-kselftest@vger.kernel.org, cve@kernel.org, kunit-dev@googlegroups.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, Mar 02, 2025 at 06:36:35PM +0100, Ben Hutchings wrote:
> Hi all,
> 
> CVE-2024-56741 is supposed to be fixed by commit 7290f5923191 "apparmor:
> test: Fix memory leak for aa_unpack_strdup()" but I think this
> assignment should be rejected.
> 
> While a user-triggered memory leak may be exploitable for denial-of-
> service, the code that was fixed here is a part of KUnit tests.
> KUnit tests usually run a single time at boot, not under user control,
> and can then later be invoked through debugfs by the root user.
> 
> Firstly, it is intended that the root user can deny service through the
> reboot system call, so I don't think additional ways to do this are
> security flaws.
> 
> Secondly, the KUnit documentation at <https://docs.kernel.org/dev-
> tools/kunit/run_manual.html> says:
> 
>     Note:
> 
>     KUnit is not designed for use in a production system. It is possible
>     that tests may reduce the stability or security of the system.
> 
> so I don't think security issues in KUnit tests generally deserve CVE
> IDs.  (That said, the help text for CONFIG_KUNIT does not have such a
> warning.)

Now rejected.

While I know that kunit says "do not use in production", that flies in
the face of a few hundred million devices out there that does have kunit
running on them, so we need to still track these, sorry.

Also, for systems where "root is locked down" preventing it from running
`reboot`, it can many times do other things, like poke around in
debugfs, so we need to track them as well.  In other words, we don't
know your use case :(

thanks,

greg k-h

