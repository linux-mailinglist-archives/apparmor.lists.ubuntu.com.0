Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB3C8D647
	for <lists+apparmor@lfdr.de>; Thu, 27 Nov 2025 09:44:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vOXbj-0003IH-FR; Thu, 27 Nov 2025 08:44:07 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1vOXbh-0003I8-Sc
 for apparmor@lists.ubuntu.com; Thu, 27 Nov 2025 08:44:06 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 876391D0019C
 for <apparmor@lists.ubuntu.com>; Thu, 27 Nov 2025 03:44:04 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 27 Nov 2025 03:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm3; t=1764233044; x=1764319444; bh=BTMNxqG84j
 dBA+znlWdPf3IVApxggN+KEUiaHSs0YAU=; b=RWXNJvjYJmi7x4AXh7AlmCegPA
 WG1/YXv/EMVPczkfByG0VWYk6GU5KPglRJESdtN16DXQzR45PnrsLpdiRSnuqlRu
 58CbER8Cw69lLdh39WMrpdthWtD5Q1ikxqjrQjkvlL8kv1EymKYNdqkN1P50/Lbr
 r/XketKqO/gdXUOmpCxBwKRjypMDH35XbLkPhNz73DdnQj0MO4kn1ijPMxd6/UsP
 zBylRupOeuaPYuF5rwIuCgVTnXxCKKDNBGiIhjJ+8zacMu2iZZheWIl2QhaEHxt5
 AWNRX5J9i5FJCNRk0HGg5V0OzFm8Kr1IwLwSqoAd58KgLaQTYHpcdBtpIf4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1764233044; x=1764319444; bh=BTMNxqG84jdBA+znlWdPf3IVApxggN+KEUi
 aHSs0YAU=; b=u72vGwpOGxpIwoEExxV7UtovXOtcmUw9VzHkVf1rV01qpjRVfYz
 j/04ULWRoaox4ZjpuVjZbCjhLwccZ939f1s3eqMZbTkv5KoVHduYIlYFt8kp5UR7
 PU4UBZbTA8rix5l61PxicD+X+xy5xGbK/NSXk/Nr7AZf11XSupMGX7YnsU5B9PEy
 VeWAi/E2m12UfNvnAhWRkEWGH8ri+NYvSDxb5NS0IL15KwkaIXo35x4oLyUFUcpw
 4IjLmxHgu8nQ6BygP5SiqrzJC2BRn0nBenV4UDVYO3FuQ8PwSykWMKuaVSfoR9GG
 zw0CkooWD/XViZ/0ahNncN4vCGh0ltRmbLQ==
X-ME-Sender: <xms:VA8oaVDV4TObfGXHSDjmKKaE1h4QK1wXl9oNHLKd-oMCC_5dQKh9Ww>
 <xme:VA8oaafHLaltJTnDRAz0hRRQ4zlMXXFbkt1PFQGj6y1o6Wjmb-EzWtrBFbsFzNqro
 lib0oVHZ--tOpoO4rIlrHSW08TMkDHLCF1SBQeBEnfoCRujYcr-2A>
X-ME-Received: <xmr:VA8oaWN39IVD6KfEVSGkjoVwNZmAoTUYcrtkEaKUQXIHhyfKo8cxbRCuvkErNCqn8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeeijeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfvhffutgfgsehtjeertddtvd
 ejnecuhfhrohhmpegkhihgmhhunhhtucfmrhihnhhitghkihcuoehmvgesiiihghhoohhn
 rdhplheqnecuggftrfgrthhtvghrnhepudejhfelveffjeduledvkeeivdevvdfggedtie
 ejkedvgedvteekledvffevhfeunecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpuhgs
 uhhnthhurdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepmhgvseiihihgohhonhdrphhlpdhnsggprhgtphhtthhopedupdhmohguvgep
 shhmthhpohhuthdprhgtphhtthhopegrphhprghrmhhorheslhhishhtshdruhgsuhhnth
 hurdgtohhm
X-ME-Proxy: <xmx:VA8oaU5IE_6O8PwzJgiRXSpBrx2A4WiZeZ12mFB5TAICm1az1a2ZqA>
 <xmx:VA8oaaLSOG4EfYAzE5ewHsUc5OW8D9FlKsDhjLUp24XeHetVnEkUfQ>
 <xmx:VA8oaecncmaMf3g2pFnOIV3wjcQMhmW5aSKPRYkLkGRlTh21drtSqQ>
 <xmx:VA8oadeQZ1imxKmMrO39QA2hq2ewGJjljW6P_g_ldJuF1hM5RHfH1Q>
 <xmx:VA8oafqow16xnZrhKY8fG5mnBoU4GOvC0HTZWum8d-6uME8d8BSR0Prj>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <apparmor@lists.ubuntu.com>; Thu, 27 Nov 2025 03:44:03 -0500 (EST)
Message-ID: <fe0d079f-bcf0-4ca3-92fa-231c742c073e@zygoon.pl>
Date: Thu, 27 Nov 2025 09:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: apparmor@lists.ubuntu.com
From: Zygmunt Krynicki <me@zygoon.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=202.12.124.146; envelope-from=me@zygoon.pl;
 helo=fout-b3-smtp.messagingengine.com
Subject: [apparmor] File PDB with both Accept2 and Perms tables
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a technical follow-up to the MR 1863 [1] which attempts to 
correct a recently discovered issue between the parser and the kernel 
with regards to handling conditional user/other (aka owner) rules.

I've separately posted the kernel patch which adds missing 
initialization to the accept2 table in the case one is not provided in 
the file pdb.

When looking at the parser, I had to make two modifications:

1) In libapparmor_re I would allocate accept2 when permission index was 
used. I would then set the owner bit in each state/index of accept2.

2) In the parser proper I would emit the permsv field, just after the 
perms structure with the perms array. The value of the field was set to 
3. This I did not initially expect and it took me a moment to see why 
the kernel was rejecting my policy.

The kernel only loads accept2 (as u32 values) if the optional permsv 
field is present and the value is larger than 2. I feel I'm stepping 
over some future-proofing design I'm not aware of.

My main question is: is the issue 570 [2] something that can be fixed in 
the parser for the benefit of all past and future kernels regardless of 
my earlier-posted kernel patch [3] or is it something that would, for 
proper design and not doing the wrong short-term fix, require a 
coordinated patch on both sides?

Best regards
ZK

[1] https://gitlab.com/apparmor/apparmor/-/merge_requests/1863
[2] https://gitlab.com/apparmor/apparmor/-/issues/570
[3] https://lists.ubuntu.com/archives/apparmor/2025-November/013873.html

