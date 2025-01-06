Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F0DA0280D
	for <lists+apparmor@lfdr.de>; Mon,  6 Jan 2025 15:32:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tUo9D-00013L-4e; Mon, 06 Jan 2025 14:32:03 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1tUo99-00012g-Ul
 for apparmor@lists.ubuntu.com; Mon, 06 Jan 2025 14:32:00 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id C5CEF13801DC
 for <apparmor@lists.ubuntu.com>; Mon,  6 Jan 2025 09:31:58 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Mon, 06 Jan 2025 09:31:58 -0500
X-ME-Sender: <xms:Xul7Z4belD_CvPgRHdTguu6PCDh_v1P9mc7JF4G92d8QtOG-27Kt3w>
 <xme:Xul7ZzY_zXH_XU1eaKkcqui_EdThbT4CcZth8cSEvR-b-ovbd8SnaOWGFvW83w7yD
 t-car3GpGa6hKGS2Q>
X-ME-Received: <xmr:Xul7Zy_GVuwZ1rBsBLm7ybXC8E8_xZ5kAU_0l_-nE5pUMdyN8Uw0RqLxRV-FL06r1CQ3rc-jFNVHYQt98Jm19HLDKzbjIvxA9zvg9FGWcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegtddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfg
 fvhffutgfgsehtjeertddtvdejnecuhfhrohhmpegkhihgmhhunhhtucfmrhihnhhitghk
 ihcuoehmvgesiiihghhoohhnrdhplheqnecuggftrfgrthhtvghrnhepkeekgeejkeehke
 ejffeiuedtkeehffevieegteffgfffvddtieejgfevvdejtedvnecuffhomhgrihhnpehg
 ihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehmvgesiiihghhoohhnrdhplhdpnhgspghrtghpthhtohepuddpmhhouggv
 pehsmhhtphhouhhtpdhrtghpthhtoheprghpphgrrhhmohhrsehlihhsthhsrdhusghunh
 htuhdrtghomh
X-ME-Proxy: <xmx:Xul7ZyoIOFFvEzBl4mF4OEtmO3KI-xuR3-ygoAml_TR3tBdZa_w4Vw>
 <xmx:Xul7Zzr6LBs_iVfEcFspfqz6rEmzvingjonLX5qrGqPVNkpxxEg5DA>
 <xmx:Xul7ZwRDVXUNbQaUp1tEMCU8VAbibwcsbm8MSwhVShdJ4HkwBSUx8Q>
 <xmx:Xul7Zzqy0EG9Z0FC4PSSeiS8ZW9uDB1U-zw8hx8PF0mzI7dDbh78VQ>
 <xmx:Xul7Z8AutKRx9S9ceBZGcYiXgK6oFPnqlsUan5am7Rs9CSz6qqakNGWq>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <apparmor@lists.ubuntu.com>; Mon, 6 Jan 2025 09:31:57 -0500 (EST)
Message-ID: <795fb428-c1cb-4622-8546-2c21e4be996d@zygoon.pl>
Date: Mon, 6 Jan 2025 15:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: apparmor@lists.ubuntu.com
From: Zygmunt Krynicki <me@zygoon.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.151; envelope-from=me@zygoon.pl;
 helo=fout-a8-smtp.messagingengine.com
Subject: [apparmor] ImHex pattern for binary AppArmor profiles
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

Hi

Over holiday break I was using ImHex editor to look at binary AppArmor 
profiles. I've published the ImHex pattern language describing the outer 
little-endian envelope to my GitLab organization [1].

The pattern is pretty rough as I was exploring how to use ImHex to both 
parse the data correctly _and_ render it in useful ways for humans to 
read and analyze.

I'm trying to parse the inner big-endian data set but I'm exploring 
imhex memory sections feature to make that work in a readable manner.

In any case, I'm happy to share and welcome any feedback.
Thanks!

ZK

[1] https://gitlab.com/zygoon/apparmor-binary/


