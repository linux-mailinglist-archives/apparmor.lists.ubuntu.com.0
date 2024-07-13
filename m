Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F334C93049E
	for <lists+apparmor@lfdr.de>; Sat, 13 Jul 2024 10:59:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sSYb1-0008I0-J3; Sat, 13 Jul 2024 08:59:11 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sSXme-0004c6-14
 for apparmor@lists.ubuntu.com; Sat, 13 Jul 2024 08:07:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WLgzK3fpCz4f3jYp
 for <apparmor@lists.ubuntu.com>; Sat, 13 Jul 2024 16:06:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
 by mail.maildlp.com (Postfix) with ESMTP id 4C15F1A0189
 for <apparmor@lists.ubuntu.com>; Sat, 13 Jul 2024 16:07:01 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
 by APP3 (Coremail) with SMTP id _Ch0CgAnNF6jNZJmxmuLBw--.4019S2;
 Sat, 13 Jul 2024 16:07:00 +0800 (CST)
Message-ID: <4165f531-9d8a-4378-812f-41baa5665097@huaweicloud.com>
Date: Sat, 13 Jul 2024 16:06:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Serge Hallyn <serge@hallyn.com>, Xu Kuohai <xukuohai@huaweicloud.com>
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
 <20240711111908.3817636-3-xukuohai@huaweicloud.com>
 <3b4cc9c0-2645-4654-aa48-7944d91ee3f4@hallyn.com>
Content-Language: en-US
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <3b4cc9c0-2645-4654-aa48-7944d91ee3f4@hallyn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgAnNF6jNZJmxmuLBw--.4019S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1rtF1rJryUWFyxCF45ZFb_yoW8Gw18pF
 yakayY9w1kC34kua97KF17X3yvyrW3GrW5tFnYyrWjvF9xAr10kr4Sy3y7Kr1xWr109w1Y
 vr1vv3WfC3WUX37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoj
 jgUUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
Received-SPF: pass client-ip=45.249.212.51;
 envelope-from=xukuohai@huaweicloud.com; helo=dggsgout11.his.huawei.com
X-Mailman-Approved-At: Sat, 13 Jul 2024 08:59:08 +0000
Subject: Re: [apparmor] [PATCH bpf-next v4 02/20] lsm: Refactor return value
 of LSM hook inode_need_killpriv
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
Cc: Matt Bobrowski <mattbobrowski@google.com>, linux-kselftest@vger.kernel.org,
 Shung-Hsi Yu <shung-hsi.yu@suse.com>, Alexei Starovoitov <ast@kernel.org>,
 James Morris <jmorris@namei.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Anna Schumaker <anna@kernel.org>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Edward Cree <ecree.xilinx@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, KP Singh <kpsingh@kernel.org>,
 Brendan Jackman <jackmanb@chromium.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 linux-integrity@vger.kernel.org, Hao Luo <haoluo@google.com>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Eduard Zingerman <eddyz87@gmail.com>,
 linux-security-module@vger.kernel.org,
 Khadija Kamran <kamrankhadijadj@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 7/11/2024 10:15 PM, Serge Hallyn wrote:
> Jul 11, 2024 06:14:09 Xu Kuohai <xukuohai@huaweicloud.com>:
> 
>> From: Xu Kuohai <xukuohai@huawei.com>
>>
>> To be consistent with most LSM hooks, convert the return value of
>> hook inode_need_killpriv to 0 or a negative error code.
>>
>> Before:
>> - Both hook inode_need_killpriv and func security_inode_need_killpriv
>>    return > 0 if security_inode_killpriv is required, 0 if not, and < 0
>>    to abort the operation.
>>
>> After:
>> - Both hook inode_need_killpriv and func security_inode_need_killpriv
>>    return 0 on success and a negative error code on failure.
>>    On success, hook inode_need_killpriv sets output param @need to true
>>    if security_inode_killpriv is required, and false if not. When @need
>>    is true, func security_inode_need_killpriv sets ATTR_KILL_PRIV flag
>>    in @attr; when false, it clears the flag.
>>    On failure, @need and @attr remains unchanged.
>>
>> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> 
> It looks ok - though unnecessary (I'm assuming a later patch works better with this) - , but I'd be more comfortable if it was documented that any callers of the need_killpriv hook must set need to false before calling. Or if the hooks set need to false at start.
> 
>

I believe this is the only patch in the set that modifies 'inode_need_killpriv'.
I'll add an explanation for the initial value of '@need'.
Thanks.


