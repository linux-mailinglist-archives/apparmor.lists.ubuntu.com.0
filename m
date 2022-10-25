Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2B760C670
	for <lists+apparmor@lfdr.de>; Tue, 25 Oct 2022 10:30:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1onFK9-00089A-Lz; Tue, 25 Oct 2022 08:30:13 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1onFK7-00088s-W2
 for apparmor@lists.ubuntu.com; Tue, 25 Oct 2022 08:30:11 +0000
Received: from [10.155.150.56] (unknown [213.29.99.90])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 696E942309; 
 Tue, 25 Oct 2022 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1666686611;
 bh=IpGCaXSnEHGcfdf+6ZgfW2n51gWKuMgsS/Acim3Bbvg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=n1GodjfMY4WSDK4Qn0sV5HYDDpbDkpNDF2830wlGR1/nTgVBdX2xVCvczjHzBJJpq
 ONGvbSQc+AtRjpWILms7rrOILs2L//VOv5xKvm1Zyt3OmBd/M3DtEaREJ9+YFIIzGx
 e4oTjOkwPqs6BaDnI5MFFz9wVV1YhDxVxwLolc04at0ywz5CPDFj2trhhv0Xm6L3I1
 tDpS2b2iBE963wP5JJZDNOCnvpPXx9ylnO2wGKkBVD5sfE9zWwtJSnXjFJoGhZJIP0
 s2UXcqQXhTBxwiesCXkRyOmO1W25/ATxnaBCFZmVokZFfJuZ8Pr53lClI8lLeFDBhS
 Pbg0GjSsFDP7A==
Message-ID: <bd085a0c-543a-c67d-b1a3-c9ee891893eb@canonical.com>
Date: Tue, 25 Oct 2022 01:30:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Christian Brauner <brauner@kernel.org>
References: <20221024111249.477648-1-brauner@kernel.org>
 <20221024111249.477648-5-brauner@kernel.org>
 <5ae36c94-18dd-2f7a-b5f4-3c2122415dc7@canonical.com>
 <20221025074427.jjfx4sa2kl7w5ua5@wittgenstein>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20221025074427.jjfx4sa2kl7w5ua5@wittgenstein>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH 4/8] apparmor: use type safe idmapping helpers
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
Cc: linux-fsdevel@vger.kernel.org, apparmor@lists.ubuntu.com,
 Seth Forshee <sforshee@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Christoph Hellwig <hch@lst.de>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 10/25/22 00:44, Christian Brauner wrote:
> On Tue, Oct 25, 2022 at 12:16:02AM -0700, John Johansen wrote:
>> On 10/24/22 04:12, Christian Brauner wrote:
>>> We already ported most parts and filesystems over for v6.0 to the new
>>> vfs{g,u}id_t type and associated helpers for v6.0. Convert the remaining
>>> places so we can remove all the old helpers.
>>> This is a non-functional change.
>>>
>>> Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
>>
>> Acked-by: John Johansen <john.johansen@canonical.com>
> 
> Would you mind if I carry this patch together with the other conversion
> patches in my tree? This would make the whole conversion a lot simpler
> because we're removing a bunch of old helpers at the end.

Not at all. I almost asked which tree you wanted it in, and then got
distracted and when I came back to it ...


