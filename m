Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4287858D63C
	for <lists+apparmor@lfdr.de>; Tue,  9 Aug 2022 11:17:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oLLLx-0001Xe-Hx; Tue, 09 Aug 2022 09:16:45 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oLLLv-0001X6-04
 for apparmor@lists.ubuntu.com; Tue, 09 Aug 2022 09:16:43 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 426EF3F103
 for <apparmor@lists.ubuntu.com>; Tue,  9 Aug 2022 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1660036602;
 bh=pdOL9BKXsbG0hT7UfrwAEnf3AHWP3VblDEERp14AIEw=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=JBXPtFXnuLhmbcTBs3oRSt22o3E8szxaUSBvAuCTm3Tf4XN2dFG+k+ZX+tAFNEMqs
 k+manw8LUetK+2bVigjcINK8Hc5ux4Uq+M267pWqWFrtugurn71UVOiiOYsCPvpf+A
 ADHiYJjSur+5xwU/k6j9gLjP2xK5nweSzKqQja4gag0RHmI4IBVTVKww/w1ToGM5tw
 s0EV7XxXP4RCHsnO0P6C071L5W3ufqAty5/6bDk1zQ8zOMgetdgbCXIM8EGU8IgT2j
 n3d4vBDqL+kTururcdDn8LxPvjnRjZg0O9ocZL6kdmxt4pfbXZvC865F1JUQTE+c8t
 2prW3nxoHxIgQ==
Message-ID: <fdde3309-7fa8-9c3c-3b39-e17942c5a5f3@canonical.com>
Date: Tue, 9 Aug 2022 02:16:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  AppArmor 3.0.7 Released
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

The AppArmor development team is pleased to announce the 3.0.7 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.0.7


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.0.7

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!



