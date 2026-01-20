Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F3121D3BD72
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 03:18:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vi1Jz-0005PN-0V; Tue, 20 Jan 2026 02:18:19 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <huzhengmian@gmail.com>)
 id 1vhzDW-0002d6-5K
 for apparmor@lists.ubuntu.com; Tue, 20 Jan 2026 00:03:30 +0000
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-78c6a53187dso46477727b3.2
 for <apparmor@lists.ubuntu.com>; Mon, 19 Jan 2026 16:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768867409; x=1769472209; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qfhKJnzVxCnG5LtWVAC7A0MBFk4q7eM2qauK6G+whnw=;
 b=dcZD3q0peGTnivdtD3CwUBPuNVEpTFi3a2fvLT8vpjThpnwsCSejyL2DK5SfSX/v+q
 aKjkLjUXrGFvvde3yJ1sPRj1yCk4B5SPH7fcdbmZmRkJsRxpWc99SxmVHM4FocfMZgqI
 AoFyWSNfSWQcJ+JGqwSqgZjmGrPyh4zx3+b8xvuPQ+k/qYNwlRCp+5XnIYV2yQeI5glI
 7e8h9JMzJFg4TCcs2vlifeRT+x5uGnexfwzk+ZPGJVRW1KHo8/lehSfWxODCFM6uBLtu
 LWCGPw3WtLQfHayC04LE6lZo1IM8iUDFNuuUx3OIqafXmf6oKCPlg63n5x8WatgD+6N2
 RndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768867409; x=1769472209;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qfhKJnzVxCnG5LtWVAC7A0MBFk4q7eM2qauK6G+whnw=;
 b=FlwVVfXl5dejgR/3aqehWwTMU8LjMe1Dusy+ru8V8v1JLGmIQ3fNye+pmMrNwb7UEW
 U1DpVEdxtHSYjNHyuG9SwN5avKB1hZznWSN4c1LCqNFxUCoVwRmHcIgxwu0apSWNFCwR
 54EW6HaH6OLtVdzIGv/xV3R+KIjH6ylB57MEbe9zMRYELD+hMS696pmyfLqDl81ZyPcb
 sqFbs7yONGC2jwFhQ1fc0DYgiTejESu5njH/8JrvhD79yX95rDRwBYMGi6rZmTsIJqmW
 fOZjCtKjlUIN9jyUWTqe08XGmAOPT/yYJ/2TDkyHEsz05KDDA4Z4PVTug9Iao9S540ZT
 Ypyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbgHpOgzwkfQOnGFSH/HQliVxeS8Cvv2EO+Y/QBdZEEZ7JqgNgk5iawVlHxPFDMISL1LZE7Osvlw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwM4AhMpbvSXPvODOV7W98OWyAB3PaeDDiqXMwAdut2AF9wfY1h
 KaGM0y+KpJiLbRjYiBfPzOgm8BmmzNxwtOw4RpjPnaq2kf8fHfiJlR6n
X-Gm-Gg: AZuq6aJWIovtfuqFTLUtJC5aX9Bwky9foHNlUJrEmTJpAwDWuRi3hSbvZYyywewlIX5
 IT6ydzyVj+HqFGf9bjdJ6en6+wDI24WqQv+rg+2TS4JODm8iA55MefRsdkgEY3ywXiR91KFgnTB
 K//PuCV0LbR243xo1xjsZd4Z8CRd9XJVunh39XxCVf0U+r7C+fFAmQOPUHsYwRqdD+i9x4qon2M
 HOumMbCIWNnjcFz9YqWsdKYg/Vb3vO0qHw2S0p9cT9zxVeZVR+NKzqZlj0tNRTXWoS/lZa14Pad
 /BQ9X52AW4MrfQ8TaUqAmzIC5jSX0iYObXGoCaOPLJ1XRpZm0u42t2G7krLBITHLNYiTeho1C6v
 m6tTex0PCiOliwBNmjhfRk7kI4bmwhTAy0X2xwRO5SFaP0QMS5tXcIpGRxhgzcytCgISRYDvfSJ
 TIkJts9mPZ+MG+WRAOxaeeJ861vK0=
X-Received: by 2002:a05:690c:1b:b0:790:4bcd:dec6 with SMTP id
 00721157ae682-793c670b447mr100664737b3.26.1768867408677; 
 Mon, 19 Jan 2026 16:03:28 -0800 (PST)
Received: from msi2.sky.cl ([2600:1700:65a1:210::47])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-793c66c729fsm45933607b3.12.2026.01.19.16.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 16:03:28 -0800 (PST)
From: Zhengmian Hu <huzhengmian@gmail.com>
To: john.johansen@canonical.com, john@apparmor.net, apparmor@lists.ubuntu.com
Date: Mon, 19 Jan 2026 19:03:06 -0500
Message-ID: <20260120000307.369587-1-huzhengmian@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.178;
 envelope-from=huzhengmian@gmail.com; helo=mail-yw1-f178.google.com
X-Mailman-Approved-At: Tue, 20 Jan 2026 02:18:18 +0000
Subject: [apparmor] [PATCH v2 0/1] apparmor: avoid per-cpu hold underflow in
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

Changes in v2:
- Add patch description to the commit message.

Thanks,
Zhengmian Hu

Zhengmian Hu (1):
  apparmor: avoid per-cpu hold underflow in aa_get_buffer

 security/apparmor/lsm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.52.0

