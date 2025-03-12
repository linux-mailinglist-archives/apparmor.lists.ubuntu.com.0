Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2CDA5E66D
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 22:22:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsTXO-0000Ua-1Z; Wed, 12 Mar 2025 21:22:50 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsTXM-0000U4-Om
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 21:22:48 +0000
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 52D923FCDD
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 21:22:48 +0000 (UTC)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ff58318acaso764372a91.0
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 14:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741814566; x=1742419366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uqtVwBDq5g90YIrppYWGT9PUS27SLEfARyjY6b0CvJw=;
 b=mkdMZ8IGgYvveuNhRSOY9kz9+kNmyM+N5tJsroeYP9G/tpERc/VynlF1UkLInvKDaf
 QhZ6zl4IeC1P8TY6ALEFHGkzOCH5BTjZ1VZfWermXFGpzGhaFpIiAOdyMSxGF/kHt3bq
 RoeN+Rew0isRZtlzKHTyoxsXu2TANtXjx2KjdNf1U3N4CW7IKRD2DxA0HPksdmS8F2fN
 6rJ5k7sH07XM56apEPJkhVQ4WCe2qmsMA22CHAnsd1Xxr3HDg+e9Let8Y5ODTKuGiF17
 enhyVVA+GtLTVWERhAI3zbEfV4Aa9Cx3hAAl9V3Bpm0cAXEY65OAhtH+5/GFhmviK92c
 7QKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwJXIFudwtq+SlsqEp78Ler6fIF4vzE7l42ULYHL+hYjFsi+NP0b29z70pqQTfHYxGnchrlEiYqw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzFjNecI1iCH+NducoJCa48S2yE11MR5mKbAcn8tPvOwa0btoIU
 cIPW9/S9Dg5iUlq3Hp834bQVtS/Cblq6GKGsBYOFpAVjV9arMWziravr0Ggk/EqORPfROnbyZ0W
 40apK3uXSTTHbdfDo2dGc/+EK1jAWDwxjy6Tqboi1XJKUQjbrSbb9ZLiib/H6t+aip23ryQByDg
 ==
X-Gm-Gg: ASbGnctrMHv+D1V4RjtnttJdhHRTE+jWs8BGjzolIYE38lOWILNmSfnbHNEp9rkTc/7
 JAnL37yI6Fe9/Xsp9/SCqAZp2zhVV3R4JKpPaDiZjtvoDKoD0xPww9otl2IeINHuF+UuJ6egSTK
 fHBBvh/ulrKFr1ygRFkabu3BZ5c3S4rv+9rLcjscO0FG8Y+FS66yOEdBA0fwVf2uo0KC/GtDtI1
 V+1PhOx8o4kWjFlAvyyPJnI0nmuLS8Sp6S0XT6b6fI4KS+vxw17P/E/maeWbTyJYjsTOmqowwXy
 f7X3Bca1h4130PiCcMi1vvPgO2By+vzUMwC1SLZCQRYBhwp/vlzgRIhzONksywlaL9n9tPc=
X-Received: by 2002:a17:90b:38c7:b0:2ff:62f3:5b31 with SMTP id
 98e67ed59e1d1-2ff7cf2a4dfmr33760041a91.29.1741814566534; 
 Wed, 12 Mar 2025 14:22:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAh7edf+w4rzXzQLR0fkq9YMtlXCTroL93A1jr+Tsldo2r/RTEDBE9CJvpxWToVeKTIWZWGQ==
X-Received: by 2002:a17:90b:38c7:b0:2ff:62f3:5b31 with SMTP id
 98e67ed59e1d1-2ff7cf2a4dfmr33760017a91.29.1741814566237; 
 Wed, 12 Mar 2025 14:22:46 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301190b98b7sm2353887a91.32.2025.03.12.14.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:22:45 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org
Date: Wed, 12 Mar 2025 14:21:42 -0700
Message-ID: <20250312212148.274205-3-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312212148.274205-1-ryan.lee@canonical.com>
References: <20250312212148.274205-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [RFC PATCH 2/6] apparmor: explicitly skip mediation of
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

Previously, we saw O_PATH fds only when mediating fd inheritance on exec,
but because they would have no request associated with them, we would
unconditionally let them be inherited. Until we have better handling of
O_PATH fds, preserve the existing behavior of unconditionally allowing
them.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 11ace667cbbf..2349a1dd41f4 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -647,6 +647,16 @@ static int apparmor_file_open(struct file *file)
 		return 0;
 	}
 
+	/*
+	 * Preserve the behavior of O_PATH fd creation not being mediated.
+	 *
+	 * TODO: we weren't handling O_PATH fds in aa_inherit_files anyways
+	 * (all-zero request -> fds unconditionally inherited), so proper
+	 * mediation of those will require changes in multiple places.
+	 */
+	if (file->f_flags & O_PATH)
+		return 0;
+
 	label = aa_get_newest_cred_label_condref(file->f_cred, &needput);
 	if (!unconfined(label)) {
 		struct mnt_idmap *idmap = file_mnt_idmap(file);
-- 
2.43.0

base-kernel: v6.14-rc6

