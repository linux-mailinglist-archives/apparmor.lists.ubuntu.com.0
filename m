Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C774EC3BE02
	for <lists+apparmor@lfdr.de>; Thu, 06 Nov 2025 15:52:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vH1LU-00026A-Lp; Thu, 06 Nov 2025 14:52:16 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1vH1LS-00025y-Um
 for apparmor@lists.ubuntu.com; Thu, 06 Nov 2025 14:52:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Thu,  6 Nov 2025 15:51:38 +0100
Message-ID: <20251106145138.2123-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.172;
 envelope-from=thorsten.blum@linux.dev; helo=out-172.mta0.migadu.com
Subject: [apparmor] [PATCH RESEND] apparmor: Replace deprecated strcpy in
	d_namespace_path
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 Thorsten Blum <thorsten.blum@linux.dev>, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

strcpy() is deprecated; replace it with a direct '/' assignment. The
buffer is already NUL-terminated, so there is no need to copy an
additional NUL terminator as strcpy() did.

Update the comment and add the local variable 'is_root' for clarity.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 security/apparmor/path.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/security/apparmor/path.c b/security/apparmor/path.c
index d6c74c357ffd..65a0ca5cc1bd 100644
--- a/security/apparmor/path.c
+++ b/security/apparmor/path.c
@@ -164,12 +164,15 @@ static int d_namespace_path(const struct path *path, char *buf, char **name,
 	}
 
 out:
-	/*
-	 * Append "/" to the pathname.  The root directory is a special
-	 * case; it already ends in slash.
+	/* Append "/" to directory paths, except for root "/" which
+	 * already ends in a slash.
 	 */
-	if (!error && isdir && ((*name)[1] != '\0' || (*name)[0] != '/'))
-		strcpy(&buf[aa_g_path_max - 2], "/");
+	if (!error && isdir) {
+		bool is_root = (*name)[0] == '/' && (*name)[1] == '\0';
+
+		if (!is_root)
+			buf[aa_g_path_max - 2] = '/';
+	}
 
 	return error;
 }
-- 
2.51.1


