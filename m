Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B76F978BD0
	for <lists+apparmor@lfdr.de>; Sat, 14 Sep 2024 01:21:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1spFbY-0004ya-Iq; Fri, 13 Sep 2024 23:21:32 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1spFbX-0004yN-15
 for apparmor@lists.ubuntu.com; Fri, 13 Sep 2024 23:21:31 +0000
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B54CB3F2FC
 for <apparmor@lists.ubuntu.com>; Fri, 13 Sep 2024 23:21:30 +0000 (UTC)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7177906db91so2120619b3a.3
 for <apparmor@lists.ubuntu.com>; Fri, 13 Sep 2024 16:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726269689; x=1726874489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PZvIfBHwwLYroeMzRakfRnT3RbYZ0h2p1hlWYEnk8Nc=;
 b=R7RhXUDPFynDBtLhD2ctV0dT5l16Et0lGPzAakyLmaugbUIXYTMWG+LMDNMJMuKlPP
 7L/9pWricXKU52PeXlE2pSgWfgkDosxOKPWuu/yWV+EJJhWWf5sv5vNrZtdmJfVEdknb
 th2wUB6zdeCmOmsf2CAbzbZZVmEavLxU6861Hk5sVQ1adD4ODeJEvWU+VAsqUruRQe0U
 6ceBXAX+gGNAyRKTaJ38C968tZwLPFC/cpUqUImO6uu/y4IkL4ccvO1vk6Zz7AJ+hxbN
 2sywBje2qZepRgOYlAkEOnXBBguFU+r18BtG1VK0840/pKtQ8Jp+zSjJ1gFrgDRTM2vL
 xwYQ==
X-Gm-Message-State: AOJu0YyB5YjTUQJGVNMVzhNeNsxgxiIa2EVXSo3px8dam39HmHqyFNms
 +WhPyFEdgo2g6/xvaaUwo8RjEFewLm1UYfCr5kPSxudgbCWXBKTFMA9PVluRWPIGynQ/8NOhuJL
 1SLnEQP3I3ZOiv5Wp9yBLmraBTcHp2nXm8camdMcFsROh0Y9iRxjfumZe/fJSNbLqHDgKlCN7td
 oVuGnoWg==
X-Received: by 2002:aa7:88cd:0:b0:718:dd1e:de1a with SMTP id
 d2e1a72fcca58-71936b42d60mr6839593b3a.28.1726269689434; 
 Fri, 13 Sep 2024 16:21:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrPuFAGAzBkwIq92ejPxWvVBH0tUmDZYCE6UfmCUBrCGpgaNPVn9zxBUtNGIj0EY1HeiiFNQ==
X-Received: by 2002:aa7:88cd:0:b0:718:dd1e:de1a with SMTP id
 d2e1a72fcca58-71936b42d60mr6839558b3a.28.1726269688873; 
 Fri, 13 Sep 2024 16:21:28 -0700 (PDT)
Received: from ryan-lee-laptop-13-amd.. (c-76-103-38-92.hsd1.ca.comcast.net.
 [76.103.38.92]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944ab507asm112103b3a.50.2024.09.13.16.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 16:21:28 -0700 (PDT)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Fri, 13 Sep 2024 16:20:59 -0700
Message-ID: <20240913232104.1632869-2-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240913232104.1632869-1-ryan.lee@canonical.com>
References: <20240913232104.1632869-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [RFC,
	PATCH 2/3] apparmor: Add an apparmor_can_read_douintvec for
	unsigned int apparmor sysctls
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

This adds a helper for apparmor sysctls to allow world-read, root-write
unsigned integer sysctls. This is used by the next patch in the series.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 9b086451f6e3..b9a92e500242 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -2404,6 +2404,17 @@ static int apparmor_dointvec(struct ctl_table *table, int write,
 	return proc_dointvec(table, write, buffer, lenp, ppos);
 }
 
+static int apparmor_can_read_douintvec(struct ctl_table *table, int write,
+			     void *buffer, size_t *lenp, loff_t *ppos)
+{
+	if (!apparmor_enabled)
+		return -EINVAL;
+	if (write && !aa_current_policy_admin_capable(NULL))
+		return -EPERM;
+
+	return proc_douintvec(table, write, buffer, lenp, ppos);
+}
+
 static int userns_restrict_dointvec(struct ctl_table *table, int write,
 				    void *buffer, size_t *lenp, loff_t *ppos)
 {
-- 
Note: if the sysctl approach is not taken, this patch should be dropped. 


