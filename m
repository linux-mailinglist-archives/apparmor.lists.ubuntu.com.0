Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 196567396CC
	for <lists+apparmor@lfdr.de>; Thu, 22 Jun 2023 07:24:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qCCnT-0001q2-H2; Thu, 22 Jun 2023 05:23:55 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qCCnR-0001pu-Tc
 for apparmor@lists.ubuntu.com; Thu, 22 Jun 2023 05:23:53 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C70F63F038
 for <apparmor@lists.ubuntu.com>; Thu, 22 Jun 2023 05:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1687411432;
 bh=ugV1KxRbHyq2l9651x1CEM/FxTpNO0Zp0EKTikUK6hk=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=V1oQ1r9tsAz6DeMD2OtQq3ax1JWQ9EYGM7a0fMdS75mc8u/cQqvcuvpV9Rc8bZ3jo
 yGHK2krNkHchsIjsXC7lvyVasO5QGB39pMst7mpz2GwFqjrKkI34zs7r9M6iZWUnKg
 ySExwXS1s2S4O/xoQ9pDNddySnE7KZDpCnBbN/p7ep3rALHHr3ENGLzvhQUGb72baY
 Ypq6x4JB2Uuw8aiJqo/grMJlyOQj2RBUErXoJJDLmvjNQpbsUeHhGQ5g9s9Mr/ghmU
 iKNfvZMXGnojQhzoFD/hyueZOoHaSgbiXFYTlaBxkxuIr8A8Sd/fgkA11EaYMrcBNW
 T9H49O1I123yA==
Message-ID: <c5dc369f-3236-31dd-2cd8-a6f1f1d00a3e@canonical.com>
Date: Wed, 21 Jun 2023 22:23:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] AppArmor 3.0.12 Released
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

The AppArmor development team is pleased to announce the 3.0.12 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.0.12


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.0.12

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!









