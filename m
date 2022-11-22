Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F3633162
	for <lists+apparmor@lfdr.de>; Tue, 22 Nov 2022 01:35:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oxHGV-00077F-EG; Tue, 22 Nov 2022 00:35:55 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oxHGU-00076a-0w
 for apparmor@lists.ubuntu.com; Tue, 22 Nov 2022 00:35:54 +0000
Received: from [192.168.192.83] (unknown [50.47.159.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 67D4F3FA82
 for <apparmor@lists.ubuntu.com>; Tue, 22 Nov 2022 00:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1669077353;
 bh=BDm3V/NsdO2NDOAy7sfYrJzlkP6mSwgmP1srvFkLTSc=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=GkQojLEO0/iyOnBkaBR6TfgrhvmV7jB3Af40A37PDGrRCfwHz6cvbGj1SRs9piBFW
 3q/Vhy/AkbBvhdlY1NIDS+Rww4xyUYUTqF4Tm4fs11Y408i+/ynH+FKciTuMU7AKVC
 OsCcHEWYRX/rML9ZYHq5iUPqH5/ri0fpFPvd7Q+CMh+l6x4ooZBoOvW1sjKx6WF1y5
 0+j3Qr7YxudAm287QEpnL5ay1RL2fco7+YyUT4hK7eVM2lTaWNKFdRN0KGpWk5giSZ
 YWcIuS6vwB9pHcghGNWwNvW+GyXUaLZuS1fKJYEBAjANprSenTKO55t6osd+s9IM7B
 gax2DaPMCzrnA==
Message-ID: <7838b941-1030-2313-cad1-ba7b21267fe8@canonical.com>
Date: Mon, 21 Nov 2022 16:35:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  AppArmor 3.1.2 Released
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

The AppArmor development team is pleased to announce the 3.1.2 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.1.2


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.2

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!





