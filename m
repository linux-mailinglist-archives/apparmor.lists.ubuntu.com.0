Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA05649607
	for <lists+apparmor@lfdr.de>; Sun, 11 Dec 2022 20:32:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p4S3D-0005sE-4N; Sun, 11 Dec 2022 19:31:51 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1p4S3B-0005s7-Ir
 for apparmor@lists.ubuntu.com; Sun, 11 Dec 2022 19:31:49 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B685A435BC
 for <apparmor@lists.ubuntu.com>; Sun, 11 Dec 2022 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1670787109;
 bh=s7QVnDjuSSLKFWCDjrsVNKzZGTdLoRLNv5PQDZBMY8M=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=UCcP7Un2F1dpU+6uTGw8AppRQzMxZbDbtmYCVcnFsTMgEYo9y7MYdQyI2k5NMtN3t
 oigvP/9OXoZb3XAn8BYbDrmSxOXprYFPMBywIJOkTtvWecEMYFgEMNRavQoFBMPN3s
 9BSgPG/2FXxWrx74byfPnF3OwQK0QBLHUirLMHdbAx6Jc/3bMTLGNooZATGWlARPgc
 3UdqL7VI69UzNuchT9MlydaMq/5NITRN1qCKidp7REddfqi45ZolbaXKB0Fje4hJw9
 rpIMWELsn5U6AzKRbUd0/W0mztQAHM5p070R5qJf4UnZPCYO+iA+VMeNdrdadBhknB
 HVhtFJQ0Vj9kg==
Message-ID: <75f34d0c-75cc-5e5e-1cb0-0fc3c813403f@canonical.com>
Date: Sun, 11 Dec 2022 11:31:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  irc meeting Tues Dec 13
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

The next irc meeting is Tuesday Dec 13, at 18:00 UTC in #apparmor on oftc.net

Please update the agenda https://gitlab.com/apparmor/apparmor/wikis/MeetingAgenda or reply to this mail if you have items you want to add




