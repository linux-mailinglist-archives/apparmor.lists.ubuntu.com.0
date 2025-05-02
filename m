Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4393DAA6809
	for <lists+apparmor@lfdr.de>; Fri,  2 May 2025 02:56:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uAehG-0007EG-EW; Fri, 02 May 2025 00:56:10 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uAehF-0007Dx-1T
 for apparmor@lists.ubuntu.com; Fri, 02 May 2025 00:56:09 +0000
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A209C3F5B1
 for <apparmor@lists.ubuntu.com>; Fri,  2 May 2025 00:56:08 +0000 (UTC)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3032f4eca83so1391590a91.3
 for <apparmor@lists.ubuntu.com>; Thu, 01 May 2025 17:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746147367; x=1746752167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oJ+XyBE51k8dH55/leHem5JOi7y8O4XN6Pq/HDwqzf4=;
 b=pzIwJu2CEcmQsoeEC0ZS3UaYTsm+VQ2TJkkmKDR8eq8vvRTm8ST9Xl9YN/PzbFqDZM
 2TzH85F2j6L5pUFuDCbaboatJel60ERlTBuJ0//6Mh8Z9swmLXfWLQr1dxMezT+bxR5E
 K1nSOzwPZOrDMvUIhtMINTTcZNvBMfqjP/0Lj2xBsWtzZUAradHQ6K1i87mSz2ARH9GR
 kRHqznDTIak4tE2iL0sMj0CLsaKpX1LmXg8bPCs+hS9gzCa/N39Q9Sxvyo7b19kaIZky
 +1o2I1bdexpIq9CCvtGG/mPWyfizrAfFyDdeDcKNUWs6v8J/jYqlO/LKE6KHrj9d8EQ8
 P1dA==
X-Gm-Message-State: AOJu0YxUt/OBD4NanvO+Fu8N8lJC6wD9K7S+e/pHft7pQBQ+A100QE9S
 PKvJZYtBEMoC924i9qHGXpoYxtTVUW2WdyyjdKNly9XC1j5vfp4njqaNkVADlMs9bWD4p9ckr5/
 G25JgUUTmNy6O7bmk2SJdrRiL1+Guqz5dFo0Jcv1loITx76gLAmTOIPk1OYh2+RNuwhXdROh1ex
 N729QEjhZH
X-Gm-Gg: ASbGncvtjSjRp6CHrLmbcV+LIh1A0APEjaUlcAkYZJBs2r2JRc/7CF5VQpLzJi+Ixs0
 m4qDHwNdacQywojBhrYUDVcw7uA/3h1fGR4LJcrf4nY8eQVTvUHK6S+7chz16Vmg/08NPYgHIFt
 p57nwGyFVdJ6f0yOccQQqJ57yBf+XxtDz8jPV5ByYgnO7yqfbE5zCT5/ZOKIXbdQ+8I+CqzGKsX
 QaGUKXEwc2DD5eQvJFv6fxLK9ZNvaFsfQVcK4NNUQahE/D1GUWUOmYxVRknFQIePJKAyhQx5J52
 Oz+qrUUFbEzoIV24F2ynNg2BmoJXmmX79Q/5DKWH8gjbQjcwCIrbTMIQpaDn9BMQ8ldlEA==
X-Received: by 2002:a17:90b:37c5:b0:2f4:4500:bb4d with SMTP id
 98e67ed59e1d1-30a4e5ce8d5mr1767178a91.20.1746147366989; 
 Thu, 01 May 2025 17:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDU183upO8BWQDBql2wMHseYfrQZYrYsM2s0FASAHI0Lze4n2CQZ3BVTdo6rFBzFOotHW/og==
X-Received: by 2002:a17:90b:37c5:b0:2f4:4500:bb4d with SMTP id
 98e67ed59e1d1-30a4e5ce8d5mr1767159a91.20.1746147366634; 
 Thu, 01 May 2025 17:56:06 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e108fdc70sm2655635ad.108.2025.05.01.17.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 17:56:06 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Thu,  1 May 2025 17:55:42 -0700
Message-ID: <20250502005558.8257-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 0/4] Unconditionally generate audit log entries
	upon encountering conflicting attachments
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

When profile attachment fails due to conflicting attachments, confinement silently
falls back onto either unconfined (if transitioning from unconfined) or onto ix/ux
(if transitioning via a pix/pux rule in a profile). However, conflicting attachments
are an error condition, so such occurences should be audited unconditionally. This
patchset implements such auditing.

Ryan Lee (4):
  apparmor: force audit on unconfined exec if info is set by find_attach
  apparmor: move the "conflicting profile attachments" infostr to a
    const declaration
  apparmor: include conflicting attachment info for confined ix/ux
    fallback
  apparmor: force auditing of conflicting attachment execs from confined

 security/apparmor/domain.c | 59 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

-- 
2.43.0


