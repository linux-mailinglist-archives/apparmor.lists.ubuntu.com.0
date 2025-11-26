Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983AC93936
	for <lists+apparmor@lfdr.de>; Sat, 29 Nov 2025 09:12:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vPG3g-0005XJ-NZ; Sat, 29 Nov 2025 08:11:56 +0000
Received: from mailtransmit05.runbox.com ([185.226.149.38])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <david.laight@runbox.com>)
 id 1vOGPV-0003pD-CG
 for apparmor@lists.ubuntu.com; Wed, 26 Nov 2025 14:22:21 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
 by mailtransmit05.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david.laight@runbox.com>)
 id 1vOGPU-009Woy-88; Wed, 26 Nov 2025 15:22:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com; 
 s=selector1;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
 bh=YwKsPVfX1KHUuq2yYyN+2sXinjTSQFZoVSP6b1bZh1s=; b=RwQJfWTlxSa4ByUNV2dybXnp4b
 52BSyPx2+lJ4/f1gtrOguQ14dgJs7VPHJ80abnw0+peZLzNPW1xQz/hDAwArxBHC3FNE40ZNL0vAG
 zEwDAmJBLCODPOxjec4QRRqhp9v7Dir5bqW85nPzxvTk//dJOrJGFAlaQpyCIvYEU3arJBqWN8pQ5
 vYcxmWKVj4PbLR47TIwDRkJxSiet6mlYZQnTZ0E3C8Qp0INvHmVdIqR0NY44UQxU40+eJkvdySs+y
 7ZQwSruUIhGUfKZblj4Xy7HWIZ6AVVRZ3AuArXRbWDHVMMrbJpQxm0Xw/csH+oBhSpqYYLbyoYTD2
 cSfRzW4Q==;
Received: from [10.9.9.72] (helo=submission01.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <david.laight@runbox.com>)
 id 1vOGPT-0001SZ-GA; Wed, 26 Nov 2025 15:22:19 +0100
Received: by submission01.runbox with esmtpsa [Authenticated ID (1493616)]
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256) (Exim 4.93)
 id 1vOGPD-00DeWx-Gw; Wed, 26 Nov 2025 15:22:03 +0100
Date: Wed, 26 Nov 2025 14:22:01 +0000
From: david laight <david.laight@runbox.com>
To: Helge Deller <deller@gmx.de>
Message-ID: <20251126142201.27e23076@pumpkin>
In-Reply-To: <4034ad19-8e09-440c-a042-a66a488c048b@gmx.de>
References: <20250531150822.135803-1-deller@kernel.org>
 <bc21bee14ca44077ae9323bfc251ad12390fa841.camel@physik.fu-berlin.de>
 <aRxT78fdN5v2Ajyl@p100>
 <90513f85cc8d060ebccd3972cc7709e4b6f13f34.camel@physik.fu-berlin.de>
 <be9c143d-1d5e-4c5b-9078-4a7804489258@gmx.de>
 <ba3d5651-fa68-4bb5-84aa-35576044e7b0@canonical.com>
 <aSXHCyH_rS-c5BgP@p100>
 <e88c32c2-fb18-4f3e-9ec2-a749695aaf0a@canonical.com>
 <c192140a-0575-41e9-8895-6c8257ce4682@gmx.de>
 <d35010b3-7d07-488c-b5a4-a13380d0ef7c@canonical.com>
 <20251126104444.29002552@pumpkin>
 <4034ad19-8e09-440c-a042-a66a488c048b@gmx.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.226.149.38;
 envelope-from=david.laight@runbox.com; helo=mailtransmit05.runbox.com
X-Mailman-Approved-At: Sat, 29 Nov 2025 08:11:54 +0000
Subject: Re: [apparmor] [PATCH 0/2] apparmor unaligned memory fixes
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
Cc: linux-parisc@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Helge Deller <deller@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, 26 Nov 2025 12:03:03 +0100
Helge Deller <deller@gmx.de> wrote:

> On 11/26/25 11:44, david laight wrote:
...   
> >> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
> >> index 26e82ba879d44..3dcc342337aca 100644
> >> --- a/security/apparmor/match.c
> >> +++ b/security/apparmor/match.c
> >> @@ -71,10 +71,10 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
> >>    				     u8, u8, byte_to_byte);  
> > 
> > Is that that just memcpy() ?  
> 
> No, it's memcpy() only on big-endian machines.

You've misread the quoting...
The 'data8' case that was only half there is a memcpy().

> On little-endian machines it converts from big-endian
> 16/32-bit ints to little-endian 16/32-bit ints.
> 
> But I see some potential for optimization here:
> a) on big-endian machines just use memcpy()

true

> b) on little-endian machines use memcpy() to copy from possibly-unaligned
>     memory to then known-to-be-aligned destination. Then use a loop with
>     be32_to_cpu() instead of get_unaligned_xx() as it's faster.

There is a function that does a loop byteswap of a buffer - no reason
to re-invent it.
But I doubt it is always (if ever) faster to do a copy and then byteswap.
The loop control and extra memory accesses kill performance.

Not that I've seen a fast get_unaligned() - I don't think gcc or clang
generate optimal code - For LE I think it is something like:
	low = *(addr & ~3);
	high = *((addr + 3) & ~3);
	shift = (addr & 3) * 8;
	value = low << shift | high >> (32 - shift);
Note that it is only 2 aligned memory reads - even for 64bit.

	David




