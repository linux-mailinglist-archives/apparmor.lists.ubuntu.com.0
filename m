Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B4E67BA23
	for <lists+apparmor@lfdr.de>; Wed, 25 Jan 2023 20:03:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pKl3i-0008CP-Pe; Wed, 25 Jan 2023 19:03:46 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pKl3h-0008CF-72
 for apparmor@lists.ubuntu.com; Wed, 25 Jan 2023 19:03:45 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C883D3F177; 
 Wed, 25 Jan 2023 19:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1674673422;
 bh=Thxu7wCJTD4AQTlmskClf+PSQB1C5XpNLtAANXAh+9Y=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=SxzmkrNU/SOMiBy9UexwwqZ2oni9YQNfEcZTW12bsx7ftP8kQzaa9VHhYhMTMm3K2
 GqYMBAgWFlwjJbpAdqf/6f1nVCOEAF2/2ZqDLxZyb4UU2p3tV+jZ609147BOZy8POa
 R0BC4As8y1xx+KzQI1e5FBKk2CLJ0DbTfqVT6qtFtgWj+9hKWNcF9hKQiNudsMFpw1
 l1uNlurTjtyu8MnWHhG8bCojW2Y3OSNG1cJuYgntUgxWurJTR1cXv8YODm+aZP6IH1
 n9ItGoqUdt5YLvS/J6qfwLfEs/Qu6GT9DvDqy21BZz3mCvPfHOMYOzEr0Qxz6d3R5P
 yKhxLePXpWIDw==
Message-ID: <f45abb2d-beab-2b84-916e-43a64fa4ef48@canonical.com>
Date: Wed, 25 Jan 2023 11:03:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>,
 Christian Boltz <apparmor@cboltz.de>, apparmor@lists.ubuntu.com
References: <CAODFaZ7JFh28gax0rdqfSh_OiBG5M+Ny8OG0KTt0dtQFakKPAA@mail.gmail.com>
 <2131651.irdbgypaU6@tux.boltz.de.vu>
 <CAODFaZ6FDOGi1OsET1BjWVY6hfFmmHD+gwHL0=3rVnfaeUc2uw@mail.gmail.com>
 <2270135.ElGaqSPkdT@tux.boltz.de.vu>
 <CAODFaZ52Y0unjbWZWUZEr5EX74M+SMDv8PFOuFXk2OkHuLZ4mQ@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <CAODFaZ52Y0unjbWZWUZEr5EX74M+SMDv8PFOuFXk2OkHuLZ4mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] Apparmor: global profile queries
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

On 1/25/23 10:49, Murali Selvaraj wrote:
> Hi Christian,
> 
> Thanks for the explanation.
> 
> My requirement is to find a way to avoid/block the script (sh /tmp/foo.sh) execution  from directories like (/tmp/).
> However I am unable to meet this requirement using the profile below.
> 
> cat bin.sh
> profile sh_restriction /bin/sh  flags=(attach_disconnected,complain) {
>    ptrace,
>    signal,
>    capability,
>    /tmp/** r,
>    audit /tmp/** x,
>    / r,
>    /** rwixkml,
> }
> 

> If I update the line *audit /tmp/** r, *I am able to get all the read operations in /tmp/.
> Do we have any options to get ONLY execute operations (*sh /tmp/foo.sh*) from the list ( without audit "read" operation logs ).
> 

sadly this isn't supported atm. It has been something we have wanted for a long time but is tricky from an LSM pov. There are some proposed ways of dealing with this that may be acceptable upstream (Linux kernel) but until we get that resolved we can't land this in apparmor.

The goal is to get to something like

   profile /tmp/* interpreter=/bin/bash { ... }

this would allow for a trap profile (a profile with no permissions) to stop such executions. But there is also work on having deny entries for attachments. ie.

   deny /tmp/* interpreter=/** { ... }

which would allow a straight denial instead of a trap profile


> audit: type=1400 audit(1674669489.761:6): apparmor="AUDIT" operation="open" profile="sh_restriction" name="/tmp/foo.sh" pid=8910 comm="sh" requested_mask="r" fsuid=0 ouid=0
> 
> Please share your inputs.
> 
> Thanks
> Murali.S
> 
> On Wed, Jan 25, 2023 at 7:56 AM Christian Boltz <apparmor@cboltz.de <mailto:apparmor@cboltz.de>> wrote:
> 
>     Hallo,
> 
>     Am Mittwoch, 25. Januar 2023, 03:44:59 CET schrieben Sie:
>      > Thanks for the details. I have created a profile for /bin/bash to add
>      > a restriction to run the script in /tmp using sh /tmp/foo.sh.
>      > For testing purposes, I added an audit as follows but it is NOT
>      > working as expected.
> 
>     I'd argue it _does_ work as expected ;-)
> 
>      > profile bash /bin/bash.bash  flags=(attach_disconnected,complain) {
>      >   ptrace,
>      >   signal,
>      >   capability,
>      > *  audit /tmp/** ix,*
> 
>     So you still only audit execution, but "sh /tmp/foo.sh" only _reads_ the
>     script. Add
> 
>          audit /tmp/** r,
> 
> 
>     BTW: If you have more questions, please answer on the mailinglist again.
> 
> 
>     Regards,
> 
>     Christian Boltz
>     -- 
>     each feature contain at least one bug :)
>     [Josef Reidinger in yast-devel]
> 


