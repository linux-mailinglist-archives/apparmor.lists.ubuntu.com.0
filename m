Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E82F693A09
	for <lists+apparmor@lfdr.de>; Sun, 12 Feb 2023 21:53:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pRJLv-0004co-1N; Sun, 12 Feb 2023 20:53:39 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pRJLt-0004ch-8r
 for apparmor@lists.ubuntu.com; Sun, 12 Feb 2023 20:53:37 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id BE3043F816
 for <apparmor@lists.ubuntu.com>; Sun, 12 Feb 2023 20:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1676235217;
 bh=L9W8kkOnnz63VyCosRI0Y5szbexsSyu9QiTpyw3DpAY=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=gbWLxQsMVoZRiUjXM7UYoyGnwbxt/2tPux73kguKdPlCaqcPKutYrMSQuhggHmll4
 mDSRzENplq+DrPvHbHneQRVGRLpZrPz7z7LIC8nooJvRzr3OUVpJaYaspPDfeuAKDg
 T7tJ0g8ApzgGHpLaOLuitIEijGyWLmVCkNPOCRC2qyKbP+MFjDuV8bbyhlggw2Bq5s
 EupRUFyjcOoIf8Mt04dhtqqDwLQ6qSh2uWcQMgCeDYpO7d/j3yA9/mV3wvTeX4L3M4
 kGo9cJiTGMoBJ9Y174RDhnPYsL4yOq9txBa7fSCugvug4mW+IUdC3LgDpGqgUVgIg3
 GfJuml/RH7sNw==
Message-ID: <ed560b7a-ad25-3838-2365-f3530caed9ca@canonical.com>
Date: Sun, 12 Feb 2023 12:53:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  irc meeting Tues Feb14
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

The next irc meeting is Tuesday Feb 14, at 18:00 UTC in #apparmor on oftc.net

Please update the agenda https://gitlab.com/apparmor/apparmor/wikis/MeetingAgenda or reply to this mail if you have items you want to add





