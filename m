Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 899B0717FC2
	for <lists+apparmor@lfdr.de>; Wed, 31 May 2023 14:21:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q4Kpm-0003BF-2x; Wed, 31 May 2023 12:21:46 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1q4Kpl-0003B7-3R
 for apparmor@lists.ubuntu.com; Wed, 31 May 2023 12:21:45 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 568DC41E12; 
 Wed, 31 May 2023 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1685535704;
 bh=2RCEej4K5XPwpOdjmGnUsEFbXkDnSBYDQGM0QVWDj1s=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=L5DSDLE/du/kQdCq1yNvvc3K4Gx6NmH+18ZvXkQ7sjp9P4es8/Q++47hs8diF+nVm
 wjk7Y8VH3VTf/gbt8XDwXbkyfKiJpZvL26u6vQWVIIzmdg9z96gCw+MxolgGQIVJVo
 Xw7O7DSXWwDF5W/wgNgxF0CfPBGk2UzvZnhooZukpTuPwuKBGqfDb9TWxbdUXkxjNq
 jTYMMDOmPyooRTUgQtnpZore5X+A0hgQyLi64VrUEv491y107FUwtZ4KduESsupr75
 ibLCUDtoTx3Sm41No/ec9i+cR2WuQMr41nsjlpTlOS/DdaCy6MHRfb7fMm/i/4jxYq
 01Tu6BfbuVfrg==
Message-ID: <1f35dbba-9344-75c5-e870-31bc3198dbe0@canonical.com>
Date: Wed, 31 May 2023 05:21:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
References: <20230511213441.never.401-kees@kernel.org>
 <7085879d-4d21-b90a-c08d-60450d1c7d38@canonical.com>
 <202305301555.102E1890@keescook>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <202305301555.102E1890@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: aa_buffer: Convert 1-element array
 to flexible array
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
Cc: Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 linux-security-module@vger.kernel.org, linux-hardening@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 5/30/23 15:55, Kees Cook wrote:
> On Thu, May 11, 2023 at 02:48:29PM -0700, John Johansen wrote:
>> On 5/11/23 14:34, Kees Cook wrote:
>>> In the ongoing effort to convert all fake flexible arrays to proper
>>> flexible arrays, replace aa_buffer's 1-element "buffer" member with a
>>> flexible array.
>>>
>>> Cc: John Johansen <john.johansen@canonical.com>
>>> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
>>> Cc: Paul Moore <paul@paul-moore.com>
>>> Cc: James Morris <jmorris@namei.org>
>>> Cc: "Serge E. Hallyn" <serge@hallyn.com>
>>> Cc: apparmor@lists.ubuntu.com
>>> Cc: linux-security-module@vger.kernel.org
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>
>> Acked-by: John Johansen <john.johansen@canonical.com>
>>
>> I have pulled this into my tree.
> 
> Just a quick ping: I haven't seen this show up in -next yet...
> 

oop, sorry looks like I didn't push, it should be fixed now


