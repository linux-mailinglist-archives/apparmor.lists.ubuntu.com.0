Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 852D7633160
	for <lists+apparmor@lfdr.de>; Tue, 22 Nov 2022 01:34:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oxHFN-0006zQ-Vr; Tue, 22 Nov 2022 00:34:45 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oxHFM-0006zH-LX
 for apparmor@lists.ubuntu.com; Tue, 22 Nov 2022 00:34:44 +0000
Received: from [192.168.192.83] (unknown [50.47.159.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 005363F1DE
 for <apparmor@lists.ubuntu.com>; Tue, 22 Nov 2022 00:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1669077284;
 bh=vDz3Y5n7VYXluTAHapkD/2nmQE0Ul5ExpL7Nv/ud8lw=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=L+QBAPBOrv5HPyIuxGERgttsBtfu/3xq2NCshVrmgpOMolnloHek700RRzgo+a5k9
 A8zTEHh2zeU7ZWMVcTWOluJShlDMmzo/j8JqWxuPSr6kW0Zl7jR7rtKXj9zugGC5nL
 o0efbfePjYIOHLd5vepqCzQCXYQF8Sw4bUpEmgWbpjGT87IrdzWOZjzZJmxdlVGDmk
 fOpOljB6nePjkuTcrAhZC5Lk51IO6tzq6yl+HpVpNZVgJ7HOvyd302e17PwFwnXoVI
 bWRkwOtyX0aJGgJoBftLWxoDqU4l4qt3mtxzImdqtTQt8L69uMeJJm+wbcLonXsczj
 m2OQvpggkVh7A==
Message-ID: <4c650696-f4ed-5512-e5f3-b61e0223f198@canonical.com>
Date: Mon, 21 Nov 2022 16:34:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  AppArmor 2.13.7 Released
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

The AppArmor development team is pleased to announce the 2.13.7 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v2.13.7


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_2.13.7

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!





