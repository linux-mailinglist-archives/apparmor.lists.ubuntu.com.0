Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E87DC6A5257
	for <lists+apparmor@lfdr.de>; Tue, 28 Feb 2023 05:33:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pWrfl-0008AL-P4; Tue, 28 Feb 2023 04:33:05 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pWrfk-0008AE-8a
 for apparmor@lists.ubuntu.com; Tue, 28 Feb 2023 04:33:04 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id B123B3F116
 for <apparmor@lists.ubuntu.com>; Tue, 28 Feb 2023 04:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1677558784;
 bh=m3ryTzCKxj3ucytTtT5dSxag7FEM65LIIRJaunJbBF4=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=k+Gvn1ebNWkSg+2x7c471gkXjv2QQIU9FuYmc8NfArVKSIdIyh4nt9piatLYXCdVj
 13I9NLCiaNeztwJRTIjc2JfEJNx5/o/TmpFZKuG+9zpbL+j/WDQIov2cKsDpYt4Gcp
 thlTQBn2fcPkT7RL8TISO0eDp3jCCGiS+5trZjLcGnHe1WQbJ+LejQ6oY7JIH5leBS
 NP5kECpmyPx4dyDtoB8xUL1W0MchLpG22zT824/BzSQTCGh5bmYQJs5EOyCQ4s1tK6
 hOMSU+/RdJkYacUlpR12RRHypuqQEZOUQW5hMArLL5FfORcPqimn1uNLsASoxxPayC
 yTpk1jk2syNTQ==
Message-ID: <35f5a8a5-a375-8907-f3e0-386faf28fa13@canonical.com>
Date: Mon, 27 Feb 2023 20:33:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] AppArmor 3.1.3 Released
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

The AppArmor development team is pleased to announce the 3.1.3 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.1.3


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.3

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!






