Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB4778774
	for <lists+apparmor@lfdr.de>; Fri, 11 Aug 2023 08:28:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qULdW-0006Z8-86; Fri, 11 Aug 2023 06:28:38 +0000
Received: from out-110.mta1.migadu.com ([95.215.58.110])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <martin.lau@linux.dev>) id 1qUL5q-0004EF-EJ
 for apparmor@lists.ubuntu.com; Fri, 11 Aug 2023 05:53:50 +0000
Message-ID: <ffd1bb86-ed32-3301-346a-e369219841de@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691733229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a0vN514ycLDgfH8MPcX9gq+8dxj3gNQV5oVnf0li0cE=;
 b=JGmgvn6cT7iTucUb6YruBhmAOZ9kEYGTR86F5nxUdlIxB1sAjLg16WTdyyeLeQTmzqgKdH
 jGa16MemhcwHh+bjncETZ1dIBXUzxGMceG+QpeyqE8KeRwXCnrlguN+d04BUCLqtJo7fjP
 XWZKQ8rVNuEVS9ZwUFm0eyigLr88Kog=
Date: Thu, 10 Aug 2023 22:53:38 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Geliang Tang <geliang.tang@suse.com>
References: <cover.1691125344.git.geliang.tang@suse.com>
 <15d7646940fcbb8477b1be1aa11a5d5485d10b48.1691125344.git.geliang.tang@suse.com>
 <8b706f66-2afa-b3d0-a13a-11f1ffb452fe@linux.dev>
 <20230807064044.GA11180@localhost.localdomain>
 <9a84e026-402d-b6d9-b6d1-57d91455da47@linux.dev>
 <20230809081944.GA29707@bogon>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <20230809081944.GA29707@bogon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 11 Aug 2023 06:28:37 +0000
Subject: Re: [apparmor] [PATCH bpf-next v11 2/5] selftests/bpf: Use random
 netns name for mptcp
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
Cc: Alexei Starovoitov <ast@kernel.org>, James Morris <jmorris@namei.org>,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Mat Martineau <martineau@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Florent Revest <revest@chromium.org>, Simon Horman <horms@kernel.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 KP Singh <kpsingh@kernel.org>, Brendan Jackman <jackmanb@chromium.org>,
 Yonghong Song <yhs@fb.com>, Eric Paris <eparis@parisplace.org>,
 mptcp@lists.linux.dev, Hao Luo <haoluo@google.com>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 linux-security-module@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 Matthieu Baerts <matthieu.baerts@tessares.net>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 8/9/23 1:19 AM, Geliang Tang wrote:
> On Tue, Aug 08, 2023 at 11:03:30PM -0700, Martin KaFai Lau wrote:
>> On 8/6/23 11:40 PM, Geliang Tang wrote:
>>> On Fri, Aug 04, 2023 at 05:23:32PM -0700, Martin KaFai Lau wrote:
>>>> On 8/3/23 10:07 PM, Geliang Tang wrote:
>>>>> Use rand() to generate a random netns name instead of using the fixed
>>>>> name "mptcp_ns" for every test.
>>>>>
>>>>> By doing that, we can re-launch the test even if there was an issue
>>>>> removing the previous netns or if by accident, a netns with this generic
>>>>> name already existed on the system.
>>>>>
>>>>> Note that using a different name each will also help adding more
>>>>> subtests in future commits.
>>>
>>> Hi Martin,
>>>
>>> I tried to run mptcp tests simultaneously, and got "Cannot create
>>> namespace file "/var/run/netns/mptcp_ns": File exists" errors sometimes.
>>> So I add this patch to fix it.
>>>
>>> It's easy to reproduce, just run this commands in multiple terminals:
>>>    > for i in `seq 1 100`; do sudo ./test_progs -t mptcp; done
>>
>> Not only the "-t mptcp" test. Other tests in test_progs also don't support
>> running parallel in multiple terminals. Does it really help to test the bpf
>> part of the prog_tests/mptcp.c test by running like this? If it wants to
>> exercise the other mptcp networking specific code like this, a separate
>> mptcp test is needed outside of test_progs and it won't be run in the bpf
>> CI.
>>
>> If you agree, can you please avoid introducing unnecessary randomness to the
>> test_progs where bpf CI and most users don't run in this way?
> 
> Thanks Martin. Sure, I agree. Let's drop this patch.

Thanks you.

>> I have a high level question. In LPC 2022
>> (https://lpc.events/event/16/contributions/1354/), I recall there was idea
>> in using bpf to make other mptcp decision/policy. Any thought and progress
>> on this? This set which only uses bpf to change the protocol feels like an
>> incomplete solution.
> 
> We are implementing MPTCP packet scheduler using BPF. Patches aren't
> sent to BPF mail list yet, only temporarily on our mptcp repo[1].
> 
> Here are the patches:
> 
>   selftests/bpf: Add bpf_burst test
>   selftests/bpf: Add bpf_burst scheduler
>   bpf: Export more bpf_burst related functions
>   selftests/bpf: Add bpf_red test
>   selftests/bpf: Add bpf_red scheduler
>   selftests/bpf: Add bpf_rr test
>   selftests/bpf: Add bpf_rr scheduler
>   selftests/bpf: Add bpf_bkup test
>   selftests/bpf: Add bpf_bkup scheduler
>   selftests/bpf: Add bpf_first test
>   selftests/bpf: Add bpf_first scheduler
>   selftests/bpf: Add bpf scheduler test
>   selftests/bpf: add two mptcp netns helpers
>   selftests/bpf: use random netns name for mptcp
>   selftests/bpf: Add mptcp sched structs
>   bpf: Add bpf_mptcp_sched_kfunc_set
>   bpf: Add bpf_mptcp_sched_ops
> 
> If you could take a look at these patches in advance, I would greatly
> appreciate it. Any feedback is welcome.
> 
> [1]
> https://github.com/multipath-tcp/mptcp_net-next.git

Thanks for sharing. I did not go into the details. iiuc, the scheduler is 
specific to a namespace. Do you see if it is useful to have more finer control 
like depending on what IP address it is connected to? BPF policy is usually 
found more useful to have finer policy control than global or per-netns.

The same question goes for the fmod_ret here in this patch. The progs/mptcpify.c 
selftest is as good as upgrading all TCP connections. Is it your only use case 
and no need for finer selection?


