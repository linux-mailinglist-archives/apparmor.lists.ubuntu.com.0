Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 008C5D1ACE8
	for <lists+apparmor@lfdr.de>; Tue, 13 Jan 2026 19:13:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vfitc-00070y-65; Tue, 13 Jan 2026 18:13:36 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <code@tyhicks.com>) id 1vfitb-00070n-32
 for apparmor@lists.ubuntu.com; Tue, 13 Jan 2026 18:13:35 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailflow.phl.internal (Postfix) with ESMTP id E590E13801A1;
 Tue, 13 Jan 2026 13:13:33 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Tue, 13 Jan 2026 13:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
 cc:cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1768328013; x=1768335213; bh=aU4rb3OvTF
 8qLsShVpSEmnK+fAsueKVWczgORTijkX8=; b=DqqxN2S7QlCO2usWObreP3+Up8
 YRzZj3E5eMe1IiJWMkfK3HPac8A4FT9RdR2uN9AMPjY6mjzPYlyxlkPSTnsCB9GL
 tInMWis3CuWYqfHu6BGmdUsxanb0VpdwKkkHJOhwufNJgvJwqaEeeqny2INzMdsp
 oOc6KyLWKVup23VPoqBsHCFxfQA8G/Muo2ftMjvqJ/4W8cVaIzvnlYcQG7vG0pN0
 KSM1OIzb/xRHx7FjCdwu43RzFzCDtMpkGEXx6bZ5lGQad0vYwaGUmEfuslAhLtt0
 Dg5CTLK3psSU+6h+tHOQLtddTkGtr+BOzSbJgXCDjidSjCch8DIqvDoSiYFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1768328013; x=1768335213; bh=aU4rb3OvTF8qLsShVpSEmnK+fAsueKVWczg
 ORTijkX8=; b=GXUbMdxHxeQbDXhQCWHLySsrnl+9BGIsUeiwwmR5YHH+W9TExCI
 HkmnnaHMblURk58hkTKBQFX0yR5KDoaCX8SGvdAkzqxSktEWjans+euyQamJABSv
 zQ1vjOY25pEmvqXkAdssom/sVGxihH45TSCAREhLB8h16FRuK/CM3xJpM1/OVK6O
 owMlQd6DsUE5wbwaAP5IXpQ6/llIcD1Tud8NNAKkakfgznuZqla3x6/pvvT1NTcK
 fDwtHnoWB/hMFAAaYNUKkxkEkiboDTNNKL8w/wFBsFwr0HrTxWcBx6GiOLgaYkAI
 weEiEieLzz9OC3hCcd6qGxiUp3AYY01/Pww==
X-ME-Sender: <xms:TYtmaY1l3arArNpUqwjQaUXCA-_IsLj4qrFNMw7slMEBCXWyjDbxwA>
 <xme:TYtmaajiTj9Py9vcj5bgdMSaSnt9dVGoGU64gJzfLYODPNAw4G5NhexIdSM7kLQtl
 7zGVKXl22Msh6f_wYaAegs6hboIfF4KbMi-kLr8-W5uAgBrboDL_w>
X-ME-Received: <xmr:TYtmaeR5l6uIncBp8ZcrGqBdQEFI0bUWW9QjE5fl_v4XWCRw_C7tQyo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvddutdduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
 jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
 epvdehvddttdfhfefhtdfgleehfeeggfdujeeuveekudevkedvgeejtddtfefgleeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghouggvse
 hthihhihgtkhhsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehrhigrnhdrlhgvvgestggrnhhonhhitggrlhdrtghomhdprhgtph
 htthhopegrphhprghrmhhorheslhhishhtshdruhgsuhhnthhurdgtohhmpdhrtghpthht
 ohepiiihghhmuhhnthdrkhhrhihnihgtkhhisegtrghnohhnihgtrghlrdgtohhm
X-ME-Proxy: <xmx:TYtmabhB_CUr9D85Pkqr2gXnNO214CYLweU94eGhp-zTjxs1CVj3nw>
 <xmx:TYtmae7GdF-EVDmhLDNhN9yLjwFGhCvX3ultCe7VPvjCY636YUK-Sg>
 <xmx:TYtmaYAIbGETuYC3uh5I8iap1_OJFb_yaSbT4JpefdtOaKCj7IU8EA>
 <xmx:TYtmaVaodc6X7Eosc2RNxtWxaSCnvTHTiF3yS-qXkJQsH6yzK1eVtQ>
 <xmx:TYtmaf0I23VTdoFkWvGGEmQ3lKTGXVHObgV3ZweON1LeNxLxcbS0p8vS>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jan 2026 13:13:32 -0500 (EST)
Date: Tue, 13 Jan 2026 12:13:29 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Ryan Lee <ryan.lee@canonical.com>
Message-ID: <aWaLSVYZcTL0ySN-@yaupon>
References: <20260113173558.15401-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113173558.15401-1-ryan.lee@canonical.com>
Received-SPF: pass client-ip=103.168.172.142; envelope-from=code@tyhicks.com;
 helo=flow-a7-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH] apparmor: return -ENOMEM in
 unpack_perms_table upon alloc failure
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
Cc: apparmor@lists.ubuntu.com,
 Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2026-01-13 09:35:57, Ryan Lee wrote:
> In policy_unpack.c:unpack_perms_table, the perms struct is allocated via
> kcalloc, with the position being reset if the allocation fails. However,
> the error path results in -EPROTO being retured instead of -ENOMEM. Fix
> this to return the correct error code.
> 
> Reported-by: Zygmunt Krynicki <zygmunt.krynicki@canonical.com>
> Fixes: fd1b2b95a2117 ("apparmor: add the ability for policy to specify a permission table")
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>

Reviewed-by: Tyler Hicks <code@tyhicks.com>

Tyler

> ---
>  security/apparmor/policy_unpack.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> index 019430225e4a..2280a8f7a843 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -700,8 +700,10 @@ static ssize_t unpack_perms_table(struct aa_ext *e, struct aa_perms **perms)
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
> 
> 

