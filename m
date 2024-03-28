Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6260C895D3C
	for <lists+apparmor@lfdr.de>; Tue,  2 Apr 2024 22:03:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rrkMC-0005yJ-B9; Tue, 02 Apr 2024 20:03:44 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <axboe@kernel.dk>) id 1rpyoF-000306-Mc
 for apparmor@lists.ubuntu.com; Thu, 28 Mar 2024 23:05:24 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-29f8ae4eae5so406862a91.0
 for <apparmor@lists.ubuntu.com>; Thu, 28 Mar 2024 16:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711667122; x=1712271922;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/3aFzydSyExlB9BmbA34QemVRJ/ZXxJRv4umeOt6fqw=;
 b=MEzw6dg/fKKDpWDI1sm/jhHXRFRIYNKvfUv2HhegLaEiYf0lytXL91IxaItFtyHZqM
 NzEIR0w7awROFNIrTl2Ncwq+7sGi+Y+HVFZm5jjzlDFZXVBUOor58Gf4GHmuIhzWKgKj
 7bF6/rI9elrJ4ROV+GnbeBFskj4cjmGMyTWf9G1xkHIuF6lSbnCtys3/0cv6+JfNoqlz
 8BEdSFneYCQB/syydkN6CiWB7HMtaa5BwYHJOgwMCP2DQVxtrZLHlfsp2yFCq2sB3/l2
 xl8iiV9ahOyPG/Sfj6E3UzuHpXEPx3Ix7kwouO6dyJX16LubWhp8xqOTIP+Iet8s5azm
 kJEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4tWvxgI2a3dzWblvuLa9CTlV68/aWXQx6tHodU54NGPt1Rq+SNt+chhPxkcGcjhsV9LdrJzmcIf66u65PdoRbjX7eEA1Cg0AZ
X-Gm-Message-State: AOJu0YzJf6Zi3tSrklczlLxYwLXuk46WRun7O9l0U8bw9Sfu5oA4FkG7
 8N2reSx0Pm15cu+0fDikjwua4GeYiBtoKY2nJSPj7jNyKas4ZAbkCNvvujihFzY=
X-Google-Smtp-Source: AGHT+IGt0gkc119snKbJARF7UnrFMVXsS7gpTXjZzbZBfCEKd0wr8mr1SMS6Ds7kY42qafqSBM/uug==
X-Received: by 2002:a17:90b:3504:b0:29b:780c:c671 with SMTP id
 ls4-20020a17090b350400b0029b780cc671mr907698pjb.0.1711667121826; 
 Thu, 28 Mar 2024 16:05:21 -0700 (PDT)
Received: from [127.0.0.1] ([50.234.116.5]) by smtp.gmail.com with ESMTPSA id
 cx18-20020a17090afd9200b0029d7e7b7b41sm4013902pjb.33.2024.03.28.16.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 16:05:21 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <naoya.horiguchi@nec.com>, 
 John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Pavel Begunkov <asml.silence@gmail.com>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Joel Granados <j.granados@samsung.com>
In-Reply-To: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
Message-Id: <171166712004.796545.8747989552701562593.b4-ty@kernel.dk>
Date: Thu, 28 Mar 2024 17:05:20 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd
Received-SPF: pass client-ip=209.85.216.51; envelope-from=axboe@kernel.dk;
 helo=mail-pj1-f51.google.com
X-Mailman-Approved-At: Tue, 02 Apr 2024 20:03:42 +0000
Subject: Re: [apparmor] (subset) [PATCH 0/7] sysctl: Remove sentinel
 elements from misc directories
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-riscv@lists.infradead.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


On Thu, 28 Mar 2024 16:57:47 +0100, Joel Granados wrote:
> What?
> These commits remove the sentinel element (last empty element) from the
> sysctl arrays of all the files under the "mm/", "security/", "ipc/",
> "init/", "io_uring/", "drivers/perf/" and "crypto/" directories that
> register a sysctl array. The inclusion of [4] to mainline allows the
> removal of sentinel elements without behavioral change. This is safe
> because the sysctl registration code (register_sysctl() and friends) use
> the array size in addition to checking for a sentinel [1].
> 
> [...]

Applied, thanks!

[6/7] io_uring: Remove the now superfluous sentinel elements from ctl_table array
      (no commit info)

Best regards,
-- 
Jens Axboe




