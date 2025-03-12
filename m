Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E926A5E66E
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 22:22:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsTXP-0000V6-87; Wed, 12 Mar 2025 21:22:51 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsTXN-0000US-QD
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 21:22:49 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C976D3F2B4
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 21:22:47 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2241aad40f3so4499985ad.1
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 14:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741814564; x=1742419364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJCUu0nnTlIAwhQtLazst1i1S2GtJ41RAYnP5gniTzw=;
 b=hm2sbB6laj3kaIVqfmUIoz2J7SI4z8NyCboGAVKTaqqTw/cZvWejFUEjHKI7fBR7MS
 R3vk2QqEAsCk9MgmCpn+Ujxn1H5xex4NwuhM2BX7GRfi7e1Sp3+uyrk8vc8XWLD8vcKl
 waRgBsPfDWlskCRDRBjBEaHfB2gXkpgKGw0DFM7wxRtfRROpZGCLT305YSyjb+CDxTeE
 cp3onFTSvfVgUDr3ftoSDjP3F8zrJrIhuD94mcSwP6UWAA1+y2zO02pnvePIzwuNIiOw
 UvTzWPm38h90ZVIMSle3oKYfmGp5FXjDCTdN2b3UqlSOG1lj1ZYRWj+F44Pm66zGC6Fk
 HGKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKhuZSCKS4K5o6AOU7qYB1w8tdeJItAk9iXrQLP1iyTCj5cHakw3nNB2NZkUybUgocizpfzF+lcw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwTGdjiIjrjRJQI5McC0Ky5z1OGefD1r3XnyMvuMoyneFFSm8GC
 DGiz6f0Mst/yWbKWNCgSTJrfcfh1cYulAUJwbdLSKf103xV0oHWPkO3LQ3+gZB9j4+1J44JzpYn
 Q5gHQu+HQhmUx2mt0DJG9+5rP2ZZkF6Akv/u3BVxsrhtT/liVPd0hUUyEAZUAFxDla+iFpyB5Fg
 ==
X-Gm-Gg: ASbGnctohiOWks+qPXcnaP8g8DfQJ8mE501jRhj9BxPWEezO4SsR8kFGPbF/2sWNAG4
 wifMwQRLZMS0xOESbNry1PsSeHBPfGl6NJoEKRt4KlyTj1+9WOQlKIFuJKWkpA5PL3dXZRxUW5N
 l8XnI8L6WedU9t2YLBtnVNyPaD1V0JPW/WR49nE3NC4XIPI5DX8pynABvI+eS2xqw+BDr3sRUeT
 5O3C6QMCdqYgIugPCBbED/4yd428d2bLtsXaXBKX3QXcD2bieNHPEFSwOLY289Xt5kiKq/cGs3j
 a46vWLmdskEmObpgX4Mk1VNQZtcT1HgQ3EZx/G/Y9S0bjwsJsmzBmxzbkKvzHLWp+gEdba0=
X-Received: by 2002:a17:902:ea07:b0:224:a79:5fe4 with SMTP id
 d9443c01a7336-2242888681cmr334106845ad.2.1741814564404; 
 Wed, 12 Mar 2025 14:22:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjVvzREwSOFKw0Hfsl/h89sadLsPdTTQZ/I/XFETV/GwxC6RNVuLWxGdk5FbZ6Djc3RCsmNQ==
X-Received: by 2002:a17:902:ea07:b0:224:a79:5fe4 with SMTP id
 d9443c01a7336-2242888681cmr334106495ad.2.1741814564101; 
 Wed, 12 Mar 2025 14:22:44 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301190b98b7sm2353887a91.32.2025.03.12.14.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:22:43 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org
Date: Wed, 12 Mar 2025 14:21:41 -0700
Message-ID: <20250312212148.274205-2-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312212148.274205-1-ryan.lee@canonical.com>
References: <20250312212148.274205-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [RFC PATCH 1/6] fs: invoke LSM file_open hook in
	do_dentry_open for O_PATH fds as well
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

Currently, opening O_PATH file descriptors completely bypasses the LSM
infrastructure. Invoking the LSM file_open hook for O_PATH fds will
be necessary for e.g. mediating the fsmount() syscall.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 fs/open.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/open.c b/fs/open.c
index 30bfcddd505d..0f8542bf6cd4 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -921,8 +921,13 @@ static int do_dentry_open(struct file *f,
 	if (unlikely(f->f_flags & O_PATH)) {
 		f->f_mode = FMODE_PATH | FMODE_OPENED;
 		file_set_fsnotify_mode(f, FMODE_NONOTIFY);
 		f->f_op = &empty_fops;
-		return 0;
+		/*
+		 * do_o_path in fs/namei.c unconditionally invokes path_put
+		 * after this function returns, so don't path_put the path
+		 * upon LSM rejection of O_PATH opening
+		 */
+		return security_file_open(f);
 	}
 
 	if ((f->f_mode & (FMODE_READ | FMODE_WRITE)) == FMODE_READ) {
-- 
2.43.0

base-kernel: v6.14-rc6

