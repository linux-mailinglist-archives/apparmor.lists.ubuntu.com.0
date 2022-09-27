Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3825D5EBDD2
	for <lists+apparmor@lfdr.de>; Tue, 27 Sep 2022 10:55:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1od6N5-0000wz-Dn; Tue, 27 Sep 2022 08:55:19 +0000
Received: from meel.puscii.nl ([185.52.224.5])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <intrigeri@debian.org>) id 1od6N4-0000ws-Ao
 for apparmor@lists.ubuntu.com; Tue, 27 Sep 2022 08:55:18 +0000
Received: from localhost (localhost [127.0.0.1])
 by meel.puscii.nl (Postfix) with ESMTP id 7477F2825ED
 for <apparmor@lists.ubuntu.com>; Tue, 27 Sep 2022 08:54:41 +0000 (UTC)
Received: from meel.puscii.nl ([127.0.0.1])
 by localhost (meel.puscii.nl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id BDjnbs2ax3-0 for <apparmor@lists.ubuntu.com>;
 Tue, 27 Sep 2022 08:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by meel.puscii.nl (Postfix) with ESMTP id 23B2228381B
 for <apparmor@lists.ubuntu.com>; Tue, 27 Sep 2022 08:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at meel.puscii.nl
Received: from meel.puscii.nl ([127.0.0.1])
 by localhost (meel.puscii.nl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EySXWVjgvyvp for <apparmor@lists.ubuntu.com>;
 Tue, 27 Sep 2022 08:54:41 +0000 (UTC)
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id 9B7291882651
 for <apparmor@lists.ubuntu.com>; Tue, 27 Sep 2022 10:55:11 +0200 (CEST)
Message-Id: <87a66lkxhs.fsf@manticora>
From: intrigeri <intrigeri@debian.org>
To: apparmor@lists.ubuntu.com
In-Reply-To: <06ef4654-5a14-9a21-0ac8-2666d56bd27b@canonical.com>
References: <87edvxl039.fsf@manticora>
 <06ef4654-5a14-9a21-0ac8-2666d56bd27b@canonical.com>
Date: Tue, 27 Sep 2022 10:55:11 +0200
Content-Type: text/plain
Subject: Re: [apparmor] Which version for Debian 12 ("Bookworm")?
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

Thanks a lot, John, for this detailed answer.

FTR, my take on this is thus:

 - I won't upload 3.1.x to Debian sid.

 - I won't upload 3.1.x to Debian experimental either:
   the cost/benefit seems too high.

 - Most likely Bookworm will be released with 3.0.x.
   I'm prepared to revisit this depending when 4.x appears
   and how it looks like, but I'm not counting on it.

Cheers!

