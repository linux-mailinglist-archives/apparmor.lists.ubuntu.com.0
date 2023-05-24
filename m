Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A2070F077
	for <lists+apparmor@lfdr.de>; Wed, 24 May 2023 10:19:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q1jhx-0001gz-R6; Wed, 24 May 2023 08:18:57 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1q1jhw-0001gr-Dg
 for apparmor@lists.ubuntu.com; Wed, 24 May 2023 08:18:56 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 274233F2F6
 for <apparmor@lists.ubuntu.com>; Wed, 24 May 2023 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1684916335;
 bh=MD3ZNDHiX2gP3ASsU3ZbGCvP9YjD4K022ms8W9mbidQ=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=sUiVTdJDBV2Ue8l0ElC4pZDjVQJ5BzZ0/cyKJTsf3mootmBw2IGafY41MvQJxGjzG
 jyCp9jQ4TAMwnmfZLhvG7qwHd++EaRNLTm7TXiD3lCPdZwMMzloqzjgPDpC5TObsYv
 QudKwgcoNZSMJS/7kNo5726/A+vwalHl4/1NLdOkf/52IGpZAKqqw9+AoUiXhKgmFB
 lhf++GZx6Kwm2HctCLHfnNsVfZx5LrZEqedqntOqhmtdMK+K6uCls3m+tVmLRaLVaD
 /sNIRRTePdAq09VfeH5KX458+PKf0NhZ37YEpf+uzDkMVSBekw8AzcxtM7ZwCgRFOH
 1CnPqgAphuliw==
Message-ID: <546f4811-69da-d8e8-ab9b-a7847b95e43b@canonical.com>
Date: Wed, 24 May 2023 01:18:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  AppArmor 2.13.8 Released
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

The AppArmor development team is pleased to announce the 2.13.8 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v2.13.8


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_2.13.8

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!







