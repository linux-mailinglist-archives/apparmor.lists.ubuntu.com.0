Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A947290A4
	for <lists+apparmor@lfdr.de>; Fri,  9 Jun 2023 09:14:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q7WK4-0001gn-8f; Fri, 09 Jun 2023 07:14:12 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1q7WK2-0001gg-Bc
 for apparmor@lists.ubuntu.com; Fri, 09 Jun 2023 07:14:10 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id AD4DA41D08
 for <apparmor@lists.ubuntu.com>; Fri,  9 Jun 2023 07:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1686294850;
 bh=luf4RZxh/vd3axzuBNNhrNiEJ3tLHBq7iTIPOq896mk=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=GrW7d0z5NuciX3Jo1xPrseAwHU1Bg2punWDSyhOGutZLo5fHPRIpq6XtomZnArJNT
 lFFU5581zcdAmSHn78XK5vTjzw0+2vmWCyaADBPeBNA4wtFECr0U8hhd83SJ+o1wi0
 iY3XBO8qLCM3Odfn2sBph8Z5Vxsrptey9Fo8YIXt2RAV9tVMzCHFu8h7JdjkIuQ3CM
 lcQLuE9W12d0mfTvRP+S2Q2OhUvg426M9R5n2GyUBozatLAPeQ7MzgW1bWcQcuzyxr
 /NlCvxP3+uWIjfbEs3jOLWBesckDzwj6CgWZUbktsALjImn43Pi3swwnskpztt43U7
 e/4EsbnsDlrfA==
Message-ID: <b31a6405-e516-18e9-f52a-d1764795a634@canonical.com>
Date: Fri, 9 Jun 2023 00:14:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] AppArmor 2.13.9 Released
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

The AppArmor development team is pleased to announce the 2.13.9 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v2.13.9


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_2.13.9

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!








