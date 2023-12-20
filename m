Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0498A819831
	for <lists+apparmor@lfdr.de>; Wed, 20 Dec 2023 06:33:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rFpDA-0006g6-1Y; Wed, 20 Dec 2023 05:33:40 +0000
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <viro@ftp.linux.org.uk>)
 id 1rFpD2-0006fv-CQ
 for apparmor@lists.ubuntu.com; Wed, 20 Dec 2023 05:33:32 +0000
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rFpD1-00HJnY-30; Wed, 20 Dec 2023 05:33:32 +0000
Date: Wed, 20 Dec 2023 05:33:31 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Message-ID: <20231220053331.GU1674809@ZenIV>
References: <20231220051348.GY1674809@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220051348.GY1674809@ZenIV>
Subject: [apparmor] [PATCH 22/22] apparmorfs: don't duplicate kfree_link()
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

rawdata_link_cb() is identical to it

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 security/apparmor/apparmorfs.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 38650e52ef57..63ca77103de9 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1615,11 +1615,6 @@ static char *gen_symlink_name(int depth, const char *dirname, const char *fname)
 	return buffer;
 }
 
-static void rawdata_link_cb(void *arg)
-{
-	kfree(arg);
-}
-
 static const char *rawdata_get_link_base(struct dentry *dentry,
 					 struct inode *inode,
 					 struct delayed_call *done,
@@ -1643,7 +1638,7 @@ static const char *rawdata_get_link_base(struct dentry *dentry,
 	if (IS_ERR(target))
 		return target;
 
-	set_delayed_call(done, rawdata_link_cb, target);
+	set_delayed_call(done, kfree_link, target);
 
 	return target;
 }
-- 
2.39.2


