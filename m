Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C49F2A5E672
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 22:23:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsTXV-0000ai-Q5; Wed, 12 Mar 2025 21:22:57 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsTXT-0000XK-LL
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 21:22:55 +0000
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0E9C73F735
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 21:22:54 +0000 (UTC)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff6af1e264so714044a91.3
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 14:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741814571; x=1742419371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vkBChevR2KYwwFZBDZ6M820pfzcyPKZb2PO3mstNSrA=;
 b=vkt/j3NiBtqgPSgracHb9ufhax0NilwDqNtfLbpM09buEtQl95WADhNgq5eBJ5lZAJ
 BRNRVkq3RKWSYO6sOeR/KUXDmI6w9OWLftJk/k1VDpSNtLvmCSSFKi1DNqJcyoEQYHT0
 mXWWCat7qKvRqFZnMQfGgkZbu9oLPrWC0FnI/2XnJSQsE91OK46NHQaqgOz4d2TyyBfu
 uFDyJIR+XBvFdI3nJljyLSn9fT8cUeVjgzTOw1axkvWikrrjLvRkPwlDFgH0ZFRZLEq5
 VRlWgL+wndWUSKlQMUZqCODXFEwh4NiSrPZox2e6SyGSYT9MA5vr8IVjOrosL7P4rVOS
 JoMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvNf8YlJHls8tZIbtcyLDtfsw4iSyc48vDCAp00PhLZgGVQj5Fazx6N4gp8qV9EHH0zJ/S/qTs1g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YznU9UcqWxZofzCN1qlGOa+3GJAjrhPCr/ltJ064zX8e+qILavO
 j60zOHpGByrYhpa72p7das7pePJaytWhRLmhNDxAWe0XzW4kTspnPvi2qPOq76Uq9dGySQSPCtS
 /qMUjmTD/Iuk9fpA5DAC4rxG3/Dr+ZJVVcF1TuE0YgdgflCFShgRxBYNE4scwkZSVnGnvP9R+FA
 ==
X-Gm-Gg: ASbGnct4bwTYCcEGHxq/IotfiN7wtCKfyHSGM4TZJ8TQTl8aC4Usz5V8JWAC7qk9fG3
 8c/tTGTION2/Wo76il3okvTygU14EBRrrKK/LXIMGNs9kNX4WCUYYpSEuezGFDo+U19ZklE9J7L
 bXfAdPboiIHcF3CkpzdxoklFBFwtWllqBsmG5lL8WLJ3A3zkBxHA6NWYlbRYgnGgYDN/cSPEgIf
 HZotTmh8mgty2QGErkee6WYNh3d36LVCb3T23cEiKQueqzkJvEB6SWX2EIxYG/MojelrlUfgjpl
 oEuux9BzMNTvNkv1MdcPRK4y1+AKFWDPauTGw1/YPtc3mXZ/iYVhs540KvpyjemXuSsfrV4=
X-Received: by 2002:a17:90b:1b05:b0:2ee:8427:4b02 with SMTP id
 98e67ed59e1d1-2ff7cef76acmr32847530a91.28.1741814570802; 
 Wed, 12 Mar 2025 14:22:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2zy2F9PoKbQMeK6fUS3X/Yt717KlC839Q5G4xkP4Nr8/wnDbMYJ8pDxU6TgdAPfQxzzejkA==
X-Received: by 2002:a17:90b:1b05:b0:2ee:8427:4b02 with SMTP id
 98e67ed59e1d1-2ff7cef76acmr32847501a91.28.1741814570519; 
 Wed, 12 Mar 2025 14:22:50 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301190b98b7sm2353887a91.32.2025.03.12.14.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:22:50 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org
Date: Wed, 12 Mar 2025 14:21:44 -0700
Message-ID: <20250312212148.274205-5-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312212148.274205-1-ryan.lee@canonical.com>
References: <20250312212148.274205-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [RFC PATCH 4/6] selinux: explicitly skip mediation of
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

Now that O_PATH fds are being passed to the file_open hook,
unconditionally skip mediation of them to preserve existing behavior.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/selinux/hooks.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 07f71e6c2660..886ee9381507 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -4009,6 +4009,11 @@ static int selinux_file_open(struct file *file)
 	 */
 	fsec->isid = isec->sid;
 	fsec->pseqno = avc_policy_seqno();
+
+	/* Preserve the behavior of O_PATH fd creation not being mediated */
+	if (file->f_flags & O_PATH)
+		return 0;
+
 	/*
 	 * Since the inode label or policy seqno may have changed
 	 * between the selinux_inode_permission check and the saving
-- 
2.43.0

base-kernel: v6.14-rc6

