Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DD258667E
	for <lists+apparmor@lfdr.de>; Mon,  1 Aug 2022 10:42:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oIR04-0001Ha-52; Mon, 01 Aug 2022 08:42:08 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oIR02-0001HT-KM
 for apparmor@lists.ubuntu.com; Mon, 01 Aug 2022 08:42:06 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2BFF63F124
 for <apparmor@lists.ubuntu.com>; Mon,  1 Aug 2022 08:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1659343325;
 bh=ErhcnserkJyjqKLRpdJREnLJpmHj0jiYGR3PXKiJDN0=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=lMOGjoql+AX1cmWq16Cral5eoGQex13yxgOZV0sU4sfG+hWr4M2RSGZCOBlMx43xt
 hK6bXZpLgiA7pplprB0Y/NM7boaQcN16PKYl6idasEr+csdH4Tr/XGiY08I3tnQcVm
 t+zQLPqnj20fWzVnP3fBvGGXozUtqxMRcLAadvlqCB/JfsoOVWZoKFjp5BhaVP4kTg
 AazWj55XWRa3qeW7oDZjcXv0iuUwdgy0yyKyDEpXZ+TzMS55MjsLI/5wrymNkYY/2V
 4AsZfhKuv3STLY9mdRzCPJ1mgc7WMTBdSPgwFh3P3YtqWMrxszdzdJw8KTPg580gDI
 JhXUQ0jJN9mGw==
Message-ID: <e97196cd-3c07-008c-f5a8-00ac98ff51dd@canonical.com>
Date: Mon, 1 Aug 2022 01:42:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  AppArmor 3.0.6 Released
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

The AppArmor development team is pleased to announce the 3.0.6 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.0.6


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.0.6

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!


