Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dXT8NtCADWrUyQUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 20 May 2026 11:37:20 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A82F458AE37
	for <lists+apparmor@lfdr.de>; Wed, 20 May 2026 11:37:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wPdMS-0007ab-Fd; Wed, 20 May 2026 09:37:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <rppt@kernel.org>) id 1wPcHU-0006Dn-CP
 for apparmor@lists.ubuntu.com; Wed, 20 May 2026 08:27:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D5BB43E73;
 Wed, 20 May 2026 08:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A23C1F00893;
 Wed, 20 May 2026 08:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779265158;
 bh=GVDlYomtipo4qtAHTcknpPeYaQN/qiVuV/EAqg0FNOE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=QGRWwoluHB1wxqmq1NnHTwUGrOw0HmNcITLn8Pe3aTepQ46r2jdkcAYNLOmQLC6Ws
 fAO7nMcK4IAkEmw7q1Rz88yVzOt27cWANLTYW1boJbIknXERD1KFDTQKy4tYZOuC8K
 Xa83/+bLmy01KovNY7i3HHz3XSz0Y55T2cD1454db7Enrehvtwru2MztE1Skbw8C6K
 TzwzSQ9MpvS02tzUSDzYmwgI436vCppFZB1Rztx7znFzz5ZPc7GKf2Bv7bJ/FVIRKG
 DWbYxGBPnHJkKZKcVSZ0d3B7MBNCEqN4D1I+B9cReO5mepsJHAHs9ie8fqs14ga6GT
 +nHHtsTbiaf7Q==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Wed, 20 May 2026 11:18:55 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-security-v1-1-831bd8e21dd0@kernel.org>
References: <20260520-security-v1-0-831bd8e21dd0@kernel.org>
In-Reply-To: <20260520-security-v1-0-831bd8e21dd0@kernel.org>
To: James Morris <jmorris@namei.org>, 
 John Johansen <john.johansen@canonical.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, Paul Moore <paul@paul-moore.com>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2557; i=rppt@kernel.org;
 h=from:subject:message-id; bh=egsexhbhZMn6N2VNXPeFT9FZiiU9sNsftvujWkJEIxM=;
 b=owEBbQGS/pANAwAKATkDhibLDv2RAcsmYgBqDW51z/2b9a1wBbACD7Lqy3AESWFSJG96Ft/Fc
 u9GHWORn7qJATMEAAEKAB0WIQR45VhVpZkvn3TRr+k5A4Ymyw79kQUCag1udQAKCRA5A4Ymyw79
 kesfB/95neKLPMgBSsir1CVvO5hzi/mjOmpGVmukHgd+jj7BYpflrDOxXDEgBs6XHWLBXr6p9JI
 xvWliqXNwwYOaRYZrG10Gbl4vCSoFGOQPMOCctQQm9FEIATJM8lY9frjkw41Nd9vpyDWOUNoaB2
 3KByTXQIPueuUKZKZxZf990V0FXHun2IroxnjikC7dbpoD+Ok7KlOfCucRjXTKN283DLquejXI/
 MXWd19xgl5hyQaJR8l/0oPy+zZfbJBFZRt//57o+nv0whqgh4IDwfpdTwytJ50DBSSXdYZ7OH1j
 GtKAKh+ZMI9rY83yzUXjIC1ZjMGgzVRheIfJSJrbV+SP0mx7
X-Developer-Key: i=rppt@kernel.org; a=openpgp;
 fpr=B8E96E880C4A40C3C1255AA8C532392DE6DA7CE9
Received-SPF: pass client-ip=172.234.252.31; envelope-from=rppt@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Wed, 20 May 2026 09:37:07 +0000
Subject: [apparmor] [PATCH 1/3] selinux: use k[mz]alloc() to allocate
 temporary buffers
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
Cc: selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[namei.org,canonical.com,redhat.com,paul-moore.com,hallyn.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jmorris@namei.org,m:john.johansen@canonical.com,m:omosnace@redhat.com,m:paul@paul-moore.com,m:serge@hallyn.com,m:stephen.smalley.work@gmail.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-security-module@vger.kernel.org,m:rppt@kernel.org,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[rppt@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,apparmor-bounces@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Queue-Id: A82F458AE37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Several functions in selinuxfs.c allocate temporary buffers using
__get_free_page() or get_zeroed_page().

These buffers are used either to store a string generated by snprintf() (in
sel_make_bools()) or to copy data from user (sel_read_avc_hash_stats() and
sel_read_sidtab_hash_stats()).

Such usage does not require struct page access and it is better to allocate
these buffers with kzalloc()/kmalloc() that provide better scalability and
more debugging possibilities.

Replace use of get_zeroed_page() with kzalloc() and usage of
__get_free_page() with kmalloc().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 security/selinux/selinuxfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
index 25ca7d714014..e7b884eedf80 100644
--- a/security/selinux/selinuxfs.c
+++ b/security/selinux/selinuxfs.c
@@ -1244,7 +1244,7 @@ static int sel_make_bools(struct selinux_policy *newpolicy, struct dentry *bool_
 	char **names, *page;
 	u32 i, num;
 
-	page = (char *)get_zeroed_page(GFP_KERNEL);
+	page = kzalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!page)
 		return -ENOMEM;
 
@@ -1290,7 +1290,7 @@ static int sel_make_bools(struct selinux_policy *newpolicy, struct dentry *bool_
 		ret = sel_attach_file(bool_dir, names[i], inode);
 	}
 out:
-	free_page((unsigned long)page);
+	kfree(page);
 	return ret;
 }
 
@@ -1349,14 +1349,14 @@ static ssize_t sel_read_avc_hash_stats(struct file *filp, char __user *buf,
 	char *page;
 	ssize_t length;
 
-	page = (char *)__get_free_page(GFP_KERNEL);
+	page = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!page)
 		return -ENOMEM;
 
 	length = avc_get_hash_stats(page);
 	if (length >= 0)
 		length = simple_read_from_buffer(buf, count, ppos, page, length);
-	free_page((unsigned long)page);
+	kfree(page);
 
 	return length;
 }
@@ -1367,7 +1367,7 @@ static ssize_t sel_read_sidtab_hash_stats(struct file *filp, char __user *buf,
 	char *page;
 	ssize_t length;
 
-	page = (char *)__get_free_page(GFP_KERNEL);
+	page = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!page)
 		return -ENOMEM;
 
@@ -1375,7 +1375,7 @@ static ssize_t sel_read_sidtab_hash_stats(struct file *filp, char __user *buf,
 	if (length >= 0)
 		length = simple_read_from_buffer(buf, count, ppos, page,
 						length);
-	free_page((unsigned long)page);
+	kfree(page);
 
 	return length;
 }

-- 
2.53.0


