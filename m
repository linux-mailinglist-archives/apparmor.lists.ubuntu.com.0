Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B064483B23A
	for <lists+apparmor@lfdr.de>; Wed, 24 Jan 2024 20:22:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rSiph-0003Ox-Fc; Wed, 24 Jan 2024 19:22:45 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <keescook@chromium.org>)
 id 1rSipb-0003Oe-Sy
 for apparmor@lists.ubuntu.com; Wed, 24 Jan 2024 19:22:40 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1d73066880eso36622955ad.3
 for <apparmor@lists.ubuntu.com>; Wed, 24 Jan 2024 11:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706124158; x=1706728958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zmd6L4iLZNNyzU97sSrER5LIO6nwo17DPDhcgnpVxag=;
 b=pfnk/9qDiouiV5mMh7UAjbdhZ8rGljP5wycc9ABInZ4rFNeBzc2aKIv87SCfq1/vuH
 v+xed3LGauJUSSJtZ33RT8lviEAovFQqQcSIEZY2r/rQrlvQZvZj1EDm2gtBGDZuFgPX
 LEH5uc6TK3NhSbCtbZwR803esmV97eRrK3DIXaPDgniKnPL0BlL07DpCJckzhLPvWjQ1
 Qg50tWI1YSlIzUan293KFyq4XCCtkLs0ZsTDksL90ekC3ZAJIElJXj1Y2nb0jmQX5YLc
 B/ywJaOmWOqjPHGh3hOFXofQLjiqgfIoVYQv6SZePHBri2EF42/yQC0F3jMVQC6I/DnC
 eu9Q==
X-Gm-Message-State: AOJu0YxazmgcpNwpI8Wb+fp7rQ2Ap9f+illdAA2Fo0n1k4rGo7XQCw3b
 fXujZGKawYC016y0bgunJqovaUkivzE3FUZFkjtf/shJTLh3n4IdF3esVsCXtg==
X-Google-Smtp-Source: AGHT+IF0/ne04PCSUjBX3tqlCMh/doof5H2bjt5d6Ac8doIh9yQFPCSnvtLvQuFNGnyGzSnBUJ/aAA==
X-Received: by 2002:a17:902:6949:b0:1d4:b50d:dba9 with SMTP id
 k9-20020a170902694900b001d4b50ddba9mr1254455plt.71.1706124158168; 
 Wed, 24 Jan 2024 11:22:38 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a17090330d500b001d6fbaaeb56sm8636308plc.145.2024.01.24.11.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 11:22:37 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Josh Triplett <josh@joshtriplett.org>, Kevin Locke <kevin@kevinlocke.name>
Date: Wed, 24 Jan 2024 11:22:32 -0800
Message-Id: <20240124192228.work.788-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2841; i=keescook@chromium.org; 
 h=from:subject:message-id;
 bh=1gaILVY/H6stGS/EvSXd6ZL/n9yg9wEbY6RbWPaWb/g=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlsWN4cgMm3ifa4AxYv0rR1P9nb2T7XG8BeE5dh
 dQdKGdd8U+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbFjeAAKCRCJcvTf3G3A
 Jj8eEACdqWJsXSjCuU2ZGkwBhmHssL73vpbJm9vow7VcgTvUcgVoF7WjPAqU3SkkUee2vuDuEEC
 uG3G42UgwdGwzUcascCCo7wkaex/Ac7gDV7BRBywIyjF/vLDCeQ5HhIqatIu/mH44Ebni5aTAQU
 hUYp/I3213FNl/oN3a+PJoqHHB5ORr/0z+NOMW3XT/pJ5DU0fMqAxTHtrF2s/IE9WWreJ4PP9dD
 X5FSgLuUtR0LuJ8/8gRd5EFCycwwUXuvOBcR9Nt4fBBQcU02uF3kcXzm4eF9JJyib+jYDu2tNP3
 eouwdnVwePLu9Xbr2l2lFju9lrgM9QjR7aLXB4J6Bw1nlyZHuj6Hjrc+EYzI1fpVDfrBSTQtFfj
 Skv/zZriwMgLINYrOds5qiWwNPLT7pTEychRittwryFFuoqSyJwLS/5PkycmxUNlwqaQl4NU5S5
 aP++f2Hfr2S7lrzFV1waa0HOn4J2drH3GfOqw+oPKvq/DxMlScVwY76Uvpncoov/alR5EnKKzn4
 Pr66BX8S4pcrokYTbSm4BLat0ulOpUJgRCL1ixDnhwT4ftGIkEFBz8KiIYbfwT/bZCe9VHxD8/s
 bpXJ4Z6N1DuM1EnVnoMQy4GyH63CVXzi2u+ZM1eMNszMiKfYeeWkpZ+ljiyoNyt9iy/mx7u3pPW
 6+jc5CV pbke/Mtw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] exec: Check __FMODE_EXEC instead of in_execve
	for LSMs
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
 Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Eric Biederman <ebiederm@xmission.com>,
 Paul Moore <paul@paul-moore.com>, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

After commit 978ffcbf00d8 ("execve: open the executable file before
doing anything else"), current->in_execve was no longer in sync with the
open(). This broke AppArmor and TOMOYO which depend on this flag to
distinguish "open" operations from being "exec" operations.

Instead of moving around in_execve, switch to using __FMODE_EXEC, which
is where the "is this an exec?" intent is stored. Note that TOMOYO still
uses in_execve around cred handling.

Reported-by: Kevin Locke <kevin@kevinlocke.name>
Closes: https://lore.kernel.org/all/ZbE4qn9_h14OqADK@kevinlocke.name
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Fixes: 978ffcbf00d8 ("execve: open the executable file before doing anything else")
Cc: Josh Triplett <josh@joshtriplett.org>
Cc: John Johansen <john.johansen@canonical.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Kentaro Takeda <takedakn@nttdata.co.jp>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Eric Biederman <ebiederm@xmission.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: apparmor@lists.ubuntu.com
Cc: linux-security-module@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/apparmor/lsm.c  | 4 +++-
 security/tomoyo/tomoyo.c | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 7717354ce095..98e1150bee9d 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -469,8 +469,10 @@ static int apparmor_file_open(struct file *file)
 	 * Cache permissions granted by the previous exec check, with
 	 * implicit read and executable mmap which are required to
 	 * actually execute the image.
+	 *
+	 * Illogically, FMODE_EXEC is in f_flags, not f_mode.
 	 */
-	if (current->in_execve) {
+	if (file->f_flags & __FMODE_EXEC) {
 		fctx->allow = MAY_EXEC | MAY_READ | AA_EXEC_MMAP;
 		return 0;
 	}
diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index 3c3af149bf1c..04a92c3d65d4 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -328,7 +328,8 @@ static int tomoyo_file_fcntl(struct file *file, unsigned int cmd,
 static int tomoyo_file_open(struct file *f)
 {
 	/* Don't check read permission here if called from execve(). */
-	if (current->in_execve)
+	/* Illogically, FMODE_EXEC is in f_flags, not f_mode. */
+	if (f->f_flags & __FMODE_EXEC)
 		return 0;
 	return tomoyo_check_open_permission(tomoyo_domain(), &f->f_path,
 					    f->f_flags);
-- 
2.34.1


