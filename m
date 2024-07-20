Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C09939992
	for <lists+apparmor@lfdr.de>; Tue, 23 Jul 2024 08:10:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sW8jE-0002qV-6D; Tue, 23 Jul 2024 06:10:28 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sV6Qx-0003x8-5i
 for apparmor@lists.ubuntu.com; Sat, 20 Jul 2024 09:31:19 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WR1WC2HhDz4f3jdV
 for <apparmor@lists.ubuntu.com>; Sat, 20 Jul 2024 17:31:03 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 84AD41A0F52
 for <apparmor@lists.ubuntu.com>; Sat, 20 Jul 2024 17:31:15 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
 by APP4 (Coremail) with SMTP id gCh0CgBHdzW5g5tmfxqfAg--.54511S4;
 Sat, 20 Jul 2024 17:31:15 +0800 (CST)
Message-ID: <6a47ad68-2c14-4061-92ae-a68b26a9e7bd@huaweicloud.com>
Date: Sat, 20 Jul 2024 17:31:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Paul Moore <paul@paul-moore.com>, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-integrity@vger.kernel.org,
 apparmor@lists.ubuntu.com, selinux@vger.kernel.org
References: <20240711111908.3817636-11-xukuohai@huaweicloud.com>
 <36836e7b94465fd11d3425166ade3f54@paul-moore.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <36836e7b94465fd11d3425166ade3f54@paul-moore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: gCh0CgBHdzW5g5tmfxqfAg--.54511S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tryDKw13uF18Wry5Zw4DXFb_yoW8Zr1fpF
 sxKana9rykCFyfurn3Z34293yYkr4fWF15Jry3Kr10kryFyF1UGr1DGw109rWDurWfAw4U
 tr47Xrn5GryDZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
 A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
 Ij6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
 Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Wr
 v_ZF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
 xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0Ki
 iDUUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
Received-SPF: pass client-ip=45.249.212.56;
 envelope-from=xukuohai@huaweicloud.com; helo=dggsgout12.his.huawei.com
X-Mailman-Approved-At: Tue, 23 Jul 2024 06:10:27 +0000
Subject: Re: [apparmor] [PATCH v4 10/20] lsm: Refactor return value of LSM
 hook audit_rule_match
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
Cc: Matt Bobrowski <mattbobrowski@google.com>,
 Shung-Hsi Yu <shung-hsi.yu@suse.com>, Alexei Starovoitov <ast@kernel.org>,
 James Morris <jmorris@namei.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Yonghong Song <yonghong.song@linux.dev>,
 Anna Schumaker <anna@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Edward Cree <ecree.xilinx@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E . Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 KP Singh <kpsingh@kernel.org>, Brendan Jackman <jackmanb@chromium.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, Hao Luo <haoluo@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Eduard Zingerman <eddyz87@gmail.com>,
 Khadija Kamran <kamrankhadijadj@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 7/19/2024 10:08 AM, Paul Moore wrote:
> On Jul 11, 2024 Xu Kuohai <xukuohai@huaweicloud.com> wrote:
>>
>> To be consistent with most LSM hooks, convert the return value of
>> hook audit_rule_match to 0 or a negative error code.
>>
>> Before:
>> - Hook audit_rule_match returns 1 if the rule matches, 0 if it not,
>>    and negative error code otherwise.
>>
>> After:
>> - Hook audit_rule_match returns 0 on success or a negative error
>>    code on failure. An output parameter @match is introduced to hold
>>    the match result on success.
>>
>> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
>> ---
>>   include/linux/lsm_hook_defs.h     |  3 +-
>>   security/apparmor/audit.c         | 22 ++++++-------
>>   security/apparmor/include/audit.h |  2 +-
>>   security/security.c               | 15 ++++++++-
>>   security/selinux/include/audit.h  |  8 +++--
>>   security/selinux/ss/services.c    | 54 +++++++++++++++++--------------
>>   security/smack/smack_lsm.c        | 19 +++++++----
>>   7 files changed, 75 insertions(+), 48 deletions(-)
> 
> This is another odd hook, and similar to some of the others in this
> patchset, I'm not sure how applicable this would be to a BPF-based
> LSM.  I suspect you could safely block this from a BPF LSM and no one
> would notice or be upset.
> 
> However, if we did want to keep this hook for a BPF LSM, I think it
> might be better to encode the "match" results in the return value, just
> sticking with a more conventional 0/errno approach.  What do you think
> about 0:found/ok, -ENOENT:missing/ok, -ERRNO:other/error?  Yes, some
> of the existing LSM audit_match code uses -ENOENT but looking quickly
> at those error conditions it seems that we could consider them
> equivalent to a "missing" or "failed match" result and use -ENOENT for
> both.  If you're really not happy with that overloading, we could use
> something like -ENOMSG:missing/ok instead.
> 
> Thoughts?
>

I think we could just block it and see what happens.

> --
> paul-moore.com
> 


