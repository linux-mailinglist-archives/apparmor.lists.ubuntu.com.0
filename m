Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7BBA7A283
	for <lists+apparmor@lfdr.de>; Thu,  3 Apr 2025 14:08:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1u0JND-00017w-Cy; Thu, 03 Apr 2025 12:08:43 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <intrigeri@debian.org>)
 id 1u0JNB-00017i-DB
 for apparmor@lists.ubuntu.com; Thu, 03 Apr 2025 12:08:41 +0000
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.2:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <intrigeri@debian.org>)
 id 1u0JNA-00BNDj-FB
 for apparmor@lists.ubuntu.com; Thu, 03 Apr 2025 12:08:40 +0000
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id AB21B1882BBA
 for <apparmor@lists.ubuntu.com>; Thu, 03 Apr 2025 14:08:39 +0200 (CEST)
Message-Id: <87mscx1m7s.fsf@manticora>
From: intrigeri <intrigeri@debian.org>
To: apparmor@lists.ubuntu.com
In-Reply-To: <d3dbc46d-3c92-4e80-9936-50ea81b5a15d@canonical.com>
References: <87lduexbod.fsf@manticora>
 <9f17f2d5-1fe3-4434-aa68-91b07faf004b@canonical.com>
 <87h63oosud.fsf@manticora>
 <d3dbc46d-3c92-4e80-9936-50ea81b5a15d@canonical.com>
Date: Thu, 03 Apr 2025 14:08:39 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Debian-User: intrigeri
Received-SPF: none client-ip=82.195.75.108; envelope-from=intrigeri@debian.org;
 helo=stravinsky.debian.org
Subject: Re: [apparmor] AppArmor version for upcoming Debian 13 (Trixie)
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

Hi,

John Johansen (2025-03-20):
> On 3/20/25 04:16, intrigeri wrote:
>> Hi,
>> 
>> 4.1.0~beta5 has been in Debian for a few weeks. Looks good so far, we
>> merely had to cope with a few hickups related to userns and the new
>> "unconfined" stub profiles. Congrats for all the work that went into
>> this new series!
>> 
>> My calendar for the next steps is:
>> 
>> 1. March 24-30: AFK
>> 
>> 2. March 31 - April 9: last chance for me to upload a new upstream release
>> 
>>     What are the chances that this is 4.1.0 final?
>> 
> Good, while we know of a few outstanding issues, I think we have closed all
> the blockers. So now its just a matter of deciding when to do a release.
>
>
>>     In case 4.1.0 is not ready in time, could we please have a beta6 or rc1?
>>     This would make it vastly easier for me to handle step 3 below,
>>     and to maintain the package during the lifetime of Trixie.
>> 
> I plan to cut a new beta this weekend, and do some of the tasks that have been
> waiting for me to not be so swamped at work. I have one specific bug in mind
> I would still like to land a fix for, and a few other that would be nice to
> have but not required. We could cut an RC1 or final release next weekend.

Any updated timeline?

Cheers,
-- 
intrigeri

