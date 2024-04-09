Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2DB89E209
	for <lists+apparmor@lfdr.de>; Tue,  9 Apr 2024 20:00:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ruFlH-000155-0d; Tue, 09 Apr 2024 17:59:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <will@kernel.org>) id 1ruEpB-0003sW-PW
 for apparmor@lists.ubuntu.com; Tue, 09 Apr 2024 16:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 68D22CE22A6;
 Tue,  9 Apr 2024 16:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DAEC43394;
 Tue,  9 Apr 2024 16:59:48 +0000 (UTC)
From: Will Deacon <will@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <keescook@chromium.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Joel Granados <j.granados@samsung.com>
Date: Tue,  9 Apr 2024 17:59:35 +0100
Message-Id: <171267686554.3168517.3836229489434629100.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.73.55; envelope-from=will@kernel.org;
 helo=sin.source.kernel.org
X-Mailman-Approved-At: Tue, 09 Apr 2024 17:59:57 +0000
Subject: Re: [apparmor] [PATCH 0/7] sysctl: Remove sentinel elements from
	misc directories
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
Cc: linux-security-module@vger.kernel.org, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel-team@android.com,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Applied drivers/perf change to will (for-next/perf), thanks!

[7/7] drivers: perf: Remove the now superfluous sentinel elements from ctl_table array
      https://git.kernel.org/will/c/f66ae597411c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

