Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ABDA37DB6
	for <lists+apparmor@lfdr.de>; Mon, 17 Feb 2025 10:02:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tjx0n-0003ZX-9Q; Mon, 17 Feb 2025 09:01:57 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <intrigeri@debian.org>)
 id 1tjx0l-0003ZP-Bk
 for apparmor@lists.ubuntu.com; Mon, 17 Feb 2025 09:01:55 +0000
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.2:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <intrigeri@debian.org>)
 id 1tjx0k-00Bu7P-9O
 for apparmor@lists.ubuntu.com; Mon, 17 Feb 2025 09:01:54 +0000
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id 6E19D1882BBA
 for <apparmor@lists.ubuntu.com>; Mon, 17 Feb 2025 10:01:53 +0100 (CET)
Message-Id: <87mselndvi.fsf@manticora>
From: intrigeri <intrigeri@debian.org>
To: apparmor@lists.ubuntu.com
In-Reply-To: <5dd89f64-cb4c-4d4a-b2e1-6b8f172b3a9b@canonical.com>
References: <87lduexbod.fsf@manticora>
 <9f17f2d5-1fe3-4434-aa68-91b07faf004b@canonical.com>
 <87seohq1do.fsf@manticora>
 <5dd89f64-cb4c-4d4a-b2e1-6b8f172b3a9b@canonical.com>
Date: Mon, 17 Feb 2025 10:01:53 +0100
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

John Johansen (2025-02-13):
> On 2/13/25 08:02, intrigeri wrote:
>> John Johansen (2025-02-10):
>>> On 2/10/25 03:48, intrigeri wrote:
>>>> Currently Debian testing/sid is tracking AppArmor 3.1.x.
>>>>
>>>> I'm wondering if I should upgrade to 4.x for Debian 13 (Trixie), whose
>>>> freeze will start in a few months. I would greatly appreciate
>>>> some advice.
>>>>
>>> Yes. We have been planning to get debian updated to 4.1. Beta4
>>> should be dropping some time today. We still have a couple of
>>> known issues to fix before finally release but it is getting
>>> close. It should release some time this month (February).
>
> Based on early testing on suse and ubuntu build systems we had a
> few build issue for some platforms shake out so I am going to cut
> a beta5

OK, we'll see if I get to packaging beta4 before beta5 is out.

> Ubuntu has an updated packaging for beta4/5 that I can send you

Yes, I'd love to know where I can find it.

Is it one of the branches I can see on
https://code.launchpad.net/ubuntu/+source/apparmor ?

And thanks a lot for the explanation about ABI versions and how I can
check compatibility, for various values thereof :)

Cheers,
-- 
intrigeri

