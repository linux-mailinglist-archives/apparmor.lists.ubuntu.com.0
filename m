Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9362772B406
	for <lists+apparmor@lfdr.de>; Sun, 11 Jun 2023 22:51:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q8S1d-0003Om-FW; Sun, 11 Jun 2023 20:51:01 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1q8S1b-0003OP-Rd
 for apparmor@lists.ubuntu.com; Sun, 11 Jun 2023 20:50:59 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id A750241B81
 for <apparmor@lists.ubuntu.com>; Sun, 11 Jun 2023 20:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1686516657;
 bh=+sFTO9rbb0IO4ej2u0TY0O4MTqwXuQj9TvlZtpHBGAA=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=vhv9mmaRyeTTQHZvU0+Y89Td/atOHvDbDDgdFXOCpIVGM/X8BEHylgt+fLH5sSNIw
 Fmex6VYfCO1xbmGC7oczOA6hp+YgbB+pvzC/s14B+UkzGW2PVNj69X/vgBkgxCDV9Q
 gHSLBMW2d2pY1V4aZBAfrjl/gL2yHPI9CvXh3nVoyvVACe/megOJhdQ+W3f2aSVFR6
 DEgjMROels6NQ3/t6/woleFopbCwRhyDxiONF9vOgKWX5eJqBWzrJMtqlw1r1LFl12
 dG2E8nak1shchV6Hd5kXPexZaCxdjDyaFm87QobqMmP9YIbI+ZI/CpweJiygGBUfQQ
 zX1Jp8zkJRnHw==
Message-ID: <a107a53d-4575-e802-c2ea-0612f2241f66@canonical.com>
Date: Sun, 11 Jun 2023 13:50:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] irc meeting Tues June 13
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

The next irc meeting is Tuesday June 13, at 18:00 UTC in #apparmor on oftc.net

Please update the agenda https://gitlab.com/apparmor/apparmor/wikis/MeetingAgenda or reply to this mail if you have items you want to add

