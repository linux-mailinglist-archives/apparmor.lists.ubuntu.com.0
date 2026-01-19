Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C2D3BC0D
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 00:51:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vhz2D-0000aJ-Rr; Mon, 19 Jan 2026 23:51:49 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <huzhengmian@gmail.com>)
 id 1vhoGN-00061i-V5
 for apparmor@lists.ubuntu.com; Mon, 19 Jan 2026 12:21:44 +0000
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-79276cef7beso35750827b3.2
 for <apparmor@lists.ubuntu.com>; Mon, 19 Jan 2026 04:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768825303; x=1769430103; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4xpUlBJUkRI9BEvvEPmE2BefrFSelS9EOH7w/G+TnZM=;
 b=mBanpqGcTDifFyAZ2X81DMe7HC55oHLyGmPt0OkGs55vqkvXgU5WUK5G1CRa93QYDi
 QJk+bK4vR2KIX/Q9B+TcxjEhC9OV84AuXtzTY+ZXjEJR/bEl/VmoS0c+aRUlCeSps3Qt
 XAbJKfpEsR/gbNnMnYON6pTqLKE6b84mmY4WEqQTfG1wyfjTA2cuCo+Pl7EYeMCdSbAZ
 tdVyencrtoTSOeW5f0Ft399SyVVSj2zvl+GSFHUzeukW06yTrhxnuo/dum9zM779OzZY
 GNKpEGS8C5bX+Byq7gTKbrui2uLhNBghYbyebn2eKYma7mwNSh1Lk9rD/iKR3uU0x72g
 iLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825303; x=1769430103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4xpUlBJUkRI9BEvvEPmE2BefrFSelS9EOH7w/G+TnZM=;
 b=MRLKO88Z0KnSw6LLCckt2AqkOPrrRfft6wWQ6xOCMAuF4fyx3YnpMA/o/rDx2DYCCP
 SPabbpFNkmFKKhqsTRyCa6JGXyGgwAdb2VdWTPRNy20JuzJeb4yl0RLY6e1OQqV/kZ3J
 ZZ9kQJi70OORs1fHPemxvbZyJTkDA0dQL+RmqdVofFmAnqOPCmzov8Cr+MA/D4dLUq4J
 XBvZBuS3nmd3f8jlFIPFkUR8m9fGYpKqcaHLfcS4qdFOB18oAuG7Smdesy8QfxwVIFms
 HkKhNeOPzKopFKBED5dqPW+ySk9xhNTqm1YCi4XIKYuCXPKBCoHJ5aEQqTFy5pVN5g+Y
 ssFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM93zicj2mIbyaApDgf88jX2IMf2xdm4lCfRib4BuFMEi0itZFbJyEsAS2wDrrBUmpRX08K+Coqg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxuAWK7eeCJA6kcnTvFFi8WsC87HnrLWXym62zg5KqbmG1I42ue
 Dn6G0xD3MQR2C1rmW1HgzNrsslgDqRVl4N0yzgrZxWU52toRWSyiNXX0
X-Gm-Gg: AZuq6aLqw6/7rG/o1BhC5mM3x9WYHrfli8TqVn/45nfG/prXsAOiPsYHx49oIeKeI1p
 wsop/khTzbwdHCemv0PVfgCrD4k16LegqzRwlInhD870Ngg0vVkXeyI3/81OiJ/ZnMIwNQUyOlQ
 w0tpI3wYwUgyXWAz2MjgbKSS8yAN4lD0sBIRMswhkHfiIqT5XccgEAUqSyyvs13ZeAencK07cNd
 qxFWCvUYYe32XmxCJft30M8xIgj6PRI368DD1N0tW/mNMAF+dMxA6Wg0MK5RulUX1Dw/BGprTpQ
 aSGgOfXuJGRMv1Ho1K3806Bj482xTCEge+fgiKFq3u38onvyBEx7iP40V8zYs6jrt6pzK/khons
 PxToS9Wkg3ZHdjq7oIeATaEx0UTDWjDbONT7UStfIA0Ozqg8s7K6JqBnY+zV9eDBtSCYoglRVDX
 87G3KzxLXNFTDek56zvSGgQ6z/HPw=
X-Received: by 2002:a05:690c:60c7:b0:78c:2473:ae79 with SMTP id
 00721157ae682-793c5393a8emr70353737b3.39.1768825302663; 
 Mon, 19 Jan 2026 04:21:42 -0800 (PST)
Received: from msi2.sky.cl ([2600:1700:65a1:210::47])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-793c66f326bsm39600677b3.19.2026.01.19.04.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:21:42 -0800 (PST)
From: Zhengmian Hu <huzhengmian@gmail.com>
To: john.johansen@canonical.com, john@apparmor.net, apparmor@lists.ubuntu.com
Date: Mon, 19 Jan 2026 07:21:19 -0500
Message-ID: <20260119122119.3648154-2-huzhengmian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119122119.3648154-1-huzhengmian@gmail.com>
References: <20260119122119.3648154-1-huzhengmian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.180;
 envelope-from=huzhengmian@gmail.com; helo=mail-yw1-f180.google.com
X-Mailman-Approved-At: Mon, 19 Jan 2026 23:51:48 +0000
Subject: [apparmor] [PATCH 1/1] apparmor: avoid per-cpu hold underflow in
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


