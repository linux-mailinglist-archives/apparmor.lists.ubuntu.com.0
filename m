Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CBE895D3D
	for <lists+apparmor@lfdr.de>; Tue,  2 Apr 2024 22:03:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rrkMC-0005yQ-ED; Tue, 02 Apr 2024 20:03:44 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <muchun.song@linux.dev>)
 id 1rr8FO-0003zn-Tv
 for apparmor@lists.ubuntu.com; Mon, 01 Apr 2024 03:22:11 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20240328-jag-sysctl_remset_misc-v1-1-47c1463b3af2@samsung.com>
Date: Mon, 1 Apr 2024 11:21:25 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <8E19B519-9035-42E0-92DC-7C21471543D8@linux.dev>
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
 <20240328-jag-sysctl_remset_misc-v1-1-47c1463b3af2@samsung.com>
To: j.granados@samsung.com
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=95.215.58.173; envelope-from=muchun.song@linux.dev;
 helo=out-173.mta1.migadu.com
X-Mailman-Approved-At: Tue, 02 Apr 2024 20:03:42 +0000
Subject: Re: [apparmor] [PATCH 1/7] memory: Remove the now superfluous
 sentinel element from ctl_table array
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Atish Patra <atishp@atishpatra.org>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, keyrings@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-security-module@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, Anup Patel <anup@brainfault.org>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 apparmor@lists.ubuntu.com, Paul Walmsley <paul.walmsley@sifive.com>,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Jens Axboe <axboe@kernel.dk>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



> On Mar 28, 2024, at 23:57, Joel Granados via B4 Relay =
<devnull+j.granados.samsung.com@kernel.org> wrote:
>=20
> From: Joel Granados <j.granados@samsung.com>
>=20
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which =
will
> reduce the overall build time size of the kernel and run time memory
> bloat by ~64 bytes per sentinel (further information Link :
> =
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
>=20
> Remove sentinel from all files under mm/ that register a sysctl table.
>=20
> Signed-off-by: Joel Granados <j.granados@samsung.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

THanks.


