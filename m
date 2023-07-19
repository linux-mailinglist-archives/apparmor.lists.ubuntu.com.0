Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D09667592EA
	for <lists+apparmor@lfdr.de>; Wed, 19 Jul 2023 12:26:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qM4Nz-0006kE-GN; Wed, 19 Jul 2023 10:26:23 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qM4Nx-0006g2-5m
 for apparmor@lists.ubuntu.com; Wed, 19 Jul 2023 10:26:21 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id BB0AF3F8E2; 
 Wed, 19 Jul 2023 10:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1689762380;
 bh=1SA3g3ZgVeozSrgi0EDhzpkhqXJRuV6AyMU3I5WhAQY=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=iepQmyCRBC/2TTHPxrtkdZk9QP/lTHmbn3hZolN5MpBIM3IXW5A1nZdlV000MQCEQ
 /AQPdelEO1VpO9ylo13JVcu8Vipav5LTUBi+/nwkce2K9zEvRgdaxJflxL6beWUadu
 wzrgIsMxtFceubK0AiiLBzZdGOsp3Cd18DXgcv3jzfKVrSE68DYq8z5M8iOrgokakf
 88k+Ix5I5rcGo6FYQXKLJpA0cII32iALcRoqA2rj0kFFe2azPMWyhr2ksX8IOIh1Pj
 Xop4IYuzpin7jKOH92qsHYTLe1oQ+6TYILDaxz17clz95VnuSRSiYh0+PARFrBSzyr
 NhJn+g/NxjM9A==
Message-ID: <d1f7951d-38a9-3018-ff2d-7ae8c05d85dd@canonical.com>
Date: Wed, 19 Jul 2023 03:26:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Alexandre Pujol <alexandre@pujol.io>, apparmor@lists.ubuntu.com
References: <2668c644-f67d-21aa-6b97-1ed61471fcea@pujol.io>
 <fccec1fb-b421-a532-5ee3-027f94b836fc@canonical.com>
 <7c1b20c5-07a4-cc05-27f6-29e910142e3c@pujol.io>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <7c1b20c5-07a4-cc05-27f6-29e910142e3c@pujol.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] apparmor with large profile set
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

On 7/18/23 03:12, Alexandre Pujol wrote:
> Hi,
> 
> On 18/07/2023 03:02, Seth Arnold wrote:
>  > What exactly do you mean with "the doc"? The wiki has a lot of syntax
>  > and semantics around future expansion plans and I've seen dozens, if not
>  > hundreds, of questions from people who found it and tried to use it on
>  > live systems, without success.
> 
> I was doing reference in the wiki in general and in the policy reference in particular as I am part of the people that tried stuff from it without success ;)
> 
> I could work myself on improving it, however I am not myself aware of what is already here or planned. I may have a look at the man page next time, that could save me some time.
> 
> 
> On 18/07/2023 05:01, John Johansen wrote:
>>
>> Jul 10 11:51:22 aa-archlinux-gnome gnome-shell[1754]: AT-SPI: Error retrieving accessibility bus address: org.freedesktop.DBus.Error.NoReply: Did not receive a reply. Possible causes include: the remote application did not send a reply, the message bus security policy blocked the reply, the reply timeout expired, or the network connection was broken.
>>
>>
>> And org.freedesktop.systemd1 seems to be an issue, while the non-apparmor log has some failures it successfully starts the service as part of the session
>> Jul 10 11:52:48 aa-archlinux-gnome dbus-daemon[439]: [session uid=120 pid=439] Successfully activated service 'org.freedesktop.systemd1'
>> Jul 10
>>
>> the apparmor log does not succeed in launching the service, throwing up about 10 more errors around it than the non-apparmor log
>>
>> nothing definitive but some avenues to research
>>
> 
> The weird thing is that this is on Archlinux, there is no dbus mediation in place anyway.
> 
being ArchLinux, you could very well have dbus mediation in play ;) but it
doesn't have to be dbus mediation causing the problem. It could be that
some unix socket mediation is blocking access to dbus, etc.

> 
>  > this can't change, it would break policy, even if we update all policy
>  > in the system there is policy being shipping by too many other projects.
>  > For better or worse the apparmor rules are based on shell globbing not
>  > RE or eRE. There is a potential for exposing a full RE with special
>  > syntax. Something like
>  >
>  >    ^/foo[1-7]*$
>  >
> 
> I get that breaking 20 years of profile is not a good thing...
> Adding a new syntax seems a good idea, I wonder how this could be used in variables.
> 
Well, there are a couple of ways, some more problematic than others

the variable could be treated as a straight textual substitution, this
would however mean what it represents would change depending on which
rule it is being used in. Which to me makes it worthless.

Variables expansion could detect which form of expression they are being
expanded in and not allow patterns in the variable when expanding in
an RE. Not ideal but avoids the madness that is the text substitution

Variables could be setup to know the type of expression they contain
and there could be a way to switch between expression forms. Which
would allow mixing them. Its not something you would want to happen
often in a regular rule but it would allow the mixing that would be
needed if we exposed an alternate RE syntax.

Or you force all policy compiled together be in the same syntax. This
is cleaner in some ways but would effectively mean managing two sets
of variables, two policy locations, ...


>  >> **no-new-privs**
>  >>
>  > yeah, another one we need to get upstream. The question has been exactly
>  > what we can get upstream before we make it available more broadly. This
>  > should be coming within the next couple kernel releases.
> 
> Out of curiosity, do you have a kernel somewhere that I could use to test it?
> 

I have had a few, I need to go through and fix a few things, rebase and
get them working again, now that we have extended permissions landed and
don't have to use hacks to smuggle something into the policy. So not yet
but soon

>  >> **Snap**
>  >>
>  > Any where it exists today with get replaced with a variable with
>  > a name that has the semantic intent. It may get set to unconfined, but
>  > it will at least be easier to make changes.
> 
> That a nice idea, do you know when this change will be done?
> 
I was hoping in a couple weeks, but my backlog just seems to keep getting
longer.


