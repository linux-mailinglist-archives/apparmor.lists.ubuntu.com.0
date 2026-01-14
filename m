Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C19D20979
	for <lists+apparmor@lfdr.de>; Wed, 14 Jan 2026 18:43:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vg4tU-0002gx-AM; Wed, 14 Jan 2026 17:42:56 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1vg4tS-0002gf-SM
 for apparmor@lists.ubuntu.com; Wed, 14 Jan 2026 17:42:55 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 78C271400045;
 Wed, 14 Jan 2026 12:42:53 -0500 (EST)
Received: from phl-imap-14 ([10.202.2.87])
 by phl-compute-02.internal (MEProxy); Wed, 14 Jan 2026 12:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1768412573;
 x=1768498973; bh=9TucFw04oXAPAoVOWOS+c0pja5tPrvUwc5ZeUznv/8s=; b=
 ho5gmHtlT9NKaBUR1B+IPf7Yf00vI0HU4t82QNqbfBa5QsYCJAYTCRWmOE3FTwZM
 nENmflmGiH5ikuJF1BPiKsUOynuHeWUmEZU9zwFGTUDJjUAY23Qsb8/UgeD0aqNI
 O7ysW1+rAYr6LAa2aeoua5BM6ORGEtIjVWAXLre5K5C2PcZSrnI+2h87prgERRBh
 cbbroAPYl5Hfp+f+ziv+arYm1iO8Z95lpD0z4qfhy1UrGLjUUApjh0pao7pUMtlF
 /aT8RlHC1x0Ws+PdIHyey74Wwh1PmH+VJSP70fZpcVbHtqi4PXm4ydh/lt1Z2HvG
 sEJmPXMTizVeBTqLG905Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768412573; x=
 1768498973; bh=9TucFw04oXAPAoVOWOS+c0pja5tPrvUwc5ZeUznv/8s=; b=B
 EQKQRqCW8UzxRdzi1w+vTAoK08lpNWkYwVBQJm/eMdMXDsrc0j5ibSKJAlzUA6ed
 pDCAy6Lw9/I+gtWBy9FwUChXxuAniJh8EhJzpLmP8hdW+g1e/Fe3AACJyyey+NNS
 ka0YE8Ty1bLwh8ePUhxSwJlaifjyoWI1lZ4o2Wkf/RT6jQXHeQY3U6lgp/zjvfhB
 2fv369cn4PBVYRVYEjTyUrmO8BsyPOc6d4I8t1BZxUpfL7y+zgJqlbHZWSOFJul5
 mT9NVcAPEsOXJAAPLUtBVlAhCU2+vZ6CG16ZvgLftRcW7GXJ5tOpX6qmcS/8Rinh
 8QhE3DjDSDRn2Qpnqq06A==
X-ME-Sender: <xms:ndVnaT0s0w4lyW4tDQji6Ih-DoqOk-queJsdg9uUIz6sgQzjqxgMyQ>
 <xme:ndVnac53c5OcL47JH7T9G2nZe_WqfOyvXK86by3qtsc656jPuXHVbQItA3JT_1Qm5
 Y1txKjseZZe9rlLJPCwdmcAx2rr2ztr2GcACLW4xVOjD0pPinBJNFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdefkeduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfkgihghhm
 uhhnthcumfhrhihnihgtkhhifdcuoehmvgesiiihghhoohhnrdhplheqnecuggftrfgrth
 htvghrnhepfeehveevudfhgfevledtleetuedugedugefhleffkeetgedtgfefieefieeh
 veffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 gvseiihihgohhonhdrphhlpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehrhigrnhdrlhgvvgestggrnhhonhhitggrlhdrtghomhdprhgtph
 htthhopeiihihgmhhunhhtrdhkrhihnhhitghkihestggrnhhonhhitggrlhdrtghomhdp
 rhgtphhtthhopegrphhprghrmhhorheslhhishhtshdruhgsuhhnthhurdgtohhm
X-ME-Proxy: <xmx:ndVnaex-6NT9ywtgE9RPAyhsmR1TsS-QBfggAR0F6s9WUS5xWxCWZQ>
 <xmx:ndVnaSCWYBvOF707dO8WNikUAUL4DPs8n1Yt23i--UTkFekGAI6lwQ>
 <xmx:ndVnaTYn4v5LxmiKFxi2t8d2fB8r87PnJ3LXr_IiRLo2KoWhmK2LxA>
 <xmx:ndVnaSi33rkXrnjCjlc0pzj4vQnjwgDwcT8WFYt4t2IieA6pobgBUA>
 <xmx:ndVnabYyPpljLNMzTuXlxK1A7fbybH5X5NHRcSgfaY5PYpv1zdth3u3m>
Feedback-ID: i416c40e7:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 02E33C4006D; Wed, 14 Jan 2026 12:42:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbSz-3K0BucB
Date: Wed, 14 Jan 2026 18:42:31 +0100
From: "Zygmunt Krynicki" <me@zygoon.pl>
To: "Ryan Lee" <ryan.lee@canonical.com>, apparmor@lists.ubuntu.com
Message-Id: <93e697f2-c67c-4020-9a24-4e2d149797ed@app.fastmail.com>
In-Reply-To: <20260113173558.15401-1-ryan.lee@canonical.com>
References: <20260113173558.15401-1-ryan.lee@canonical.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.153; envelope-from=me@zygoon.pl;
 helo=fhigh-a2-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH] apparmor: return -ENOMEM in
 unpack_perms_tableupon alloc failure
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
Cc: Zygmunt Bazyli Krynicki <zygmunt.krynicki@canonical.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

W dniu 13.01.2026 o 18:35 Ryan Lee pisze:
> In policy_unpack.c:unpack_perms_table, the perms struct is allocated via
> kcalloc, with the position being reset if the allocation fails. However,
> the error path results in -EPROTO being retured instead of -ENOMEM. Fix
> this to return the correct error code.
>
> Reported-by: Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
> Fixes: fd1b2b95a2117 ("apparmor: add the ability for policy to specify 
> a permission table")
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
> ---
>  security/apparmor/policy_unpack.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/security/apparmor/policy_unpack.c 
> b/security/apparmor/policy_unpack.c
> index 019430225e4a..2280a8f7a843 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -700,8 +700,10 @@ static ssize_t unpack_perms_table(struct aa_ext 
> *e, struct aa_perms **perms)
>  		if (!aa_unpack_array(e, NULL, &size))
>  			goto fail_reset;
>  		*perms = kcalloc(size, sizeof(struct aa_perms), GFP_KERNEL);
> -		if (!*perms)
> -			goto fail_reset;
> +		if (!*perms) {
> +			e->pos = pos;
> +			return -ENOMEM;
> +		}
>  		for (i = 0; i < size; i++) {
>  			if (!unpack_perm(e, version, &(*perms)[i]))
>  				goto fail;
> -- 
> 2.43.0

This looks good.

I'm unfamiliar with kernel acked protocol so I'll refrain from that.

Best regards
ZK

