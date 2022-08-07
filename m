Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0958BC7C
	for <lists+apparmor@lfdr.de>; Sun,  7 Aug 2022 20:38:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oKl9m-0005Lo-UR; Sun, 07 Aug 2022 18:37:46 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1oKl9m-0005Lh-5D
 for apparmor@lists.ubuntu.com; Sun, 07 Aug 2022 18:37:46 +0000
Received: from [192.168.192.83] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id AA9773F123
 for <apparmor@lists.ubuntu.com>; Sun,  7 Aug 2022 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1659897465;
 bh=SvEd4dsJCI22raeV14fxro7CjY7onp6SFJWP4JH/ijw=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=JaILQ9HzOIknTR4O0YqkB+vW2VYnroTzmnHn1Co6TmJnfk2Hy3iKT6fXXOLw8UQ6U
 0jHSZt6xsb6M7zHK8Jnc/+V4yAwZhJ/TIkOt9mpqYAerScnaGhfwI/NiNbhr2rliO1
 au9SVE+FSdyactgdgSPJNN6/73LGAZHOr75x7yixSfy3T8atoY1TK+dztieKsTMIlp
 xnYQAAhbcPXRwBCOSy42N3h77UBRfNHqznclNj2sQxroMz9JHC/Xk0Bjsi+449JmJt
 IH7Fmy8oigrgSgT29p8CdDfUYtQ5kobvWtAEvl+HcoVF4t2xTk7Zge9vFGArCrmaZy
 DlmQ53Wij9gMg==
Message-ID: <a331564d-c83e-b691-92ad-f058ef0459f3@canonical.com>
Date: Sun, 7 Aug 2022 11:37:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor]  irc meeting Tues Aug 9
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

The next irc meeting is Tuesday Aug 9, at 18:00 UTC in #apparmor on oftc.net

Please update the agenda https://gitlab.com/apparmor/apparmor/wikis/MeetingAgenda or reply to this mail if you have items you want to add



