Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2426BA61976
	for <lists+apparmor@lfdr.de>; Fri, 14 Mar 2025 19:34:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tt9qv-00017M-Lm; Fri, 14 Mar 2025 18:33:49 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tt9qu-000178-2g
 for apparmor@lists.ubuntu.com; Fri, 14 Mar 2025 18:33:48 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DCEC33F0B1
 for <apparmor@lists.ubuntu.com>; Fri, 14 Mar 2025 18:33:47 +0000 (UTC)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-225ab4b8fe9so35882955ad.0
 for <apparmor@lists.ubuntu.com>; Fri, 14 Mar 2025 11:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741977226; x=1742582026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QmcGSTuJhuqJK24uwAUsn08B+iX+1Y+yivP+XNPb4tw=;
 b=nYwxn1L+jeCXO3Km8UDDYoGpb+fu4Lvzoi9FfJIAWpUAegrvbPjYy7s78ELFXsmIe8
 9hCLcngvyq0xANpgpOBRarOzhZsEIEZcor2MwKKuq7ThP2FOj8A1Wqhn4Lj469rXGFZI
 uZfsBZt9FUssxYa8/MK5MjsC8wuWT/PpocRO/WtR4oIWDpUSAKttJ7nhUQTsdGGlUO6e
 3BDPA3djzRxQj2agy5Mr+va+RP3DEYgAufCwsejZRFw91CgTaewCZIHUJkPH9j/0qkLy
 pU1R770+dGznhj5/HqpPhmZgj2DXyxaVRwpeSauFnw3BcWl8FVRdwuUsSzgYHzLy8I6a
 DuzQ==
X-Gm-Message-State: AOJu0YxHHGsbgH0XU4cGCMFjUU8jMVCTHz5+ChS0XCWDPDomUZ5UarqK
 BeCf1FSNqiahyLDzf8Hfdb/HOxkj/TjeLrPzEQi9pKhYDOUpaTZ7Wksnsse9FQLoAFL4IQtHLBS
 yXU/3wXkNjqpCGUBo7iKc4Ihk5dn+3hS/qgB+WjhaqLGg6JUgzAhjeHg9SqxnzGFCVXI/tMptBG
 oR7/eOWQ==
X-Gm-Gg: ASbGnctBKW3GEqCPwbzaarPFFuvEKjFQX0BTGYAHKFmGYvVCLYCSAAz9xrhqq+uPZxH
 DasX2dfQDPDsdQ9ntKI/IozEGq9T5sLj3qz76IJ6TyCMkeUJsE2xSfF42aohbMun+D8h8jnr6Y9
 Y8MarWOKm+z+s1TW1unyf/XEhjL/6ZLFqAQZa9fyo7TZozOpS2SNV9yZSZUgb6HfBokqaTshWyE
 uSrGFewiWF4mXzPdQuRyS+VFh3nBE/qLIU2h55AfqtKWg7KJYPN1y83Y0PKX7wYQqwMHadP+e0P
 UvI4xXRKbrHDg02jcn101q/4eZT2Zh1KLRd7+Q4OgItHBrwAUgDtqMr1HyFos41d2SsyKME=
X-Received: by 2002:a05:6a21:6002:b0:1ee:e785:a082 with SMTP id
 adf61e73a8af0-1f5c11275d7mr4477819637.1.1741977226289; 
 Fri, 14 Mar 2025 11:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHckNeRw+43+bck6WaHNIHh8trtFex6q1C8m4x8LjJmoM8Ogti2w1717p2ewpbAbEgQByw9A==
X-Received: by 2002:a05:6a21:6002:b0:1ee:e785:a082 with SMTP id
 adf61e73a8af0-1f5c11275d7mr4477805637.1.1741977225978; 
 Fri, 14 Mar 2025 11:33:45 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea7bcc0sm3039161a12.56.2025.03.14.11.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 11:33:45 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 14 Mar 2025 11:33:36 -0700
Message-ID: <20250314183340.681554-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 0/2] apparmor: preserve Ubuntu backcompat
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

Note: this is explicitly targeted only towards the Ubuntu kernel 6.14
series, and is *not* intended for upstream. Whenever the sysctls in
question get upstreamed, they should use the vanilla AA_SFS_FILE_BOOLEAN
and our Ubuntu-specific userspace patches adjusted accordingly.

The unconfined userns and io_uring sysctls were recently switched from
INTPTR to BOOLEAN, which resulted in sysctl output like

$ cat /sys/kernel/security/apparmor/features/policy/unconfined_restrictions/userns
yes

instead of

$ cat /sys/kernel/security/apparmor/features/policy/unconfined_restrictions/userns
1

when parts of our userspace were expecting 0/1 values for these sysctls
instead. Because there may have been other (Ubuntu-specific) consumers of
these sysctls expecting 0/1 values, we should fix the API break instead of
just fixing our own userspace patches.

Ryan Lee (2):
  apparmor: create an AA_SFS_TYPE_BOOLEAN_INTPRINT sysctl variant
  apparmor: Use AA_SFS_FILE_BOOLEAN_INTPRINT for userns and io_uring
    sysctls

 security/apparmor/apparmorfs.c         | 11 +++++++++--
 security/apparmor/include/apparmorfs.h |  6 ++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.43.0


