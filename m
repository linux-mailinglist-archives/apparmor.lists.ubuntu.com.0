Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C301F6A5255
	for <lists+apparmor@lfdr.de>; Tue, 28 Feb 2023 05:32:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pWrem-00085g-GO; Tue, 28 Feb 2023 04:32:04 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pWrek-00085T-FK
 for apparmor@lists.ubuntu.com; Tue, 28 Feb 2023 04:32:02 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6D9363F116
 for <apparmor@lists.ubuntu.com>; Tue, 28 Feb 2023 04:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1677558721;
 bh=HZNwQzs9mBF16geEFcEZkJLS8HgXh/FHztOZFx/f/Rc=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=qhzNoYBV1WxLm4Rk+F7U3zt6tMP7lsTvJ1JPtBRAdqmdCBIG3e6OjGWn9PcJD5/j9
 73NdwqQEsntDtpqEx4dIhYd4U9D1qnPt1VXOKN0hStAcS9/FvRiz0W21I6XhybYDHS
 NwC3O7KHUumQ2sNo8SdQ48qaMqIHa2ZBa9EcdEpL4oHdoV3m8SQ4n1AHjdADmZ6wyw
 BUhvbBWUgBddkxrCK0CptgR+5/keIvg0qmIdSyaLt/bmKOPZoAZ3DBYLdqrwiLFiVm
 tszWeeLgzNrULP0BGJk+g6+Vjzc7ZWiLmd12g8DahtnqpEEbYY2Hr2qeurZq/9cEl9
 x2gsawuoYUXlw==
Message-ID: <ff5ac9f6-161a-ccdf-8311-66d5b275222f@canonical.com>
Date: Mon, 27 Feb 2023 20:31:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  AppArmor 3.0.9 Released
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

The AppArmor development team is pleased to announce the 3.0.9 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.0.9

The release notes are available at
     https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.0.9

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!







