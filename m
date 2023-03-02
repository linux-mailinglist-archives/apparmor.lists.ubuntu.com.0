Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AB36A7D05
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 09:46:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXeaJ-0005cX-7P; Thu, 02 Mar 2023 08:46:43 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pXeaH-0005c0-Ta
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 08:46:41 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A2D053F26A; 
 Thu,  2 Mar 2023 08:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1677746801;
 bh=caE+kNcEJWzDE/YkdGD7zv64SzgnY0nw1rKw/86EtPE=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=YFDTIwa7Kh9rbgtIPk2BWC6649YifSvqWqGj9w2irAiOiBKyuIjKaqc6BpErnAgJP
 Gac9JUHRX0m04CwkFB7wdVMkvBqefkudUYkyBCMur4fVel40mp/rjSr0QvKfOxkhS8
 GL5Rk5D/guNyr5wklsM+pLCutqm5bGMPX9pquPV7upRQ1/Ths7YkBI35xFmOkKDZDJ
 TIliZQxAyDhzjFDACS5hCGXV25CRJLO4pYB7WwBi3471bJVnLScBC5GMcFFlxZmG+a
 2VO7zDPGjHt/PbO3/GPn3PFa5mkpG0kwYi/xHtBndFaH4Q8PTIAIVLQVBvYrryuD/A
 DFR+xL1y3l7YA==
Message-ID: <f98a3146-43e3-4878-f8d2-7416c8b1099d@canonical.com>
Date: Thu, 2 Mar 2023 00:46:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: ransel@slack-corp.com, apparmor@lists.ubuntu.com
References: <CAAfSbpbEqwd3HyMRp0+pzMW3eLr_EVzJasDZPB+s5zf3t0BUOg@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <CAAfSbpbEqwd3HyMRp0+pzMW3eLr_EVzJasDZPB+s5zf3t0BUOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] Help debugging a confusing Full System Policy error
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

On 3/1/23 11:55, Robert Ansel wrote:
> Hello,
> 
> I'm looking for some help sorting out an apparmor conundrum.
> 
> We're following the Full System Policy approach described here <https://gitlab.com/apparmor/apparmor/-/wikis/FullSystemPolicy>. It's been working fine on Ubuntu 18.04, and we're working on an upgrade to 22.04, but when we try to apply the same profile and initramfs build method on 22.04 it fails to attach to PID 1 systemd.
> 

This method is no longer recommended, and there may be some revisions to initramfs tooling that is needed.

We now recommend using early policy load in systemd see https://gitlab.com/apparmor/apparmor/-/wikis/AppArmorInSystemd


> The method we're using now on 18.04 is essentially exactly what's being described on the wiki, except that, as described in the last bullet of the Troubleshooting section, we first install a stub profile and policy at boot, with the attach_disconnected flag, followed by initial configuration/chef-runs that quickly update that stub profile with the detailed allowlist for the host.
> 
> On 18.04 our profile is attached to /lib/systemd/systemd, but we weren't seeing success on 22.04 so we tried migrating it to /usr/lib/systemd/systemd to account for the symlink at `/lib` and provide the normalized path, but what we're seeing is that PID 1 is still unconfined on the host and the only thing being confined by our policy is the `systemd --user` process with another PID, which obviously doesn't act as a Full System Policy.
> 
> Wondering if you've seen this before or if you have any ideas to help debug why PID 1 isn't getting the profile, despite being launched at the same path from the same initramfs.
> 
I haven't but it has been years since I tried using the initramfs to apply policy.

> Thanks for any assistance you can provide and happy to come up with any extra debugging information you might find useful.
> 
> - Ransel
> 
> -- 
> 
> ---
> Robert S. Ansel


