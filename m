Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 12087D3BC0F
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 00:52:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vhz2D-0000aC-O3; Mon, 19 Jan 2026 23:51:49 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <huzhengmian@gmail.com>)
 id 1vhoGM-0005zK-Vu
 for apparmor@lists.ubuntu.com; Mon, 19 Jan 2026 12:21:43 +0000
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-790ac42fd00so39435037b3.3
 for <apparmor@lists.ubuntu.com>; Mon, 19 Jan 2026 04:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768825301; x=1769430101; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y8g1Nep66Hb2o5ywZmQKK5xS7oJRmgLsmW5flAXw3ZA=;
 b=kP2eQ3vBFWooFfG3kQKUo9yWep0E/x1bw9AtjznCA0vZamGqsBPHoQiHK/fbmGWzlQ
 PFKulDbiVjPT5hwuuepSxeExCOVX+POMI39557jF9vsX/mqael/j/KLkdhn3LthfnUgj
 emyyJuxlBQ6k7Mqq05nM9LG7s3uMzif/BLZX884WfnJC6C3VZhpnsNfBCGD0uzJtjN3G
 6wNAmyaGK266zYATw099WdXXsjC/WDm/XCtdL2Q1OP2bl/skVMB3yRr4DAlxgfg27M0T
 DwUTehXDT+edEEfo/7Tto0ncnIdo0lWzAnSDZnIpSfwW4uEtumoi5b+Jiw309hKju3sC
 0aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768825301; x=1769430101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8g1Nep66Hb2o5ywZmQKK5xS7oJRmgLsmW5flAXw3ZA=;
 b=mn8IRHkeY9zwzujxssesOSPKtiRo2RflvO7KC4LR3fOxtPMbX0vr7rwuvk9fMmk8py
 XN77ci3ABiz1s3CufpMdHFgRto7VJczVqeaqTevNpmCA43fQR1BlWYw1bz15geNl73zC
 mPxK78isKX0OXkFyNebUfhGiVBK2GlF6xsfOj4Mw8u7aunai5IsmEOHUsOY8QBKvhlPI
 95rBL5iVsd8qwO6c2FTryogIblM/U7hk5BHc7J3/ITZHOC8e+OtDvkVX/5r+87EVP4UW
 k3g704udizGsgenCLbH58nbvluitJ1j/TgmQC+i7H6VmGJQYCxxrkKnsrKrN7u6AueQe
 tc2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAzh2WrwwIfRZRBOuGjQcWmm4aD2iViaxJ6dNVvEYU+bf2xwghUSQWNsj7DzFJ1BgVA8ug5pZ1eA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yx0vMp8MSfcWhocgjflbjBQE5RQcrcTpOG8+pP+qsu6SXII6+cB
 VKS4hSUuTOFkdIpRv9Fp3axjhwK+3lcgIrRr27vonBE8ZFQgXkidzdmJ
X-Gm-Gg: AZuq6aIGiyn/crLJKshlUSmWLSIB8WoEkdrFeCCKGnWHUf2fFUjpdfh+ZKKxdaEyrbU
 sS9KsN9wKiMxvae2vALtqcpyBF+/HGyvPGtr0SPJfp6c5qhYZ9syfdY1J4IC1SwIlN1VAaVz5PQ
 GUmoIgiR//lKKBkq2AgSd+oIx3pR/m9+dhXHocUjxWUnKpflq7EAnbLhdapfbkcr9hpVDJyFx6r
 vpVWU+lEQUveZs5XtXEZk94Ibm6+gH+3JWw/rvRetGKkxHxIzrK+diYBX3YrKdtIgWw/fJFdWYz
 bLTRihFrZKe302/KVbba/Q3YK4xOKWU6kRY/oJGkocGEw5ToDQnm0KyYuOGAdY+btlrJQULsUZu
 raIWctUh5SYf6ayF2znZN3QifawQigIzj2uGCtdC9rIX1QSOZYOQiCGG+2cwJ/UWZNBHVmC74h4
 3BHib7deH/O4DH9D4RqH0uUuG0eps=
X-Received: by 2002:a05:690c:e3ec:b0:793:d0b2:ff08 with SMTP id
 00721157ae682-793d0b30206mr160688377b3.8.1768825301553; 
 Mon, 19 Jan 2026 04:21:41 -0800 (PST)
Received: from msi2.sky.cl ([2600:1700:65a1:210::47])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-793c66f326bsm39600677b3.19.2026.01.19.04.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 04:21:41 -0800 (PST)
From: Zhengmian Hu <huzhengmian@gmail.com>
To: john.johansen@canonical.com, john@apparmor.net, apparmor@lists.ubuntu.com
Date: Mon, 19 Jan 2026 07:21:18 -0500
Message-ID: <20260119122119.3648154-1-huzhengmian@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.182;
 envelope-from=huzhengmian@gmail.com; helo=mail-yw1-f182.google.com
X-Mailman-Approved-At: Mon, 19 Jan 2026 23:51:48 +0000
Subject: [apparmor] [PATCH 0/1] apparmor: avoid per-cpu hold underflow in
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

Hi all,

This series fixes a per-cpu hold counter underflow in the AppArmor buffer
cache. Under high-frequency execve workloads with AppArmor enabled, cache->hold
can wrap to UINT_MAX, preventing buffers from returning to the global list and
forcing repeated kmalloc(aa_g_path_max) allocations.

Summary:
On high-frequency execve workloads with AppArmor enabled, the per-CPU buffer
cache can enter a pathological state: aa_get_buffer() decrements hold even
when it is already zero, causing an unsigned underflow. The resulting huge
hold value prevents aa_put_buffer() from refilling the global list, which
starves other CPUs and forces repeated kmalloc(aa_g_path_max) allocations.
Because the AppArmor pool does not shrink, this accumulates into large
kmalloc-8k slab growth over time.

Repro (QEMU TCG, 4 vCPU, 1 GiB RAM, v6.16):
- Unpatched: kmalloc-8k objects grow 12->16 in 120s (run1), 16->20 in 120s (run2)
- Patched: kmalloc-8k stays at 12 for 120s

Notes:
This fix targets the observed underflow mechanism without changing the overall
AppArmor buffer pool design. Happy to provide the reproduction script and logs
on request.

Thanks,
Zhengmian Hu

Zhengmian Hu (1):
  apparmor: avoid per-cpu hold underflow in aa_get_buffer

 security/apparmor/lsm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.52.0

