Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC9B73CDBC
	for <lists+apparmor@lfdr.de>; Sun, 25 Jun 2023 03:14:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qDEKG-0002Ff-T9; Sun, 25 Jun 2023 01:14:00 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cuigaosheng1@huawei.com>) id 1qDEK9-0002DO-RA
 for apparmor@lists.ubuntu.com; Sun, 25 Jun 2023 01:13:54 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QpXz33DRszTlBb;
 Sun, 25 Jun 2023 09:13:03 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 25 Jun 2023 09:13:50 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>, <cuigaosheng1@huawei.com>
Date: Sun, 25 Jun 2023 09:13:38 +0800
Message-ID: <20230625011349.1457810-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Subject: [apparmor] [PATCH -next 00/11] Fix kernel-doc warnings in apparmor
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Fix kernel-doc warnings in apparmor, thanks very much!

Gaosheng Cui (11):
  apparmor: Fix kernel-doc warnings in apparmor/audit.c
  apparmor: Fix kernel-doc warnings in apparmor/capability.c
  apparmor: Fix kernel-doc warnings in apparmor/domain.c
  apparmor: Fix kernel-doc warnings in apparmor/file.c
  apparmor: Fix kernel-doc warnings in apparmor/label.c
  apparmor: Fix kernel-doc warnings in apparmor/lib.c
  apparmor: Fix kernel-doc warnings in apparmor/match.c
  apparmor: Fix kernel-doc warnings in apparmor/resource.c
  apparmor: Fix kernel-doc warnings in apparmor/policy_unpack.c
  apparmor: Fix kernel-doc warnings in apparmor/policy_compat.c
  apparmor: Fix kernel-doc warnings in apparmor/policy.c

 security/apparmor/audit.c         |  1 +
 security/apparmor/capability.c    |  4 ++--
 security/apparmor/domain.c        | 10 ++++++----
 security/apparmor/file.c          |  6 +++---
 security/apparmor/label.c         | 20 +++++++++++---------
 security/apparmor/lib.c           |  4 ++--
 security/apparmor/match.c         |  4 ++--
 security/apparmor/policy.c        | 17 ++++++++++-------
 security/apparmor/policy_compat.c |  1 +
 security/apparmor/policy_unpack.c |  2 +-
 security/apparmor/resource.c      |  8 ++++----
 11 files changed, 43 insertions(+), 34 deletions(-)

-- 
2.25.1


