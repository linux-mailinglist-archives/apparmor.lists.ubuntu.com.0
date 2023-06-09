Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A3872909C
	for <lists+apparmor@lfdr.de>; Fri,  9 Jun 2023 09:12:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q7WHt-0001TK-Lf; Fri, 09 Jun 2023 07:11:57 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1q7WHr-0001T7-VY
 for apparmor@lists.ubuntu.com; Fri, 09 Jun 2023 07:11:55 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 9C91A41D08
 for <apparmor@lists.ubuntu.com>; Fri,  9 Jun 2023 07:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1686294715;
 bh=64cid+4h5vPWgUXCrs8MPMUJ5IdbHhpMZEAy0BQWQ68=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=LbD+2DbPuz5xKDXLSym+e7lFFjTuTFoHzEefMWmsXqwLge9FlDFjcBOSbFHAxeHjl
 8cYxe04SRnV142H/ci/cYMhzkWKuaTkAoeX8g2BvqZdl803U6zc767hmZ6oqgHV5eG
 +HZMjouxLKP/Xo0//E20jLqYYtjYOnu4hiwpTLBreJhJUk0KrRhtVbhrcQsLhTF48c
 uafW6LOSiG3xHStO0dZf6DJ+Nidwz2MoJ4nBqXhyjCGzl0K0JDs5UGxvy5LS7jCDC3
 pxXDkIZLshJD0f0gebyLzHoqh7YYf2YxuJt97lm10pwLeuw7aC9dvSKo/LS9p1GBra
 ue1StNGuR/84w==
Message-ID: <5d3793ba-438c-a851-0441-b7243fb975ca@canonical.com>
Date: Fri, 9 Jun 2023 00:11:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] AppArmor 3.1.5 Released
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

The AppArmor development team is pleased to announce the 3.1.5 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.1.5


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.5

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!








