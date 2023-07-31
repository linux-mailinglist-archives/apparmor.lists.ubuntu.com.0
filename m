Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A6F769089
	for <lists+apparmor@lfdr.de>; Mon, 31 Jul 2023 10:43:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qQOUS-0007yn-Ib; Mon, 31 Jul 2023 08:42:56 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kamrankhadijadj@gmail.com>) id 1qQN0M-0001eJ-D3
 for apparmor@lists.ubuntu.com; Mon, 31 Jul 2023 07:07:46 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-3fe110de3b6so16616395e9.1
 for <apparmor@lists.ubuntu.com>; Mon, 31 Jul 2023 00:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690787265; x=1691392065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CrTsz8QawI4NoHoGnNEcszB2yjFUPV7z0R4z7qGc2Tg=;
 b=cMmkR/Nw8pe8AaKpbaRL9SRljMNQBv8XEvvy+xwdGDc8CoC16Gq1t8q9XujyqUD/ZV
 CUgid/Kb7nQkFFOoxbmNtkMficwKnJFW84MToIfcNr4PKT+chcVnL2hcP4DGV+QgLFwB
 8LjSwkGKTQ4OAfxSKEQ34VPvLWjkx8jycS70ciiudM8pbgACJuS2d0t0Kral8K9qcYLV
 pXeoexF57S6kZAKrr6mCo8zX2mAx/9NLP5iKEBfZqEoRHC5+ZUmeWPoFPkHX6Q7GVK2G
 l93oNndBLwckSonT2e3EDf/TfD3b4rCDyKAseHe3FD3gqJecPNGzhDsKXcrTSwBgDPIg
 cw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690787265; x=1691392065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CrTsz8QawI4NoHoGnNEcszB2yjFUPV7z0R4z7qGc2Tg=;
 b=jbAEuWekQ7scFDh2sjWUToACHIQt+EVV1nVXm7Rn7PA1quQy8FMEaCYHgPK08D9hTI
 /mZEXpPLbZHkqjZMP/XOLaC22c/ZtgaMQpHQiqtPGquVI7YKJILGKccs9H1INxfIryi4
 JnXQ9++ZeNaITRhLPdLytxtMpPK+QNiKNFSeGKjY9iU4twXZkNIqivHSqY2kGkV4ruzo
 UR/5F7D1QWmPe0K0C1wKE+pLwxtGw5BeQsUKaN0dtbhAf9W9IiypDKJH0T/ssn9ZyjvE
 5OeD8qA/eYYml26H84viy3gDc8xyOtwJf/pvlLPLkwIoIxA65ifKqhe76ZEl/1eshaCO
 fXkA==
X-Gm-Message-State: ABy/qLbdqbsTXmn0AORORGf/k5lHvUMV+p53irALu9C9rXR29lJEVRP9
 onmWH5t7zF+4ufbYYwdDDtA=
X-Google-Smtp-Source: APBJJlF2YjxFQlhdr/gdJJSW3Aeoej8UVQHl6XofWSLbtf0ibd+hIaZrJHGyDSVNaUsCo46L6b1LYA==
X-Received: by 2002:a7b:c44a:0:b0:3fb:c060:9698 with SMTP id
 l10-20020a7bc44a000000b003fbc0609698mr8041465wmi.5.1690787265337; 
 Mon, 31 Jul 2023 00:07:45 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.65.235])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a05600c1d0a00b003fd2d3462fcsm15114098wms.1.2023.07.31.00.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 00:07:44 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: paul@paul-moore.com, stephen.smalley.work@gmail.com, eparis@parisplace.org,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org, jmorris@namei.org,
 serge@hallyn.com, linux-security-module@vger.kernel.org,
 apparmor@lists.ubuntu.com, john.johansen@canonical.com,
 alison.schofield@intel.com, ztarkhani@microsoft.com
Date: Mon, 31 Jul 2023 12:07:30 +0500
Message-Id: <cover.1690786466.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.42;
 envelope-from=kamrankhadijadj@gmail.com; helo=mail-wm1-f42.google.com
X-Mailman-Approved-At: Mon, 31 Jul 2023 08:42:55 +0000
Subject: [apparmor] [PATCH 0/2] lsm: change security_capget LSM hook
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
Cc: Khadija Kamran <kamrankhadijadj@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Change security_capget LSM hook's target parameter to constant and split
cap_capget decalration line to multiple lines.

Khadija Kamran (2):
  lsm: change 'target' parameter to 'const' in security_capget LSM hook
  lsm: split cap_capget() declaration to multiple lines

 include/linux/lsm_hook_defs.h | 2 +-
 include/linux/security.h      | 7 ++++---
 kernel/capability.c           | 2 +-
 security/apparmor/lsm.c       | 2 +-
 security/commoncap.c          | 2 +-
 security/security.c           | 2 +-
 security/selinux/hooks.c      | 2 +-
 7 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.34.1


