Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E7FC8D5A8
	for <lists+apparmor@lfdr.de>; Thu, 27 Nov 2025 09:33:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vOXRf-00024Y-0Z; Thu, 27 Nov 2025 08:33:43 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1vOXRc-00024J-Rd
 for apparmor@lists.ubuntu.com; Thu, 27 Nov 2025 08:33:41 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 8729B1D00170
 for <apparmor@lists.ubuntu.com>; Thu, 27 Nov 2025 03:33:39 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 27 Nov 2025 03:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1764232419;
 x=1764318819; bh=vv46oeI1+vqLOz26cZ/9KLjlBopJs9xqbqv7FI6hgM4=; b=
 2uQ/psVMSE7faynxrxQhztIU37Vl4gS1JSF8dVoz2LBux8cIr6DYmYLEfqvfcPxY
 6BIfbr0dZQNipUjXLf6DzZnBvIRzndsEQeNGa2gCDuBIDp/qmDK6AJDlWWx0Q0Uf
 70Alm11fO6jS+AYhgEyOp06SEyGFG7w+xjRZ0vbthWvckfJ+pgOJfG2Hvzm6pXOK
 uPiZgH+lQ6iYXOlMamTZNpJAG2fTZ+5Q3sGVd+Liuv0aBPv3mxPJ2Xfj5gpWmW3N
 5CQPxiIfs3ASY7Q4t+Zmks55zbnGGYEbseYb9DGtDLIq3IarTcEVlq4wENh/cDoU
 w4fuzxCL3HrK+SLM1G6huA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1764232419; x=1764318819; bh=v
 v46oeI1+vqLOz26cZ/9KLjlBopJs9xqbqv7FI6hgM4=; b=Xph53+zxgwjo0sO8v
 biYaKxH+GsT7RrrmgCnv1pgTlVxUeaG0O6Z46TZCUsyUil4uasCnA0NzasAXQDM+
 51/Qlvk7xIoT5yIwI7CFbysUvSMhrcldkigKZgCD5vnI6EOmM4dcF0zYACtvoIzH
 SkB3gY1NOV/+STGzt6TQZ+NDoSym7SuBfXVyzNPSB1nF6F3B7aJ3EJ9/eQe6oG8T
 G1FifqhF5L1xFpQ8OI7N6Ovd2SXws9MCsMsv0UFZY+7anxulk1yUsX8E7P0qMcJb
 RLX+x8SmwT8lrYwKFYnTsAeCCEK4XpBC2j8vi8GlRe2r/kG5aUYNl/2e/vgXVxYU
 xtXuQ==
X-ME-Sender: <xms:4wwoaQTf0xu9QvZQ919t8L9PeDU3UqmuxtdJZM9qQxlbm_0Ko8c0WA>
 <xme:4wwoafz3Zb-hd7bonGfiUgbK_FhsgOZLTC1StR428YvS9PR2Y79s8bFdCspOZRMzT
 O3G4wpI909OLx62J0E0Ayq2gw9_7Uv5mjEbCgtEf4oXNjD75qMABg>
X-ME-Received: <xmr:4wwoaXN__KckawL8dyRN-fZy7IhUctzo4l-E65MguYkM5IxkFFDcCWWriPuGzQexoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeeijeeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertd
 dtvdejnecuhfhrohhmpegkhihgmhhunhhtucfmrhihnhhitghkihcuoehmvgesiiihghho
 ohhnrdhplheqnecuggftrfgrthhtvghrnhepvedtvefhtefgueejudetieegkeehleffte
 eijeffvdelffdvhfekudffvdfhveeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepmhgvseiihihgohhonhdrphhlpdhnsggprhgtphhtthhope
 dupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrphhprghrmhhorheslhhishht
 shdruhgsuhhnthhurdgtohhm
X-ME-Proxy: <xmx:4wwoaWOLLDrMK10fzrd3WJ2vjx6WGvFYJM7_lr4H7JvfiHOBYA-m8w>
 <xmx:4wwoaRQ4IeX4fEEYmsTKqKfQnnee3LM4W-B9Z7ZRBgDgcyy4MKs5JQ>
 <xmx:4wwoaQDi9YC4V_NAlGVfvaD9z93yLXtbW1STskLCLYVw9A-YPGtMcQ>
 <xmx:4wwoaYjZUAIAhS-C0gcJumiwyyLS34ENNuUqod1hZSX1UDKCauV4lQ>
 <xmx:4wwoaSFxkUHkN5DBB56QH_TqdtTTjExJqTIfAlfTjf8tRyR2EM0SVWX1>
Feedback-ID: i416c40e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <apparmor@lists.ubuntu.com>; Thu, 27 Nov 2025 03:33:38 -0500 (EST)
Message-ID: <85e5fcc9-b952-4a0f-9619-cc21e3436d9e@zygoon.pl>
Date: Thu, 27 Nov 2025 09:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <9bbb2148-6dd4-40e5-a1dd-8afe59e68cad@zygoon.pl>
 <363f581c-d820-48db-8a5d-7d399e741fb0@canonical.com>
Content-Language: en-US
From: Zygmunt Krynicki <me@zygoon.pl>
In-Reply-To: <363f581c-d820-48db-8a5d-7d399e741fb0@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=202.12.124.146; envelope-from=me@zygoon.pl;
 helo=fout-b3-smtp.messagingengine.com
Subject: Re: [apparmor] Splitting unlink from write
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



W dniu 27.11.2025 o 02:29, John Johansen pisze:
 > On 11/26/25 05:17, Zygmunt Krynicki wrote:
 >> Hello
 >>
 >> I'd like to propose splitting the textual permission "w", so that it
 >> does not imply AA_MAY_DELETE if the file is a device, fifo or socket.
 >> Profiles routinely grant "w" permission, but nobody in their right
 >> mind expects applications to delete such files.
 >>
 > this has been planned and is supported on the backend. We still need to
 > fix the frontend (long term todo that is coming)
 >
 > The question is how to deal with it in policy, there are basically two
 > ways, introduce finer permission to policy that can be used along side
 > the current.
 >
 > Or stick it behind an abi flag. The abi flag seems like a cleaner
 > solution to me

I think the ABI flag is far cleaner. The desire to allow this uncommon 
behavior is small. Porting policy should be straightforward.

How do you think this would look like in the profile text? ABI 5.1 that 
sets it by default? A flags=(...) field that one needs to use to opt 
into one or the other behavior (cond-allow-all or cond-allow-regular)?

 > Well the plan here was to actually expose fifo/socket/link/.. as a rule
 > conditional. Then you don't need a special MAY_DELETE, you just need
 > delete, and the correct conditional.
 >
 > For compatibility we map the permissions, and the conditional is just
 > defaulted to all types.
Ah, so is that what the Perms.Cond field is for?

What might the encoding look like? Each element class would get a 
distinct bit, so a rule like:

allow file type=regular /foo delete

Would grant AA_MAY_DELETE but also set, say, AA_COND_FILE_REG bit in the 
Perms.Cond field?

Then conversion from the current policy to n+1 policy would set all the 
bits to one?

 >> On the userspace side we might define new syntax such as:
 >>
 >> allow file PATH D,
 >>
 >> Where D implies delete special.
 >>
 > I was thinking more of using
 >
 >    allow file type=file /foo delete,
 >
 >    allow file type!=char /foo delete,

I like this approach much better, the type would then be a set of 
possible values, with every combination being encoded into the cond field.

Do we have any patches towards this? I think the kernel side is somewhat 
straightforward (assuming my hunch on how to use the cond field 
applies). The frontend is also rather simple. The backend I don't know 
because I spent only a fraction of time there, so far :)

Best regards
ZK

