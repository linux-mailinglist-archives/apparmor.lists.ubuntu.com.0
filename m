Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CA88A939991
	for <lists+apparmor@lfdr.de>; Tue, 23 Jul 2024 08:10:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sW8jF-0002qc-B4; Tue, 23 Jul 2024 06:10:29 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huawei.com>)
 id 1sV6Ps-0003q8-2l
 for apparmor@lists.ubuntu.com; Sat, 20 Jul 2024 09:30:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WR1S52DBzzdjX4;
 Sat, 20 Jul 2024 17:28:21 +0800 (CST)
Received: from kwepemd100012.china.huawei.com (unknown [7.221.188.214])
 by mail.maildlp.com (Postfix) with ESMTPS id 7244014037E;
 Sat, 20 Jul 2024 17:30:06 +0800 (CST)
Received: from [10.67.111.192] (10.67.111.192) by
 kwepemd100012.china.huawei.com (7.221.188.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 20 Jul 2024 17:30:05 +0800
Message-ID: <fdc0c2f0-a16d-4534-90d9-696000871044@huawei.com>
Date: Sat, 20 Jul 2024 17:30:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Paul Moore <paul@paul-moore.com>, Xu Kuohai <xukuohai@huaweicloud.com>,
 <bpf@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-security-module@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-integrity@vger.kernel.org>, <apparmor@lists.ubuntu.com>,
 <selinux@vger.kernel.org>
References: <20240711111908.3817636-7-xukuohai@huaweicloud.com>
 <6e79c031aa6c223df552726ac6537d44@paul-moore.com>
From: Xu Kuohai <xukuohai@huawei.com>
In-Reply-To: <6e79c031aa6c223df552726ac6537d44@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.192]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd100012.china.huawei.com (7.221.188.214)
Received-SPF: pass client-ip=45.249.212.188; envelope-from=xukuohai@huawei.com;
 helo=szxga02-in.huawei.com
X-Mailman-Approved-At: Tue, 23 Jul 2024 06:10:27 +0000
Subject: Re: [apparmor] [PATCH v4 6/20] lsm: Refactor return value of LSM
 hook getselfattr
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
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Anna Schumaker <anna@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Edward Cree <ecree.xilinx@gmail.com>,
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
>> hook getselfattr to 0 or a negative error code.
>>
>> Before:
>> - Hook getselfattr returns number of attributes found on success
>>    or a negative error code on failure.
>>
>> After:
>> - Hook getselfattr returns 0 on success or a negative error code
>>    on failure. An output parameter @nattr is introduced to hold
>>    the number of attributes found on success.
>>
>> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
>> ---
>>   include/linux/lsm_hook_defs.h |  2 +-
>>   include/linux/security.h      |  5 +++--
>>   security/apparmor/lsm.c       |  5 +++--
>>   security/lsm_syscalls.c       |  6 +++++-
>>   security/security.c           | 18 +++++++++++-------
>>   security/selinux/hooks.c      | 13 +++++++++----
>>   security/smack/smack_lsm.c    | 13 +++++++++----
>>   7 files changed, 41 insertions(+), 21 deletions(-)
> 
> The getselfattr hook is different from the majority of the other LSM
> hooks as getselfattr is used as part of lsm_get_self_attr(2) syscall and
> not by other subsystems within the kernel.  Let's leave it as-is for now
> as it is sufficiently special case that a deviation is okay.
>

Got it, thanks

> --
> paul-moore.com
> 
> 


