Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 577B163175E
	for <lists+apparmor@lfdr.de>; Mon, 21 Nov 2022 00:36:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1owtr5-0000Q7-2d; Sun, 20 Nov 2022 23:36:07 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1owtr3-0000Q0-GE
 for apparmor@lists.ubuntu.com; Sun, 20 Nov 2022 23:36:05 +0000
Received: from [192.168.192.83] (unknown [50.47.159.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E3E563FA51
 for <apparmor@lists.ubuntu.com>; Sun, 20 Nov 2022 23:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1668987365;
 bh=2FxVHPA4KkDed5AHnmC5wIppO4AQgkWl2JDfQ+BYX+E=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=rUtTy0W9/mQMmCy1EiO23YVVH4ilr3C6jzQq5GfMXlYH4cmPOKjbt5Q+87u5eknfN
 C1XNUBM2FZVGknU8BlsElQhHJysz/v8BOg8dcfGFFk8XiIYEVyZBVSfAvL3zsBpcPI
 xP0H25LvHYAFpuVmt2d+0lPxh0n5aK98ur/uvqG+tcPm+Blbb7Hy+C8pg7prUBVbpP
 UGlKkun6Kj6vjDG9RZckf/QkR96DlVy2NBLlB6cspLLTpQiX1UdbYG9guSval4Y4f8
 X3VAlO+CIEv1tuyM/TW30VyAkFnaBgoCsbAo1eKT7mZE0UMm3YCnJe4ve2uHWEpTqz
 pFBLKsbSFoGVw==
Message-ID: <824710f1-2fe0-6ae4-0ebb-b3a908d3a393@canonical.com>
Date: Sun, 20 Nov 2022 15:36:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  AppArmor 2.12.4 Released
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

The AppArmor development team is pleased to announce the 2.12.4 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v2.12.4


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_2.12.4

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!




