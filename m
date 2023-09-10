Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B8799DF9
	for <lists+apparmor@lfdr.de>; Sun, 10 Sep 2023 14:00:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qfJ6R-00011z-LU; Sun, 10 Sep 2023 11:59:47 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1qfJ6N-00011m-2k
 for apparmor@lists.ubuntu.com; Sun, 10 Sep 2023 11:59:43 +0000
Received: from [192.168.192.83] (unknown [50.39.103.33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 6220A3F111; 
 Sun, 10 Sep 2023 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1694347182;
 bh=16JwYNCL5oSr1YvxK+oCIjWltg0xyFyQBHW3zUaU8bk=;
 h=Message-ID:Date:MIME-Version:Subject:From:To:References:
 In-Reply-To:Content-Type;
 b=vyROMZwgU/7TIYyp7T8WDq3zcJ/EsohX3eKxhdIHwMgIIrzjODx6jqn1IK0zpG1MO
 +DNA0cc3JBq7l6Sb5zNzNgYF3Z5yvg0ChSTtlCsmdMIKgueArCi/FVUWBEuMW3tCQp
 kDelrpqb7m0oRrTzhreQ8v96Hkj8ZoLufDD5gkQOlYNNm3ZaGpEs3ozjKD/GpTtAMQ
 7M91vUv41fEBScW6aVCD6iNc+1CwzQq0hXjgyU1WvPRs8lbZH3S73l3MLfu5nHA+JD
 n8bx+3zHlFMoPoAyYzvjhacjoLdqrs9NcKWI1jJJx1uce5f43MWD6oN4FipSckqjUv
 7+6JBKfSS0AtQ==
Message-ID: <ce5eeb0b-1de7-05bc-292a-38dc09f23536@canonical.com>
Date: Sun, 10 Sep 2023 04:59:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
To: Andreas Steinmetz <anstein99@googlemail.com>, apparmor@lists.ubuntu.com
References: <CAOTMNwtt9=ig9dtOxqyLVBthh+tJJkZEv64qpGN43+-sCBtRrw@mail.gmail.com>
 <35f763fe-9a16-2194-6a51-13515f52598a@canonical.com>
Organization: Canonical
In-Reply-To: <35f763fe-9a16-2194-6a51-13515f52598a@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] apparmor: Fix regression in mount mediation
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

this is a first pass, I am going to work at reducing the diff size

 From 09f20f314dc252bec4d8b21d84d60c0847b98b2a Mon Sep 17 00:00:00 2001
From: John Johansen <john.johansen@canonical.com>
Date: Sun, 10 Sep 2023 03:35:22 -0700
Subject: [PATCH] apparmor: Fix regression in mount mediation

commit 2db154b3ea8e ("vfs: syscall: Add move_mount(2) to move mounts around")

introduced a new move_mount(2) system call and a corresponding new LSM
security_move_mount hook but did not implement this hook for any
existing LSM. This creates a regression for AppArmor mediation of
mount. This patch provides a base mapping of the move_mount syscall to
the existing mount mediation. In the future we may introduce
additional mediations around the new mount calls.

Fixes: 2db154b3ea8e ("vfs: syscall: Add move_mount(2) to move mounts around")
Signed-off-by: John Johansen <john.johansen@canonical.com>
---
  security/apparmor/include/mount.h |  6 ++--
  security/apparmor/lsm.c           | 17 ++++++++++-
  security/apparmor/mount.c         | 47 ++++++++++++++++++-------------
  3 files changed, 48 insertions(+), 22 deletions(-)

diff --git a/security/apparmor/include/mount.h b/security/apparmor/include/mount.h
index a710683b2496..3e2f974841e4 100644
--- a/security/apparmor/include/mount.h
+++ b/security/apparmor/include/mount.h
@@ -35,8 +35,10 @@ int aa_bind_mount(struct aa_label *label, const struct path *path,
  int aa_mount_change_type(struct aa_label *label, const struct path *path,
  			 unsigned long flags);
  
-int aa_move_mount(struct aa_label *label, const struct path *path,
-		  const char *old_name);
+int aa_move_mount_old(struct aa_label *label, const struct path *path,
+		      const char *old_name);
+int aa_move_mount(struct aa_label *label, const struct path *from_path,
+		  const struct path *to_path);
  
  int aa_new_mount(struct aa_label *label, const char *dev_name,
  		 const struct path *path, const char *type, unsigned long flags,
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index c9463bd0307d..4fa4d60a59fd 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -592,7 +592,7 @@ static int apparmor_sb_mount(const char *dev_name, const struct path *path,
  				  MS_UNBINDABLE))
  			error = aa_mount_change_type(label, path, flags);
  		else if (flags & MS_MOVE)
-			error = aa_move_mount(label, path, dev_name);
+			error = aa_move_mount_old(label, path, dev_name);
  		else
  			error = aa_new_mount(label, dev_name, path, type,
  					     flags, data);
@@ -602,6 +602,20 @@ static int apparmor_sb_mount(const char *dev_name, const struct path *path,
  	return error;
  }
  
+static int apparmor_move_mount(const struct path *from_path,
+			       const struct path *to_path)
+{
+	struct aa_label *label;
+	int error = 0;
+
+	label = __begin_current_label_crit_section();
+	if (!unconfined(label))
+		error = aa_move_mount(label, from_path, to_path);
+	__end_current_label_crit_section(label);
+
+	return error;
+}
+
  static int apparmor_sb_umount(struct vfsmount *mnt, int flags)
  {
  	struct aa_label *label;
@@ -1221,6 +1235,7 @@ static struct security_hook_list apparmor_hooks[] __ro_after_init = {
  	LSM_HOOK_INIT(capget, apparmor_capget),
  	LSM_HOOK_INIT(capable, apparmor_capable),
  
+	LSM_HOOK_INIT(move_mount, apparmor_move_mount),
  	LSM_HOOK_INIT(sb_mount, apparmor_sb_mount),
  	LSM_HOOK_INIT(sb_umount, apparmor_sb_umount),
  	LSM_HOOK_INIT(sb_pivotroot, apparmor_sb_pivotroot),
diff --git a/security/apparmor/mount.c b/security/apparmor/mount.c
index cdfa430ae216..e992473b8d4a 100644
--- a/security/apparmor/mount.c
+++ b/security/apparmor/mount.c
@@ -468,40 +468,49 @@ int aa_mount_change_type(struct aa_label *label, const struct path *path,
  	return error;
  }
  
-int aa_move_mount(struct aa_label *label, const struct path *path,
-		  const char *orig_name)
+
+int aa_move_mount(struct aa_label *label, const struct path *from_path,
+		  const struct path *to_path)
  {
  	struct aa_profile *profile;
-	char *buffer = NULL, *old_buffer = NULL;
-	struct path old_path;
+	char *to_buffer = NULL, *from_buffer = NULL;
  	int error;
  
  	AA_BUG(!label);
-	AA_BUG(!path);
-
-	if (!orig_name || !*orig_name)
-		return -EINVAL;
+	AA_BUG(!from_path);
+	AA_BUG(!to_path);
  
-	error = kern_path(orig_name, LOOKUP_FOLLOW, &old_path);
-	if (error)
-		return error;
-
-	buffer = aa_get_buffer(false);
-	old_buffer = aa_get_buffer(false);
+	to_buffer = aa_get_buffer(false);
+	from_buffer = aa_get_buffer(false);
  	error = -ENOMEM;
-	if (!buffer || !old_buffer)
+	if (!to_buffer || !from_buffer)
  		goto out;
  	error = fn_for_each_confined(label, profile,
-			match_mnt(profile, path, buffer, &old_path, old_buffer,
+			match_mnt(profile, to_path, to_buffer,
+				  from_path, from_buffer,
  				  NULL, MS_MOVE, NULL, false));
  out:
-	aa_put_buffer(buffer);
-	aa_put_buffer(old_buffer);
-	path_put(&old_path);
+	aa_put_buffer(to_buffer);
+	aa_put_buffer(from_buffer);
  
  	return error;
  }
  
+int aa_move_mount_old(struct aa_label *label, const struct path *path,
+		  const char *orig_name)
+{
+	struct path old_path;
+	int error;
+
+	if (!orig_name || !*orig_name)
+		return -EINVAL;
+	error = kern_path(orig_name, LOOKUP_FOLLOW, &old_path);
+	if (error)
+		return error;
+
+	return aa_move_mount(label, &old_path, path);
+}
+
  int aa_new_mount(struct aa_label *label, const char *dev_name,
  		 const struct path *path, const char *type, unsigned long flags,
  		 void *data)
-- 
2.34.1



