Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C784FAF95
	for <lists+apparmor@lfdr.de>; Sun, 10 Apr 2022 20:26:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ndcG2-0005kK-Tv; Sun, 10 Apr 2022 18:25:54 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1ndcG2-0005k1-6b
 for apparmor@lists.ubuntu.com; Sun, 10 Apr 2022 18:25:54 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id DC7BE3FD91
 for <apparmor@lists.ubuntu.com>; Sun, 10 Apr 2022 18:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1649615153;
 bh=jAq9I8o73+7StfdNIPSGja7oWlGuogYYq3RXROLwSwo=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=kEhn7Y1l7VzE8hOuAjLtI1m0LT1zO50iNo7klJe6cgc5JnpWdPGXNekwQObrVJdfe
 F2SKHaIXtdiqKR4JcJdiiHyyHxUCxS5P12KMW9DA5Zl55MxwxllXH/t9oy1DiTtI/O
 /TKMUohUZn9nQIE2G57GxHdbEFKImseU2IitNbMjYOnTQTXRyBtzpyWWIfcWRmteYj
 KLWFv3vij63V/iG7UMdCFTG+TRIdO2srG+7+1hZlu3IsSADlZDUBZSUNNFWPyguAKJ
 TCvVgUPwqecu0SkPCkMHlJKF3Jf9bOsYZjaTOjOSbBkobOSf/HN34rqc3Uv0Sh7jPT
 LxnBiHRx583Yg==
Message-ID: <344a557d-f3fe-c8d7-44d6-ed4eb0eb48de@canonical.com>
Date: Sun, 10 Apr 2022 11:25:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  irc meeting Tues April 12
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

The next irc meeting is Tuesday April 12, at 18:00 UTC in #apparmor on oftc.net

Please update the agenda https://gitlab.com/apparmor/apparmor/wikis/MeetingAgenda or reply to this mail if you have items you want to add

