Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id F401272909F
	for <lists+apparmor@lfdr.de>; Fri,  9 Jun 2023 09:13:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q7WIs-0001aR-Up; Fri, 09 Jun 2023 07:12:58 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1q7WIr-0001aK-1L
 for apparmor@lists.ubuntu.com; Fri, 09 Jun 2023 07:12:57 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 7808341E1B
 for <apparmor@lists.ubuntu.com>; Fri,  9 Jun 2023 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1686294776;
 bh=yYmxvD+i1OxNDCI9m4u1frxB7mNsjEvIndl9Ro2NwMQ=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=WbV/duZebcP4C/bKaEQPaDHs/IPlsGJqZXAWKHTJyj+JjJK61o9JjobFAX3z6GiHV
 FHIm+WOOI6mD9VeSVsN6GEhOHMb1+ngyp9PvnzPgGZl9p+SXgIY449j9iHh9hSvuVI
 Dk13S0UVa/9KnShlBfNcq7vG1J9a3mhFoGAM8sa0V8qDIofH+TYWTmyF0ktEO11J34
 4+4EZcaCE5UXoSFO+9RA3rX8VL3sRcqFSliAF7QLwZCu+X8sgftK17ayouhGA5yF05
 xGIZ9pC24u5qMvKflJwVKhjqnFnWQ+7CLE54+/EgPrie4tQkcpM5j4fc343vxReyli
 2WxDKdOJ2cKnw==
Message-ID: <c4a31fc2-e3e4-d188-20e2-95d067daf834@canonical.com>
Date: Fri, 9 Jun 2023 00:12:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] AppArmor 3.0.11 Released
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

The AppArmor development team is pleased to announce the 3.0.11 release
of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v3.0.11


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.0.11

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!








