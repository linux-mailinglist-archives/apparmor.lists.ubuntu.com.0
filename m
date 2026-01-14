Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A636D20901
	for <lists+apparmor@lfdr.de>; Wed, 14 Jan 2026 18:32:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vg4jU-0000nl-DY; Wed, 14 Jan 2026 17:32:36 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1vg4jT-0000lq-1A
 for apparmor@lists.ubuntu.com; Wed, 14 Jan 2026 17:32:35 +0000
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E039D3F68E
 for <apparmor@lists.ubuntu.com>; Wed, 14 Jan 2026 17:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768411954;
 bh=8AW3598KPk34684qzgGHdRcbzNVqOvQ+mlo6NxQIQu4=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=SWcUx7jBUqnLchQ3zRLDIFxGD4HShAvjQk/D9EoysD6PysftE55ttt1nppb8V0j7Z
 cJvEm86tzhy+N64eqXlOaK/VdaWot6G/K02SzhmlfQa7tvo/O9l6NrQD7oRnqo5JyI
 a9giGajOPWzJV796pFhP3wWZOWlTniWxk2+zFUp30CR/ewWIcVOekpbkyVBPs617wE
 dxaN0LDUDNd37WiTdegKMhDGDUfX6/gehFbSoqTK3p6Gnip53c6FN83wvAcWwK/kOe
 jeo91McvGkKUfQNQi147SfuWP7Cjgks8mkJrYQ3KQ4Oo8ycbKXnFMjwqWCIszhR0Aa
 W3Yft6pyNCrlJijMsod/bWfZCP4xbxNEN4yINztHlvQ22IqwipfVkk7gtv9cNSiXfB
 qPNijHJxZcmm7YICQ5wqB2gO96YSOgjuE2tzIw/TFQcGVPlORb3U956DLq6rdw9Q+h
 fXz6W/BYx1cX295Jxi2uAHZs5PUqjXc0C01LeKoeseaYSaEuX3jYZj+GPy8y+2IBqB
 KsXXo5mCsM0IiooVUbI4xXQQlrHmJdtgKw39o7sO+DIctNKwIEoY4/Jv3xcnlu2pwc
 w7JgLE86oSnE4XZqX3Z6iy9nVmblH5sXD3N8oT53qQm/KacnG/KKRu2JVt7dvFHs9y
 4r3UFXsc5X1uuzQ4kBWxoWes=
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2ae546fa935so400895eec.1
 for <apparmor@lists.ubuntu.com>; Wed, 14 Jan 2026 09:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768411953; x=1769016753;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8AW3598KPk34684qzgGHdRcbzNVqOvQ+mlo6NxQIQu4=;
 b=pSi8VKYRz+jZkcvvOMm7tqpVb10esKEZijHprsM1Nm+otPWNX4PnIj/IGkojfpUs45
 UiJ8HR4ppUZcMXds1N/CoJwYZYtCJRhL3Ru1L8TB+RkiJG3lCvGp+1bx+ew54CCTmi6+
 YZCds7bd6PEbercq1TCThfkLdYiKNbyNwIZ7zIEiItft/VKmUOonZL1DwwBePuCceBdt
 6z/ewOT5MNA61PPa7SxrzA2p06V/JyMeJaqgPRtkhVwPHLvYawT9m6fGxhtEcVZ00Qqq
 DScVXhm8qL6Q+FML1wb16vQZWWVqZS9hO2VZjAPiGSaWdZn6OVlB5fWK8YMDtuBSCLpE
 WFtQ==
X-Gm-Message-State: AOJu0Yx3GTZ/5PI1g1vTTp9Ud5mpC8mubVpvkSUGiMTf6FoYN0YWKy3K
 2M5fWleeHSdutpZLE6Pc4ERC9InAnulrrkNNSRlordspESBCffqJJs/nYniPz7cexQLk/8kXAGI
 XMnYQcUyS6AhNR0pakBwOYtTssPICO5PljFqBuTcg/eFtER4sxdyt70M5XWgJ5A7/GVx3p5Bj2Q
 BsEHxu6MiTig==
X-Gm-Gg: AY/fxX5T658T5DB7iGn3D106PWib/oQMShuh+1hRyK8XraAsNMyoEVsV6BZCcAm9NYh
 w6Cb8LEVQEmHMEB6NqAYT0lR5tS3TN926cOkn4VzF9sT7ZNHjijSKrTY7r0i7Iq2BIu3LX2TiuT
 GBCcNPS9XhpOp93tlFsBmfZAlC1NqPgZrZ1bzsCacKFDyPQ4d+X76BeDhRIlQPj5NcKz3hpYURx
 TJIWL/az7J4Fhyd4bS9HH5hYfMT/xQrvWcKndYLYmkzP4MRt6F956lm+iN+38iLkFK1LLhtt0al
 4uU2OhM47K4aTQf0xLkIir4moSoXOlfHNsLAY+gtQkjI8qx9wyvUumgWBX/fWP9o/TKeoXGcPZ9
 RMWtbEHXNY2abqRZKMm5xe/qhY0OANZ+oFSy9djK6rPTJ3X0PlnT1ouJHsT3n8DiHdKU=
X-Received: by 2002:a05:7301:2a08:b0:2b4:52cb:d4b6 with SMTP id
 5a478bee46e88-2b48f70bae4mr3528335eec.39.1768411953142; 
 Wed, 14 Jan 2026 09:32:33 -0800 (PST)
X-Received: by 2002:a05:7301:2a08:b0:2b4:52cb:d4b6 with SMTP id
 5a478bee46e88-2b48f70bae4mr3528296eec.39.1768411952511; 
 Wed, 14 Jan 2026 09:32:32 -0800 (PST)
Received: from ryan-lee-laptop-13-amd.. (c-71-202-93-145.hsd1.ca.comcast.net.
 [71.202.93.145]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b1707b21dasm22204441eec.27.2026.01.14.09.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 09:32:32 -0800 (PST)
From: Ryan Lee <ryan.lee@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Wed, 14 Jan 2026 09:32:24 -0800
Message-ID: <20260114173226.14956-1-ryan.lee@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] apparmor: fix boolean argument in
	apparmor_mmap_file
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

The previous value of GFP_ATOMIC is an int and not a bool, potentially
resulting in UB when being assigned to a bool. In addition, the mmap hook
is called outside of locks (i.e. in a non-atomic context), so we can pass
a fixed constant value of false instead to common_mmap.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
---
 security/apparmor/lsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 08757f372972..320e4e1e1748 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -826,7 +826,7 @@ static int common_mmap(const char *op, struct file *file, unsigned long prot,
 static int apparmor_mmap_file(struct file *file, unsigned long reqprot,
 			      unsigned long prot, unsigned long flags)
 {
-	return common_mmap(OP_FMMAP, file, prot, flags, GFP_ATOMIC);
+	return common_mmap(OP_FMMAP, file, prot, flags, false);
 }
 
 static int apparmor_file_mprotect(struct vm_area_struct *vma,
-- 
2.43.0


