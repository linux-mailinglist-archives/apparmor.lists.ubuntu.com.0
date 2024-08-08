Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AFD94CC10
	for <lists+apparmor@lfdr.de>; Fri,  9 Aug 2024 10:22:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1scKtV-0004jT-7w; Fri, 09 Aug 2024 08:22:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <kees@kernel.org>) id 1sc7VR-0005Wh-1r
 for apparmor@lists.ubuntu.com; Thu, 08 Aug 2024 18:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A1D5161524;
 Thu,  8 Aug 2024 18:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C71CC32782;
 Thu,  8 Aug 2024 18:04:55 +0000 (UTC)
Date: Thu, 8 Aug 2024 11:04:54 -0700
From: Kees Cook <kees@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <202408081104.8805C0BC7@keescook>
References: <20240808155931.1290349-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808155931.1290349-1-linux@roeck-us.net>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kees@kernel.org;
 helo=dfw.source.kernel.org
X-Mailman-Approved-At: Fri, 09 Aug 2024 08:22:39 +0000
Subject: Re: [apparmor] [PATCH] apparmor: fix policy_unpack_test on big
	endian systems
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
Cc: Paul Moore <paul@paul-moore.com>,
 Brendan Higgins <brendanhiggins@google.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Aug 08, 2024 at 08:59:31AM -0700, Guenter Roeck wrote:
> policy_unpack_test fails on big endian systems because data byte order
> is expected to be little endian but is generated in host byte order.
> This results in test failures such as:
> 
>  # policy_unpack_test_unpack_array_with_null_name: EXPECTATION FAILED at security/apparmor/policy_unpack_test.c:150
>     Expected array_size == (u16)16, but
>         array_size == 4096 (0x1000)
>         (u16)16 == 16 (0x10)
>     # policy_unpack_test_unpack_array_with_null_name: pass:0 fail:1 skip:0 total:1
>     not ok 3 policy_unpack_test_unpack_array_with_null_name
>     # policy_unpack_test_unpack_array_with_name: EXPECTATION FAILED at security/apparmor/policy_unpack_test.c:164
>     Expected array_size == (u16)16, but
>         array_size == 4096 (0x1000)
>         (u16)16 == 16 (0x10)
>     # policy_unpack_test_unpack_array_with_name: pass:0 fail:1 skip:0 total:1
> 
> Add the missing endianness conversions when generating test data.
> 
> Fixes: 4d944bcd4e73 ("apparmor: add AppArmor KUnit tests for policy unpack")
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

