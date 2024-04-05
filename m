Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C97A489A3D8
	for <lists+apparmor@lfdr.de>; Fri,  5 Apr 2024 20:04:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rsnvZ-0003ax-8j; Fri, 05 Apr 2024 18:04:37 +0000
Received: from abb.hmeau.com ([144.6.53.87])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <herbert@gondor.apana.org.au>)
 id 1rseSB-0007H2-Br
 for apparmor@lists.ubuntu.com; Fri, 05 Apr 2024 07:57:39 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1rseRA-00FUA8-A3; Fri, 05 Apr 2024 15:56:37 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 05 Apr 2024 15:56:53 +0800
Date: Fri, 5 Apr 2024 15:56:53 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: j.granados@samsung.com
Message-ID: <Zg+uxQxlhC6OcoVd@gondor.apana.org.au>
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
 <20240328-jag-sysctl_remset_misc-v1-3-47c1463b3af2@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328-jag-sysctl_remset_misc-v1-3-47c1463b3af2@samsung.com>
Received-SPF: pass client-ip=144.6.53.87;
 envelope-from=herbert@gondor.apana.org.au; helo=abb.hmeau.com
X-Mailman-Approved-At: Fri, 05 Apr 2024 18:04:35 +0000
Subject: Re: [apparmor] [PATCH 3/7] crypto: Remove the now superfluous
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
 Jens Axboe <axboe@kernel.dk>, Muchun Song <muchun.song@linux.dev>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 28, 2024 at 04:57:50PM +0100, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which will
> reduce the overall build time size of the kernel and run time memory
> bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove sentinel from crypto_sysctl_table
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  crypto/fips.c | 1 -
>  1 file changed, 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

