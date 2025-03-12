Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C153A5E66C
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 22:22:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsTXJ-0000TG-Pe; Wed, 12 Mar 2025 21:22:45 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsTXI-0000Sm-DO
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 21:22:44 +0000
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0C9AF3FCC8
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 21:22:44 +0000 (UTC)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3011c150130so466218a91.2
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 14:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741814562; x=1742419362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UYHE7PfrFzAetCRzPVVNsPinECVfo2Zm0WG/ZDMIyJE=;
 b=eyygpIlr7LHfHAk62BiejBdn/EfFz7b6wkko0utiD7sxWUFVmYwNODv9dgBkB5CHQJ
 g5pKer928RxRSduJ07/oTHFBMl/S2jO12cCYAvELo0zP2lW3vsyRt98A4TToeKraduHV
 a5CtNr1dRS1WJQaJUStGbLko9bTCLC/0lOI5fNHqlIoYaeSVQ/qIR9jOBDFZDakTecv+
 NZctQed+EnFv6WcHiP4vzzyYHsPjOuYqydFEV0/+SKHZWNBaY6frjH9BMKRCp56CVHcR
 Ig7WrfQfizCn/EBaKvuCELyzNPSyY4PSf1/rG/jHWzp2DADlcJ40xHUER0O42v+dNAHM
 ARRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ/krQ/9rVHbqpneL/6sQPDDbUN3+sWfIKIxFYNHZXgaH+6q/EdXzHWKBVLG6jaDx4U7a9zXOwdA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yw3coFVZkN8OHzO1cgliCpm6u8tWuHaPBc8Es9HlhidAixcGCTU
 7ek8YvTLA8bYt3VbFnNJHaro/2eRR4eQqZSE3QXnysrrDY07VcRkmX12qKWNjBwzbqIewwLa5kE
 oLIcn/QlGkqddEItXVx7RWI4IbB6J0LLFaMqrheZ/DLJhrw7OlaT6UNolD7dVaJKNAFAtcr2MKR
 ydt9wPNHC0
X-Gm-Gg: ASbGncu2gPX075IphEG+FN/AtT7rfHp0f7CTyPA3LeMkqByiz7odwSRgkWWdRVFwUqU
 ouPabPrDom/1XlxCZeyV0P0t5xVuUSMt07NiTX9vOoWa8tA9TTKw4ArtzCt0MlNRfcO50AqvcDS
 C2NSfkmx/NBRMxkDXns+QlIxFLnWhM0TI8n8KaPz7bRXPQeKj1fdoM6upRT6m+Y64SEKxGjnlmf
 VmcD9LvNFgRNMpXqsisUv16C7Uj+TeIJe3RHCX7SR8r9OLp2Kj+4uu1XAjlSnq3zQCQtE21lRzJ
 o8lVvm9xWOF96Q2vP53Mhzsb7YSKRklpJZIf8cC5qzYWGNZ7DnZ3oHdt99v+w5gLbRSbsJ0=
X-Received: by 2002:a17:90b:1d8c:b0:2ee:f677:aa14 with SMTP id
 98e67ed59e1d1-2ff7ce6ff9dmr33955122a91.13.1741814562170; 
 Wed, 12 Mar 2025 14:22:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESqd74aQLaRYMlhUC52mOCTMPtX58VJpqPHYNlhWsmVgCtfWUR4bux5MtYAMon8vBiSS29gA==
X-Received: by 2002:a17:90b:1d8c:b0:2ee:f677:aa14 with SMTP id
 98e67ed59e1d1-2ff7ce6ff9dmr33955108a91.13.1741814561871; 
 Wed, 12 Mar 2025 14:22:41 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301190b98b7sm2353887a91.32.2025.03.12.14.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:22:41 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org
Date: Wed, 12 Mar 2025 14:21:40 -0700
Message-ID: <20250312212148.274205-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [RFC PATCH 0/6] fs,
	lsm: mediate O_PATH fd creation in file_open hook
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
 =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Calls to the openat(2) family of syscalls are mediated by the file_open LSM
hook, but the opening of O_PATH file descriptors completely bypasses LSM
mediation, preventing LSMs from initializing LSM file security context
blobs for such file descriptors for use in other mediation hooks.

This patchset enables mediation of O_PATH file descriptors through the
file_open hook and updates the LSMs using that hook to unconditionally
allow creation of O_PATH fds, in order to preserve the existing behavior.
However, the LSM patches are primarily meant as a starting point for
discussions on how each one wants to handle O_PATH fd creation.

Ryan Lee (6):
  fs: invoke LSM file_open hook in do_dentry_open for O_PATH fds as well
  apparmor: explicitly skip mediation of O_PATH file descriptors
  landlock: explicitly skip mediation of O_PATH file descriptors
  selinux: explicitly skip mediation of O_PATH file descriptors
  smack: explicitly skip mediation of O_PATH file descriptors
  tomoyo: explicitly skip mediation of O_PATH file descriptors

 fs/open.c                  |  7 ++++++-
 security/apparmor/lsm.c    | 10 ++++++++++
 security/landlock/fs.c     |  8 ++++++++
 security/selinux/hooks.c   |  5 +++++
 security/smack/smack_lsm.c |  4 ++++
 security/tomoyo/file.c     |  4 ++++
 6 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.43.0


