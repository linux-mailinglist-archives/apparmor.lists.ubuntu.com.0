Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51270F06E
	for <lists+apparmor@lfdr.de>; Wed, 24 May 2023 10:17:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q1jgM-0001Wa-Ah; Wed, 24 May 2023 08:17:18 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1q1jgL-0001WP-2K
 for apparmor@lists.ubuntu.com; Wed, 24 May 2023 08:17:17 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 227ED3F182
 for <apparmor@lists.ubuntu.com>; Wed, 24 May 2023 08:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1684916236;
 bh=xzM/eXen7ERZmWSg3ToobfnvB5ldBpxsr715MBcGZ+8=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=euLTPG021geze3wWcV1PpXmrOQCrpkvQnaKtDm9lICmF7ZkUUBbRS+VxZCuOa+q7e
 rTaAzBT9DS4usJcDaP0OXgBGYKjummQMvaE+GCuJo6Z9lpEouNQutWt9U90EFnP7C0
 ilzDbMBWD3aING6X7hlxFY67YOvC4o1yHEZLh6/sVzAfLc06MmBGJhp4jPg2ouwiwJ
 DI4G1NJtkcP8aC0hQXcFAf8sEUQAFUzgZiAPuO5KQjYB4ZG2wKGq5Tvc1V+WmQYsSo
 RORD8rit6Fds3Lsl9tq5gye9ZxuG0U3G8RUSG8i9QyCAXL+wfF2fZ2mNaRAqSgBsyO
 l0RZoUUYTx9FA==
Message-ID: <3e86540f-ab68-d5e3-a6be-f50d32794c67@canonical.com>
Date: Wed, 24 May 2023 01:17:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  AppArmor 3.1.4 Released
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

The AppArmor development team is pleased to announce the 3.1.4 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.1.4


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.4

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!







