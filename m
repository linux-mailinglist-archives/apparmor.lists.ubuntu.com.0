Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC1A5E2FB
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 18:46:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsQ9w-0001wr-Dk; Wed, 12 Mar 2025 17:46:24 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsQ9v-0001wg-Av
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 17:46:23 +0000
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 611C93F2C4
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 17:46:22 +0000 (UTC)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2242ca2a4a5so1239395ad.2
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 10:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741801580; x=1742406380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FBQpVwtk8pvbHdYDJWeI52IACNec/2vrMU/tm/oRsQE=;
 b=wH5UpTeCwTwCCqCelYBuuVENThxYORjmzdrax9CZKObbF//6n9yfVZTd5qwX07UgqG
 7Y7BEraBDKnztYMt4VqOrga488kcESBsH9jTG6k7bzf5gBhtNcZ82R53M8dUhsfAp7MK
 dtcVYnprm6BQ1s/rZ52xSZ1xezYuKqINP1WjLa/6mTHkRrJWT3gGrZaZK/ir/8lhzJqt
 dIItGvshvYKOr0YIEHBB72z5blJTBX1FUt0aDprVKVEy0N3pi1K+UjXUCbGymwXos57F
 aqIPZ/4pZ/3wytgqw+4mcMZpYfY+FJMIyZCWWvAPqXIE5bYGFMuVykbz9FDmYzaeSbyQ
 dneg==
X-Gm-Message-State: AOJu0YzkgDLFBKtwICiy7UKpoeGSrcVXIwglAabVez4SoVwxuc4/tf38
 Z8AwJHz3FX/YTGNobSJ19Q4Ov/ZxaLDW+ygS4g9k32TKfNBMybjryY4do0m3g3CrkkntUsjMlkH
 t+PjKO1S+mtlDoafvU5Y8w+iMVbNw4//KsXyndx0SkgjyDBEmj00ucLFAnFdcT9jsH8TsLO+QWt
 EJlvssxA==
X-Gm-Gg: ASbGncs8FY8qM64W4zZ8OAN2zBKUfqgNcx7D+o4SS38Z2OZSqXrauPSnmFisEQte/+Q
 HMhaloYNV/MDeh8e0hozUW4mcrr3XmkxUAmsqsaDuTXBCF8n8ON1COBOM8ifTK2o2UmnBG9Vk+j
 sL0ENupF79mKZIvfzZZI/nf6ofz6bcua4zRuzoS004eyfhStCBgKk4ULaH721tDrWaRaDomC8dk
 4g/3ewCo3/WOoTtgJiNMLOcUvLZxcqYidm8TKFkVTz19o1qrH23afjA4b/7WCPVMYaeJqmbzsiS
 ctrNUSBhs2JGNuA4I9JmAHI2fPzArx0947ql286gBxlLf8wTsz0YJHx+uTxlvcrLcgXzNUU=
X-Received: by 2002:a05:6a00:2351:b0:730:95a6:375f with SMTP id
 d2e1a72fcca58-736aa9d39edmr36695279b3a.3.1741801580707; 
 Wed, 12 Mar 2025 10:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd/5GTnrdNFlQjKJFQMJQsH2gZRgWBF0pBuiq12wpQbOf/0kcZ1x7NraggVuARQpsaerZwvg==
X-Received: by 2002:a05:6a00:2351:b0:730:95a6:375f with SMTP id
 d2e1a72fcca58-736aa9d39edmr36695245b3a.3.1741801580351; 
 Wed, 12 Mar 2025 10:46:20 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736baa37598sm9820985b3a.90.2025.03.12.10.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:46:19 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Wed, 12 Mar 2025 10:45:58 -0700
Message-ID: <20250312174605.95563-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v2 0/5] Enable operations with disconnected paths
	to succeed in complain mode
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

AppArmor was previously blocking operations with disconnected paths, even
when the profile was loaded in complain mode. Instead, this patchset audits
the disconnected path as being prefixed with a '#' sentinel, and updates
the other code doing path lookups to continue with mediation with complain
mode profiles.

Similar checks will be needed for disconnection in the IPC case, once that
code is ready.

v1 -> v2:
 - "apparmor: create new learning profile in complain mode upon disconnect
    exec": fix grammar nit identified by Christian Boltz
 - "apparmor: disable aa_audit_file AA_BUG(!ad.request) due to fd
    inheritance": only skip the AA_BUG line in complain mode

Ryan Lee (5):
  apparmor: pass complain-mode information to aa_path_name path lookup
  apparmor: don't return early in profile_path_perm for disconnected
    paths in complain mode
  apparmor: create new learning profile in complain mode upon disconnect
    exec
  apparmor: don't bail early in mount on disconnected paths in complain
    mode
  apparmor: disable aa_audit_file AA_BUG(!ad.request) due to fd
    inheritance

 security/apparmor/domain.c       | 40 ++++++++++++++++++++++++--------
 security/apparmor/file.c         | 21 +++++++++++++----
 security/apparmor/include/path.h |  4 ++--
 security/apparmor/mount.c        | 19 +++++++++------
 security/apparmor/path.c         | 37 +++++++++++++++++++----------
 5 files changed, 86 insertions(+), 35 deletions(-)

-- 
2.43.0


