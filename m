Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ADA83F07E
	for <lists+apparmor@lfdr.de>; Sat, 27 Jan 2024 23:09:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rTqrP-0005iN-2g; Sat, 27 Jan 2024 22:09:11 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1rTqrL-0005iD-No
 for apparmor@lists.ubuntu.com; Sat, 27 Jan 2024 22:09:07 +0000
Received: from [192.168.192.85] (unknown [50.39.103.33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id D63DD3F27C; 
 Sat, 27 Jan 2024 22:09:05 +0000 (UTC)
Message-ID: <54357df6-693d-4575-acf7-d95680b6358e@canonical.com>
Date: Sat, 27 Jan 2024 14:09:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Salvatore Bonaccorso <carnil@debian.org>,
 Mathias Gibbens <gibmat@debian.org>, 1050256@bugs.debian.org,
 John Johansen <john@apparmor.net>
References: <da160344-8135-4eab-9261-bb1552238ad3@debian.org>
 <8f68c83b-1856-4fa2-8408-06ae36696698@debian.org>
 <8f68c83b-1856-4fa2-8408-06ae36696698@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <38461b24-1b42-45f7-98d6-e6e353c0d203@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <ZXDsAecCKiSuHsO2@eldamar.lan> <ZZA69zQAzpzPojD5@eldamar.lan>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <9d6a5b2368016e2ef7b11c64b7c9db69419318ec.camel@debian.org>
 <ZbTLCN8zi8xZ4KsG@eldamar.lan>
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <ZbTLCN8zi8xZ4KsG@eldamar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] Bug#1050256: AppArmor breaks locking non-fs Unix
	sockets
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
Cc: pkg-systemd-maintainers <pkg-systemd-maintainers@lists.alioth.debian.org>,
 apparmor@lists.ubuntu.com, Antonio Terceiro <terceiro@debian.org>,
 Harald Dunkel <harri@afaics.de>, Paul Gevers <elbrus@debian.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 1/27/24 01:21, Salvatore Bonaccorso wrote:
> Hi John,
> 
> On Sun, Dec 31, 2023 at 04:24:47AM +0000, Mathias Gibbens wrote:
>> On Sat, 2023-12-30 at 16:44 +0100, Salvatore Bonaccorso wrote:
>>> John, did you had a chance to work on this backport for 6.1.y stable
>>> upstream so we could pick it downstream in Debian in one of the next
>>> stable imports? Cherry-picking 1cf26c3d2c4c ("apparmor: fix apparmor
>>> mediating locking non-fs unix sockets") does not work, if not
>>> havinging the work around e2967ede2297 ("apparmor: compute policydb
>>> permission on profile load") AFAICS, so that needs a 6.1.y specific
>>> backport submitted to stable@vger.kernel.org ?
>>>
>>> I think we could have people from this bug as well providing a
>>> Tested-by when necessary. I'm not feeling confident enough to be able
>>> to provide myself such a patch to sent to stable (and you only giving
>>> an Acked-by/Reviewed-by), so if you can help out here with your
>>> upstream hat on that would be more than appreciated and welcome :)
>>>
>>> Thanks a lot for your work!
>>
>>    I played around with this a bit the past week as well, and came to
>> the same conclusion as Salvatore did that commits e2967ede2297 and
>> 1cf26c3d2c4c need to be cherry-picked back to the 6.1 stable tree.
>>
>>    I've attached the two commits rebased onto 6.1.y as patches to this
>> message. Commit e2967ede2297 needed a little bit of touchup to apply
>> cleanly, and 1cf26c3d2c4c just needed adjustments for line number
>> changes. I included some comments at the top of each patch.
>>
>>    With these two commits cherry-picked on top of the 6.1.69 kernel, I
>> can boot a bookworm system and successfully start a service within a
>> container that utilizes `PrivateNetwork=yes`. Rebooting back into an
>> unpatched vanilla 6.1.69 kernel continues to show the problem.
>>
>>    While I didn't see any immediate issues (ie, `aa-status` and log
>> files looked OK), I don't understand the changes in the first commit
>> well enough to be confident in sending these patches for inclusion in
>> the upstream stable tree on my own.
> 
> Do you had a chance to look at this for 6.1.y upstream?
> 
> Asking/Poking since the point release dates are now clear:
> 
> https://lists.debian.org/debian-security/2024/01/msg00005.html
> 
> if possible I would like to include those fixes, but only if they are
> at least queued fror 6.1.y itself to not diverge from upstream.
> 
> Otherwise we will wait another round, but which means usually 2 months
> for the point release cadence.
> 
I am looking at it right now, I should be done with it today


