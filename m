Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AF462CAE0
	for <lists+apparmor@lfdr.de>; Wed, 16 Nov 2022 21:31:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ovP45-0005F4-E9; Wed, 16 Nov 2022 20:31:21 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1ovP43-0005Et-ER
 for apparmor@lists.ubuntu.com; Wed, 16 Nov 2022 20:31:19 +0000
Received: from [192.168.192.83] (unknown [50.47.159.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 9039041D20; 
 Wed, 16 Nov 2022 20:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1668630679;
 bh=8Z5ZxmjHxwsEJrYU9YdE/iUAC4+zm2psM/IA7wP4lgU=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=E8HIeGPKZeCfCR06odSkg3b2BGfzTEzqQqgVy95ZN7ZNHHoihZxwRi4kELGv4cptx
 fi0u/rknz1PLUdNXHWHuZxP7mxsIjF27makWJEIaEE+w+VWBVN+bcIjgWyxNFEow9h
 AHh/b3JEDaEF9qEX4krGheTZgiSsCzVY3utA2qtW2ErdTKxQGCnys3hYqu1+H9NM8N
 3k8ZDoDdVgsc0c0kDn7gAtnt4QWKFqiAlvAmmGnNaTCKwSm8roCBJyK+3vzwdqmvRy
 2wjbpibeMMXJ2qRyrWvjbI3TAAehLNECug1qDgYscNZe2bdMyC+4tHtXL8tukZGnOj
 axUQpTQzXCf4g==
Message-ID: <cc664f3b-cb4f-51a6-f3f5-5df2313c3c00@canonical.com>
Date: Wed, 16 Nov 2022 12:31:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: janko metelko <janko.itm@gmail.com>, apparmor@lists.ubuntu.com
References: <CAHRxeQ0Mf-mWnNGS1vGa0NMB-=dBvsweaQ-xPkibxC1VNmLmcg@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <CAHRxeQ0Mf-mWnNGS1vGa0NMB-=dBvsweaQ-xPkibxC1VNmLmcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] any way of denying profiled executable(s) to be ran
 at all
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

On 11/16/22 11:59, janko metelko wrote:
> Thank you for making AppArmor, if any of the developers are here. I am not a security guy, but such a solution seems like it should or will become an absolute must-use for any application deployment, locally or on a server.
> 
> I have a question. I want to make a profile that prevents execution of any file from user-writable directories like /home /tmp, *except* if the executable has a AA profile.
> 
> This would effectively mean that the user (or user level process) can't (knowingly or unknowingly) "install" and run anything that wasn't "confirmed" by root.
> 
> It seems I can do this by creating an empty profile for /home/** which denies everything and then creating separate AA profiles for specific executable files inside /home that I allow to run.
> 
> If I understand it right, all executables in /home without profiles will in this case crash or at least can't do any side effects since they are blocked from all IO/shared libs/configs/etc. In practice, they will probably just crash. It would be much nicer experience if such apps would be prevented to run, not start and crash.
> 
> But I can only find directives in AA, that limit or allow certain resorces to the executable, and no directive, that would prevent executable to be ran in the first place.
> 
> Is there any such solution? Am I maybe looking at it all wrong? Should I do this on another level, not with AppArmor?
> 
> *Example*
> 
> Maybe stupid example, but still. Let's say I want to prevent non-root users or RCEs from wget-ing into any other directory other than /tmp. I can simply create a profile for /usr/bin/wget { ... /tmp w, } and the job is done. But user/RCE can then simply do cp /usr/bin/wget ~/mywget and use wget for whatever it wants. If we prevent execution of non-profiled executables in user writable directories then he/it can't do that and our primary objective stands.
> 
> I hope it makes some sense ... Thank you again. Ubuntu rocks also, and Xubuntu! :)
> 

So lets split this into two cases.
1. Executing an application when confined
2. Executing an application when unconfined

there are some differences so it is worth covering

1. Executing an application when confined

When an application is confined all execs are covered by the profiles domain transition rules. Those rules require a qualifier to determine what should be done at exec.
ix - inherit
px - transition to a profile if it exists, otherwise FAIL the exec
cx - transition to a child profile if it exists, otherwise FAIL the exec
ux - transition to unconfined

there are currently a set of fallback options available instead of failing the exec
pix, cix - transition to profile if it exists, otherwise inherit current confinement
pux, cux - transition to profile if it exists, otherwise transition to unconfined.

you can also explicitly deny an exec with a deny rule

   deny x /tmp/*,  # no need for a qualifier on deny rules


So in this case there are a few ways to deny at exec time instead of crashing


2. Executing an application when unconfined

This case is the currently problematic one. Where unconfined tasks essentially use an exec rule of

   pix /**,

meaning no exec will fail, it will either transition to a defined profile or allow the exec to continue as unconfined.

Currently the only way to deal with this is indeed create a "trap" profile that doesn't grant permissions, causing the application to fault after exec

profile trap /tmp/** {
   # no permissions.
}


Obviously this is less than satisfactory. Ideally to avoid this you would be in situation #1, but the reality is that this just isn't how apparmor has been deployed and not all user tasks are confined.


There is work going on to fix this, but it has not landed as of upstream kernel 6.1 or Ubuntu 22.10. When it lands (hopefully 23.04) you will be able to specify attachments that should be denied. Instead of having to create a trap profile. It will be a rule similar to what is in the profile.

   deny x /tmp/**,

and will have the longest left match prioritization, that attachments currently have. That is

   deny x /**,

would stop execution of anything that didn't have a profile defined. But since
   profile example /bin/foo { }

has a more specific attachment match it would take priority and allow exec under that profile.


