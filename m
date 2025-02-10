Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37BA2EBCA
	for <lists+apparmor@lfdr.de>; Mon, 10 Feb 2025 12:49:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1thSHW-0003lM-LC; Mon, 10 Feb 2025 11:48:54 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <intrigeri@debian.org>)
 id 1thSHV-0003l6-6F
 for apparmor@lists.ubuntu.com; Mon, 10 Feb 2025 11:48:53 +0000
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.2:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <intrigeri@debian.org>)
 id 1thSHT-00645p-Rv
 for apparmor@lists.ubuntu.com; Mon, 10 Feb 2025 11:48:52 +0000
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id B0C961882BBA
 for <apparmor@lists.ubuntu.com>; Mon, 10 Feb 2025 12:48:50 +0100 (CET)
Message-Id: <87lduexbod.fsf@manticora>
From: intrigeri <intrigeri@debian.org>
To: apparmor@lists.ubuntu.com
Date: Mon, 10 Feb 2025 12:48:50 +0100
MIME-Version: 1.0
Content-Type: text/plain
X-Debian-User: intrigeri
Received-SPF: none client-ip=82.195.75.108; envelope-from=intrigeri@debian.org;
 helo=stravinsky.debian.org
Subject: [apparmor] AppArmor version for upcoming Debian 13 (Trixie)
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

Long time no see, I hope you're doing good!

Currently Debian testing/sid is tracking AppArmor 3.1.x.

I'm wondering if I should upgrade to 4.x for Debian 13 (Trixie), whose
freeze will start in a few months. I would greatly appreciate
some advice.

https://apparmor.net/news/release-4.0.0-alpha1/ suggests
I should wait for 4.1 which "is planned to be a regular release".
I see Ubuntu is now shipping 4.1 betas.
Is there a timeline for 4.1 final?

Do I understand correctly that 4.x (or is it only 4.1?)
may not support policy that was written for 3.x?

Cheers,
-- 
intrigeri

