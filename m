Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FF5EBD14
	for <lists+apparmor@lfdr.de>; Tue, 27 Sep 2022 10:19:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1od5og-0007Dk-76; Tue, 27 Sep 2022 08:19:46 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1od5oe-0007Dc-J1
 for apparmor@lists.ubuntu.com; Tue, 27 Sep 2022 08:19:44 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id B7DB33F123; 
 Tue, 27 Sep 2022 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1664266783;
 bh=l5nqe7dVp1VLZxwcBGqaHP2dvct0JZjADpEwiCSaRUI=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=fRbl4SJKIuoJAfDOiYtJVH5eRPb3fE8bo3hLUlbnn+HU+/nzn6NWBm0Gtb3DRNejQ
 XlM8FOtMSTCPBnyRG8xlbH9xX55tAVlT6SxT3Cfp6GEcAoaDXimFL1LwsIlyfE0lzq
 XPpQVQEQq8eVXC992zuN0MQjDRmY3nTVOh/ncklG8t8Hi+wnPwFIIl/wkUev5vUyBd
 2RjOv0HhpMPub+ycaBB0C0HZPB7HkZmIq4FuTEvDodVSv0WoyCxn/8EmjNF/0GVQLa
 nK3mGOfgiCXvgSUhkBaCIflLNgzOEaEm0sQlnl6hFxADwtR/Iiag9UcUEqSux3BTAS
 1toTpufuAF/qg==
Message-ID: <06ef4654-5a14-9a21-0ac8-2666d56bd27b@canonical.com>
Date: Tue, 27 Sep 2022 01:19:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: intrigeri <intrigeri@debian.org>, apparmor@lists.ubuntu.com
References: <87edvxl039.fsf@manticora>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <87edvxl039.fsf@manticora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] Which version for Debian 12 ("Bookworm")?
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 9/27/22 00:59, intrigeri wrote:
> Hi,
> 
> Debian testing/sid currently has AppArmor 3.0.7.
> 
> Debian testing will be frozen in February 2023,
> in preparation for the Debian 12 ("Bookworm")
> release.
> 
> I'm wondering whether I should upload 3.1.x to Debian.
> 
honestly, I wouldn't bother

> I see no release notes for 3.1.x on the website and it's hard for me

sadly I haven't had time to get to them, and neither has anyone else.
They will come because like you said digging into the git log is
not a great experience

> to make sense of the Git log, considering much of the changes were
> also merged into 3.0.x.
> 
yes many of the bug fixes have been landed in 3.0.x, it does have
some feature development but I wouldn't call it a major release in
that sense.

The goal was to release a large release this fall. Unfortunately
there just hasn't been time and the decision was made to release 3.1
with all the bug fixes plus a few new features.

> I understand Ubuntu decided *not* to upgrade to 3.1.x in their
> upcoming release (Kinetic, 22.10), but instead backport some of the
> 3.1.x changes to 3.0.x.
> 
correct, unfortunately the FFe process has just taken too long and
no one has had time to land it

> I guess my question really is:
> 
>   - What are the major benefits of upgrading to 3.1.x?

primarily some improvements in genprof/logprof

> 
>   - When can we expect the 3.1.x series to be stable and polished
>     enough to deserve being included in a LTS distro release?
> 
with it not landing in 22.10, I don't know that it will. We
plan to land 4.0 in 23.04. That will have some larger features
to call.
- support for the new extended permissions
- support for namespace mediation
- support for fine grained posix (and hopefully sys V) mediation
- support for policy overlays
- support for config overlays
- improvements to aa-status
- support for prefixes on parsing
- support for text policy in kernel
- support for zstd compression
- possibly support for a new ioctl query interface which would half the kernel part of the overhead for dbus mediation
- possibly support for boolean rule operations
- possibly support for some inheritance syntax
- support for user conditional
- support for change_profile with return

and well there is possibly more. So when will it land? Hopefully in December, whether it will be ready (stable enough) for Bookworm in February is an open question. But my guess is its actually release will be pushed into late January as there are some things we must land for it and so likely not.

