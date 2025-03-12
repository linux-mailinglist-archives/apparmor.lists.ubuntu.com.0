Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AF131A5E670
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 22:23:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsTXS-0000XI-KQ; Wed, 12 Mar 2025 21:22:54 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsTXQ-0000Uk-Me
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 21:22:52 +0000
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2130F3F2B4
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 21:22:50 +0000 (UTC)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ff69646218so756866a91.3
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 14:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741814568; x=1742419368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQ5ilq+qjctbW08HSKcwKvLmj0dzCcpGagg2F3uVrL4=;
 b=eXPAs4nABiFuTSb3IcVngaFtPY/x4yvw839bQm3eYtVDQECkiVwv4f4sMkRzmhoViQ
 GkMNkSke2cIZiW78nYzNXhfcL4oqlrLkpWX+vdUrhqK7fIWlffN9UfbKkewkle+ez59L
 O5IT6lDrTbbArj8ztlc/fuyG8ST6MLZ46ZXTmwk6LHTwfzZV1xr0Js3bjyt71oQUB2iL
 xQl+bBMRswFWbhHuwMfQyu9gdZjFFdcruodTG6CKa0Ji6Nd+Cbjy0dN22ZjrJB2QD4Q+
 VvqqoxAihGbWWnxmsb6kVE00pDoY/0kG61TvzvbYnsL7ma7pfCAIw7rtSg/p/hRk4/Yu
 DJKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcvtda2XYbwoCxb/3zgrdtXjMC55ZDm2W9De8D5J3gT4WQbJ4JBaamQ9jSFV6zHVWRcvekt6aJpg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yz0sRed4EVA6ijNSKOlESQvWYo1kjk4cKO2S9CKKOWaRq98cd4A
 dsbk/JtIcz91Lhae9C2L/ViM8f+htCRGgiGg/QptRJhtO5N5AbXqaemcJVSSftToyLp7YIPvC0J
 a9rjd/L3uUSYIlAZscUdhwiMkT3EwtrGkS0kDkbTy5MqyX+HkOvPRlTMweUiRVQb9D8h1YKfHpA
 ==
X-Gm-Gg: ASbGnct5ncTP1aw9Y71dvKEkhKx0Fp4VAprChnyYtnFrLRzPQAckbEP2zxV0kibOh45
 0Yq5sKLsJatQ6Kc6Cdv2nBFLhwOJFAyhql60b22KVYmVAO38aj2brgxMPIcZFkUmucqb4JIMT2x
 fum2sp7lXFvea9Qyo+dBEuaSmSN8YSrFOyNxgG84cdBOAEvURJjLwU9uyF4UGTFVDE6/iMTBiDa
 dlRm4yBIrjgOtbeCwXlbZ463qVO4AgkXc4g/u2E/WJb7YHus5+OIC49WhoieIHDjOMmb6gwz8nA
 cGQvZmK/Ie7IGwyVSF3nykPB2xsgrql/5OyOBFnVfvY9ABzXNUcT79qBBbV8s6ArdMJsphY=
X-Received: by 2002:a17:90b:38c8:b0:2ee:74a1:fba2 with SMTP id
 98e67ed59e1d1-2ff7ce84c7bmr34243263a91.20.1741814568681; 
 Wed, 12 Mar 2025 14:22:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6kNFGkR2Ar2yfV2Wm7/OWkigwZeggzkNDef+VFj2HbCWbxEzVxXle+EcNd+qkPs6JAUusng==
X-Received: by 2002:a17:90b:38c8:b0:2ee:74a1:fba2 with SMTP id
 98e67ed59e1d1-2ff7ce84c7bmr34243239a91.20.1741814568350; 
 Wed, 12 Mar 2025 14:22:48 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301190b98b7sm2353887a91.32.2025.03.12.14.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:22:47 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org
Date: Wed, 12 Mar 2025 14:21:43 -0700
Message-ID: <20250312212148.274205-4-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312212148.274205-1-ryan.lee@canonical.com>
References: <20250312212148.274205-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [RFC PATCH 3/6] landlock: explicitly skip mediation of
	O_PATH file descriptors
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

Landlock currently does not have handling of O_PATH fds. Now that they
are being passed to the file_open hook, explicitly skip mediation of
them until we can handle them.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/landlock/fs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/security/landlock/fs.c b/security/landlock/fs.c
index 0804f76a67be..37b2167bf4c6 100644
--- a/security/landlock/fs.c
+++ b/security/landlock/fs.c
@@ -1522,6 +1522,14 @@ static int hook_file_open(struct file *const file)
 	if (!dom)
 		return 0;
 
+	/*
+	 * Preserve the behavior of O_PATH fd creation not being mediated, for
+	 * now.  Remove this when the comment below about handling O_PATH fds
+	 * is resolved.
+	 */
+	if (file->f_flags & O_PATH)
+		return 0;
+
 	/*
 	 * Because a file may be opened with O_PATH, get_required_file_open_access()
 	 * may return 0.  This case will be handled with a future Landlock
-- 
2.43.0

base-kernel: v6.14-rc6

