Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EBB7753FA
	for <lists+apparmor@lfdr.de>; Wed,  9 Aug 2023 09:19:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qTdTZ-0003pP-Dm; Wed, 09 Aug 2023 07:19:25 +0000
Received: from out-92.mta1.migadu.com ([95.215.58.92])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <martin.lau@linux.dev>) id 1qTcIG-0000Kd-Gw
 for apparmor@lists.ubuntu.com; Wed, 09 Aug 2023 06:03:40 +0000
Message-ID: <9a84e026-402d-b6d9-b6d1-57d91455da47@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691561020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZ6V615A2KqrskAOUp1MTFIPzrZmCi/maZKOac3W810=;
 b=HLvjH2ogbvNYgLBEabSq0L0ndbjsUYoxG9XBVixYUkq93imGD6SmYSCQGkkV3UE5OhTso+
 EuynVJbQyP4jlk0+SYzMeAGPHKZZGPYdtE87MUq04XqOcWW6VK/1DeTlun8ADzQ1RMsYo7
 mF0JvS5dGjKv44EceTfYn+WeOH08Kg0=
Date: Tue, 8 Aug 2023 23:03:30 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Geliang Tang <geliang.tang@suse.com>
References: <cover.1691125344.git.geliang.tang@suse.com>
 <15d7646940fcbb8477b1be1aa11a5d5485d10b48.1691125344.git.geliang.tang@suse.com>
 <8b706f66-2afa-b3d0-a13a-11f1ffb452fe@linux.dev>
 <20230807064044.GA11180@localhost.localdomain>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <20230807064044.GA11180@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Wed, 09 Aug 2023 07:19:24 +0000
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

On 8/6/23 11:40 PM, Geliang Tang wrote:
> On Fri, Aug 04, 2023 at 05:23:32PM -0700, Martin KaFai Lau wrote:
>> On 8/3/23 10:07 PM, Geliang Tang wrote:
>>> Use rand() to generate a random netns name instead of using the fixed
>>> name "mptcp_ns" for every test.
>>>
>>> By doing that, we can re-launch the test even if there was an issue
>>> removing the previous netns or if by accident, a netns with this generic
>>> name already existed on the system.
>>>
>>> Note that using a different name each will also help adding more
>>> subtests in future commits.
> 
> Hi Martin,
> 
> I tried to run mptcp tests simultaneously, and got "Cannot create
> namespace file "/var/run/netns/mptcp_ns": File exists" errors sometimes.
> So I add this patch to fix it.
> 
> It's easy to reproduce, just run this commands in multiple terminals:
>   > for i in `seq 1 100`; do sudo ./test_progs -t mptcp; done

Not only the "-t mptcp" test. Other tests in test_progs also don't support 
running parallel in multiple terminals. Does it really help to test the bpf part 
of the prog_tests/mptcp.c test by running like this? If it wants to exercise the 
other mptcp networking specific code like this, a separate mptcp test is needed 
outside of test_progs and it won't be run in the bpf CI.

If you agree, can you please avoid introducing unnecessary randomness to the 
test_progs where bpf CI and most users don't run in this way?

Also, please don't resend the patches too fast until the discussion is 
concluded. Please give reasonable time for others to reply.

I have a high level question. In LPC 2022 
(https://lpc.events/event/16/contributions/1354/), I recall there was idea in 
using bpf to make other mptcp decision/policy. Any thought and progress on this? 
This set which only uses bpf to change the protocol feels like an incomplete 
solution.


