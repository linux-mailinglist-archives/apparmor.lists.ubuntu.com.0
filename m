Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B31D82D3B1
	for <lists+apparmor@lfdr.de>; Mon, 15 Jan 2024 05:38:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rPEjN-0007t2-OV; Mon, 15 Jan 2024 04:37:49 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <rdunlap@infradead.org>)
 id 1rPEjG-0007rq-BC
 for apparmor@lists.ubuntu.com; Mon, 15 Jan 2024 04:37:42 +0000
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rPEjA-007ktb-05; Mon, 15 Jan 2024 04:37:36 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 14 Jan 2024 20:37:35 -0800
Message-ID: <20240115043735.7751-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: lsm: fix kernel-doc typo
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
Cc: Paul Moore <paul@paul-moore.com>, John Johansen <john@apparmor.net>,
 Randy Dunlap <rdunlap@infradead.org>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Correct a kernel-doc function parameter name to resolve two
kernel-doc warnings:

lsm.c:1136: warning: Function parameter or struct member 'protocol' not described in 'apparmor_socket_post_create'
lsm.c:1136: warning: Excess function parameter 'ptotocol' description in 'apparmor_socket_post_create'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: John Johansen <john.johansen@canonical.com>
Cc: John Johansen <john@apparmor.net>
Cc: apparmor@lists.ubuntu.com
Cc: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-security-module@vger.kernel.org
---
 security/apparmor/lsm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/security/apparmor/lsm.c b/security/apparmor/lsm.c
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1122,7 +1122,7 @@ static int apparmor_socket_create(int fa
  * @sock: socket that is being setup
  * @family: family of socket being created
  * @type: type of the socket
- * @ptotocol: protocol of the socket
+ * @protocol: protocol of the socket
  * @kern: socket is a special kernel socket
  *
  * Note:

