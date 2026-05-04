Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJj0E8bF+Gnh0gIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 18:13:58 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C00F64C13E5
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 18:13:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJvvB-0006AW-MJ; Mon, 04 May 2026 16:13:25 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <code@tyhicks.com>) id 1wJvv8-0006AH-UI
 for apparmor@lists.ubuntu.com; Mon, 04 May 2026 16:13:24 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id ACCD01D0001A;
 Mon,  4 May 2026 12:13:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Mon, 04 May 2026 12:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1777911201;
 x=1777997601; bh=JsgHmh+mhxA5OlhQRCOAjI7bg/ewT7I9AP70n8TTGBE=; b=
 Rigi4qjbwUxIrrrWLFY0fxWFRF4otlWd/a+AXx0V3nLf4XKKSvTa2ieR7oZjSqsm
 5VGHWg+qGP7P5BrVqGbuinVPqHD/4+rEr218kYFJQFmk74VlVMs8ujaSSTxsfs7N
 luhYgytf+6+kxB+wpSKDrC12+m+3S5iMBWegUR5lQn16KUwmXxdpJtez3RyBnNyJ
 6jMd9GQDmiZeEkUm05EwjKrkEuAxqQmcLBUdrk6HG8wUdmyxuL5Dz3WKZVVgjV/z
 uQDURr+PKzTeRQyCgiYAu9g7NX64cv84NXdwHXt8cN9dYuU+J+w0umFUg+XObfSr
 pKxTdmRtGH+ohUegoGRUmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777911201; x=
 1777997601; bh=JsgHmh+mhxA5OlhQRCOAjI7bg/ewT7I9AP70n8TTGBE=; b=P
 OXyCsnwAOqgm1A49R+jpLSOa0ADXoOrNxFVCFFblU+2LL1oYFaU0c/RFeHYMuthN
 XbKP+AyobGVuS3u5lsgaO2ujYvx0xI5ZyJC1fxVUkO7av0Exth+HJGJASvJVNdbH
 BUgVaYKDiHCcx9bii0aZfuDDqwLjCM5ZSAvaz5WdFn2txg7z5R1P8+Dg2cK4hPVQ
 1CIqAlCNWJnq4WyPxQnhJve0AXAfSdi5MxC4drqESXyrDW6/Didjk7clWFzc+Nlt
 8emU398wBTtK+7rEpc649SIStJ5Pced4SOZB/y9O/iE0XNkMspio2McTCEkIDiSK
 VE7Pyngh4mJkHQfPY54uQ==
X-ME-Sender: <xms:ocX4ad22kqln12bCIalv1EuO6wHYPT5bc-IcuRIdrQUg8y6w6IrzvQ>
 <xme:ocX4aaEJEhYNgWFbV3ybT6cVdnfJNiU-aNewLgiay-bR4LCFsyXFcWw5YqRxLkIt-
 gGu-7iEmvvDAwkOwOtQXMOzveL99YdHigX_sZnI4qkHSaAqUCNJwq8>
X-ME-Received: <xmr:ocX4abi1CU1Qx6RQ7klz7Z0-QSBXSkSILzXLrAB_QtiPjzixg4knN_o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelledvlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertd
 dttddvnecuhfhrohhmpefvhihlvghrucfjihgtkhhsuceotghouggvsehthihhihgtkhhs
 rdgtohhmqeenucggtffrrghtthgvrhhnpeeukefhffdukeeuiedtteetgeevffffleethe
 dttddvjeeikedttefffedtffelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegtohguvgesthihhhhitghkshdrtghomhdpnhgspghrtghpth
 htohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgvseiihihgohhonhdr
 phhlpdhrtghpthhtoheprghpphgrrhhmohhrsehlihhsthhsrdhusghunhhtuhdrtghomh
X-ME-Proxy: <xmx:ocX4aV_438Mj7F8z3K1NMPJOlCDRfBWYkkoKGkYMV7IJfQ9EmflHUg>
 <xmx:ocX4aSqY3OIisK_SysmbS8R2fVdbM-rH_mN1OKPit1n7PPFIrTW5Ow>
 <xmx:ocX4aU9x8hh1nhe5zr_08vh1l422zTY52d2lE-xou7RzV0JmakMNjw>
 <xmx:ocX4aWXrb0Mrq0OssxoeJ8k1jUYOoYgavpFjSQ2ccf-aHmaFIc60BA>
 <xmx:ocX4acaih3_00Hp6e23jewtfy8n1pd_FjTk28FioMu6kzRndeMwC7TKx>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 12:13:20 -0400 (EDT)
Date: Mon, 4 May 2026 11:13:18 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Zygmunt Krynicki <me@zygoon.pl>
Message-ID: <afjFno4Derx5-DOa@yaupon>
References: <20260502113720.185194-1-me@zygoon.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260502113720.185194-1-me@zygoon.pl>
Received-SPF: pass client-ip=202.12.124.148; envelope-from=code@tyhicks.com;
 helo=fout-b5-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH] apparmor: aa_getprocattr free procattr leak
 on format failure
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: C00F64C13E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	R_DKIM_ALLOW(-0.20)[tyhicks.com:s=fm2,messagingengine.com:s=fm3];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:me@zygoon.pl,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[code@tyhicks.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[tyhicks.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[code@tyhicks.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[tyhicks.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,zygoon.pl:email,tyhicks.com:dkim]

On 2026-05-02 13:37:14, Zygmunt Krynicki wrote:
> aa_getprocattr() allocates the output string before rendering the label
> into it. If the second aa_label_snxprint() call fails, the function
> returned without freeing that allocation.
>=20
> Free and clear the output pointer on the uncommon formatting failure path
> before dropping the namespace reference.
>=20
> Signed-off-by: Zygmunt Krynicki <me@zygoon.pl>
> ---
>  security/apparmor/procattr.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/security/apparmor/procattr.c b/security/apparmor/procattr.c
> index ce40f15d4952d..c07b6e8fd9c93 100644
> --- a/security/apparmor/procattr.c
> +++ b/security/apparmor/procattr.c
> @@ -54,6 +54,8 @@ int aa_getprocattr(struct aa_label *label, char **strin=
g, bool newline)
>  				FLAG_SHOW_MODE | FLAG_VIEW_SUBNS |
>  				FLAG_HIDDEN_UNCONFINED);
>  	if (len < 0) {
> +		kfree(*string);
> +		*string =3D NULL;

Upstream doesn't have this call to kfree(). Did you create this patch
=66rom an Ubuntu kernel tree?

Tyler

>  		aa_put_ns(current_ns);
>  		return len;
>  	}
> --=20
> 2.53.0
>=20
>=20

