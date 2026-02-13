Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKwIOsF7j2mWRAEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 13 Feb 2026 20:30:09 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B326139380
	for <lists+apparmor@lfdr.de>; Fri, 13 Feb 2026 20:30:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vqyrM-0007Ge-Cz; Fri, 13 Feb 2026 19:29:48 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1vqyrK-0007GX-Iu
 for apparmor@lists.ubuntu.com; Fri, 13 Feb 2026 19:29:46 +0000
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 736C53FCE5
 for <apparmor@lists.ubuntu.com>; Fri, 13 Feb 2026 19:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1771010986;
 bh=WFB5M7Bib65JCY2f4WJGuceX+59zQT1fAEihdBfDTXQ=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=btjdd2Hn5XKRwczOJEda++E8PLSvSt0ySLAXm6ILEG1MythLAtyH+M+0O3oqrgku5
 5COQwT5hg5AKyHvJcdSmWi8ilirc5v+l2Hlblo7xQqLm6Uvx7EH32TBKZUPmhtkSG4
 zZn4aKOPHIaBvBkP0ROeeiVmX6epv69HqLGzVOIQ/sjmo+QizRx6Qm9DOBd5oWIYQX
 1X7WZdR3HSLo4YphrUjOTDFzc0NZ1FyEOsxG/gthuCLX73pTIx6iE3296CIHeC1/sy
 YhT2sEXUsnl5jtcPdZkZkvxFV6VPlaNz5dy74jSBOzX38mlUreS42V2mbpJ6Jim8F2
 IVp7bMKb43avt0WQZX25UcqqnLms4OQM5e/IHYVN9oj+WeYWhPaUZpKOkjTKq+h5YY
 v/dNgA8yW7heDpLcj9yz4coVxyOS+iKocEYYnnfWtDAgo1S+kiWOVBAraPQJAMCI2P
 AQNebTojc6bcFWnaqhNeYd0dWZPcWiM34zJyMesCUA+yXHE67veC1qCY9UY4e1Nmmr
 lP813POJxlYRVZMpXdqwcZ0ObQvVFPQzy4gOnjCbwTx1hCtFomlFW971EaFfeBG71c
 bZS73i3TWlvrHIaf2LyqpoudodG6E6ZTOF1N0gR2+nCeTUgXcJGjUmE31QaH4J1eb4
 CUWJ3wKPvTpFhvK1WseEMg2o=
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2ba9ef13a4bso2334517eec.1
 for <apparmor@lists.ubuntu.com>; Fri, 13 Feb 2026 11:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771010985; x=1771615785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WFB5M7Bib65JCY2f4WJGuceX+59zQT1fAEihdBfDTXQ=;
 b=DNzFclsNrS+S5FyLe+vXSJawt/OaYRHAgmJPvmJYfV4DWM1ggGTiy7PiUspjASgYF7
 aPv3Hrj+KgIl29rQZBwHD/rAE4BfbeK4/37WI8xAzZ25jHAHxfWUMhD77ZiFnEj3yJKJ
 b0zcu+RZldgskQ7yW1nPnCcyL+8fAkWyY5N5S8g+EhJuplJ/U8UJETTDV/8FWTKJU+C4
 lRmx+O635aliyYY5TZfAmaQFFS4/Dl0yZTtyVdSH4h4HW6WZQETHzh8Y84Bx8p3Spoid
 1Rl7xhkmT6j8HmuxP5sEb2+tWTIlYUwsQGn9ZfRQwcqCG79vKu33p5kchL0ebvCyAOHb
 OAhg==
X-Gm-Message-State: AOJu0YykgiCA9xkm9BLG3YVdwEYGVXaPb3oQ9ZKys8+AWmLrKyQdR2oQ
 C53orC/jxBQE0cLnJUi2uhvplr8gaC+jkvQerdtqaawneGx2/uYWI5KOmIbD0J+DFHNVv8zqdj3
 xxJXSuPaPMtdzGV3VyzP7bprLZCfpCvXyxMScyU554iUJk0skAnK+4M7FfV7JQmQ5DvwfFH8oLL
 TwWlwLXYy8lA==
X-Gm-Gg: AZuq6aK3zxjs9f5Kn/NPcYXXS/H2lmW36y/N5B8j8F4bPLXVfS71K3sHECwhhL4AzWn
 U9T4nsVtlRGBtnukN/kv48e8LZFb31/Q1gSjLMTph0IBQazaYon9dDmI35S/I8h5Bo3SMwNJs7d
 HZ89u+bAvCKKFFNtaRTVpChm+YDXhL8YH1QosSNgoaq+ZA+unno98wiAtkFeIom3eewqlMEN/QG
 69ZCS3kFnzIk9XpUirDf6/PMFMCnuSpHi8SZfYtoLWQ7A3MjiwXEYUgTtwvAxpwO5qVX1mnfc8w
 IYgGnV/rwWJuVxZcn2LFxebMWZA7dC6LzI9M8UEAeLt3X6mwKdHZXMBtJa4ujWxmEpFHoOumLuL
 z7YIbdq+qOS92+SmRzF1GnpGRDC1357NucgFqZz2Bwg+Q6g7/olgUrYEdc1T5OuLEQFOdBKF/yE
 B1YHGb5lPCKxtieolKyE9F7nDVVB3J/1VMPcQjGJm1B5tBtr3WY/drIg0yal8pRew63Q==
X-Received: by 2002:a05:7300:6c9e:b0:2ba:640e:2ce8 with SMTP id
 5a478bee46e88-2bac720088cmr566593eec.7.1771010984669; 
 Fri, 13 Feb 2026 11:29:44 -0800 (PST)
X-Received: by 2002:a05:7300:6c9e:b0:2ba:640e:2ce8 with SMTP id
 5a478bee46e88-2bac720088cmr566580eec.7.1771010984125; 
 Fri, 13 Feb 2026 11:29:44 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ba9dba2d44sm6013428eec.6.2026.02.13.11.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:29:43 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 13 Feb 2026 11:29:38 -0800
Message-ID: <20260213192940.24833-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: grab ns lock and refresh when looking
	up changehat child profiles
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com]
X-Rspamd-Queue-Id: 8B326139380
X-Rspamd-Action: no action

There was a race condition involving change_hat and profile replacement in
which replacement of the parent profile during a changehat operation could
result in the list of children becoming empty and the changehat operation
failing. To prevent this:
 - grab the namespace lock until we've built the hat transition, and
 - use aa_get_newest_profile to avoid using stale profile objects.

Link: https://bugs.launchpad.net/bugs/2139664
Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/domain.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

This version of the patch applies cleanly to the Ubuntu 6.17 kernel.

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 7d81111f628c..2d3b80423d20 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -12,6 +12,7 @@
 #include <linux/fs.h>
 #include <linux/file.h>
 #include <linux/mount.h>
+#include <linux/mutex.h>
 #include <linux/syscalls.h>
 #include <linux/personality.h>
 #include <linux/xattr.h>
@@ -1128,6 +1129,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
 				   int count, int flags)
 {
 	struct aa_profile *profile, *root, *hat = NULL;
+	struct aa_ns *ns, *new_ns;
 	struct aa_label *new;
 	struct label_it it;
 	bool sibling = false;
@@ -1138,6 +1140,32 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
 	AA_BUG(!hats);
 	AA_BUG(count < 1);
 
+	/*
+	 * Acquire the newest label and then hold the lock until we choose a
+	 * hat, so that profile replacement doesn't atomically truncate the
+	 * list of potential hats. Because we are getting the namespaces from
+	 * the profiles and label, we can rely on the namespaces being live
+	 * and avoid incrementing their refcounts while grabbing the lock.
+	 */
+	label = aa_get_label(label);
+	ns = labels_ns(label);
+
+retry:
+	mutex_lock_nested(&ns->lock, ns->level);
+	if (label_is_stale(label)) {
+		new = aa_get_newest_label(label);
+		new_ns = labels_ns(new);
+		if (new_ns != ns) {
+			aa_put_label(new);
+			mutex_unlock(&ns->lock);
+			ns = new_ns;
+			label = new;
+			goto retry;
+		}
+		aa_put_label(label);
+		label = new;
+	}
+
 	if (PROFILE_IS_HAT(labels_profile(label)))
 		sibling = true;
 
@@ -1146,7 +1174,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
 		name = hats[i];
 		label_for_each_in_ns(it, labels_ns(label), label, profile) {
 			if (sibling && PROFILE_IS_HAT(profile)) {
-				root = aa_get_profile_rcu(&profile->parent);
+				root = aa_get_profile(profile->parent);
 			} else if (!sibling && !PROFILE_IS_HAT(profile)) {
 				root = aa_get_profile(profile);
 			} else {	/* conflicting change type */
@@ -1206,6 +1234,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
 				      GLOBAL_ROOT_UID, info, error, false);
 		}
 	}
+	mutex_unlock(&ns->lock);
 	return ERR_PTR(error);
 
 build:
@@ -1218,7 +1247,7 @@ static struct aa_label *change_hat(const struct cred *subj_cred,
 		error = -ENOMEM;
 		goto fail;
 	} /* else if (IS_ERR) build_change_hat has logged error so return new */
-
+	mutex_unlock(&ns->lock);
 	return new;
 }
 
-- 
2.43.0


