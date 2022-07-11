Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D621956D851
	for <lists+apparmor@lfdr.de>; Mon, 11 Jul 2022 10:39:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oAowV-0004OG-8U; Mon, 11 Jul 2022 08:38:59 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oAowT-0004O9-Vq
 for apparmor@lists.ubuntu.com; Mon, 11 Jul 2022 08:38:57 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 5D19A3F165
 for <apparmor@lists.ubuntu.com>; Mon, 11 Jul 2022 08:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1657528737;
 bh=gR1OLGMF46VGI5m59J05JpyDpFkl82xuA7BGzeKHx80=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=nNsfQVUHw/KMTOgGB8s0SlpcFR6a3uHdzvJDjmg1QG6cZCgGUA+VRTkfwyleIacBa
 FtoxrmalZr7Sudp4A4WAKNpgFZXJotPhAfDkBQi9eBltagnOaO0aou0qym/60nlgrW
 8RtbHYz7IKAGkTcgg1AJ1EZRiQKasijbIr3ZswndZeO9PqYJsxNYzqc9zu4mfnC7PV
 4Tng4KSWzovpQ0mqmcbZ2uq+yIB9O4iTjPgRqIGb2eTWAXFAJ3XYogbRpCJQ6Tt1WO
 QPmQRxjlEFFFW/wpaprMJSb5OBrr8cXscTe2UWotp1j1LOZmh45pVLnsmYt6+Z2AZH
 FoF8NygcDs34Q==
Message-ID: <a66763f0-4ea5-6de2-948d-3325e85018a4@canonical.com>
Date: Mon, 11 Jul 2022 01:38:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  irc meeting Tues July 12
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

The next irc meeting is Tuesday July 12, at 18:00 UTC in #apparmor on oftc.net

Please update the agenda https://gitlab.com/apparmor/apparmor/wikis/MeetingAgenda or reply to this mail if you have items you want to add


