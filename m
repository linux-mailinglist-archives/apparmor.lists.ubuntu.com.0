Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B053C89F66
	for <lists+apparmor@lfdr.de>; Wed, 26 Nov 2025 14:17:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vOFOR-0003Fw-LV; Wed, 26 Nov 2025 13:17:11 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1vOFOP-0003Ff-6H
 for apparmor@lists.ubuntu.com; Wed, 26 Nov 2025 13:17:09 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id CC17A7A01A0
 for <apparmor@lists.ubuntu.com>; Wed, 26 Nov 2025 08:17:07 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 26 Nov 2025 08:17:07 -0500
X-ME-Sender: <xms:0_0maZQQIppgRVzq9qdBWnRCimnE5F1ZKwEDHGEKENzTOvrR-BAbQw>
 <xme:0_0maZsbdoK-QaJEcnYmiXpkMthEFt7_xnwJt28vx4eXtOpKg5pw-yTKhKGB3oBeC
 7DRo120qVxb6kikF6cVPFsLJPyrAlSB09PVL7vd8BlMSAYtdqzUBEY>
X-ME-Received: <xmr:0_0maUduHQL0rcL01ayMbLqZO55D6zFfTiLh90AJ803JHwNsA95r2JDJcx6dN9JV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeeggeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfvhffutgfgsehtjeertddtvd
 ejnecuhfhrohhmpegkhihgmhhunhhtucfmrhihnhhitghkihcuoehmvgesiiihghhoohhn
 rdhplheqnecuggftrfgrthhtvghrnhepgffhhfeugeetleevvdevuefgteeltdejledugf
 evvdfhveetueegtdelleduudffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgvseiihihgohhonhdrphhlpdhnsggprhgtphhtthhopedupd
 hmohguvgepshhmthhpohhuthdprhgtphhtthhopegrphhprghrmhhorheslhhishhtshdr
 uhgsuhhnthhurdgtohhm
X-ME-Proxy: <xmx:0_0maWI_hfvB5TW-5KZ2LIke-6DbiRiRet6CzOaNGeifAZ-ZHmDLDg>
 <xmx:0_0maSb-KtoWkYYH3ONEQ0QrRXaRKf9nstKGrd6XwMSkY_LxTuHLTw>
 <xmx:0_0maRtHV4XHNf94h2WFU54j8GQQlyn26hyejsG3XBL3-Pu57cY7FQ>
 <xmx:0_0mafuR7jWbp89Y9FOqt-GAOwFdZpzAmBr4zfyotL_didziz7on-w>
 <xmx:0_0mae7hWKUFf2lCXG9XZAKb-2dLNnOGUyc2Ee_OfS5-awpU2aksZ4-n>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <apparmor@lists.ubuntu.com>; Wed, 26 Nov 2025 08:17:06 -0500 (EST)
Message-ID: <9bbb2148-6dd4-40e5-a1dd-8afe59e68cad@zygoon.pl>
Date: Wed, 26 Nov 2025 14:17:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: apparmor@lists.ubuntu.com
From: Zygmunt Krynicki <me@zygoon.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=202.12.124.158; envelope-from=me@zygoon.pl;
 helo=fhigh-b7-smtp.messagingengine.com
Subject: [apparmor] Splitting unlink from write
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

I'd like to propose splitting the textual permission "w", so that it 
does not imply AA_MAY_DELETE if the file is a device, fifo or socket. 
Profiles routinely grant "w" permission, but nobody in their right mind 
expects applications to delete such files.

Both userspace and kernel can already kind-of express this. The only 
question is how to do that in a way that doesn't force a painful profile 
transition. I think we need a new permission bit.

My suggestion would be to add a AA_MAY_DELETE_SPECIAL permission. 
Starting with some future ABI deleting devices, fifos and sockets would 
check AA_MAY_DELETE_SPECIAL. Compatibility layer in the kernel would 
then continue to grant AA_MAY_DELETE_SPECIAL for older ABIs.

On the userspace side we might define new syntax such as:

allow file PATH D,

Where D implies delete special.

I'm happy to take a stab at implementing it. The only thing I'm not sure 
is how to name the new feature "delete_special".

I'm grateful for your thoughts

Best regards
ZK

