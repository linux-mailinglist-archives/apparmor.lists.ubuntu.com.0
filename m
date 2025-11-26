Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D4C8C44D
	for <lists+apparmor@lfdr.de>; Wed, 26 Nov 2025 23:58:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vOOSf-0005nY-UC; Wed, 26 Nov 2025 22:58:09 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vOOSe-0005nR-6N
 for apparmor@lists.ubuntu.com; Wed, 26 Nov 2025 22:58:08 +0000
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 15FEA3F1CC
 for <apparmor@lists.ubuntu.com>; Wed, 26 Nov 2025 22:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1764197887;
 bh=zk/4TWscelIA8xrZ67/zM0lNT/rHcU1T664MZE8+fZg=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=abhcPwrxvDFr86+GR8PtLgklNdsjaftYler40Qd4VNjx0o09pNBw3hyDwQOu4iedU
 ZLfe+9R+50UKScblIoTCxMg1iCtXnhn8cjv+cxnkyCsFigHeebxTLqi/1Tp8Skk1zT
 r8ZPFVmNQb6e2oqsW+y+wX/F4lvealsHVBecgITulYJpT404q1RJwMJg10sPpfVzxE
 xXX7cChblcpKF54sZOcgE0w/bRqLLjE2SsighO75+47ehyTsRDZ4V9ChuER2Ordesu
 66zqU1GlqJ3WfDN0t+CubXhagkWLJ7WXxIABERQWIVB3UOTwMXKvzRa+wjuk0tSn4s
 cKR/kbsBSxbeLSG7IXMQb274Ixl/hbf5KU7gthdRYAu5BtHzd3wMum8Z/xFdyaafX5
 c+NklVPYbujTRi4aTtB16XLlMO/qlmvTnC0QITMl/O3az2fr+iQlWtpcKMO/8wu6Z7
 F3oIjhIxYISkdU7N9oqQ44Sb1aWw3LE143hFRx0JUKxNGKU98TWRcQxqEw4M5fQxer
 zGTyFdDqTPN501kF8H61RxM2CC2XOqZs/SJ3iI1awej3gZYhZFORB4PuKyGI1RX+uD
 1xkjC6cmADwHwDM3BQ021jTQjDdDl+VCXmETY9K3EEfZp1Y7NQWmGtDBIU7u2zBV/D
 bUmLq7B02zQLumg1lcKCH2qk=
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7c240728e2aso324939b3a.3
 for <apparmor@lists.ubuntu.com>; Wed, 26 Nov 2025 14:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764197886; x=1764802686;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zk/4TWscelIA8xrZ67/zM0lNT/rHcU1T664MZE8+fZg=;
 b=DOsMOjKnVjhnVCmtUL97mxrbzPbalUnnMFXIKs/Y7z4BZlh3att1WOy+Y+xbAC8hC0
 5OhwGgwYigIOYg0wtMAoS21T2fF3SzhLXThJwKNNpOOa0BTLpCDGHvv2cQD/KCQmi7T5
 p0xDM+ZpWLuTwo4SMe2TNp20zD8bdPrxuiGmirplClz9mYM9wmoftn4oMDOaLdo2w5n+
 N3XTz0/estgPr03JsH4m0YdSjhxGih4NecvIoCXhE66MXTh4+8/RdSMH6Pt/EOKs6Gav
 BFp7hcrrm7ePcTHAY86ec7yAGwtvyVeMxr0FpblZQMIFIvmyw0h4zjvQ/aFnx9v1dyL7
 Xj1g==
X-Gm-Message-State: AOJu0YzoEdeNIug6TKThzyFmHk8rNl21LdR8IFfCGwc6RJsWuM0eYfu9
 EhlMlipjAdT1WxL3WsjyaL807549xYds4TAj9iUN3i82VKvFCs017pzqTSPb5jXvlOdjGYTAs0z
 IuKfysDpNNECwAcXgjSzzc7mxQlAjE3UlaGQB2VbUJ6liI0tPexmMnXjnKSH3Bre19/cfgGSaQq
 MGQVU0RP5Jdm3T
X-Gm-Gg: ASbGncuWI1qaavAnJFGnC6k/ribgnssiwq3jHro7zXHTTNciZ0UYWy5oRiWNBqJcbPi
 zNGmKZYl3wk6X0v8YlJzX0dXaLvCkhcrkqFpdAohypTqrA5pQAkAu3yNxTfJAQs/7CzM9k+4WiH
 i/BCmal0dT7u6saDAhAX/pBkwFfSRDCJkSxhiOhf8depDwGDMMgnnrXVnfick9w9Giq2n7AedEf
 Gx63yhEjhOLvJ3ltoL1/NqPlbeGI7RyLvg1pR1GI/K+I1EmYN5ChvUFutFZorAuR3Uo7qD1awv6
 r6+XxBj/VcJccJvWrYJbNVXZT30jOSD4ssN6JtkREyYmuZU32e7mfy9Kq1aqE0lqDPbnUKTx7CI
 Kb9z9WV65wJ1YJtQlhho6IZpg
X-Received: by 2002:a05:6a20:748d:b0:361:4ca3:e17d with SMTP id
 adf61e73a8af0-3614eb0e251mr23291055637.13.1764197885779; 
 Wed, 26 Nov 2025 14:58:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELfxXjGnvmWdo+Ead+udpiextfXH0h+2t1ugE7t1IhWv8HyDA9I+gupeWv2hk01kN0uWL8VA==
X-Received: by 2002:a05:6a20:748d:b0:361:4ca3:e17d with SMTP id
 adf61e73a8af0-3614eb0e251mr23291035637.13.1764197885330; 
 Wed, 26 Nov 2025 14:58:05 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7c3f174ba7dsm22364990b3a.64.2025.11.26.14.58.04
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 14:58:04 -0800 (PST)
Message-ID: <d5fccb40-62a9-43d9-89d7-eb1c4c78c43b@canonical.com>
Date: Wed, 26 Nov 2025 14:58:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <7c1c83ac-c8d3-490b-a6b5-c718b1dbc016@zygoon.pl>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <7c1c83ac-c8d3-490b-a6b5-c718b1dbc016@zygoon.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/26/25 02:04, Zygmunt Krynicki wrote:
> Hello
> 
> As a part of investigation into issue affecting mmap with MAP_HUGETLB [1], I was thinking if huge pages should have a dedicated mediation class and be handled similarly to how mqueue was recently added.
> 

yes we want to split it off, it could potentially go into its own class or potentially share a class with a few other memory operations that we want to handle better.

The trade-off being whether we want to handle them in a separate feature abi or not. If we put them in the same class then they need to move together


> In the kernel, `aa_file_perm` function could special case hugetlbfs so that mmap would not end up using odd (possibly disconnected) paths for accessing it.
> 
> I'd be happy to pick up this work if there is consensus on the general direction. I would need some help with reviews and guidance along the way.
> 

I am not opposed to free work, it should likely use the newer task based pattern/operations as a starting point. I need to get those posted. Though its probably not going to happen this week.



> Best regards
> ZK
> 
> [1] https://gitlab.com/apparmor/apparmor/-/issues/571
> 
.

