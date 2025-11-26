Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 93986C892D2
	for <lists+apparmor@lfdr.de>; Wed, 26 Nov 2025 11:04:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vOCO2-0007Pr-Va; Wed, 26 Nov 2025 10:04:34 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1vOCNz-0007PW-4d
 for apparmor@lists.ubuntu.com; Wed, 26 Nov 2025 10:04:31 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 1FC721400275
 for <apparmor@lists.ubuntu.com>; Wed, 26 Nov 2025 05:04:30 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 26 Nov 2025 05:04:30 -0500
X-ME-Sender: <xms:rdAmaa7XRohbBCcDLX1UaWzGhZCy907j0imSEtfzssL43JXul8E_Pg>
 <xme:rdAmaa09-ApovfFG2aEQ5S4OROdtCzRxvFBTRgRvTI75TPERmeA9ARuqmXRDvP6Qk
 1YbujgAi5Icv_XFPyH7wmH22tII7bg-ky1y7ExE5vErOr49uYjs>
X-ME-Received: <xmr:rdAmafEbuhAF8lnsOqZD11Lep1MsKBxDG1436KjrxqZgbeUAmppPk9w6ijFCONYlkfVSzcQGFWSwJbOZBwnYwW-8RNgjAkDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeegtdeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfvhffutgfgsehtjeertddtvd
 ejnecuhfhrohhmpegkhihgmhhunhhtucfmrhihnhhitghkihcuoehmvgesiiihghhoohhn
 rdhplheqnecuggftrfgrthhtvghrnhepkeekgeejkeehkeejffeiuedtkeehffevieegte
 ffgfffvddtieejgfevvdejtedvnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesiiihgh
 hoohhnrdhplhdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtoheprghpphgrrhhmohhrsehlihhsthhsrdhusghunhhtuhdrtghomh
X-ME-Proxy: <xmx:rdAmacTs-XzT2R_MweK-C3eCGx3F6vbdabkapq86UQzheVyLk-gpbw>
 <xmx:rdAmaeDc9p78gmRWWDrg9d97gyu3FNxmoFI1RpuMVVsuSmunDhGVOQ>
 <xmx:rdAmaU04uBlFC6URUzWYgELLrOUDmiMj5NwmGdFD5MbHyKPm0CacUA>
 <xmx:rdAmaUUwADKmxiar5RqLU4N_DU03wRLVowYUQY9BzoB0ks4X7B7P5A>
 <xmx:rtAmaYCsz4IOvDkVNFIb-WYI9hcLbFgyGGaNUmuJ_bcWBcoNADaFsDDn>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <apparmor@lists.ubuntu.com>; Wed, 26 Nov 2025 05:04:29 -0500 (EST)
Message-ID: <7c1c83ac-c8d3-490b-a6b5-c718b1dbc016@zygoon.pl>
Date: Wed, 26 Nov 2025 11:04:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: apparmor@lists.ubuntu.com
From: Zygmunt Krynicki <me@zygoon.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.158; envelope-from=me@zygoon.pl;
 helo=fhigh-a7-smtp.messagingengine.com
Subject: [apparmor] Huge pages mediation class?
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

Hello

As a part of investigation into issue affecting mmap with MAP_HUGETLB 
[1], I was thinking if huge pages should have a dedicated mediation 
class and be handled similarly to how mqueue was recently added.

In the kernel, `aa_file_perm` function could special case hugetlbfs so 
that mmap would not end up using odd (possibly disconnected) paths for 
accessing it.

I'd be happy to pick up this work if there is consensus on the general 
direction. I would need some help with reviews and guidance along the way.

Best regards
ZK

[1] https://gitlab.com/apparmor/apparmor/-/issues/571

