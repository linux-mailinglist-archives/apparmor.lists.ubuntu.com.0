Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 407FB5EBC6E
	for <lists+apparmor@lfdr.de>; Tue, 27 Sep 2022 09:59:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1od5Um-00046w-BS; Tue, 27 Sep 2022 07:59:12 +0000
Received: from meel.puscii.nl ([185.52.224.5])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <intrigeri@debian.org>) id 1od5Ul-00046i-0V
 for apparmor@lists.ubuntu.com; Tue, 27 Sep 2022 07:59:11 +0000
Received: from localhost (localhost [127.0.0.1])
 by meel.puscii.nl (Postfix) with ESMTP id 13745283510
 for <apparmor@lists.ubuntu.com>; Tue, 27 Sep 2022 07:58:34 +0000 (UTC)
Received: from meel.puscii.nl ([127.0.0.1])
 by localhost (meel.puscii.nl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JdphMTHCEpqt for <apparmor@lists.ubuntu.com>;
 Tue, 27 Sep 2022 07:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by meel.puscii.nl (Postfix) with ESMTP id ADBDE283559
 for <apparmor@lists.ubuntu.com>; Tue, 27 Sep 2022 07:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at meel.puscii.nl
Received: from meel.puscii.nl ([127.0.0.1])
 by localhost (meel.puscii.nl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AenmKVrL37eJ for <apparmor@lists.ubuntu.com>;
 Tue, 27 Sep 2022 07:58:33 +0000 (UTC)
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id 62F0A1882651
 for <apparmor@lists.ubuntu.com>; Tue, 27 Sep 2022 09:59:06 +0200 (CEST)
Message-Id: <87edvxl039.fsf@manticora>
From: intrigeri <intrigeri@debian.org>
To: apparmor@lists.ubuntu.com
Date: Tue, 27 Sep 2022 09:59:06 +0200
Content-Type: text/plain
Subject: [apparmor] Which version for Debian 12 ("Bookworm")?
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

Debian testing/sid currently has AppArmor 3.0.7.

Debian testing will be frozen in February 2023,
in preparation for the Debian 12 ("Bookworm")
release.

I'm wondering whether I should upload 3.1.x to Debian.

I see no release notes for 3.1.x on the website and it's hard for me
to make sense of the Git log, considering much of the changes were
also merged into 3.0.x.

I understand Ubuntu decided *not* to upgrade to 3.1.x in their
upcoming release (Kinetic, 22.10), but instead backport some of the
3.1.x changes to 3.0.x.

I guess my question really is:

 - What are the major benefits of upgrading to 3.1.x?

 - When can we expect the 3.1.x series to be stable and polished
   enough to deserve being included in a LTS distro release?

Thanks in advance,
cheers!

