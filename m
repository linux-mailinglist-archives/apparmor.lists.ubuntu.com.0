Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD34A6A4AA
	for <lists+apparmor@lfdr.de>; Thu, 20 Mar 2025 12:16:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tvDsk-0004aG-7N; Thu, 20 Mar 2025 11:16:14 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <intrigeri@debian.org>)
 id 1tvDsi-0004a5-Lt
 for apparmor@lists.ubuntu.com; Thu, 20 Mar 2025 11:16:12 +0000
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.2:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <intrigeri@debian.org>)
 id 1tvDsh-00H6zB-LF
 for apparmor@lists.ubuntu.com; Thu, 20 Mar 2025 11:16:11 +0000
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id ECD211882BBC
 for <apparmor@lists.ubuntu.com>; Thu, 20 Mar 2025 12:16:10 +0100 (CET)
Message-Id: <87h63oosud.fsf@manticora>
From: intrigeri <intrigeri@debian.org>
To: apparmor@lists.ubuntu.com
In-Reply-To: <notmuch-sha1-b2e2b030e6c648a94453e27ed830150943d9fa15>
References: <87lduexbod.fsf@manticora>
 <9f17f2d5-1fe3-4434-aa68-91b07faf004b@canonical.com>
Date: Thu, 20 Mar 2025 12:16:10 +0100
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

4.1.0~beta5 has been in Debian for a few weeks. Looks good so far, we
merely had to cope with a few hickups related to userns and the new
"unconfined" stub profiles. Congrats for all the work that went into
this new series!

My calendar for the next steps is:

1. March 24-30: AFK

2. March 31 - April 9: last chance for me to upload a new upstream release

   What are the chances that this is 4.1.0 final?

   In case 4.1.0 is not ready in time, could we please have a beta6 or rc1?
   This would make it vastly easier for me to handle step 3 below,
   and to maintain the package during the lifetime of Trixie.

3. Afterwards: I can only add small, targeted fixes =E2=80=94 with increasi=
ng
   overhead required to get them into the Trixie release as we
   progress through freeze stages. If the 4.1 tree is maintained in
   a super strict way I might be able to pull directly from it.
   Otherwise I'll have to cherry-pick the most important fixes.

Cheers,
--=20
intrigeri

