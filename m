Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA27396CB
	for <lists+apparmor@lfdr.de>; Thu, 22 Jun 2023 07:23:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qCCmp-0001kt-9q; Thu, 22 Jun 2023 05:23:15 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qCCmo-0001kk-9Q
 for apparmor@lists.ubuntu.com; Thu, 22 Jun 2023 05:23:14 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 809983F038
 for <apparmor@lists.ubuntu.com>; Thu, 22 Jun 2023 05:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1687411393;
 bh=YxYjRXDFIIajHYZ6tvDV3fWKQamX92TeiBqb+D8rhBM=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=MoJvsQAwOsZpIZltmnyFiVk57FwyfrRTrPxsbRBn0xJ0mGqIQBCKTnkizmrwGFdM/
 F91CUaL0PoPsTVUVwUd4HnIoF6rNOLxm0Y49ihRkkrhy5D1ktdInEtdCrGT1unoUro
 OpGPl1sefsZRuFhqtYymuVfBobY+9Kd5oNccVMCbRdi5XvCMILKb3Bjj1jHwMR9mFf
 1FaEydwhhB7IRTgUETVthJvApxlHip5KBKONm6tctZ3PhaWc6U3V8/zODBUcFG5Esu
 R/UsNPBDKB0YtwIyCBCtjDqCTT7Tll84A6goIZEBHanalMvEj7PqOCHUV16qotHv0n
 OieGqNeH9Hh1Q==
Message-ID: <82502d3d-d1c4-1e67-b25d-11484d93d696@canonical.com>
Date: Wed, 21 Jun 2023 22:23:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] AppArmor 2.13.10 Released
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

The AppArmor development team is pleased to announce the 2.13.10 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v2.13.10


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_2.13.10

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!









