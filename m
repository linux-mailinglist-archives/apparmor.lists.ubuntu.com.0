Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C8998772D73
	for <lists+apparmor@lfdr.de>; Mon,  7 Aug 2023 20:02:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qT4Yk-0007i1-1O; Mon, 07 Aug 2023 18:02:26 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qT4Yi-0007ht-AH
 for apparmor@lists.ubuntu.com; Mon, 07 Aug 2023 18:02:24 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B52C03F2F7
 for <apparmor@lists.ubuntu.com>; Mon,  7 Aug 2023 18:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1691431344;
 bh=/mZevlG0blkLXD7zI8djVwKqiwpSYNs072bFnZF4O8Y=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=onFppXyKFxZS6dtx+jtRECb5z+OJyq6RMbveo9oFWPoSmEGYl3xy9ylu1g8VeV8Np
 qWByCa9kkzRsBRBTq1UjSHJgW7Iaajcz1KGY64Zb6G5boIqtCQITwg9qqXkmk+8iTs
 Q7H5e/OdIzJC3Tn7rmCvSRbR/n+6FenkcxNzHO0fSL4HdPZqor4wMBdC9yNu+8HChz
 haFxn8wWpQ9rPLJ7/SE/TK3tq7XC0eSlWUPeI1R2ra6PkDyCvjYia5iHz/1QjURuzl
 6/WJKCzaq/6sEfwsiZW3sI9odu4pP1YDDCavVKpZvu34syU2F8O4tlmZl3LodqkCYq
 L+07CJqe2wghA==
Message-ID: <009dd54e-23a5-2c70-c15d-5bc46b0f278a@canonical.com>
Date: Mon, 7 Aug 2023 11:02:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] irc meeting Tues Aug 8
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

The next irc meeting is Tuesday Aug 8, at 18:00 UTC in #apparmor on oftc.net

Please update the agenda https://gitlab.com/apparmor/apparmor/wikis/MeetingAgenda or reply to this mail if you have items you want to add


