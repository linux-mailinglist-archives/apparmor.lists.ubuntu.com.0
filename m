Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CCC54BAB3
	for <lists+apparmor@lfdr.de>; Tue, 14 Jun 2022 21:41:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1o1CPz-000352-NV; Tue, 14 Jun 2022 19:41:39 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jon.tourville@canonical.com>) id 1o1CPy-00034v-SQ
 for apparmor@lists.ubuntu.com; Tue, 14 Jun 2022 19:41:38 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A22483F21E
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jun 2022 19:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1655235698;
 bh=lpa7aCJ8YtnOu6yju+SWS1dnfpt9ofdbJuF7NNKCOVY=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=q4LAZDudSFU9a6qJf2eTwyd3ElWsqUuxhFStF13gAhBeHFR+oKcO9jd2DJPJBxvRl
 wCr80OXko5Y4DsiMZBU7HZ+k5vxYODjFxbtJ/ezupcj3AsxxCFYXtN3ryZFH1ERnDv
 jS4Eq/0BL10zjsWnJmN2oUIkvkQyLmnuL6RmqLH/2Oh6qOWWOUyainOofcm86nhDQN
 z7fULDFUnqbcALtgfEOsIEwBOd5MOKtlSYtta5CiW/mswCWzUesDdxf3YThOCiqYwS
 Hem2N+t32fEQV7YvtRxGfSLTGzIZpaH6ipRZwyssdmOYmWBr8xp4y1i9pGtLFUiwqJ
 cmcBrhqSDvg1Q==
Received: by mail-qt1-f198.google.com with SMTP id
 h15-20020ac87d4f000000b00305118d3088so7335962qtb.9
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jun 2022 12:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lpa7aCJ8YtnOu6yju+SWS1dnfpt9ofdbJuF7NNKCOVY=;
 b=lRWbhF0lBgKOHxnjo+zrQmrjv4WgvTbrZoXnPY3fL+WzxwJf1FwskBY0QfOID1Hbo4
 cu/A8iwBaap5pKXlnHPTZetaYF4xmIoBK2WTF6aj4BH9BoJxCJB7nhYW9UQ5J0trAS3K
 xVmiSR6ltmbDlmo7nBigGhv940WMfJpcXpEtby3e4vRMoHYxjlwL5VN08TWAwg2Gtfi3
 FpTn0B1C2DJFFK4bI3AB1z31o0uIlrqe0nDJ7viIwPwg26BzEzMbT7t4Bf4bOdA794pS
 UAIvMOSpYH4+ZT85X6958j7ZaYh9ZiIbNe5M+mLdfaTJcl1vQ1P1/ObJSVdapnRWGtl/
 I6BQ==
X-Gm-Message-State: AJIora9JhBLoLKJvTtsrF2Br5xHyTy1GFA8M4jCUUJRdUEc6tChFAKAf
 zv0bTkWfsi+8GYylh886aMwihtIwqK7GocJ39az1RnJEbG0KNZ+vA8iE4vgQijC53OozMYVCHqY
 16y8Ae2Iu80XjSJCnHUIXezOtrjyqeTndsQ0gog==
X-Received: by 2002:ad4:5c87:0:b0:464:5127:6b5b with SMTP id
 o7-20020ad45c87000000b0046451276b5bmr4879185qvh.32.1655235697680; 
 Tue, 14 Jun 2022 12:41:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tE+CPAtB5RMW079PV9kkAoEOr7lf+8QjAqnjKxpHaBaNLBgoguWXXoJQHyF9K5c3YQ3jf/6w==
X-Received: by 2002:ad4:5c87:0:b0:464:5127:6b5b with SMTP id
 o7-20020ad45c87000000b0046451276b5bmr4879175qvh.32.1655235697485; 
 Tue, 14 Jun 2022 12:41:37 -0700 (PDT)
Received: from eeloo.lan ([136.53.37.162]) by smtp.gmail.com with ESMTPSA id
 w11-20020a05620a424b00b006a6a7b4e7besm10626389qko.109.2022.06.14.12.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 12:41:36 -0700 (PDT)
From: Jon Tourville <jon.tourville@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue, 14 Jun 2022 14:40:50 -0500
Message-Id: <20220614194052.1833833-1-jon.tourville@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 0/2] apparmor: switch from zlib to zstd
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

This changes the algorithm used by apparmor to compress profile data             
from zlib to zstd, using the new zstd API introduced in 5.16.                    
                                                                                 
Zstd provides a larger range of compression levels than zlib and                 
significantly better performance at the default level (for a relatively          
small increase in compressed size).                                              
                                                                                 
At the default compression levels, zstd's execution time was 16% that            
of zlib with a size of 111%. At maximum compression levels, zstd's               
execution time was 187% that of zlib with a size of 88%. This gives              
users options for either improving performance or decreasing memory              
usage over zlib.                                                                 
                                                                                 
Performance testing was done in the kernel against the default set of            
profiles loaded by a fresh install of Ubuntu 22.04 desktop.                      
                                                                                 
v2: Patch review changes                                                         
    - Reallocate output buffer to the compressed size                            
    - Add sysfs files to expose min/max values for                               
      raw_data_compression_level                                                 

Jon Tourville (2):
  apparmor: use zstd compression for profile data
  apparmor: expose compression level limits in sysfs

 security/apparmor/Kconfig         |   4 +-
 security/apparmor/apparmorfs.c    |  89 ++++++++++++++----------
 security/apparmor/lsm.c           |  10 +--
 security/apparmor/policy_unpack.c | 109 ++++++++++++++----------------
 4 files changed, 109 insertions(+), 103 deletions(-)

-- 
2.34.1


