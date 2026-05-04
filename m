Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOuDI2HI+GlQ0gIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 18:25:05 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF3E4C1514
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 18:25:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJw66-0008Ei-UE; Mon, 04 May 2026 16:24:42 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <code@tyhicks.com>) id 1wJw63-0008E3-SN
 for apparmor@lists.ubuntu.com; Mon, 04 May 2026 16:24:41 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id CFDE01D0005F;
 Mon,  4 May 2026 12:24:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 04 May 2026 12:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
 cc:cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1777911878; x=1777998278; bh=pnNxJYBR5g
 YWG/e8QNAloEd8p10xUZYLMKcFXkuN5s0=; b=FpFvFgZk9/JT9xg3x2401OXWq3
 /Iz+DYJmVbmjTL0dJ5+ot6Oqjs7kR8jRBGgrvrIqHC0LJEcSSrsoquidnCaAua4h
 WJ4rEjlwdqir09s7OJwj1EDz4M+SbZlLqO8u2CUdZvrKkErOGSV/eqfI53D8+mS2
 d+Re55E+EY5U1mOIcJX/uA0HYd4dEC+A2xIcnMKJGt6yBqjY0e6HM4JLrM0kNILo
 CP/pJMlxe4SQAo3Ab+3BWypdvhqpTQMYEz8f+LVzJLUvHFgKAmr1thZJhw8GT1w5
 OrXRI43gF00dZvJ7SAoVcadqWaEPTIX/Tx4K/BENiQnFSL8L8GmfffGjzKfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1777911878; x=1777998278; bh=pnNxJYBR5gYWG/e8QNAloEd8p10xUZYLMKc
 FXkuN5s0=; b=MiXYhJ2DhfFzGNA+Uodn7L/PJrwAIFOcet+BVql8NPp9kBhEviL
 /olDPMS+hZICWtS4RcCXrFhDV06fc/SAn6tHEImVDoU19TKWO28HovtMW6pZxCUG
 mHJFOGGfvneUeQlKxXPcbvmGkSSPewzUKl4MqsulYBRfdAqZxdC7PDrLZ5fKCgM5
 Z4pjHzvgyCUqjdaGUf6xk3C0frdXV29EdafOSiWKKVaZAHgVfcPjkzRzhCi6GGmv
 OYCQJetttSWGdi/L7Y2TrxKiF4RfNtGcmVChz3fYXdXNepqelXglPj56k7+7EgxQ
 2AkVx9mEC2YHTYRV9xjZte/dlHQZ+dXBYSQ==
X-ME-Sender: <xms:Rsj4aWAun-YsdRmSdiUQyQ_5YcrqM7zKhUPkFEiL2J3hm6oNlXcXzg>
 <xme:Rsj4aWiehA70pPXD1aJ5Wnnz73h9VBqYM8UfaEElDgRxA2oblNR_9K_2CgCsEBQjM
 a3RxTRSVcTYQxhT5ABVCQpC88j49xMUm1uDfnw3-vd6Jiuhk-uPASs>
X-ME-Received: <xmr:Rsj4aXPY8cDt2fQLpU4aqdKmW5hO_WSXogZHlBu7uonscKRK5fmUg2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelleefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttd
 dtvdenucfhrhhomhepvfihlhgvrhcujfhitghkshcuoegtohguvgesthihhhhitghkshdr
 tghomheqnecuggftrfgrthhtvghrnhepvdehvddttdfhfefhtdfgleehfeeggfdujeeuve
 ekudevkedvgeejtddtfefgleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomheptghouggvsehthihhihgtkhhsrdgtohhmpdhnsggprhgtphhtth
 hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmvgesiiihghhoohhnrdhp
 lhdprhgtphhtthhopegrphhprghrmhhorheslhhishhtshdruhgsuhhnthhurdgtohhm
X-ME-Proxy: <xmx:Rsj4af7DTttaO23zu2hsMklBWoSqe-JYRljiWEwQhGL9mxJvEwHFwg>
 <xmx:Rsj4ad0kjgCTWIH9P6A_gUkOHOhjBKyePAW6KbKlvQW_sY4tk6wNyQ>
 <xmx:Rsj4aYYr-DA86JEEoBQ7fNhkFhDXFVKwmOSOeisi5-TwPkCUcA7bDw>
 <xmx:Rsj4adCe4f-ENPX04PubkXvYW2uORZOQl4nko4QT5DQ2A6u7MZiI0A>
 <xmx:Rsj4aVFB4wycQPe11N_OEwnKsrDar_HwG-lnTCHgt_JJ7-_UqWLk7KHC>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 12:24:38 -0400 (EDT)
Date: Mon, 4 May 2026 11:24:36 -0500
From: Tyler Hicks <code@tyhicks.com>
To: Zygmunt Krynicki <me@zygoon.pl>
Message-ID: <afjIRH7bJVtOd-wu@yaupon>
References: <20260502113720.185194-1-me@zygoon.pl> <afjFno4Derx5-DOa@yaupon>
 <1aa1e737-3e4a-401e-a8ae-7d12736b5522@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1aa1e737-3e4a-401e-a8ae-7d12736b5522@app.fastmail.com>
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
X-Rspamd-Queue-Id: 4FF3E4C1514
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
	FORGED_RECIPIENTS(0.00)[m:me@zygoon.pl,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,tyhicks.com:dkim,messagingengine.com:dkim]

On 2026-05-04 18:17:05, Zygmunt Krynicki wrote:
> 
> 
> W dniu 4.05.2026 o 18:13 Tyler Hicks pisze:
> 
> >>  				FLAG_HIDDEN_UNCONFINED);
> >>  	if (len < 0) {
> >> +		kfree(*string);
> >> +		*string = NULL;
> >
> > Upstream doesn't have this call to kfree(). Did you create this patch
> > from an Ubuntu kernel tree?
> 
> The kfree is coming from my patch.
> 
> I think those are all against recent (at most weekend away) upstream master.

Yes, I totally misread the trivial patch. My bad!

John, please feel free to add:

Fixes: 76a1d263aba3 ("apparmor: switch getprocattr to using label_print fns()")
Reviewed-by: Tyler Hicks <code@thicks.com>

Tyler

> 
> Best regards
> ZK

