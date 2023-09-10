Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 88582799FF9
	for <lists+apparmor@lfdr.de>; Sun, 10 Sep 2023 22:54:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qfRRY-0001js-A0; Sun, 10 Sep 2023 20:54:08 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1qfRRQ-0001ix-Lj
 for apparmor@lists.ubuntu.com; Sun, 10 Sep 2023 20:54:00 +0000
Received: from [192.168.192.83] (unknown [50.39.103.33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id BE6AF3F111
 for <apparmor@lists.ubuntu.com>; Sun, 10 Sep 2023 20:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1694379239;
 bh=a8J1SgwELS3rTxelLPXSGCM4TbPEzYV/nx7UAJQQkzI=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=pqX0Y7lK47/7ebO2u2OckJ/PVa/ffTCeUts7PrqcvaAX76BseZlCwm6qUAnyRSOxe
 jbfiC7tfvsgz35/ZljRnbXK74fOPombcI/uxMR0Y/JcX9iTCAvYVdctalO+Rf0y/SL
 BhkrgMPmKdO4M2L+6VzfveWKw55QQmhwDsOLELysdovRLhAUqJL1CeSK+FjwVqF0Vb
 94E4U1/Th1Pns/1xCWHWkD+0YnkgtC+weAC9DAK1ZST0w0Uu63dFHINVrp79oc6tdr
 pnJQ/3l1KuvaliG9bKabXNVkr+vka3hVhifypWf/iHvMg5xR8DEEiqkSWCAXXqGoTj
 nUW+afhY3mvAA==
Message-ID: <65d3f8af-bb77-08ce-eb7d-106f490b5e9b@canonical.com>
Date: Sun, 10 Sep 2023 13:53:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] irc meeting Tues Sept 12
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

The next irc meeting is Tuesday Sept 12, at 18:00 UTC in #apparmor on oftc.net

Please update the agenda https://gitlab.com/apparmor/apparmor/wikis/MeetingAgenda or reply to this mail if you have items you want to add



