Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C57BE44F5
	for <lists+apparmor@lfdr.de>; Thu, 16 Oct 2025 17:43:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v9Q8L-0005CW-7f; Thu, 16 Oct 2025 15:43:17 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1v9Q8I-0005CE-Oq
 for apparmor@lists.ubuntu.com; Thu, 16 Oct 2025 15:43:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Thu, 16 Oct 2025 17:41:10 +0200
Message-ID: <20251016154109.32343-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.171;
 envelope-from=thorsten.blum@linux.dev; helo=out-171.mta0.migadu.com
Subject: [apparmor] [PATCH] apparmor: Replace deprecated strcpy with memcpy
	in gen_symlink_name
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
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-hardening@vger.kernel.org,
 Thorsten Blum <thorsten.blum@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

strcpy() is deprecated; use memcpy() instead. Unlike strcpy(), memcpy()
does not copy the NUL terminator from the source string, which would be
overwritten anyway on every iteration when using strcpy(). snprintf()
then ensures that 'char *s' is NUL-terminated.

Replace the hard-coded path length to remove the magic number 6, and add
a comment explaining the extra 11 bytes.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 security/apparmor/apparmorfs.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 391a586d0557..4b2752200ce2 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1602,16 +1602,20 @@ static char *gen_symlink_name(int depth, const char *dirname, const char *fname)
 {
 	char *buffer, *s;
 	int error;
-	int size = depth * 6 + strlen(dirname) + strlen(fname) + 11;
+	const char *path = "../../";
+	size_t path_len = strlen(path);
+	int size;
 
+	/* Extra 11 bytes: "raw_data" (9) + two slashes "//" (2) */
+	size = depth * path_len + strlen(dirname) + strlen(fname) + 11;
 	s = buffer = kmalloc(size, GFP_KERNEL);
 	if (!buffer)
 		return ERR_PTR(-ENOMEM);
 
 	for (; depth > 0; depth--) {
-		strcpy(s, "../../");
-		s += 6;
-		size -= 6;
+		memcpy(s, path, path_len);
+		s += path_len;
+		size -= path_len;
 	}
 
 	error = snprintf(s, size, "raw_data/%s/%s", dirname, fname);
-- 
2.51.0


