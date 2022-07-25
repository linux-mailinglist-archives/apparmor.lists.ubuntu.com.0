Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D28D57FA59
	for <lists+apparmor@lfdr.de>; Mon, 25 Jul 2022 09:38:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oFsfp-0005Yc-UE; Mon, 25 Jul 2022 07:38:41 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oFsfo-0005YV-Oy
 for apparmor@lists.ubuntu.com; Mon, 25 Jul 2022 07:38:40 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 1882F3F125
 for <apparmor@lists.ubuntu.com>; Mon, 25 Jul 2022 07:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1658734720;
 bh=uv9N2OK2iu9MrHDSJJr45jkAndJjAQuBwuHrhm/NcrE=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=alwOfsC1eynlWwNGzH+TpWZaeMK68uUO+3voBIaVXeoZnD1gaxpCcV/Ru2LJIjJ0I
 GcLxjInNbarCet5RsqS9Re6XrNoZ2psqmvuKv/skc+ci5OVP3VcVFULhdaEcmuJdFk
 +To/7dSiA9H7Ae8GwOdnZoXSfGa3VA5IDE22JTxxWhAxEJeds7BltKCB/r5whRqIAn
 x4itGXGGkrZjMM0w58veh8LEbNfXr//kmk/M3DgZFwSu/lJsIBk1bK17HqGExLMuzT
 fgrQZO5RRnv4ltzqnA/+X75y1zI2fXezj1IFZ2mKl4vuePK2nEtuNp97BPK0AYq4IF
 aE9Uvm3oRswzg==
Message-ID: <dfde4f4a-32c8-a3b4-d737-809adc1c8585@canonical.com>
Date: Mon, 25 Jul 2022 00:38:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  AppArmor 3.0.5 Released
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

The AppArmor development team is pleased to announce the 3.0.5 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.0.5


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.0.5

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!

