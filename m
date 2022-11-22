Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCC56331DE
	for <lists+apparmor@lfdr.de>; Tue, 22 Nov 2022 02:08:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oxHlZ-0000XR-44; Tue, 22 Nov 2022 01:08:01 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oxHlY-0000XK-6G
 for apparmor@lists.ubuntu.com; Tue, 22 Nov 2022 01:08:00 +0000
Received: from [192.168.192.83] (unknown [50.47.159.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 855993F63C
 for <apparmor@lists.ubuntu.com>; Tue, 22 Nov 2022 01:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1669079279;
 bh=j8lQy8j1N+47LBq0wbiAEbu0a2zRQGcz75XBT/lVSuY=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=L9PHdz6FtCL7xWM+EmmRnArx6ajStPpLYh5JMyfN6vrf1/KNJNYXmuyltS2ZmxKr3
 yuS6lpDpytHLXpWXySQNhXbx/Nnxgrxbmpp1YbOIRrS9Zo979T2HtL5QKqd2mtUG47
 ivLPRa8fKu2m96Dxf/uaHtcKXKs8GWH4cpblD8c9HBCc5WP2/kZM7K8Pquv7s+tx7z
 HdHIZjfYJwrriDtSEnAlkY653VykxLe9EM3+R5YSsCzWRQ5YxJEC8oiwrAm99FkFuG
 NPUt5ldQ/Nd4TtFWBxgu46o98koPO1YhOWmPwm1A4lFx5sPTyhsnEImMRScWT3nLns
 T94LpXcp9m/7A==
Message-ID: <e34fa42d-1b27-db39-8312-1313f9783fa9@canonical.com>
Date: Mon, 21 Nov 2022 17:07:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] AppArmor 3.0.8 Released
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

The AppArmor development team is pleased to announce the 3.0.8 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.0.8


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.0.8

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!






