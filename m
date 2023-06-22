Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2A7396CF
	for <lists+apparmor@lfdr.de>; Thu, 22 Jun 2023 07:24:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qCCny-0001uT-Nl; Thu, 22 Jun 2023 05:24:26 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qCCnx-0001uL-94
 for apparmor@lists.ubuntu.com; Thu, 22 Jun 2023 05:24:25 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 84DEB3F038
 for <apparmor@lists.ubuntu.com>; Thu, 22 Jun 2023 05:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1687411464;
 bh=3NFX6/7hTQzPODOqKTQS+5pJfqGAQhRSw0iQ6GMltsk=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=QQ1Lz1xoyXNrwXcB3xgLZGX1NeH8/g5fJxkSOygcH+A062ykijQPHZrcl3LesT69b
 nPvVK9+U01gk9rYGSsJ6zq56G+CUylm5JffdjZwnD64SWCw/ckp86N9y6fFHJx3CWV
 szLcm2EqlBul+QHMGjRoquRVjcUfDk0HVtL9wzDke2yiCB3cjsKCR7DhKb7ngdNz+3
 orAPsEZ+BGSdW+p2JoqFLayixZy1jOG8zc5vRTqDQFxv/WcsbwrRl/Eb9tyIpDMeY4
 axUhBxfW8vBgDEjg3RYiBoPQihaqbKI4rCtg7DgDPoFKAqJxobF/cd7UtrSaGZrHhJ
 J8VhTNV4Ot+QA==
Message-ID: <6d38e493-1803-8c5f-da90-ae404a390607@canonical.com>
Date: Wed, 21 Jun 2023 22:24:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] AppArmor 3.1.6 Released
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

The AppArmor development team is pleased to announce the 3.1.6 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.1.6


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.6

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!









