Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D152EC8C8C7
	for <lists+apparmor@lfdr.de>; Thu, 27 Nov 2025 02:29:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vOQor-0005Bx-FY; Thu, 27 Nov 2025 01:29:13 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vOQop-0005Ai-CV
 for apparmor@lists.ubuntu.com; Thu, 27 Nov 2025 01:29:11 +0000
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D184A3FB78
 for <apparmor@lists.ubuntu.com>; Thu, 27 Nov 2025 01:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1764206949;
 bh=U4M7mgDxA4tUcoc6dcnV+qz9/p8kEtqTGsq9raDibsE=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=DT2boofCpxuwEe8G3KnaPwfo07FWR5L8akYE7dZSuxg6SwIcWKhWUtql4CXD5B0Nc
 kxad8fKtUqyCqWYHKC9v6Ipl5nxQxd3OkGZb+fEidil8Tcd4XP+P9yt/xwsF8ftYCR
 8N6Y+iWKWkeZ4cVUTH18XabtlVKgy+hc9I96qhC6uUGE9sW/8+LIEPzdhwsl36aegf
 7xkcG+x8EisUZbNAS00JNfoWS1krF+C4HsspH0ZPvzcMfVUCSwK9S6XeGAWN+YPNAT
 OkDAuFQhZSWIf/7JKDpDP1f2a0vIEUxNiORbDrTMceubrGa4HBOOnCD3yWDSJEs8+e
 n92GrO3teY7EcwbraY6oz81JA1J0HF8Wjk5jj4gOCoOaVpHjnfhKRfze2KWnlSH1Ay
 NQlSJ+3VjypW+OVK84eqRp/OjruB2F/An3YAZ/ZCie73JuI/mQgkDbgQFhRW5FETgh
 NczkhjYq9PVlgjC72l0zTLlR9XdJxVlISIt071fvZ3vtuL59jPSY6h88cgS4OnGxjh
 8537CJD5+xOqAcGEPj4MrFgi+/EAsXIQ4GkkXI9kCecLDsXpo1djWS2jHm+QhDrYoC
 n9pu0gt3i2uH6aGkTjZ6Icy01DGYJ/fLZ1ckcuVGSumfxZ1gn6WtSNTschq5yQfcNo
 RcZVniHGPpi50/ZOeXNCTShA=
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-341616a6fb7so351882a91.0
 for <apparmor@lists.ubuntu.com>; Wed, 26 Nov 2025 17:29:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764206948; x=1764811748;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U4M7mgDxA4tUcoc6dcnV+qz9/p8kEtqTGsq9raDibsE=;
 b=oJeF+Zkn6WFEPlczmzClUPfNpkuwRkKY2lEHTR6AA2yEr8LyIyGYNRmkONvolGrUzp
 B5tio1sQAQV6RtKMhV2xaIC/22/OzcYwztifkQzvaG50LgEKzhcqaGqKF3Qv2Z01wdQ7
 qSx2syXjptg7YmP1v/CBxf3UQz17W97x6MggncrW2QhruhFnOTv4CoC015VoMPuILfqR
 oHi5Xe57Am709O+3Yo63kXqVQUwNbigma69rdXHJvV+zJn2g8bCZxEk99n4vREpzflsm
 rM75ygtlG3l1dVogNFTOjye70Np6MfYOHEMeny0Bn6iCGPtRmH2gc/JMuQlBWALDdzSO
 Pjpw==
X-Gm-Message-State: AOJu0YwFUa1VRJzd8TJWqRIX0F1xRfDCal12F8GUB5foN5qEoWdjBpDt
 ORc1nNN6oyLNg+NqegEunRR1shpHTJGuP4ZXSEFl0GO7eBEvu4fxPESH0NZX03/41uUmMM5hHr1
 7BKt8SQZNXNa6Yv5TJBX7j7bDemh6uOaPvxlcSYCgfmBstK8GI161jwDx8w3Y3jCqLBOzY0ZL/s
 HSyJz+I0cvPSd9
X-Gm-Gg: ASbGncsW8S6K31LtRmfKwBKxyLRVLAvNoXVm0RxvQl0CLwaOpNWBcPib1C4UMOLELli
 bT9FPwHtxUiUIUaBD8TreLT0unlMfjRGi8Q8h0HbkA/HldJfoKzEOnZhaxbDTxn3sE86RQDsris
 9WUHmnTMxAROV5pTTUmi48GcMLy9kxZyKaqejFhLH+a8MQczKtHhduhi67UFStCUz/rP6+fiVaD
 G60Yz8Wi89R0C9SB9BdCp4UCSlHMKrg35wEpaya7pA2Hd4umglprLRAonqKdSPhf1QxevkoALQa
 E6X2aPE18TL9dRZSsZdlKSHsAOapLClGdzNC8mYDJYyTDVe856ITM34MquhmVUFzWem/vMuLGNm
 6w1iLa0BGUnLHRtzntR4g2wiA
X-Received: by 2002:a17:903:2b0f:b0:298:46a9:df01 with SMTP id
 d9443c01a7336-29b6c3bf292mr244469405ad.3.1764206948439; 
 Wed, 26 Nov 2025 17:29:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIOGtmH0KuxSGiYG35kZrxiQaOypPxWcxQDXKfC0wSDullkyK9dj/BsSoJ5fciAFwUzGJDdg==
X-Received: by 2002:a17:903:2b0f:b0:298:46a9:df01 with SMTP id
 d9443c01a7336-29b6c3bf292mr244469245ad.3.1764206947954; 
 Wed, 26 Nov 2025 17:29:07 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-29b5b274d39sm209977675ad.77.2025.11.26.17.29.07
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 17:29:07 -0800 (PST)
Message-ID: <363f581c-d820-48db-8a5d-7d399e741fb0@canonical.com>
Date: Wed, 26 Nov 2025 17:29:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <9bbb2148-6dd4-40e5-a1dd-8afe59e68cad@zygoon.pl>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <9bbb2148-6dd4-40e5-a1dd-8afe59e68cad@zygoon.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/26/25 05:17, Zygmunt Krynicki wrote:
> Hello
> 
> I'd like to propose splitting the textual permission "w", so that it does not imply AA_MAY_DELETE if the file is a device, fifo or socket. Profiles routinely grant "w" permission, but nobody in their right mind expects applications to delete such files.
> 
this has been planned and is supported on the backend. We still need to fix the frontend (long term todo that is coming)

The question is how to deal with it in policy, there are basically two ways, introduce finer permission to policy that can be used along side the current.

Or stick it behind an abi flag. The abi flag seems like a cleaner solution to me

> Both userspace and kernel can already kind-of express this. The only question is how to do that in a way that doesn't force a painful profile transition. I think we need a new permission bit.
> 

we have that is the backend. An update to the front end, that moves the mapping for old perms to the backend is coming, its something I very much would have liked to have had landed already

> My suggestion would be to add a AA_MAY_DELETE_SPECIAL permission. Starting with some future ABI deleting devices, fifos and sockets would check AA_MAY_DELETE_SPECIAL. Compatibility layer in the kernel would then continue to grant AA_MAY_DELETE_SPECIAL for older ABIs.
> 

Well the plan here was to actually expose fifo/socket/link/.. as a rule conditional. Then you don't need a special MAY_DELETE, you just need delete, and the correct conditional.

For compatibility we map the permissions, and the conditional is just defaulted to all types.

> On the userspace side we might define new syntax such as:
> 
> allow file PATH D,
> 
> Where D implies delete special.
> 
I was thinking more of using

   allow file type=file /foo delete,

   allow file type!=char /foo delete,

> I'm happy to take a stab at implementing it. The only thing I'm not sure is how to name the new feature "delete_special".
> 
> I'm grateful for your thoughts
> 
> Best regards
> ZK
> 


