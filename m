Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A0AA6478
	for <lists+apparmor@lfdr.de>; Thu,  1 May 2025 21:55:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uAZzi-00013r-2h; Thu, 01 May 2025 19:54:54 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uAZze-00013b-Av
 for apparmor@lists.ubuntu.com; Thu, 01 May 2025 19:54:50 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B37423F366
 for <apparmor@lists.ubuntu.com>; Thu,  1 May 2025 19:54:49 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-224192ff68bso11924445ad.1
 for <apparmor@lists.ubuntu.com>; Thu, 01 May 2025 12:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746129288; x=1746734088;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bl4J3hxguplPgRJdTjrOkJbzNbY8RdZruzVkRbk1V/k=;
 b=FYKmCpPHq0SX0vvX4Va04oTrjUUVDOKI/UXyphFWpRkdALEQiNWlOUsYxbfgW0eo44
 16G38MUSnVh2BA/c9dFAbWjjLKJLHjdS7jQcjayx10CZRKSWmTZh77RoRn/1whrZ9w7x
 KQh8k/I5bHdS1cIpNGbKumILqiRKZ144/9UC1j+k9qeJAQiUA6tkH0zvqrpu+kVeQEaq
 GxaivkrAgop/nUGX3zlmXB9ZOp4eSfZgPYece7uPA5CYtvpVZmJ6uMDyaGGXHy9PyGUm
 xHaGLHLF89IzayjIZi7WpEmgWpktU/aRUM2ptZQjzIFRKTXQPv4g7q6xem11nYcgbknj
 klHA==
X-Gm-Message-State: AOJu0YzYsyBlF8dcDsfeWRVDlnuAvVvwcz6Jd2tPP2H7sb3m7IQ3i1L+
 2e4etaREEYWVX0qUuwHvviuso1OD4+suxoXxfhcIKjsJ3JriVSFOQeu8edMleFkdItVf2xdLB3T
 PxQcd7K6TSHxE6xk8+dxzLCYwuu8A5rxK3fWTw2g4QcW3m+cA4uEMY+/WGksvdgEYUsxmsm0B+0
 dD63oW4scP
X-Gm-Gg: ASbGncv9eeVth1hj0sMdx0DdVAPF3UiowmQLYPNivh4SQ1AOvAVawMYSAgnW0rOZgGQ
 XTl6RPef2Z+Gnpil797XaE4sFZEbbLSGgScXOIENTUuLbStIQqkaKjpG+J+QDhGxneDSZ6WM7K1
 GYaasjj+8XGMIhMNDzeo9Xk62P9FcdgQrpcXFyVDR+CCf+YogowlKQbZQ+w1vLwnXaIsuXMW4DE
 kKqDVYlkon4QJOu5CHlFoS0LQlG8gJf4j8Wv37/ZD97ATnftXq11wbcv7RlmS1JV2hLJaoy6Oez
 KB+y6WSZlo9/cJTAZ8pUR95WHuKv44F7Mq4K6K+I079JimFGAVFKtr4e97T1jyicNnyFew==
X-Received: by 2002:a17:903:41cf:b0:224:2524:3047 with SMTP id
 d9443c01a7336-22e102f7041mr4493395ad.26.1746129288402; 
 Thu, 01 May 2025 12:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHguShofUTCULxvwX+Bj+PK4MI+mVNXZQIwKXVEhi+kUuPZwCHXUPXiJ9Yu7u70XjjpPpalIw==
X-Received: by 2002:a17:903:41cf:b0:224:2524:3047 with SMTP id
 d9443c01a7336-22e102f7041mr4493175ad.26.1746129288082; 
 Thu, 01 May 2025 12:54:48 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1084dedfsm269275ad.27.2025.05.01.12.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 12:54:47 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu,  1 May 2025 12:54:37 -0700
Message-ID: <20250501195440.372104-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 0/2] Fix various bugs involving aa_dfa_leftmatch
	and conflicting attachment resolution
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

While developing a patchset (emails for those forthcoming) to generate
audit logs upon detection of conflicting attachments, I also discovered
multiple bugs in the aa_dfa_leftmatch count generation logic (details in
the commit messages for each patch). These are patches to fix those bugs
and enable conflicting attachments to be detected in more cases.

Ryan Lee (2):
  apparmor: ensure WB_HISTORY_SIZE value is a power of 2
  apparmor: fix loop detection used in conflicting attachment resolution

 security/apparmor/include/match.h |  8 +++-----
 security/apparmor/match.c         | 23 ++++++++++++-----------
 2 files changed, 15 insertions(+), 16 deletions(-)

-- 
2.43.0


