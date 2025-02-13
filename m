Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 962BDA348D3
	for <lists+apparmor@lfdr.de>; Thu, 13 Feb 2025 17:02:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tibfL-0003vy-2W; Thu, 13 Feb 2025 16:02:15 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <intrigeri@debian.org>)
 id 1tibfJ-0003vp-JX
 for apparmor@lists.ubuntu.com; Thu, 13 Feb 2025 16:02:13 +0000
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.2:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <intrigeri@debian.org>)
 id 1tibfI-008l9G-Gd
 for apparmor@lists.ubuntu.com; Thu, 13 Feb 2025 16:02:12 +0000
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id 9B2AB1882BBC
 for <apparmor@lists.ubuntu.com>; Thu, 13 Feb 2025 17:02:11 +0100 (CET)
Message-Id: <87seohq1do.fsf@manticora>
From: intrigeri <intrigeri@debian.org>
To: apparmor@lists.ubuntu.com
In-Reply-To: <9f17f2d5-1fe3-4434-aa68-91b07faf004b@canonical.com>
References: <87lduexbod.fsf@manticora>
 <9f17f2d5-1fe3-4434-aa68-91b07faf004b@canonical.com>
Date: Thu, 13 Feb 2025 17:02:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Thanks for the quick reply! Some comments and more questions inline
below:

John Johansen (2025-02-10):
> On 2/10/25 03:48, intrigeri wrote:
>> Currently Debian testing/sid is tracking AppArmor 3.1.x.
>>=20
>> I'm wondering if I should upgrade to 4.x for Debian 13 (Trixie), whose
>> freeze will start in a few months. I would greatly appreciate
>> some advice.
>>=20
> Yes. We have been planning to get debian updated to 4.1. Beta4
> should be dropping some time today. We still have a couple of
> known issues to fix before finally release but it is getting
> close. It should release some time this month (February).
>
> 4.1 will be a long term support version, where the current 4.0
> release was not.

OK, so I'll try to upload 4.1.0~beta4 to experimental ASAP. I hope
I can recycle some of the 4.1.0~beta1 packaging work from Ubuntu even
though the Ubuntu packaging has switched to a Git workflow that makes
this hard.

And then from there we'll see what's left to do and whether that's
realistic to get it into Debian testing in time for the freeze for
disruptive changes (March 15). I'll make the final decision once 4.1
final is released.

>> Do I understand correctly that 4.x (or is it only 4.1?)
>> may not support policy that was written for 3.x?
>>=20
>
> AppArmor 4.x is backwards compatible with 3.x through the abi
> mechanism. If a profile declares support for a 3.x abi that
> is what will be supported and used.

OK, so, do I understand correctly that if we ship 4.1 in Debian
Trixie, all profiles shipped in Trixie MUST:

 - Either declare abi/4.x =E2=80=94 there's already a few in Debian, but not
   many; this will work.

 - Or declare abi/3.0 =E2=80=94 there's already a few in Debian, but not ma=
ny;
   this will work in most cases, but in some cases profile
   interactions may break things and extra work is needed to
   fix things.

   To tell whether that's the case, is it sufficient to run them
   through `apparmor_parser --skip-cache --skip-kernel-load`
   and assume the parser will error out if they're not compatible?

   If that works, we're in luck: I can do that via autopkgtests!
   If takes more manual work, I doubt we'll have capacity to evaluate
   all the profiles in Debian in due time.

 - Or declare no ABI but luckily be compatible with ABI 4.x. I think
   the majority of the profiles we have in Debian currently declare
   no ABI. I don't know if they are compatible with ABI 4.x.

   Same as above:

   To tell whether that's the case, is it sufficient to run them
   through `apparmor_parser --skip-cache --skip-kernel-load`
   and assume the parser will error out if they're not compatible?

   If that works, we're in luck: I can do that via autopkgtests!
   If takes more manual work, I doubt we'll have capacity to evaluate
   all the profiles in Debian in due time.

Correct?

I've tried to understand how this works from
https://gitlab.com/apparmor/apparmor/-/wikis/AppArmorpolicyfeaturesabi
but I failed so far. If there's other doc I should read, please point
me to it :)

Cheers,
--=20
intrigeri

