Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D96C4A4EEE2
	for <lists+apparmor@lfdr.de>; Tue,  4 Mar 2025 21:56:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpZJB-0002k5-1c; Tue, 04 Mar 2025 20:56:09 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpZJ9-0002jy-VN
 for apparmor@lists.ubuntu.com; Tue, 04 Mar 2025 20:56:07 +0000
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 793303F46B
 for <apparmor@lists.ubuntu.com>; Tue,  4 Mar 2025 20:56:07 +0000 (UTC)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2feded265deso6202984a91.2
 for <apparmor@lists.ubuntu.com>; Tue, 04 Mar 2025 12:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741121766; x=1741726566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XBd7R2kZHYWy3wlEDHrLHTQVBce6dppQ/eqtvEnEI/4=;
 b=dLHqNlGJiBjI01QPYrbJArjed14lLlZkbMY4svo+8Jy/Gaq9Z5XYCQ5bzBYzsl/cOj
 V6d+b+XDq3NqZDjXrGqbKAjzWyidJtH7aDQb0GbNmg8H2llhaaB6RhMV4O52t1owloYO
 BF40vfjTQ+6qr8k9o5mtljhw+k+FKTJEGvZBK7h4UlRunoj1hEUi4+3IFeubr8TibzFK
 ODev59ss7pQigbkqseFlX8h1ni6Kdkfx7SXaPWhe0b+CWDA+1Mkm8uGfz9Jg7cS8VO22
 2jSoT/8LtPvuyvsMyhw9LsA9y4XHurOOn60p+2Ab5hOfgv99/MB3Pxpn43PPQgZ7sv8f
 6KSA==
X-Gm-Message-State: AOJu0YzWgoNtP7Fv4vynfQFSsL6jMsIGWRaNnS8iKWa7r1fgpxlHPofL
 wWkJsQWvuU50UZITUjLhVc0OZfRvUWCQtlBgDo3K8Fuu8iLoH4LJRiqzrSf2CeR7n7eDQ0cccpv
 0VqLn3ZHjZX8/3zoPzHTNWJj3N++nx8fCYrgEc20Ar+AVbqlk/aarWakVIGM7TgTB70SXrtuTEu
 GGSHVKxA==
X-Gm-Gg: ASbGncvQ+NWjT/AFim9iLmcK8IRR4GdBQJxnJwUlIbSFvY1t0JQcQfNvuCs5lxW6lPG
 /8cwrq+EIkeooSnNvjz19eS1/cxrseAVuno83AfPJAay1iiGN9LSTaH16vMI6g79jwiKq0QrSgO
 yvUeujrxLYwWovCJiqMkP3ojbxfODxW/4h0YnSiZRKt5nvOYX07IM+eaGwdwcR3+Tz4mY6hwK+1
 6k9fDD2AKaqm6hBNmkZsYecgsHHdqCtE1sLBty3GlMiRJX/8QiCkTGvzTkL8onC2ORtAf5CHhMq
 a63YF+MArCkHw7GSTr6sg2GYob5u/8SNNpuv78wALW7RjBXNrnGhhoHoI7rtcoIMpWmdFBg=
X-Received: by 2002:a05:6a20:4393:b0:1f3:3c5d:cd7e with SMTP id
 adf61e73a8af0-1f349498186mr1131220637.24.1741121766104; 
 Tue, 04 Mar 2025 12:56:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMHjki6o7wcCPEpOshvet6OyN0PYoBiwdJ5SNOCcBhXvzu0plmvo11eTgyr5gGAv22usyHAg==
X-Received: by 2002:a05:6a20:4393:b0:1f3:3c5d:cd7e with SMTP id
 adf61e73a8af0-1f349498186mr1131192637.24.1741121765767; 
 Tue, 04 Mar 2025 12:56:05 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73630a224b3sm7743853b3a.164.2025.03.04.12.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 12:56:05 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue,  4 Mar 2025 12:55:49 -0800
Message-ID: <20250304205556.290042-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 0/5] Enable operations with disconnected paths to
	succeed in complain mode
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


