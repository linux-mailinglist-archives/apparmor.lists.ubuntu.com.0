Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 329FEC8D5BD
	for <lists+apparmor@lfdr.de>; Thu, 27 Nov 2025 09:36:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vOXTj-0002DD-Ny; Thu, 27 Nov 2025 08:35:51 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1vOXTh-0002Cx-Ei
 for apparmor@lists.ubuntu.com; Thu, 27 Nov 2025 08:35:49 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 475557A01A7
 for <apparmor@lists.ubuntu.com>; Thu, 27 Nov 2025 03:35:48 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 27 Nov 2025 03:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1764232548;
 x=1764318948; bh=8dZ+6xmz4ZuKM9RmebN/fZuLxld5ERNQ1nb8mj/wB6Y=; b=
 1B/9D7h0DCNou2I9Z7KU9j2TGsPsI2oR+vG1jBj2ntw4z+X/0pYEWiCYalflY4fn
 A8WlnP3j+d01jCyFOOAuaxX6ifHGpCAvX7txcJRlyU3c2rIyAUiBWn8eQAkZg+h3
 QaHUnNIcMrYAK/BUFcQYBzibcQdolc9J28tk2P90Nm+3p9+s5GJzds81x2iP7uj8
 KRCt/dYoUxPS4uBe1eX3AnPYqV45gDrCyfx7OOE1mvKny28AeO8LBi3RCqDm7uy3
 2ta99ZOJXtctYXny3rTJCOs7bCFYSMY/LlP+sL472NlXhhXiw2P+UnUutxcQQdXM
 PO7q4yf+TUX0ukEPDPRWmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1764232548; x=1764318948; bh=8
 dZ+6xmz4ZuKM9RmebN/fZuLxld5ERNQ1nb8mj/wB6Y=; b=Wnu6tX1kGysyS6jep
 ioaCKSCcT/U94g3DzZuW5Yogetnp7K8OKgyfGpFpbDd3pjiE41a5bwKAiKrUgLLO
 5EQL+0MLb6m+h1CNR6FRBivgG5KlhdrG7sJPOiSp+hEcMvT9K38nRR8yRXUwCLOi
 9f4F+5DPYfOmyaFZNavxB+KmzWt05gP4UHAxybVLb1PUJTIUyWAkc1AbWanCzfKA
 xm04NckuN8rwfGUjzb8CDdJjJGjX81w+KPb6qGR2gUIlGe9h8qdHIJDWuMZWwB+P
 1CD6NTqZhAuL2t9TRyR94qHdVMauc1x0DyFzIgDnr/pLNVZ01SnM+cum2l9Gg9X2
 Dkysw==
X-ME-Sender: <xms:Yw0oaatwKD2VSz_qfW6PHL1_dxJtNHAOANLayskzkavCVH6-2Qte3Q>
 <xme:Yw0oaWavtS0vgC4uL45X2XJJStqchhrB7AqKZH2Qu6AvldU8WpJRZ5zE7Fyt5WyH7
 O2bkEIJp7nmDJi3spv1dSwNQp5z2NRGfaaOczia3kX-_7Is3gT3eNY>
X-ME-Received: <xmr:Yw0oaba9G1SweshUZiIQpMJw-16m6keDPkI6XivDkzgzUPwYrez3vX2WzPbiOJijFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeeijeeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertd
 dtvdejnecuhfhrohhmpegkhihgmhhunhhtucfmrhihnhhitghkihcuoehmvgesiiihghho
 ohhnrdhplheqnecuggftrfgrthhtvghrnhepheelvdeiudefudeuhedtiedtgeetvefhgf
 efgeetkeehhffhleekudettdfhfedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepmhgvseiihihgohhonhdrphhlpdhnsggprhgtphhtthhope
 dupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrphhprghrmhhorheslhhishht
 shdruhgsuhhnthhurdgtohhm
X-ME-Proxy: <xmx:Yw0oaaXLftx8SjzkihmiZ8mUc8Se4Kkoscx1nj5nvvNlsXIiqcbeQQ>
 <xmx:Yw0oaa3oM0DgV06wY3-lTRSkaMGIZ6Y-P_argxyUjgzdR7VO9WCh7A>
 <xmx:Yw0oaZZsTEBUjRK__NbcjkDQZSL6_zx7xJKF6ivgnpS5OjXANDCfVA>
 <xmx:Yw0oaVoJYEc9jFtyoAQMdBN0yZWHiTuy-gphdZ5A36gDBizp4094LQ>
 <xmx:ZA0oaXn-oLfiUJTnh4ZuJrL722sOYs3C8gzpKwVlsrg867wspqtK9A_M>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <apparmor@lists.ubuntu.com>; Thu, 27 Nov 2025 03:35:47 -0500 (EST)
Message-ID: <51ee7f9b-fddb-425b-89a5-8e778e3641bb@zygoon.pl>
Date: Thu, 27 Nov 2025 09:35:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <7c1c83ac-c8d3-490b-a6b5-c718b1dbc016@zygoon.pl>
 <d5fccb40-62a9-43d9-89d7-eb1c4c78c43b@canonical.com>
Content-Language: en-US
From: Zygmunt Krynicki <me@zygoon.pl>
In-Reply-To: <d5fccb40-62a9-43d9-89d7-eb1c4c78c43b@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.154; envelope-from=me@zygoon.pl;
 helo=fhigh-b3-smtp.messagingengine.com
Subject: Re: [apparmor] Huge pages mediation class?
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



W dniu 26.11.2025 o 23:58, John Johansen pisze:
> On 11/26/25 02:04, Zygmunt Krynicki wrote:
>> Hello
>>
>> As a part of investigation into issue affecting mmap with MAP_HUGETLB 
>> [1], I was thinking if huge pages should have a dedicated mediation 
>> class and be handled similarly to how mqueue was recently added.
>>
> 
> yes we want to split it off, it could potentially go into its own class 
> or potentially share a class with a few other memory operations that we 
> want to handle better.

What other operations would go there?

> The trade-off being whether we want to handle them in a separate feature 
> abi or not. If we put them in the same class then they need to move 
> together

Right

>> In the kernel, `aa_file_perm` function could special case hugetlbfs so 
>> that mmap would not end up using odd (possibly disconnected) paths for 
>> accessing it.
>>
>> I'd be happy to pick up this work if there is consensus on the general 
>> direction. I would need some help with reviews and guidance along the 
>> way.
>>
> 
> I am not opposed to free work, it should likely use the newer task based 
> pattern/operations as a starting point. I need to get those posted. 
> Though its probably not going to happen this week.

I'm looking forward to those then.

Best regards
ZK


