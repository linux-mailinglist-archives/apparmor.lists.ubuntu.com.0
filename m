Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F179D3BD73
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 03:18:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vi1Jy-0005PG-TV; Tue, 20 Jan 2026 02:18:18 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <huzhengmian@gmail.com>)
 id 1vhzDb-0002eY-Bt
 for apparmor@lists.ubuntu.com; Tue, 20 Jan 2026 00:03:35 +0000
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-79274e0e56bso44934477b3.0
 for <apparmor@lists.ubuntu.com>; Mon, 19 Jan 2026 16:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768867414; x=1769472214; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+GqBvHxIb9Q9z4zhQuYRXNX+z8KyHXZOtzf8aziexY=;
 b=bnq4R4PmyTj/U3uax9fqlzyC8h3yfIcEvC/8aYdbRsivpanav2kawXlMl9tHH1MS/K
 5euMDXjGP+3WMDoliRypQqlEa/7mpiVhtJr+VNRG92XX199WGYAPn+iZ46Q/VdY9Y80Y
 qE2bFU4gCPM3YC/BdUN/g6fxCNjGXMsix2QYZ/tsjzasadyEWf/lihGOt0jwsZ1suasJ
 7CZCXv2AdjI2VVL7c7jFmNZ0vnZUpP9y1QvA5+uRv3UGoAuj2guTVp0Ez7m25jgvS7Az
 dHnwpO4ctjes0y2Y3LFtW0xMsHQgf5da52jFg6vfT58Q46OAqSL89I1ZxRqzcXC0vnUD
 CpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768867414; x=1769472214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f+GqBvHxIb9Q9z4zhQuYRXNX+z8KyHXZOtzf8aziexY=;
 b=YRqGoTHstQqlwYaZor6wVoEbIJtq7e46FqKQkaj+jHNDkQoQlAwYYfOaLBkSVONAqB
 36eS1Xtr4E5mh++bP732myiM/AMlA1B6rRs/uDvAG2Fl7JYUPsNOUD46rOACU+OVgv9E
 DZGtpUkd2N+cpy7fpUbrqNM7clfjzpcEYOQQr9FBXgfy2U78ZfW1Rj0HKtVAeq1MQxgk
 /+wyhCFJPdwJR01WEdnEsKwwUSzYtiHJ0secD3X/qAe3Ns/7/kklRl1n9rSUWDl1Mhyu
 xUNEVOURbxdeDIja+WwUDTzPs6TsiUR+Dc5VUCSQsbGcvwoeeifcKB90incyn8eFRRQi
 a6wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk0+ZGih6tNODqndf6W7p3wYA9SlaNzLqwI66SlWzAEvt2kYEvB3IxWm2Frb4VBogMgzKay2NxLQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyHQ4WA4otEs8+pOVhOcVssCJJrB14mqeJpV9664oT/j6cV3Msy
 tCpKIrgIp1wBc7ntRIAb+d/HKY62ylMWg5IHLsb7miQlqo7qWj3hTGRP
X-Gm-Gg: AZuq6aJCwzkgRxOvjPlbxqxlDzA6yvTnOmn6rkLfu0TC/WvJ0HfVSk4WOdNnG3ZYkSR
 GhHHPbKYMi/CraCuUCUXLeQ/8Wc8eXxUT1aXx1SiybvBNfR+JS9V7BpKCHwvFQVYEU/oDCLrIrw
 JRwmIwo7nWU5I1Mf5b7X6IVX5ryYWT7VL/ty/nz2AFVnuinZRfrQRi0GmNLYbedlPTR9Hc2jwvc
 RoA/jbLyr3YhZn3KFeIEjtvw34H+zhz1WQdWpnGxAnOm9ItfIPCV5pkMaNoWAeBu7rkqSL5GBRv
 UPWdSHcWfZDYsvRpEUKTOmcfBfdkgM7jpBMW58iHXw+F8Gy5QxsBxMQ/+zV4XoRMnUeYM4Xz1K8
 3vKYYt9INJLDne4Asit6SHGBsH0jfCFI7JmC7jgtw01U76JBGzJB9SO5msrJmpWdKvj9TYXVkbL
 7s5AbDKs1fNpj7eSD35y8YWBq0a/c=
X-Received: by 2002:a05:690c:4d0a:b0:786:7017:9511 with SMTP id
 00721157ae682-7940a122c2emr1603977b3.23.1768867414097; 
 Mon, 19 Jan 2026 16:03:34 -0800 (PST)
Received: from msi2.sky.cl ([2600:1700:65a1:210::47])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-793c66c729fsm45933607b3.12.2026.01.19.16.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 16:03:33 -0800 (PST)
From: Zhengmian Hu <huzhengmian@gmail.com>
To: john.johansen@canonical.com, john@apparmor.net, apparmor@lists.ubuntu.com
Date: Mon, 19 Jan 2026 19:03:07 -0500
Message-ID: <20260120000307.369587-2-huzhengmian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120000307.369587-1-huzhengmian@gmail.com>
References: <20260120000307.369587-1-huzhengmian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.172;
 envelope-from=huzhengmian@gmail.com; helo=mail-yw1-f172.google.com
X-Mailman-Approved-At: Tue, 20 Jan 2026 02:18:18 +0000
Subject: [apparmor] [PATCH v2 1/1] apparmor: avoid per-cpu hold underflow in
	aa_get_buffer
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
Cc: linux-security-module@vger.kernel.org, Zhengmian Hu <huzhengmian@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

When aa_get_buffer() pulls from the per-cpu list it unconditionally
decrements cache->hold. If hold reaches 0 while count is still non-zero,
the unsigned decrement wraps to UINT_MAX. This keeps hold non-zero for a
very long time, so aa_put_buffer() never returns buffers to the global
list, which can starve other CPUs and force repeated kmalloc(aa_g_path_max)
allocations.

Guard the decrement so hold never underflows.

Signed-off-by: Zhengmian Hu <huzhengmian@gmail.com>
---
 security/apparmor/lsm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 9b6c2f157..a6c884ba6 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1868,7 +1868,8 @@ char *aa_get_buffer(bool in_atomic)
 	if (!list_empty(&cache->head)) {
 		aa_buf = list_first_entry(&cache->head, union aa_buffer, list);
 		list_del(&aa_buf->list);
-		cache->hold--;
+		if (cache->hold)
+			cache->hold--;
 		cache->count--;
 		put_cpu_ptr(&aa_local_buffers);
 		return &aa_buf->buffer[0];
-- 
2.52.0

