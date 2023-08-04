Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB276F91D
	for <lists+apparmor@lfdr.de>; Fri,  4 Aug 2023 06:45:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qRmgY-0007Tb-9O; Fri, 04 Aug 2023 04:45:10 +0000
Received: from out-95.mta1.migadu.com ([95.215.58.95])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <yonghong.song@linux.dev>) id 1qRmOb-00058t-Ua
 for apparmor@lists.ubuntu.com; Fri, 04 Aug 2023 04:26:37 +0000
Message-ID: <de5118d6-3dfe-9185-dbfa-c797f2821ce2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691123197; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m082I1X9tbhjiROnfjM2jHYq1ftKJQeenvc+niZ4Cz4=;
 b=r7HILlHe7qtM8mdPN1M9YxKznXH26/pkhJZWm8x4FppG3rvuS7a0kxExrHjfW44V6uoGm3
 WfzZ8o6wxbk087JzIhHSJkwcUWal+76Bn8tcBHo+WOIIrDgb9wwYTccBs/1mfdKzsy0qdK
 xQTi76W9uccn4yQOKHqHlmCiY7IOsJs=
Date: Thu, 3 Aug 2023 21:26:24 -0700
MIME-Version: 1.0
To: Geliang Tang <geliang.tang@suse.com>
References: <cover.1691069778.git.geliang.tang@suse.com>
 <92ee6be5a465601ff3a2df29b6a517086e87ca3c.1691069778.git.geliang.tang@suse.com>
 <1bf7f5cf-a944-a284-28af-83a6603542fb@linux.dev>
 <20230804022459.GA28296@localhost>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20230804022459.GA28296@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 04 Aug 2023 04:45:09 +0000
Subject: Re: [apparmor] [PATCH bpf-next v9 4/4] selftests/bpf: Add mptcpify
	test
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
Reply-To: yonghong.song@linux.dev
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
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On 8/3/23 7:24 PM, Geliang Tang wrote:
> Hi Yonghong,
> 
> On Thu, Aug 03, 2023 at 06:23:57PM -0700, Yonghong Song wrote:
>>
>>
>> On 8/3/23 6:41 AM, Geliang Tang wrote:
>>> Implement a new test program mptcpify: if the family is AF_INET or
>>> AF_INET6, the type is SOCK_STREAM, and the protocol ID is 0 or
>>> IPPROTO_TCP, set it to IPPROTO_MPTCP. It will be hooked in
>>> update_socket_protocol().
>>>
>>> Extend the MPTCP test base, add a selftest test_mptcpify() for the
>>> mptcpify case. Open and load the mptcpify test prog to mptcpify the
>>> TCP sockets dynamically, then use start_server() and connect_to_fd()
>>> to create a TCP socket, but actually what's created is an MPTCP
>>> socket, which can be verified through the outputs of 'ss' and 'nstat'
>>> commands.
>>>
>>> Reviewed-by: Matthieu Baerts <matthieu.baerts@tessares.net>
>>> Signed-off-by: Geliang Tang <geliang.tang@suse.com>
>>> ---
>>>    .../testing/selftests/bpf/prog_tests/mptcp.c  | 94 +++++++++++++++++++
>>>    tools/testing/selftests/bpf/progs/mptcpify.c  | 25 +++++
>>>    2 files changed, 119 insertions(+)
>>>    create mode 100644 tools/testing/selftests/bpf/progs/mptcpify.c
>>>
>>> diff --git a/tools/testing/selftests/bpf/prog_tests/mptcp.c b/tools/testing/selftests/bpf/prog_tests/mptcp.c
>>> index 4407bd5c9e9a..caab3aa6a162 100644
>>> --- a/tools/testing/selftests/bpf/prog_tests/mptcp.c
>>> +++ b/tools/testing/selftests/bpf/prog_tests/mptcp.c
>>> @@ -6,6 +6,7 @@
>>>    #include "cgroup_helpers.h"
>>>    #include "network_helpers.h"
>>>    #include "mptcp_sock.skel.h"
>>> +#include "mptcpify.skel.h"
>>>    char NS_TEST[32];
>>> @@ -195,8 +196,101 @@ static void test_base(void)
>>>    	close(cgroup_fd);
>>>    }
>>> +static void send_byte(int fd)
>>> +{
>>> +	char b = 0x55;
>>> +
>>> +	ASSERT_EQ(write(fd, &b, sizeof(b)), 1, "send single byte");
>>> +}
>>> +
>>> +static int verify_mptcpify(void)
>>> +{
>>> +	char cmd[256];
>>> +	int err = 0;
>>> +
>>> +	snprintf(cmd, sizeof(cmd),
>>> +		 "ip netns exec %s ss -tOni | grep -q '%s'",
>>> +		 NS_TEST, "tcp-ulp-mptcp");
>>
>> Could you show what is the expected output from the above command line
>>    ip netns exec %s ss -tOni
>> ?
>> This way, users can easily reason about the ss states based on tests.
> 
> There're too many items in the output of command 'ip netns exec %s ss -tOni':
> 
> '''
> State Recv-Q Send-Q Local Address:Port  Peer Address:Port Process
> ESTAB 0      0          127.0.0.1:42225    127.0.0.1:44180 cubic wscale:7,7 rto:201 rtt:0.034/0.017 ato:40 mss:16640 pmtu:65535 rcvmss:536 advmss:65483 cwnd:10 bytes_received:1 segs_out:1 segs_in:3 data_segs_in:1 send 39152941176bps lastsnd:7 lastrcv:7 lastack:7 pacing_rate 78305882352bps delivered:1 app_limited rcv_space:33280 rcv_ssthresh:33280 minrtt:0.034 snd_wnd:33280 tcp-ulp-mptcp flags:Mec token:0000(id:0)/3a1e0d3c(id:0) seq:c2802f11c5228db6 sfseq:1 ssnoff:49d3c135 maplen:1
> ESTAB 0      0          127.0.0.1:44180    127.0.0.1:42225 cubic wscale:7,7 rto:201 rtt:0.036/0.02 mss:16640 pmtu:65535 rcvmss:536 advmss:65483 cwnd:10 bytes_sent:1 bytes_acked:2 segs_out:3 segs_in:2 data_segs_out:1 send 36977777778bps lastsnd:7 lastrcv:7 lastack:7 pacing_rate 72200677960bps delivery_rate 8874666664bps delivered:2 rcv_space:33280 rcv_ssthresh:33280 minrtt:0.015 snd_wnd:33280 tcp-ulp-mptcp flags:Mmec token:0000(id:0)/39429ce(id:0) seq:e3ed00de37c805c sfseq:1 ssnoff:d4e4d561 maplen:0
> '''
> 
> We only care about this 'tcp-ulp-mptcp' item.
> 
> Show all output will confuse users. So we just pick and test the only
> item we care.

Thanks. Originally I thought at least we should put one line in
the comment which has 'tcp-ulp-mptcp' like

ESTAB 0      0          127.0.0.1:44180    127.0.0.1:42225 cubic 
wscale:7,7 rto:201 rtt:0.036/0.02 mss:16640 pmtu:65535 rcvmss:536 
advmss:65483 cwnd:10 bytes_sent:1 bytes_acked:2 segs_out:3 segs_in:2 
data_segs_out:1 send 36977777778bps lastsnd:7 lastrcv:7 lastack:7 
pacing_rate 72200677960bps delivery_rate 8874666664bps delivered:2 
rcv_space:33280 rcv_ssthresh:33280 minrtt:0.015 snd_wnd:33280 
tcp-ulp-mptcp flags:Mmec token:0000(id:0)/39429ce(id:0) 
seq:e3ed00de37c805c sfseq:1 ssnoff:d4e4d561 maplen:0

or simplified version

ESTAB 0      0          127.0.0.1:44180    127.0.0.1:42225 cubic
... tcp-ulp-mptcp flags:Mmec ...

But people familiar with 'ss' should be able to dump it and get
the above (maybe without tcp-ulp-mptcp) easily. So I am okay
with no additional comments.

> 
>>
>>> +	if (!ASSERT_OK(system(cmd), "No tcp-ulp-mptcp found!"))
>>> +		err++;
>>> +
>>> +	snprintf(cmd, sizeof(cmd),
>>> +		 "ip netns exec %s nstat -asz %s | awk '%s' | grep -q '%s'",
>>> +		 NS_TEST, "MPTcpExtMPCapableSYNACKRX",
>>> +		 "NR==1 {next} {print $2}", "1");
>>
>> The same thing here. Could you show the expected output with
>>     ip netns exec %s nstat -asz %s
>> ?
> 
> The output of 'ip netns exec %s nstat -asz %s' is:
> 
> '''
> #kernel
> MPTcpExtMPCapableSYNACKRX       1                  0.0
> '''
> 
> The same, we only check if it contains an MPTcpExtMPCapableSYNACKRX, not
> show the output.
> 
> -Geliang
> 
>>
>>> +	if (!ASSERT_OK(system(cmd), "No MPTcpExtMPCapableSYNACKRX found!"))
>>> +		err++;
>>> +
>>> +	return err;
>>> +}
>>> +
>> [...]

