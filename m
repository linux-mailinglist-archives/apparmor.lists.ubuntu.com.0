Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK1QAxeue2lOHwIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 29 Jan 2026 19:59:35 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F2540B3C03
	for <lists+apparmor@lfdr.de>; Thu, 29 Jan 2026 19:59:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vlXEf-0005HR-7m; Thu, 29 Jan 2026 18:59:21 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <georgia.garcia@canonical.com>)
 id 1vlXEe-0005HD-E8
 for apparmor@lists.ubuntu.com; Thu, 29 Jan 2026 18:59:20 +0000
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4C7F83F285
 for <apparmor@lists.ubuntu.com>; Thu, 29 Jan 2026 18:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1769713160;
 bh=/IJWNWkLxQKACNSLAllma/B6vMztvEBIpzKm/Q3yY64=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version;
 b=DNiHaKxeWs7n7ocbLcENszOy+/kUHL8pDC1kxzu1Z5JUh7nyLYyx0sb/XdmXXq4/k
 60iytGwm5o2yzEt45JJn+OpFUIpduW+MjFLWHB8BucgYGiLCqrRhWVA74QLSY3lUSg
 GaEUmLf96BCffJYNYvwnAyZRCAOCMkklyLCGeLevsvmXfb3QAOADbar4pRoQxr5OVP
 azl6jrb8ag0zd30wyfMjz2ihU26/3xIrFfk/56O1zMXqELYgIXMrwMD4q1u9011ota
 JAzTfjOLSJWbQoLTmmz73720TAG4VEbfM5ghU643di577z6It0YduxEQoXhZmlylWt
 fshlOWBQ4kua3wLDgGHKZo0HXV/PmMiDg6BZ/NdxU4pehIJZH5r7GrrKTRzu59YcQw
 3ulbaimTGAx6/8emYYLmWbfS3OX4+VvbjSMHRS4/orquFoRSWem5ZnJpE65azcHaXr
 CsWcUs5pJ2TZIaAAfm/bdT/pKpBL16naTWTHGXCqcwHLoiX88RmA28/lFpe2rKL2jQ
 KAnjVUPdPIl3IBE3BuKnHUiSOhbx1t5gvy/IGkpQRc+2rxhZ3/RNRkkXD6xX735MXi
 td5ip8zMdtzHWY9WBSn7K6bmwzgJ3IVAtzqguFUFlnmvx3WfjfQIHLLQVX83QH65Ou
 n1K6CRS7D89CZKcw8Ldp+J8o=
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2b715b26fc3so1737774eec.1
 for <apparmor@lists.ubuntu.com>; Thu, 29 Jan 2026 10:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769713158; x=1770317958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/IJWNWkLxQKACNSLAllma/B6vMztvEBIpzKm/Q3yY64=;
 b=hg0B6qtXfMW7lVdZym4+PD2Y63ptzutn7u9MnT6AIvHFoGaLE4C2hu3twkFV11WFrq
 J6VsTyp3nqicjtgA7YumRN656gu7SmL4ZEwPkAeXYkaMcZZD++HpgtYJG67jpVtuehvJ
 9u9AYbzdIsrCn4NzlvCx46bIzIy6z2SytXpOuV1K5atsrJkfmbxKTp8AhCkyCZthVIHz
 zdHBk/1uwUmaoYQ/h4fvzQSOmAlsIOCymfxOQJER4POKKmlypexLh8obmI31CygqJoFg
 YAJFsf0HzYzDaZAgcQdXj81qDjZAds/lK5Zo4TozTAdgS/OSagz9cRCvtvAa4/zI+MPN
 ZbVA==
X-Gm-Message-State: AOJu0Ywiv/SBEbxbm1RuMZK3vww6gc6FwReC75C8KfF8LQ7KritBH+UP
 l1j6YnHNOz19L5NcYJfnfVveGb2UcXmxUGhWila089tqY/TsD9+85IU1CkPe2aX883cOGINj15H
 b2XqaVO5rXDc+2WbuUqWMiRl/tNCX3a6V+UVw1RAvv7uUgWJH8huZiumWJYGnhWDMBWW43fTeJj
 ezwfjx6m+oow==
X-Gm-Gg: AZuq6aIYqgkEUsWk+TcKZkLUNZpdaXtZV4+dwXdnOvT8PllyHkMyQYgfszRn+Z2yS3D
 0nSGENdMzjVDvPAtuhh0kr/cJAJ+yBQBu9CecQ7UeCia7GiYyYHOb2TM6+I/kw+WGmvpTwMVcq0
 G5zYzSjmFy7BjGkgsKnx+7hwLyMqU/lJnb26JycRrhmTAyfIAa1OuBcQEYdRcjmn1oflK4VlUWP
 82glrdLqDy/PzUlrVTQRWmq0o6Y07AqzBwaW0wjKbBUTgcTziE4u80U1BZ0q4O6rOHPbElipGeI
 TG+9u1kjZ3luz4qRXFmw5XqDCI6iE1aSjqhW13F3sB6vYrCjLg2yYBZUWXgsJNHcigm1XgTDB5N
 cCx7HBt5viclzxFewkTQGiA==
X-Received: by 2002:a05:7301:658a:b0:2ae:601f:f4f7 with SMTP id
 5a478bee46e88-2b7c89417c7mr185128eec.40.1769713157852; 
 Thu, 29 Jan 2026 10:59:17 -0800 (PST)
X-Received: by 2002:a05:7301:658a:b0:2ae:601f:f4f7 with SMTP id
 5a478bee46e88-2b7c89417c7mr185121eec.40.1769713157324; 
 Thu, 29 Jan 2026 10:59:17 -0800 (PST)
Received: from georgia.. ([2001:1284:f514:a75f:96bd:694f:ef02:428a])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b7a1af898asm8797661eec.33.2026.01.29.10.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 10:59:16 -0800 (PST)
From: Georgia Garcia <georgia.garcia@canonical.com>
To: john.johansen@canonical.com
Date: Thu, 29 Jan 2026 15:58:46 -0300
Message-ID: <20260129185846.3169624-2-georgia.garcia@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129185846.3169624-1-georgia.garcia@canonical.com>
References: <20260129185846.3169624-1-georgia.garcia@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH 2/2] apparmor: remove or add symlinks to rawdata
	according to export_binary
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:mid,canonical.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: F2540B3C03
X-Rspamd-Action: no action

When the export_binary parameter is set, then rawdata is available and
there should be a symbolic link for the rawdata in the profile
directory in apparmorfs. If the parameter is unset, then the symlinks
should not exist.

The issue arises when changing the value of export_binary on runtime
and replacing profiles. If export_binary was set when the profile was
originally loaded, then changed to 0 and the profile was reloaded,
then the symbolic links would still exist but would return ENOENT
because the rawdata no longer exists.

On the opposite side, if export_binary was unset when the profile was
originally loaded, then changed to 1 and the profile was reloaded,
then the symbolic links would not exist, even though the rawdata does.

Signed-off-by: Georgia Garcia <georgia.garcia@canonical.com>
---
 security/apparmor/apparmorfs.c         | 106 ++++++++++++++++++-------
 security/apparmor/include/apparmorfs.h |  12 +++
 security/apparmor/policy.c             |  14 ++++
 3 files changed, 104 insertions(+), 28 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 4fb251a7e85a..b1998ac029d0 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1695,6 +1695,81 @@ static const struct inode_operations rawdata_link_abi_iops = {
 static const struct inode_operations rawdata_link_data_iops = {
 	.get_link	= rawdata_get_link_data,
 };
+
+/*
+ * Requires: @profile->ns->lock held
+ */
+void __aa_remove_rawdata_symlink_dents(struct aa_profile *profile)
+{
+	aafs_remove(profile->dents[AAFS_PROF_RAW_HASH]);
+	profile->dents[AAFS_PROF_RAW_HASH] = NULL;
+	aafs_remove(profile->dents[AAFS_PROF_RAW_ABI]);
+	profile->dents[AAFS_PROF_RAW_ABI] = NULL;
+	aafs_remove(profile->dents[AAFS_PROF_RAW_DATA]);
+	profile->dents[AAFS_PROF_RAW_DATA] = NULL;
+}
+
+static inline int create_symlink_dent(struct aa_profile *profile,
+				      const char *name,
+				      enum aafs_prof_type type,
+				      const struct inode_operations *iops)
+{
+	struct dentry *dent = NULL;
+	struct dentry *dir = prof_dir(profile);
+
+	if (profile->dents[type])
+		return 0;
+
+	dent = aafs_create(name, S_IFLNK | 0444, dir,
+			   profile->label.proxy, NULL, NULL, iops);
+	if (IS_ERR(dent))
+		return PTR_ERR(dent);
+
+	aa_get_proxy(profile->label.proxy);
+	profile->dents[type] = dent;
+	return 0;
+}
+
+/*
+ * Requires: @profile->ns->lock held
+ */
+int __aa_create_rawdata_symlink_dents(struct aa_profile *profile)
+{
+	int error;
+
+	if (!profile ||
+	    (profile->dents[AAFS_PROF_RAW_HASH] &&
+	     profile->dents[AAFS_PROF_RAW_ABI] &&
+	     profile->dents[AAFS_PROF_RAW_DATA]))
+		return 0;
+
+	if (!profile->rawdata)
+		return 0;
+
+	if (aa_g_hash_policy) {
+		error = create_symlink_dent(profile, "raw_sha256",
+					    AAFS_PROF_RAW_HASH,
+					    &rawdata_link_sha256_iops);
+		if (error)
+			return error;
+	}
+
+	error = create_symlink_dent(profile, "raw_abi",
+				    AAFS_PROF_RAW_ABI,
+				    &rawdata_link_abi_iops);
+	if (error)
+		return error;
+
+
+	error = create_symlink_dent(profile, "raw_data",
+				    AAFS_PROF_RAW_DATA,
+				    &rawdata_link_data_iops);
+	if (error)
+		return error;
+
+	return 0;
+}
+
 #endif /* CONFIG_SECURITY_APPARMOR_EXPORT_BINARY */
 
 /*
@@ -1770,34 +1845,9 @@ int __aafs_profile_mkdir(struct aa_profile *profile, struct dentry *parent)
 		profile->dents[AAFS_PROF_HASH] = dent;
 	}
 
-#ifdef CONFIG_SECURITY_APPARMOR_EXPORT_BINARY
-	if (profile->rawdata) {
-		if (aa_g_hash_policy) {
-			dent = aafs_create("raw_sha256", S_IFLNK | 0444, dir,
-					   profile->label.proxy, NULL, NULL,
-					   &rawdata_link_sha256_iops);
-			if (IS_ERR(dent))
-				goto fail;
-			aa_get_proxy(profile->label.proxy);
-			profile->dents[AAFS_PROF_RAW_HASH] = dent;
-		}
-		dent = aafs_create("raw_abi", S_IFLNK | 0444, dir,
-				   profile->label.proxy, NULL, NULL,
-				   &rawdata_link_abi_iops);
-		if (IS_ERR(dent))
-			goto fail;
-		aa_get_proxy(profile->label.proxy);
-		profile->dents[AAFS_PROF_RAW_ABI] = dent;
-
-		dent = aafs_create("raw_data", S_IFLNK | 0444, dir,
-				   profile->label.proxy, NULL, NULL,
-				   &rawdata_link_data_iops);
-		if (IS_ERR(dent))
-			goto fail;
-		aa_get_proxy(profile->label.proxy);
-		profile->dents[AAFS_PROF_RAW_DATA] = dent;
-	}
-#endif /*CONFIG_SECURITY_APPARMOR_EXPORT_BINARY */
+	error = __aa_create_rawdata_symlink_dents(profile);
+	if (error)
+		goto fail2;
 
 	list_for_each_entry(child, &profile->base.profiles, base.list) {
 		error = __aafs_profile_mkdir(child, prof_child_dir(profile));
diff --git a/security/apparmor/include/apparmorfs.h b/security/apparmor/include/apparmorfs.h
index dd580594dfb7..33243d11fd10 100644
--- a/security/apparmor/include/apparmorfs.h
+++ b/security/apparmor/include/apparmorfs.h
@@ -120,6 +120,8 @@ struct aa_loaddata;
 #ifdef CONFIG_SECURITY_APPARMOR_EXPORT_BINARY
 void __aa_fs_remove_rawdata(struct aa_loaddata *rawdata);
 int __aa_fs_create_rawdata(struct aa_ns *ns, struct aa_loaddata *rawdata);
+void __aa_remove_rawdata_symlink_dents(struct aa_profile *profile);
+int __aa_create_rawdata_symlink_dents(struct aa_profile *profile);
 #else
 static inline void __aa_fs_remove_rawdata(struct aa_loaddata *rawdata)
 {
@@ -131,6 +133,16 @@ static inline int __aa_fs_create_rawdata(struct aa_ns *ns,
 {
 	return 0;
 }
+
+static inline void __aa_remove_rawdata_symlink_dents(struct aa_profile *profile)
+{
+	/* empty stub */
+}
+
+static inline int __aa_create_rawdata_symlink_dents(struct aa_profile *profile)
+{
+	return 0;
+}
 #endif /* CONFIG_SECURITY_APPARMOR_EXPORT_BINARY */
 
 #endif /* __AA_APPARMORFS_H */
diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 50d5345ff5cb..8c97e5b10191 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -1268,6 +1268,15 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 			goto skip;
 		}
 
+		if (!aa_g_export_binary) {
+			if (ent->old && ent->old->rawdata &&
+			    ent->old->dents[AAFS_LOADDATA_DIR]) {
+				/* remove rawdata symlinks because the symlink
+				 * target will be removed */
+				__aa_remove_rawdata_symlink_dents(ent->old);
+			}
+		}
+
 		/*
 		 * TODO: finer dedup based on profile range in data. Load set
 		 * can differ but profile may remain unchanged
@@ -1278,6 +1287,11 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 		if (ent->old) {
 			share_name(ent->old, ent->new);
 			__replace_profile(ent->old, ent->new);
+			if (aa_g_export_binary) {
+				/* recreate rawdata symlinks */
+				if (!ent->old->rawdata)
+					__aa_create_rawdata_symlink_dents(ent->new);
+			}
 		} else {
 			struct list_head *lh;
 
-- 
2.43.0


