Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMqIC67G+GlQ0gIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 18:17:50 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A335F4C143C
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 18:17:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJvz7-0006sf-L4; Mon, 04 May 2026 16:17:29 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1wJvz6-0006sX-15
 for apparmor@lists.ubuntu.com; Mon, 04 May 2026 16:17:28 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 79ECA1400108;
 Mon,  4 May 2026 12:17:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-02.internal (MEProxy); Mon, 04 May 2026 12:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1777911446;
 x=1777997846; bh=xAZ1vVqmw6XEsxybD6UJKLjRRWKMakL7vyKUIiCRCh4=; b=
 h9cmmLZe3RUXAzIww5oRCpUwXuFwrnzj3ozQtkBlh2TsgwxQ/2Smi6Oc5J7DsADG
 Efy6Sr2LIvMtR7P7HMIVwhq/FBDIMuhKAgOiVpPi8CgFTAMRQx1RMRXcIoobIwIb
 EgqWRNL1DTCsVK16izsKM4EMPOsjsIYzGixUJdb041i8sD8d7gNcMQgDn6k56qUy
 wUHCVjUfvA3zJOXJDonbAzsJVN+SbXSk2Cwsp2nRJizREyKr/Tf1hj02tYLSSpOv
 MJWOt+/LrNIvmRskKH43vz3K4gV1etEQUE6WcWG9KgPyYzqm0uF97Q9Ea6NQh1d1
 7u4vbrDKBBF+6a10HMiFXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777911446; x=
 1777997846; bh=xAZ1vVqmw6XEsxybD6UJKLjRRWKMakL7vyKUIiCRCh4=; b=Q
 KtfClTUCv2xk+CahzX0+xIa5oJKlX1CkA0d2+vCAXQDsNmzoCZ7TAOKUK61aEEqH
 2rCjsRsY8YBC7UGs9Uc7oK2wDAmu271kZHKamEt2q3ID4XgbDNFZr6JyhIi0HcH5
 0Me2+sI1WtuB5Y8k4neMxREOIpvcXsnPO8ZWHbcE1hv3xlkv2xNWweFfjIIQ7hjH
 9g/UfTqmAixljxGSr3EaQLL3mCuSxOXsBd9X4feXv7sU0Ir0YjYVdFSq6ZQgQslD
 QBN3I+nRmTINTTS1RCrEc1zPptiIWxqZV9qh17phOySMYA3niYh9atdpv5x+strk
 vHMGiE/HcYLTL7taLsa3Q==
X-ME-Sender: <xms:lsb4aa6DjvsCvA9PUHdVg_O-UyJ_oezaEdOday9Wz_HnJFAdBjcDDQ>
 <xme:lsb4aes480mwqVql1jcgMhEOweZcK9gvFAaZeclFGeO50QYiPQGr7nTVMbmxqTA_A
 NvgiRMPswxiGRA2CpGIUoyxyV879HNtbxFrrxNzwypizaVmD_BYlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelleeftdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertd
 ertddtnecuhfhrohhmpedfkgihghhmuhhnthcumfhrhihnihgtkhhifdcuoehmvgesiiih
 ghhoohhnrdhplheqnecuggftrfgrthhtvghrnhepfeehveevudfhgfevledtleetueduge
 dugefhleffkeetgedtgfefieefieehveffnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgvseiihihgohhonhdrphhlpdhnsggprhgtphhtth
 hopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrphhprghrmhhorheslhhi
 shhtshdruhgsuhhnthhurdgtohhmpdhrtghpthhtoheptghouggvsehthihhihgtkhhsrd
 gtohhm
X-ME-Proxy: <xmx:lsb4aVkyWeIvFLFy47AI3t1UnupbkLIj9Nc_0FakQwW9MuRUjVpejw>
 <xmx:lsb4aeyuHEPGYoXLVCoXBUk0fb2iPx27ZUjAaWx2I9z755C07WfW2g>
 <xmx:lsb4aTMAtSvfbNVqUVBiOtV7FW30wQo2hLWscJvN-URyAEUlr5x9xw>
 <xmx:lsb4aSTT2kB-nv_BgkCd28aL8dmldpXNDN2veiswxZjzoA7hWE-4ow>
 <xmx:lsb4aX0SuT5j1LGKiAxAcks2EMTs6SiXCntvtXvzfXEdiO31yNOqYYek>
Feedback-ID: i416c40e7:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 49183700069; Mon,  4 May 2026 12:17:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A24PNtswGLW3
Date: Mon, 04 May 2026 18:17:05 +0200
From: "Zygmunt Krynicki" <me@zygoon.pl>
To: "Tyler Hicks" <code@tyhicks.com>
Message-Id: <1aa1e737-3e4a-401e-a8ae-7d12736b5522@app.fastmail.com>
In-Reply-To: <afjFno4Derx5-DOa@yaupon>
References: <20260502113720.185194-1-me@zygoon.pl> <afjFno4Derx5-DOa@yaupon>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.156; envelope-from=me@zygoon.pl;
 helo=fhigh-a5-smtp.messagingengine.com
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
X-Rspamd-Queue-Id: A335F4C143C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.60 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[zygoon.pl,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[zygoon.pl:s=fm2,messagingengine.com:s=fm3];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FORGED_RECIPIENTS(0.00)[m:code@tyhicks.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[me@zygoon.pl,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[zygoon.pl:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@zygoon.pl,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,app.fastmail.com:mid,zygoon.pl:dkim]



W dniu 4.05.2026 o 18:13 Tyler Hicks pisze:

>>  				FLAG_HIDDEN_UNCONFINED);
>>  	if (len < 0) {
>> +		kfree(*string);
>> +		*string = NULL;
>
> Upstream doesn't have this call to kfree(). Did you create this patch
> from an Ubuntu kernel tree?

The kfree is coming from my patch.

I think those are all against recent (at most weekend away) upstream master.

Best regards
ZK

