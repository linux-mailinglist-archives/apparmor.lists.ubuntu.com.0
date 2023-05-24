Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E6970F06F
	for <lists+apparmor@lfdr.de>; Wed, 24 May 2023 10:18:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q1jhI-0001bh-Jf; Wed, 24 May 2023 08:18:16 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1q1jhH-0001bS-2A
 for apparmor@lists.ubuntu.com; Wed, 24 May 2023 08:18:15 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id EC9873F182
 for <apparmor@lists.ubuntu.com>; Wed, 24 May 2023 08:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1684916293;
 bh=5VfAQh/mxyleJ2m/3eMflopZKZWWlylcM+DyeVREa8Q=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=dLDxK/saI2tNJDoLGMJJV2GZK6kcUv6hkEq7+yQKUr41wLUkM0dfzD6oEtUP+/f3P
 /a51Sn/uWk6hpidYvd/m1d/DVaNMUNr6048XYEVS1Ui0bA/iKRswA/3DBxcmL9OT4Y
 LKMpV2WI+v5twx1cc0ZTluSGAwuIWgybUoU6qe1e1cT/b6nbMtpdDY3BFUWg+Cb9ZF
 e49TwR5UcODa7pG8FHquEKoYZsORGRiuhq86D1tUOkJkf4o0kiw1XIQjVgDqFnRjEa
 /xsmSwe39Mqs9jok8brNAoFFCscAehhlFe8Aq5nSTyilpio9i+nhtRpnArRODH8Tkk
 k3HIxPY1wR5zQ==
Message-ID: <1ec0b54b-134e-333d-841e-f02ec847d044@canonical.com>
Date: Wed, 24 May 2023 01:18:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] AppArmor 3.0.10 Released
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

The AppArmor development team is pleased to announce the 3.0.10 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.0.10


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.0.10

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!







